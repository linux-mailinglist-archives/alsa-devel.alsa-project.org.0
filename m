Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA7BACC7E
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 13:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE451664;
	Sun,  8 Sep 2019 13:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE451664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567943425;
	bh=Yy1Q7yIgsl1gpT2KXgffuOV0tWQ9qwcdAh6h6q4dZ84=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XB5uvMwSV1pNQepPRmDsx1ngk5ya/nrpfMtuiOV5v4J2TtAF9ks62XrzsFlN5Vt07
	 9eTCDLDRup0QHvXk11/xZj+ipMqZ5Y+qiHWhL6d0cwiIiJ8QFzefnuOiyXgBtVQvNp
	 vO9TeOQRODV1GqkGuBuUP+xsI6lsYrR6j1O3QbdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53A75F80393;
	Sun,  8 Sep 2019 13:48:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A14D3F80368; Sun,  8 Sep 2019 13:48:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DD08F800E6
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 13:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DD08F800E6
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 081218E914
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 11:48:30 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id c2so6373412edy.18
 for <alsa-devel@alsa-project.org>; Sun, 08 Sep 2019 04:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5ROWExQAwKEAQpXfy3PGF4rIueo69LoNnSQqQXfgCJ4=;
 b=V5LA8DETBTIo8Qej1Lke319u1idxhd4/7TTZGwdNjINld8Ewo8N3pHURj3kuD+XOmE
 FeEZfRSX9vM9OAhDVYvCr+CD/Lz710NgKkwgfa8RXgNQo8odFOu6cAHOZCGTeq/K0DeV
 XwYcd46UCkTu+1L5W99dWgGxtCiUrNbLv1joWjCzvOZgwdEC8kvt+IeF7hhRo62o5t6g
 ZGIKsaVEpHv2lDaBsJyxDzLoSK4meIuNYhUXIMt6n8NAOFbXS5otZg9gy+PN8vE209Op
 J04VywF5WsIC5tmY5TbMAVHgHX1bH1uT2Hb7b4wnFT+aT/YxIy4RaWAxGQkB4r4z1k2P
 DSMQ==
X-Gm-Message-State: APjAAAVrOZNdn6uxmSIkL+NfHOsaD6/5bCyzq+uidKoPcmiHpK6zFs0+
 34a9ILRNgNQjpi2opZMY0DJQDU9MYccLtO90maveDJHYnp9CEiaB152evdtifeSjbFNi4BeZsT0
 m5kGuWc054LwOljDKQY9nxdc=
X-Received: by 2002:a50:b885:: with SMTP id l5mr18405418ede.190.1567943308342; 
 Sun, 08 Sep 2019 04:48:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzV0cjvThQ/0UZrF0oJOgjfHhv+kIR2C7zYJPlydeW/PNs3TTAjMup79Cp0vx5akUNOtVraSw==
X-Received: by 2002:a50:b885:: with SMTP id l5mr18405413ede.190.1567943308124; 
 Sun, 08 Sep 2019 04:48:28 -0700 (PDT)
Received: from localhost.localdomain ([217.166.243.205])
 by smtp.gmail.com with ESMTPSA id b53sm2266318ede.96.2019.09.08.04.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Sep 2019 04:48:27 -0700 (PDT)
To: Jaroslav Kysela <jkysela@redhat.com>
References: <15679391594432724-alsa-devel@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ef6f9a5e-0650-aa1b-42cf-4c1db75731f2@redhat.com>
Date: Sun, 8 Sep 2019 13:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <15679391594432724-alsa-devel@perex.cz>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commits (Hans
 de Goede: 30 total)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 9/8/19 12:39 PM, Jaroslav Kysela wrote:
> As discussed, we would like to move the UCM configuration files from the
> alsa-lib repository to new alsa-ucm-conf repository with the licence change
> from LGPL-2.1 to BSD-3-Clause.
> 
> I would like to check, if you agree with this licence change. Please, answer
> to this e-mail and write your agreement / disagreement (keep CC to
> the alsa-devel mailing list for the archiving purposes).

I agree with changing the license to BSD-3-Clause.

Regards,

Hans


