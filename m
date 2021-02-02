Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F353130C6C7
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 18:02:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770F21770;
	Tue,  2 Feb 2021 18:01:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770F21770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612285349;
	bh=165+5jtQ5b5YtPfHLV0SRhCeHvf4Omhrorun1CeJg30=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IH/sLYL8YxfAHM8eWBxIjsr49rv4GlsN4rdZz099XCuJYlOCwjYLDtNwsRVxH1YvJ
	 7iNkrA5L35nZZHpNLHUib1ehJ7sKbNi/wDcHezENlTEnMn1NMkXTcz8zwse/rXQmHm
	 V6yYGygSOvYDF+mjjDTcshqPi3zrjRWlhydPsmhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA40F80109;
	Tue,  2 Feb 2021 18:00:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B849AF80171; Tue,  2 Feb 2021 18:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDE72F80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 18:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDE72F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bertschiettecatte-com.20150623.gappssmtp.com
 header.i=@bertschiettecatte-com.20150623.gappssmtp.com header.b="vWLd7JK9"
Received: by mail-yb1-xb2d.google.com with SMTP id m76so14364964ybf.0
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bertschiettecatte-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=165+5jtQ5b5YtPfHLV0SRhCeHvf4Omhrorun1CeJg30=;
 b=vWLd7JK9ItxTuqdZlpWd7NU+CzrOHkUSE7SKk/0p6n3bqlGYhi9A19vBtmZYjCod61
 jpkt+KzFmXGaGnDcYRVdXkUfVOqXmSN0oITb0g2s1RtPXIkdB4Hv7DBLaT+tqeU7o9NU
 CyLxfWPrk0/wTTXzI4dFg9YtNPuQX8Lmg0hvw5jmNvF6rm5xMKrdmMvwVQFKOEi9o81m
 IKz7okVpCqtXbnsoQFcK53utZ/ho2pkPrjn8VTVcVTRf9w4RPRhZQf8KSyJoVSkn0FTX
 HntUPrhvKPe7d1DaVomLMbC7DKRkeC8OmQGgf/bUx4JsykQYvfb0jguzsHDhIaDM0fwl
 tsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=165+5jtQ5b5YtPfHLV0SRhCeHvf4Omhrorun1CeJg30=;
 b=Euq8aNQZdXPL6i7xQ2Dckc2yeRfM3+mlbmWZh4RVEcmezkDs3bnBUHIhI1iMqFnwSx
 VfaE2AX5NMuVtNj7ceiP5k4wvijgb6qaJYsf9GHMI8UnJeVun+sZi595JpdrAj87T34x
 nwbpnExkd26/uPADf6ds5yI1KUiKa5SofY+32Iz7E3Q0iiOv9RpgwV5FyS0SA/mjJG9k
 qbPM+0tdQ1ZGHeBDNxgPpuJ7LaGoardCwj5iUXyQ17xIUJkSXYN4RfFGuG15CQZ8V5GD
 /nQhxvXCLn0xMgqo1OnG5ovw1HI0Laz4pXeqhOHN7hNdb+w06LRjX2yD+/xby7TJ4drb
 ytEg==
X-Gm-Message-State: AOAM533x7GeklQNHgFpDHvtdOnXHzCTB2Guxwc0vqJ22lpMbRmv7vAFf
 xewiivT02bbmzS5PesupV5K5qWYHx3RhCFu8jyA9kVptT08=
X-Google-Smtp-Source: ABdhPJwqDYJOKf7yNYz19r2QsxO9DXfYy0BBt5zxDJsfLxy8dDI5sL9M1aCUGFZEJaVhsoLpr88LcVHjqGixn57tsfA=
X-Received: by 2002:a25:31c3:: with SMTP id
 x186mr32357767ybx.500.1612285242815; 
 Tue, 02 Feb 2021 09:00:42 -0800 (PST)
MIME-Version: 1.0
From: Bert Schiettecatte <bert@bertschiettecatte.com>
Date: Tue, 2 Feb 2021 09:00:31 -0800
Message-ID: <CALd3UbT7DcXSmLO2VEDReY5aft5shpeEBS_wg7bWpoC6Q3qxzQ@mail.gmail.com>
Subject: question about ALSA devices not showing up in buildroot build
To: alsa-devel@alsa-project.org
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

Hi all
I am working on getting my ALSA machine driver and codecs working. I
ported over my code which was based on 4.11, and I'm using 5.9.12 at
the moment. At first sight everything seems to be working, but the hw:
, plughw: etc devices are missing and when I list the PCMs with
acrecord -L, I don't see any, even though arecord -l does show the
card. I am using buildroot for my rootfs. So I am wondering if this is
an issue with incorrectly defining the structs in my driver code, or
if this is an issue with missing package in my buildroot config, or if
this is due to a missing configuration file for ALSA in the rootfs.
Previously I was using an off the shelf linaro rootfs when I was still
on kernel version 4.11, and there the PCMs were showing up correctly
and I could see the multiple devices such as hw:, plughw:, dmix: etc.
Thanks!
Bert
