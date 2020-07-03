Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C1B213C78
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 17:22:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6311516CA;
	Fri,  3 Jul 2020 17:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6311516CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593789752;
	bh=7kSVbScJiJPI/qjvq2ZwsoBekynU9gPvNLfxN32mp0s=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VeqPp+J3d8yIQZaz7Riw7hHJzHeLYdN1q4YMQz9aLPCSb7QkBM166e5/MEBXBkZ3c
	 9dMmhqNHkoBt46EuQQ0agEJCk6kBNW6tvBgspMRb3cT3UCMy62nvgo7kqt5Vep7uK0
	 Sqb08dMCD4x+wl0quy1Vo7GuH78xEObXQri5R9BM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 569F8F800E0;
	Fri,  3 Jul 2020 17:20:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8242AF80217; Fri,  3 Jul 2020 17:20:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5399F800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 17:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5399F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PP3IHAA7"
Received: by mail-ed1-x541.google.com with SMTP id b15so28072657edy.7
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FGmHlE3NA8pW1QRQIYfUudvTdow1PIArtypupjNj5iQ=;
 b=PP3IHAA7xER0QBtB4VwlxCA8CPV3C3X+SRE7MZkhyHafOCLfU+4Z1mno2l/LtACklR
 aMAd+QeJyPVUVSzUSu+u16dhIXVmF0oe8SX9Y7sV6d3JUvXH2F8QhwhwcSaL74OjSzDw
 siHjW9nSUOEEiVGOLBWcKfuMgKzqRvDU3YO/SwftN/CqSHM7B5QXD91bxhauNE+VC9L7
 i0S+j9ExNiwUE+My0Qbsg+A+/KZC8Qd+mjLuVKBqm2iI0RimZchk5dVoLK/8ryx3nrLj
 +m4Soh3qv+HhjNBA+hqzqFTXKu+3VjdBFkJkKuFYaD2wtYpGQHjRky+m9PJ0wTmCO2/K
 hUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FGmHlE3NA8pW1QRQIYfUudvTdow1PIArtypupjNj5iQ=;
 b=MPZiXtpnnuunOIGpJV+UaIQnP9X/huoXr2L+mezOGENsHgNJ1qZ2vUXzCxc8H9WEH+
 GsIUEQZhfukkGHmbctWAQr8787rHpeMCHyzuw6h23OTc7dnToz2uiQOImu8yUpTU+lad
 F1XwmEVd+vBcv7gUlxyKLyE3ATBpWTggCBXzW6YgwDLurLL86/kblUqAaQJaIWD5WX3q
 K6EmAMUHYnIfth6U60BlZAPiZhjG3JG7v5J6WIqvEBgRJRVRIYKHBx5vlttyQVB5DlSD
 TbJ1fk1uG4h4pPPQEGkACh+1PDwmazsNrDC0kdYNirWfYn+P9Hg3WtUlBH1U6PkUd3BQ
 eFNw==
X-Gm-Message-State: AOAM532JH+sExvgUpiH0vsyfWv3XS5/GKH5JbCY730KJ2gjzLGa/z1oF
 x7UsrvbrAfr8jdJB9/a1wCxRUE9EtQdmSGUM1SnCthlTUcw=
X-Google-Smtp-Source: ABdhPJx/1dv/lfjZgcrLdUDOvjmE4Vgvn2FHRzVDxtsgLqkx3dw4IBjEzGnW8CX4ooxxkrsBQbiGoAfFQf/90Dx8LsI=
X-Received: by 2002:a50:dacf:: with SMTP id s15mr43016471edj.136.1593789641256; 
 Fri, 03 Jul 2020 08:20:41 -0700 (PDT)
MIME-Version: 1.0
From: Tim Nugent <timnugent@gmail.com>
Date: Fri, 3 Jul 2020 16:20:30 +0100
Message-ID: <CAHS1D9Lf9k09=brcFjvA3rOQxGcY8tB-6hr85piQ00WD1odqjw@mail.gmail.com>
Subject: Xone32c bNumConfigurations issue
To: alsa-devel@alsa-project.org
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

Hi alsa-devel,

Having a few problems with the Xone32c though not sure if this is an ALSA
issue or general USB stack problem.

It's a USB soundcard that is supposed to have 4 inputs and 4 outputs. It
seems to have 2 USB configurations (bNumConfigurations : 0x2). When plugged
in, bConfigurationValue is 0x1 and only 2 inputs and 2 outputs show up.
Change this value to 0x2 and it shows up (as it should) as 4 inputs and 4
outputs. Here's the full USB description:

https://pastebin.com/DDPXv5c1

I can change the bConfigurationValue with this udev rule, or with a `echo 2
> /sys/bus/usb/devices/1-1.4/bConfigurationValue`:

https://gist.github.com/timnugent/ed65a79b2bd6c63788bfada3624756a4

This has all been working OK on Ubuntu 20.04 running kernel
5.4.0-33-generic. However, I just updated to 5.4.0-37-generic and now there
is only a single USB configuration (bNumConfigurations : 0x1) and
bConfigurationValue can't be changed to 0x2:

https://pastebin.com/th9VRH0q

echo 2 > /sys/bus/usb/devices/1-1.4/bConfigurationValue
bash: echo: write error: Invalid argument

So this could be a regression in snd_usb_audio, or maybe usbhid - which
`lsudb -t` says are the drivers. This behaviour (only 1 configuration) also
happens on a Raspberry Pi (Raspbian 4.19.66-v7+) - I haven't been able to
get it to work at all.

Thanks
Tim
