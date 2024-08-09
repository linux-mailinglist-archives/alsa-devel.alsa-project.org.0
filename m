Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F494D92D
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2024 01:36:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B9FEF2;
	Sat, 10 Aug 2024 01:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B9FEF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723246615;
	bh=lN/OqN7miAwFNcF8H3xwMIZzDoeycCOqpmGCgUI+PSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RfhTlxcLrvQ3svnd46ToAjklArhVix/g0dkgyCs0psH7l84RzutBTn/HtlYxv86cG
	 GnTsHHet92mA/PvcOShoNR5j4U+vymePyIUkHdHe8knzSNaVclvkRfPgBSwR1cxtQJ
	 FDdzrchZgXxxthW5b/YjUmcn+sAkMNAZIVe9bNqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7606BF8049C; Sat, 10 Aug 2024 01:36:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 618D4F805AA;
	Sat, 10 Aug 2024 01:36:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78A59F802DB; Sat, 10 Aug 2024 01:26:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 452CAF800E3;
	Sat, 10 Aug 2024 01:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 452CAF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GOXt9KEi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD8766177D;
	Fri,  9 Aug 2024 23:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3133CC32782;
	Fri,  9 Aug 2024 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723245982;
	bh=lN/OqN7miAwFNcF8H3xwMIZzDoeycCOqpmGCgUI+PSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GOXt9KEig8TOSTEtraorQBKpBqKyG9RnFmXv78GMccG7EYlWNlhl7Oj0syMgcJrnn
	 kyzNv9i4QTjO4QGxQUBXWLHIqlfpzxWxQw5nmrFwANQMFWvBnIfdfzT6noXhlPIMwr
	 1tOKWUNtLChcJdSUcJguNS8kxhHjVydUCkgSTXM0u6n+p2Olrvv+i43zpkbY8L1uY2
	 igAKn++xAgGzPoBlBLKl2NQr7Y4rVgea1LK4swoSByJTa5YjOEY67bLcrEBMsD19Am
	 JIPPhz1juMdpwEcx4LKcdVcn35dgWbTorNDp9x21fRhSmpcc2vLmU27LmvbRAjrnRy
	 nQE/qhqrAzEDw==
Date: Sat, 10 Aug 2024 00:26:15 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] ASoC: SOF: amd: fix for acp error reason registers
 wrong offset
Message-ID: <Zrall8SwKewe2_hJ@finisterre.sirena.org.uk>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
 <20240807051341.1616925-2-Vijendar.Mukunda@amd.com>
 <ZrUdOyGiFRH0sRlt@finisterre.sirena.org.uk>
 <a6a0c975-728b-4379-b074-b88ac928c58b@amd.com>
 <ZrXGzmhgyIJ9ID6I@finisterre.sirena.org.uk>
 <adeb6cf8-1fb6-4bf7-8d36-504b22c366be@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IlVGhZeaPl9FJZ8o"
Content-Disposition: inline
In-Reply-To: <adeb6cf8-1fb6-4bf7-8d36-504b22c366be@amd.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: 3LUNIFQNBAZEJW5P4ESH5L4IAJPBN7IJ
X-Message-ID-Hash: 3LUNIFQNBAZEJW5P4ESH5L4IAJPBN7IJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3LUNIFQNBAZEJW5P4ESH5L4IAJPBN7IJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--IlVGhZeaPl9FJZ8o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2024 at 01:49:37PM +0530, Mukunda,Vijendar wrote:
> On 09/08/24 13:05, Mark Brown wrote:

> > We want the resulting git tree to be bisectable, that means testing each
> > commit not just the final result.

> This patch series is prepared on top of
> 20240801111821.18076-1-Vijendar.Mukunda@amd.com
> which are incremental changes and also has dependency.

For the benefit of those playing at home that's "ASoC: intel/sdw_utils:
move dai id common macros" which is in -next as 8f87e292a34813e.  It's
not great to base a fix for something that's in Linus' tree like this
one which has:

   Fixes: 96eb81851012 ("ASoC: SOF: amd: add interrupt handling for SoundWi=
re manager devices")

in it, and any such dependency really needs to get called out in the
cover letter if it exists. =20

In general you should expect bug fixes to be applied for Linus' tree by
default, especially if they're tagged as fixing a particular commit in
there.  That means no dependencies on anything that's already in -next
unless explicitly called out, and if the thing in -next is just a
cleanup or refactoring then generally it's best to just do the fix for
Linus' tree and then separately merge it up to -next and integrate with
whtaever cleanup/refactoring is going on there.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--IlVGhZeaPl9FJZ8o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma2pZQACgkQJNaLcl1U
h9CqmQf9Ell6DPD08llQhhPHkKPMmyMVMH3Em6EclWBfkZwMwcEkfeDi/gAmk/Nz
tq5bPTJlwqHSpHpYrhos+kf5H2ObSccJw5NqtHBtP5gZk/1TiKmh9e2zfH9Z4n29
hO5MKZ26/2OR1er7onLT9wq6WtC4VL0zO4wUTLq2N+VJPonmzUVLgarvpfZoiTGK
QxNFESF5EJ49Ci3WGfAFM9m395WBCJN5f1GXiUAxBvxe0pSt9g85zekj2KTlTBAt
dpSJsmM646UPt8H29qgOs4kC9O+MqCNqg9ws0sRF5gD6Pewsp1J0wHn2WN5lfln/
LHa+GWZR6Fp4wDP6q6FaB4GdyJdCgg==
=djWk
-----END PGP SIGNATURE-----

--IlVGhZeaPl9FJZ8o--
