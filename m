Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46A1EBB21
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 14:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DCFC1655;
	Tue,  2 Jun 2020 14:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DCFC1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591099277;
	bh=xDMqWyPA6Yg9BwVj4WXUJkQieCSekhRsGYQKyX4kifI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c4PbWbsACLN+DKRytY4/92JzyVnoRPl3Z+SnP7P4t/VGzuUn/yzCln94UpLqjhXJE
	 y5jcUZvp+iWQTBLkaQ1wzYKzSZDAV5M5sjq9jn/qoudUk6mggyftxgBX0lnJzTUHmo
	 gMJvy7H7DtK2VKdoOG3riVPxkL8LBymS6dhtxWnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D508F80260;
	Tue,  2 Jun 2020 13:59:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4E6DF80274; Tue,  2 Jun 2020 13:59:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx.slunecnicejitka.cz (rosemary.pkrn.net [31.31.72.173])
 by alsa1.perex.cz (Postfix) with ESMTP id 88855F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 13:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88855F8013D
Received: from [172.31.0.131] (ip-94-112-38-60.net.upcbroadband.cz
 [94.112.38.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: poki@poki.me)
 by mx.slunecnicejitka.cz (Postfix) with ESMTPSA id DE7554148A;
 Tue,  2 Jun 2020 13:59:28 +0200 (CEST)
Subject: Re: Lenovo P520/Realtek ALC662 - front jack & mic in [FIXED]
To: alsa-devel@alsa-project.org
References: <ebbabedc-195b-afb7-d1e6-ce5523f92530@poki.me>
 <e523ea58-892d-4ab7-58aa-beb3c94a10a3@poki.me>
 <b25fc548-981e-5ae6-2895-ef9eb85912e1@poki.me>
From: Jan Pokorny <lists@t.poki.me>
Message-ID: <f9cdb458-9e2e-c23b-675b-8b3ea55a8b51@poki.me>
Date: Tue, 2 Jun 2020 13:59:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b25fc548-981e-5ae6-2895-ef9eb85912e1@poki.me>
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

Problem solved!

The solution was as simple as installing alsa-ucm package.
(Extra credit to Mark Pearson for pointing some recent changes
in that project out to me.)

Color me very embarrassed.

Perhaps the intention of keeping the package set minimal backfired
(EDIT: nope, nothing seems to be actively associated with that
package incl. opt-in ones), but frankly, have never needed this package,
not even heard about it before.

I wonder why there are no pointers anywhere, at least in alsa-info.sh
output that would perhaps make the case clear for the experts amongst
you.  Or somewhere else, where it could be raised as a suggestion:

   It appears as if you have a card/coded that relies on UCM for it
   to be used to the full extent, and UCM does not appear to be
   installed.  Try installing that software, commonly packaged as
   alsa-ucm.  Having it up-to-date may also help.

[if not anything else, perhaps at least this makes it on-topic for
the list]

Perhaps even close relationship between alsa-utils and alsa-ucm,
on the suggests/recommends level or something like that?

On the whole it seems more enlightenment towards users is advisable,
on more than one front, mainly for the ignorants like me :-)

Now, all seems to be working:

On 6/1/20 11:36 PM, Jan Pokorny wrote:
> On 5/31/20 6:07 PM, Jan Pokorny wrote:
>> So, what can be done about getting these work?
>>
>> * front panel headset jack
>>    - headphones mode only
>>    - headset

"mic only" mode doesn't seem to work, but it was perhaps never
intended, since there is always:

>> * rear mic jack for the mic

that works as well

>> * internal speaker without said noise, just in case it is
>>    ever needed as a backup ... it definitely worked rather
>>    well under Windows

irrelevant now, either do not load (default as mentioned) or
do not enable in the mixer/pavucontrol.

> Ah, this last one can be marked as checked, suddenly noticed
> that graphical terminal generated "nice" alarm just resounded
> unexpectedly :-)
> 
> Sadly, this snd_pcsp appears to be a prerequisite and it is
> not loaded automatically in this Fedora Rawhide installation
> and with this audio HW (~ no out of the box experience,
> not sure where to forward this after more testing, cannot
> immediately as it cannot be unloaded for being in use).

negative, the prerequisite was this alsa-ucm package

> The noisy sound will only appear when a separate (not
> present unless snd_pcsp is loaded) PC-Speaker (Master)
> channel gets unmuted.  Maybe I even confused cause and
> effect about this, it's all, well, confusing, so sorry
> if that was the case.
There was definitely a lot of confusion on my side.

Sorry about that and have a great day

-- 
Jan
