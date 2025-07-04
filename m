Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03DAF9301
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jul 2025 14:46:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A8460202;
	Fri,  4 Jul 2025 14:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A8460202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751633160;
	bh=T/Byahh1o4r3cpagPlEaKBQxkWN2HuPXBdf6vHNHfa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JcQryfjtzt4jejQc2cKJsxU6vW1f1iH+pgVhPGlOElxt4dOFBILzOFxro5VaqrsDI
	 +VKcj5YKQc3NF3DcHrRL+YeHg/zLZoxqj4iFbVIIBqXNnmDvSrHOUUisKGsPAC8bER
	 sR7FQtXScAITzP2fl8LPfQsqhoB35PLev0GOJiAE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AB2AF805C7; Fri,  4 Jul 2025 14:45:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3015F805C6;
	Fri,  4 Jul 2025 14:45:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B540BF804E5; Fri,  4 Jul 2025 14:45:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09F41F800BF
	for <alsa-devel@alsa-project.org>; Fri,  4 Jul 2025 14:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F41F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y9rsI2WI
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4a43972dcd7so10406381cf.3
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Jul 2025 05:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751633118; x=1752237918;
 darn=alsa-project.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3b7SpxZwFUKCyRYzUNdSxcHOzs6LHfckAaJ36W/yrJw=;
        b=Y9rsI2WIL5LRg3rq0ZpnWRDlmzCkAP16110D6HeUyBmvM2jokWrlBlzsL3zeyU2rNJ
         KG5tgr5UGs6VLFw0r1v5dsvoK+7uW3ofqbmKGVRmhXhw0KKIya/sb3EsGZ2hqA5It0Os
         JC5U/ukXcyQcjt2Pb5MfkHQFibHU1jAVUJA8ndnU6DPmr3OltP5907a0ToISDW+gyOTz
         l8lz0OdATfbq/wGl8NvggXusC/EVXuxbZNJ80OReKjRNZYjzZ6rHoMObUpUhlv624+OM
         afmXfhP72/waYart9sgbOKQ9yxzO+w5odJxrFId76Z5QlTnXXwOmF+m/3QqTuz+UwwwZ
         OnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633118; x=1752237918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3b7SpxZwFUKCyRYzUNdSxcHOzs6LHfckAaJ36W/yrJw=;
        b=boVwMrDfMNHk9yJRKDJi4/4g42Q1tt6M9716MsSUHdPSdbt1XeTM5sDyhjqr5WYLiN
         YRXs3zXFk2LCINR3/44qnvKvNN4L3maAG8Rj47Yr37B9mvRJ7m8VgM++XzL/l7T3HvL7
         Np02gnvVnbNtFufSTzr4r1jKIwMF3WBgl2XDmvUqBXpw9oVzrvNNyDdOpR4E7ETFYNBe
         w9jhce7lFMoUK1ghIH9Doh+dDIQ8a7EXSBXkvaCMgFo5Qh+Nx1Nrw21/kKcVDM2JxJCG
         Jge8UuVn0ldEWabTmtOjrfwFaEg9pzv4T3W64gjpHf15E3ahS6jR6kG1LSHOVs5O5F0e
         qjtA==
X-Gm-Message-State: AOJu0YxE4Bextp0IXqY4A89pUzj8aMFAp4t41yWnMC3PAKAl9mbjWdMi
	YeFs3/cy7q+3KJGNwNoO4JiznideoF6+5lCw1fTULKXFyWpUx8UuWk/MuFeInA==
X-Gm-Gg: ASbGnctiznHIhKYx9Qnd+97UDuq3bidDcWI7Oe3MuZHAT493C0afqrJ5/5GIZIRX6Dk
	6Jcv6JpfBa9zt0uyh1unWjxuf/A+jdCeqNmK/2YbOe9+PbgBzRV6PwKpkGRYHUeGLDDQq0RApwS
	LMaUs4cCkQEjGFtRFasGHo5w68V2B6vUhlsf6o0uOUQN4MPGmxq55NCoxFk+24Z0uBXxsVNeoBg
	NsXobOyllHY0nr/35jnbJXfGpTWlQRu2m9vGWSnZclQSOi1ErScNSScCmZHd09xUHnlABsNI/Dr
	0vt1krGhKvZbiaMrG/dfQ2cQFTWfAt44QsQpGcI=
X-Google-Smtp-Source: 
 AGHT+IHXnfEZbYp2cvuzUtQZfQb6/bKY65RrTzOwTDjirpGgx8kGl0BNf3ZGPI1yxs+j7jYvtJijhQ==
X-Received: by 2002:a05:622a:189d:b0:4a3:4d46:c2a6 with SMTP id
 d75a77b69052e-4a9985fa4b6mr21304081cf.7.1751633117778;
        Fri, 04 Jul 2025 05:45:17 -0700 (PDT)
Received: from geday ([2804:7f2:8082:5254::1])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a3093asm13390891cf.36.2025.07.04.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:45:17 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:45:13 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Brian Knutsson <maps@knutsson.it>
Cc: alsa-devel@alsa-project.org
Subject: Re: [BUG] Mackie DLZ Creator =?utf-8?Q?XS_?= =?utf-8?B?4oCT?= USB
 Audio: write error -77 after accepted hw_params
Message-ID: <aGfM2dly9p0aMYS9@geday>
References: 
 <1751030777207.7.27394@webmail-backend-production-84fcdc845b-7rcsr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <1751030777207.7.27394@webmail-backend-production-84fcdc845b-7rcsr>
Message-ID-Hash: SGVFDSQ5IEQUNM5ZMUGV5IRL7UWFOJC7
X-Message-ID-Hash: SGVFDSQ5IEQUNM5ZMUGV5IRL7UWFOJC7
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGVFDSQ5IEQUNM5ZMUGV5IRL7UWFOJC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 27, 2025 at 03:26:17PM +0200, Brian Knutsson wrote:
> 
> Hi ALSA devs,
> 
> I'm reporting an issue with the Mackie DLZ Creator XS USB audio device on Linux (tested on Ubuntu 24.04 and 25.05 with kernel 6.8+).
> 
> The device is detected correctly via ALSA (card 2: XS), but as soon as playback is initiated – whether via `aplay` or `speaker-test` – it disconnects with `write error: -77, File descriptor in bad state`.
> 
> Relevant kernel logs show:
> usb 3-7: Product: DLZ Creator XS
> usb 3-7: Manufacturer: LOUD Audio, LLC
> usb 3-7: USB disconnect, device number X
> 
> This occurs with and without PipeWire/udev running.
> 
> I’ve created a full ALSA log with `alsa-info` and opened a Kernel Bugzilla entry: <https://bugzilla.kernel.org/show_bug.cgi?id=220143>
> 
> Is there any known quirk or patch needed for this hardware? Or a way to assist debugging further (usbmon trace etc.)?

Hi Brian, thank you for the report.

Has this device worked before on previous kernels? If yes, you can try
to find which kernel version was first affected and then run run `git
bisect` between non-affected and affected versions to try to pinpoint
offending commit.

If the answer however is no, then you're pretty much on your own and
it's up to you to compare working Windows usb traces with Linux ones.
I suggest you try existing quirks first to see if one of them handles
your bug, but if none does, then it's like I said, pretty much manual
development.

Thanks,
Geraldo Nascimento

> 
> Thanks in advance,
> Brian Knutsson
