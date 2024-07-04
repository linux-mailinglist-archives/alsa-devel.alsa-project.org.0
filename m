Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E338E9274FC
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 13:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D725E85;
	Thu,  4 Jul 2024 13:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D725E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720092368;
	bh=jkDP8M9nS6zbeKG8Ls4A6Gkiqj2sTDusTpp/rBGe0V8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SLQQZbrax5O+Cx4aJlXZl6WLaT0YyHFBaYOUDkivPYPwj2cfVc6HF5uNdcVV3I9hJ
	 Aj86eN2qiU06qXHNn4jC+PO88+VxFso232YsM21Ptm26nljMmIu2gwCvPyG7NqDxZp
	 FREWn1D0MAvSJ3KVrHS0TGuZiPPdRqr0FQuVwkB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD1D1F805A8; Thu,  4 Jul 2024 13:25:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81CC1F805A8;
	Thu,  4 Jul 2024 13:25:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75BD7F8025E; Thu,  4 Jul 2024 13:25:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52AD2F800FE
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 13:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52AD2F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L3jnzelS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720092323; x=1751628323;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jkDP8M9nS6zbeKG8Ls4A6Gkiqj2sTDusTpp/rBGe0V8=;
  b=L3jnzelSgMpEVf/MvjMhp9uqCUE+RY1FTGTCbK5YvxqP54u2kBkh3kIA
   fjBO9EAHrnulohxN5p3oBhaYzMs3MfYncSZbGvenLy0YRQr0VLV8sKjN1
   lj9wiYmT3VBCh7YxQbAgpuZ9YDu5hElR1fj1Sv/5jTVa58GnWyDvZ062J
   I0TCXl+tV1WgRW9wL8+FI47GmIoxA92xI93pVSm7K2FbwwmE2ZCmp81Mi
   H3CUWeliEbd4B77HrbTVBSBjaq4Ta3aVSRyOrPsVD9AxLSPmgsu2qMFN4
   vXN0P9YW2ZBfbIu+cJpAJmTgZasFP/KSqfW2VoL7NTgTF3g0fuBNg9ICn
   w==;
X-CSE-ConnectionGUID: Zz+CrRPhSJq+BL23uc93Qw==
X-CSE-MsgGUID: q+s2xOWBRRaWjn1WnxnHug==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17477834"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="17477834"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 04:25:18 -0700
X-CSE-ConnectionGUID: ws7LtSdaR264xMczHG3i8g==
X-CSE-MsgGUID: K9y0McSiT7qKUb2J70jrew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="69759893"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.90])
 ([10.245.246.90])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 04:25:12 -0700
Message-ID: <f9923336-3dd3-4f36-b5f6-f45f4ed09e0c@linux.intel.com>
Date: Thu, 4 Jul 2024 13:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Wesley Cheng
 <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
 <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
 <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
 <f982842a-1804-420b-a539-a609ecf8fb8a@linux.intel.com>
 <3c358604-6926-4f90-8fc8-8139c68c3418@quicinc.com>
 <70bf10a7-7f87-4fd1-bd44-1733d3b2b15e@linux.intel.com>
 <b1fcef2a-2af9-4985-ae00-f348ca5df3f1@linux.intel.com>
 <ab734271-58ee-4981-926c-9b57f36b8ac6@linux.intel.com>
 <ccbf9366-f3de-4a80-bffc-e32a8409e1a7@quicinc.com>
 <adb4e27b-b328-4eef-87ca-9b8bad6639e6@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <adb4e27b-b328-4eef-87ca-9b8bad6639e6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q5ABSFTXJV3ZJF4WIE3W3VBJBIZG6NGS
X-Message-ID-Hash: Q5ABSFTXJV3ZJF4WIE3W3VBJBIZG6NGS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5ABSFTXJV3ZJF4WIE3W3VBJBIZG6NGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> Just so I understand...is it really desired that userspace doesn't
>> have the flexibility to choose which USB device is offloaded?  I know
>> it complicates what needs to be done, but it could be just an
>> additional feature that can be added later on.  Again, by default, we
>> select the last USB headset plugged in to be enabled for offload by
>> default.
> 
> If it chooses endpoint by itself perhaps you can send patch set without
> controls first? This has added benefit of less patches in series, making
> it easier to review and it won't block whole patch set by discussion on
> controls feature. Controls can be added in followup series.

We do need read-only controls for userspace to know that offload is
possible and which card/device to use. That can be done in a first step
assuming there's a single device plugged-in.

Dealing with multiple devices and defining rules or configuration
options to select the offloaded device is a second-level problem.

In most cases the only thing that will be offloaded is a headset
anyways, so the selection could be rather static based on a
vendor/system ID, all other USB devices would be ignored.
