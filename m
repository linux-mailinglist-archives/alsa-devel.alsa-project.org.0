Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E16DEB10
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 07:28:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF1D9EC7;
	Wed, 12 Apr 2023 07:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF1D9EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681277312;
	bh=eKPMZ3eh1kwDuFELvQo8w68rSa6BbhN8qBrEaqJbYko=;
	h=Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=S6WBveDcSYsDwyjTK+jxXbFBc1JtAj4pNuq0P2enZ/VqK9gQ7Woptxihesnp2U+42
	 wOIHH3bNMpVFjuiBkRxaa0osfC5yzSvi25ueLfoWlRhYxTNoPfXtNdDKxadf31T7eL
	 mT9gtcXOiEUUDBVmy2J9EyYtxQJ6W1k2Wl70Gw9w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B873F80548;
	Wed, 12 Apr 2023 07:26:16 +0200 (CEST)
Date: Tue, 11 Apr 2023 06:04:31 +0530
Subject: [PATCH] ASoC: mediatek: common: Fix refcount leak in
 parse_dai_link_info
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>, Guenter Roeck <groeck@chromium.org>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Wed, 12 Apr 2023 05:22:43 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYZQZN5T5CNGAFYN7HDRF6HZX2SHRRM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168127717464.26.8163797399161129916@mailman-core.alsa-project.org>
From: Aashish Sharma via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Aashish Sharma <shraash@google.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Aashish Sharma <shraash@google.com>, kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DE52F8032B; Tue, 11 Apr 2023 02:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 443E2F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 02:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 443E2F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=DwHddE9I
Received: by mail-yb1-xb49.google.com with SMTP id
 p129-20020a254287000000b00aedd4305ff2so7207102yba.13
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 17:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681173285;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VV8PXIioY+lpB4ukX6X0D5BOfhtAOO5OAgem+yfBPzU=;
        b=DwHddE9ICDDWjQSM54RArNBxPbpLZ/n6gkwcx9BCskxL2erXnG3TX1P1/lmatz71h8
         e94TF8KXKDvpyL4+PvFL49b96iK4zjO7oAD6oKVkKVTugVr/ROAVKTo6DG3IYXBNNIwd
         KZwGLSxNmgNkFDNODIwPNAG9WGleBFL4Lg8DGM0uPXamolTJCKG1FeSxuwZta+gWzIs8
         GEieLq6UzVi9zxIKuSHQrSuVRgg613rdEsagFCHxGrV1UU9im61ClVqEDPa9FRAv74zx
         VtHQ3ba/QpGls+Yf8jJ9cbGHYt0miiDAZ36gBf5/V7GI1LYNdafonbUf2M4vYCef0HDE
         FW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681173285;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VV8PXIioY+lpB4ukX6X0D5BOfhtAOO5OAgem+yfBPzU=;
        b=ZW6wneIyQmiNiCWjHZywMQ8/Otu+SEoKp/gI0oySR/Ct11BEloNlNe/QXf4QXfSZFf
         RZ3vnkrMLXOhrDZfLmluyDJp+dw9BiCEim8Y+eJkUqiRDFemKULchwZREYY5ML18y0Xv
         xBH94fSRNUx/1jUb6OVIvpMgojEzV5CPLjQCTzuThk2RGO5vh0rzJLzoY66C+RrI3z9N
         eiNgckMeiOySpOQh4AoDN1LqCu6xcv4p/7YlSL+RLwqMDr+XSsx2SJBAbMTbrlO95fvm
         YhdslR3qZdf8fjs+zEL7/IXwXshiHMRuV/SLVLa/qHBt9bOUFBaX3oL2o20YE9sRStgR
         OZIQ==
X-Gm-Message-State: AAQBX9dnAuteJOlFaVWmvRJLESKNugPpiafA68dIWiyJZheyyhO+Gb23
	vgLlD6xlF9bocozcxhbonGfLzZVbm/xJ
X-Google-Smtp-Source: 
 AKy350ZOwDyxZ5zmnvjOtmK+m8d2Zb+sInKjo5gza1IG8xreF6QccHiFCV8qDL7zjDXDQLZcFmYPSNKGp1ua
X-Received: from ezekiel.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:108e])
 (user=shraash job=sendgmr) by 2002:a81:b284:0:b0:544:94fe:4244 with SMTP id
 q126-20020a81b284000000b0054494fe4244mr636814ywh.10.1681173284695; Mon, 10
 Apr 2023 17:34:44 -0700 (PDT)
Date: Tue, 11 Apr 2023 06:04:31 +0530
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <20230411003431.4048700-1-shraash@google.com>
Subject: [PATCH] ASoC: mediatek: common: Fix refcount leak in
 parse_dai_link_info
From: Aashish Sharma <shraash@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3JKs0ZAcKCnUlakTTlaZhhZeX.VhfTelT-WXoXeTelT-ikhcXVm.hkZ@flex--shraash.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AYZQZN5T5CNGAFYN7HDRF6HZX2SHRRM7
X-Message-ID-Hash: AYZQZN5T5CNGAFYN7HDRF6HZX2SHRRM7
X-Mailman-Approved-At: Wed, 12 Apr 2023 05:22:43 +0000
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Aashish Sharma <shraash@google.com>, kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYZQZN5T5CNGAFYN7HDRF6HZX2SHRRM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add missing of_node_put()s before the returns to balance
of_node_get()s and of_node_put()s, which may get unbalanced
in case the for loop 'for_each_available_child_of_node' returns
early.

Fixes: 4302187d955f ("ASoC: mediatek: common: add soundcard driver common code")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Link: https://lore.kernel.org/r/202304090504.2K8L6soj-lkp@intel.com/
Signed-off-by: Aashish Sharma <shraash@google.com>
---
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 7c55c2cb1f21..738093451ccb 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -47,20 +47,26 @@ int parse_dai_link_info(struct snd_soc_card *card)
 	/* Loop over all the dai link sub nodes */
 	for_each_available_child_of_node(dev->of_node, sub_node) {
 		if (of_property_read_string(sub_node, "link-name",
-					    &dai_link_name))
+					    &dai_link_name)) {
+			of_node_put(sub_node);
 			return -EINVAL;
+		}
 
 		for_each_card_prelinks(card, i, dai_link) {
 			if (!strcmp(dai_link_name, dai_link->name))
 				break;
 		}
 
-		if (i >= card->num_links)
+		if (i >= card->num_links) {
+			of_node_put(sub_node);
 			return -EINVAL;
+		}
 
 		ret = set_card_codec_info(card, sub_node, dai_link);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(sub_node);
 			return ret;
+		}
 	}
 
 	return 0;
-- 
2.40.0.577.gac1e443424-goog

