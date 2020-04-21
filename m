Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07951B1B39
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 03:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 496A1168B;
	Tue, 21 Apr 2020 03:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 496A1168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587432182;
	bh=hGo6xEt7nga6j4CMaIqmFH8Rxd6VDJlClq8vu1r/YcI=;
	h=From:To:Date:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQfag28YJ3NL3JlDFg6eHJHqQ8NeV14fopBzz4mzPZiLWZj61Bi5PZi0HFbWEdQHb
	 vXVHOIDsLQkOXQ0RlFYTGSag0QfMi53Yo9U5nauwIwqRsGfoEoC6CDi/zjjSP7RYli
	 WfAb01Amr/+Nu1LbUJllASFskYukrQCz/fPmqM3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64674F800FF;
	Tue, 21 Apr 2020 03:21:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AB5FF801EC; Tue, 21 Apr 2020 03:21:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DFBFF8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 03:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DFBFF8012F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 85D4EAEBE;
 Tue, 21 Apr 2020 01:21:09 +0000 (UTC)
From: NeilBrown <neilb@suse.de>
To: Alan Stern <stern@rowland.harvard.edu>,
 Matthew Wilcox <willy@infradead.org>
Date: Tue, 21 Apr 2020 11:20:53 +1000
Subject: Re: [PATCH 5/9] usb: fix empty-body warning in sysfs.c
In-Reply-To: <Pine.LNX.4.44L0.2004181549020.8036-100000@netrider.rowland.org>
References: <Pine.LNX.4.44L0.2004181549020.8036-100000@netrider.rowland.org>
Message-ID: <87368xskga.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Zzy Wysm <zzy@zzywysm.com>, linux-kernel@vger.kernel.org,
 "J. Bruce Fields" <bfields@fieldses.org>, target-devel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Chuck Lever <chuck.lever@oracle.com>, linux-input@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18 2020, Alan Stern wrote:

> On Sat, 18 Apr 2020, Matthew Wilcox wrote:
>
>> On Sat, Apr 18, 2020 at 11:41:07AM -0700, Randy Dunlap wrote:
>> > +++ linux-next-20200327/drivers/usb/core/sysfs.c
>> > @@ -1263,7 +1263,7 @@ void usb_create_sysfs_intf_files(struct
>> >  	if (!alt->string && !(udev->quirks & USB_QUIRK_CONFIG_INTF_STRINGS))
>> >  		alt->string =3D usb_cache_string(udev, alt->desc.iInterface);
>> >  	if (alt->string && device_create_file(&intf->dev, &dev_attr_interfac=
e))
>> > -		;	/* We don't actually care if the function fails. */
>> > +		do_empty(); /* We don't actually care if the function fails. */
>> >  	intf->sysfs_files_created =3D 1;
>> >  }
>>=20
>> Why not just?
>>=20
>> +	if (alt->string)
>> +		device_create_file(&intf->dev, &dev_attr_interface);
>
> This is another __must_check function call.
>
> The reason we don't care if the call fails is because the file
> being created holds the USB interface string descriptor, something
> which is purely informational and hardly ever gets set (and no doubt
> gets used even less often).
>
> Is this another situation where the comment should be expanded and the=20
> code modified to include a useless test and cast-to-void?
>
> Or should device_create_file() not be __must_check after all?

One approach to dealing with __must_check function that you don't want
to check is to cause failure to call
   pr_debug("usb: interface descriptor file not created");
or similar.  It silences the compiler, serves as documentation, and
creates a message that is almost certainly never seen.

This is what I did in drivers/md/md.c...

	if (mddev->kobj.sd &&
	    sysfs_create_group(&mddev->kobj, &md_bitmap_group))
		pr_debug("pointless warning\n");

(I give better warnings elsewhere - I must have run out of patience by
 this point).

NeilBrown

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAl6eSnUACgkQOeye3VZi
gbn4EQ//WLEH1OYjzYF3ZAV16KgjXghaIeaNMOhGWUi79iqI/c9Zfe7VUDBPE5ip
xTdZh+pKAubrzHjja6sbwXCEpY1XaGBeyKxl8lc/w8bsG6yMdN0n3eP7jgMucCtN
U7DuAjjSjFvMLYDUBs6jhPbko+Qse3InDgyZH0gTueYI1QMmSag7EZs0xdvv6dAz
NgtTQbJ7MBv3CQTg3Y+O6pMvRQbwSYuUb118jv9BH5ktkRmfJ5lP0LGfDD1d/AeR
Z9oH8asOZK2ZprUXg6cuI/lf1kxFCNDGwXI9x0eDWpyt8akceeXLsxhg7Jw2KlZA
Ry4UOB//Ehxq5ZtqxQAcHNzbfXJM1JaZjbyk+Im8F3q0/i2aE2/9pGvREe91rX3u
gq2UO+5djv+TxKg1nZcFIHV/ycfdw4HWT6jKnYwOTahceJxkcswrRYqWBDePNqws
oeWTPfUxQIIMUAYl0Zsf8EXLCqKvOmVqRI3cY2jIZHOJraynmtfL+/FRsg3PNu5T
m5nSJbLvQMzITNuBTOf8BvdeAasCfR6v4RlIJYbonBJxXtUrXL7yeX0FclVpJ98+
noaE1F/eUxnG5t+n3Gr6C9ttT/avXsr7Gm7okuNwkY1vvZSoXbFPZG0VIW0SiLWY
kiqSFLeEDXCaNk4yYZlcNe17qTuJiZxx4RnTkF1IykZIcQv8haE=
=K7Ae
-----END PGP SIGNATURE-----
--=-=-=--
