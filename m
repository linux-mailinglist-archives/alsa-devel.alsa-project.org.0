Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 594204A62C1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 18:42:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDD9C187A;
	Tue,  1 Feb 2022 18:41:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDD9C187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643737363;
	bh=xqurn0aMLg9LPORst7+QOsFe67TLB0BWbKrD5lJaEUg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZuJ5cgRozp2hL7zzHfOz67BtJxfwOo1qSM+i5KCmbKs7iGkZn/kFj4EjTQpStNG4R
	 /iEJXufsRZShkOeZgy0uYzBO4smWvUFEaWByMiPoeAxl+nUuWfap+pXgjGTKMQAs6e
	 tg8cGvmBKuEj89Yx0qZbTBqCVKVp9aO3lorFIN4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 645C7F80089;
	Tue,  1 Feb 2022 18:41:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA749F80130; Tue,  1 Feb 2022 18:41:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1697CF80089
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 18:41:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1697CF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XhHJogGx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44E8A612D8;
 Tue,  1 Feb 2022 17:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF857C340EB;
 Tue,  1 Feb 2022 17:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643737287;
 bh=xqurn0aMLg9LPORst7+QOsFe67TLB0BWbKrD5lJaEUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XhHJogGxV9fLNWcbgdHNbs4+6IXOssN8O5a+LqiuEY6P07FpWmF/V00NmNuNAgUqO
 kKdSLwkI8CmW+4H9dbwuJc+ABJUEQvo2E2N/uoDRkYkT3ZPJuyFbZu43Q3gd+OnsQw
 fYB5RWS7G5erqCaqn5LNsGO0YnZun6GjONge/RFt/ej5tHy1NHmWd1yfxfTooCHPMQ
 OxurKPbSFYwaXOqklMaETsz+0+Y70jMdTuHpjFJfqSEenTNQhmwiodDdNrv1FlQKH+
 p+tQhFU0RQ6NVojA19GGX4+lq6bNYZvNCDlQ1qGcjiwQmqywzurGJ5DlSKTLTiV7w0
 tKZYDzdCKiHyw==
Date: Tue, 1 Feb 2022 17:41:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v6 0/9] Support Spi in i2c-multi-instantiate driver
Message-ID: <YflwwWD85CmSzlgT@sirena.org.uk>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f9iEEYctSRFMQhBo"
Content-Disposition: inline
In-Reply-To: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
X-Cookie: All's well that ends.
Cc: platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-acpi@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 patches@opensource.cirrus.com, linux-spi@vger.kernel.org,
 Len Brown <lenb@kernel.org>
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


--f9iEEYctSRFMQhBo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 21, 2022 at 05:24:22PM +0000, Stefan Binding wrote:
> Add support for SPI bus in the i2c-multi-instantiate driver as
> upcoming laptops will need to multi instantiate SPI devices from
> a single device node, which has multiple SpiSerialBus entries at
> the ACPI table.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-acpi-helpers

for you to fetch changes up to e612af7acef2459f1afd885f4107748995a05963:

  spi: Add API to count spi acpi resources (2022-02-01 17:38:48 +0000)

----------------------------------------------------------------
spi: ACPI helpers

This patch series enhances the ACPI helpers to cope with multiple
resources being available and exports them for use.

----------------------------------------------------------------
Stefan Binding (4):
      spi: Make spi_alloc_device and spi_add_device public again
      spi: Create helper API to lookup ACPI info for spi device
      spi: Support selection of the index of the ACPI Spi Resource before alloc
      spi: Add API to count spi acpi resources

 drivers/spi/spi.c       | 137 ++++++++++++++++++++++++++++++++++++++++++------
 include/linux/spi/spi.h |  20 +++++++
 2 files changed, 141 insertions(+), 16 deletions(-)

--f9iEEYctSRFMQhBo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH5cMEACgkQJNaLcl1U
h9Ck2gf9GYw5kRyywJi8CHAE4s6w7WHL0sKrCSwxkn0svqktdSthmB1eYeKBXKma
PaNBJ6aN6PwmUTN7O3qaw03HbPbXX6m7/6B3nYLCm7DV2GcCK/eGhvVeOQfPeAvj
Ydh1Xv7G6BYCPpAy4gYTQb8qZ4okCpe/bAhvqjFE44I04psrXSaByp502BJ32o7G
DfAZa6Tp2OwOmdtveUBFyu7KciNDLre9taSfKd6yaCnWrAJIuwWxdmgFlSXUqAg2
J4x2i0/tCvxCyDBa4XlGpAJ+56QCMIQLakeJruDF7lSA5qOe36MLDwJ8ONRMClNw
5NmIEME3mIGVUtw43zzwdmAoBezAjQ==
=zFNW
-----END PGP SIGNATURE-----

--f9iEEYctSRFMQhBo--
