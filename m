Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE277648D2
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 09:37:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2478820;
	Thu, 27 Jul 2023 09:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2478820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690443474;
	bh=LgeMHA6oKPUvuLG2EmXJcP0J7ixsc0/ixubxmz26tzQ=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tp/TrIgiugSqT3BG4bnB3DxE3qH+7IlJ2KJEPMI4g76AI5trIaVzDHPTmAJl27268
	 gctJe1dUt1IeqEgHuISoBQnYRzoJvTT42nRHoU/PivSOMRQOwygUN1w8Nzxaohdjpw
	 mvJd0NEx2gYkrnzzy92uss71gFNx5Z25RamkUBYg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC2B3F80544; Thu, 27 Jul 2023 09:37:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C131BF80163;
	Thu, 27 Jul 2023 09:37:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D3CF8019B; Wed, 26 Jul 2023 00:50:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out-17.mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25398F80149
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 00:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25398F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=v46hsXf1
Date: Wed, 26 Jul 2023 08:48:18 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1690325407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=TkrjGMGP0WkP/3Kq5VF0Jg0B8f96Y+GRQVOPVNkz1Qo=;
	b=v46hsXf1d9jTbLxer6pGDWCFm7Gzt7H9w2VkphVt+MOKbwXv6uj7NmU5g+z1sF7isVCZRm
	1WkMk6TmgKNGm0eA8MncDDW2rk/ikrQodrx+gBqSOelX0TbloG/r9g5X5J9wvFHvMLz2Ga
	P2XhKLXmx7bQeRo5GG6B4IJLnzmCkAUx7aNXtZWOYnoE/98iHcDRURhAh61seLvcTS6iKB
	O31GjA5AfFYINmYdPpidJM7tXR6DauwWmjb24P3iw0YlqSm8qNSd0GPOrvTMKR5p4oVDBb
	BseF46lme+WQdyTuAobsXTWghVRE3a66i2nE65I3tR1txYw7yUA+r04Va6FXxg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Subject: How do I set up multiple codecs on one I2S - without TDM?
Message-ID: <ZMBRMnv0GQF4wyfQ@titan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R7GMDS6OWWENLDUI4226ZKQCSFT27SEZ
X-Message-ID-Hash: R7GMDS6OWWENLDUI4226ZKQCSFT27SEZ
X-Mailman-Approved-At: Thu, 27 Jul 2023 07:36:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7GMDS6OWWENLDUI4226ZKQCSFT27SEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello there!

I have an interesting problem that I'm trying to solve. It will require
writing adding driver support but right now I'm struggling to understand
how I should go about it all.

As a background, this is with the Allwinner D1 or T113. It has a 16
channel I2S controller and each channel can be configured to use a
specific pin and TDM time slice. Even channels are low LRCLK, odd are
high LRCLK.

So for my situation I want to have six channels:

- Channel 0: Timeslot 0, Pin 0, LRCLK 0 -> ADC 1
- Channel 1: Timeslot 0, Pin 0, LRCLK 1 -> ADC 1
- Channel 2: Timeslot 0, Pin 1, LRCLK 0 -> ADC 2
- Channel 3: Timeslot 0, Pin 1, LRCLK 1 -> ADC 2
- Channel 4: Timeslot 0, Pin 2, LRCLK 0 -> ADC 3
- Channel 5: Timeslot 0, Pin 2, LRCLK 1 -> ADC 3

These ADCs are WM8782s, completely TDM unaware. If they were TDM aware
then I could run even more ADCs by having multiple separate TDMs going
on each pin.

I have tried to look online for I2S controllers that do the same thing
but haven't had much luck. The current driver for this controller only
supports TDM. So I will have to add support for this.

So my questions are: 
- How do I express this in terms of ALSA and sound card concepts?
- How do I express this in the device tree?

My immediate thought is that this is a situation where I have a card
with 3 dai-links between the I2S controller and each separate codec.
I have written this tree as a test:

    wm8782_1: stereo-adc {
    	compatible = "wlf,wm8782";
    	Vdda-supply = <&reg_vcc>;
    	Vdd-supply = <&reg_vcc>;
    	#sound-dai-cells = <0>;
    };
    
    wm8782_2: stereo-adc {
    	compatible = "wlf,wm8782";
    	Vdda-supply = <&reg_vcc>;
    	Vdd-supply = <&reg_vcc>;
    	#sound-dai-cells = <0>;
    };
    
    wm8782_3: stereo-adc {
    	compatible = "wlf,wm8782";
    	Vdda-supply = <&reg_vcc>;
    	Vdd-supply = <&reg_vcc>;
    	#sound-dai-cells = <0>;
    };
    
    sound {
    	compatible = "simple-audio-card";
    	simple-audio-card,name = "Testcard In";
    	simple-audio-card,format = "i2s";
    	simple-audio-card,bitclock-master = <&sound_cpu>;
    	simple-audio-card,frame-master = <&sound_cpu>;
    	simple-audio-card,mclk-fs = <128>;
    	#address-cells = <1>;
    	#size-cells = <0>;
    	simple-audio-card,dai-link@0 {
    		reg = <0>;
    		sound_cpu: cpu {
    			sound-dai = <&i2s2>;
    		};
    		codec {
    			sound-dai = <&wm8782_1>;
    		};
    	};
    	simple-audio-card,dai-link@1 {
    		reg = <1>;
    		cpu {
    			sound-dai = <&i2s2>;
    		};
    		codec {
    			sound-dai = <&wm8782_2>;
    		};
    	};
    	simple-audio-card,dai-link@2 {
    		reg = <2>;
    		cpu {
    			sound-dai = <&i2s2>;
    		};
    		codec {
    			sound-dai = <&wm8782_3>;
    		};
    	};
    };

But I get this kernel error:

    kobject_add_internal failed for 2034000.i2s-wm8782 with -EEXIST, don't try to register things with the same name
    asoc-simple-card: probe of sound failed with error -12

The WM8782 doesn't support TDM or multiplexing so I'm not exactly sure
if this is correct behaviour or my mistake configuring.

I tried adding TDM nodes which didn't help.

I also tried having a single link with multiple codecs on sound-dai
which did create a sound card but it was unclear to me if this was
ignoring the other codecs I had listed or not.

I also can't test this at this point as the sunxi codec driver assumes
that the number of channels is equal to TDM slots, which isn't true any
more.

Any pointers in the right direction would be a huge help.
Surely someone else has had this problem.

Thanks,
John.
