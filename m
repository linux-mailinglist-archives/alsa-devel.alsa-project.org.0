Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F063251E0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 16:01:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73684165D;
	Thu, 25 Feb 2021 16:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73684165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614265304;
	bh=0UHM4qCHmIac2C5FHo8TcxCcoNs9vMFTtwVcr2tg2aw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q6EWTi3vKWmvOdREZcbuwZ02emmA7IXS4GIUgaHRqoB3jSSeTwD9qEQmDrPjh/nvB
	 qHCSEFyY55mPIPrPEAmjJ0GKgLMmf2pMOoO7l3HbMOWOQ7fuSqZv2LOaEPKIbQz69B
	 CoAEdOLjm9UbdDh16m2qcaC6LbcNCBrvFN8HUey4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A06AF8016D;
	Thu, 25 Feb 2021 16:00:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B1FFF8016A; Thu, 25 Feb 2021 16:00:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F694F80159
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 16:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F694F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="btDlcbOj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D58E264ECE;
 Thu, 25 Feb 2021 15:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614265205;
 bh=0UHM4qCHmIac2C5FHo8TcxCcoNs9vMFTtwVcr2tg2aw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=btDlcbOjUi9xErbtEz8PirNaQRGAXXj4maAdprOQiYfvThmlXr2Ufp0uyUgn7BbIJ
 dA/bE5Gfmjq22oCSYTwyM2zzR5EnzCDrocjUYBeyWD3PzwKoeDhmx14qBvrB864y4s
 PREueKhdJuzqy+NRzwDKtZ1+p65qCUMljN2oneQL27P1qY8HUpyw2reUKthuZuStQw
 uAHj6wPkTBZ+V8MPfeC2+Hdd3EgLodQKbYGqh4NUqx+fn1KPBePSYuAbZ9ZuirTRf/
 xWnWMgxHRbsPTztNcRdtO01yZrnhk/Y2FlrFDgt7C3S/14Qk9j9r4cRoZnzkDntXK+
 x4mbS1ULj+g0A==
Date: Thu, 25 Feb 2021 14:59:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Message-ID: <20210225145901.GB5332@sirena.org.uk>
References: <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk>
 <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <20210223172055.GI5116@sirena.org.uk>
 <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
 <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline
In-Reply-To: <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
X-Cookie: A fool and his money are soon popular.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 24, 2021 at 09:09:36PM +0100, Hans de Goede wrote:

> Given that the use of mute LEDs itself is actually rare and especially
> the use of mute LEDs in combination with ASoC coming up with some
> generic configuration mechanism to allow userspace to tie the

This seems like an optimistic set of assumptions - it may reflect
current laptops but it sounds like the sort of thing people might
deploy on future devices, never mind all the non-laptops that could end
up wanting to use this mechanism.

> Not to mention that this would just be punting the actual problem
> of figuring out which control to use to userspace, while the kernel
> is actually in a better place to make this decision since the kernel
> already uses DMI based quirks to deal with model specific configuration.

Again, this only works in cases where there's only one option for the
control that could be used.

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA3uzUACgkQJNaLcl1U
h9BeLwf9GN1+0cWOpvMJPVr8sFWuBhJMkyzNO3ZK0KAJIhsoJjAt1VAAXAE2NcB5
MjmrOnTHoKhtw9cqHlm9MeKHw4RXu+yqjceE2/3bDM56K1yRqWEVYWq9C9NJ2AaW
JEg/hwx3LqRtZi7q54rsmqR8oRrCqRF7cRfG1ThzS+LE21lRUPZvw9r618JSapod
pfJUKz/FQeIaFiY8OgpMk+rbsmvV2tfIf9xzki1M6kCw09I+R9wcTj6wfvm8fj4I
UDj/NNS6a9ZeWdeM0i7cUtFad4Dz0KpaRaPjsERqEjjiP99AXeLSBrGk9QFczGpG
uYbA5j6sVUQRVAp5VT3aXunctvekWA==
=Cl3N
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
