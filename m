Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48A923A52
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2024 11:41:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3963219E7;
	Tue,  2 Jul 2024 11:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3963219E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719913267;
	bh=cKKhmZWA8i3/t0YPKgOkIBJTFu7C+J1VqMks8j/9hs0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CFM2RcdfIrwTTph7sIn7JJ/t1N62qCT8P+feb2PtpFkV5BwxCgBL1uE7A5z4A/iTF
	 x6kV0lbe8Tmgu5ud/8lNXtWzHeccrzJmvGaML2/djkEyl1bqSsRaQ/Akq919AoQvR5
	 UpfQAZNp1i32Ktuh0fDwLJh1SB76hcxVE2DSQ7sE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43E97F805A0; Tue,  2 Jul 2024 11:40:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5FFDF805AE;
	Tue,  2 Jul 2024 11:40:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B36F7F8025E; Tue,  2 Jul 2024 11:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C2C3F800FE
	for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2024 11:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C2C3F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O6W3zWjI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719913167; x=1751449167;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cKKhmZWA8i3/t0YPKgOkIBJTFu7C+J1VqMks8j/9hs0=;
  b=O6W3zWjI4JmoKTZ3kYreBcFzazuk4p18jKQsVkkkOe5w3dwyxgYsKMZ+
   roDaN2cL53HtzuaUp+41HvRROD1+DQc3pkBPHZwomslSRqVb4OfRByFme
   5dWbueV3hQkgrFe0+75SQp1W4VkcZPs8OrTA7GFDpzjVXmI282CrQeaVD
   Fb/7e1NnLC26cvw9x/OBLswnXv/HgVWFk6O2mjXC72vVvbUHFVLeK3HZX
   SoSYJn9x4DUO78V/X9nQunfqM//CKOx05W+RrW15jIzHv6CwZq1T/UmQV
   QzRBze+z7C2HYgU3jSobOnpq/J0cNZ7nlFJDJEtgwBK2raMKM4TmfrELm
   Q==;
X-CSE-ConnectionGUID: xMhJkCnhTESCgEFb2gwOkg==
X-CSE-MsgGUID: xa8S4QKdSNCVb7gZoUClJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17289678"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800";
   d="scan'208";a="17289678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 02:39:21 -0700
X-CSE-ConnectionGUID: 3z6E88XVSzSZZvVdIsg49w==
X-CSE-MsgGUID: tPms4iSOTy2At6x47qeQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800";
   d="scan'208";a="45637566"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.246.174])
 ([10.245.246.174])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 02:39:14 -0700
Message-ID: <f982842a-1804-420b-a539-a609ecf8fb8a@linux.intel.com>
Date: Tue, 2 Jul 2024 10:30:15 +0200
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
 <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
 <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OLF4DTRQHSXKTM3AFCVX3PO27FTMZ7V6
X-Message-ID-Hash: OLF4DTRQHSXKTM3AFCVX3PO27FTMZ7V6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLF4DTRQHSXKTM3AFCVX3PO27FTMZ7V6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> There are really multiple layers to deal with
>>
>> a) is the controller able to support the offload path? IIRC this is
>> embedded in an obscure XHCI property, it would make sense to expose it
>> as a control, or component string, of the USB card.
> 
> If a component string/tag is desired, I already have some way of doing that.  I can add it to the USB card.
> 
>>
>> b) is there a companion card capable of dealing with the offload path?
>> Since the presence of this card may depend on driver probe, there should
>> be a control on the USB card. userspace could detect changes to this
>> control and detect if that path is or is no longer enabled.
> 
> So currently, the "USB Offload Playback Capable Card" kcontrol (on the USB card) will determine if there is an offload path.  However, this differs than what Amadeusz is suggesting, in that he wants a single kcontrol created for EACH USB card identified (per USB audio device), and a simple enable/disable control to determine if the offload path is enabled for that card/pcm stream.
> 
> It would be a simpler approach for the userspace, and if the card that handles the offload card isn't present, then these enable/disable control will be set to "disabled," and even if users attempt to set the control, it won't go through.

Not following. Are you suggesting userspace would modify the
enable/disable status?

I would just have a read-only control that reports what the hardware can
do and which other card can deal with offload. It's up to userspace to
select the offloaded PCM device or not.



>> c) which PCM device is actually offloaded? This could be plural for some
>> implementations. The mapping between PCM devices exposed by the USB
>> card, and those exposed by the companion card, should be known to
>> userspace. I am not sure how this would be done though, a variable
>> number of controls is a sure way to confuse userspace.
> 
> Expanding on Amadeusz's suggestion, my idea is to have an enable/disable kcontrol per USB stream.  For example, one USB card could have multiple PCM devices (USB streams).  So we would have something like:
> 
> PCM Offload Playback Enable Stream#0  enable/disable
> 
> PCM Offload Playback Enable Stream#1  enable/disable
> 
> ....

are those read-only or not?

> So we'd know which USB card and PCM device is selected for USB SND.  However, I see what you're getting at in case there are multiple supported streams, because userspace needs to know which ASoC card/pcm combination corresponds to which USB device/combination.

I don't understand how this would help map the two parts? There's got to
be an additional mapping...

> What do you think about having a USB card kcontrol to display the mapped ASoC card and PCM indexes?
> 
> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)
> 
> To summarize, if we did this, I'd plan to remove all the kcontrols in ASoC card, and have the following in the USB card for an USB audio device that supports one USB stream:
> 
> PCM Offload Playback Enable Stream#0  enable/disable
> 
> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)

... which is suggested here.

Assuming these are read-only controls, we would need to know which PCM
device on the USB card can be optimized with the use of which PCM device
on the ASoC card. That means a set of three values. You would also want
a number of streams to make the guesswork on controls less painful.
