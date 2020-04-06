Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7471619F115
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 09:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C73482E;
	Mon,  6 Apr 2020 09:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C73482E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586159010;
	bh=Wk1UZCDn47GUBwXyGGnVV2ZWXh6NRd3/A4dBhXyebzw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uotrtvssfeAipRuAsm2TBajxR/j7HG84TzXVv2hWg32MPfRwc63R+mj5047c9t9w7
	 TUmz/b5x7nZ4u7zFO/sJ6Smxi2SfaCVYUj7utoPpl+9UgUOTuKsn46DhKypwZBfeTI
	 4NmFF92CzYbOfWpavxWwP42TJn/U5rXW4wpmtuQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11989F80150;
	Mon,  6 Apr 2020 09:42:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3985F80150; Mon,  6 Apr 2020 09:42:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2CB6F80142
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 09:42:32 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6D92CA0042;
 Mon,  6 Apr 2020 09:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6D92CA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1586158952; bh=OZ/5yJse24rRl7sW9OA3yrc10KP6SBDMOloFMyDvG6U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ehNmD8yGnRNJrm+11RGXHjFahNIRvZkCZhwBuaVnoLtZMJzfecuY6+m1Juzd2yWKV
 kvq7rVmNyQ8SY5JFB+VEkr2d10dbka2TLzFqi0p7YHlcftDYJSa9GkYSmd5966+cwM
 pwHOjlJDMg2y40vaStDtUESu5yvD+Ycq0KCvqfag=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  6 Apr 2020 09:42:30 +0200 (CEST)
Subject: Re: [PATCH 4/5] chtrt5645: Remove bogus JackHWMute settings
To: Hans de Goede <hdegoede@redhat.com>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-4-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f0a6efd3-f099-d622-1dd7-3ad83dafaa0d@perex.cz>
Date: Mon, 6 Apr 2020 09:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
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

Dne 05. 04. 20 v 20:34 Hans de Goede napsal(a):
> There is no reason why the internal microphone or speakers cannot
> be used when a headset is plugged in.
> 
> The jack does not physically disconnect these, so the JackHWMute settings
> are wrong, remove them.
> 
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

Applied. Thanks.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
