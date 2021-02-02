Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B67CE30C765
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 18:22:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 393601771;
	Tue,  2 Feb 2021 18:21:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 393601771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612286523;
	bh=wxsPL5JkRIBGpS3q84i0+uWrEBsTUallVlLW6FnphHo=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxaHYXYtlSHrnBB0D406t1Mz1dY3JIyCTuDEKDqxVr0INvKZAGW89YopIb5uXIQyT
	 0LrMMafFGAXZxb7WNnv+karN/Q79FgSsxyQIygS8s17Yh1Xvg/CKbY9mSV7AcnyyuH
	 ghhbMqk6Pi0krsNCDlpeP/wH+ATacuY+/izBn02c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81832F801F7;
	Tue,  2 Feb 2021 18:20:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3192F80171; Tue,  2 Feb 2021 18:20:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F86FF800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 18:20:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F86FF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="DT2d0Wl1"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="BvWa5Jyf"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 4C20DA188BD0F;
 Tue,  2 Feb 2021 18:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1612286420; bh=wxsPL5JkRIBGpS3q84i0+uWrEBsTUallVlLW6FnphHo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=DT2d0Wl1LaFzpLY7iQItFdSatYowvEg7fT71DQZhbpkc/1DGgMmcrH5kmtaERyoI2
 9DECvNt5Yr8wP8/kztGu1MQuDruZ8uzUmn6O/KO2hIWH0N+QgNOUodpyYwO8FQqJAM
 xkTrG96FglxbP6SjPoeBT1wPbpR79ZxEhIGLa7jU=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iDKDeOTy2TG; Tue,  2 Feb 2021 18:20:14 +0100 (CET)
Received: from [192.168.105.119] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 7C796A188BD0C;
 Tue,  2 Feb 2021 18:20:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1612286414; bh=wxsPL5JkRIBGpS3q84i0+uWrEBsTUallVlLW6FnphHo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=BvWa5JyfQZ9s50NDyPDqeYuxHLwD3IvxiQfJWNfy32nJczUx6aZNZVuablMhvaqXW
 UIZEUE5uDnnmBHhAFqS01MO9yqJdAtBkbS9yc0e/w4JU8wfzw6Hgb4jphursaOXnoe
 M+iUsNsLTDmz7TV9qoXOPOird4vPYGYcIebgMp4Y=
Subject: Re: question about ALSA devices not showing up in buildroot build
To: Bert Schiettecatte <bert@bertschiettecatte.com>,
 alsa-devel@alsa-project.org
References: <CALd3UbT7DcXSmLO2VEDReY5aft5shpeEBS_wg7bWpoC6Q3qxzQ@mail.gmail.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <9b19b22c-b096-2ba9-8323-5d3fd9a9ef49@ivitera.com>
Date: Tue, 2 Feb 2021 18:20:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CALd3UbT7DcXSmLO2VEDReY5aft5shpeEBS_wg7bWpoC6Q3qxzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hi Bert,

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

Do you have the /usr/share/alsa configs?

Pavel.
