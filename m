Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D97EBC8AAF
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 16:15:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48607167C;
	Wed,  2 Oct 2019 16:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48607167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570025719;
	bh=0V4vnxTa+lSFVG59gUdhSXKa3VX+3c0MOYhvbPFuyjw=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u7H5dtsU21iWF55i7ixSHTUESaJfqaU0al6N++aiCmPppOUH6yLiYMZ6bs2ZqQx8u
	 CVZGANiwnZFak8/X8YylqkEuKZXpkSbgILFDt7Hz+2eKU4lH1LvIxDKn+J1FdGSWw2
	 GqzPooN/8RVdzdwNcyZI5d0pZDCw9KUr7UjpNlB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96AD9F80391;
	Wed,  2 Oct 2019 16:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C18FF80391; Wed,  2 Oct 2019 16:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CE31F800DE
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 16:13:28 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4BD40A003F;
 Wed,  2 Oct 2019 16:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4BD40A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1570025608; bh=vOSCHGYRk+8DBuOlWWcRyJNntndxCeuIZTE1nwSbJNA=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=nj1QxN8bQ5P4SAjhOUh744EDjA3tYBHmFSA4R/PSCxlG3rVJhsaj09l1eqtzPhsNG
 GSJR3SgEhjTc8IrsORQOlZTMoFdeAqf5QEV5OB5ushA8VZrkXm8EEYrfTdnqF3r6jY
 kk1SMy9IBsRvj4MQpxk7zyc6OuuBWtI9pO7glW/I=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  2 Oct 2019 16:13:25 +0200 (CEST)
To: "Andrea Narciso - ART S.p.A." <andrea.narciso@artgroup-spa.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <AM0P192MB03532F4DBA062D95D86107A2BA9C0@AM0P192MB0353.EURP192.PROD.OUTLOOK.COM>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b25a0ca0-a516-7a1b-ea1b-e980ff881c19@perex.cz>
Date: Wed, 2 Oct 2019 16:13:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <AM0P192MB03532F4DBA062D95D86107A2BA9C0@AM0P192MB0353.EURP192.PROD.OUTLOOK.COM>
Content-Language: en-US
Subject: Re: [alsa-devel] Period size setting is ignored when dmix is used
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

Dne 02. 10. 19 v 15:56 Andrea Narciso - ART S.p.A. napsal(a):
> I would like to set different period size (or time) values for different ALSA applications, in order to optimize latency and processor load based on specific application needs.
> For example, a telephony application will use a shorter period size/time than a media player application, so that low latency does not affect the quality of the call. 
> I found out that if dmix plugin is used in the ALSA path, period size/time settings are completely ignored and forced to default values (supposedly read from the ALSA driver of the HW card).
> 
> For example, not using dmix, period size value is correctly accepted (but of course I cannot play audio from multiple applications at the same time): 
> aplay -vv --period-size=4096 -D plug:hw <WAV file name>
> Plug PCM: Hardware PCM card 0 'HDA Intel' device 0 subdevice 0
> ...
>   period_size  : 4096
> ...
> 
> Adding dmix instead, I can play audio from multiple applications at the same time, but period size is ignored and I cannot therefore set different latencies for different applications:
> aplay -vv --period-size=4096 -D plug:dmix <WAV file name>
> Plug PCM: Hardware PCM card 0 'HDA Intel' device 0 subdevice 0
> ...
>   period_size  : 1024
> ...
> 
> Am I missing something? Is there a way to implement mixing + different latency settings in ALSA applications, without using an audio server? 

You must set these parameters in the dmix configuration which is shared by all
clients. You cannot set the buffer settings per application for the shared buffer.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
