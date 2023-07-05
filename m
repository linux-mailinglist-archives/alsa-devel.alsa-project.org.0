Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6B7486B1
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 16:44:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1AF07F1;
	Wed,  5 Jul 2023 16:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1AF07F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688568276;
	bh=bdDLZCglkynD91RnEE0P/JUB/wG+iACKpfOzXwB+k8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DLByY0Cf4DLQuNlvWkWxwQmEBAEtAdkxTghurSEodXE2vymg3M2zQ1egKcoArwHl8
	 ssn9oMEqxPkOs5/APiFWrKCuQF8MftEbcBy6TleKzbFLJJvKNyOjWYKpQIkhNogG0z
	 PXvtfxqAmJgDntC3i22m07wYwmU1ONLI1Sf0uvyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AB71F805C2; Wed,  5 Jul 2023 16:41:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6639CF805B2;
	Wed,  5 Jul 2023 16:41:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58396F80125; Wed,  5 Jul 2023 14:35:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DE1AF80132
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 14:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DE1AF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NvZ0l2dY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7D4261582;
	Wed,  5 Jul 2023 12:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0BAC433CD;
	Wed,  5 Jul 2023 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688560389;
	bh=bdDLZCglkynD91RnEE0P/JUB/wG+iACKpfOzXwB+k8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NvZ0l2dYbJQL3lj93Xn3I8gdvEuHf+3CGUMkAUgBGfLBeRyaOtnuNVkeKKv9DvaIc
	 j+brMH46O0LAES+l7K3gpLdqox4aDDo4y1DifGhEJCMENB2X6hhPv6qQE2rc9XCcEP
	 9AtNEn7q6L1rzIciuH8Mk9ucxXUmVfjved2Frd6hgxVw+z3NXuL+Pdb9/VT6ygpbig
	 hlBlW+6cu+Yl8fijCgNNbXarVmWYStGzlo96dixoMP4LtohVD/1coVAAeJhHEVtLkU
	 ycGkzcabxy+3WKmfISCfZZR9ztCBEt8hf34WZeM488kXWw3FRsMH6nnfOqg1yENlgZ
	 SqFS0sRMTDB9g==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qH1hK-00084G-1V;
	Wed, 05 Jul 2023 14:33:30 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 5/8] ASoC: codecs: wcd934x: fix resource leaks on component
 remove
Date: Wed,  5 Jul 2023 14:30:15 +0200
Message-Id: <20230705123018.30903-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230705123018.30903-1-johan+linaro@kernel.org>
References: <20230705123018.30903-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VGHZJRPJXP534F2UTW73RUNOJN5YUXHJ
X-Message-ID-Hash: VGHZJRPJXP534F2UTW73RUNOJN5YUXHJ
X-Mailman-Approved-At: Wed, 05 Jul 2023 14:41:38 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make sure to release allocated MBHC resources also on component remove.

This is specifically needed to allow probe deferrals of the sound card
which otherwise fails when reprobing the codec component.

Fixes: 9fb9b1690f0b ("ASoC: codecs: wcd934x: add mbhc support")
Cc: stable@vger.kernel.org      # 5.14
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index a17cd75b969b..1b6e376f3833 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -3044,6 +3044,17 @@ static int wcd934x_mbhc_init(struct snd_soc_component *component)
 
 	return 0;
 }
+
+static void wcd934x_mbhc_deinit(struct snd_soc_component *component)
+{
+	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(component);
+
+	if (!wcd->mbhc)
+		return;
+
+	wcd_mbhc_deinit(wcd->mbhc);
+}
+
 static int wcd934x_comp_probe(struct snd_soc_component *component)
 {
 	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
@@ -3077,6 +3088,7 @@ static void wcd934x_comp_remove(struct snd_soc_component *comp)
 {
 	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
 
+	wcd934x_mbhc_deinit(comp);
 	wcd_clsh_ctrl_free(wcd->clsh_ctrl);
 }
 
-- 
2.39.3

