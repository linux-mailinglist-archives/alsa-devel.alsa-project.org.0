Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A001FD9A8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 01:34:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C210167B;
	Thu, 18 Jun 2020 01:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C210167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592436851;
	bh=/nqJDpGALIgmcKPJ+NKXVxwhU9tOKUY3RHJkHJ9racM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rL6WlSgf6heSe/uXu04GX/vcq5SE4+cDhrF0xNDlKhTqYMq51W96BZipuKKh/+I5v
	 V1ba1BKUHaWyHyoRjdj9gKdL8oiZh4EkY9LNd85EvWVJ4CT1Bbt3Erhn7NZB8qU9oy
	 dd0wx0EHeWhjaSZxqUwTHh7oh4AbUENpAbvX1vFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77762F801D9;
	Thu, 18 Jun 2020 01:32:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B33DAF80171; Thu, 18 Jun 2020 01:32:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 889ECF80116
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 01:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 889ECF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="zBf3iIXb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DvrFgFQJ"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id C96525C00E4;
 Wed, 17 Jun 2020 19:32:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Jun 2020 19:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=qSHRlBpMEl8ppTd2mpVWRhagrCo
 SiDGbKOp1s8ZE00I=; b=zBf3iIXb5S+AfxY/o4rFiHyRHkVP3DJ4nQ9ACcJg6ys
 ZWrcVxgCUWSar00okMlM4LYr0/1Rft2QCcBBVyYFuKxUipQRuF4Djk+kG7bFQ2p4
 8ZYl6aOQoYDug5DBVzPZYbo3vHCJCVq5SyvQXfpBCkxsSbOYM2yLKQb9+vHgLwQ7
 vV65cXCidP5FQnyCSTqXorT2hGBAUY/4+FN98FvlIeikdr9jbKYdPoZL/Awy2YW9
 cMnGiDh0yaph/N+/2HIM0hiSBQKNcCukv+W2QUUrwE+04lotOb0DHBYu/YwrGVhw
 FeE7GONgTvbtmIpXju393WG/Xzns7RPkwGp7a2Kmwpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qSHRlB
 pMEl8ppTd2mpVWRhagrCoSiDGbKOp1s8ZE00I=; b=DvrFgFQJnGEu+rLT3tIa9M
 Cr9rf7FXiSdvzLAfWIlUCIg40YrKNcyunEiJcTgowevsCF1A7GVbOInLl1I8K6eU
 dclRPewLR8cJENqUFVRH+tJo0byUTqWdRDH02LVPhw5fDH2TuNx8V/vGHpFj/Hrd
 /WkSI1QvG/CRr/taPjTVw+NE9Smqd1hIEJOe2cfWhl1ubu3TgyyWtNWK12MbdoS+
 bugZNQ9y2vwc6L2ctJbtIg3mAc8J4v1kDg2LpcVU0V+0lUFZZQ8PlUXUBD+JxKVx
 2YMFIi3sfU0DuxxV7d1ImXWP35efrsxI/L/Mek3XjE9D1Kg2im5nh2gBSupEMe+w
 ==
X-ME-Sender: <xms:AKjqXlLrsTWMDGj2NQosi8UIUOeHrqUXKXeC7m3l0v1FTyQgU75uhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejfedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhephfdufeelge
 fhieeuuefhveeufedvgeefgedvgfetgeevtdefkeekheeiieefvdfgnecuffhomhgrihhn
 pehjrhhighhgrdgtohdruhhkpdhgihhthhhusgdrtghomhenucfkphepudektddrvdefhe
 drfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:AKjqXhL6ugk-3aSYFoe_yCbWVG9BtOA15ddrel__k67-p4mceDYMMg>
 <xmx:AKjqXtv9QD1o7uQPfvWQpYIq8fm1xJ8IC4Al2gA_G23aoznA_5a3mw>
 <xmx:AKjqXmZEhq0YYW4oXzhFyVK8s-7YbFx2IsUJ5IHn-xBAC3f_MzbaGw>
 <xmx:AajqXlmuQeq1o4dlG5Al0lTHW6teupaG__-b5n-5lVB6jMhOYmGmdw>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id D6BE7328005E;
 Wed, 17 Jun 2020 19:32:15 -0400 (EDT)
Date: Thu, 18 Jun 2020 08:32:13 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "m.eik michalke" <alsa@reaktanz.de>
Subject: Re: presonus StudioLive 24.4.2
Message-ID: <20200617233213.GA281450@workstation>
Mail-Followup-To: "m.eik michalke" <alsa@reaktanz.de>,
 alsa-devel@alsa-project.org
References: <1859294.RmyynjnHiM@meadow> <5770610.t4SrzthkjT@yrla>
 <20200617133704.GB274842@workstation> <1950143.FVrUTiCnyk@yrla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1950143.FVrUTiCnyk@yrla>
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

Hi,

On Wed, Jun 17, 2020 at 06:12:48PM +0200, m.eik michalke wrote:
> hi,
> 
> Am Mittwoch, 17. Juni 2020, 15:37:04 CEST schrieb Takashi Sakamoto:
> > > $ cat /proc/asound/pcm
> > > [...]
> > > 04-00: DICE : StudioLive : playback 1 : capture 1
> > > 04-01: DICE : StudioLive : playback 1 : capture 1
>  
> > I suggest users to use 'alsa_in' and 'alsa_out' in jackd
> > session. Two pairs of PCM device (hw:x,0 and hw:x,1) need to be handled
> > for all of PCM channels. I'm sorry but at present total channels are not
> > available via one pair of PCM device.
> 
> ok, could a hack like this also help me out?
> 
>   http://www.jrigg.co.uk/linuxaudio/ice1712multi.html
 
Yep, the PCM multi plugin in alsa-lib seems to be available as well.

> > Well, this is a request from me. In IEEE 1394 bus, each device has
> > 'configuration ROM' which the other device can read. Linux FireWire
> > subsystem read it for device detection. I gather the ROM image[1] for
> > better detection and would I request you to send the ROM image to me
> 
> sent to you off-list. hth.

I added it at below commit:
https://github.com/takaswie/am-config-roms/commit/38819873e51d


From my curiousity, would I ask you extra check in system log (like
journalctl -k)? ALSA Dice driver supports TCAT protocol extension, and
it firstly attempts to detect it for all of devices without explicit
flags (in your case). If the device doesn't support the extension, the
attempt fails and we can see below log:

```
kernel: snd_dice fw1.0: transaction failed: timeout
```

I'm glad if you reports whether to see the above or not.


Thanks

Takashi Sakamoto
