Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25C4E7A4A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 19:45:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DCEB16AB;
	Fri, 25 Mar 2022 19:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DCEB16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648233951;
	bh=M7dVrXnV+PMVCtzL4NZHeqty8OcjP/lUIVSyPOfCOqI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X5ziOOfKqbtfoyLBxxshFUJaHsSwAN9/B8//mjFAH3QDP7/cHEfi2315JIPKxIm8q
	 vI4lMGBKJrO8FPXo3h8H/X1h+lD8DE7PVhPHdvrYS4RevdyDsYnBxa5TlN1AlVyBuF
	 qeKlkXNIjZviBNomyeOMPnwpAFmzcdtXkMSG8IDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8767F80115;
	Fri, 25 Mar 2022 19:44:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD392F80162; Fri, 25 Mar 2022 19:44:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42275F800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 19:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42275F800F4
Received: by mail-ej1-f53.google.com with SMTP id bi12so17120866ejb.3
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 11:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UzIVRd1Kc8P6PiaoT+wC6AqMyIQsK4C2hvy4yYySj7s=;
 b=g8KE2UkYAJYv6ygBF6gYujGNFMOz+a++HzueeC2T7ttC85oKBdk65hrD60Z1SRTgLi
 G1wu5nVj0Op2lBJ5UNpdFs+X5fHT4tVq1eYJhu5DY1R8u5TouTbW3bISx8j9wwMMrujS
 ZSfMOH/ZqBkgGYRXl42hdjhpuucDvAAyK9wu/VKfXMvLs/Yo5qawT05kSRceWv5JkmZI
 XxTdNEvwOMBkaaxWdtfJ3I18Niz8DAVAMUjMghAHZKmRmxmUch8yUCxXoVHLEkjXZPDa
 ZwHXotAQqtUAkknSemuwbCFRiaEQA6i4WOHp07/g5AFMOFx3Htk5NphWfud8QLvXlC0G
 KBcA==
X-Gm-Message-State: AOAM532QVDlyHREUcRsah25gaUMf2pgwrJ65urb43KLLMgKlgU8aHl28
 hmVi03/JpQWfMEaap6gsEF4=
X-Google-Smtp-Source: ABdhPJyFhblKMCSgf2oGabK22m+djFjB7qNxt2cuzfQF/9rVgpAfky3yK2v3OEdqIK8IhQmjRovtig==
X-Received: by 2002:a17:906:7714:b0:6ba:8a6a:b464 with SMTP id
 q20-20020a170906771400b006ba8a6ab464mr12991783ejm.613.1648233873730; 
 Fri, 25 Mar 2022 11:44:33 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 f6-20020a0564021e8600b00412ae7fda95sm3199030edf.44.2022.03.25.11.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 11:44:33 -0700 (PDT)
Message-ID: <6f2a3a99-0727-cf72-d512-332ca5731568@kernel.org>
Date: Fri, 25 Mar 2022 19:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 3/3] sound: usb: Exynos usb audio offloading driver
Content-Language: en-US
To: Oh Eomji <eomji.oh@samsung.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1648109444-196321-1-git-send-email-eomji.oh@samsung.com>
 <CGME20220324081350epcas2p227458cb1b530f04a9990bcfc8c3b5703@epcas2p2.samsung.com>
 <1648109444-196321-4-git-send-email-eomji.oh@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <1648109444-196321-4-git-send-email-eomji.oh@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Pavel Skripkin <paskripkin@gmail.com>, alsa-devel@alsa-project.org,
 open list <linux-kernel@vger.kernel.org>, Leon Romanovsky <leon@kernel.org>
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

On 24/03/2022 09:10, Oh Eomji wrote:
> This is for usb audio offloading. usb audio offloading processes usb
> audio stream data directly from the audio box even if ap usb enters
> suspend, there is no problem in stream data transmission. This obtains
> power saving effect while using usb audio device.
> 
> AP usb and audio usb f/w communicate via AUDIO IPC. By performing AUDIO
> IPC in the vendor operations, abox can access and control the xhci to
> transmit the data directly.
> 
> The types of commands and data delivered through AUDIO IPC include the
> following (AP USB <-> AUDIO USB f/w) :
> 1. usb audio connection/disconnection status
> 2. xhci memory information
> 3. full descriptor for usb audio device
> 4. UAC(usb audio class) control command
> 
> Signed-off-by: Oh Eomji <eomji.oh@samsung.com>
> ---
>  sound/usb/Kconfig            |   9 +
>  sound/usb/Makefile           |   2 +
>  sound/usb/exynos_usb_audio.c | 560 +++++++++++++++++++++++++++++++++++++++++++
>  sound/usb/exynos_usb_audio.h | 150 ++++++++++++
>  4 files changed, 721 insertions(+)
>  create mode 100644 sound/usb/exynos_usb_audio.c
>  create mode 100644 sound/usb/exynos_usb_audio.h

Similar pattern as XHCI submission - it looks like you do not work on
mainline kernel, but some other, private tree with other modifications.
It seems you created this series based on that private tree.

This is not the proper process.

Please rebase all your work on recent mainline kernel (v5.18-rc1,
linux-next) and work there.

Then you can start using get_maintainers.pl...

BTW, this v2, not v1, so please version it correctly. Add also changelog
to your series in cover letter.

Best regards,
Krzysztof
