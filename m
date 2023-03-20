Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A06C2355
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 22:02:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BCB01E9;
	Mon, 20 Mar 2023 22:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BCB01E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679346134;
	bh=u3MqWhlNO9Ez1oFr9MAB0V4YaP3aY5B7Rle7IvtQ/h0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zh7DGkcxvjRssGmlJ64ZiSM8Mf6kQbyHtRcMQGgKhr32DzPQmqHtf6B/v7+y5aYKy
	 NaiIir1INbCZxViJn8CDdOFluzh+QCz5vz+gEDpTQPvLtDgz+PhpHUnGMqG+bd3Siz
	 S+/Prff9BckoJ5RiddFEwhme+ZHwC/7ELnSjVqnI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8235FF8027B;
	Mon, 20 Mar 2023 22:01:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCBE6F802E8; Mon, 20 Mar 2023 22:01:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBCB4F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 22:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBCB4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XL6OBdBy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 30157B810D6;
	Mon, 20 Mar 2023 21:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842A5C433EF;
	Mon, 20 Mar 2023 21:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679346076;
	bh=u3MqWhlNO9Ez1oFr9MAB0V4YaP3aY5B7Rle7IvtQ/h0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XL6OBdByFzSN/Jbjx0IDvRNV1JHope619zvo7lq6xNy4Sq6SZtNZwvsy5YFG+dWxY
	 WXEY8wdUWnv1wKXDHA0efPGenPHaSgnim9X8Uy0mx21Zalaaq8Oqy696EXPl9Vn3HH
	 /WmEmvvAjBv/9Ygg+CnDqX+f9mdPEKEvS8w3zeXsCJgl/3LouKTHB5TD37tztkCqsq
	 H7YvJVDxoulwcpB8Gcdkib+WaR/lLr942LHugV8ZEmmyE1LafhTvmdf0PEAQ/0/fyd
	 IISmlWmPtCEjuYceZ5Nj1bQMluPWa+jpirAT9QLKT4GPfTaR35B0CGvuAa8WNJ2SLj
	 JQG3Z1Gk1vEhg==
Date: Mon, 20 Mar 2023 21:01:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH 4/4] ASoC: amd: acp: Improve support for speaker power
 events
Message-ID: <0989fc51-fee7-4558-ba2c-084cc4fb6833@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-5-posteuca@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gK7rshqe2sdB/wQi"
Content-Disposition: inline
In-Reply-To: <20230320203519.20137-5-posteuca@mutex.one>
X-Cookie: Keep away from fire or flame.
Message-ID-Hash: LUOUVAAACHN6WTAJ3DYKA46WZNH6HJ5P
X-Message-ID-Hash: LUOUVAAACHN6WTAJ3DYKA46WZNH6HJ5P
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUOUVAAACHN6WTAJ3DYKA46WZNH6HJ5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--gK7rshqe2sdB/wQi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 20, 2023 at 10:35:19PM +0200, Marian Postevca wrote:
> In order to reduce the audible pops when speaker or headphones
> are activated or disabled we need to delay the switching of the
> GPIOs.

The usual mechanism for doing this is with the standard kernel delay
functions.  Why not use them in the DAPM event?

> We need to also disable/enable the speaker/headphones GPIOs when
> the audio stream is stopped/started. To avoid race conditions
> between the speaker power event callback and the trigger callback
> we use a ring buffer to save the events that we need to process
> in the delayed work callback.

Why is this required?  DAPM is integrated with stream start and stop,
and there's a mute callback to mask any noise played back from the SoC
while it stops and starts without requiring all this complexity.  If
there is any audible noise then why would it only affect the speaker?

> +static int acp3x_es83xx_trigger(struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_card *card = rtd->card;
> +	struct acp3x_es83xx_private *priv = get_mach_priv(card);
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +		if (substream->stream == 0) {
> +			dev_dbg(priv->codec_dev, "trigger start/release/resume, activating GPIOs\n");
> +			mutex_lock(&priv->rb_lock);

Triggers run in atomic context, you can't use mutexes in atomic context.
lockdep should tell you this.

--gK7rshqe2sdB/wQi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQYyZcACgkQJNaLcl1U
h9DkaQf+OTpwoJCS9rupSqOFbQKX/TWXlrvy/kIF0A80++s1yYuhU/1GjGj8oGE/
nqWgL6q2s0QHMENex4/EzSEL+OfQ++ibKPDOnILjgoNBmUP16Vmwz+bv2H/2Sruk
L0CmSPokXA7y31gZ6TgD3bW+ixPIE5NEE5YxsQ+Dm1pGj5xhXHyKvm9O9AjqzSPk
ltInh6wqRtlMTNOnGxNKpYGjLX20wKE5qZu1Kgih47iRUrvRqAozfusMd+cqBdo9
+ss1lnJyU9SQcq4PdD1YLZACjIaWnLotAPOjerFsjzEJvHTvtdxHGO2z+RdZfXz/
Snlzbh9qHUrhFJxJLbgFlyXkV4gIHw==
=lTjH
-----END PGP SIGNATURE-----

--gK7rshqe2sdB/wQi--
