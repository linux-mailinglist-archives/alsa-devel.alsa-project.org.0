Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A4C295F2E
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 14:59:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0939A17D2;
	Thu, 22 Oct 2020 14:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0939A17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603371566;
	bh=SqzxoiikPEBmlhJn06ROlaXzpWOL5Lkl7lMHaqJvppE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQcy4Fq/fyS5mxO/58o4CA4bQi54bnxXiNlm5qnLesWHi07ioXECcD4n5IMmCY4R6
	 gEBcWz4jz4OYcNLEZ8eLOWKVhyeJGxAIwc/RmrkP7H2uB//63aGk9BJkWakRtNGw/p
	 pLtVEDNew8zhyNZgkCfm2LgO4H/LYw6rGK7/8lYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 610FBF8049C;
	Thu, 22 Oct 2020 14:57:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB047F804A9; Thu, 22 Oct 2020 14:57:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3723AF80247
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 14:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3723AF80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="CbWjch9q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ln2fTzoh"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 107B35C00FB;
 Thu, 22 Oct 2020 08:57:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 22 Oct 2020 08:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=SqzxoiikPEBmlhJn06ROlaXzpWO
 L5Lkl7lMHaqJvppE=; b=CbWjch9q0xVMBCbOg/vBu3PnZRWmUXHzcCL5Cxi029s
 dQxIB63ezQK6YObcSgpikUp4UqTSX2QwKjna3YA7EPMnEDo7VCgKgO9Eb2qsfigH
 fCn8n5aexnV8JXUBmwUVJP7Auyl2GMFzT+szw1AoHsHGkV/Oh/Yils8SFLxmhroB
 FRvTK14CjtbSvj1qJT4D/Rwx4pxZkZLehXruAWc9tOw/Ty9xjyWhiJG0mPk4yBwk
 MJ+eu12hle/zwJdhSv8TIdf3zhbAtDYF3uIHWzuG7ff5cjEhGn7UaNFPocdpCm3E
 LLXY7sVoXzja8LecH+1s5yn7+wS40q15/4Jd27T92mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Sqzxoi
 ikPEBmlhJn06ROlaXzpWOL5Lkl7lMHaqJvppE=; b=ln2fTzohCK4peFmqfU2ffw
 GiYvCL2MzD7VGRLS6Tf1Q+RM/axS2/d4k7RZFE+H95zxX3QYNy0NcRbI2k89ClYH
 1x+OlJoYGcGdg8OOocX3ba8eItHudpcrTFvKiK17AsXBPMh6GIOh1iaWni1nO7cT
 VvFpGdQteKAM92jM7g8V1CYa6H6HzgcMMCWMvFJYd8Ff79gGwylJc6s4ODzI/VdH
 qgpdDm3HNfYBEM4xDIUxzzB/+tiwdo5LWGPJ6Dc4E6ZkagClyjYZrKK/DL8qJgjT
 LbfATHUfzXlFLgu+i7PxGzN/gS4fgkZPi+jPEtIb02K58AyXXnXSfGMCOGZrMNKw
 ==
X-ME-Sender: <xms:x4GRX7X12awgdHJAq9zUCnGn7DBgRiSy37GJ5yso81Mn2xdvmRKnow>
 <xme:x4GRXzlYYCxiICPBBGLK_jhkWM3fjyToocLGbDDshN95hFlv2maXUuqW4LxMAv9yl
 mjE5ro3zNuVpEtFBbE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeejgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yIGRX3YeNS45xGORDNekM6BycridAu1Sdj7TCSuVLoWxu4VMIVqhNw>
 <xmx:yIGRX2VopxPa2EUADf9XezxtaPMv57T2WX6AFLAMIF1xozpw5VZtEQ>
 <xmx:yIGRX1n1cdXaB6aY0rIihs79T4OZMuEmvKI8faRI_7jApZtoKZNKhA>
 <xmx:yYGRXzYytHhEgelO4kJV7_fWGkhhaCUq5pV8nqllDthDhaLojGj2LQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AEC50328005D;
 Thu, 22 Oct 2020 08:57:43 -0400 (EDT)
Date: Thu, 22 Oct 2020 14:57:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Context expectations in ALSA
Message-ID: <20201022125741.xxibhwgcr2mhxehe@gilmour.lan>
References: <20201022095041.44jytaelnlako54w@gilmour.lan>
 <30226f94-72e9-34d2-17d0-11d2501053f0@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d62deidd5dansznh"
Content-Disposition: inline
In-Reply-To: <30226f94-72e9-34d2-17d0-11d2501053f0@perex.cz>
Cc: alsa-devel@alsa-project.org, Dom Cobley <dom@raspberrypi.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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


--d62deidd5dansznh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2020 at 12:03:19PM +0200, Jaroslav Kysela wrote:
> Dne 22. 10. 20 v 11:50 Maxime Ripard napsal(a):
>=20
> > So, I'm not really sure what I'm supposed to do here. The drivers
> > involved don't appear to be doing anything extraordinary, but the issues
> > lockdep report are definitely valid too. What are the expectations in
> > terms of context from ALSA when running the callbacks, and how can we
> > fix it?
>=20
> I think that you should set the non-atomic flag and wake up the workqueue=
 or
> so from interrupt handler in this case. Call snd_pcm_period_elapsed() fro=
m the
> workqueue not the interrupt handler context.

Yeah, that was my first guess too. However, the DMA driver uses some
kind of generic helpers using a tasklet, so getting rid of it would take
some work and would very likely not be eligible for stable.

Maxime

--d62deidd5dansznh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5GBwQAKCRDj7w1vZxhR
xTCUAQDTmZkZWcff1PLx6AGpuQLAYMsZuMdLn9JoU1UyOhjCaAEAgN02qADXy1D7
SVTe4zN+/PYjg8cdc9fRz8yI1Udj8ws=
=n3lj
-----END PGP SIGNATURE-----

--d62deidd5dansznh--
