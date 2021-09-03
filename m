Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805934001C6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 17:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0533C18A2;
	Fri,  3 Sep 2021 17:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0533C18A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630681867;
	bh=G5457ROEjSKUh7STUUn/WjHVpe/TiVS9hneSpwDe7qY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPnRm8amk6mceKhCYNd7V4XFEOzO+AL3+ovBLVpA4F/8MsrTh6KwfFNAj8JLgwXeJ
	 1FwtfHJsSZlxP9Wz0YoHtDUhhfoXAZf+As08HzlItWA6uIP1PaJWGOeGJun33Bl2l2
	 6fyB6Si2/Wg+EGLbn4Hq+9IAXWE9hJcZ4xlJuJyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53F8CF80256;
	Fri,  3 Sep 2021 17:09:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98566F80088; Fri,  3 Sep 2021 17:09:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0109BF80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 17:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0109BF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JyUz96uc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC0E360EC0;
 Fri,  3 Sep 2021 15:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630681776;
 bh=G5457ROEjSKUh7STUUn/WjHVpe/TiVS9hneSpwDe7qY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JyUz96uc+a9Vdd8A05YDF07UVBj6/nD8xZ3BxvqFq6k7ak9IwpHJ9YLZyISblX6O/
 ii/1a/3qaoICQGaCJ9a3ZyoxUqRMxvHQ+kNM4ZAiXw0wKIouLYE7vqWfhDcMZLCQPJ
 0wlhkcv9W069gDG/Jw3Z5Ui1naQ5FO1WhvF7ssyXuXJM5Jh7AAwTyx5B/UaH/zY8/n
 pMjL0FKUNdaDjwdsgjOe6WH7PlMdjipJaHqsUAsswPuLiUjEM8IbEd99GjSkctQtDB
 a79qOr+om3Y3w+6U1e9dOzlIXGH7GBBCpwntpXlx88Oej3tJSkFfOycodIENavtfkp
 nrF8GDlNqCboA==
Date: Fri, 3 Sep 2021 16:09:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v5 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210903150902.GJ4932@sirena.org.uk>
References: <20210816224310.344931-1-drhodes@opensource.cirrus.com>
 <20210816224310.344931-2-drhodes@opensource.cirrus.com>
 <a0be6858-0d98-7f26-9ba5-f290c9809b5c@linux.intel.com>
 <cdabe1e9-5411-d2b6-d629-8ec87aa4c764@opensource.cirrus.com>
 <7c38ddb4-9ccc-130d-e977-4f39b01e2c9e@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j+MD90OnwjQyWNYt"
Content-Disposition: inline
In-Reply-To: <7c38ddb4-9ccc-130d-e977-4f39b01e2c9e@linux.intel.com>
X-Cookie: Darth Vader sleeps with a Teddywookie.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: David Rhodes <drhodes@opensource.cirrus.com>, robh@kernel.org,
 brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
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


--j+MD90OnwjQyWNYt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 03, 2021 at 08:58:17AM -0500, Pierre-Louis Bossart wrote:

> > I2C and SPI buses, when they are looking for a driver with an ID that
> > matches a device declared in ACPI, will iterate over drivers that belong
> > to the bus only (bus_for_each_drv()). It is not possible for an I2C
> > driver to be matched during SPI device enumeration or vice versa.

> That's good but that use of the same HID for two different solutions is
> still be problematic. On ACPI solutions, we use the HID as a key to
> identify what machine driver to load, see e.g. snd_soc_acpi_find_machine().
> By using the *same* HID, you will prevent that machine detection from
> uniquely identifying what mode is used, and force the machine detection
> to be expanded with e.g. DMI-based quirks. It's really far from ideal

You can always add the bus type as a key if you really need to?

> for integrators. The only case where this would work with impacts on the
> machine selection would be if the choice of the SPI and I2C modes had no
> impact on the functionality of the device, but is this really the case?

Usually that's the case for CODECs, it's just going to be a question of
how fast the I/O is, physical design considerations and what interfaces
you have available.  It'll be limiting for some applications of course
(slow firmware downloads for example) but given the way these things are
built I'd be fairly surprised to see something actively gated off.  If
you look at the I2C and SPI bus handling for individual CODECs they're
usually extremely thin wrapper that just pass a regmap into common code
with nothing else done conditionally.

--j+MD90OnwjQyWNYt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEyOo0ACgkQJNaLcl1U
h9B2Swf8CezvTblUkk/we4wyt9iJD44L15yWSTU7aaO3W86ymZxLV4rQYizNw1kF
c9bHQBDjpf94dN94x9wC7b8f40zBxwmZ8DdIlF+c3EZBboyuKYKv+ux2WbIfV/mg
0DfE6brf83pobfjaWNjWNKjK/pGba+1hTwyLPaQET66b6CXddVvel6srghLztsK3
RCq4E2xUPi8Hjhg9uM4wwqDMdfdajDFVwECDkZIXtryIriEHgNg+HRLTywq5ON2z
HpmVL70Up9L2er7tunddO1KyaY5FD+5nvKJ9WR3IGSeV7bgtJJy75tgD1LT8yISE
IiLGKMByrC8ahLNOWmJRcP69wbICig==
=kSWm
-----END PGP SIGNATURE-----

--j+MD90OnwjQyWNYt--
