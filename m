Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D7157D74
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 09:47:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8234916FE;
	Thu, 27 Jun 2019 09:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8234916FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561621650;
	bh=0+gdn8F1ML90bPGLYiBqi1NRW+wT7oaj/hugr0Vq2xA=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZMx18cGokzSEf3xPV4bWLf/OYHVXtM31KpjufNF9Kq6/egW4Z644P5auX43Paldzz
	 ZhfxDQALcIUI1/TSTdbbCYZhmGqHisSGMpde7bsCbsZDYs8yY+Mt1oYaxTiGBdG3kD
	 FLlzr/fW1m3Y5QpQ4STAhX391WNhebawVYNUCsDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D48A4F896F9;
	Thu, 27 Jun 2019 09:45:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71ADCF896F6; Thu, 27 Jun 2019 09:45:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0069F80C0B
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 09:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0069F80C0B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nR+t+dxi"
Received: by mail-lf1-x12b.google.com with SMTP id 136so873695lfa.8
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 00:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=8NAWQn/PJbynOZwoj/0AAzzKzDSA51BaXvYXs5uutik=;
 b=nR+t+dxiP0YEr+U3Xjgjl8Nj0RygdQJ+zlgFBQORBSPQ2sJWwF8fVbH8T3N3iQLBB2
 xz0I25BrT9pYMH8OBjlYV56ZoOBR17bAMWUYRZRcFzTRqVXUaD/ndfSjUHjkxTZrTMoy
 wFt5h2RI5qM2aLIHkXwblcTHS4a28o1ln48oktXSHmguWPt3wjuVDzkPKYdS2hc2XM4d
 Y4ChzjPBZBmsBFIbuxKslnfRoZY6KTTwtU6baTaHBjDHkxrIq67DOXnif7pg3tCdgRja
 x4yZxKXYnPd5iENoleHvtyQXQu1kRtXQZRaLII99OjMHZJ+nZOUg+6jrMrB/EO5eQyTQ
 5b2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=8NAWQn/PJbynOZwoj/0AAzzKzDSA51BaXvYXs5uutik=;
 b=DQ58rIPDudoCghnoulbyuQxPG2WLfKZ7SLXvMfwmQeqPntZJRe1mb9YoxxG351o5VG
 LW6vyRJK6mLPUZTrxzIn+1UqEOxAH+ZsWAMbZ3vY/MOg/9ekJLUPjbyVIT1RtdcPppIM
 RkRIJNNSsWLVpBjM4xelQrP91SNjj7vuWMCtokJYP9t72dYoZcp+aAkNLhpZQb45LCFc
 7eWSjhaLNDQpM58uCSkcNLas6B1o8WgndEORrgmtaPSVoa7m0WNuTo+ycyYxsTFatgFT
 f2E7aQLk9OMX6cynp4SFMRTNBHZuz5ts8F/GC00wHMfyf8wBojCY8GUCxpgoA7Mhveck
 +EiA==
X-Gm-Message-State: APjAAAVzydelcLm+SVdZvfmtNNOb+5lhDEdkYKhBcwQ/bnWJAQ6yA8UC
 SORM8EFl1iIq0b7/y0T9POzQ+VuEGfPZLeF12m5LBqS4
X-Google-Smtp-Source: APXvYqyZ52tO3DeOmzBqUqn8fjobGypMgeFuOt+T/rBu5c1iscU4fdaU17vCBMWYtsJ7Mza4YVh5vyZpvu70WWuKUfg=
X-Received: by 2002:ac2:41d7:: with SMTP id d23mr1297120lfi.118.1561621539079; 
 Thu, 27 Jun 2019 00:45:39 -0700 (PDT)
MIME-Version: 1.0
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 27 Jun 2019 08:45:27 +0100
Message-ID: <CABPh3UNCZhssHLmZF2paU4EKOK1WKScbC7Vw=uGfJn7WUeXO3Q@mail.gmail.com>
To: alsa-devel@alsa-project.org
Cc: info@jensverwiebe.de
Subject: [alsa-devel] [BUG] Line6 Helix / X Stomp:
 parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates
 (clock 16)
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

Hi all,
I just purchased an HX stomp and when I connect to linux I get the
following error message:

    [  322.404503] usb 1-6: new high-speed USB device number 13 using xhci_hcd
    [  322.531804] usb 1-6: New USB device found, idVendor=0e41,
idProduct=4246, bcdDevice= 2.00
    [  322.531806] usb 1-6: New USB device strings: Mfr=1, Product=3,
SerialNumber=2
    [  322.531806] usb 1-6: Product: HX Stomp
    [  322.531807] usb 1-6: Manufacturer: LINE 6
    [  322.531808] usb 1-6: SerialNumber:    3021888
    [  322.535789] usb 1-6: parse_audio_format_rates_v2v3(): unable to
retrieve number of sample rates (clock 16)
    [  322.535907] usb 1-6: parse_audio_format_rates_v2v3(): unable to
retrieve number of sample rates (clock 16)

I have some kernel development experience but not a lot with usb so
can someone point me where to start looking?

there was a previous discussion on the mailing list related to this by
Jens Verwiebe (and other request for help).
Here are the relevant patches/discussion

    https://www.spinics.net/lists/alsa-devel/msg71459.html
    https://patchwork.kernel.org/patch/10113121/

If someone can help me I have an HX stomp here and time to do some debugging.

Also if someone from Line6 is listening would be helpful to have some hints.

Cheers
Nicola Lunghi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
