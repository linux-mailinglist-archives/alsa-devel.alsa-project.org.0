Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 167902BBE3C
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Nov 2020 10:42:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7D2316A8;
	Sat, 21 Nov 2020 10:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7D2316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605951721;
	bh=9/2FzozLRX3164hIhvSa1iZLqQ9Jrc1CZUOXMRV6orU=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bq4f6ZunPI6ftw3uqBbEZnEFyz2HcpOYQMCKfMb9j51AhqHMA6fz8DCvlZoK4vWp0
	 i+E6PM25ioOLNrWrtobnrFAgu9dncvAAJnHA6/+tOAqWCGazYZ9mPpTN7o/UlZ3Bby
	 ufGzTUg9Hu8xNoQpHozJtwgWpoCiT1F8xjxX75ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36DA7F800C5;
	Sat, 21 Nov 2020 10:40:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71AB9F801ED; Sat, 21 Nov 2020 10:40:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0468FF800C5
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 10:40:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0468FF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="NInG25Zj"
Received: by mail-wm1-x32d.google.com with SMTP id w24so12713670wmi.0
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 01:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PrLTUL5di8kjxKlvaMtgdXhgGl4rYB0b42BA60i8j5I=;
 b=NInG25ZjeH6J77jOwSjVC8fg64Jk0Am714ehDsPbIUBk8TwD8mJFsJSAPl+rN6lENP
 gZPthPcMK7Tf6UPpv7YIAIUOzDuFGjzbPAvq+KkswoNad49Sw4hgJTAHykiiWOpbCld3
 rWVuVdHNHoUdW/tY4bi0UxYHxhlzGbKRgQRSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PrLTUL5di8kjxKlvaMtgdXhgGl4rYB0b42BA60i8j5I=;
 b=F8ozaTIc0Y0GNVS4FOHRGwrytbSrT46ANLS35s951Qbtq1DBhr4wIFEj/TcfyQlDGV
 E/0EnOsug2o8VW0pBg228E0+r0TSIoNk6QVnSitSoi2Vu2V84AB9OUxsUuPU2Pz81cEe
 5KKaQAoRKVVOlIlFjrPYUSsmbZ0gYjNj4inlDpD5SA1hURGiP/sWDl1hO3sq5Hns+YJs
 6oQJnVsB3WHGdPkpNAFU1EtULe9B5HO0YL4SEm1PAPbPoJmiXg/PmxFTASG7/sLaSnPZ
 dkOuMFw9C2JOhls9WVlS9gHHmO9Awjw6SF7SXKGcCSoVHra74kIYW49FRQDo+5yPgxQ7
 +vxg==
X-Gm-Message-State: AOAM530jVMAPcIjiN+FjSwbaccVnSIz5p/l0BRKUwl48xQyz8ouVJu9h
 nYSzezWQMhYbc4YvvPzeTh+7KDMpp6wRriBPA+dPSfpzDLBhvVGW
X-Google-Smtp-Source: ABdhPJy/rCBF/ij0BOPvyYyBgWd94soBhrSLNt3FsnaGO/RO/+1w67MZMPRGZXqDnq7wu5dw0GxNLD6StpaTmpE3E1o=
X-Received: by 2002:a1c:b387:: with SMTP id c129mr13813824wmf.58.1605951615960; 
 Sat, 21 Nov 2020 01:40:15 -0800 (PST)
MIME-Version: 1.0
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 21 Nov 2020 10:40:04 +0100
Message-ID: <CAOf5uwmtixmz+RgimC_2Z31+NwRF03RJ-u0mN3NKpzhks1dzEw@mail.gmail.com>
Subject: Poor performace on mmap reading arm64 on audio device
To: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@linaro.org>
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

Hi all

I'm trying to figure out how to increase performance on audio reading
using the mmap interface. Right now what I understand it's that
allocation comes from core/memalloc.c ops that allocate the memory for
dma under driver/dma.
The reference platform I have is an imx8mm and the allocation in arm64 is:

0xffff800011ff5000-0xffff800012005000          64K PTE       RW NX SHD
AF            UXN MEM/NORMAL-NC

This is the reason that is allocated for dma interface.

Now access linear on the multichannel interface the performance is bad
but worse if I try to access a channel a time on read.
So it looks like it is better to copy the block using memcpy on a
cached area and then operate on a single channel sample. If it's
correct what I'm saying the mmap_begin and mmap_commit
basically they don't do anything on cache level so the page mapping
and way is used is always the same. Can the interface be modified to
allow cache the area during read and restore in the commit
phase?

Michael
