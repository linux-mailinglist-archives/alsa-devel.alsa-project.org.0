Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FDB746B43
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 09:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B4E120C;
	Tue,  4 Jul 2023 09:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B4E120C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688457387;
	bh=wqRKdTIIvcIRgQhdE2exeuKMhi8/e83nTPBKzQ9VBG8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RCf029573E1o4F5RScbPFlB0NdNa4fxXv4NgZEjPPOYO+qKGVJScFIK6zWVJrpCsW
	 mt6oTqn6Te9E3FJA1YgIhv6PCOITJRP+hAhaJC4EYdBFyZmMUDmUCbYEWFoWCkhUet
	 Z3a6llhUC+4eFUnaIn37NbBVcBvQLO/xwQBDX+kA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B260F80125; Tue,  4 Jul 2023 09:55:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 980DAF80124;
	Tue,  4 Jul 2023 09:55:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED16BF80125; Mon,  3 Jul 2023 14:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FA76F80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 14:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FA76F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mGGdgyAX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5057760F1A;
	Mon,  3 Jul 2023 12:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B92C433C7;
	Mon,  3 Jul 2023 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688388466;
	bh=wqRKdTIIvcIRgQhdE2exeuKMhi8/e83nTPBKzQ9VBG8=;
	h=From:To:Cc:Subject:Date:From;
	b=mGGdgyAXTjLYjoSQfuS7HITGVpEs7wAFB5k05oGPaV1K+avohTFm4Oot4NCOm8Bpv
	 nIIWTwN5odcI4wFn/7TdoMfK+Os9RfaqmLgLDsbz3zVMYgz+S2/09yrYCPpug+Btgv
	 GhKsquiqUaSI3QCd4qb2bNJdIiZnyRYoYz8NJkKNdPcK12//YoeO4OFKOkgGqfYb01
	 6u2uxcI/raYutWJVjLE6pGO1hZuT0Sci3k/nYVhtjzOnKI36sAFGIvSSx2n1PioYhA
	 xOOxn2tNAX662tvUXdPmWz7K6nMO+Q9AUJGpInzNKw2zyWw4UPBmDmtx+yb7ayMn+1
	 By4ozxNKX1+YA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qGIyH-00033d-26;
	Mon, 03 Jul 2023 14:48:01 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: codecs: wcd938x: fix missing mbhc init error handling
Date: Mon,  3 Jul 2023 14:47:01 +0200
Message-Id: <20230703124701.11734-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6TNM2TUM2EZIZVPXQ7M3FNDNW42MMWZK
X-Message-ID-Hash: 6TNM2TUM2EZIZVPXQ7M3FNDNW42MMWZK
X-Mailman-Approved-At: Tue, 04 Jul 2023 07:55:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6TNM2TUM2EZIZVPXQ7M3FNDNW42MMWZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

MBHC initialisation can fail so add the missing error handling to avoid
dereferencing an error pointer when later configuring the jack:

    Unable to handle kernel paging request at virtual address fffffffffffffff8

    pc : wcd_mbhc_start+0x28/0x380 [snd_soc_wcd_mbhc]
    lr : wcd938x_codec_set_jack+0x28/0x48 [snd_soc_wcd938x]

    Call trace:
     wcd_mbhc_start+0x28/0x380 [snd_soc_wcd_mbhc]
     wcd938x_codec_set_jack+0x28/0x48 [snd_soc_wcd938x]
     snd_soc_component_set_jack+0x28/0x8c [snd_soc_core]
     qcom_snd_wcd_jack_setup+0x7c/0x19c [snd_soc_qcom_common]
     sc8280xp_snd_init+0x20/0x2c [snd_soc_sc8280xp]
     snd_soc_link_init+0x28/0x90 [snd_soc_core]
     snd_soc_bind_card+0x628/0xbfc [snd_soc_core]
     snd_soc_register_card+0xec/0x104 [snd_soc_core]
     devm_snd_soc_register_card+0x4c/0xa4 [snd_soc_core]
     sc8280xp_platform_probe+0xf0/0x108 [snd_soc_sc8280xp]

Fixes: bcee7ed09b8e ("ASoC: codecs: wcd938x: add Multi Button Headset Control support")
Cc: stable@vger.kernel.org      # 5.15
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 1595df2bf0e9..faa15a5ed2c8 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -2626,6 +2626,8 @@ static int wcd938x_mbhc_init(struct snd_soc_component *component)
 						     WCD938X_IRQ_HPHR_OCP_INT);
 
 	wcd938x->wcd_mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
+	if (IS_ERR(wcd938x->wcd_mbhc))
+		return PTR_ERR(wcd938x->wcd_mbhc);
 
 	snd_soc_add_component_controls(component, impedance_detect_controls,
 				       ARRAY_SIZE(impedance_detect_controls));
-- 
2.39.3

