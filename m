Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FFC63948B
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:15:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8729318B9;
	Sat, 26 Nov 2022 09:14:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8729318B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450507;
	bh=aY6fpFlBsrseLUokyVITOdHrAVLXpcebwFFMAgJ+/es=;
	h=Date:To:From:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lbIwhrjVZkrXvMK9yEH/0IWkXq6F7AYMWXRQXYWkULmE1KKULZQfMhC7RK+nsgvcm
	 CMj41uf36KI9l6ix9lTK+8AmXrPwTS20bb+jPCoxoaI0bh9YLhhnsQkXsw/JTBUVRW
	 714ew+1QnNEhsJbYsg323fTgRuZvD1/Zne4bxUtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DCF4F8071F;
	Sat, 26 Nov 2022 08:59:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5081F8025D; Thu, 24 Nov 2022 00:24:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65111F80149
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 00:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65111F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="hPbJVkIu"
Date: Wed, 23 Nov 2022 23:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1669245874; x=1669505074;
 bh=4D7H7t9cQFG+vEXPzrmjxP0kBkCA637MqCW+lh8xlvo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=hPbJVkIuL1M0qEmL0bT4PuPpgSPCUAu33Y+Qb7tdeEgjcQqAn2P9/FpfK16HEA2EM
 7vjsfHf0eS2PmoRXdPNGezpmX314hJ02XB0zpjgzVkJDzPqhEL7AMChGfIwFpiPwIA
 NF7ZZEj1iGDIHy5p8DLkWQw2m5Qldpno4e6/JtLA16r0ZaA4hkUD/VeqWm5hbTdlnb
 BxWDFCkr77h+K0/o8YNYsqjLGq0ZWGeFJce25BsYm5wcKn9VpmO0zKAO32OE9aTevx
 yfP5UsPCKW2I3bqPQKJL7FqD0bhsWsXV2qxdqiRQ7WsVWh4oHNK9TFNBq0m4+w4lGn
 bmQFT/VhhjM8A==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <tx7-rd-SyCXl_K0mh2tDzOLPmogI631IJQJRNK8dMW_GVZiy5AHHVN7-b_Ib3P1L_dLTCRPEw8dAhDbMAPGg8QTKs4p1XFoNHlEZpAnWcCw=@protonmail.com>
In-Reply-To: <Y35vLAWWfezPvGSm@kroah.com>
References: <Y34hgIW8p1RlQTBB@smile.fi.intel.com> <Y34+V2bCDdqujBDk@kroah.com>
 <Y35JfNJDppRp5bLX@ziepe.ca> <Y35R+/eQJYI7VaDS@kroah.com>
 <Y35YlI93UBuTfgYy@ziepe.ca> <Y35dMIaNYSE0Cykd@casper.infradead.org>
 <Y35iKfYf3ThdVvaR@kroah.com> <Y35lt+0jXrOKynL5@ziepe.ca>
 <Y35vLAWWfezPvGSm@kroah.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sean Young <sean@mess.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Frank Rowand <frowand.list@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Won Chung <wonchung@google.com>,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Chaitanya Kulkarni <kch@nvidia.com>, Ira Weiny <ira.weiny@intel.com>,
 Michael Jamet <michael.jamet@intel.com>, Ming Lei <ming.lei@redhat.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jilin Yuan <yuanjilin@cdjrlc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 linux-media@vger.kernel.org, Maximilian Luz <luzmaximilian@gmail.com>,
 linux-usb@vger.kernel.org
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


Hi


2022. november 23., szerda 20:06 keltez=C3=A9ssel, Greg Kroah-Hartman =
=C3=ADrta:


> On Wed, Nov 23, 2022 at 02:25:59PM -0400, Jason Gunthorpe wrote:
>=20
> > On Wed, Nov 23, 2022 at 07:10:49PM +0100, Greg Kroah-Hartman wrote:
> >=20
> > > On Wed, Nov 23, 2022 at 05:49:36PM +0000, Matthew Wilcox wrote:
> > >=20
> > > > On Wed, Nov 23, 2022 at 01:29:56PM -0400, Jason Gunthorpe wrote:
> > > >=20
> > > > > #define generic_container_of(in_type, in, out_type, out_member) \
> > > > > _Generic(in, \
> > > > > const in_type *: ((const out_type *)container_of(in, out_type, ou=
t_member)), \
> > > > > in_type *: ((out_type *)container_of(in, out_type, out_member)) \
> > > > > )
> > > >=20
> > > > There's a neat trick I found in seqlock.h:
> > > >=20
> > > > #define generic_container_of(in_t, in, out_t, m) \
> > > > _Generic(*(in), \
> > > > const in_t: ((const out_t *)container_of(in, out_t, m)), \
> > > > in_t: ((out_t *)container_of(in, out_type, m)) \
> > > > )
> > > >=20
> > > > and now it fits in 80 columns ;-)
> > >=20
> > > Nice trick! Dropping the inline functions is a bit different, let me
> > > see if that still gives a sane error if we pass an incorrect type or
> > > mess with the const * the wrong way. I'll run some tests tomorrow
> > > afternoon...
> >=20
> > The errors in some cases are very verbose, but it is somewhat
> > understandable - the worst is when _Generic fails to match anything,
> > but also at least clang partially expanded container_of and it throws
> > other assertions too.
> >=20
> > I also wonder if this could just be rolled into the normal
> > container_of.
>=20
>=20
> I think we might be able to now, my previous attempts with inline
> functions prevented that. I'll beat on that tomorrow...
>=20
> > in_type would have to be derived like:
> >=20
> > in_type =3D typeof((out_type *)NULL)->out_member)
> >=20
> > But I don't know if you can use typeof in a generic type matching expre=
ssion..
>=20
>=20
> Maybe that is what threw me before, I can't remember. I do know we
> tried a number of different attempts, can't recall the failed ones...
>=20

I am sorry I haven't followed the previous discussion,
but has something like the following been considered?

  #define container_of2(ptr, type, member) \
  =09_Generic((ptr), \
  =09=09typeof_member(const type, member) *: container_of((ptr), const type=
, member), \
  =09=09const void *: container_of((ptr), const type, member), \
  =09=09default: container_of((ptr), type, member) \
  =09)

This is not perfect by any means, but I believe it is a reasonable
improvement. It only really works reliably if the member type and
the specified `type` in the arguments are unqualified,
but I believe that should cover the majority of cases.

I have tried to build an x86-64 defconfig with this and there are
numerous const violations, but I haven't seen any false positives.


> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
