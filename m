Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BE3667A3D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 17:03:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B281D92F9;
	Thu, 12 Jan 2023 17:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B281D92F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673539392;
	bh=ee90ZrdxFbeWGNSMRr1VURdeCwSTryoyYgek0eDL43U=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XW+b9dcvy3k7Cd226m1nFoiRniVpAnSKABx1gGUEMq29i1GwT5KnxvdaC4l4WfZ7k
	 mwkhi0rVQwJBr8EVK9e0tB2kjYoPuZjFF/ixmhEvN4SZMPkveVdWs8hYg4r9psM7mq
	 T6MthN0Z/DddqOiOh4/UA98IlUZ2ip4jEk5fE658=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0543F80578;
	Thu, 12 Jan 2023 16:59:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A316F8026A; Wed, 11 Jan 2023 12:50:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A17EF8030F
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 12:50:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A17EF8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ux9y0zsR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D6CBB81BAE;
 Wed, 11 Jan 2023 11:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE6AC433D2;
 Wed, 11 Jan 2023 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673437828;
 bh=ee90ZrdxFbeWGNSMRr1VURdeCwSTryoyYgek0eDL43U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ux9y0zsReAjEza05MKHtM99Oo6HV0AlBIcKbjqhk0Sdu0kERz3ZrU1pdvSmZd9jKp
 k+y3U+ZUgDdbHMHa3JgdaPTGOMNqeI6ACPHMdPJ22gpRvjUeCWCYjM91aT8U1Llxoj
 QFI4iOnz4DtuijqA9rKpiDnWwp2+K0jYCfZ8voAcoguGLJghxXY7U2GXEIk6idHOd+
 gVGSEP9bjHsYzJzeX3oOLB27xVWD3FK/0R9UF1usKjrN2w9qkcneozn93br8ae8scX
 afwqdqESHuEQ9rQmkman8KOYqgij4A593O4qR3mWFfMNDzHF3KBIfD8RFnbmm7xvWX
 Mfb/EbO9h+cdw==
Date: Wed, 11 Jan 2023 12:50:26 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 05/16] driver core: make struct device_type.uevent()
 take a const *
Message-ID: <Y76igjXSaG4tB1KJ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Len Brown <lenb@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sean Young <sean@mess.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
 Jilin Yuan <yuanjilin@cdjrlc.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-6-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eatOmASNmMfu/WLi"
Content-Disposition: inline
In-Reply-To: <20230111113018.459199-6-gregkh@linuxfoundation.org>
X-Mailman-Approved-At: Thu, 12 Jan 2023 16:59:42 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sean Young <sean@mess.org>,
 alsa-devel@alsa-project.org, platform-driver-x86@vger.kernel.org,
 linux-i2c@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
 linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-acpi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Won Chung <wonchung@google.com>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
 Ira Weiny <ira.weiny@intel.com>, Michael Jamet <michael.jamet@intel.com>,
 Ming Lei <ming.lei@redhat.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jilin Yuan <yuanjilin@cdjrlc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 linux-media@vger.kernel.org, Maximilian Luz <luzmaximilian@gmail.com>,
 linux-usb@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--eatOmASNmMfu/WLi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 12:30:07PM +0100, Greg Kroah-Hartman wrote:
> The uevent() callback in struct device_type should not be modifying the
> device that is passed into it, so mark it as a const * and propagate the
> function signature changes out into all relevant subsystems that use
> this callback.
>=20
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Sean Young <sean@mess.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Maximilian Luz <luzmaximilian@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Cc: Andreas Noever <andreas.noever@gmail.com>
> Cc: Michael Jamet <michael.jamet@intel.com>
> Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: Chaitanya Kulkarni <kch@nvidia.com>
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: Jilin Yuan <yuanjilin@cdjrlc.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Won Chung <wonchung@google.com>
> Cc: alsa-devel@alsa-project.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-acpi@vger.kernel.org
> Cc: linux-block@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-i3c@lists.infradead.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: linux1394-devel@lists.sourceforge.net
> Cc: platform-driver-x86@vger.kernel.org
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com> # for Thunder=
bolt
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Wolfram Sang <wsa@kernel.org>


--eatOmASNmMfu/WLi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO+on4ACgkQFA3kzBSg
Kbar9Q/+PJ2u9B6sH0kIrC6oEnXoKAsfZZ5U75pl6ls0qQDtMNBd4jnNQ220OhTa
3pKYq76YstsF8WPELZjVaJiHnzs1kkB/HblIzzTLIMuOjq4jtGJqUhr4HZ1Jh3Or
aVm0zykl99om05o9YHGq1SNKWVUlm7EOnU48snB4WbcWEoF+M46TVT2JXpwn+fn5
rFvfrYUhqwuUj3FqI0/aynOj3SNv1yMFJCoyAOzO+EBJ+iC+uHfm54OGdCsCBhE1
O1yOluZULN9KLANZJZwrI0syoa85Lf3WYi9C/hGSgJ2pWxBCi4JqrkGUVPNeBvQv
RmjpLLZTDzkSWn1FOUC6TgAL6xBco04oHD/v9IhKoZLnfYx/1EG9K6j/wHBzhlkB
otHCRJbah0YHXkzb0sBFIZxMZJoIXvWrPUeN3LrOj9aF21ysk33o+ExAv6a9eN58
CQzM8GvIYCVx6/qKM0h9zOo9pyHbay0o7hkHAGggsdljr7zY/wUAoRs9e8IGYcES
T3ZLU4ADXxgXrm96VYxxrrxOTme/uJHHypU1e7G7Wq9MfAAuFLFilPjLPea/HldQ
UK8M9Hs/nX22KKtQPWoZkEGAKyV6gbo39HU4xsYH6BdzYVFpH8mzFCYpvxYkoS+v
URGDgDt+jgb0d30Galr88Mpkhuz1+CRO5R3dVQiioc6bbecfCbI=
=wUgU
-----END PGP SIGNATURE-----

--eatOmASNmMfu/WLi--
