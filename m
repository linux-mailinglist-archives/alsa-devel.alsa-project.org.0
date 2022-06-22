Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DBE5544B0
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 10:41:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B96D6244B;
	Wed, 22 Jun 2022 10:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B96D6244B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655887299;
	bh=VfNo7yVTgFB/Svew6Oy6XyZl047DErTPyzcdQPMqbxE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3EKvA/+CdAi4HnnC6Q7mxrfYyT38xmabMqOvbwLEe2nETd61GrtvqoMU2PXotQza
	 xVTf6fO0MiipPGtBaHCUWRMHcq41PABkoQ69t7k44MFO483O8g6MYFKNPFChSOVEH4
	 tFeMJQY5UXWOfs/RbB6tXEKfL0oMd6GkKpDsz0Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21B49F80424;
	Wed, 22 Jun 2022 10:40:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7129CF800CB; Wed, 22 Jun 2022 10:40:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E36DF800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 10:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E36DF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="F3qTFkBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655887233; x=1687423233;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VfNo7yVTgFB/Svew6Oy6XyZl047DErTPyzcdQPMqbxE=;
 b=F3qTFkBCR8pGI1PX1xDAX2aXpEgiLGV7pNnXj/2PPKDG5lbfb5gbuvH6
 Vti5EQ4809Y1DaqQqlsV7I1KH6AwGEpzgVENAU1wSHWGxdnNN1pHP2GWw
 1hKU7MXMn2AE1ntQQ47NXlkZjvoptbUYJBNxXQMB+8zOVIUYt4x75mhiq
 j2oqJkUlSKstgNAMzgOGVhzoQMVK+4kwfFmurSShUwGUYg/JJIaIOZE7g
 DNTpmRswLOS/1u233OAv4Fi2VxTo5cpq7PhpBinEDz9GnpJLHnMYaFm/W
 xxOEBciXUFSZx5A9q89FOvvOaSkfEh4AgjY7i89A5Iln6A4OXbrExew9R w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260787554"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="260787554"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 01:40:24 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="644080007"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.103])
 ([10.99.249.103])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 01:40:22 -0700
Message-ID: <d05c292e-f955-48df-50e3-55e36a956775@linux.intel.com>
Date: Wed, 22 Jun 2022 10:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 01/14] ALSA: hda: hda_cs_dsp_ctl: Add Library to
 support CS_DSP ALSA controls
Content-Language: en-US
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
References: <20220622074653.179078-1-vitalyr@opensource.cirrus.com>
 <20220622074653.179078-2-vitalyr@opensource.cirrus.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220622074653.179078-2-vitalyr@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

On 6/22/2022 9:46 AM, Vitaly Rodionov wrote:
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
>   MAINTAINERS                    |   1 +
>   sound/pci/hda/Kconfig          |   4 +
>   sound/pci/hda/Makefile         |   2 +
>   sound/pci/hda/hda_cs_dsp_ctl.c | 207 +++++++++++++++++++++++++++++++++
>   sound/pci/hda/hda_cs_dsp_ctl.h |  33 ++++++
>   5 files changed, 247 insertions(+)
>   create mode 100644 sound/pci/hda/hda_cs_dsp_ctl.c
>   create mode 100644 sound/pci/hda/hda_cs_dsp_ctl.h
> 

...

> +
> +static unsigned int wmfw_convert_flags(unsigned int in)
> +{
> +	unsigned int out, rd, wr, vol;
> +
> +	rd = SNDRV_CTL_ELEM_ACCESS_READ;
> +	wr = SNDRV_CTL_ELEM_ACCESS_WRITE;
> +	vol = SNDRV_CTL_ELEM_ACCESS_VOLATILE;
> +
> +	out = 0;
> +
> +	if (in) {
> +		out |= rd;
> +		if (in & WMFW_CTL_FLAG_WRITEABLE)
> +			out |= wr;
> +		if (in & WMFW_CTL_FLAG_VOLATILE)
> +			out |= vol;
> +	} else {
> +		out |= rd | wr | vol;
> +	}
> +
> +	return out;
> +}

This is more question of preference, so you can leave above function as 
is, but you could also do something like the following, which is bit 
shorter:
static unsigned int wmfw_convert_flags(unsigned int in)
{
	unsigned int out = SNDRV_CTL_ELEM_ACCESS_READ;

	if (!in)
		return SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_VOLATILE;

	if (in & WMFW_CTL_FLAG_WRITEABLE)
		out |= SNDRV_CTL_ELEM_ACCESS_WRITE;
	if (in & WMFW_CTL_FLAG_VOLATILE)
		out |= SNDRV_CTL_ELEM_ACCESS_VOLATILE;

	return out;
}

> +
> +static int hda_cs_dsp_add_kcontrol(struct hda_cs_dsp_coeff_ctl *ctl)
> +{
> +	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
> +	struct snd_kcontrol_new *kcontrol;
> +	struct snd_kcontrol *kctl;
> +	int ret = 0;
> +
> +	if (cs_ctl->len > ADSP_MAX_STD_CTRL_SIZE) {
> +		dev_err(cs_ctl->dsp->dev, "Control %s: length %zu exceeds maximum %d\n", ctl->name,
> +			cs_ctl->len, ADSP_MAX_STD_CTRL_SIZE);
> +		return -EINVAL;
> +	}
> +
> +	kcontrol = kzalloc(sizeof(*kcontrol), GFP_KERNEL);
> +	if (!kcontrol)
> +		return -ENOMEM;
> +
> +	kcontrol->name = ctl->name;
> +	kcontrol->info = hda_cs_dsp_coeff_info;
> +	kcontrol->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +	kcontrol->private_value = (unsigned long)ctl;
> +	kcontrol->access = wmfw_convert_flags(cs_ctl->flags);
> +
> +	kcontrol->get = hda_cs_dsp_coeff_get;
> +	kcontrol->put = hda_cs_dsp_coeff_put;
> +
> +	kctl = snd_ctl_new1(kcontrol, NULL);

Wouldn't
kctl = snd_ctl_new1(kcontrol, ctl);
work instead of
kcontrol->private_value = (unsigned long)ctl;
...
kctl = snd_ctl_new1(kcontrol, NULL);
?

You can then get the value using  snd_kcontrol_chip()  macro, so instead 
of doing quite long lines with casts like:
struct hda_cs_dsp_coeff_ctl *ctl = (struct hda_cs_dsp_coeff_ctl 
*)kctl->private_value;
you could do
struct hda_cs_dsp_coeff_ctl *ctl = snd_kcontrol_chip(kctl);


