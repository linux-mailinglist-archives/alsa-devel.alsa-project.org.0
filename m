Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B72512CB
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 09:12:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F06121670;
	Tue, 25 Aug 2020 09:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F06121670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598339554;
	bh=FWfgAaWELOpnq9T2ZqffNJ7A9qnO3QfKuIy+OMg+Nkc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHHcemnQl16sjoAy1sfH1PGIhGiEK+gd6U3xS9yJVdhPlW7bk/5t0GVdsq9tJtnDo
	 FJS8qecPHCIaKDH+TLzsd4tH7AMpvmXihXHiYxOkbocWPQBnHux6/Q5WUBTcu4FkSI
	 p4Z+VNEJBYX0NAfwEoRoVU3Ury9lU+ZqQg3IJn6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B410F80245;
	Tue, 25 Aug 2020 09:10:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90A65F8025A; Tue, 25 Aug 2020 09:10:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24998F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 09:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24998F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f3Wq0A6w"
Received: from localhost (p54b333df.dip0.t-ipconnect.de [84.179.51.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C35662074D;
 Tue, 25 Aug 2020 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598339436;
 bh=FWfgAaWELOpnq9T2ZqffNJ7A9qnO3QfKuIy+OMg+Nkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3Wq0A6wK+XyCx0NdyaVbiOp2OMrI3KPwj1V3RQ/NOii/Sv8XJMYsbLmiBZPZxHLr
 0oPOxmO4ZW2uxwUXqLpZCKZIApP5fRkbLXbO9bWzKlL5g/hG5Vx0qfVAI9CAKfOqMV
 tmM358uBo/FCFQE7cpCl+yIXbi94y/ptPbOUqIoI=
Date: Tue, 25 Aug 2020 09:10:33 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
Message-ID: <20200825071033.GB1861@ninjato>
References: <20200812203618.2656699-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline
In-Reply-To: <20200812203618.2656699-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
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


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 02:36:18PM -0600, Rob Herring wrote:
> Clean-up incorrect indentation, extra spaces, long lines, and missing
> EOF newline in schema files. Most of the clean-ups are for list
> indentation which should always be 2 spaces more than the preceding
> keyword.
>=20
> Found with yamllint (which I plan to integrate into the checks).
>=20
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

I trust you guys in figuring out the details, so for touching I2C:

Acked-by: Wolfram Sang <wsa@kernel.org>


--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9EuWkACgkQFA3kzBSg
KbZbPA/+MqNMzGTVXT++2afD+v/Qkum1LRbeldro+e0ewQSps4tnW/eHg9RaemYr
BwxfsOZA+EJp0lGOnRM5/vhPMoInlSEwJSBlxtjratUScfPiR7D4ljKXGaUQv4IV
l9cXBZuOeLnSerxdYsuGrs8M0uqe4rAc3jt/FGD4rSgawNTN1HieFaQ0vq/0I5Gi
pyJv09alaosBuqNYc37Gqm9Ddk6xEJb8lvwrVqeS2ZGMFmfJuFlsuLKhwdgen/og
Wik6VZEjyUHJbyZgkcwMn6rTVTnopK7E0RYmdap35Bh6MAZ3auQ4eQU2tktY3L0G
+NL/ah9FAvmPH1RAR7KmXzZxVYX2ZoWm3AJVpCIvlc9toZI5NdOwdruT+KlTLHIY
T0vs7B3wqsrD4pHputHdDtf9iSZDB0FiTi44yJjReI72Yb47gDXXK7tOcewvq33Y
J9dv/HeT85ER8dZ3fCssLdOsIVSE5ZGaDGjP9M4hPo5ZqM5WlMcqW13gmBsEaY3W
quFFx4pgOXFmnO+7fCb0OIoySeTtgCMNqSwekaNsrbK8dBsFhMx62IzUwwCwL8ST
clLrMsK81BA4v5hiU1SXC5zAJJG1W0FEpGvIuQRa5YxW8goqwIJrEuvy8jWLhg1x
kB4BNFdQdBMg8xw0GSHGDhOZhIxgC5t/fvrbiLmqazzmbfCE1i8=
=71f2
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
