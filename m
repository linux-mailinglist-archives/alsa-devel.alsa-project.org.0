Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C13327F6B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:26:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D651672;
	Mon,  1 Mar 2021 14:25:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D651672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614605198;
	bh=C7VhOIr/OQnZunP6mhmfsuGiCbmGkJIMi38S4yxatyc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ex6vh4HcAJ8wPdoZjVg57MTuVaN5/6oteZ/mQia/3qzLYitswDvAYEAR3bpyay9j9
	 1Dbp5VhBvQsz5c2/L/pbyZPjJ9uxmUzTyI5f4dFqNrMqG5b35/7RAT1xUaaPAN8zgf
	 2rU6v3tmHtpTlpYu6CWjmHptjH4wrDTxWIn34aA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4668F80475;
	Mon,  1 Mar 2021 14:25:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 770A2F80518; Mon,  1 Mar 2021 14:25:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C33E0F80475
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 14:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C33E0F80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gaWTmkFd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 087AE64D9F;
 Mon,  1 Mar 2021 13:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614605098;
 bh=C7VhOIr/OQnZunP6mhmfsuGiCbmGkJIMi38S4yxatyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gaWTmkFdun6+e80XYWG3zMqxqXjc3w5VlShUEC/gYLdd0kvwMacEE/wNJsc5DSIys
 SQ1H7YNz6lUbEAIRqb6ehlnXIICU5PbcQI6x3kHI0E7OlQcHJhLLij1WxnDQZAHNKa
 JDauJbYoNahk6Vkx9Y+nn2Xw/HRPKXRKFpZWpCxXCkzyW/84Z70Il/8kypWdB8+yiX
 46AFDhS398K92pFDF7hG9zpcHMWL0DVAGzjnbP9Zg+jj0qp00vPDkKua38iuKMt+U8
 qvXZvXpwHUr7mvMa09c11e7fbKZL6EVUzhmRCGy9h2yv5rBKWmlAzkINkPn3JB4voO
 6A2mzocSs4U4w==
Date: Mon, 1 Mar 2021 13:23:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Message-ID: <20210301132352.GA4628@sirena.org.uk>
References: <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <20210223172055.GI5116@sirena.org.uk>
 <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
 <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
 <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
X-Cookie: Body by Nautilus, Brain by Mattel.
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


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 07:45:15PM +0100, Hans de Goede wrote:

> To me it seems like a really bad idea to add userspace API for this now,
> when we don't actually have hardware which needs this. Introducing
> userspace API for this now introduces a significant risk that we get the
> API wrong, since we don't actuall have a use-case where we actually need
> the suggested flexibility. And then if such a use-case does eventually
> pop-up we might very well have gotten the userspace API for this wrong.

> I'm not saying that we will never need such flexibility, but we do not
> need it *now*, so as I said before lets cross that bridge when we reach i=
t.=20

I don't want to get stuck in a cycle of "why can't my system just do
what this other system does", or worse end up with problems due to
competing system requirements when patches go in on more flexible
devices because I didn't notice that the device wasn't a good fit for
this sort of thing but people have the expectation that the kernel will
transparently handle things.

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA86ucACgkQJNaLcl1U
h9CJJAf+OMNHkw3jkAdMEpLEpLa19oieszn0FruQege69wxwPHqc32t8FSpF8aNN
FN9f8AO720BeVF+u02HxJ6IXHeLD0boIjBvrXcyZNESeMQQ8dqQatDTcxmX0O140
En1HjDkNiE6gej04EaSElKbGmV96lnq9WvfR/YRsj9EI+/ZTfsGqniez+WCAh5VV
TfFj8jmdK4CKjyb0DYctstTGTenbaj35aidvVqx9L4IUqy1JuvZDKlGhtjbamtxn
f/dHjTb8vccKKggE4dmM0DtE2+XDP0xHNhoo1SsgB7rt9/h/adcT/e46Twy9ifQ1
rZNX+M64bQY1JUXwToCQqqKUW26yZg==
=bjm1
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
