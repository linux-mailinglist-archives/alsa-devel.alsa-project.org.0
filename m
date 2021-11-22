Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E8E459E29
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:33:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E7DF1670;
	Tue, 23 Nov 2021 09:33:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E7DF1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656439;
	bh=5HPGeejKcq0/skHJyiqCEkuW5nT9h90VXdWH7CYPbFE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rab2A3flp43lV6YSk9VcXGbtTqxCDd1jfHDhMejuYNRzR5T+ILA48Ssg3fzoLuqKi
	 R6JTjY8eBfDPniKcVQMXLtm7V/HL1pTSaz0qqQ16a1i3nnujD4ujyVrpq0EM1wcPaC
	 L4XIjFrfn6oeot8pnPCEw9HN06WTaumOMNv0VfC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7B03F805F7;
	Tue, 23 Nov 2021 09:22:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2156F80212; Tue, 23 Nov 2021 00:01:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02885F800E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:01:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02885F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nEdiJ23l"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DBA960FED;
 Mon, 22 Nov 2021 23:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637622097;
 bh=5HPGeejKcq0/skHJyiqCEkuW5nT9h90VXdWH7CYPbFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nEdiJ23lulIvuZIRcBfsS+qhZQdy45DABTeQ/9eMEUl1h55xvksxls/uuZO4VBeI8
 VaCo7TKNLJwRLa3QYvdv6RNwEp2FVuh3jDzzlTQaQEP63m8H/MG3PA9JAEloDYolQp
 c9/rmjY39HvZyawWUPIV3NjC+iYFEvh7eF6njpejVduCoCGuYmDwm0WoROg8MZpuON
 SIl6D9XkBqQ40owCHtFzbFPFXQsgb6+Hp4V/BoNJJJnMHVdW/zgOyJBpirCAwPOfIz
 HcfB+kkGUqemGZoka/SinHrWStHXFAUQPzrIQFgTm1oadehKRNNCm1qA6BWKPpcaq0
 1TgibwoU5fvdw==
Date: Mon, 22 Nov 2021 23:01:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 00/11] dmaengine: kill off dma_slave_config->slave_id
Message-ID: <YZwhSPkhAqZy3bqY@sirena.org.uk>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="71Si6a9AhnlReqww"
Content-Disposition: inline
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
X-Cookie: Lake Erie died for your sins.
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:57 +0100
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Baolin Wang <baolin.wang7@gmail.com>
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


--71Si6a9AhnlReqww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 11:21:52PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> I recently came across some new uses of the 'slave_id' field that
> I had (almost) removed a few years ago. There are no legitimate
> uses of this field in the kernel, only a few stale references and
> two drivers that abuse the field as a side-channel between the
> dmaengine driver and its client.

Acked-by: Mark Brown <broonie@kernel.org>

--71Si6a9AhnlReqww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGcIUcACgkQJNaLcl1U
h9B/hgf6AiPwJAMMKcdb/6uCfAJACPZtqMFn2hE6HQgrw8mlTsR3sGqhQj3c3NWF
vkLYtSZ20L2tPvS1uyAxjIRzIm91rqriu6pNurmupB6D+347UfSMpYhtbEKXvbBw
1UF5ftPw1t5IGduAX6HKBfaN1Iab53577DJb/uJwR3Mb/WBh9aFpuyRwuZgjBOwE
MvpTaAK2GHY4loDjJChSAK+zlCQMFbc4I2mZuahtf4wvBts/eZn7bAqAruzPMnTL
e3crlktLeH7C0DMKJpmrxvTvS0CDsEUUOJ+tM7aNmtsdyYTAZEG35vzJgVly61jc
7e5I5GHB1Jxsid3oM7WeznOhbimQEw==
=AKUT
-----END PGP SIGNATURE-----

--71Si6a9AhnlReqww--
