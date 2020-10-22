Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5CC2961C9
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 17:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9578117E9;
	Thu, 22 Oct 2020 17:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9578117E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603381272;
	bh=O2MmfN7kTe6W8D5e94p3K5RgQio8BjtzNZJ0XJsVzmA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IyAqYgOl0uFSTVqVurReGaMg01ELZi4b402Uiplg1uhBZdjzVFfTFS1wb/HADnLV2
	 KaX1q1JUd9GhZNjRfWBY6S6UvT60RlLTjZj1giYWrIe4gUAWuj/mBQvAcKUHYdphqN
	 uuVZkt3/g8p+3ZvlaGyFWsxH+cMRuyXpn8RjPQfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05186F804AA;
	Thu, 22 Oct 2020 17:39:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AFBEF804A9; Thu, 22 Oct 2020 17:39:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7B56F800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 17:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7B56F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="jtniElwV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bkoeoELQ"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 418D75C010A;
 Thu, 22 Oct 2020 11:39:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 22 Oct 2020 11:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=1zB38VSUKoWvgoR7ez4MM2+MlQl
 kPY5uetQo112xVEg=; b=jtniElwVgYBxCenzh0Y0ijI9E94wYGg0mLyyCtYaDQy
 81aPUGAE75UwYrLblrM6HKGN4qiSfxTU4Gm1MCdKQj85g7uHhSYPjqKJVS26IrPk
 1VDLd3VDZog/v7UQT7I8O5wjzLwnaZw8adJMQ7XWuRPfe9zg3T0iXkfROmfz6Cod
 5vdmLpsjEu6OU/mZfHSEIH6U9pvASlgPFJmk/PJhQ8yTvhyFZQlE8rIP20sGRvmQ
 AtCZZEj8RkQsoASwJ/avyUWoymxhUuh38xhIYjMFm4NU5i+r22hlfm7e079AJgYx
 0WhBPk2C7LEwQvikp/f438g3JvIODCUPETOGgKFfdOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1zB38V
 SUKoWvgoR7ez4MM2+MlQlkPY5uetQo112xVEg=; b=bkoeoELQ49bxQf68PUkzll
 ELIiuzcJR5Wq20oRWMx3T/nrF3REJdvTUbD6RRtIvreww3wuG2e9i4Arg5BX7SbW
 T/BZFDltB+h9HWwhN4FxeYjqKBDRhBIGnxMoSeNMVNvb8sw5JZg5wglN/oRZ/Jkn
 dnmOzjqJ8TxYBWXwdg8e7g5BVuO7/GN039dt8QjCpuN59qpG1MXzC8/H/ai6N61a
 22DLuqTjlocuuVAta5fB+x3TfF9KfKSwGmiev5ZztRW3rm5hpovEE5hrnw/FHGcG
 H4bfRspVoSXsGwFxnX5GueEciJq3RegC06VAgN1N77wVW+vTU+3ktbNq0y+f1kxA
 ==
X-ME-Sender: <xms:sqeRXzOgUIKbPkqJqP2Tf3YABDd9A0ma6nX1Tj0JaW2ugtfs8fBXjA>
 <xme:sqeRX98jPB0uZGvqnQNaOVx3rRAFlkf9JkuvaPhrfdtHf6dZcO3sU_7p7n76DBFNG
 6YCYUORCm0b7nUaeWE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeekgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:s6eRXyT4yeWC8rH2L0Lm_qlUYXC3o0_4G2gFhznAooO8b2FqcZnFTQ>
 <xmx:s6eRX3trAooMZg1c2r9ZxNc-2kABfygNN2SD_Fe1a3oonFDao5Xc1A>
 <xmx:s6eRX7cJQOt9bSbKPqs8UIKVvwJWKphqe6dJFeDHL7cjiqU0g6I-MA>
 <xmx:tKeRXzR4Qhr6OWc09tTmlgmEaPThKQ5c_gLiV9XHdpXljQhWiy_IwA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B20853280068;
 Thu, 22 Oct 2020 11:39:30 -0400 (EDT)
Date: Thu, 22 Oct 2020 17:39:29 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Context expectations in ALSA
Message-ID: <20201022153929.g4q6eq5paom73t5h@gilmour.lan>
References: <20201022095041.44jytaelnlako54w@gilmour.lan>
 <20201022135053.GB4826@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qou4qb6o4ose32tc"
Content-Disposition: inline
In-Reply-To: <20201022135053.GB4826@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
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


--qou4qb6o4ose32tc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark

On Thu, Oct 22, 2020 at 02:50:53PM +0100, Mark Brown wrote:
> On Thu, Oct 22, 2020 at 11:50:41AM +0200, Maxime Ripard wrote:
>=20
> > This is caused by the HDMI driver polling some status bit that reports
> > that the infoframes have been properly sent, and calling usleep_range
> > between each iteration[1], and that is done in our trigger callback that
> > seems to be run with a spinlock taken and the interrupt disabled
> > (snd_pcm_action_lock_irq) as part of snd_pcm_start_lock_irq. This is the
> > entire stack trace:
>=20
> That doesn't sound like something I would expect you do be doing in the
> trigger callback TBH - it feels like if this is something that could
> block then the setup should have been done during parameter
> configuration or something rather than in trigger.
>=20
> > It looks like the snd_soc_dai_link structure has a nonatomic flag that
> > seems to be made to address more or less that issue, taking a mutex
> > instead of a spinlock. However setting that flag results in another
> > lockdep issue, since the dmaengine controller doing the DMA transfer
> > would call snd_pcm_period_elapsed on completion, in a tasklet, this time
> > taking a mutex in an atomic context which is just as bad as the initial
> > issue. This is the stacktrace this time:
>=20
> Like Jaroslav says you could punt to a workqueue here.  I'd be more
> inclined to move the sleeping stuff out of the trigger operations but
> that'd avoid the issue too.  There are some drivers doing this already
> IIRC.
>=20
> > So, I'm not really sure what I'm supposed to do here. The drivers
> > involved don't appear to be doing anything extraordinary, but the issues
> > lockdep report are definitely valid too. What are the expectations in
> > terms of context from ALSA when running the callbacks, and how can we
> > fix it?
>=20
> To me having something in the trigger that needs waiting for is the bit
> that feels the most awkward fit here, trigger is supposed to run very
> quickly.

Indeed, other DRM devices seem to send the infoframes as part of
hw_params, and it solves our issue there too. I'll send a patch

Thanks for the suggestion!
Maxime


--qou4qb6o4ose32tc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5GnsQAKCRDj7w1vZxhR
xblHAP0fQlf65iR1se3fsAarud6ONFK7jZeqjn8t60IqTfVxAAEA411CHkGg28vK
ixPKLzGQtCpk5j/utVLuB/a45jkMCgY=
=glSS
-----END PGP SIGNATURE-----

--qou4qb6o4ose32tc--
