Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB95105504
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 16:03:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FB431774;
	Thu, 21 Nov 2019 16:02:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FB431774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574348615;
	bh=tAZQce0K2LuWbaKo8T8aLKuA/PYNu91Z0WnF/NzOFX8=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HW19I61E6YIE3nJT0oiGoFPV26ToUS1pPP1lY7UChnYUZ8UV+LYUompKQqSf2pSHC
	 809gtZXt26Yn8eFNDZ1IZuvk0TRbXcd57Ya1IHAwsoeZtnEox3HbIyFX9kgXn0EGvy
	 C8BjcukgYa5Ih0yGgWwC7P/idZT8FvIFqbG6OtmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B88DCF80146;
	Thu, 21 Nov 2019 16:01:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E2A7F800C1; Thu, 21 Nov 2019 09:52:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE, 
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBAF9F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 09:52:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBAF9F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Zwd2wM57"
Received: by mail-wr1-x441.google.com with SMTP id z3so3337682wru.3
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 00:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:references:subject:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=QKWnAisNnQ/YaoLB7gxOTChTH+KFwv1xUA3EE5Egses=;
 b=Zwd2wM579ahYFbCOzUNkwmsY1JIH9wcO3kyBNtAOaoxmbUjBYk7mIqHMNQzR+ManlB
 O4T3nVzlLjEM8HNoqjmqpTrv+qVkYtDX5cpyDfSWtV0259BAsnFA9Rx1iBxIn0jWJI4h
 Sx/23oAacoFF5BtrqXWTS1eWGKp5Ksq77VR7q03zYrKyoe7BPUOFlR0WwELmlZmMmwCR
 ktMNLMk44WRuN8Ld01q71dfU7DJY9LRow6U2V5gccuIp/JKryOhXg1K/80rLw8Jt53mK
 OLno3Re16VozEv4VzRQgtnSEvM2/PRxb8C4TjWBYr206LgEvtD4kqgjc6R2B0AtlGe8t
 CzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:subject:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=QKWnAisNnQ/YaoLB7gxOTChTH+KFwv1xUA3EE5Egses=;
 b=WOhrZY9T1BiTcUaz+0/XWW3ZHtZvuMabEwi1YHeaLmyAU35GMMYHkmprLX4ECtuydu
 TEO/u/SM38WYp2pJIVagWoIfaU1UpXRXwzlNVK+X5I735d5A02iqDNsOMEa2nwZh1pQ1
 zRC3/1MFDJ+sN7+WTHCIM3rVJY4j9fEUf3HUvUkRBo+Mcqu8xiXFVcjfNI7hCxbkMpUR
 OE3qVGxGcRZvjwqpWOb0vTTcWldbqze1EY9smH/RWi+y2gizvW7JMPHRHrjYN5xw5GUX
 H8MLtc+SA0Lpk/1xDiUsBIlLAw9IbWhJjzoqmipwPZpSoX37+KLmIFWTKWSd9AO0FYBM
 nxyQ==
X-Gm-Message-State: APjAAAVCc7qVm6S08UNLRU61Go9BSKYkObthZ5crnHE6X6JVjPscaPeX
 DnO6p6b/Pq6KjQLR0k0pFmIOYh+K
X-Google-Smtp-Source: APXvYqz5NtNAaphuqLukgSQ9b+MfM5VC+VaGXTs6wKLQVq/YOc0popgr4niUBkP8/Sm+LI8wfRP0hA==
X-Received: by 2002:adf:8147:: with SMTP id 65mr9004399wrm.230.1574326331313; 
 Thu, 21 Nov 2019 00:52:11 -0800 (PST)
