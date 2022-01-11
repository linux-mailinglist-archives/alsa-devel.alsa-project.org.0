Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A91BA48B3E4
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 18:30:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 217431ABB;
	Tue, 11 Jan 2022 18:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 217431ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641922245;
	bh=aj+BMT7q2YA/CSyOTyFf6yCyaf8AVyARtnbUWBltfKQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AQHdWwLy9yQ5mRtpvAlKabG4jphihYtJDFCF1+X/CmSEf5KLtQEwsmIs3a63LD+vi
	 /4VEZwMz7uBbztSXfU1cpKNuay6ge8pgLyIj7aNXSI6acCrHEVhz3sJNKvOAU0s59l
	 jEr58CdTDWscJkVdCnA6n2MX24VoaCQoEwCjk1LQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FC3EF800A7;
	Tue, 11 Jan 2022 18:29:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E166FF80302; Tue, 11 Jan 2022 18:29:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DC9BF80054
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 18:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC9BF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FDuMeBJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641922167; x=1673458167;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aj+BMT7q2YA/CSyOTyFf6yCyaf8AVyARtnbUWBltfKQ=;
 b=FDuMeBJT2I+FIYXuYwRu3T57c8JRu8505yhvSk0b+it6lyPqpR+Eo+yy
 eP6htDIN9KUULzyTbm/Vcm+7bbL0eGEmF2E81JmDikrZTWwmozPS43BWy
 JdS8tY3cALOfEUvaIF0icAT92DLbgl2tTJthwzsUFtNo5ne9tUy0Kjsi9
 /u1cizPZKWJvmyjROw8GrADVSK1g9iCtXfGFZNx7BT7qW18MtfCUqpagL
 L+6iHVuFOjmOBuvGm309V7IKsHw9cI8KOnxtjh+zUf4UW4liKKjUn+qoZ
 r4jHAWG9dE2zDcLq7Ibh3FrfOjAmeE3mkfrTfp0crEMik1ttzW5AeYYka A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="230881558"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="230881558"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 09:23:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="592749781"
Received: from cdoher2x-mobl1.amr.corp.intel.com (HELO [10.212.119.165])
 ([10.212.119.165])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 09:23:30 -0800
Subject: Re: [PATCH 2/3] ASoC: topology: Allow TLV control to be either read
 or write
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <20220111190528.445248-1-amadeuszx.slawinski@linux.intel.com>
 <20220111190528.445248-3-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b4e04b4d-147a-5dd1-d54e-429a61f7f84d@linux.intel.com>
Date: Tue, 11 Jan 2022 10:48:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111190528.445248-3-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
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



On 1/11/22 1:05 PM, Amadeusz Sławiński wrote:
> There is no reason to force readwrite access on TLV controls. It can be
> either read, write or both. This is further evidenced in code where it
> performs following checks:
>                 if ((k->access & SNDRV_CTL_ELEM_ACCESS_TLV_READ) && !sbe->get)
>                         return -EINVAL;
>                 if ((k->access & SNDRV_CTL_ELEM_ACCESS_TLV_WRITE) && !sbe->put)
>                         return -EINVAL;
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Should there be a Fixes tag

Fixes: 1a3232d2f61d ("ASoC: topology: Add support for TLV bytes controls")

?

> ---
>  sound/soc/soc-topology.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index e0f72ddd72c1..9d24184f85f9 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -512,7 +512,8 @@ static int soc_tplg_kcontrol_bind_io(struct snd_soc_tplg_ctl_hdr *hdr,
>  
>  	if (le32_to_cpu(hdr->ops.info) == SND_SOC_TPLG_CTL_BYTES
>  		&& k->iface & SNDRV_CTL_ELEM_IFACE_MIXER
> -		&& k->access & SNDRV_CTL_ELEM_ACCESS_TLV_READWRITE
> +		&& (k->access & SNDRV_CTL_ELEM_ACCESS_TLV_READ
> +		    || k->access & SNDRV_CTL_ELEM_ACCESS_TLV_WRITE)
>  		&& k->access & SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK) {
>  		struct soc_bytes_ext *sbe;
>  		struct snd_soc_tplg_bytes_control *be;
> 
