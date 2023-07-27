Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3984C765811
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 17:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B42E583A;
	Thu, 27 Jul 2023 17:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B42E583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690473232;
	bh=V2aH0vwTvDcXMuV7cQlSjt46toCvcqNWtjA04RTm5Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XJQnfdzZpMAuMHqDWRJWLfREiRLplRZ9BJJ+qjwuDLODPF8pXEjBf/v1BPE7fb73X
	 Uxd4yHQwAk0WsgPLKES18yht5HKDcCMlS1BLqU4hdWc36ZZVKy/BckWXVG2FP32bTC
	 5ZMSWseQJHC7f4sz5tryxrsODwo9Nso5HkTrtRLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18A9CF801F5; Thu, 27 Jul 2023 17:53:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3E91F800D2;
	Thu, 27 Jul 2023 17:53:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 671A0F8019B; Thu, 27 Jul 2023 11:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out-113.mta0.migadu.com (out-113.mta0.migadu.com
 [91.218.175.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D3FEF80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 11:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D3FEF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=T298/Bwh
Date: Thu, 27 Jul 2023 19:50:36 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1690451455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tpGulMNGBLGeCQsQWgv21Wi66CtJAGM5/rQdNeGYsjk=;
	b=T298/BwhHCdJVHBlfM6PVWLwOt80cn2rGyCcxgdCQ6KysXhzJdQ1dV3DRe/cbt1nmcJLaY
	dRZRQITmJX4FXoI2L4w89dmtjTyhVh6QqnQ5aCELttROQKKMLZWOm4gXTERY7qcNIf94ie
	g7at2lL6PRWvXkLK9WhJSw9g/bg4dn+zf22UuiGcZHIAeB73sVfh9eKjEGo8+eDQhZFUnX
	UQX3jyUsVRM/B+si6VZ1foMb0XXXDDAduG2dpbXXHoAHsLZY5w3MeHnBatB0K56Z7MbZYk
	MaG8J5TAfuFAp0o3DUG5fcI+H5RW5JLePVB8mFeGBs2QuM8qC6Lhx/TONmOP0w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: How do I set up multiple codecs on one I2S - without TDM?
Message-ID: <ZMI97Pk0giYpLFdv@titan>
References: <ZMBRMnv0GQF4wyfQ@titan>
 <c2f5a9ec-2927-f9bf-86a1-3388d0bac015@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2f5a9ec-2927-f9bf-86a1-3388d0bac015@linux.intel.com>
X-Migadu-Flow: FLOW_OUT
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NJLNSEPZUCWRKB7VMSJW4ASQNWDBRROQ
X-Message-ID-Hash: NJLNSEPZUCWRKB7VMSJW4ASQNWDBRROQ
X-Mailman-Approved-At: Thu, 27 Jul 2023 15:52:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJLNSEPZUCWRKB7VMSJW4ASQNWDBRROQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 27, 2023 at 11:45:01AM +0200, Pierre-Louis Bossart wrote:
> On 7/26/23 12:48 AM, John Watts wrote:
> > Hello there!
> > 
> > I have an interesting problem that I'm trying to solve. It will require
> > writing adding driver support but right now I'm struggling to understand
> > how I should go about it all.
> > 
> > As a background, this is with the Allwinner D1 or T113. It has a 16
> > channel I2S controller and each channel can be configured to use a
> > specific pin and TDM time slice. Even channels are low LRCLK, odd are
> > high LRCLK.
> > 
> > So for my situation I want to have six channels:
> > 
> > - Channel 0: Timeslot 0, Pin 0, LRCLK 0 -> ADC 1
> > - Channel 1: Timeslot 0, Pin 0, LRCLK 1 -> ADC 1
> > - Channel 2: Timeslot 0, Pin 1, LRCLK 0 -> ADC 2
> > - Channel 3: Timeslot 0, Pin 1, LRCLK 1 -> ADC 2
> > - Channel 4: Timeslot 0, Pin 2, LRCLK 0 -> ADC 3
> > - Channel 5: Timeslot 0, Pin 2, LRCLK 1 -> ADC 3
> 
> It would help if you described what those different 'channels' are supposed
> to transmit. Usually channels mean a group of data that is rendered at the
> same time. It looks like you plan on transmitting independent streams that
> may be enabled/disabled separately.
> 
> Also you should describe if there are independent clocks or if all those 6
> 'channels' are transmitted with a single pair of bit/frame clocks? That
> completely changes the model, in the former case you could represent
> independent DAIs/dailinks but in the latter case you really have a single
> muxed stream.

Hello,

These channels are intended for measuring vibration at various points in a
vehicle. Each channel is a vibration measurement.

These all use the same I2S clock, multiplexing is handled by having each ADC
connected to a different I2S pin.

John.
