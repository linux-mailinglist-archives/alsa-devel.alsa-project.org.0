Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E12FFEF3
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 10:21:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67DD71AD5;
	Fri, 22 Jan 2021 10:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67DD71AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611307292;
	bh=Fz2SdsRmzyg/R2X1FlxG9bQZ+ajptlq0wR7ERPzwqDc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PDCxoim5cVLvFbp0E7ESmLFqQ63Bh+wG/V5TFJAadRiMpJ72mrliFxTBB+XDMhB7e
	 VWtAH/AVpmmIlcswRhSQtcfbMmvKzg0lGN0Y8ppUXEqUQ+3y8QrZopPmamrSACaQI/
	 f+HhhfzDxsuOBzHPanu3MVNKEBwYen8HsJ9CrKkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2CE3F8016E;
	Fri, 22 Jan 2021 10:19:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7481CF8016E; Fri, 22 Jan 2021 09:54:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBBB5F8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 09:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBBB5F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ddZNA3M6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 576F220739;
 Fri, 22 Jan 2021 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611305631;
 bh=Fz2SdsRmzyg/R2X1FlxG9bQZ+ajptlq0wR7ERPzwqDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ddZNA3M6UjNKCbv2ln05xi74+gg8RxPyfmTwHQ4mUmmkjwJ9S9/sn0rRIy3ApJYra
 ofdkWNtzHT0/iNjwUZK2whof89UzJC4pL+jhDlg2zofzNVukbVCGpITfv4dRSH/NP+
 Vljz4p4ya+TFxfBBgfNn7l16vKcvpy85i80JNbTCcKiLpQnkq2hhXjk5a4bFmW6INV
 djOy8m4qPjMvnzIVJvaQcwI+tPU6Vw+ZXR4jezPjuaA6S/H0iY30pf7MLs8p7yjxK+
 R37SCiknKGV/Du5Z6/rAraxkbZZzlhu5BiY1umPObLP6MEingJjnI2C2JBYNfkRqlq
 PS2UjRs5P+fWQ==
Date: Fri, 22 Jan 2021 09:53:48 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v1 2/2] isa: Make the remove callback for isa drivers
 return void
Message-ID: <20210122085348.GB858@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Pau Oliva Fora <pof@eslack.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Hannes Reinecke <hare@suse.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Finn Thain <fthain@telegraphics.com.au>,
 Michael Schmitz <schmitzmic@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20210121204812.402589-1-uwe@kleine-koenig.org>
 <20210121204812.402589-3-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline
In-Reply-To: <20210121204812.402589-3-uwe@kleine-koenig.org>
X-Mailman-Approved-At: Fri, 22 Jan 2021 10:19:58 +0100
Cc: alsa-devel@alsa-project.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Finn Thain <fthain@telegraphics.com.au>, Hannes Reinecke <hare@suse.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-scsi@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Matthew Wilcox <willy@infradead.org>,
 linux-input@vger.kernel.org, Pau Oliva Fora <pof@eslack.org>,
 Jakub Kicinski <kuba@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-can@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Schmitz <schmitzmic@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-i2c@vger.kernel.org
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


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 09:48:12PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> The driver core ignores the return value of the remove callback, so
> don't give isa drivers the chance to provide a value.
>=20
> Adapt all isa_drivers with a remove callbacks accordingly; they all
> return 0 unconditionally anyhow.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAKkpwACgkQFA3kzBSg
KbYioA//frCM2vGMNRb9m2Wz+bP5qkNSp3R5QbWC14WxE8ZsbjcOun8Op9VX023l
cmNSjxAFJ7nXTQgZYnrdfSo5+ZegXPapPa6zwpSF29HDrvoDmo7yHCVnrhSp+ko2
nauFE8d5U2LLJftrZ29QteTfvmBQn0RFdsO2NFFwCo9bVZd5UfwxinwQk3ncG4Fs
7th2N/Hwnb0Xb5NswrpHEeknQCVuYZdOx3bo21TQ/eImBBwT6iKExwzBYN+YX/Uw
AckTF0es+DatjTNiFBLvNHSDf0/bjroW+oIsZeu6Wz5G73yBqWiJmyhNLR4XxRJf
RgkOj9UvQsNAZhA/hKbFjtT0sv9yXYm4pe76+47Aw5YxnN5WQIAtBV0tsd5Dfs4Q
FCOIHYbsR8lchLm/HGG4D9L0w5fUgQ3TzaOUaWUQ3sjeHvpTGSH7JJCblU3FXlFB
N3Cn6HcfRTe7Izg9jH6lkYmaDvwsshB3VjK/uiegjLZPkN/EPGkNdwRnDId4zk/7
/Zgb5gYeLzQzXlxJM+WFgTS4aLLGg6UGxgl6PUHeSUXKdxoo9pjk7LtfRVpb+mHu
LHt7KzZLjCHrntyYHaXrxSHcjQZzxr8pGnPl+bfMjlpKpkbMBIyfncncJUiDz6cy
DuITnJtHM/j/zc6ciV1UPNWiF9bIu1ga6GdKu9/UEMlvE7xkgXs=
=0OvQ
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
