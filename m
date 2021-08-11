Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5823E9194
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 14:36:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 380F71741;
	Wed, 11 Aug 2021 14:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 380F71741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628685375;
	bh=LkNCLERbY88viq9Zpe5HqeoGWPLnVOXlHz6xdG1fL4g=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hxqlhTLtJBEx5nE0GunYunQ5yzGCPgECDJeYMIXO+JlllXkk6U1nJWfe951gYogYW
	 xmgX15mRIyc+0m87WA1FqQzRI3ebLBSW09idlDwULiTxCgpwC2qQHBmqJ9oIxP0x2x
	 5+plUnJsNknki1dN2eagqiVneBHLamaabic1StNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1A41F8020D;
	Wed, 11 Aug 2021 14:34:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75C5DF802D2; Wed, 11 Aug 2021 14:34:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEB99F800F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 14:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEB99F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZRIuqf+6"
Received: by mail-lj1-x22c.google.com with SMTP id n7so4389086ljq.0
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 05:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=K9DpAgAnqxctyg4iaJo9mqnhzEJ5oKvSm6u/94Ov1yA=;
 b=ZRIuqf+6LM6KdfsSSjraUybCR6jhHjLqDQpSn7xIO9yjwZr2fubJupLvo4GZYVSC+P
 PHSVc7LGUeLAJvq305BQxnx0zVjVvnYMSqI9ioC7MPS16pq0DY+9YnXPrNoA5AG12pzJ
 LgbT+FBN7NNVQJb7ICIjZXIw35q3Mszfy/JbqKPjYAxZiInGJE8ESV3Aj0F3boGHZWpx
 Bwo1j4Bzu+nTzH5VPW7/VfV8nanVJEL8fLvihnA4tvPJHJcaSaiZhDXEBVhv5n236w4+
 RhHfhvouBvUNs6624gP7m6pBII4lXaKO/xcthf1lxd5ehJfP5M8ltvjxQuJazhqh7qNv
 E50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=K9DpAgAnqxctyg4iaJo9mqnhzEJ5oKvSm6u/94Ov1yA=;
 b=StnujvDEvR9m+jtUmLpjael8c8qNcSbWImcBTEL/NGfk1eKmWT8bwuAz7XaqVvA0Gt
 NLWMs6Ssu+YevuVxyYGtiHVFMWYqltGch0EMNNYAjti2nUuKRJeJE7APFRz2R83vignq
 BDggWw7jzchuq1QV0HG+hyCpOOGIFRp6dfTlxHkaOBS7KplZMELrWE7LLSjfpGlrJr/z
 AqQfc4JQ7E+LL+cUX1igGasSR/wHT5G+uinSeezQAVQyT3RDEyd1JOynDcJFdh+As9ap
 +Yi+QrPkOlJXIgP+kmYvT+c3Y2mClvm3yESTI0FQv1TN6ZOUDMXCshoZ/fup+SBY0MjG
 ygeA==
X-Gm-Message-State: AOAM533vZoatBlDh8K7S8RxoyBJeXUV3TXO2NuxSAOXq0DQO1Q64Dynz
 PLjzHaucwNz+H5hcvHMLQgrmo55cMlMEDo5kdbnvnYpOzOg=
X-Google-Smtp-Source: ABdhPJwc11vu//JpjbWm8gdvehISxVfavnwrQtgO73mGuFN5KpY+qWgqnTROg/oCvj6P3+R46Ai50erZcXzcEmXsmvQ=
X-Received: by 2002:a2e:3206:: with SMTP id y6mr8086833ljy.187.1628685270124; 
 Wed, 11 Aug 2021 05:34:30 -0700 (PDT)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 11 Aug 2021 18:04:18 +0530
Message-ID: <CAHhAz+iRiLjG+=xMDoZiqZzqn9fO1ZHk4ZtawCkWZ-TyH8forA@mail.gmail.com>
Subject: USB-Audio: Device or resource busy
To: alsa-devel <alsa-devel@alsa-project.org>, 
 kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-usb@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi All,

$ cat /proc/asound/cards
 0 [USB            ]: USB-Audio - Plantronics .Audio 628 USB
                      Plantronics Plantronics .Audio 628 USB at
usb-0000:00:14.0-2, full speed

I am using a Plantronics USB Audio headset.

$ arecord --device hw:0,0 --channels 2 --format S16_LE --rate 44100Hz x.wav
arecord: main:722: audio open error: Device or resource busy


'arecord' command always fails the first time after system boot in my
system. But subsequent execution of the 'arecord' command runs fine.


I've attached the strace log for the "audio open error: Device or
resource busy" failure. Is there any fix available for this issue?


-- 
Thanks,
Sekhar
