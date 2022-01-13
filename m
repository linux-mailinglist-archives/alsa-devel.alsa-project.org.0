Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C674348D451
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 10:19:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 538691E84;
	Thu, 13 Jan 2022 10:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 538691E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642065591;
	bh=zCOcgBKd8njK/MJdhiU5UdE0gC+gElPzoDmQ58NanVE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oCvM1WfvjstwlPxBwshLm2EMnsrqFAu0inMtuTCqWvDwOn0Vl3XyZrUsG1v9GMjfI
	 XrZDR1p9AlTwAkaNrJ7cG/zR8siADoEv8+40DlgYz9rsocpAHtigU92uE/M8nrFYVb
	 CglRexWnZRRWtlgTIVl0m5e78TtX4Q/wjy7FvFq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EF31F80141;
	Thu, 13 Jan 2022 10:18:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67753F8013F; Thu, 13 Jan 2022 10:18:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17CBEF800B9
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 10:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17CBEF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="R1GZxWBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642065517; x=1673601517;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zCOcgBKd8njK/MJdhiU5UdE0gC+gElPzoDmQ58NanVE=;
 b=R1GZxWBUU4ZGTu1iisUgZox7YQjMht78WA8j7Q3kRLigRnzrpjycAu+R
 MHtyntcQ5sYKDTJzhuaPiD2Q3eSlJp2LoFws65DHJULoqWSl7sqlBuV35
 7LwHRAPgzQrs6QTUI8lcmBU/ucSekTS8zZMOO/oU95yKbE0oJ4YBhjKOZ
 EkrViNZ1m2zr6EuHKmS57oi73bZqpuSc5FdFx05izMYzofuGyEj9y5L0I
 GSI0C+o/ymsNb7KdfKlCwn0S5yTS1/QTNcPHLUYofh6PBU7pQhK4Aj70V
 JKNU56ejAkrIN57QNg2sGrXHZMHWUznK6nKxBsn9rrGsph+NC2WL4T29R w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330318643"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="330318643"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 01:18:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="691737675"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.79])
 ([10.237.180.79])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 01:18:30 -0800
Message-ID: <703cec53-5de7-e8c1-5a1f-e44f0cbc141f@linux.intel.com>
Date: Thu, 13 Jan 2022 10:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] ASoC: add support for TAS5805M digital amplifier
Content-Language: en-US
To: Daniel Beer <daniel.beer@igorinstitute.com>, alsa-devel@alsa-project.org, 
 devicetree@vger.kernel.org
References: <cover.1642063121.git.daniel.beer@igorinstitute.com>
 <a2e4461ee2d2a052984f447f9891f8b4ecc9307c.1642063121.git.daniel.beer@igorinstitute.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <a2e4461ee2d2a052984f447f9891f8b4ecc9307c.1642063121.git.daniel.beer@igorinstitute.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Andy Liu <andy-liu@ti.com>,
 Mark Brown <broonie@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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

On 1/11/2022 12:53 AM, Daniel Beer wrote:
> The Texas Instruments TAS5805M is a class D audio amplifier with an
> integrated DSP. DSP configuration is expected to be supplied via a
> device-tree attribute containing a sequence of register writes.
> 
> These register writes set up application-specific DSP settings and are
> expected to be generated using TI's PPC3 tool.
> 
> Signed-off-by: Daniel Beer <daniel.beer@igorinstitute.com>
> ---

...

> +
> +static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
> +			    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct tas5805m_priv *tas5805m =
> +		snd_soc_component_get_drvdata(component);
> +
> +	if (!(volume_is_valid(ucontrol->value.integer.value[0]) &&
> +	      volume_is_valid(ucontrol->value.integer.value[1])))
> +		return -EINVAL;
> +
> +	mutex_lock(&tas5805m->lock);
> +	tas5805m->vol[0] = ucontrol->value.integer.value[0];
> +	tas5805m->vol[1] = ucontrol->value.integer.value[1];
> +	dev_dbg(component->dev, "set vol=%d/%d (is_powered=%d)\n",
> +		tas5805m->vol[0], tas5805m->vol[1], tas5805m->is_powered);
> +	if (tas5805m->is_powered)
> +		tas5805m_refresh_unlocked(component);
> +	mutex_unlock(&tas5805m->lock);
> +
> +	return 0;
> +}
> +

put method should return '1' if value changed, so ALSA knows to inform 
userspace utilities about change. You can check if userspace is notified 
of changes with "alsactl monitor", you should see something like:
node hw:2, #3 (2,0,0,ADC0 Capture Volume,0) VALUE
when value changes.
