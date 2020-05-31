Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DBA1E98C1
	for <lists+alsa-devel@lfdr.de>; Sun, 31 May 2020 18:09:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054F816C5;
	Sun, 31 May 2020 18:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054F816C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590941362;
	bh=pJNWQEoca/rHPK2LstY6sZdd0OcZgpxamNcM2T6gKGk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P1a/zCgM2265ZdIuiXNWTN2P8/nRHgU27JSofOx5Z90kLQzwmTcM3NNkpw9lX7F3H
	 mU0n3eMXd0xFdH4qv+ss9tN7PVIof/KwTxpgd7KpjuPsBcZK/tbHsEo7ayHdTziCL5
	 lJ1O3dSgylu9DLWiOjTrUbq+ZTlJuSLeuZqEPZbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D35F80260;
	Sun, 31 May 2020 18:07:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF519F8023F; Sun, 31 May 2020 18:07:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx.slunecnicejitka.cz (rosemary.pkrn.net [31.31.72.173])
 by alsa1.perex.cz (Postfix) with ESMTP id 5D8E0F800C2
 for <alsa-devel@alsa-project.org>; Sun, 31 May 2020 18:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D8E0F800C2
Received: from [172.31.0.131] (ip-94-112-38-60.net.upcbroadband.cz
 [94.112.38.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: poki@poki.me)
 by mx.slunecnicejitka.cz (Postfix) with ESMTPSA id 64538414B5;
 Sun, 31 May 2020 18:07:31 +0200 (CEST)
Subject: Lenovo P520/Realtek ALC662 - front jack & mic in (Was: Cannot get
 Lenovo P520/Realtek ALC662 to produce sound)
To: alsa-devel@alsa-project.org
References: <ebbabedc-195b-afb7-d1e6-ce5523f92530@poki.me>
From: Jan Pokorny <lists@t.poki.me>
Message-ID: <e523ea58-892d-4ab7-58aa-beb3c94a10a3@poki.me>
Date: Sun, 31 May 2020 18:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ebbabedc-195b-afb7-d1e6-ce5523f92530@poki.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Kailang Yang <kailang@realtek.com>, Mark Pearson <mpearson@lenovo.com>
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

Ok, I have some new progress to report, since best way to get
out of laziness is to open the can publicly, right? :-)

On 5/31/20 4:05 PM, Jan Pokorny wrote:
> As the linked commit indicates, the proper model parameter
> to snd-hda-audio module is dual-codecs.  I've tried that,
> and a handful of other models, to no avail.  I considered
> the possibility the problem is just that I cannot work
> with "mute" state properly, so tried everything I could
> (incl. alsaunmute), again, without any change.  Next
> dimension to the matrix was attaching external speaker
> to the front connector.  Nothing has helped.

So now, with dual-codecs model explicitly requested,
I finally tried to attach the external speaker to the rear
sound out connector (this location is not very convenient
for me, that's why I was skipping it so far!), and to my
surprise, the long awaited sound is here.  Awesome!

But that's just one point out of many, since it seems
things are rather crazy, especially:

When I have this rear connector in use, and attach headphones
to the front "headset" (per depiction) connector, pavucontrol
changes the output from "Line Out (plugged in)" to "Headphones
(plugged in)" -- leaving the former still "plugged in" --
which read "Headphones (unplugged)" before, but its
respective slider effectively also controls line out,
and nothing is going out of the headphones on said
front jack.

Neither an isolated microphone with rear mic jack or
front headset jack nor a proper single-jack headset with
this front jack connector works.  "Analog Stereo Duplex"
mode being selected was double-checked for that.
Tested with observing no indication of signal in
pavucontrol, assuming this is reliable way to test.

So, what can be done about getting these work?

* front panel headset jack
   - headphones mode only
   - headset

* rear mic jack for the mic

* internal speaker without said noise, just in case it is
   ever needed as a backup ... it definitely worked rather
   well under Windows

Where these tested at the time of the original fixup being
prepared?  Is it possible anything has changed hardware-wise
since then?  What diagnostics can I provide to push this
towards resolution?

Also, what may still be slightly unsettling, I don't see
the string "HDAudio-Lenovo-DualCodecs" present with said
fixup anywhere, should I?

Thanks

-- 
Jan
