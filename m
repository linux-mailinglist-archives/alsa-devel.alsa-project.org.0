Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E57E4E7
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2019 23:41:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D895E16AA;
	Thu,  1 Aug 2019 23:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D895E16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564695704;
	bh=JRnBuvL2cIadA/etfZIzGJpHDPFM/UcFlzy8G3H/AJA=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Co4NAiaGwmSAA++KIWR7u82XlvN1sYd+bZopKNHlKhJondK5z4/c+tKAIaCw774hK
	 OXI80XmEC2BIm0Y2aC6Zku2W1X0y5IRw+ktRDPJacdJLww/rKTj3SKYaDMKGlzVQwR
	 TqT+vyGkCxQhgYVIBV9Ab2pGEqBpJqnhxbEe/Ph0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2339F804CB;
	Thu,  1 Aug 2019 23:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAC19F804CC; Thu,  1 Aug 2019 23:39:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A1CF800C0
 for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2019 23:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A1CF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h+lTKNuJ"
Received: by mail-oi1-x229.google.com with SMTP id 65so55155154oid.13
 for <alsa-devel@alsa-project.org>; Thu, 01 Aug 2019 14:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3gZcerL0JHgIjX9qMDCrnv1hz9WVi41UjwzJXQxUEGk=;
 b=h+lTKNuJWWBSWM2voZb2kCD0o7dMPTlNoML4gtIDgk94nwtQCytGQX0HrkelCUYcyb
 aHGf2b00+0riB6Kciz43oC2rxpLpEGzF3ieCHStmRUE0P/LV145S4zlKh04SlA+sphbA
 cpNDG7yVi5SmUj28+TuvtxCCTsa4KuEoXQNdPQeDkkjMh0BtGZBrucvyIXfp63Q4pa10
 zGi/Nr+9+NKE/bkXwGRPc3247JMoNDZwqKyVetVgF2Emrtu2iZJVtKO7/gHymrlZ7B69
 iwE5mipesvc3VWYOSGzfLQlbK4P7QV8PQtH55haRSRpX7yQxcOhlDoe0ARWzL29hVd1e
 +ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3gZcerL0JHgIjX9qMDCrnv1hz9WVi41UjwzJXQxUEGk=;
 b=MqInaw4YAYKf8TDu7ECbUjQMlsLMvYpkfuhc3MFBeUnG9oKgS67QPc3ALinoznixu1
 XHrmxhpYgsf0h4HUQXb55fGdC6rXW2Kd8joYMLvzCPelth/qz4JjF8VbqtWF6S2+MGJ4
 EWy/Wr0+0e/2/WQK28I6GL1SuJISS/lClnQlsmQmCFD4MQpAmygU0vJ5nYbHpHEBEklw
 BRvdD8bDG1lkKegqQzNI8pfbFKTXN8vRHEXN8V5aioyK1VUSdk1prQQvOc+YGcLWrviK
 ni68/tXvbEDm6M1HaQbD+vo/zgAGt2ggbwrk5IF5olH1nfK386/SLmk90nAAbinoBT49
 K9bA==
X-Gm-Message-State: APjAAAWQm8tmzfBtflMYc0fxEolIieN+01ja26EbqorNzAinQCddTGHi
 ugStktqvCdQ3Ue1ztL7Sk5WGLz+BFLJyEqQxZPRt9Y7T
X-Google-Smtp-Source: APXvYqx3uEkSfYIdpYWTmWjzqETVLVmnYd2+yr3Gdp4igH5Lr9mOQYg5g7PPPFFg/TY4+kCr0LXoIGfIynI8XRiaa88=
X-Received: by 2002:aca:cdc8:: with SMTP id d191mr575668oig.134.1564695589587; 
 Thu, 01 Aug 2019 14:39:49 -0700 (PDT)
MIME-Version: 1.0
From: Harry Bloomberg <hbloomb@gmail.com>
Date: Thu, 1 Aug 2019 17:39:38 -0400
Message-ID: <CANLVwvSzpUBeLvAysmoV6LG3QCHUm0mee=BYc9UbfWOazPQ_ig@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Possible bug report
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

While running an amateur radio application on a Raspberry Pi 3B+ with the
stretch version of Raspberrian, I see the following in my syslog:

Aug  1 17:31:06 raspberrypi pulseaudio[853]: [alsa-sink-USB Audio]
alsa-sink.c: ALSA woke us up to write new data to the device, but there was
actually nothing to write.
Aug  1 17:31:06 raspberrypi pulseaudio[853]: [alsa-sink-USB Audio]
alsa-sink.c: Most likely this is a bug in the ALSA driver 'snd_usb_audio'.
Please report this issue to the ALSA developers.
Aug  1 17:31:06 raspberrypi pulseaudio[853]: [alsa-sink-USB Audio]
alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent
snd_pcm_avail() returned 0 or another value < min_avail.

So...I am reporting this to the developers as instructed by the error
message.  What additional information do you need?

I'm not exactly sure what I was doing to trigger this error.   I may have
been exiting  the application.

Thanks,
Harry Bloomberg
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
