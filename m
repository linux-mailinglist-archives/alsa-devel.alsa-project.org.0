Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A05384B691D
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 11:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 392F217D5;
	Tue, 15 Feb 2022 11:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 392F217D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644920476;
	bh=BlYxv/Py2yqvYQ0eP1sTP82cbAC9Ex6+2ENxoRAi/6c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hWwiSCoz0oZaZnMfedsDYSFJhHkXTFVjXM5O81xdwS7lysHDVuWpApBeImZTX1mjx
	 s0R23lqG0z4zQ2XquvJSJqm0IePx7BfrOLp5+1JMCpT0N0omptTgJ6met3Xt/T3h8P
	 +QKbXtpNUS+tz4icXkMDG+pPEDP1p9Zjw1zYPp0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9773CF80159;
	Tue, 15 Feb 2022 11:20:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30DF9F80132; Tue, 15 Feb 2022 11:20:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B41DDF800D8
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 11:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B41DDF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nImBJz6C"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21F4sEpm013367;
 Tue, 15 Feb 2022 04:19:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=8fAS/qwthOFYlhLPfWFAMNJsEpja5QQzt3iqRbtLLSM=;
 b=nImBJz6CBCHj/lAg7ili+ViW2LF90Gg4xSqifFNkNmd9gdvsC06w2dg1MczsHhp6rp26
 PVT4D6kZK62U6bfsyEg35J5fmvFE/UbFSLl5RvzxTgk7E1ZrO2i/rhNvJDe4KjDjZgSt
 NSYNG3pGnsOu7otNvRrFMb2F4jDYPHN68jP2PV3uBiEdOGPGvNlBJv8vdvb09iZpgzxW
 j/B8K05kP2SJFrwMLSePlRfXYEFc8qI7zs4ib7IzxGgtxn2sVMqX1Y45WNUMk19AuGtt
 6vyVICj7PkdDKDJucWyuXsDH2qdhrzE44JE+6GW6y/B9TATgBnJimQr/E2HDH4G3sJsl Zg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3e7qq196fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Feb 2022 04:19:52 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 10:19:50 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 15 Feb 2022 10:19:50 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6FA9511C7;
 Tue, 15 Feb 2022 10:19:50 +0000 (UTC)
Date: Tue, 15 Feb 2022 10:19:50 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ASoC: cs4265: Fix the duplicated control name
Message-ID: <20220215101950.GB38351@ediswmail.ad.cirrus.com>
References: <20220214195716.1096265-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220214195716.1096265-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: qqQXBOJqXftx8HPz-S1J6yMp9knpRInh
X-Proofpoint-GUID: qqQXBOJqXftx8HPz-S1J6yMp9knpRInh
X-Proofpoint-Spam-Reason: safe
Cc: Fabio Estevam <festevam@denx.de>, alsa-devel@alsa-project.org,
 broonie@kernel.org
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

On Mon, Feb 14, 2022 at 04:57:16PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> Currently, the following error messages are seen during boot:
> 
> asoc-simple-card sound: control 2:0:0:SPDIF Switch:0 is already present
> cs4265 1-004f: ASoC: failed to add widget SPDIF dapm kcontrol SPDIF Switch: -16
> 
> Quoting Mark Brown:
> 
> "The driver is just plain buggy, it defines both a regular SPIDF Switch
> control and a SND_SOC_DAPM_SWITCH() called SPDIF both of which will
> create an identically named control, it can never have loaded without
> error.  One or both of those has to be renamed."
> 
> Rename it from "SPDIF Switch" to "SPDIF" to avoid the name confict.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  sound/soc/codecs/cs4265.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
> index c338c9f6cf91..8891e9275cba 100644
> --- a/sound/soc/codecs/cs4265.c
> +++ b/sound/soc/codecs/cs4265.c
> @@ -150,7 +150,7 @@ static const struct snd_kcontrol_new cs4265_snd_controls[] = {
>  	SOC_SINGLE("E to F Buffer Disable Switch", CS4265_SPDIF_CTL1,
>  				6, 1, 0),
>  	SOC_ENUM("C Data Access", cam_mode_enum),
> -	SOC_SINGLE("SPDIF Switch", CS4265_SPDIF_CTL2, 5, 1, 1),
> +	SOC_SINGLE("SPDIF", CS4265_SPDIF_CTL2, 5, 1, 1),

Looking through the code I think its probably better to combine
the two controls here. It looks like you would need to set both
to enable the SPDIF and I don't really see any reason for them to
be different. I think you can just move the register bits onto
the DAPM widget and have DAPM control them.

This patch also probably needs a fixes tag:

Fixes: f853d6b3ba34 ("ASoC: cs4265: Add a S/PDIF enable switch")

Apologies for missing this in my review of the original patch.
Let me know if you want me to have a bash at combining them.

Thanks,
Charles
