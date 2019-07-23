Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28A7178C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:56:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4AAB18D6;
	Tue, 23 Jul 2019 13:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4AAB18D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563882969;
	bh=tnyVXR4WVVLq+K6ujtfymGUuTW3OeGwotnzZHSOJU9s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t8zKwRvC0VEZTCeqVLHo8lSoebtRkl7JLOEZKQI9J21pyWOS/LRfruGrHBHh0YPWN
	 4GDIHrE0tshbN4jEXJT+qTmKw1H9nSq2ChB9Wl2Ra8uqG/h4znZwPDVTyDpdGuwXuF
	 KiKMkiNl/T/OI3UcqNxwkN04hBmelYm6ezEgiXxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBBF0F80447;
	Tue, 23 Jul 2019 13:54:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE97AF80447; Tue, 23 Jul 2019 13:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83C07F80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83C07F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="CNmp/f7R"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45tH0n3JGZzB2;
 Tue, 23 Jul 2019 13:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1563882778; bh=j4pMKmjBXQS5Q+n26psVAFWV8kM6fyPQKBaNeNQk2Qk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CNmp/f7RHV5VU0flZrB8LH21z3OpG/AObQDzx9O0du5NoUwTjZRAD5K3tIJg/hUhV
 Xyu7JbBfrVROrsruZ70itCguNQlMGC1bk/pxFI8jitkdPeLRCclRgUsgRYoX+IP24t
 h/xTxPEbh56Ho4eCMwoXN7/dIhvpkpXU2ErwyFJG4rft8TR281++Q8c2tDinhtqwb3
 /9h2lqkydupaWKIj/ULUnl8G2gfXF6ksdp/D+MNXqrgPLAW03jep4X/PqjmVwO4cNr
 YY6WSA/hh49mwx3E7sJ2S02VTMfLuoK75ZpKR7ERqCm9OPQ1jOm1dXiHfGI1ckvdV5
 O/cBHVMtsEVRQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Tue, 23 Jul 2019 13:54:15 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190723115415.GA14036@qmqm.qmqm.pl>
References: <cover.1563817201.git.mirq-linux@rere.qmqm.pl>
 <3e104cf18cb4e26096f0fe065a2c0e80373f861c.1563817201.git.mirq-linux@rere.qmqm.pl>
 <20190723082716.GM54126@ediswmail.ad.cirrus.com>
 <20190723105248.GA5365@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723105248.GA5365@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 patches@opensource.cirrus.com, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: wm8904: rework FLL handling
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jul 23, 2019 at 11:52:48AM +0100, Mark Brown wrote:
> On Tue, Jul 23, 2019 at 09:27:16AM +0100, Charles Keepax wrote:
> > On Mon, Jul 22, 2019 at 07:57:21PM +0200, Micha=B3 Miros=B3aw wrote:
> > > Extract and rework FLL handling. This makes it possible to reuse
> > > the code for other Wolfson codecs and makes codec adapt SYSCLK to
> > > exactly match frequency required for used sampling rate.
> =

> > Do you have thoughts on which CODECs you would be including in
> > this? These older parts often have small differences between the
> > configuration that might make this challenging so if you have
> > plans here would be good to have a look from this end.
> =

> Right, it's not like it's the same IP being dropped into multiple chips
> in an identical fashion.  There's a lot of high level similarities in
> the register interfaces but also many small per device tweaks, and it's
> not clear what benefit we get from refactoring at this point.

This would be mainly code separation, so it's easier to understand and
has a potential for direct reuse. I can see that clock selection needs
to be changed, but the idea is to have it configurable via device-tree.

I picked at random WM9081. It's FLL implementation looks very similar -
major diffferences being in FLL_OUTDIV selection (direct divider vs 2^N)
and register block offset.

Another random pick - WM8900. The general FLL idea seems the same, but
this one has a bit more complicated register layout, so I wouldn't
consider it at first.

WM8994 - it has two FLL's but otherwise has identical register layout
for them as WM8904. The only difference is in clock source selection.

Best Regards,
Micha=B3=A0Miros=B3aw
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
