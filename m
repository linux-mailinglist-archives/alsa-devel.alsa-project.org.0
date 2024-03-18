Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60287EFC5
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 19:31:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1602D238B;
	Mon, 18 Mar 2024 19:31:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1602D238B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710786675;
	bh=DjQM9uZLj7fLkV+FxcS/esMiszJE7yWdKJW1GjX2voA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=m5Z9cuVpPlQzZtLgxJBIy2zKw0QArc8qQVN8Ail04D63yIdzfac/z3XNpuUpQ1ZIo
	 g6NC4F+Oyc7g4AF/Q6fA9jVMjy5AvH21NEpwl82wX8e9QO/Jp+GLsdvsHqhrkfuw3I
	 oFE4eaok+aSvZQjQA8muonHDnmCPe8YAJ+L2bcsM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2FCAF805AF; Mon, 18 Mar 2024 19:30:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 424F5F8057F;
	Mon, 18 Mar 2024 19:30:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BC94F804E7; Mon, 18 Mar 2024 19:30:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBF6BF8010B
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 19:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF6BF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=KZHf/5Hs
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5a480985625so2053258eaf.0
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Mar 2024 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710786622; x=1711391422;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bx6+Clm215KDMXgRL6qGOhGouTAzAkIrhJCqbLmQFoQ=;
        b=KZHf/5HsubfxYw5tsNjN6XhNOak36dgJbvGTUunk56KKG/R8oJHlF1AKrE+eMacdCy
         /FiikrCCWNslGTGjobs6so8iC3WDKL+HKZqupZyswUw+2Cca8cBtXP7UHWhfWUJM9NOy
         ENOTCf71vVC5J09tkHu5q0xMIRux4JRHPWIrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786622; x=1711391422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bx6+Clm215KDMXgRL6qGOhGouTAzAkIrhJCqbLmQFoQ=;
        b=ATNGL5DhKHd94zFKAWFLWxJkM+jhXjkG8nUxhOF7YTtpmPX1BVewpISf08X99BOm8t
         K0tH5ThjCCexYp6M/3v9yIl9Upys3/1gb3S9/Ozc/at374YJq4bQY53Patram856+Ciw
         7LNl7Wu5wQBF653z7Km+RGDQDeK0Y57o5C3VpK0vKKr2ccCEp+s1uku0Rh6ndcIu3Ai4
         zV9UaPBDnxOx9+OAGe4x0NZ+FlzSIUgo9B1L6KaJdYt89u4neqNbj09PojpHtTe6F4Kv
         9/ks0CMhutCP1v53MH80k9NuoGEBung38DBifkRmj5bII1ynObeOfdGbkNKJRQYsTame
         ejLA==
X-Gm-Message-State: AOJu0Yws/7K4MNZQRRZ8FYvaiC4K14z6KLci8qF6PzXpffu+Wi6FYBm2
	MKauqx2Dur2q7dbO3C+b2jrGpR8AsAS1YoeUwDZ2uZJTs4JqhNIEicv1i/GYLvRo3eAoqc2x8Q=
	=
X-Google-Smtp-Source: 
 AGHT+IErJ/xRW7g7bK7mjoC/S9jIyOCdlmPELHx6SbC2qbW2DcgABdt7TF6/lkNRCftJOabdtLbxMg==
X-Received: by 2002:a05:6358:b250:b0:17c:297f:df62 with SMTP id
 lo16-20020a056358b25000b0017c297fdf62mr11734509rwc.16.1710786621165;
        Mon, 18 Mar 2024 11:30:21 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:aeb9:10c8:d95b:b0f9])
        by smtp.gmail.com with UTF8SMTPSA id
 z8-20020a63c048000000b005c6e8fa9f24sm7643777pgi.49.2024.03.18.11.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 11:30:20 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Wojciech Macek <wmacek@google.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rander Wang <rander.wang@intel.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: SOF: Remove libraries from topology lookups
Date: Mon, 18 Mar 2024 11:29:54 -0700
Message-ID: <20240318183004.3976923-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NCW2VZ4OOHSD47OTTWZ6EL3EKSDORK6I
X-Message-ID-Hash: NCW2VZ4OOHSD47OTTWZ6EL3EKSDORK6I
X-MailFrom: cujomalainey@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCW2VZ4OOHSD47OTTWZ6EL3EKSDORK6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Default firmware shipped in open source are not licensed for 3P
libraries, therefore topologies should not reference them.

If a OS wants to use 3P (that they have licensed) then they should use
the appropriate topology override mechanisms.

Fixes: 8a7d5d85ed2161 ("ASoC: SOF: mediatek: mt8195: Add devicetree support to select topologies")
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Cc: Wojciech Macek <wmacek@google.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 8ee7ee246344c..f143baf75af60 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -573,7 +573,7 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 static struct snd_sof_of_mach sof_mt8195_machs[] = {
 	{
 		.compatible = "google,tomato",
-		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682-dts.tplg"
+		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682.tplg"
 	}, {
 		.compatible = "mediatek,mt8195",
 		.sof_tplg_filename = "sof-mt8195.tplg"
-- 
2.44.0.291.gc1ea87d7ee-goog

