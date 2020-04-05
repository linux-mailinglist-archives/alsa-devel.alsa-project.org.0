Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1747B19EEB4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 01:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48031682;
	Mon,  6 Apr 2020 01:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48031682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586130825;
	bh=irrxEVtgN1yAh5zDPWAyddBvR6BlBzWnQc5QfukCMjM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dDJexOjCA4aWqP0iPm069X1/4I6rNTYsXA1PFu7bxj20laWqu6RxtQ2hQpUl2j7NY
	 wIseadq3VUcbl3y5sc0hLWNsP0FhtzCk3GmvyLnJC1rVc1P0u4Rp7kLdi/gkfkfU8k
	 LdC4uuem94UAWGOjnpSpJ2zhKE3iPxhzQBIaNpnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37BBEF80240;
	Mon,  6 Apr 2020 01:51:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 370A6F801D8; Mon,  6 Apr 2020 01:51:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C18C0F8015A
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 01:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C18C0F8015A
IronPort-SDR: SIZDlnjKVq9CO8RjdwTxkVJHKp8KnLUS6Vko/eZe1GtEXFephquDXBoBfqW6EcRCdDY8TKHQfA
 1uedNHaEe66w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2020 16:50:54 -0700
IronPort-SDR: hKvwIj+s9g1SH4j/zl6ZE97VMLWJSsE+llXvRRQOtO7LgGuEPMdhqiMk78iXMqSW80eatX9Ag2
 /T3bi17R4Zlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,349,1580803200"; d="scan'208";a="253949530"
Received: from tecook-mobl1.amr.corp.intel.com (HELO [10.212.185.245])
 ([10.212.185.245])
 by orsmga006.jf.intel.com with ESMTP; 05 Apr 2020 16:50:54 -0700
Subject: Re: [PATCH 4/5] chtrt5645: Remove bogus JackHWMute settings
To: Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-4-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d06f3894-6cd7-fd4e-2261-94505fc0db4a@linux.intel.com>
Date: Sun, 5 Apr 2020 18:22:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200405183454.34515-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 4/5/20 1:34 PM, Hans de Goede wrote:
> There is no reason why the internal microphone or speakers cannot
> be used when a headset is plugged in.
> 
> The jack does not physically disconnect these, so the JackHWMute settings
> are wrong, remove them.

Are you sure about the internal mic and headset input not conflicting? 
IIRC they use the same path after the initial routing selector. I may be 
wrong but I'd be surprised if you can use both.

Now that I think of it further, in case the SSP0 is used an I2S link is 
configured, so you cannot have both streams in parallel. It may be 
possible to use headset and dmic in parallel with the 4 slot version but 
we also have 1 PCM capture only.

So overall it seems rather unlikely that we can support dmic + headset 
mic in parallel?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   ucm2/chtrt5645/HiFi-dmic1.conf                   | 2 --
>   ucm2/chtrt5645/HiFi-dmic2.conf                   | 2 --
>   ucm2/chtrt5645/HiFi-mono-speaker-analog-mic.conf | 2 --
>   ucm2/chtrt5645/HiFi.conf                         | 2 --
>   4 files changed, 8 deletions(-)
> 
> diff --git a/ucm2/chtrt5645/HiFi-dmic1.conf b/ucm2/chtrt5645/HiFi-dmic1.conf
> index 1a8ee0a..c7e12c9 100644
> --- a/ucm2/chtrt5645/HiFi-dmic1.conf
> +++ b/ucm2/chtrt5645/HiFi-dmic1.conf
> @@ -50,7 +50,6 @@ SectionDevice."Headphones" {
>   		PlaybackPriority 200
>   		PlaybackPCM "hw:${CardId}"
>   		JackControl "Headphone Jack"
> -		JackHWMute "Speaker"
>   	}
>   
>   	ConflictingDevice [
> @@ -96,7 +95,6 @@ SectionDevice."Headset" {
>   		CapturePriority 200
>   		CapturePCM "hw:${CardId}"
>   		JackControl "Headset Mic Jack"
> -		JackHWMute "Mic"
>   	}
>   
>   	EnableSequence [
> diff --git a/ucm2/chtrt5645/HiFi-dmic2.conf b/ucm2/chtrt5645/HiFi-dmic2.conf
> index d3f880a..95fedb3 100644
> --- a/ucm2/chtrt5645/HiFi-dmic2.conf
> +++ b/ucm2/chtrt5645/HiFi-dmic2.conf
> @@ -50,7 +50,6 @@ SectionDevice."Headphones" {
>   		PlaybackPriority 200
>   		PlaybackPCM "hw:${CardId}"
>   		JackControl "Headphone Jack"
> -		JackHWMute "Speaker"
>   	}
>   
>   	ConflictingDevice [
> @@ -98,7 +97,6 @@ SectionDevice."Headset" {
>   		CapturePriority 200
>   		CapturePCM "hw:${CardId}"
>   		JackControl "Headset Mic Jack"
> -		JackHWMute "Mic"
>   	}
>   
>   	EnableSequence [
> diff --git a/ucm2/chtrt5645/HiFi-mono-speaker-analog-mic.conf b/ucm2/chtrt5645/HiFi-mono-speaker-analog-mic.conf
> index db866cd..f6180a4 100644
> --- a/ucm2/chtrt5645/HiFi-mono-speaker-analog-mic.conf
> +++ b/ucm2/chtrt5645/HiFi-mono-speaker-analog-mic.conf
> @@ -54,7 +54,6 @@ SectionDevice."Headphones" {
>   		PlaybackPriority 200
>   		PlaybackPCM "hw:${CardId}"
>   		JackControl "Headphone Jack"
> -		JackHWMute "Speaker"
>   	}
>   
>   	ConflictingDevice [
> @@ -84,7 +83,6 @@ SectionDevice."Headset" {
>   		CapturePriority 200
>   		CapturePCM "hw:${CardId}"
>   		JackControl "Headset Mic Jack"
> -		JackHWMute "Mic"
>   	}
>   
>   	EnableSequence [
> diff --git a/ucm2/chtrt5645/HiFi.conf b/ucm2/chtrt5645/HiFi.conf
> index 58468a8..116d456 100644
> --- a/ucm2/chtrt5645/HiFi.conf
> +++ b/ucm2/chtrt5645/HiFi.conf
> @@ -50,7 +50,6 @@ SectionDevice."Headphones" {
>   		PlaybackPriority 200
>   		PlaybackPCM "hw:${CardId}"
>   		JackControl "Headphone Jack"
> -		JackHWMute "Speaker"
>   	}
>   
>   	ConflictingDevice [
> @@ -76,7 +75,6 @@ SectionDevice."Headset" {
>   		CapturePriority 200
>   		CapturePCM "hw:${CardId}"
>   		JackControl "Headset Mic Jack"
> -		JackHWMute "Mic"
>   	}
>   
>   	EnableSequence [
> 
