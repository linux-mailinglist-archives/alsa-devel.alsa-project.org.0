Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D330D933
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 12:53:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D57371771;
	Wed,  3 Feb 2021 12:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D57371771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612353212;
	bh=2K5gO5AYojQ+H+BrQx6ayqqOhXB3kgclkO1A8grhYkc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a6c93t9bSrIVDqAGb88XSi16dwhA0Yl7Ni41lUVZku58NqD9o5PpoDzCtap+IUs9z
	 9oTUjFsOeODK/JcZ6M6f1x2YL0Xz3kEfGdHJa5Fl+fY9b3CmRWlvm4laGlv6dOOIPc
	 R7w8YFmiUGoWF0AU1YNgWPFC2j6bH2EtEKEmkIB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C1B4F80154;
	Wed,  3 Feb 2021 12:52:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98023F8015A; Wed,  3 Feb 2021 12:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74E26F80155
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 12:51:50 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8AA58A003F;
 Wed,  3 Feb 2021 12:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8AA58A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1612353109; bh=X8YHLR01TwdI+Nw3O+bnBPTFIPK61iCW/5XYfXikl6A=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=J8MsY6ys9weLbZqvWPVSt8Pvm2D2mTK95ff2JECHt4CjrHERqLvZEjUxvCGvwTuRH
 Pxyn7YrsrghwdJ/MbjeWNjTEpFy+PyMqVWVlIi/IeRfvzTVwQCp9R7ObAVXiBkltZb
 iy/hRT9yHFXjodkpG6Lhc5rxzmoC3i6+77Wv6ljg=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  3 Feb 2021 12:51:47 +0100 (CET)
Subject: Re: question about ALSA devices not showing up in buildroot build
To: Bert Schiettecatte <bert@bertschiettecatte.com>,
 alsa-devel@alsa-project.org
References: <CALd3UbT7DcXSmLO2VEDReY5aft5shpeEBS_wg7bWpoC6Q3qxzQ@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <4391d9b1-acee-94dc-5c5f-aa53b9eae6d9@perex.cz>
Date: Wed, 3 Feb 2021 12:51:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CALd3UbT7DcXSmLO2VEDReY5aft5shpeEBS_wg7bWpoC6Q3qxzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 02. 02. 21 v 18:00 Bert Schiettecatte napsal(a):
> Hi all
> I am working on getting my ALSA machine driver and codecs working. I
> ported over my code which was based on 4.11, and I'm using 5.9.12 at
> the moment. At first sight everything seems to be working, but the hw:
> , plughw: etc devices are missing and when I list the PCMs with
> acrecord -L, I don't see any, even though arecord -l does show the
> card. I am using buildroot for my rootfs. So I am wondering if this is
> an issue with incorrectly defining the structs in my driver code, or
> if this is an issue with missing package in my buildroot config, or if
> this is due to a missing configuration file for ALSA in the rootfs.
> Previously I was using an off the shelf linaro rootfs when I was still
> on kernel version 4.11, and there the PCMs were showing up correctly
> and I could see the multiple devices such as hw:, plughw:, dmix: etc.
> Thanks!

Add "defaults.namehint.extended true" line to your ~/.asoundrc or
/etc/asound.conf file to list hw/plughw devices.

For the driver test - 'aplay -l' is more relevant.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