> 
> Thank you for your time and co-operation.
> 
> Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html
> 
> List of your commit(s):
> 
>    60ed28999a272e1a3d737a9eeee0719b98efd447
>      conf/ucm: Add chtrt5645-mono-speaker-analog-mic configuration
>    76bc53e69a12163a86e6746fd3011de6b1652043
>      conf/ucm: chtrt5645: Fix recording from internal analog microphone
>    c22a7f423ddef2a1376bc84f2aafc0a167192ab6
>      conf/ucm: chtrt5645: At config for the Asus T100HA
>    5a2df9449d0b17e3579bde60ba48244ba24ea604
>      conf/ucm: chtrt5645: At config for the Lenovo Ideapad Miix 320
>    0f6f2a854f27b5dc10b73b3c84d272a3ebcbd8bc
>      conf/ucm: bytcr-rt5640: Add generic bytcr-rt5640 UCM profile
>    a5343f6fb66d7572793af330d1f710a17830bc9e
>      conf/ucm: bytcr-rt5640: Add long-name UCM profiles
>    642b360add63a2e31c782b1820f180e36f8cf2bb
>      conf/ucm: bytcr-rt5640: Add default DisableSequence
>    f3b26e3b8d60642d95466ce6554d18a0d9e3952a
>      conf/ucm: chtnau8824: Add UCM profile for chtnau8824 boards
>    e6754783f73ba31a4457335e15b38493607f3b3b
>      conf/ucm: chtnau8824: Add Cube iWork8 Air and Pipo W2S specific profiles
>    42ab655cbe3d65b046bb224e8ffc7605583197fc
>      conf/ucm: bytcr-rt5645: Use the generic bytcr/PlatformEnableSeq.conf
>    bdd3d24ae92dd080eb2f6856bf04b443afc3709f
>      conf/ucm: bytcr-rt5651: Do not use both DAC1 and HPVOL inputs for HP
>    3d284a78ee19c9aa1cdaf60e3e5a6ad0b15d74b2
>      conf/ucm: bytcr-rt5651: Configure all volumes at 0dB
>    1a08334d83eec663bca3572da61c323ae8ee1375
>      conf/ucm: bytcr-rt5651: Start with all outputs and inputs disabled
>    0471cc87377d8836bd14566f885b5d01888b6b32
>      conf/ucm: bytcr-rt5651: Change Speaker/Headphone en/disable sequences to fix switching
>    1bcb531923929807eb16625d8a62deb128c88d04
>      conf/ucm: bytcr-rt5651: Use generic SSP enable + disable sequence, support SSP0
>    04c6ac2502a15d60e5d29ae89e9263cd5a518220
>      conf/ucm: bytcr-rt5651: Fix ADC and Mic capture volumes
>    faab50afa9cfc74153b894e1b1fe71ce8bfd4673
>      conf/ucm: bytcr-rt5651: Add support for mic input on various pins
>    5c8be23b891c30f8706d228121ba3d8a5999d607
>      conf/ucm: bytcr-rt5651: Split into 1 .conf file per input / output
>    5b39b6b16e231bd320c3c0abd6ebd5bf645a36fd
>      conf/ucm: bytcr-rt5651: Add mono speaker output profile
>    bd770a44b21685b9b10a94209d1261cabc757b01
>      conf/ucm: bytcr-rt5651: Add long-name UCM profiles
>    be91b595f814077cbfa8a9de526db6ecfbb2f57b
>      conf/ucm: bytcr-rt5651: Add bytcr-rt5651-mono-spk-in2-mic-hp-swapped config
>    040cfea1778a06e2e0e0a73a3e580b5a2c19ecb4
>      conf/ucm: bytcr-rt5640: Improve human readable input/output names
>    d827856fca4541617f5c699223f17435f8789671
>      conf/ucm: bytcr-rt5651: Enable Stereo? ADC MIXL ADC? switches when enabling inputs
>    606350a726191f8b40c52fa0520f8642945c79fd
>      conf/ucm: bytcr-rt5651: Add support for a headset-mic on IN2
>    8f4e5d0da2613584d0469ed417a614ed54acaa2a
>      conf/ucm: bytcr-rt5651: Add digital mic support
>    ce674664d2e0fd02bcbd605bfbbf4a356489175a
>      conf/ucm: bytcr-rt5651: Add bytcr-rt5651-stereo-spk-dmic-mic config
>    15ccbf303d2724c3633c1056cc526367a6c5ea3f
>      conf/ucm: bytcr-rt5651: Document mono speaker wiring
>    506cca6eaa01ceb2377a17f202bb2ca9d626de35
>      conf/ucm: Add UCM profile for bytcht-es8316 boards
>    f664a7aec9a249503e8523c6d830f60e3eb77cf6
>      conf/ucm: bytcht-es8316: Add long-name UCM profiles
>    4d9374e61d23a5fc219ec172fe9613017f9ae79c
>      ucm: bytcr/PlatformEnableSeq.conf update some comments
> 
> ---
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
