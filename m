Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09C4699CF
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 16:01:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C312077;
	Mon,  6 Dec 2021 16:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C312077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638802888;
	bh=S1OPYNGU8wsLc0qLozjM2UeuV4M4KuphNPJqV69roaI=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hhOj1i5LP9IHx25LgH080kF8dtSx6Ljwex/VG3UPVf2TCivIdJOwFvd+fW0x8+4e3
	 jSrgHgRNwmk0FT3wyLLpp97w+DNyumozkrlRvSi9oxuZdw/Z0A35njtpi3qlBw60h2
	 p/H9buEWZMorMPyIlaKweADcHaXEZHWonWH/bYk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95EF0F804ED;
	Mon,  6 Dec 2021 16:00:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40664F804EC; Mon,  6 Dec 2021 16:00:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99E4EF80118
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 16:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99E4EF80118
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="224580921"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="224580921"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 06:59:58 -0800
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="479139240"
Received: from jcsee-mobl2.ccr.corp.intel.com (HELO [10.209.128.127])
 ([10.209.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 06:59:57 -0800
Subject: Re: Support for 8086:ae20 Intel Smart Sound Technology on Fujitsu
 Lifebook
To: Norbert Preining <norbert@preining.info>, alsa-devel@alsa-project.org
References: <Yat56SpjuUAxm2Gc@sakefilet.preining.info>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <94bfe11e-c774-4f9e-1cec-297fcedfef85@linux.intel.com>
Date: Mon, 6 Dec 2021 08:59:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yat56SpjuUAxm2Gc@sakefilet.preining.info>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



> today I realized that the built-in microphone (next to the webcam) 
> of my Fujitsu Lifebook U-series is not detected. (I usully use a
> headset, but due to travelling was forced to use the internal).
> 
> I tried hard to get this device working, but neither with my
> self-compiled kernel (5.15.6) nor the Debian kernel distribution kernel
> 5.15 the microphone seems to be detected.
> 
> I booted into Windows and tried to find out what the device might be. My
> **guess** is what is mentioned as
> 	Intel Smart Sound Technology
> with
> 	Vendor ID	8086
> 	Device ID	ae20
> I git grepped the kernel sources for this, and snd-hda-intel contains
> quite some mentioning about Vendor ID 8086, but ae20 is not appearing.

I checked in our internal sources and while I do see a 'DMIC_DEVICE_ID'
0xAE20, this is not related to PCI and that's not what is used to probe
a driver.

if you are looking at Windows, the string you want to look for starts
with 'CTLR_DEV_', not 'DEV_'

> Now the interesting thing is that booting into linux and using lspci and
> lsusb, I cannot see a single device with the above specifications:
> 
> lspci:
> root@sakefilet /usr/src/git/linux/Documentation # lspci

[...]

> 00:1f.3 Multimedia audio controller: Intel Corporation Comet Lake PCH-LP cAVS

This is the one you want details on. please share the results of:

cat /sys/bus/pci/devices/0000\:00\:1f.3/device
cat /sys/bus/pci/devices/0000\:00\:1f.3/class

and sudo lspci  -vvv -s 00:1f.3
