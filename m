Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A98514A6F1F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 11:48:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 434F41729;
	Wed,  2 Feb 2022 11:47:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 434F41729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643798897;
	bh=+F/XNS+K3S528YZbHbCnXca5nTvtAo2m71gR5n4E0e4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BKj4Q9qVtSItsqn8YUpBrxETnj3Is8u0TaeFWQ+I3wQ1g2FeMRSYmCG0Y1tX1IMhX
	 oQSfo5KbKTlTXA/EY3eulQ3O/nEh1KoZ9glAsNIerUCZ3bnZRG+f6vXj2NZkxFMTOC
	 RS2IbpM+3pNb0nKC1/Nm8RSIjB4kLp25ulASexrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB19F804B1;
	Wed,  2 Feb 2022 11:47:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E123F804B0; Wed,  2 Feb 2022 11:47:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 320CCF80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 11:47:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 320CCF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="A+1T9IZi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2127iHo8020164;
 Wed, 2 Feb 2022 04:46:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=QZujztJNVMQKudlA9ZJsexPklJafPYc0tS1BkuFwdos=;
 b=A+1T9IZiZSFWHzppa9OW/eend6cilr9bmL+Q/k5Q7fGUzTNYOE2EFv8EFhIFI+QyIkRF
 pnAkJCWWSQ07LJdUUMs7F2K10sfo6/gHZDIjewwy3VGK920qLGQ1Gmy8n8MZ0GbYU3hQ
 jRZJ+vB/GQ8cVZMzdp9TeZyJGiICi7E6VFfo+6uAkCbrVU4vnZoqHLj0wHhBGAKiy46K
 U9XR8auWTCSePwOLS4xyhm6nIYwUpbYPZVx61IsGBZdwsl4Ml1gjvJyXobODw/hOQ0kR
 Id1wMGme4pi8Ykg2aezdO+qkfaTCnSompg3OG3SzRH9ncMva5bOc2hG0MjFzVCzV340d 0w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dxh0ntr5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 02 Feb 2022 04:46:58 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Feb
 2022 10:46:57 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 2 Feb 2022 10:46:57 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5901311D7;
 Wed,  2 Feb 2022 10:46:57 +0000 (UTC)
Date: Wed, 2 Feb 2022 10:46:57 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
Message-ID: <20220202104657.GA18506@ediswmail.ad.cirrus.com>
References: <20220201150113.880330-1-martin.kepplinger@puri.sm>
 <20220202095301.GZ18506@ediswmail.ad.cirrus.com>
 <3542af028b622ec1513810b014c35a94b82a94c0.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3542af028b622ec1513810b014c35a94b82a94c0.camel@puri.sm>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: xO-lM_W9N2IA0QU97JxBWHCPTdBKjocY
X-Proofpoint-ORIG-GUID: xO-lM_W9N2IA0QU97JxBWHCPTdBKjocY
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel@puri.sm, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org, geert@glider.be,
 daniel.baluta@nxp.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Feb 02, 2022 at 11:17:34AM +0100, Martin Kepplinger wrote:
> Am Mittwoch, dem 02.02.2022 um 09:53 +0000 schrieb Charles Keepax:
> > On Tue, Feb 01, 2022 at 04:01:13PM +0100, Martin Kepplinger wrote:
> Do you have a code example from a different codec that has roughly what
> is missing here? (the sound subsystem is new to me)

Full disclosure this is complete untested, but it should be
pretty close. Let me know if it does the trick and I will send a
proper patch to the list. I do have a Librem 5 in a draw
somewhere so can pull that out if we get really stuck, but that
might have to wait until the weekend :-).

I don't know if you guys are using the analogue bypass paths
around the digital core on the chip. I think those will still
work with the mics set to digital, so I have left the routes as
is, but that might require some checking at some point.

Thanks,
Charles


diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index a5584ba962dcf..2c41d31956aa8 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2049,6 +2049,13 @@ static SOC_ENUM_SINGLE_DECL(hpoutl_enum,
 static const struct snd_kcontrol_new hpoutl_mux =
 	SOC_DAPM_ENUM("HPOUTL Mux", hpoutl_enum);
 
+static const char * const input_mode_text[] = { "Analog", "Digital" };
+
+static SOC_ENUM_SINGLE_VIRT_DECL(input_mode_enum, input_mode_text);
+
+static const struct snd_kcontrol_new input_mode_mux =
+	SOC_DAPM_ENUM("Input Mode", input_mode_enum);
+
 static const struct snd_kcontrol_new inpgal[] = {
 SOC_DAPM_SINGLE("IN1L Switch", WM8962_LEFT_INPUT_PGA_CONTROL, 3, 1, 0),
 SOC_DAPM_SINGLE("IN2L Switch", WM8962_LEFT_INPUT_PGA_CONTROL, 2, 1, 0),
@@ -2147,6 +2154,9 @@ SND_SOC_DAPM_MIXER("MIXINR", WM8962_PWR_MGMT_1, 4, 0,
 
 SND_SOC_DAPM_AIF_IN("DMIC_ENA", NULL, 0, WM8962_PWR_MGMT_1, 10, 0),
 
+SND_SOC_DAPM_MUX("Input Mode L", SND_SOC_NOPM, 0, 0, &input_mode_mux),
+SND_SOC_DAPM_MUX("Input Mode R", SND_SOC_NOPM, 0, 0, &input_mode_mux),
+
 SND_SOC_DAPM_ADC("ADCL", "Capture", WM8962_PWR_MGMT_1, 3, 0),
 SND_SOC_DAPM_ADC("ADCR", "Capture", WM8962_PWR_MGMT_1, 2, 0),
 
@@ -2226,16 +2236,19 @@ static const struct snd_soc_dapm_route wm8962_intercon[] = {
 
 	{ "DMIC_ENA", NULL, "DMICDAT" },
 
+	{ "Input Mode L", "Analog", "MIXINL" },
+	{ "Input Mode L", "Digital", "DMIC_ENA" },
+	{ "Input Mode R", "Analog", "MIXINR" },
+	{ "Input Mode R", "Digital", "DMIC_ENA" },
+
 	{ "ADCL", NULL, "SYSCLK" },
 	{ "ADCL", NULL, "TOCLK" },
-	{ "ADCL", NULL, "MIXINL" },
-	{ "ADCL", NULL, "DMIC_ENA" },
+	{ "ADCL", NULL, "Input Mode L" },
 	{ "ADCL", NULL, "DSP2" },
 
 	{ "ADCR", NULL, "SYSCLK" },
 	{ "ADCR", NULL, "TOCLK" },
-	{ "ADCR", NULL, "MIXINR" },
-	{ "ADCR", NULL, "DMIC_ENA" },
+	{ "ADCR", NULL, "Input Mode R" },
 	{ "ADCR", NULL, "DSP2" },
 
 	{ "STL", "Left", "ADCL" },
-- 
2.11.0

