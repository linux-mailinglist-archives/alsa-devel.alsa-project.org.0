Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4002C39F438
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 12:51:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82506169E;
	Tue,  8 Jun 2021 12:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82506169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623149514;
	bh=uS6oPjtQ6SFyFWitlFhjsLnOr84r6WfY1Q3oMbAc8m0=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lx9OyqTrsFI7GyA1SwuBqiEhjCZ2lH1TeK6Hg8bSHel26JpZR9aFCOGpo97cNtV/1
	 EDZksza7TPXSGqpb2EjNq4w/pHHBrjUhgoFEFz63Zp9RflC2OQ5VoWIry1tpuO9yNs
	 jDbvb7Iuj5jcywbY5j2nGorow2H1ONxv+FhVRFH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D265F801EC;
	Tue,  8 Jun 2021 12:50:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 148DFF80218; Tue,  8 Jun 2021 12:50:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDC17F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 12:50:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDC17F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BstLqIKp"
Received: by mail-lj1-x229.google.com with SMTP id c11so26400598ljd.6
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dB+nmR8+Tc/nCCNZcI2EpDQSJlpRU8A/+Y1HXrRVoUw=;
 b=BstLqIKpfGoEK6rDUJbcZLEppzp/Q8bBIEMInEoh6j+sdJ2090UapIvSb+eji2vXi1
 m7daULS6gEfxmnXocM6GdrPNcfWe10uFhczJk+qL8eDj9xqtvp95rh3rutByzMRz+4Ec
 YT//T2Sa+y41tGDJekiurs//NJP/NWRqIIhMxENxfs+8IoDlK1hS0kRzsPEp9LNtVMC2
 ENTD374GmJPC66LTPNG2pE9SeQVeZppCXOfqYW/4wWCk16Rmsjlx5U9lJoNmUOWdvZz9
 KoEY5Q+EwvidnRZZdsNO/B5q0TXiP6n2hB4f8nzh2xlLCSdCcmAUNkEKMTLAYsKT83D7
 X6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dB+nmR8+Tc/nCCNZcI2EpDQSJlpRU8A/+Y1HXrRVoUw=;
 b=bio2TndhMw7zHXFLkBfaoomhOwjOuniZa20cChKJsa2hRY19hGLVBfM3q9XNEuk6Q2
 Ig5bfmrVTrSXshXkdiqmIDpq61J3JTWxKKaXTqwHVXcJJ6BfGxtBGlkj+2uJbUoLhuGB
 o0faQlz61FQY30yXQZbtzYst1K6fUmN0mKP9QCoOHjeWNUKKNkHHOSQ/iNC7J487NJ8I
 YL1SL9dKjyuMVH4L+gpoyHWKVJ8KOLVmv309X/QR1YjFtLTfPCPnkKmNuHcuQXpLZ2qB
 YHkvR1ZLBvK9FnQhVhYPe1dD9BvZISmLViAO1EdjobpM2rGovCxCD3kCv1b9cGLmZcjv
 vlEw==
X-Gm-Message-State: AOAM531LApq77q3L2LlPx075YJphKelr20WNB5/6bTUKDXpSimvmDQ0a
 RzFCQxyGYxU53Yk0XO4DZmM2WodT4fheranlHZFs+k65zYdjBg==
X-Google-Smtp-Source: ABdhPJzGGtmDdcTqLOq9F3vOQ+dyl6J+bDPgUqWDqLPfQXbx263eVN2SgMbznVF/Kdr4UDmw6vlLVi9H5F326FscODE=
X-Received: by 2002:a05:651c:20c:: with SMTP id
 y12mr3565070ljn.428.1623149418374; 
 Tue, 08 Jun 2021 03:50:18 -0700 (PDT)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Tue, 8 Jun 2021 16:20:07 +0530
Message-ID: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
Subject: USB sound card issues
To: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 alsa-devel <alsa-devel@alsa-project.org>, 
 kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi all,

I am using a USB sound card(snd-usb-audio), and it fails while doing
the audio recording "arecord: pcm_read:2032: read error: Input/output
error".

What could be the problem? and is there a workaround for this?

$ arecord -l
**** List of CAPTURE Hardware Devices ****
card 1: BT_AG [BT_002], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0


$ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz x.wav
Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mono
arecord: pcm_read:2032: read error: Input/output error

-- 
Thanks,
Sekhar
