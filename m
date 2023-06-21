Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C7739100
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 22:47:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9792209;
	Wed, 21 Jun 2023 22:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9792209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687380437;
	bh=ripGwAImlGjHyuVMQp4ULj5BV9Mh3c5XiZNw2xG5rgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DAb96/8HrUkiqijYvW9NZJ1537E27z9ngyOudTEg04hEt6UsPAs24C/vPh71Hjsjt
	 MLzpC58bfmiZlZzpr7w2U1LqGiH8fS5SZepDK8DGCWfytmjhZdg7F5Iys0UmhUSNkB
	 ErAn7T3i7tUEG/dnl8BQhy5dYKeVGSoQMn0bajWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20E7AF80141; Wed, 21 Jun 2023 22:46:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC6E0F80132;
	Wed, 21 Jun 2023 22:46:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26423F80141; Wed, 21 Jun 2023 22:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A11E8F80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 22:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A11E8F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aVBcOHwh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9164A6152D;
	Wed, 21 Jun 2023 20:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774D8C433C0;
	Wed, 21 Jun 2023 20:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687380371;
	bh=ripGwAImlGjHyuVMQp4ULj5BV9Mh3c5XiZNw2xG5rgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aVBcOHwhn0CyYV41IepkWHkwOLDC90bWDSETmIEgsSmKVFfLrujsPj+2TCVUCZL3I
	 fCCY6O630u2/2UT+FmlYwb1mRzUIBIarCqsh+WyAfJgc93kgMM3dWHiwl3eUxRs/Ex
	 jeqyuK8j7PbhySN0qjL+ymyq2h6lXjrf8NCgh+upNWbLZNEfoyQkwKZd4HLPkoD+cF
	 jnM17i98t4ZD3caWn/A4HimWCt5MUyjXkljMZnbgcJeogpqa4ZCji4yDU9mc5l6sEX
	 3yVgsVW7L9CkuBnMjEU5063vEhc3WV9UcMW9do9/QTQ+N9zX858C0X79YKQeB1l/j8
	 r9D2BU96+X0bw==
Date: Wed, 21 Jun 2023 21:46:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ASoC: codecs: max98090: Allow dsp_a mode
Message-ID: <b83bf5c9-5998-4683-8f28-1eff432742ed@sirena.org.uk>
References: <20230621115328.156457-1-fido_max@inbox.ru>
 <3805dc65-113f-453a-90a9-2ae6204004ba@sirena.org.uk>
 <e6be75f6-054f-6c3b-00b4-a5e112bcefc3@inbox.ru>
 <b763d08e-f751-480c-96b6-339a53856768@sirena.org.uk>
 <ed9606a4-4be6-7403-6e32-1c045ac0bdf6@inbox.ru>
 <adbe1b82-9478-4462-ace9-968723a6ce3f@sirena.org.uk>
 <0ada8334-4006-438f-8461-5c4c8e13f65d@inbox.ru>
 <c054b036-d5fd-482b-adc4-913edbcd007c@sirena.org.uk>
 <08fb24b9-ab7d-da27-5ab7-e1d3270c8b43@inbox.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xFMqdEWfE/HZ3Aek"
Content-Disposition: inline
In-Reply-To: <08fb24b9-ab7d-da27-5ab7-e1d3270c8b43@inbox.ru>
X-Cookie: When among apes, one must play the ape.
Message-ID-Hash: VBN7VJJHDC6CDTE2DLW7I2EBZV5IKYMY
X-Message-ID-Hash: VBN7VJJHDC6CDTE2DLW7I2EBZV5IKYMY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBN7VJJHDC6CDTE2DLW7I2EBZV5IKYMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--xFMqdEWfE/HZ3Aek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2023 at 10:57:18PM +0300, Maxim Kochetkov wrote:
> On 21.06.2023 17:35, Mark Brown wrote:

> > > > > I'm saying there should be some interlock between these two settings, if
> > > > > nothing else setting DSP A mode should force TDM mode with automatically
> > > > > configured slot sizes.

> Ok. How about that:
> ---
>  sound/soc/codecs/max98090.c | 52 ++++++++++++++++++++-----------------
>  sound/soc/codecs/max98090.h |  2 ++
>  2 files changed, 30 insertions(+), 24 deletions(-)

That looks plausible, yes.

I do note that the driver ignores tdm_width (and the entire TDM
configuration) when configuring BCLK, I guess it only works in clock
consumer mode for TDM?  If that's the case there should really be some
validation, and there should probably be a check for slot width being 16
since that looks like the only thing supported.  Those were already
broken though.

--xFMqdEWfE/HZ3Aek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSTYYwACgkQJNaLcl1U
h9Cdegf+M3QEGRYrVk+Y7+QiD1MfHGt5GVDIMEyPuTUJDRGem8nC1umYM/jbF1VN
Y35F5/Wc6UeD+VmMuvNKqwzX2xrB6NAvRdVtFXcC1L9TSldc55IT1pYT/+XFZe3Q
YT0OWIObLCAOQHUnKmzAXQDbBnInswna9MFIi530D8VxL0D+ovILaNJhKWINjRGe
gsMwcH/0zfKFGPsPkG+oeZWUADq2Pnio6YuEuhXgRrTz44mGGO2F2NQJuF1bsw0t
kHqE3yFFj1sAz6CT0C2VBLCmEdZa7GJJJIih62gaKgPLi9IOyYLYRSq8WeekAjHB
RU64YCU1LaHwwtpU4ZDKmwuEuejrEg==
=sbbb
-----END PGP SIGNATURE-----

--xFMqdEWfE/HZ3Aek--
