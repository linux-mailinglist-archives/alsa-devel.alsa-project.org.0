Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2AA911EC4
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2024 10:30:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FC3F868;
	Fri, 21 Jun 2024 10:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FC3F868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718958608;
	bh=wuZBbOonZAFOS0sB1XJO28DAm8t6RfuaFgesGkuVgmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J2oNdSqt9zadvBjTjqL0GsNdOT9w4ETYrq1mr/C2laeCn5nVNweHR24unVS/jUqN+
	 6FE5ReMDugcOj7hX5jO9o42IqizeAJF3/+0T5O2pe+8HlvPt0ANgfBIzhMqgM+hbyv
	 icgQFNJ7adOX97iw9eUoo8I0pkdKpciolFxaWO0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2EA2F805AB; Fri, 21 Jun 2024 10:29:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39207F805AE;
	Fri, 21 Jun 2024 10:29:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E085CF8023A; Fri, 21 Jun 2024 10:27:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 102A3F8010C
	for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2024 10:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 102A3F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gH610E9o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718958466; x=1750494466;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wuZBbOonZAFOS0sB1XJO28DAm8t6RfuaFgesGkuVgmA=;
  b=gH610E9oLq9q7L9IxOsDMHISKpzFk2UwejP79sTO//Mn9VwBa1SeVlaK
   XWBodpXnXjPKKTywoXpZ+ibiF2whfwGT0D/HmQqPDnPL8rmhAdCu5TV5u
   rWnSjz38jWvCXDl4EuUVBiEFqEu/yjap1mkQTzm/APqLeRg83CkZqrony
   Yt3s2pB865n6OgXW20bTxifizhvXxy6mZ2IVN64MEUqgKkWkzaxfn6Qru
   9dlYtTkamSj0866leUdcTIvU09uvwC9KdGiWV3xm9bYuGVHtLhQpm7TYs
   4I/lEeEo4czA2uN6E9QYXkYVPRlPJ32Y3J7lukHbT2nlATdsg+Ykaf6ST
   w==;
X-CSE-ConnectionGUID: B6wmwC1oT3mya7e8w5rxww==
X-CSE-MsgGUID: ycBi1PTPSOuSEV61VxPKZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33438311"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000";
   d="scan'208";a="33438311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 01:27:38 -0700
X-CSE-ConnectionGUID: 83RXG4JlThiu0gr95hxjnw==
X-CSE-MsgGUID: bZhtUY6HTEaIIglKI2p5DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000";
   d="scan'208";a="42628778"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.142])
 ([10.245.246.142])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 01:27:33 -0700
Message-ID: <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
Date: Fri, 21 Jun 2024 10:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
 <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 54GDNKSMPSK2FBYTNACSAHR2X36GZDXV
X-Message-ID-Hash: 54GDNKSMPSK2FBYTNACSAHR2X36GZDXV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54GDNKSMPSK2FBYTNACSAHR2X36GZDXV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> I'll spend some time to evaluate your suggestion about moving the logic
> to control the offloading from USB SND versus ASoC, since there are
> valid points.  However, before I do that, I just want to make sure folks
> are also inline with that thinking.  I've had to put a lot of effort
> moving things around such as the previous example, and now you've
> suggested to move it back to the vendor specific drivers.
> 
> @Pierre, since you've helped with providing a lot of valuable input in
> the previous revisions on the kcontrol uses, what do you think about the
> proposal from Amadeusz?  Basically shifting the offload device selection
> into USB SND from the ASoC USB BE driver, and having this per USB SND
> device.
> 
> [1]
> https://lore.kernel.org/linux-usb/20231017200109.11407-30-quic_wcheng@quicinc.com/

This thread is very hard to follow, I am not sure I fully understood the
initial proposal, and I am not sure I follow Amadeusz' either.

There are really multiple layers to deal with

a) is the controller able to support the offload path? IIRC this is
embedded in an obscure XHCI property, it would make sense to expose it
as a control, or component string, of the USB card.

b) is there a companion card capable of dealing with the offload path?
Since the presence of this card may depend on driver probe, there should
be a control on the USB card. userspace could detect changes to this
control and detect if that path is or is no longer enabled.

c) which PCM device is actually offloaded? This could be plural for some
implementations. The mapping between PCM devices exposed by the USB
card, and those exposed by the companion card, should be known to
userspace. I am not sure how this would be done though, a variable
number of controls is a sure way to confuse userspace.

At any rate, I would put all the controls under the USB generic card,
because it's always present no matter what the controller or DSP
configurations are.




