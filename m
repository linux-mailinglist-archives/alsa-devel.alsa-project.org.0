Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C8465A654
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Dec 2022 20:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F2314240;
	Sat, 31 Dec 2022 20:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F2314240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672515397;
	bh=HW5NYXHwfaJpYlQDZI62Ts1zbYkDtVaLQ5DQkeI8+8o=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mnkaB8Ppd8AFO3s36IAd7ihXQTtPAR3U5Axem9+vTXZqVwz7YmJJ8+IAtW9mWCgDk
	 kRNagrI3+iz7xbs5nniL6JX+YPn8H4HXbhwRXBXduQBacjpMSwgHYNQPAZgNUGP3ZK
	 ol1VlZQS/1wkDaE7jzE4SMOIpU7fyOE9fU6d57Y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53D7CF804E7;
	Sat, 31 Dec 2022 20:35:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24C15F804D0; Sat, 31 Dec 2022 20:35:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB081F80144
 for <alsa-devel@alsa-project.org>; Sat, 31 Dec 2022 20:35:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB081F80144
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=ix4TDoSU
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 18947A0046;
 Sat, 31 Dec 2022 20:35:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 18947A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1672515335; bh=445zeGDj5axHzpHbYrKnGtdVB3dyz/RsKewaXM9iGtM=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=ix4TDoSUuxVK6ehDzfke6bdRt06K5o2O4bQdzHwWLu+pWVNDC5bEjRzKs2zzWElZ9
 5daY2+bZaLApdg4H1lkPp3IGgKQxDqdJnNTTQayXnirJCNX0ARpoSGUBK8NKTv8vPr
 k9X7NJ40OhJei5G0C0RCFI+PtM4jb//oP5iNGbTk=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 31 Dec 2022 20:35:33 +0100 (CET)
Message-ID: <5b276f02-2792-36e6-55e1-a1cdbc389453@perex.cz>
Date: Sat, 31 Dec 2022 20:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Front Audio (Headphone) and Optical Not Working in Rocky Linux 9
Content-Language: en-US
To: yakajirri - a001 <a001@yakajirri.com>
References: <80606087-3b92-c06a-ec3a-a37549a33017@yakajirri.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <80606087-3b92-c06a-ec3a-a37549a33017@yakajirri.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 31. 12. 22 20:16, yakajirri - a001 wrote:
> With Rocky Linux 9 (clone of RHEL 9), I do not get audio of the front
> headphone jack or the optical output on the back.  I do get audio out of
> the line out on the back.  The front port does not work with Rocky Linux
> 8, Ubuntu and Fedora, and I did not test the optical.  With Windows, the
> front jack works as expected with the realtek driver installed, and I
> did not test the optical on Windows.
> 
> The output of /usr/sbin/alsa-info.sh is here:
> http://alsa-project.org/db/?f=0d71a1351cd49f220c36fe69cc9af93f1d71ee3c

Card sysdefault:0 'Audio'/'Generic USB Audio at usb-0000:00:14.0-11, high speed'
   Mixer name	: 'USB Mixer'
   Components	: 'USB0414:a012'

...

> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/USB-Audio/USB-Audio.conf
> has more If.realtek-alc4080 entries.  When I copied the
> If.realtek-alc4080 section into
> /usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf and
> /usr/share/alsa/ucm2/conf.d/USB-Audio/USB-Audio.conf, and after I
> rebooted, I get the same performance.

The configuration for your hardware version is missing in UCM.

Change 0414:a00e string in Regex (If.realtek-alc4080) to 0414:a012 for a quick test in USB-Audio.conf. And yes, use the latest USB-Audio.conf, Realtek/ALC4080.conf and Realtek/ALC4080-HiFi.conf files from github.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
