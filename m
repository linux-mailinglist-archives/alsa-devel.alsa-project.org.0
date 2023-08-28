Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D278B89A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 21:42:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10473203;
	Mon, 28 Aug 2023 21:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10473203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693251779;
	bh=zuRblMquL75h66BAHp2HzufNQ+pbQGVcWUOzMVV/uVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ml6zhhg6Ew0+FgB18aRL4f69Z9zgkKDYaIOHhvZx4f8K2m1NsahIGAteRML0dW1+A
	 aIPyKRo7WD+UJUnmIfLB1ze0Xfy6nKtbKqF3hYcyNeW+dN9z4a8s/B6Oxjm7HbkhiX
	 gLcAvOaKQAjSsCjDFPuTOsBYyztjql/t2Hz+m+DY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73DE3F80094; Mon, 28 Aug 2023 21:42:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CE49F80155;
	Mon, 28 Aug 2023 21:42:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1DE7F80158; Mon, 28 Aug 2023 21:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3226CF80074
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 21:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3226CF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qer4oeWv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81DE164884;
	Mon, 28 Aug 2023 19:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1FDC433C8;
	Mon, 28 Aug 2023 19:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693251560;
	bh=zuRblMquL75h66BAHp2HzufNQ+pbQGVcWUOzMVV/uVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qer4oeWvqVuAXXmGE3r0+p62B+xJcj23lHhzq0+ym3nKcS5maLgpFmoU0epY/FrLq
	 xgVlp/URtzJ1aXBVTPwfcRxplGetqo+QkSnNyjaUVZUzzNNEysJnTURkgxzBGgDB6R
	 M9HIi6OmFTo+pWKQhKAocJZl0hToRoAqOa5EKxml/k+IaIv5H47W1bAmpY3s0liyk9
	 evkW0Fe3PSGDG6LmRp3UtwLSbvSwH2RJdLFKBqb0y4nxCGoiDzP1SHPJQ1eYl6QEex
	 pcKwrfyscFxlXylo3mbINlGn9zyj6o3513Ve29J3to0rLqOfXp7BXxiA8qLAcLP2EK
	 hbC3NKLXfZOzg==
Date: Mon, 28 Aug 2023 20:39:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	RicardoRivera-Matosricardo.rivera-matos@cirrus.com
Subject: Re: [PATCH 4/7] ASoC: cs35l45: Analog PCM Volume and Amplifier Mode
 controls
Message-ID: <ZOz35ABAsLYROJ4c@finisterre.sirena.org.uk>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
 <20230828170525.335671-4-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RuSj6/CZAu0X82sy"
Content-Disposition: inline
In-Reply-To: <20230828170525.335671-4-vkarpovi@opensource.cirrus.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: S7VA5ELYCR7YBN6MNQSORREVVSR4AVQG
X-Message-ID-Hash: S7VA5ELYCR7YBN6MNQSORREVVSR4AVQG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7VA5ELYCR7YBN6MNQSORREVVSR4AVQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RuSj6/CZAu0X82sy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 28, 2023 at 12:05:22PM -0500, Vlad Karpovich wrote:

> +static int cs35l45_amplifier_mode_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{

> +	snd_soc_component_enable_pin_unlocked(component, "SPK");
> +	snd_soc_dapm_sync_unlocked(dapm);
> +	snd_soc_dapm_mutex_unlock(dapm);

> +	cs35l45->amplifier_mode = ucontrol->value.integer.value[0];

> +	return 0;
> +}

This should return 1 on change (I did see that there's some code which
generates notifications but it would still be better to flag changes
here, it makes review a lot easier).

--RuSj6/CZAu0X82sy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTs9+EACgkQJNaLcl1U
h9DzuwgAgwy2vcETGFOVFw/Ki8yb/HOhnBIy0TJB3UqAL1L+6WcQq+HwdayDRocu
wvKE+uqIfK8bgEhXkDMDCnoKucYrNI5CDY/UMjeihYPIKFLOKtTTh31X09OHbStd
O+h9NeP4pyIBvZV6NyrJVH54MMT/dF+XwAOQOhGllbexeZlMi5h9qA736o7ob0bl
YD9eVCVjAQdazTLbLxUwK2fNl/WH+jDch5MH1U2kZwxZ3BYRgZUolgWjUv2y3rgm
fMqUcmmouWcc/WEjvyhUqExQI/6Jy8r8qdskx3mAr5iih8hq9vEwRR7c41eRyEvE
yCE07xjrRi7XESt5SVu1JqWzODjDUQ==
=QHEm
-----END PGP SIGNATURE-----

--RuSj6/CZAu0X82sy--
