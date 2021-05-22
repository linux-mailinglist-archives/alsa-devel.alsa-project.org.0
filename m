Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A0D38D70B
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 20:50:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 346F21681;
	Sat, 22 May 2021 20:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 346F21681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621709417;
	bh=fEY5AgBXasvIfpoH/meG4ewkXRa2Ng2xSuN92ipfkIo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDvFqDmrUNY3igTtPZgJ388uO0ixR/cZCLn8ul+xuW5xO8r+viKxvQ8wpP3g6qXvN
	 rEqw5upYzA3UxJVIRAODZXk1IO3TDz94gTclU7Df7iojhammFlienEGeCrw7/8iCXi
	 FRKjP16QdFz8fSTH3e43xA2iotbcuX+tjN4mmYQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 923ACF80229;
	Sat, 22 May 2021 20:48:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB555F80217; Sat, 22 May 2021 20:48:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODY_21,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2445F80153
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 20:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2445F80153
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38B1C60FDC;
 Sat, 22 May 2021 18:48:35 +0000 (UTC)
Date: Sat, 22 May 2021 19:49:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/8] iio: accel: bmc150: Add support for yoga's with
 dual accelerometers with an ACPI HID of DUAL250E
Message-ID: <20210522194957.3002406c@jic23-huawei>
In-Reply-To: <CAHp75Vex3uvGz+g9rkuU3wMwFOui-fASxvcP7b3KNCQ2CrBH3A@mail.gmail.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210522190138.1715b095@jic23-huawei>
 <CAHp75Vex3uvGz+g9rkuU3wMwFOui-fASxvcP7b3KNCQ2CrBH3A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-iio <linux-iio@vger.kernel.org>, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jeremy Cline <jeremy@jcline.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
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

On Sat, 22 May 2021 21:03:02 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Sat, May 22, 2021 at 9:00 PM Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Fri, 21 May 2021 19:14:10 +0200
> > Hans de Goede <hdegoede@redhat.com> wrote:  
> 
> > > Some 360 degree hinges (yoga) style 2-in-1 devices use 2 bmc150 accels
> > > to allow the OS to determine the angle between the display and the base
> > > of the device, so that the OS can determine if the 2-in-1 is in laptop
> > > or in tablet-mode.
> > >
> > > We already support this setup on devices using a single ACPI node
> > > with a HID of "BOSC0200" to describe both accelerometers. This patch
> > > set extends this support to also support the same setup but then
> > > using a HID of "DUAL250E".
> > >
> > > While testing this I found some crashes on rmmod, patches 1-2
> > > fix those patches, patch 3 does some refactoring and patch 4
> > > adds support for the "DUAL250E" HID.
> > >
> > > Unfortunately we need some more special handling though, which the
> > > rest of the patches are for.
> > >
> > > On Windows both accelerometers are read (polled) by a special service
> > > and this service calls a DSM (Device Specific Method), which in turn
> > > translates the angles to one of laptop/tablet/tent/stand mode and then
> > > notifies the EC about the new mode and the EC then enables or disables
> > > the builtin keyboard and touchpad based in the mode.
> > >
> > > When the 2-in-1 is powered-on or resumed folded in tablet mode the
> > > EC senses this independent of the DSM by using a HALL effect sensor
> > > which senses that the keyboard has been folded away behind the display.
> > >
> > > At power-on or resume the EC disables the keyboard based on this and
> > > the only way to get the keyboard to work after this is to call the
> > > DSM to re-enable it (similar to how we also need to call a special
> > > DSM in the kxcjk-1013.c accel driver to re-enable the keyboard).
> > >
> > > Patches 5-7 deal with the DSM mess and patch 8 adds labels to the
> > > 2 accelerometers specifying which one is which.  
> >
> > Given only thing I'm planning to do is tweak the line wrapping, I'm
> > happy to pick this series up.
> >
> > The two fixes will slow things down a bit though as we should probably
> > get those upstream this cycle.
> >
> > I'm going to leave this on list for a few days before I take anything
> > though, to give others time to take a look.  
> 
> You are, guys, too fast :-)

One day did seem a bit short for a series doing as much as this one :)


> 
> I have few (minor) comments on a few patches, in general they are okay!
> So, after settling on the comments,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> for the entire series.
> 
> Thanks, Hans, for doing this!
> 
> > One side note, cc list includes a few random choices... Seems you've
> > accidentally included alsa people as well as IIO ones.  
> 
> 

