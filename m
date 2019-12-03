Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB6110610
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 21:40:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFDF31616;
	Tue,  3 Dec 2019 21:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFDF31616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575405614;
	bh=4ZkLQORlBG5N9WWrsR+e+wrdHR8QGJ6WoMZk7C0RGAE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NnhFxwjYC/sZb9DwIbgEwRlB0waGFIRm5jfnSCEnXlJ+U+9oAp+mQf7uuZfbEhDF1
	 tmituPkJGyFudzz4YCiJdSoHMntr1LUi8joY6wb/V9EW03h9MQYQgJIR+QAXhBxJnT
	 MeSDjedeoU8dGsI+IOsk0IeqgRgSpWIPgYKaw38E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89458F80228;
	Tue,  3 Dec 2019 21:38:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C469AF8015A; Tue,  3 Dec 2019 21:38:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 049A8F800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 21:38:19 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id F3847A0046;
 Tue,  3 Dec 2019 21:38:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz F3847A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1575405499; bh=s5AYxxxGwDmEpDv9bhteI55uSmCgeCwWVjtnQuxIM0o=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=etLKpf+I+fewMeeBmwhac4c+L+Id0YaMdVwMeZjDALoUwuPxzcz0Iqi3UfHxVDVOI
 g5CvYCav9euRayqUy3Hy7RYUGdXT/g9YXI4mxoiVX/RfnSeMZZXDmWPYvoDaNFNqq4
 7Zdu1M9+Jx1G0qQWpp0Rd6fqCz4GqqFyukuAMM/8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  3 Dec 2019 21:38:16 +0100 (CET)
To: Giovanni Harting <539@idlegandalf.com>
References: <822e0fa2-3075-7447-8c37-34dbe4e211b9@idlegandalf.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <c1a88f61-7691-a947-0857-bf0a0cee4c50@perex.cz>
Date: Tue, 3 Dec 2019 21:38:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <822e0fa2-3075-7447-8c37-34dbe4e211b9@idlegandalf.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] a52 plugin + ffmpeg with libswresample
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 03. 12. 19 v 21:12 Giovanni Harting napsal(a):
> Hello,
> 
> I'm working on restoring functionality to the a52 plugin.
> ALSA build with ffmpeg without (deprecated) libavresample does not build
> this plugin, since libavresample is missing. Archlinux for example does
> not build with libavresample anymore [1], therefore a52 is missing in
> alsa-plugins builds since that change happened.
> 
> I ported rate-lav to libswresample, which seems to work well after a
> month of daily use.
> 
> The oddity is that a config file (asoundrc, [2]), that worked fine with
> alsa-lib 1.1.6, does not work with 1.1.7+. I could not find a change
> that causes this.
> 
> I traced it down to _snd_pcm_rate_open() in pcm/pcm_rate.c, where
> keywords from within pcm {} are passed into, where it fails with
> "Unknown field card" (for example).
> 
> I worked around it by filtering out all keywords [3], but that feels a
> little unclean. Is there a proper way to fix this? I'm not familiar with
> ALSA's config parsing.
> 
> I'll submit patches for both once I figured out how to fix this.

Show us the code (for example via github or so) to look what you're trying to 
do. It seems that the configuration parser in the plugin is broken.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
