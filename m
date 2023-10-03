Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC757B6D37
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 17:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D7CE83B;
	Tue,  3 Oct 2023 17:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D7CE83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696347230;
	bh=WH64ZMeyNLQD5JMGY7ke9VN8fSbq1u+u9/U0krKbS/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lXqIsil4Bo8OVknQvZwluQvTUf+FvKtJRdRp443XcDAGHXRxOAR5f+30NIqQCRB8E
	 +zuVGzUcNS8ao1oRYnioaUHQYtipVshivgOep6NzsKhv8X07hXzzg8+FMzvCMzgxqe
	 mz57h71WdjVF4cCwwwfzk5RMRVCMJtnShl0nsQWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DBDDF80310; Tue,  3 Oct 2023 17:32:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A78C0F80310;
	Tue,  3 Oct 2023 17:32:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EC21F8047D; Tue,  3 Oct 2023 17:32:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94506F801EB;
	Tue,  3 Oct 2023 17:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94506F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XCrBv16y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696347166; x=1727883166;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WH64ZMeyNLQD5JMGY7ke9VN8fSbq1u+u9/U0krKbS/Q=;
  b=XCrBv16ybtby0W4fW7PBMk3VEmKE2yaA86U3L0yJiLgwvWPKq/NVFwIo
   g65aerTkTRXNuAJ2SrjbYfY9u4IkwuVb+r56cTZXHOfkmuHmCFqrK39X0
   9QYiMNmtRWz76py7fP1M6rR2TA9oyhtvUWoBZBm4T0uiJg70zuHTM0TOq
   +e6uUy7SZ/bjKPhD7y/xgVLUDbYRpTLU4O6/DgSLW132cXCjW98rSeI/U
   fBh7kxN+Y3Gy2O75qF9yiCVavcma5WieRGbwUjzr/OG/yTTVznUPEEGZv
   EdDb0649nJEOOeIDy63NtDJdhz7e+V8kLIMf/EWiiXc+QH0w09KvUMC6A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382813466"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200";
   d="scan'208";a="382813466"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 08:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082057053"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200";
   d="scan'208";a="1082057053"
Received: from paulinas-mobl2.amr.corp.intel.com (HELO [10.212.93.217])
 ([10.212.93.217])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 08:32:37 -0700
Message-ID: <5177f0f6-f32b-fa3b-647f-51365ff5b0e8@linux.intel.com>
Date: Tue, 3 Oct 2023 11:13:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH] ASoC: SOF: Intel: Add error handling in
 hda_dsp_trace_release
Content-Language: en-US
To: liuhaoran <liuhaoran14@163.com>, perex@perex.cz,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org
References: <20230923091216.26325-1-liuhaoran14@163.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230923091216.26325-1-liuhaoran14@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: C2PGRVBUWTEXB3R4XYEHZ2754B2YCGDB
X-Message-ID-Hash: C2PGRVBUWTEXB3R4XYEHZ2754B2YCGDB
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2PGRVBUWTEXB3R4XYEHZ2754B2YCGDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/23/23 05:12, liuhaoran wrote:
> This patch adds error-handling for the hda_dsp_stream_put() inside
> the hda_dsp_trace_release function in the hda-trace.c file.
> 
> Signed-off-by: liuhaoran <liuhaoran14@163.com>
> ---
>  sound/soc/sof/intel/hda-trace.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
> index cbb9bd7770e6..5dcd43b9cbe4 100644
> --- a/sound/soc/sof/intel/hda-trace.c
> +++ b/sound/soc/sof/intel/hda-trace.c
> @@ -73,13 +73,22 @@ int hda_dsp_trace_release(struct snd_sof_dev *sdev)
>  {
>  	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
>  	struct hdac_stream *hstream;
> +	int ret;
>  
>  	if (hda->dtrace_stream) {
>  		hstream = &hda->dtrace_stream->hstream;
> -		hda_dsp_stream_put(sdev,
> +		ret = hda_dsp_stream_put(sdev,
>  				   SNDRV_PCM_STREAM_CAPTURE,
>  				   hstream->stream_tag);
> +
>  		hda->dtrace_stream = NULL;
> +
> +		if (ret < 0) {
> +			dev_dbg(sdev->dev,
> +				"stream put failed: %d\n", ret);
> +			return ret;
> +		}
> +

I don't know if returning an error helps here, this might get in the way
of the suspend.

Peter, what do you think?


>  		return 0;
>  	}
>  
