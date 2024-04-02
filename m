Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57189AF12
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:20:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1D052BA8;
	Sun,  7 Apr 2024 09:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1D052BA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474413;
	bh=Q7kTk1pOg/NlcWm8yefb0S3wgoRZDW+UapJioBKAJ5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AG8ShWJvLRe+8RBzVdEDR1pKurnS2zkhz2VtMuWfjhh7dMMszdS9S3IrKL8B2bF7s
	 cLUy5iwW5aWp2M8DakQCRA7tDP2EZTmN1a5ssbDkDCoQxS1Tw3kT13XQ5geSE+ix7X
	 Mg4Y1lwTRACVG8rZpjc1ceXT/nLahGRHP33Oj1KQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E207EF806F2; Sun,  7 Apr 2024 09:17:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75291F8070C;
	Sun,  7 Apr 2024 09:17:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37D8AF8057A; Tue,  2 Apr 2024 09:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CF1AF8057C
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CF1AF8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gtBR9Cj3
Received: by mail.gandi.net (Postfix) with ESMTPA id D98B9FF808;
	Tue,  2 Apr 2024 07:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvbHeeS3hR6xxZxnOS4/gZMDTkNCkYqtTO8AzSbFnAU=;
	b=gtBR9Cj3w6T5MCM3MKOtnT3CCueCifNr1cENC9icgWs52nSs4LVhR0OHZbiOqBiTAWqE0X
	8hMe13a/H9NdlMaJx/iin+LxcIb1N5ZzrVahD5tOrMUrv9TbuADHy12cwoeehL8FtA0pXN
	jmYsvmHrdza7l3M0Dirs2ePt2JtvCNWtFJByV1lfhc8hZh7yeSWnxTr8OnIBCPDG6MGRv9
	3dCiUaeqLIMhBzFo8WY3AzHHVJlR6k6SuG105KTrGoERp7Sx+5eRnnnLbekudOSUuxvAvv
	C6QFsyeJ1YPgRBRUHCLMqD3oIhDwJTfkoU6iNFoS4OzvBU80jMlFJmTJKdxF5g==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH v2 09/13] ASoC: ti: davinci-i2s: Enable unexpected frame
 pulses detection
Date: Tue,  2 Apr 2024 09:12:09 +0200
Message-ID: <20240402071213.11671-10-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 23EMYXHACKBAOSUDPN3B7VWDTGRMOX2Z
X-Message-ID-Hash: 23EMYXHACKBAOSUDPN3B7VWDTGRMOX2Z
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23EMYXHACKBAOSUDPN3B7VWDTGRMOX2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

McBSP can generate a SYNCERR when unexpected frame pulses are
detected. The driver always disables this feature and ignore the
unexpected frame pulses.

Enable the generation of SYNCERR by the McBSP. Unexpected frame
pulses are not ignored anymore.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index e51f05cda941..82a0dfa07cec 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -441,8 +441,10 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
 	struct snd_interval *i = NULL;
 	int mcbsp_word_length, master;
-	unsigned int rcr, xcr, clk_div, freq, framesize;
+	unsigned int clk_div, freq, framesize;
 	unsigned int srgr = 0;
+	unsigned int rcr = 0;
+	unsigned int xcr = 0;
 	u32 spcr;
 	snd_pcm_format_t fmt;
 	unsigned element_cnt = 1;
@@ -539,8 +541,6 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SRGR_REG, srgr);
 
-	rcr = DAVINCI_MCBSP_RCR_RFIG;
-	xcr = DAVINCI_MCBSP_XCR_XFIG;
 	if (dev->mode == MOD_DSP_B) {
 		rcr |= DAVINCI_MCBSP_RCR_RDATDLY(0);
 		xcr |= DAVINCI_MCBSP_XCR_XDATDLY(0);
-- 
2.44.0