Received: from [192.168.1.113] ([91.106.123.186])
 by smtp.gmail.com with ESMTPSA id w13sm2419899wrm.8.2019.11.21.00.52.10
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 00:52:10 -0800 (PST)
To: alsa-devel@alsa-project.org
References: <20191111054133.GA1817@b4.vu>
From: Markus Schroetter <project.m.schroetter@gmail.com>
Message-ID: <861b90c8-8878-c3be-bc8e-769a3638cc14@gmail.com>
Date: Thu, 21 Nov 2019 09:52:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191111054133.GA1817@b4.vu>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 21 Nov 2019 16:01:49 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Fix Scarlett 6i6 Gen 2
 port data
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> The s6i6_gen2_info.ports[] array had the Mixer and PCM port type
> entries in the wrong place. Use designators to explicitly specify the
> array elements being set.
>
> Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
> Signed-off-by: Geoffrey D. Bennett <g at b4.vu <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>>
> Reported-by: Jonas Berlin <kernel at xkr47.space <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>>
> Tested-by: Alex Fellows <alex.fellows at gmail.com <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>>
Tested-by: Markus Schroetter <project.m.schroetter@gmail.com>
> ---
> Hi Takashi,
>
> Is there something special I need to do to mark this as a bug fix and
> request this go into 5.4?
>
> Thanks,
> Geoffrey.
>
>  sound/usb/mixer_scarlett_gen2.c | 36 ++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
> index 7d460b1f1735..94b903d95afa 100644
> --- a/sound/usb/mixer_scarlett_gen2.c
> +++ b/sound/usb/mixer_scarlett_gen2.c
> @@ -261,34 +261,34 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
>  	},
>  
>  	.ports = {
> -		{
> +		[SCARLETT2_PORT_TYPE_NONE] = {
>  			.id = 0x000,
>  			.num = { 1, 0, 8, 8, 8 },
>  			.src_descr = "Off",
>  			.src_num_offset = 0,
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
>  			.id = 0x080,
>  			.num = { 4, 4, 4, 4, 4 },
>  			.src_descr = "Analogue %d",
>  			.src_num_offset = 1,
>  			.dst_descr = "Analogue Output %02d Playback"
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_SPDIF] = {
>  			.id = 0x180,
>  			.num = { 2, 2, 2, 2, 2 },
>  			.src_descr = "S/PDIF %d",
>  			.src_num_offset = 1,
>  			.dst_descr = "S/PDIF Output %d Playback"
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_MIX] = {
>  			.id = 0x300,
>  			.num = { 10, 18, 18, 18, 18 },
>  			.src_descr = "Mix %c",
>  			.src_num_offset = 65,
>  			.dst_descr = "Mixer Input %02d Capture"
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_PCM] = {
>  			.id = 0x600,
>  			.num = { 6, 6, 6, 6, 6 },
>  			.src_descr = "PCM %d",
> @@ -317,44 +317,44 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
>  	},
>  
>  	.ports = {
> -		{
> +		[SCARLETT2_PORT_TYPE_NONE] = {
>  			.id = 0x000,
>  			.num = { 1, 0, 8, 8, 4 },
>  			.src_descr = "Off",
>  			.src_num_offset = 0,
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
>  			.id = 0x080,
>  			.num = { 8, 6, 6, 6, 6 },
>  			.src_descr = "Analogue %d",
>  			.src_num_offset = 1,
>  			.dst_descr = "Analogue Output %02d Playback"
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_SPDIF] = {
> +			.id = 0x180,
>  			/* S/PDIF outputs aren't available at 192KHz
>  			 * but are included in the USB mux I/O
>  			 * assignment message anyway
>  			 */
> -			.id = 0x180,
>  			.num = { 2, 2, 2, 2, 2 },
>  			.src_descr = "S/PDIF %d",
>  			.src_num_offset = 1,
>  			.dst_descr = "S/PDIF Output %d Playback"
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_ADAT] = {
>  			.id = 0x200,
>  			.num = { 8, 0, 0, 0, 0 },
>  			.src_descr = "ADAT %d",
>  			.src_num_offset = 1,
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_MIX] = {
>  			.id = 0x300,
>  			.num = { 10, 18, 18, 18, 18 },
>  			.src_descr = "Mix %c",
>  			.src_num_offset = 65,
>  			.dst_descr = "Mixer Input %02d Capture"
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_PCM] = {
>  			.id = 0x600,
>  			.num = { 20, 18, 18, 14, 10 },
>  			.src_descr = "PCM %d",
> @@ -387,20 +387,20 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
>  	},
>  
>  	.ports = {
> -		{
> +		[SCARLETT2_PORT_TYPE_NONE] = {
>  			.id = 0x000,
>  			.num = { 1, 0, 8, 8, 6 },
>  			.src_descr = "Off",
>  			.src_num_offset = 0,
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
>  			.id = 0x080,
>  			.num = { 8, 10, 10, 10, 10 },
>  			.src_descr = "Analogue %d",
>  			.src_num_offset = 1,
>  			.dst_descr = "Analogue Output %02d Playback"
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_SPDIF] = {
>  			/* S/PDIF outputs aren't available at 192KHz
>  			 * but are included in the USB mux I/O
>  			 * assignment message anyway
> @@ -411,21 +411,21 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
>  			.src_num_offset = 1,
>  			.dst_descr = "S/PDIF Output %d Playback"
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_ADAT] = {
>  			.id = 0x200,
>  			.num = { 8, 8, 8, 4, 0 },
>  			.src_descr = "ADAT %d",
>  			.src_num_offset = 1,
>  			.dst_descr = "ADAT Output %d Playback"
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_MIX] = {
>  			.id = 0x300,
>  			.num = { 10, 18, 18, 18, 18 },
>  			.src_descr = "Mix %c",
>  			.src_num_offset = 65,
>  			.dst_descr = "Mixer Input %02d Capture"
>  		},
> -		{
> +		[SCARLETT2_PORT_TYPE_PCM] = {
>  			.id = 0x600,
>  			.num = { 20, 18, 18, 14, 10 },
>  			.src_descr = "PCM %d",
> -- 
> 2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
