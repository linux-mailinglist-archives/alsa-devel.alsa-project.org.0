Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B27EF250
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:08:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFDF6DEC;
	Fri, 17 Nov 2023 13:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFDF6DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222923;
	bh=JNdqCpXJsVXxWZqG2ZZwRtS/8lxxiBHyZBSn0pv8dTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=apdq335dvCUDyOGZL5WAbsRvAXJ2RB041Csfe0xAJ0c21yDfBzXOg5WNTEZufvo+o
	 5lldX9vJT1pUP+4bxhCArVjXtWVJTVJBEqkdzbTe7XEDVIxbPO/ROcfiHtM8AyrlYm
	 hEDcxNJY5mcg3ZnI9ZtniqL9dtunr6jaYit5JPKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0EF3F80606; Fri, 17 Nov 2023 13:05:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D5B7F805FC;
	Fri, 17 Nov 2023 13:05:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4D0EF805ED; Fri, 17 Nov 2023 13:05:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0D95F8057A;
	Fri, 17 Nov 2023 13:04:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0D95F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QaUkC7oS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222678; x=1731758678;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JNdqCpXJsVXxWZqG2ZZwRtS/8lxxiBHyZBSn0pv8dTw=;
  b=QaUkC7oSLpRI4RUdtSMLyHjRYXGIW/9q4iVIZXG6cdypunQDcYAW8+ja
   Hz9haXgQdjjEXB7v5bzYWUVHmPVgsj8s6O9vDv5IPx/WbCi/+VwLSIR/f
   Oix+fH2YaoUVVFZSB5cTNwjIyv8dE7QT1BK6Q19qyyFzdWwwvlniTOjDK
   Oy+MW3atB8sYAJK8orVvXkQe9zsFOWe3x4/stc/gB3T3t7PrVd29faEX2
   B/aBu4yqp06i/n6vyO3z102dRYJKxRlwHI22c1eTcEVRispBqJwaJekL9
   Bg/PiwDBtegTKYO2/MF5u2PT7mIghNbWxNtgu3tRcmFKh5ZazoO20Xqvr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4372335"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="4372335"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1012918245"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="1012918245"
Received: from mwevers-mobl1.ger.corp.intel.com (HELO [10.249.44.74])
 ([10.249.44.74])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:28 -0800
Message-ID: <aec61f67-6b4f-49e6-b458-c332983a0ad6@linux.intel.com>
Date: Fri, 17 Nov 2023 14:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: icp3-dtrace: Fix wrong kfree() usage
Content-Language: en-US
To: Kamil Duljas <kamil.duljas@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Cezary Rojewski
 <cezary.rojewski@intel.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, sound-open-firmware@alsa-project.org
References: <20231116220102.2097-2-kamil.duljas@gmail.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20231116220102.2097-2-kamil.duljas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2NYKT4YJRQE26I2TAAECDR2DEC3HN7W5
X-Message-ID-Hash: 2NYKT4YJRQE26I2TAAECDR2DEC3HN7W5
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NYKT4YJRQE26I2TAAECDR2DEC3HN7W5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 17/11/2023 00:01, Kamil Duljas wrote:
> trace_filter_parse() allocs memory for *out and when
> -ENOMEM is returned, caller function, dfsentry_trace_filter_write()
> trying to freed this memory.
> 
> After this patch, the memory is freed in trace_filter_parse()
> before -EINVAL returned. In caller function removed kfree(elms)
> from error label

I think the original code was cleaner:
the elems is always freed up in dfsentry_trace_filter_write() in one place.
kfree(NULL); is not an error, it is handled correctly

> 
> Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
> ---
>  sound/soc/sof/ipc3-dtrace.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
> index 0dca139322f3..93b189c2d2ee 100644
> --- a/sound/soc/sof/ipc3-dtrace.c
> +++ b/sound/soc/sof/ipc3-dtrace.c
> @@ -137,6 +137,7 @@ static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
>  			dev_err(sdev->dev,
>  				"Parsing filter entry '%s' failed with %d\n",
>  				entry, entry_len);
> +			kfree(*out);
>  			return -EINVAL;
>  		}
>  	}
> @@ -208,13 +209,13 @@ static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user
>  		ret = ipc3_trace_update_filter(sdev, num_elems, elems);
>  		if (ret < 0) {
>  			dev_err(sdev->dev, "Filter update failed: %d\n", ret);
> +			kfree(elems);
>  			goto error;
>  		}
>  	}
>  	ret = count;
>  error:
>  	kfree(string);
> -	kfree(elems);
>  	return ret;
>  }
>  

-- 
Péter
