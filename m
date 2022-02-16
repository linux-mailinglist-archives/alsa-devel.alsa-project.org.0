Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DED4B831F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 09:40:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBCB617E8;
	Wed, 16 Feb 2022 09:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBCB617E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645000839;
	bh=VPBgHu7rmw7l8P2PkQhwc9tPS8Zj1T3H6k4XpCdGg+s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U03QEfUTdcCg92OIfEnKdO1rJggKOt0G55qORpAfzMd8J86E6vL0RR/EnglV5Jmbb
	 nUqnQ6vOnBdVB1GB2EnUPjq1pgiMd0+xP0psA5P1W0hMDD5GqUj/EoFwWDAVUk+nLt
	 lllg/n8CTEl0Vlk2zq7xdy3BK3HQa3OGMPIAsjJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E39B2F80256;
	Wed, 16 Feb 2022 09:39:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C3EBF800C0; Wed, 16 Feb 2022 09:38:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5863AF800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 09:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5863AF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RUUrHS1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645000736; x=1676536736;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VPBgHu7rmw7l8P2PkQhwc9tPS8Zj1T3H6k4XpCdGg+s=;
 b=RUUrHS1alyvPk9CFH3khffC4G2YyV2qiaLoN+1Sa4QtVkcFBkgKOLmM3
 otwdG7pV4WQfeGbd/FcY5MDsAaLzQCJiVpdtyifwhGUfP2htiyHp2uvSy
 kYWREq0BI6r36Nu5ICpbmV+kXZ2vkxArBGwIV25nntJClFzh3vy6hKM0V
 8MmTRwean+eleORa/BNI9BqxCKE+DOJlv4IQGGJ6AFItQSYwgXGfI9AuE
 bHxD4ISuLDgvXD912s0J+wxAN/Wz3OtOstV+grv62kQvhhRJ/GNn1yNQI
 2S5joS+3XeKU5FHUrwBWnxA3uLKpIe77l+y4pw0MQM8cT0AVW66redypr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="237958558"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="237958558"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:38:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="544804369"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.215])
 ([10.99.249.215])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:38:46 -0800
Message-ID: <68cbcd13-00dc-a3e3-244a-773c4fd4707d@linux.intel.com>
Date: Wed, 16 Feb 2022 09:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] ALSA: hda/hdmi: add keep-alive support for ADL-P and DG2
Content-Language: en-US
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.de
References: <20220215140118.3856001-1-kai.vehmanen@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220215140118.3856001-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Jyri Sarha <jyri.sarha@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 2/15/2022 3:01 PM, Kai Vehmanen wrote:

>   static void silent_stream_disable(struct hda_codec *codec,
> @@ -1726,7 +1786,16 @@ static void silent_stream_disable(struct hda_codec *codec,
>   {
>   	struct hdmi_spec *spec = codec->spec;
>   	struct hdmi_spec_per_cvt *per_cvt;
> -	int cvt_idx;
> +	int cvt_idx, err;
> +
> +	err = snd_hda_power_up_pm(codec);
> +	if (err < 0 && err != -EACCES) {
> +		codec_err(codec,
> +			  "Failed to power up codec for silent stream disable ret=[%d]\n",
> +			  err);
> +		snd_hda_power_down_pm(codec);

If power up failed, do you need to power down?

> +		return;
> +	}
>   
>   	mutex_lock(&per_pin->lock);
>   	if (!per_pin->silent_stream)

