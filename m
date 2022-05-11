Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F875234F5
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 16:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA5BD19FD;
	Wed, 11 May 2022 16:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA5BD19FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652277823;
	bh=iyE8n9SksPurxnZbqkT2A6Xma+hyTFWKc249F6za/2w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vQkv04zfIk6GTt/hgfGHliaVUNyGG0XD2aJG6xBMEypw0wf7R1huE5RsyErwDk0lh
	 aLd+20U2pfEmwYERtiMfoEMDrujKsPjJa0Dg4XdpNZYoEBeLjyHjlPH1T0mQx2JqM0
	 UCwP05Dg9/Rx85AqPPm1QO3ENb3oIiJ8mKNoo8JU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D6CEF8011C;
	Wed, 11 May 2022 16:02:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 509B9F8015B; Wed, 11 May 2022 16:02:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD24BF800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 16:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD24BF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JmeWk3lg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BC4ek3000496;
 Wed, 11 May 2022 09:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=oIxr/xC1n5ZyDjdj6EgfIBAjcz3pjH99gFXnfJtabgA=;
 b=JmeWk3lg7MAKH29m11cseAUiFwvLI0tgjRC9VNYkYwmnRwaypR1VugdmR50cWK8pyi6N
 OwQAfqB2NCoF7afyFy+icRbUDEq9qfFr1tm6eivk4vCuy3Z3ZtYqUya/lmeOkiM1FWWq
 137QxGcAzyZgWY4wCRIVPqHCnfsHI1S4JjP9T/My5egM/MSRX/9U9eJ8xMR4XGA3nvz9
 Xk+UYSreB19bbgFXjm2uFpsKDCFzGOh2Q1tIbxajrIA/X10ntzK0E/08giyFrHkiynDT
 7SgbhG8XA4AFwTD+BFJR4GbJLXmKqg6YIyIGeDXIoExVEAhKIBkeRfxYe1w0kr/etHgI uw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp616pdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 May 2022 09:02:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 15:02:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 11 May 2022 15:02:17 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7ECE8B10;
 Wed, 11 May 2022 14:02:17 +0000 (UTC)
Date: Wed, 11 May 2022 14:02:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH v2 10/26] ALSA: hda: hda_cs_dsp_ctl: Add Library to
 support CS_DSP ALSA controls
Message-ID: <20220511140217.GI38351@ediswmail.ad.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
 <20220509214703.4482-11-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220509214703.4482-11-vitalyr@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 03tfxSSWisQ6hehUnsU3Ci8UZPqmpEfz
X-Proofpoint-ORIG-GUID: 03tfxSSWisQ6hehUnsU3Ci8UZPqmpEfz
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
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

On Mon, May 09, 2022 at 10:46:47PM +0100, Vitaly Rodionov wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> The cs35l41 part contains a DSP which is able to run firmware.
> The cs_dsp library can be used to control the DSP.
> These controls can be exposed to userspace using ALSA controls.
> This library adds apis to be able to interface between
> cs_dsp and hda drivers and expose the relevant controls as
> ALSA controls.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---
> +static int hda_cs_dsp_coeff_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
> +{
> +	struct soc_bytes_ext *bytes_ext =
> +		(struct soc_bytes_ext *)kctl->private_value;
> +	struct hda_cs_dsp_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
> +	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
> +
> +	switch (cs_ctl->type) {
> +	case WMFW_CTL_TYPE_ACKED:
> +		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +		uinfo->value.integer.min = CS_DSP_ACKED_CTL_MIN_VALUE;
> +		uinfo->value.integer.max = CS_DSP_ACKED_CTL_MAX_VALUE;
> +		uinfo->value.integer.step = 1;
> +		uinfo->count = 1;
> +		break;

With the ACKED controls as well as the TLVs it would be worth
verifing if any of the relevant firmwares actually require these,
if we are going to duplicate a bunch of the wm_adsp code into HDA
lets duplicate only exactly what we need.

> +	switch (cs_dsp->fw_ver) {
> +	case 0:
> +	case 1:
> +		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
> +				"%s %s %s %x", info->amp_name, cs_dsp->name, region_name,
> +				cs_ctl->alg_region.alg);
> +		break;
> +	case 2:
> +		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
> +				"%s %s%c %.12s %x", info->amp_name, cs_dsp->name, *region_name,
> +				hda_cs_dsp_fw_text[info->fw_type], cs_ctl->alg_region.alg);
> +		break;
> +	default:
> +		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
> +				"%s %s %.12s %x", info->amp_name, cs_dsp->name,
> +				hda_cs_dsp_fw_text[info->fw_type], cs_ctl->alg_region.alg);
> +		break;
> +	}

Do we actually need to support all the historical fw_versions?
ADSP does since CODECs using it have been around forever, but I
would suggest it is quite like this stuff only needs to support
the latest version.

Thanks,
Charles
