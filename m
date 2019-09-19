Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E3AB832D
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 23:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F9DA1678;
	Thu, 19 Sep 2019 23:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F9DA1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568927679;
	bh=8KecdtnO+vkbrd1TM1LsL5krNrlmZZXWWtlKczcjQiQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=pYZJTmcfzecOFWFWqIEIZhOKGC49lG1uFIAZRE16TdjPuEL3cFG/8BvdM3WdyvvVz
	 z0aKe3r9BhV/X+/fT4BwD1p1LDfKZokP8tpB6yLwMS7aKjx5oP3bbyoIGlYlHAY/AB
	 e0yRH4gzra2ERIdlXlYSXKnSvVAMMzwPNCTxpMfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B0BCF80361;
	Thu, 19 Sep 2019 23:12:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF6EEF80361; Thu, 19 Sep 2019 23:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from egnor-li.ofb.net (egnor-li.ofb.net [IPv6:2600:3c01:e000:283::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 005B4F80146
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 23:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 005B4F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ofb.net header.i=@ofb.net
 header.b="IL4FNplB"
Received: from ofb.net (163.242.197.104.bc.googleusercontent.com
 [104.197.242.163])
 by egnor-li.ofb.net (Postfix) with ESMTP id 21FE7117F71;
 Thu, 19 Sep 2019 21:12:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [173.239.75.234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by ofb.net (Postfix) with ESMTPSA id 7EF853E922;
 Thu, 19 Sep 2019 14:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ofb.net; s=ofb;
 t=1568927565; bh=nUdYVJQ/hlz/YHSd427Gse6byG6Q+7bJ6MinuGvboKs=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=IL4FNplBWKrnpNpJTXKRPt0Z5zwnFZ8Utq2apwiMePLSfZPl0BKqr0/W1XxEmipyb
 vVxTv6ZkdbpD5svI2xDOo5b9v6s3vLkdAszJ8EZkjV2nYvCR0c3M1WaQcX+IPsANjL
 rJQTpwzfQI3eVnGgmUNMGo9nsps6y/YumOCZ0M0pMtWQSByvkIeLucjKKGsbexmNhM
 6I16WHzn1+DzxpQdt7o319R09lqfvrRheJkAzy95QEkob8yyv0KqYHugnmMkRq1FZ1
 OO8qFMycUg6+23K6vqYDzAbomFUNnnfRp9mSOFidSGkzt0L/mZu4g3Tk9BGncEI8GC
 4E1YqwJwDhtPQ==
Received: from frederik by localhost.localdomain with local (Exim 4.92.2)
 (envelope-from <frederik@localhost.localdomain>)
 id 1iB3jI-000477-MU; Thu, 19 Sep 2019 14:12:44 -0700
Date: Thu, 19 Sep 2019 14:12:44 -0700
From: frederik@ofb.net
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190919211244.buu3d6ey4k2dxyul@localhost>
References: <20190904164706.gwjbcywbj7emnwvr@localhost>
 <s5hv9u19x2f.wl-tiwai@suse.de>
 <20190910173345.63bv2xa4vlkxicxj@localhost>
 <365e4bcc033c151076140471225db51c80808b7f.camel@iki.fi>
 <s5himprulnt.wl-tiwai@suse.de>
 <e294e2985eda906be3c3625235cc28643208dab2.camel@iki.fi>
 <s5hblvjukn6.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hblvjukn6.wl-tiwai@suse.de>
User-Agent: NeoMutt/20180716
Cc: Tanu Kaskinen <tanuk@iki.fi>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] parameter for pulse device?
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

Thank you for the tips.

I don't know if my input is still needed, but I figured out from looking at some of the syntax you linked to that I can put this in ~/.asoundrc and it does the job (this is what I had had in mind when I asked about "magic with macros", it is somewhat advanced for me):

    pcm.!pulse {
        @args [ DEV ]
        @args.DEV {
            type string
            default "default"
        }
        type pulse;
        device $DEV
    }               

Now I can set up a filter like this:

    ecasound -i alsa,pulse:mic -o alsa,pulse:monitor

Is something like this going into the alsa-plugins repo?

Thanks,

Frederick

On Tue, Sep 17, 2019 at 03:17:49PM +0200, Takashi Iwai wrote:
>On Tue, 17 Sep 2019 15:14:53 +0200,
>Tanu Kaskinen wrote:
>>
>> On Tue, 2019-09-17 at 14:55 +0200, Takashi Iwai wrote:
>> > On Tue, 17 Sep 2019 14:51:01 +0200,
>> > Tanu Kaskinen wrote:
>> > > On Tue, 2019-09-10 at 10:33 -0700, frederik@ofb.net wrote:
>> > > > On Mon, Sep 09, 2019 at 07:52:24PM +0200, Takashi Iwai wrote:
>> > > > > It depends on how pcm.pulse is defined.  If it's defined to take an
>> > > > > argument, it can work like that.  (Or sometimes you may need to pass
>> > > > > the argument explicitly like "pulse:{device=mointor}".)
>> > > > >
>> > > > > The standard pcm.pulse definition provided in alsa-plugins repo
>> > > > > doesn't take the argument, and that can be the reason.
>> > > >
>> > > > Thank you Takashi. Would it be easy to change alsa-plugins so that it
>> > > > takes an argument? Is there a chance that this change would be
>> > > > accepted?
>> > > >
>> > > > If you can point me to the section of code in e.g. "plughw" where
>> > > > argument parsing is done, then I would probably end up modifying
>> > > > alsa-plugins myself, just to simplify what I am doing.
>> > >
>> > > This commit might be instructive:
>> > > https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=3c199a0d199f0fae78c9c1b19c11878a6134b3a8
>> >
>> > Yes, thanks for pointing an example.
>> >
>> > Now I took a quick look at the current code, and one remaining problem
>> > is that there is no device parameter value corresponding to the
>> > default (=NULL).  Maybe we should accept the string "default" to be
>> > treated as NULL, for example.
>> >
>> > Ditto for the server parameter.
>>
>> Maybe "", i.e. the empty string, would be a good choice for the special
>> string representing NULL? It's not a valid device name or server
>> address, unlike "default", so there can't be any conflicts. Not that
>> "default" is very likely to cause conflicts either.
>
>Yeah, that sounds feasible.
>Then the rest is just coding ;)
>
>
>thanks,
>
>Takashi
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
