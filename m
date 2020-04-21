Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 875171B3272
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 00:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C60C16D1;
	Wed, 22 Apr 2020 00:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C60C16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587506655;
	bh=VRbdKW7Kc3KtskubmkEA9uM6tVINZnWJKwgth9t0qVo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjAZGSAYPjo0JPNU1jIvYTley1G8y0KD4JdqlQpd5FiKzMdm/dHUEGgzUsuqzFJ9o
	 B4bHK6wnv6lYIK9ypf2iupqaHHqxopEUp4SLOYXjagLZjQaerGav/GsHaRpi/WXdWS
	 f3dbGzS+/TxrRWHFCgNL8PROKvn2aFjvLKnF5PlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98358F801F5;
	Wed, 22 Apr 2020 00:01:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3F91F800E7; Wed, 22 Apr 2020 00:01:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA220F800E7
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 00:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA220F800E7
IronPort-SDR: CDIWaKSez0veWEqF+LEl7vqvDbOcQjSlX0iO3G7tSBNbRxbPaEV5UrJlqgKa0e3XhgWZn6zfyq
 hSCKsNWft28w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 15:01:29 -0700
IronPort-SDR: XW6i3mAjmpNPMWbyA+0u8KCpFbBNf13oozWBVPqZoRD0H2yFVKWUyTHmuhHKvuam4D2zio2otp
 YFec63mpSyAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; d="scan'208";a="456921738"
Received: from sabeliak-mobl.amr.corp.intel.com (HELO [10.254.24.98])
 ([10.254.24.98])
 by fmsmga006.fm.intel.com with ESMTP; 21 Apr 2020 15:01:28 -0700
Subject: Re: [PATCH 4/4] ASoC: Intel: Skylake: Automatic DMIC format
 configuration according to information from NHLT
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200421202519.4008-1-mateusz.gorski@linux.intel.com>
 <20200421202519.4008-5-mateusz.gorski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5530780f-9e86-1db3-b83b-9940560d27a2@linux.intel.com>
Date: Tue, 21 Apr 2020 15:55:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421202519.4008-5-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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




> @@ -3123,12 +3141,15 @@ static int skl_tplg_control_load(struct snd_soc_component *cmpnt,
>   	case SND_SOC_TPLG_CTL_ENUM:
>   		tplg_ec = container_of(hdr,
>   				struct snd_soc_tplg_enum_control, hdr);
> -		if (kctl->access & SNDRV_CTL_ELEM_ACCESS_READWRITE) {
> +		if (kctl->access & SNDRV_CTL_ELEM_ACCESS_READ) {
>   			se = (struct soc_enum *)kctl->private_value;
>   			if (tplg_ec->priv.size)
> -				return skl_init_enum_data(bus->dev, se,
> -						tplg_ec);
> +				skl_init_enum_data(bus->dev, se, tplg_ec);
>   		}
> +
> +		if (hdr->ops.get == SKL_CONTROL_TYPE_MULTI_IO_SELECT_DMIC)
> +			kctl->access = SNDRV_CTL_ELEM_ACCESS_READ;
> +

Is it intentional that you first test the kctrl->access as READ only, 
and then later set it to READ only for DMICs? The sequence looks rather odd?
