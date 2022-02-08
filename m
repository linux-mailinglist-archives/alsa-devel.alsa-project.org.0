Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2DF4AE32A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 23:01:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 581051801;
	Tue,  8 Feb 2022 23:00:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 581051801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644357660;
	bh=L4CWDbnZT5NX2rwnTpscurq9ee75Es4BdMZ2oJM35Ec=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d3QNgO6wXB/hMLfNlGgoTh9FWCJ6xKPHOZz3bLbuOpVXf6tz1jZcekFuHrHQi+pTD
	 UzDDIGYi+9mrtJ1h1aMxDGI54QdQg1DAlzQ8LiUq2qohtJIVmjmA1xu+n7SPu0QoN8
	 R9k9hHqyo+dTfN6hERIxclLzDrTReZmwjiIRiRps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8EF2F80154;
	Tue,  8 Feb 2022 22:59:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AAADF800F0; Tue,  8 Feb 2022 22:59:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E93F9F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 22:59:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E93F9F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZOGs9qjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644357588; x=1675893588;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=L4CWDbnZT5NX2rwnTpscurq9ee75Es4BdMZ2oJM35Ec=;
 b=ZOGs9qjfbHffWfdWQVjahiPLEUXB9/AxgSD9cFrDCIftyGzYWoK14r6e
 AP0KnAcNznh77kxyapJ4jIGCM2ec3TDTZmVhIyweRmjMG4zh4GHLDhD1F
 kMC+y1Zouh4E1cPUUTicAGPBbzjzrFy6LyaXwhUusuV+0VZlEEmP4qppP
 O2Fm5S0UC2Nrmska2NTK/1cMDEWoE8VKebFzCTPw2I3x/nanccr896svJ
 I4D1hPp7ckWIOPABQ5j2im+1oCR0ejodbz9fZhxPTowrOJV9tGfrBBS86
 thLPmfAzXmuzpClN5rOwRCH20wnwi6/3QJ/fm+h+wG5EsUGa8B7UAoIRT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249009241"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="249009241"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:59:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="499720110"
Received: from anaygan-mobl1.amr.corp.intel.com (HELO [10.209.155.254])
 ([10.209.155.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:59:41 -0800
Message-ID: <209270c3-4a46-d6a1-0f1d-d4400ecc5962@linux.intel.com>
Date: Tue, 8 Feb 2022 15:55:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel driver
Content-Language: en-US
To: dmummenschanz@web.de, alsa-devel@alsa-project.org
References: <trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22>
Content-Type: text/plain; charset=UTF-8
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



On 2/8/22 12:46, dmummenschanz@web.de wrote:
>    Hello,
> 
>    the audio chip Cannon Lake PCH cAVS ALC892 does not get recognized on
>    my system. Only the HDMI devices are recognized.
> 
>    lspci shows the following audio device:
>    00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
> 
>    dmesg only shows:
> 
>    [  189.559786] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops
>    i915_exit [i915])
>    [  189.581395] input: HDA Intel PCH HDMI/DP,pcm=3 as
>    /devices/pci0000:00/0000:00:1f.3/sound/card0/input20
>    [  189.581503] input: HDA Intel PCH HDMI/DP,pcm=7 as
>    /devices/pci0000:00/0000:00:1f.3/sound/card0/input21
>    [  189.581628] input: HDA Intel PCH HDMI/DP,pcm=8 as
>    /devices/pci0000:00/0000:00:1f.3/sound/card0/input22
>    [  189.581711] input: HDA Intel PCH HDMI/DP,pcm=9 as
>    /devices/pci0000:00/0000:00:1f.3/sound/card0/input23
>    [  189.581849] input: HDA Intel PCH HDMI/DP,pcm=10 as
>    /devices/pci0000:00/0000:00:1f.3/sound/card0/input24
> 
> 
>    ALSA-info file:
>    http://alsa-project.org/db/?f=96102ee84f258d1cac83ed33795356550181511c

I see to references to ALC892 in this profile, is this information based
on the hardware specs or Windows logs?

we usually ask people to try with a more recent kernel, but in your case
I would try to go back to a mainline release. I have no idea what this
version might contain audio-wise: 5.17.0-rc3-drmtip

> 
>    There is a workaround availble:
> 
>    echo auto | tee /sys/devices/pci0000\:00/0000\:00\:1f.3/power/control
>    echo 1 | tee /sys/devices/pci0000\:00/0000\:00\:1f.3/remove
>    echo 1 | tee /sys/bus/pci/rescan
> 
>    unfortunately this doesn't work for me. The device never shows up.
>    Sound on winX works fine on this device btw.
>    I'm happy to assist with any attempts to make the sound work.
