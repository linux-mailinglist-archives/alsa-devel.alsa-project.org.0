Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421D22224A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 14:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7F191661;
	Thu, 16 Jul 2020 14:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7F191661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594902024;
	bh=0J7nQDSjZrTifeuADANONS1SeBEAquG208vMBg1R4N4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q/nm/IdKoruw/6GA/krcruFayP3/wFgyFK3YflY0DpGm+ydeKpTiH5TKgWDcnnTev
	 F5cZ4VSJhshh7nb43MK3U9ouviCYaTjGp8HyKWpMgLEfCKGj7TuxRqL63A2zPsNeUn
	 65rui6hl/n+LvzkWDnQL/rR9Tn9sXcrqpKDNszNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 071A0F801F2;
	Thu, 16 Jul 2020 14:18:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FE47F801EC; Thu, 16 Jul 2020 14:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D141F8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 14:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D141F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TAp+CQ4E"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FC2420739;
 Thu, 16 Jul 2020 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594901911;
 bh=0J7nQDSjZrTifeuADANONS1SeBEAquG208vMBg1R4N4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TAp+CQ4EFF4rW33jqP8BQziIMOZ/7afSs977gdQHDbgBcHFXzCgySxSSTS33Y90QM
 UYEwh52tT1RepBptgcrdLs3VBXHhly+fbyLLWr7QhNVPoqhA+uZt6lbeGmIFQNFaU+
 xdo7RhZONkxj9Bj4fEwIZTbUxl7CH2KkVb8dSzWM=
Date: Thu, 16 Jul 2020 13:18:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200716121821.GA5105@sirena.org.uk>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
 <20200702184226.GA23935@Asurada-Nvidia>
 <3f39a0bb-a766-f646-28b3-a51cf9983c6b@collabora.com>
 <3fea8912-63df-ff27-0c29-6284a85107ab@collabora.com>
 <20200714201544.GA10501@Asurada-Nvidia>
 <20200714202753.GM4900@sirena.org.uk>
 <20200714205050.GB10501@Asurada-Nvidia>
 <20200715140519.GH5431@sirena.org.uk>
 <20200715210308.GA14589@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <20200715210308.GA14589@Asurada-Nvidia>
X-Cookie: This login session: $13.99
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Timur Tabi <timur@kernel.org>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
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


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2020 at 02:03:08PM -0700, Nicolin Chen wrote:
> On Wed, Jul 15, 2020 at 03:05:19PM +0100, Mark Brown wrote:
> > On Tue, Jul 14, 2020 at 01:50:50PM -0700, Nicolin Chen wrote:

> > > Thanks for the input. Fox i.MX6, I don't feel it would be that
> > > drastically different though. And both SSI1 and SSI2 can simply
> > > select the same root clock source to avoid that happen.

> > If you've got two radios that both need to sync to some radio derived
> > frequency it gets a bit more entertaining.

> I'm simply curious what could be a problem. Do you mind educating
> me a bit? And ASRC here isn't a radio but a sample rate converter
> working as a BE in DPCM setup, using radio-capture for example...

My understanding was that this application was using the ASRC to convert
between the sample rates of two different radios - the rates may be
nominaly the same but in practice different so the audio will glitch
after a while when the clocks drift far enough apart.

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8QRYwACgkQJNaLcl1U
h9CZ+Af+NYRxkfTtg8WBjZni+cWVj2UYcWJzvcO+/I8x9ezubUx7VFoudv4EL5Xg
p65R998zXaUDrzqN9gYMjrP0/vxiPyuzRgJox8+zdn+hWcVwotRQ0iTzy2zyg9Er
y2+7AniP0YI6RikrzgQ+ARmMPjZ6+TnTlasPHjWBBJ9m2A22LbJvgSBDsrNWQeA2
kt/6AMU3Y3Mo3SNUNCKujFH7+EH+byFOcwnro/+UErg+2Jh8sgTIEHoQfXKWh5I5
F/S0mB8aZONQ+6GcJelTkEOJl6t0h1EXi5YAEwyGj+BaqUUyykUAP0u02agGqKBI
iM4/4uGgIL5OTKvkmGfnol1KxHBXiQ==
=QiTi
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
