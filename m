Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C9860AE0F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 16:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CCD54F1A;
	Mon, 24 Oct 2022 16:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CCD54F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666622842;
	bh=sxTNdRwmjEP/pMCeodGsSe/zixhxPFWA5F8S3yYJ3NU=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dh4CyIi136BVJAEbswaSsnV2LYZ+COerprDjJE1eFvSiVXDXe7OG+czQ8u3v+2IlR
	 lHzMHTjTmdEftshtL+cj5XQMf0CE42FMA5j/mCZUQgPYeHU06JH6f1XVum77QyuMWk
	 xn+BD5g2tmOs0bTFxxSUBrZh73io1SmkEWB2AnQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 291C6F80564;
	Mon, 24 Oct 2022 16:44:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF85EF804D8; Fri, 21 Oct 2022 01:12:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CC22F800EC
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 01:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CC22F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="clFcBWW/"
Received: by mail-oi1-x233.google.com with SMTP id o64so1317384oib.12
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 16:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dtL8+LXCehGTZZ75CgUriMF+cyfRFTMUhkI4T0YkT08=;
 b=clFcBWW/algdeSfKgoxcdST+MQGEUKyeaAdcflPoK+UxyfZ+NOVpI6+aEYqnlsCYzK
 JcPs7/ZFMxnyp2wfpbdmTkyRXgTadqZvlFEV7Ph+KxklVMxm9XcDtnqNsGZn9B6TaX0w
 S3zhUPIDypBD42ebm+ZRNGgqlo/4eNadep8Cnh5jDiXP8A8v4gpEHhpfsn2FI1uS1Q/o
 gqdciRAh4YowHlLG8RhsxMzlmfHtf37AHilw2NICxNlplGEP4mj/yEwAp7GbtKpc48SC
 trTaHanw4SwSS9/IsOSB6rHaiiLDL5BTVtF6WL+npdAY4Sdadpu81UPqsqGsvdSvvq7K
 f+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dtL8+LXCehGTZZ75CgUriMF+cyfRFTMUhkI4T0YkT08=;
 b=ewFviL0nG7ywFnHAumYk02yXfGHdeYsEI62eO0GhrFs1dTIvKqt2qlXNppZSYsHLO+
 6cLHaeI7NlRJbaqzSxpt09YvSFhy3hRdtQsTIlF1510tdJnxJqGWUGT3Gg1rD1Po6kAM
 jo9ZBL6J8+IGknviI5n4aO6SF1cHRHpiUn+UBf9Ot9UGZOIGXrTKG+OJEkmPAgsz3/CR
 pBTKrOszyhL2+sO2hK8kuTRpXXrh7tryt6sFKwOAxsrXwGS8jbkzNPm79os4XPJ3mChR
 afBXr7eaAlhISmZolu7FDok4dC+Fua1NFU0WrADImbhmkXxWA6TjrDk7gwCpqjVyKTAm
 xsmA==
X-Gm-Message-State: ACrzQf2mypSzHo/RHAUtBlU3Cr2bg6ju4adiMjAEHAdE2Nzgr5Wcd+XK
 kiLue7FORhyV4FGb8pnSEU23jT/rq99TT2q+tCsr6zXBaVnBVQ==
X-Google-Smtp-Source: AMsMyM6NvC86qTlR+yuzjXxCU1K78hLldQK5t2ffLPWSsmCOTi6sxDu4I/OGVAI0uVgP7dhjQNW0OGa/cpRQiIMhTj0=
X-Received: by 2002:a05:6808:140b:b0:355:1cdb:b074 with SMTP id
 w11-20020a056808140b00b003551cdbb074mr9302207oiv.122.1666307538656; Thu, 20
 Oct 2022 16:12:18 -0700 (PDT)
MIME-Version: 1.0
From: Robert Wu <robertwu@google.com>
Date: Thu, 20 Oct 2022 16:12:07 -0700
Message-ID: <CAF+ETCVhkmhUK0XkHvPd5LzwVf9nvcuXEaayd50itF1DJ5JMBQ@mail.gmail.com>
Subject: Disconnecting certain USB interfaces causes the sound card to go away
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Mon, 24 Oct 2022 16:44:49 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi ALSA devs,

I work on Android and starting from Android T, we use libusb to connect to
an MIDI peripheral when Android is in host mode. We do this by opening the
device, disconnecting the kernel MIDI interface, claiming the MIDI
interface, and using its endpoints.

However, we started getting bug reports from customers that some USB
peripherals stop playing audio once MIDI is opened.

Disconnecting the kernel MIDI interface with USBDEVFS_DISCONNECT causes the
USB sound card to disappear for some devices. I tested with 6 USB
interfaces with both MIDI and audio and I found the following.

1. I can disconnect the Audio Control, Audio Streaming, and Midi Streaming
interfaces on the Komplete Audio 6 and the Alesis iO4 without the sound
card disappearing.
2. I can disconnect the Audio Streaming and MIDI Streaming interfaces on
the PreSonus USB 96 without the sound card disappearing. Disconnecting the
Audio Control interface causes the sound card to disappear.
3. I can disconnect the Audio Streaming interface on the PreSonus Studio
26c, Yamaha AG06, and the Focusrite Scarlett 2i4 without the sound card
disappearing. Disconnecting the Audio Control or MIDI Streaming interfaces
causes the sound card to disappear.

After calling USBDEVFS_RESET, the sound cards come back up.

Does anyone know why certain USB peripherals do not handle
USBDEVFS_DISCONNECT cleanly on certain interfaces?

Thanks,
Robert
