Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19495463F7
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 12:39:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320E61AAF;
	Fri, 10 Jun 2022 12:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320E61AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654857559;
	bh=1sSMdOjlL12ZEAViwInbwrCK9hHGwi1zWwKZdCR2xP0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C5pebSB2iWtp5NrzTbegM3pwNTOWu01GjTOhjvnbhx8MCCjRW2RL+f6maUSQTR+mA
	 gQXNmsaZR8K86jMNowaZiUCArQ0U4lkcTVTiAy0rxFz4CwNIRZsUDuvsy9Z+GJlNpE
	 PPB8Rwr37/zUw6z2Zi+OvgJUZVc0Vk9cwLSMFIjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2838F804D8;
	Fri, 10 Jun 2022 12:38:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76889F804D2; Fri, 10 Jun 2022 12:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B8BDF800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 12:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B8BDF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GN66HSLw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 033E0B833F8;
 Fri, 10 Jun 2022 10:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25979C3411E;
 Fri, 10 Jun 2022 10:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654857493;
 bh=1sSMdOjlL12ZEAViwInbwrCK9hHGwi1zWwKZdCR2xP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GN66HSLwef8gfMJIOdbA5ardC70LawEh2UO+swTxD+PFwAfIBOmkZjJv0T4judqaU
 JWo+4Je9QCiY7g3aJyhLXoOL5v9rhNpzOssQN8vECZ1BtFukSDSVQDGa59GcTicKQi
 Lgox+yr/U/S9m8iWdPwG2ZTXRqehmx5VU1N030wr3asKPOQ8Le0IeJR4hAw00Y698f
 GU/zuV1ZAls7sis0BpKsfzj4CgYa8mwgNcav9UE6Dv53gGu+znmHJkVSc0WMcUtUlG
 g1ORphxQ5NgKvvIcf2XwqKvxaHWvgNPCh8hl2kWFbCi2UWd+f99yRDZGP8Ly8p63+4
 vbQG4Eb+9jp+w==
Date: Fri, 10 Jun 2022 11:38:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 07/11] ASoC: codecs: rt274: Enable irq only when needed
Message-ID: <YqMfEHp1qaPs2+PL@sirena.org.uk>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
 <20220609133541.3984886-8-amadeuszx.slawinski@linux.intel.com>
 <YqIBRGNAOfxPJjc+@sirena.org.uk>
 <4ac15ba3-1f20-5361-1941-2687962ce454@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q0fkFI9z45t098O+"
Content-Disposition: inline
In-Reply-To: <4ac15ba3-1f20-5361-1941-2687962ce454@linux.intel.com>
X-Cookie: Teachers have class.
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--q0fkFI9z45t098O+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 11:33:34AM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 6/9/2022 4:18 PM, Mark Brown wrote:
> > On Thu, Jun 09, 2022 at 03:35:37PM +0200, Amadeusz S=C5=82awi=C5=84ski =
wrote:
> > > Interrupt is only needed when jack detection is enabled, so enable it
> > > then, similarly disable it when jack detection is being disabled.

> > >   	if (jack =3D=3D NULL) {
> > >   		/* Disable jack detection */
> > > +		disable_irq(rt274->i2c->irq);

> > There is absolutely no need to do this, it'll interfere with any sharing
> > of the interrupt and if the interrupt isn't firing then there is no cost
> > to having the interrupt registered.

> > The driver could use some cleanup of the interrupt handler, it currently
> > unconditionally clears anything that fires and reports IRQ_HANDLED but
> > should only report IRQ_HANDLED if there was anything from the device.
> > Practically speaking it shouldn't make much difference unless there's
> > spurious interrupts or the interrupt gets shared.

> I will recheck this again, but if I remember correctly we may have had
> problems that codec kept firing interrupts when we unloaded machine board
> and codec driver kept spamming dmesg due to _dbg message present in irq
> handler.

If there's issues there they should be fixed in the interrupt handler -
the driver should be able to handle the interrupt sensibly either way.

--q0fkFI9z45t098O+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKjHxAACgkQJNaLcl1U
h9AoaAf+J4kqrTExY5qe84RJybpdM1mUOOHvnBZVAWOr/yPlnEQGCOAtK8YVqTDX
uKn/1p00NYOEQeKDI1IiPuLKT31SCgOi4+0aWI0/iSo4KRkfs7a6JQRSWyYNVSWz
v8/4DYMdQKLsaxG4vq5Y29SjH+0ayW3zk3KBXc5bUk7rPLRVPc0rdetGKKvmctUZ
drHcQ98/XvsRg2OAamfls8m/TRWQvNQqNYBAeN+F5M0d7SqDbduGK4yWmhfdJzjQ
E+tmxJZk5M2E1L+Ec0y5yDItI2FcqarjwqXwqFkVAzEv+X9IonQrkfIqPP0f4O9N
rxjdwg3vy/HWHh5X/wVLJq1a7JXrNQ==
=3m2y
-----END PGP SIGNATURE-----

--q0fkFI9z45t098O+--
