Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 874AA6C6E6C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 18:08:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 272A1ECC;
	Thu, 23 Mar 2023 18:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 272A1ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679591336;
	bh=Mnq81XCGcegs74LRsDuIx4dZTAsSFp8XLS29lvLFKOY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ei3rhjynFNEOhqE9HRMz6q49B0vZ6evWgdPOFmVcM9w5Sqi6SHYmFA+5FxAExXARY
	 jbi1I+GHxgQSgeS9r2WPVqPvgUF6AkEJeHpMcYrGjDLSCRpeVwhwjEZdK6IA5khf4s
	 gG2PhNBuVRNgBAUO0idquYXjDSKLLGJnHmuMYZKo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A12F8027B;
	Thu, 23 Mar 2023 18:08:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EDE1F802E8; Thu, 23 Mar 2023 18:08:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27EF5F800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 18:07:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27EF5F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pXc6esDa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CB26EB821E6;
	Thu, 23 Mar 2023 17:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD13C433EF;
	Thu, 23 Mar 2023 17:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679591275;
	bh=Mnq81XCGcegs74LRsDuIx4dZTAsSFp8XLS29lvLFKOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXc6esDa/tcLM4IUZDV0IWI8IFMvBD6gdFyIaWPdrl31D1IRew8qbmnPs92hiJQTQ
	 dDlfVZ+i5gYGDMxhnqVfwwhCosAKWAMHdYNctzKycS8XFMulVd9eTvGVW04NKNOJZ4
	 JnERdDInNUWAewoGaSjTUONI3I4aTE8hYO93NDUVfh5W8BFRlqJX5PufKbdGrWSMEJ
	 4OF3M7xaLI9/W9gWQFhmzfCdf2MMuDgrXb0OZE8lxbwjL1IrgbF7jBEo20xz0sz7aX
	 lu/oEzThfjAwQcSHeu9ALK3LFnPm/3+di7KagLlVoJUUbeSAnEe8CDOEsgZFJ/vONA
	 rwFv9nDcYc6OA==
Date: Thu, 23 Mar 2023 17:07:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct
 sequence
Message-ID: <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
 <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J/cCEY6usy6hBul2"
Content-Disposition: inline
In-Reply-To: <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
X-Cookie: A lie in time saves nine.
Message-ID-Hash: 4CFSOQDXNTHN273FZ6S3DUMCAWGGRK2M
X-Message-ID-Hash: 4CFSOQDXNTHN273FZ6S3DUMCAWGGRK2M
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, johan+linaro@kernel.org, steev@kali.org,
 dmitry.baryshkov@linaro.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CFSOQDXNTHN273FZ6S3DUMCAWGGRK2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--J/cCEY6usy6hBul2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 23, 2023 at 04:44:02PM +0000, Srinivas Kandagatla wrote:
> In the current setup the PA is left unmuted even when the
> Soundwire ports are not started streaming. This can lead to click
> and pop sounds during start.
> There is a same issue in the reverse order where in the PA is
> left unmute even after the data stream is stopped, the time
> between data stream stopping and port closing is long enough
> to accumulate DC on the line resulting in Click/Pop noise
> during end of stream.

Wow, that hardware sounds *super* fragile.

> Moving the mute/unmute to trigger stop/start respectively seems to
> help a lot with this Click/Pop issues reported on this Codec.

> +static int wsa883x_trigger(struct snd_pcm_substream *s, int cmd,
> +			   struct snd_soc_dai *dai)
> +{
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		wsa883x_digital_mute(dai, false, 0);
> +		break;

>  static const struct snd_soc_dai_ops wsa883x_dai_ops = {
> +	.startup = wsa883x_startup,
>  	.hw_params = wsa883x_hw_params,
>  	.hw_free = wsa883x_hw_free,
> -	.mute_stream = wsa883x_digital_mute,
> +	.trigger = wsa883x_trigger,

The trigger is run in atomic context, can you really write safely to a
SoundWire device there?

This feels like we should be doing it at the framework level, either
tightening up where the mute happens in general or having some option
that devices can select if they really need it.

--J/cCEY6usy6hBul2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQch2QACgkQJNaLcl1U
h9CdLAf/V22IjvGkc6ep2k+xNGFGZdI59ZoRgE4Sqa7d9kEiMBjiMx9SSCz/LJnI
knGwmxnaSzXxhHXelAWPr9dis09vqeciiuxerX4dkPjOB5UF5TwFPTWOpDRICuKs
XaETlp285PZ/v4ew94q8wAEGEafARsTo52P2qjzLDKvAZVW9uOfbxwL36vqa/ZZW
WHrvSJItQdagVjYdHKVyrLqvU7PrHCkqg58OmQmv6JIpXRlSg2+yTHCGmZJRKKYE
SNZOMPB0wZfJvcRrhEI5R4ia8X5SBjRg98IgYd/kG19bsSye13usKxZuIGgtZgXW
2eDN0wDoFyF296QftPJpLxB1jFyLhw==
=yGjx
-----END PGP SIGNATURE-----

--J/cCEY6usy6hBul2--
