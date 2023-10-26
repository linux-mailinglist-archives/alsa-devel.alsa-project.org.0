Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC767D8345
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 15:06:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 961DD827;
	Thu, 26 Oct 2023 15:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 961DD827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698325594;
	bh=cNusDpyZxnvyLEqSRhYFk1jLbzQXc/rViNGZhUcC+Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SxVFRvodUjNC1nPcGX4XE+kkXPZlxNB++VhDGeTKwhrpZlAGViUmxnJngPZ3/HY2K
	 ZemiFZRsaeQYhxgfsV0Tp1mY1ELmx/ZrndY89SK2CcsMqDTFTK9mI5jr5MpgFk9PzS
	 rgivVsHA2i0mte82AB2WwjfdK6siJsK4aaNE2030=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B759F80557; Thu, 26 Oct 2023 15:05:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C93F1F80165;
	Thu, 26 Oct 2023 15:05:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 655F2F8019B; Thu, 26 Oct 2023 15:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8532F80152
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 15:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8532F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ni2zlJ6n
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B4E46345A;
	Thu, 26 Oct 2023 13:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DCCC433C7;
	Thu, 26 Oct 2023 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698325530;
	bh=cNusDpyZxnvyLEqSRhYFk1jLbzQXc/rViNGZhUcC+Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ni2zlJ6nxjzV+09ncyfuuZhW0x88pV07KMAWYut+At+GVo7aJMuDQYHhOn8iP2z3b
	 X9mn4oNGuCevgbkh4S6kdojtLKRNCQkvW5JlRJvbSlMe9HO1sdLy5jdSdCugZryuwu
	 b4qUWA8hYzMgug5LLhM78AZ6MUPiEcTzJ8KOU+FebQFch2JbYm+CvpUH4is/kykIBq
	 zCglek5l/ECJvHKn7C/pjUc63Gobe+ghT+BpGaEqM2/wzJ/VKAjdDViZMRq4a+8pX5
	 euNUheIkyxc8JZ2NgjVClP8ooV+FDbvA2LXa06yceghcXSTMjKaDg7Q1eSpWgH2D8I
	 fh3V6L6RdR76g==
Date: Thu, 26 Oct 2023 14:05:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	johan+linaro@kernel.org, steev@kali.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct
 sequence
Message-ID: <9c622323-6b94-4622-840f-5f126942ae96@sirena.org.uk>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
 <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
 <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
 <2a0aabf5-41a3-cc07-3203-9b0bca6b71aa@linaro.org>
 <ZTjKWHAAfSYfc5px@hovoldconsulting.com>
 <6df45f92-5fe6-4b44-af04-c528d540ac06@sirena.org.uk>
 <ZTkNcHAzgnL5xpAO@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S8PzKVa+OunEe76B"
Content-Disposition: inline
In-Reply-To: <ZTkNcHAzgnL5xpAO@hovoldconsulting.com>
X-Cookie: I'm also against BODY-SURFING!!
Message-ID-Hash: XCTAC4RZMNIZLP2TBX5GQYFIHBXHI5E5
X-Message-ID-Hash: XCTAC4RZMNIZLP2TBX5GQYFIHBXHI5E5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XCTAC4RZMNIZLP2TBX5GQYFIHBXHI5E5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--S8PzKVa+OunEe76B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 25, 2023 at 02:43:28PM +0200, Johan Hovold wrote:
> On Wed, Oct 25, 2023 at 01:36:14PM +0100, Mark Brown wrote:
> > On Wed, Oct 25, 2023 at 09:57:12AM +0200, Johan Hovold wrote:

> > > I understand Srini has looked at this but has not yet been able to come
> > > up with a generic implementation. Would it be possible to merge the two
> > > codec fixes as an interim workaround for 6.7?

> > You're talking about two fixes here but this is a 4 patch series...

> Yes, sorry, I should have been more clear. I was talking about the codec
> fixes so that's patch 3 and 4.

> I believe the first two have already been applied.

So, having gone and fished the series out of lore to look at what the
patches are I'm pretty surprised here, it's been about six months since
the original discussion and I'd not have expected this to be such a
difficult thing to do, or at least that any issues would have been
flagged up by now.  What are the issues that have been encountered here?

--S8PzKVa+OunEe76B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU6ZBQACgkQJNaLcl1U
h9CoWwf/czxazVwv2xOxm4GAYE1nhKBy3faZlKBN3zJKj7ZEcDHorF/p0Ob+LAIY
r64OiYQnPRzuZ93XOK9aos+ApK9V/RyVG9oX1Txq+Lyf0p0MseB2VuGadmpZx+19
rBD2eG61ZFh0TCcLCNSe52bF4pb7NOQLKolFnb29wVkFyoNJhBq82uJko1Gr5uMc
q+F/eh9pQNKLrtF5XNBS9rib4+M2tMYx/TcoB66Fn0pYDaAdoKoYfR+E701q7CbJ
JiQY/nT9i2MOHnGXBCM2SR7FFvTBJdvGKac07khIQN8l1HBnbK4RF2xEhZq59D6a
wbFNvuIebxfncim9pbFNF4bCSZABuw==
=tHu5
-----END PGP SIGNATURE-----

--S8PzKVa+OunEe76B--
