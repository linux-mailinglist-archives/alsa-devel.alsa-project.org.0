Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C49322785
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 10:10:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185CC886;
	Tue, 23 Feb 2021 10:10:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185CC886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614071456;
	bh=hH/eaGl75Uy6mIlS+NgUILRRkfj/cuFLN5jprTN73M4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JDZRDajgzVFkYK71S3e0qC+FDW/N5xw2AFS1cdlL0IZsUFBoXZMB+YRQRpa35NmBz
	 yq/7QDQRAta75Rtbr5oy4CQmhtSPnzzJ/8Hp4MzqcAW8dVyizP3HlxVUH+9sTSMJ5W
	 vpTk5FolN0TH47XPEItE6Ain/xdqD96gbGv8T0dY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BE64F80278;
	Tue, 23 Feb 2021 10:09:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA1F0F8016A; Tue, 23 Feb 2021 10:09:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98603F800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 10:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98603F800B4
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 66BB61C0B82; Tue, 23 Feb 2021 10:09:24 +0100 (CET)
Date: Tue, 23 Feb 2021 10:09:23 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 3/3] HID: elan: Remove elan_mute_led_get_brigtness()
Message-ID: <20210223090923.GH9750@amd>
References: <20210221113029.103703-1-hdegoede@redhat.com>
 <20210221113029.103703-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="FUaywKC54iCcLzqT"
Content-Disposition: inline
In-Reply-To: <20210221113029.103703-4-hdegoede@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 alsa-devel@alsa-project.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org
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


--FUaywKC54iCcLzqT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> @@ -461,7 +452,6 @@ static int elan_init_mute_led(struct hid_device *hdev)
> =20
>  	mute_led->name =3D "elan:red:mute";

This probably should not have "elan" prefix.

Best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--FUaywKC54iCcLzqT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA0xkMACgkQMOfwapXb+vLLDQCgnvhE8J5fS8jikkY55qtXJkYw
zboAnRezbsT3WS58xznd5y82Z/QCZPs+
=cani
-----END PGP SIGNATURE-----

--FUaywKC54iCcLzqT--
