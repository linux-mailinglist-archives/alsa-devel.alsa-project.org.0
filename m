Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A54C0965E62
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34DEDE8E;
	Fri, 30 Aug 2024 12:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34DEDE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012990;
	bh=FBnecxHaa8FwyoOrzXwFoI00y4P/e6lJs2nAYsSX1dk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tNS1GhvaTmmKHkF4wdQzy8qaz5TFL5TkNQtx13mVtO+XG+GUvRWk7lxdGIPe2mhbF
	 xpE1wS6Y/SlTCrndLS7RHoBSbJQvGCZYP/cO+TCwDQeaDYB1+Z7fzR9NxW25uXb4DM
	 gEJeRpgcATqT5OSGFmGZ6Mu8uHs0P0n45OM3J1x8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E43AF805AE; Fri, 30 Aug 2024 12:13:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC239F80798;
	Fri, 30 Aug 2024 12:13:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69FA9F8062D; Fri, 30 Aug 2024 12:13:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0054F805A1
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0054F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JLcNB5sf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012795; x=1756548795;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FBnecxHaa8FwyoOrzXwFoI00y4P/e6lJs2nAYsSX1dk=;
  b=JLcNB5sfmDUQBUIiRmUgmAazF5JheKOAfHuLA2c9VU2L1JttkvO1oniR
   kiPztjAavRqe10/s1a4v/Aptm9v/wDxvKialAJSa2nmCPniwVUS7Od732
   SZ9w+5oHaF/kGnisA6OfY3AEJCCEjSxbVI6ZIYX2x3xGbLKJWFu+YUtf+
   UYvQv105M9XHSrM9G5CQDKCyVOeAHqxd9SwCRnxzUOpGd7MwrspIY0viy
   GN33Jjr9xXpR7ZFbSyWRe6D1cBG6hqFWmnLY50qK/heViY4d+3WuItgIV
   llEcJx2h+lyvxc+1GWgwpLqfbmeW8cdPzRyMYPvBxUZR9kbFlbtT0A3Jo
   A==;
X-CSE-ConnectionGUID: oLHvU8SYR5SW4ZB26jZ2pA==
X-CSE-MsgGUID: dwmYk/jOQba4Ashi4MDS0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27526379"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="27526379"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:13:13 -0700
X-CSE-ConnectionGUID: 67kO7DlMQa6vWM3WrtkI3w==
X-CSE-MsgGUID: Gzceg7CkQ9+QUidV4VtYTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="68013133"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:13:07 -0700
Message-ID: <e7955dd7-95b1-4999-a2a1-519e8d7297a6@linux.intel.com>
Date: Fri, 30 Aug 2024 11:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 28/33] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-29-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-29-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XEAZQEOOBOEKVKASQJ5RXMTVTA5OP4NX
X-Message-ID-Hash: XEAZQEOOBOEKVKASQJ5RXMTVTA5OP4NX
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XEAZQEOOBOEKVKASQJ5RXMTVTA5OP4NX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +/* Stream disable request timeout during USB device disconnect */
> +#define DEV_RELEASE_WAIT_TIMEOUT 10000 /* in ms */

10s really? That seems rather large for a stream disable timeout...

> +static struct snd_usb_platform_ops offload_ops = {
> +	.connect_cb = qc_usb_audio_offload_probe,
> +	.disconnect_cb = qc_usb_audio_offload_disconnect,
> +	.suspend_cb = qc_usb_audio_offload_suspend,
> +};

You probably want to explain why there's no .resume_cb?

The comments mention also that the suspend_cb has to stop playback, but
then who resumes playback :-)


