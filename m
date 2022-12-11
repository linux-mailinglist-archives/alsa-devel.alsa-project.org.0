Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 372876494DB
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Dec 2022 16:31:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFFD52A2A;
	Sun, 11 Dec 2022 16:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFFD52A2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670772679;
	bh=eWcuyXppyoYuG0/YcueVfx3MnNabcf94XJxodFbnxDo=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3fqYvQbQtbuQcWFSbU3ujMko8DIbzmdxANM199beKC8Y0ZrLH7IDwgUGGY6tkB54
	 erjdbCEP5or7VFjiV4syZ6Ze6mEmMfrHyL6YFIBUof/3dmbuCAvsO44Hkh4DEt+mMZ
	 kflHmCxkruF8/1pIn68GqehChv/6361NbsBFc4P8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63B8DF80149;
	Sun, 11 Dec 2022 16:30:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C0CAF80245; Sun, 11 Dec 2022 16:30:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mailout08.hostingdiscounter.nl (mailout08.hostingdiscounter.nl
 [91.217.57.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1D38F80149
 for <alsa-devel@alsa-project.org>; Sun, 11 Dec 2022 16:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1D38F80149
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=veniogames.com header.i=@veniogames.com
 header.a=rsa-sha256 header.s=default header.b=AjiJRVV4
Received: from localhost (localhost [127.0.0.1])
 by mailout08.hostingdiscounter.nl (Postfix) with ESMTP id 034C73AF
 for <alsa-devel@alsa-project.org>; Sun, 11 Dec 2022 16:30:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mailout08.hostingdiscounter.nl
Received: from mailout08.hostingdiscounter.nl ([127.0.0.1])
 by localhost (mailout08.hostingdiscounter.nl [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id PMsgEf1cBJww for <alsa-devel@alsa-project.org>;
 Sun, 11 Dec 2022 16:30:12 +0100 (CET)
Received: from mail201.hostingdiscounter.nl (mail201.hostingdiscounter.nl
 [IPv6:2a00:1478:20:0:5:18:0:1])
 by mailout08.hostingdiscounter.nl (Postfix) with ESMTPS
 for <alsa-devel@alsa-project.org>; Sun, 11 Dec 2022 16:30:12 +0100 (CET)
Received: from [192.168.1.105] (250-170-250-62.ftth.glasoperator.nl
 [62.250.170.250])
 by mail201.hostingdiscounter.nl (Postfix) with ESMTPSA id 5882B481A7
 for <alsa-devel@alsa-project.org>; Sun, 11 Dec 2022 16:30:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veniogames.com;
 s=default; t=1670772612;
 bh=anO8YyUHRoVRfn5BYwvWWrI1jY+eYM/MnXYvbqWulLI=;
 h=Date:Subject:From:To:References:In-Reply-To:From;
 b=AjiJRVV4xyzUsJo+lh0Ul0tk4RT47eheKkrgOTCS156rke2rO6I8ghYQU5oDC/g6A
 DQ1JDfDNCxSJBBWRsUPVoF9Kc4R52D94VV7B4gCgq4wz8ZsWZqRTbKwlFvsDWaw0P8
 dMhwNDDJkNRBjVO72OqBeK1foXJzmtPoqAq1deP+GNThJbfgnSMzLAjGJRgHecH+to
 8xF23b7frbU8IC4DvlQK4UAR742kUURCRPRIBCgEREkxC6TM+yCn27J8kxu/dX00vY
 LzCPkppHiaa2majpzG7CTuXPJS5YUGSUhcet28QnzA5624Zmtu0icyL5rgBpu8I2W/
 41uP0IHp3671g==
Message-ID: <9da2f631-4b45-9c5e-4349-488eea9436aa@veniogames.com>
Date: Sun, 11 Dec 2022 16:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Regression playing 24bit/96kHz audio on USB audio interface
 between 5.10.94 and 5.15.21
From: Ruud van Asseldonk <ruud@veniogames.com>
To: alsa-devel@alsa-project.org
References: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
Content-Language: nl
In-Reply-To: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

Hi all,

This issue is still present in 5.15.82, is there anything I can do to 
diagnose this further?

Best,

Ruud van Asseldonk

> Hi,
> 
> I have a program that configures a Behringer UMC404HD 192k USB audio 
> interface for playback as follows (pseudocode):
> 
>    snd_pcm_hw_params_set_channels(pcm, hwp, 2);
>    snd_pcm_hw_params_set_format(pcm, hwp, SND_PCM_FORMAT_S24_3LE);
>    snd_pcm_hw_params_set_access(pcm, hwp, SND_PCM_ACCESS_MMAP_INTERLEAVED);
>    snd_pcm_hw_params_set_rate(pcm, hwp, val=96000, dir=0);
>    snd_pcm_hw_params_set_period_size_near(pcm, hwp, val=513, dir=0);
>    // If I confirm at this point with snd_pcm_hw_params_get_period_size,
>    // I get back 513.
>    snd_pcm_hw_params_set_buffer_size_near(pcm, hwp, val=2052);
>    snd_pcm_hw_params(pcm, hwp);
>    // If I confirm with snd_pcm_hw_params_get_buffer_size,
>    // I get back 2052.
> 
> On Linux 5.10.94 (specifically Arch Linux ARM package 
> linux-rpi-5.10.94-1), this succeeds, and I can play back audio just 
> fine. On 5.15.21 (specifically linux-rpi-5.15.21-3), all the calls 
> succeed apart from the last one, which returns EINVAL.
> 
> (My actual program is written in Rust and uses a Rust wrapper library 
> for libasound, https://docs.rs/alsa/0.6.0/alsa/, but the calls should be 
> the ones listed.)
> 
> I confirmed with snd_pcm_hw_params_test_format that the S24_3LE format 
> is supported. On both kernels it is successful. I confirmed with 
> snd_pcm_hw_params_test_rate that 96 kHz is supported. On both kernels it 
> is successful. There are differences though. When I query these:
> 
>    snd_pcm_hw_params_get_period_size_min
>    snd_pcm_hw_params_get_period_size_max
>    snd_pcm_hw_params_get_buffer_size_min
>    snd_pcm_hw_params_get_buffer_size_max
> 
> Then on 5.10.94 (the good version), I get:
> 
>    period size min/max: 12/32768, buffer size min/max: 24/65536
> 
> But on 5.15.21 (the bad version), I get:
> 
>    period size min/max: 13/71332, buffer size min/max: 26/142663
> 
> Also, after I set the period size to 513, if I then query the buffer 
> size min/max, on 5.10.94 I get:
> 
>    buffer size min/max: 1026/65536
> 
> But on 5.15.21 I get:
> 
>    buffer size min/max: 1027/142663
> 
> In lsmod, snd_usb_audio shows up, and from lsusb -v, the UMC404HD 
> appears to be a standard USB audio interface. The lsusb output is 
> identical on both kernels.
> 
> Please let me know if there is anything I can do to help further 
> diagnose the issue, or if I should report this elsewhere.
> 
> Kind regards,
> Ruud van Asseldonk
