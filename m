Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 764CB758342
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 19:13:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86AD311C;
	Tue, 18 Jul 2023 19:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86AD311C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689700413;
	bh=cvVUmF/Byj7QkQwX2hARx4Q85YlvO7HOrgCzgrNcXhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J9mYRbaYHmjLe7t2v2RlqeJCL3Q0eoTLWqOMWhJo8+RnzuDsA8f7+nDKr1hZ01aXk
	 md1hFGAXCmbsosF5ej9aRaxVIM4nbCY/6G0qOEpEpi5i77paYREScQOxhxOTrYAg83
	 1DDd8EkXiX4d5YsN4Td0StYMXFqzMpnlNsZXsMwk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE008F804DA; Tue, 18 Jul 2023 19:12:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A47D4F8027B;
	Tue, 18 Jul 2023 19:12:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E40CFF8032D; Tue, 18 Jul 2023 19:12:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 692DCF80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 19:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 692DCF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=VIp4yZQM
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-566e793e0a0so3664315eaf.2
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jul 2023 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689700349; x=1692292349;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WxoAmWOTGmAK0C29Jv3+VEC9cR+TydcbEvA8jm7tkyg=;
        b=VIp4yZQMRPlbSNg6mg9zGnAsNuBqWWfMpO6sB2p/FLgH59S6H784MsN68s1MKEBScG
         nTMM5qf2TjlvFztuBCsRll+sw7WQEKFK0Kh5IbU3o1/7onMuALRUt9fq0c7hA/ElbQ/W
         Zhq7gFwIkpeBeFYIqmMbGV5aGTZ3LXHJS7yFiJ7Yto0WbOxU0/B7JqZFKip9KHg5VUGz
         4BpJOqSgQM+U4vZLVzsIEQ8RerKAxx0FtwfBzhCVoknijh7K+sxEtwkMafPDJzVF9I8Z
         ++UKIpgYBq6gTnd8m+EGEsFJIUSY8o0P2tyWerIMhL+HZCTBBkgmP084CFUP/XjBwaQR
         +gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689700349; x=1692292349;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxoAmWOTGmAK0C29Jv3+VEC9cR+TydcbEvA8jm7tkyg=;
        b=Y27Y7kmd2n0NScO1YuuBdM+0nVFzGid73mPEXs6UrIJ0f1ZLg/CvQmMm6iq2xA6mos
         cTF9JFypwubchFbrpY9R4f0usO/fUdIo39WSOsE2kst/vtscPRhrSEAEdfFTbDxQd5PR
         4X3A9DwmTo3/P9U97SjX8OtQ42L5eEMvcoTpkfxqaqxoyibBuAiKHhLbFx9P/nPuWvMt
         +ClABcdjBY5b6M8AYvb98SgPQm156hVW9GjPQMxJmARzzxHHCdUeEJlzucZ3G1TQkJoY
         nh1S7LmIn19VYfOfq/vY5a8uxuGzBKoGhWAmulzxvQih8eXrQ4MgtlGPw3tZagROWnIX
         Ax/Q==
X-Gm-Message-State: ABy/qLZeKWVaEzGq9RizwIzRzAwZpwcTtCl09aZI4/W5/87ol+kF6fzo
	p207QHvsC6ovZZ1ZM1OeZ4w=
X-Google-Smtp-Source: 
 APBJJlG7tsW7gJScTgOTQtEv9ydQ+UzhnmoGi8ye3rz0jCicMnIViu92XqH0tkTQgljLapY2ZdhDeQ==
X-Received: by 2002:a4a:d20b:0:b0:566:fba5:e51b with SMTP id
 c11-20020a4ad20b000000b00566fba5e51bmr7605774oos.7.1689700348895;
        Tue, 18 Jul 2023 10:12:28 -0700 (PDT)
Received: from geday ([2804:7f2:8006:a438:f194:617f:f5b4:cc70])
        by smtp.gmail.com with ESMTPSA id
 h66-20020a4a5e45000000b0056665a16536sm1000760oob.30.2023.07.18.10.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 10:12:28 -0700 (PDT)
Date: Tue, 18 Jul 2023 14:12:26 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Ico Bukvic <ico@vt.edu>
Cc: alsa-devel@alsa-project.org
Subject: Re: Fwd: Odd issue with ALSA connecting directly to HDMI audio output
Message-ID: <ZLbH+qC2j9FQ5pTE@geday>
References: 
 <CAJrgGbZfPYHhf+p1TJO_LQe=pxkxDtAMPsY6sXOh1xVxq0b69w@mail.gmail.com>
 <CAJrgGbbg-WQ1iAqsG9fe559FvOQUz-hmxj08wcP1oDPTXUyeqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAJrgGbbg-WQ1iAqsG9fe559FvOQUz-hmxj08wcP1oDPTXUyeqQ@mail.gmail.com>
Message-ID-Hash: PEKALJCCMXICQR4WSWSV5ZQQGXWJ5SZZ
X-Message-ID-Hash: PEKALJCCMXICQR4WSWSV5ZQQGXWJ5SZZ
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEKALJCCMXICQR4WSWSV5ZQQGXWJ5SZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 18, 2023 at 12:22:35PM -0400, Ico Bukvic wrote:
> Hi all,

Hi Ico and friends,

> 
> I have a consumer-level setup audio question. My research project uses a
> Raspberry Pi in conjunction with a small portable monitor that has built-in
> loudspeakers that are to be used via HDMI connection. The goal here is
> portability and minimal cost.
> 
> Curiously, when trying to connect to monitor's loudspeakers (via HDMI)
> using ALSA, no matter what settings I pick, at worst I cannot get
> audio out, and at best, get a buzzy sound whose waveform is in the attached
> image. The sound is clearly periodic and impulse-like. It happens every 59
> samples. Changing sample rate increases pitch, suggesting 59 samples remain
> constant regardless of the sampling rate. When playing the actual audio,
> you can hear it in the background, but this buzz is easily overpowering it.
> 

Ico, just a wild guess but are you sure you are not capturing the raw SPDIF
signal going through HDMI instead of Linear PCM audio signal?

> Changing sample rate or bit depth, or buffering, makes no difference.
> Selecting 8 channels for output (one of HDMI's standards, as far as I can
> tell), sometimes manages to output a tiny chunk of a good audio sample, and
> then goes silent.
> 
> Now, even more curiously, when using the portaudio backend and connecting
> to the default pulseaudio sink, works just fine. What could be causing this
> discrepancy?

Perhaps PortAudio is forcing the Linear PCM bits on the underlying ALSA
backend somehow, see for example:
https://fossies.org/linux/alsa-lib/src/conf/pcm/iec958.conf
But this is just wild speculation, it may or may not be the case with
your report. It's best if you ask Takashi Iwai and Jaroslav Kysela
directly through the list with Cc: in case nobody else has any more
ideas of what could be the root cause of your report.

Good luck,
Geraldo Nascimento

> 
> Best,
> 
> Ico
> 
> -- 
> Ivica Ico Bukvic, D.M.A.
> Director, Creativity + Innovation
> Director, Human-Centered Design iPhD
> Institute for Creativity, Arts, and Technology
> 
> Virginia Tech
> Creative Technologies in Music
> School of Performing Arts – 0141
> Blacksburg, VA 24061
> (540) 231-6139
> ico@vt.edu
> 
> ci.icat.vt.edu
> l2ork.icat.vt.edu
> ico.bukvic.net


