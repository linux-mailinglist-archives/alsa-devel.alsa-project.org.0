Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C17A18B59BA
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 15:19:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16313839;
	Mon, 29 Apr 2024 15:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16313839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714396767;
	bh=GzTVP+cnONGx8I7Xig2IilKrZZe4Kz4khWj5HS9ejQ8=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LpKUkWzphcSTR4YkXPMyC4lm1x9lauz75fACS8uIV6Urb5J9YrHpXougwmhnnojpV
	 p3k4l/xhE8uML3iSTWneDYhn1CU8//BRgjamBC18CYHRMT+jRfKK5oDTs6VKo74VL9
	 PF/q/+zo2+fSR2HoB2XYlbpzc2wgFyNV2kdyvhdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 803C1F8011B; Mon, 29 Apr 2024 15:18:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D14F80578;
	Mon, 29 Apr 2024 15:18:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69B98F8028D; Mon, 29 Apr 2024 15:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83565F8003C
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 15:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83565F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ypbtq6Zd
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-617e42a3f94so48658787b3.2
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2024 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714396718; x=1715001518;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5DrNmX/O5hzyTD3oW2jtllNOsgM2WyrTONwfmemwKBA=;
        b=Ypbtq6ZdU3naNHE8u0In/f5I3WtYywP26UBRoRmJmrMMh/LYtvLkmdVpvgfoZtkrTd
         hfXDTO2dhLGIQU80rpSIZo788YuNDZMDw8GWnmDoZdsDntyuPPj4N8vW3harSDf+5uHr
         Dq5XfGWZoIo8FSV2zzPnv/yn7PpWq64r1tDDfKz5kmU7DP4U4d+AqP7Kb+Nt2sWNhAsK
         fBINXQbsNBjC2a8DStuwl6wNL0Nk1noTrbrnjW7GXcxTuhlPDyX7iOiHYpuTQVmJJ2rd
         cr5s16sfCLIvQ+LWvxybBWq6K9bAAANyism1eJ7t115ZJkBo14FshEGi/uAvSVrgAm5L
         +Ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714396718; x=1715001518;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5DrNmX/O5hzyTD3oW2jtllNOsgM2WyrTONwfmemwKBA=;
        b=fPtln3tz7BEzqB44tKZ2mlmb3M4F5a77H2ImUesMuhqhLNXsyj6+7XyrSuhUQltp5j
         TZZPB+pq9diaQY76spL3Pqspcfnz6g7NaO/iOcY2Gn5aZja9rYIquHCA81INfShQUibQ
         +l1EI/03fHJvX/gXGgIv9JPaaabjtTFen/vIKN9P/9gj6mqmFTCUT6mRTDCfmdcPIXHr
         fKAHzncib/ISIapleHZElYfsWF5qz8UBOCWbtm8tK14bMHoCNJXOUyDwsaKHrFcfOIxX
         ILAfJXHhj+4DIFId81twzXqBtfOVU6cspe47xYpvg7i4vMFNImQxZvXlAtHrhJ4Lj/iI
         sUbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxIcN37NdV4GNLL37fQFjf2C7sjpyLJGqa5iBOQz2zUXNPq3yRQLNDezYeHLWUeVeD256ws8OjcS8ebGqXlCxsCAnfA2I4JG2ZJOY=
X-Gm-Message-State: AOJu0YwzN2vErPCDKrNBH/wbgc7SM+K15zbNGubLJ4RRizb2youVgBXx
	xR0S/mki1LVPbb485I254gpiv8TMGhgp6ElLhQgsoJ7hqx9RZBUj2lYDRjtmmOh3p8s8C0Zyqfl
	f4gHO2JI/n8hajiPrwdvMZ4RCi2g=
X-Google-Smtp-Source: 
 AGHT+IEEajCrlUb/3QTkb1ktXcly7kvHKmpfcjOnXNtOR6EpLBkfPPxV+knLS1Jw2S5EO2KTYc1niTKx5bbX+gOT3RA=
X-Received: by 2002:a05:690c:387:b0:61a:e947:550d with SMTP id
 bh7-20020a05690c038700b0061ae947550dmr10138549ywb.44.1714396717862; Mon, 29
 Apr 2024 06:18:37 -0700 (PDT)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Mon, 29 Apr 2024 18:48:26 +0530
Message-ID: 
 <CAHhAz+iHtWqhvwa_dmTUv+mZhnZ2zHX0W53wDGF+uHhcgk7Gcg@mail.gmail.com>
Subject: ALSA: Digital Microphone
To: linux-sound@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>,
	linux-fpga@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 3GWNAV7Q4IVJGCCWJ4LF2HYU2LD7A7MH
X-Message-ID-Hash: 3GWNAV7Q4IVJGCCWJ4LF2HYU2LD7A7MH
X-MailFrom: munisekharrms@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GWNAV7Q4IVJGCCWJ4LF2HYU2LD7A7MH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

We have a Digital Microphone block on a Xilinx FPGA board connected to
x86 host CPU through PCIe, it basically emulates a Microphone sending
data to DUT(device under test) in PDM format.

Input to the Digital Microphone block is Signed 32-bit PCM sample.
Xilinx FPGA code has logic to convert PCM samples to PDM with a
Sigma-Delta Converter.

Could you kindly recommend any specific ALSA driver within the Linux
kernel that matches with my hardware setup.

 Additionally, if there are any relevant documentation or community
discussions that you could point me to, it would be immensely helpful.


-- 
Thanks,
Sekhar
