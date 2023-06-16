Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCD3733A16
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 21:41:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DC9582B;
	Fri, 16 Jun 2023 21:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DC9582B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686944462;
	bh=mV2If3g3g1sD8x2ovsOZFkuQJbEiGz0YBbK1cdKj1cc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hYNdR6KWZqPuY6WnUYcTANN/tX1oC6fWj+TmnSXZFTNEm8NBAumWQDvhjIrbDgsAd
	 IG0p7fsdhhCwB3ZbyMN25AMe9K950NfDbNgn469wDDUXi2Dk5/2CTYfitrKH45jiWx
	 8uAOK1NB6aw6J1QiXCGVtSaAUP2tcKHWBiVQL5qY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2AA3F80093; Fri, 16 Jun 2023 21:40:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF7B0F80132;
	Fri, 16 Jun 2023 21:40:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79491F80149; Fri, 16 Jun 2023 21:39:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2933F80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 21:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2933F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=OPO/Vrh0
Received: from mail.denx.de (unknown
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B130084768;
	Fri, 16 Jun 2023 21:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1686944394;
	bh=0RQez8bsWaI2cbhoDwT9GmoKUDE5BbUBQBiG8huLJoM=;
	h=Date:From:To:Cc:Subject:From;
	b=OPO/Vrh0U9VsEOC5BeRlowQUZJ7aUr/39riC/nBA1UY9IsICoL9dAB2phZhhiM7zm
	 0EjFVAchGEsKDrmII6RVpD5cXbGpeph4lAiZSXy7Xks8Cxy0ONdQqguYj81fqJkAd9
	 ClXfMyLITlKuCxJnDGXQHGZCCMBRK78eapJB275BH5ZJcm8tUZp7nMseeJlonfNAXg
	 uPApLfCXLhhPOHLasYMiN7MceApmrPEXQp31PWq8aMFdTa4QLjg6rkUcINqeV/XOix
	 BMQLKqlz3f12kQd/qjTQkfMUknKUvs0JEVpOaT+tMoW3VqLCVOPK/O1GU1FmTtkYJC
	 29c0OuXFlO0+Q==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 16 Jun 2023 16:39:54 -0300
From: Fabio Estevam <festevam@denx.de>
To: shengjiu.wang@gmail.com, broonie@kernel.org, daniel.baluta@gmail.com
Cc: alsa-devel@alsa-project.org
Subject: imx8mn: Trying to get EASRC to work
Message-ID: <87d11267e2d93256e071ee7d86775cc7@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Message-ID-Hash: TCARN4WHXJU6CY7AH3O3DCWSWU55KXXQ
X-Message-ID-Hash: TCARN4WHXJU6CY7AH3O3DCWSWU55KXXQ
X-MailFrom: festevam@denx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCARN4WHXJU6CY7AH3O3DCWSWU55KXXQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I am working on an imx8mn-based board with an ES9080 codec and I am 
trying to get
EASCR to work. (The ES9080 driver is not upstreamed yet).

Audio playback works fine via simple-audio-card and here are my changes 
to
get EASRC to work:


-	sound-ess {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "ess-audio";
-		simple-audio-card,format = "left_j";
-		simple-audio-card,frame-master = <&s2cpu>;
-		simple-audio-card,bitclock-master = <&s2cpu>;
-
-		s2cpu: simple-audio-card,cpu {
-			sound-dai = <&sai2>;
-			dai-tdm-slot-num = <8>;
-			dai-tdm-slot-width = <32>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&es9080>;
-		};
+	sound-es9080 {
+		compatible = "fsl,imx-audio-es9080";
+		model = "es9080-with-easrc";
+		audio-cpu = <&sai2>;
+		audio-codec = <&es9080>;
+		audio-asrc = <&easrc>;
  	};
  };

diff --git a/sound/soc/fsl/fsl-asoc-card.c 
b/sound/soc/fsl/fsl-asoc-card.c
index 8d14b5593658..27b8f2c0cd65 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -624,6 +624,14 @@ static int fsl_asoc_card_probe(struct 
platform_device *pdev)
  		codec_dai_name = "sgtl5000";
  		priv->codec_priv.mclk_id = SGTL5000_SYSCLK;
  		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-es9080")) {
+		codec_dai_name = "es9080";
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
+		priv->dai_link[1].dpcm_capture = 0;
+		priv->dai_link[2].dpcm_capture = 0;
+		priv->cpu_priv.slot_width = 32;
+		priv->card.dapm_routes = audio_map_tx;
+		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
  	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic32x4")) 
{
  		codec_dai_name = "tlv320aic32x4-hifi";
  		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
@@ -902,6 +910,7 @@ static const struct of_device_id 
fsl_asoc_card_dt_ids[] = {
  	{ .compatible = "fsl,imx-audio-tlv320aic32x4", },
  	{ .compatible = "fsl,imx-audio-tlv320aic31xx", },
  	{ .compatible = "fsl,imx-audio-sgtl5000", },
+	{ .compatible = "fsl,imx-audio-es9080", },
  	{ .compatible = "fsl,imx-audio-wm8962", },
  	{ .compatible = "fsl,imx-audio-wm8960", },
  	{ .compatible = "fsl,imx-audio-mqs", },

The es9080-with-easrc card is registered, but after running 
'speaker-test' no
audio output is present.

Is there a way to use the EASRC driver with the simple-audio-card 
without
touching fsl-asoc-card.c? That would be preferable.

Would you have any suggestions as to what may be missing to get EASRC to 
work?

Thanks,

Fabio Estevam
