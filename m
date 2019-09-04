Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC1AA86B3
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 18:49:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28AB81681;
	Wed,  4 Sep 2019 18:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28AB81681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567615742;
	bh=/pA49+hPxpGpLpX50TcxNRMorsqpH/eAKTv18RUkrzM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=sue//it6JGoaZedGgYnkOrosD/ZIzYEdYVZ+ZGTV6dPrSlkYYpA5CicXUD/P6IJ5t
	 p4KAErx8/2BCPknJDUHDIVC7HN+Y+e92bvyYdftmK9wJS0FINWXgwYYhH4dB/KyLEo
	 SqFAVIQdQYkCeLPmogFDjrzuQYJLWSeYAhpRvvnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02F15F803D6;
	Wed,  4 Sep 2019 18:47:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D400AF803A6; Wed,  4 Sep 2019 18:47:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from egnor-li.ofb.net (egnor-li.ofb.net [IPv6:2600:3c01:e000:283::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5B39F80228
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 18:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5B39F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ofb.net header.i=@ofb.net
 header.b="cf+kKm8D"
Received: from ofb.net (163.242.197.104.bc.googleusercontent.com
 [104.197.242.163])
 by egnor-li.ofb.net (Postfix) with ESMTP id 1D73B117FC8;
 Wed,  4 Sep 2019 16:47:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [173.239.75.234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by ofb.net (Postfix) with ESMTPSA id D24873E883;
 Wed,  4 Sep 2019 09:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ofb.net; s=ofb;
 t=1567615627; bh=2Da5mp1UzPtaC7ERWpHqOYdabdeauRvroz5AeUur6eI=;
 h=Date:From:To:Cc:Subject:Reply-To:From;
 b=cf+kKm8DwuIMq3xz4hE2dFsKtfjY3xXxG6E/3WNwtpLgF9hS8BQrWtCwsLjC3NeRG
 FF27ImfbGQD7seGntI9bQ5TH1JLgFdWwuK2602IkPYJi/6IezFi47dXsnAbyO5CFSA
 42YqA5RXXRnYCbwQrGhhsawZe4vsfao2kNUdSyNW1/AeG6HRDOTkuuutAEaBVLH2iC
 T5as3OV8bVFL5FZQ0pP9Q4AewAjeT+eUJomg24QlFYot7YofCMrkvMici629utjGuJ
 5sYgjhY/nzh2whi2R/QcXuOeoT9L8euQTk9d65HfV1pQAaI25pkIE2xEOOsgCjA5AN
 Cv9sl8d9miHoQ==
Received: from frederik by localhost.localdomain with local (Exim 4.92.1)
 (envelope-from <frederik@localhost.localdomain>)
 id 1i5YR0-0001ek-Sc; Wed, 04 Sep 2019 09:47:06 -0700
Date: Wed, 4 Sep 2019 09:47:06 -0700
From: frederik@ofb.net
To: alsa-devel@alsa-project.org
Message-ID: <20190904164706.gwjbcywbj7emnwvr@localhost>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Cc: alsa-user@lists.sourceforge.net
Subject: [alsa-devel] parameter for pulse device?
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
Reply-To: frederik@ofb.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear ALSA,

In my ~/.asoundrc, I have lines like this:

    pcm.mic { type pulse; device "mic" }
    pcm.monitor { type pulse; device "monitor"; }
    pcm.music { type pulse; device "music"; }

to make it easier for ALSA-aware programs to input and output via PulseAudio, e.g.:

    ecasound -i alsa,mic -o alsa,monitor -etd:...

However, I would like to simplify this and not have to update ~/.asoundrc every time I create a new PulseAudio device. Since ALSA has the ability for PCMs to take a parameter, I thought this might work with the "pulse" PCM and the PulseAudio device name. But I get an "error: Invalid argument" when trying to pass the device name as an argument to the "pulse" PCM:

    $ ecasound -o alsa,pulse:music -i some.wav
    ...
    ALSA lib conf.c:5014:(snd_config_expand) Unknown parameters music
    ALSA lib pcm.c:2564:(snd_pcm_open_noupdate) Unknown PCM pulse:music
    ERROR:  Connecting chainsetup failed: "Enabling chainsetup: AUDIOIO-ALSA:
    ... Unable to open ALSA-device for playback; error: Invalid argument"

Is there some magic with macros that I can use to accomplish this syntax, or can we add the ability for the "pulse" PCM to take a parameter naming the device?

Thanks,

Frederick
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
