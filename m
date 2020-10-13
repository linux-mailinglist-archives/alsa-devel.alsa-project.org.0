Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2C28D340
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 19:45:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B587216AE;
	Tue, 13 Oct 2020 19:44:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B587216AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602611119;
	bh=eToAH4xIq/FRoKoXgpXWd/b5ZlbY+9U0Z+ekWqGYAJE=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d/QgJckacEa8WsBXLuh5BLYJNytSu3X9Dam9K5jIVb8NMLyhNFlAGoFEFNIozBZyb
	 eXaw252D6LxKocvg6lJgXaemIESparnRMBrHeRz2FpakWrrRXUXmfAjV3Be//KNSac
	 akRTurbs98JdIlvCsypHrAufl/WDAb5ZaID68tjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0479CF8012C;
	Tue, 13 Oct 2020 19:43:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B593F801A3; Tue, 13 Oct 2020 19:43:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73FC4F800F6
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 19:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73FC4F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=compelect.com.co header.i=@compelect.com.co
 header.b="R/pvTxPV"
Received: by mail-vk1-xa2a.google.com with SMTP id m3so107388vki.12
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 10:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compelect.com.co; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=9aJgKGKc+r+AnhIqYHVTr/sdTQ/84I3XEmh/emnpysY=;
 b=R/pvTxPVjnsObK7+Bs4hPw45dAspDRPtZtrXV6OiIxgMy0Jir0HR6gy3rFvKC4QZTz
 Bp3PUyH7UC0g0IO8IXLwxi84IRLHNHu8PaIwCv47NHf/0eLa+v9/SO5S5K5FYILuKqao
 pCKI7ydkUVmuOL4ujO35ND6M/KkhRUBkkfwBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=9aJgKGKc+r+AnhIqYHVTr/sdTQ/84I3XEmh/emnpysY=;
 b=OTkh4i/X8EuLMiONiwwuoD9uCfwWQ6B7xn7GfTT1XSm2ujvNOXJRiOxDMJeoXsxv93
 0yC7+3M+Oc8olPyOPcRR2KMCaGd8Kc8AjSESAUPmNbA4U23mNGd065sd3XqK6WDMVZAH
 2WjWzKdvHKyrKhmvKiMSKjh5o7IGp4xmB1Rt256G2ARsV1qcYvgEMFxNlsB5IM+L4rDZ
 GfIBZgmqXZGe+b+rg3eKAEjbvEpNJxkeUTab4bE94KnywTFo8/UlxJKMFRyeivfNTYEl
 tMSeyiWvP3x+O+9uvBlwenPwmDnh9AEeMmz2No2Hyx+Uf8f1B3p8G3Zf7q2ggBnwTCWM
 qIWw==
X-Gm-Message-State: AOAM532NIcjtJy+LFpk3eSbn/JJOOVVoLvnvEvowHV/zvOltR8kSaJ5n
 Gey73AKgkTnZiOxlu9kcz9R1hecF+Lh4xw==
X-Google-Smtp-Source: ABdhPJydCLI9pJNVAfvRvlWy058pbea7BNx/36y2MHklLPyLlnyI+1z6Lu3mHFw93BY7K0KtCPQhqw==
X-Received: by 2002:a1f:9404:: with SMTP id w4mr1139962vkd.2.1602611009706;
 Tue, 13 Oct 2020 10:43:29 -0700 (PDT)
Received: from [10.0.0.246] ([181.137.81.189])
 by smtp.gmail.com with ESMTPSA id x16sm67342uao.1.2020.10.13.10.43.28
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 10:43:29 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: kalashnikov-HJ4JGG <kalashnikov@compelect.com.co>
Subject: support the Roland UA-4FX2 card
Message-ID: <1c87e698-001b-1369-b567-8c628cb3761a@compelect.com.co>
Date: Tue, 13 Oct 2020 12:43:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello
i am juan and i am trying to use this (Roland UA-4FX2) sound card on 
linux, I posted this on the github and they recommended to put it on 
this mailing list.

from
https://github.com/alsa-project/alsa-lib/issues/81

hi

i'm trying to use this audio card with a Raspberry pi and y get this 
from the command dmesg on linux console

```
usb 3-2: new high-speed USB device number 6 using xhci_hcd
usb 3-2: New USB device found, idVendor=0582, idProduct=01e2, bcdDevice= 
0.2b
usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 3-2: Product: UA-4FX2
usb 3-2: Manufacturer: ROLAND
mc: Linux media interface: v0.10
usbcore: registered new interface driver snd-usb-audio
usb 3-2: Unable to change format on ep #8e: already in use
usb 3-2: Unable to change format on ep #8e: already in use
:
:
```

and when i try to select the device on a program get this

```
ALSA lib pcm.c:2642:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.rear
ALSA lib pcm.c:2642:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.center_lfe
ALSA lib pcm.c:2642:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.side
ALSA lib pcm_route.c:869:(find_matching_chmap) Found no matching channel map
ALSA lib pcm_oss.c:377:(_snd_pcm_oss_open) Unknown field port
ALSA lib pcm_oss.c:377:(_snd_pcm_oss_open) Unknown field port
ALSA lib pcm_usb_stream.c:486:(_snd_pcm_usb_stream_open) Invalid type 
for card
ALSA lib pcm_usb_stream.c:486:(_snd_pcm_usb_stream_open) Invalid type 
for card
```
it seems that the card is not supported by ALSA lib.
How is the procedure to add new cards to the driver?

How can I help to do this?

Thank you

