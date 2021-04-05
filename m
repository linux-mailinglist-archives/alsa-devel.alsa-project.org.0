Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DDB3541F9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Apr 2021 14:15:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D1E16CE;
	Mon,  5 Apr 2021 14:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D1E16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617624911;
	bh=NFkUt51dL4wQhXN5TpQR4x0vhK3BX1rWvieoUK5Hdnc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mnotlcx37C4+ya5ZiKqPP4Brf0QoJDDC5j07QTPzZA0O/1mkO9LTVQGMhP6nfUGLb
	 P29T487AyN2fcj/PA2PTYFFZoSZbMAtEx5KuACfIG4UJpOAwHrlmqL4Pqj+0jhmKac
	 3cCKHCngsx7WYUNY5k5OeYLHzZlhb+DHJFt92juo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C724BF8016D;
	Mon,  5 Apr 2021 14:13:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 803D5F8016A; Mon,  5 Apr 2021 14:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AE47F80124
 for <alsa-devel@alsa-project.org>; Mon,  5 Apr 2021 14:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AE47F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="O4OX3WKI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5aVuCNy44zGqMZIJs45cMPXwZ8Px5A79yE8jlxYLHsc=; b=O4OX3WKIGGYoeOiY5KzLEES8w5
 SM8r15yPo1fkeMM5w0szwJVUW/NHcqfzArryTYSm33Q/GiQ3/frjuOrRBlBbx6f31yLdeGrHSwMHX
 x2z0Zv0pCaZ57f8xKBmQreLj30l3oQGcMm4cIZQ2Ig2eLp2Y+FFrgt7P4dVIaedDGFOuuCr1GWNIT
 E1Tt1EO5sxqnyKrxdugQs0wDSNYNOwvmJCZuftOuDKEgmqNCPH2s9fX8Poof0S0KX4Qgo4nEeIb3a
 iVRV0txn8Bd84Y0stYUgRGvZHirFUZgy6+isrJB+yRhdyE1NnMx/n9SnZBxMfbJRbaNhUkjdKo1R+
 pF71aIYg==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lTO6s-007uos-Pi; Mon, 05 Apr 2021 14:13:38 +0200
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>
References: <20210324054253.34642-1-coding@diwic.se>
 <20210324124430.GA3711@workstation>
 <057ef387-9ee1-2678-29ce-d644f2a3a90a@diwic.se>
 <20210326044615.GA51246@workstation> <s5hr1k2l56t.wl-tiwai@suse.de>
 <2ca71809-9872-bfee-c19d-76b6ce143212@diwic.se>
 <s5h1rc1lva7.wl-tiwai@suse.de>
 <fbd3fc88-7a25-27fb-90ae-b4664f71d952@diwic.se>
 <s5hk0prk9p9.wl-tiwai@suse.de>
 <b2bf72a0-4f6b-7349-0666-c75826457718@diwic.se>
 <s5hwntng495.wl-tiwai@suse.de>
From: David Henningsson <coding@diwic.se>
Message-ID: <c70cf21a-ec81-955f-f6da-fe502e9b0715@diwic.se>
Date: Mon, 5 Apr 2021 14:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5hwntng495.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Id: coding@diwic.se
Cc: alsa-devel@alsa-project.org
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


On 2021-03-31 09:40, Takashi Iwai wrote:
> On Tue, 30 Mar 2021 21:35:11 +0200,
> David Henningsson wrote:
>>
>> Well, I believe that rawmidi provides less jitter than seq is not a
>> theoretical problem but a known fact (see e g [1]), so I haven't tried
>> to "prove" it myself. And I cannot read your mind well enough to know
>> what you would consider a sufficient proof - are you expecting to see
>> differences on a default or RT kernel, on a Threadripper or a
>> Beaglebone, idle system or while running RT torture tests? Etc.
> There is certainly difference, and it might be interesting to see the
> dependency on the hardware or on the configuration.  But, again, my
> primary question is: have you measured how *your patch* really
> provides the improvement?  If yes, please show the numbers in the
> patch description.

As you requested, I have now performed such testing.

Results:

Seq - idle: 5.0 ms

Seq - hackbench: 1.3 s (yes, above one second)

Raw + framing - idle: 2.8 ms

Raw + framing - hackbench: 2.8 ms

Setup / test description:

I had an external midi sequencer connected through USB. The system under 
test was a Celeron N3150 with internal graphics. The sequencer was set 
to generate note on/note off commands exactly 10 times per second.

For the seq tests I used "arecordmidi" and analyzed the delta values of 
resulting midi file. For the raw + framing tests I used a home-made 
application to write a midi file. The monotonic clock option was used to 
rule out differences between monotonic and monotonic_raw. The result 
shown above is the maximum amount of delta value, converted to 
milliseconds, minus the expected 100 ms between notes. Each test was run 
for a minute or two.

For the "idle" test, the machine was idle (running a normal desktop), 
and for the "hackbench" test, "chrt -r 10 hackbench" was run a few times 
in parallel with the midi recording application (which was run with 
"chrt -r 15").

I also tried a few other stress tests but hackbench was the one that 
stood out as totally destroying the timestamps of seq midi. (E g, 
running "rt-migrate-test" in parallel with "arecordmidi" gave a max 
jitter value of 13 ms.)

Conclusion:

I still believe the proposed raw + framing mode is a valuable 
improvement in the normal/idle case, but even more so because it is more 
stable in stressed conditions. Do you agree?

If so, I'll send out a v4 with 32 byte framing (16 byte header, 16 byte 
data).

  // David
