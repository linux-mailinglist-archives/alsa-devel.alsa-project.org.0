Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD004752BC5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 22:40:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ACEC86F;
	Thu, 13 Jul 2023 22:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ACEC86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689280837;
	bh=bcGCwRJVwrgQUmowpebv9sF2MjE/I2LXNBy02Hig+sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=InJI2SsO9B1yPpwRxqO0zheTl3BrSYnDHz4Eop2UePl2KI8zAnOTcG7SmsZ8BNka/
	 t58XpW8dJ910msVAAT+kdz5z0QWu92oR3QDcinAo+bZm24s3GPtV2AUABtv3DAqKL1
	 pKBiLtWWaPThmwwvtmNn5k5s3H0LyVTe2Xgny3Dg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8DEAF8024E; Thu, 13 Jul 2023 22:39:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E0DF80236;
	Thu, 13 Jul 2023 22:39:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E6A3F80249; Thu, 13 Jul 2023 22:39:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9080AF80153
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 22:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9080AF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rcfugwaV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6715C61B39;
	Thu, 13 Jul 2023 20:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC1AC433C8;
	Thu, 13 Jul 2023 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689280770;
	bh=bcGCwRJVwrgQUmowpebv9sF2MjE/I2LXNBy02Hig+sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcfugwaVYPELK2MrNRSx1ol4j53EGpoLc200cGY57A6R/HfhrpbktcU4PxE6Iqtu+
	 sQw6kTkRNBWbwj9j/jbsiR5rWTOUuMBeD9kNScMy7QIuyFniTsw+CWYdpqcqe9/NcF
	 RDGDp04aRybvBEiSrAxAx+GETRHGBYlF1UXRBX6mTteq61Qx3d5WnolNFNs0ivtZOS
	 7Y68fMqEdQt08f8+NJDJwuTCFzwgiAYVhIW4WK1UAZK537A/gKhXRU8OHTw8yWC2bg
	 vDvKkwxhvrYw5X+cIdpHKkhUWG8un420SxdISXhX12RwOYDFcAXHcp7MbQdJ5BK3h6
	 Knpqv23eRuZaw==
Date: Thu, 13 Jul 2023 21:39:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: =?iso-8859-1?B?Ik7tY29sYXMgRi4gUi4gQS4i?= Prado <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shuah Khan <shuah@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/alsa: pcm-test: Decrease stream duration
 from 4 to 2 seconds
Message-ID: <66c81c16-737d-4ec6-b590-a6b1070b991b@sirena.org.uk>
References: <443f697b-fecf-6e8e-0b76-65257aff7da8@perex.cz>
 <9069ad0c-d166-4620-a3de-a36ab233cab0@sirena.org.uk>
 <5c2d5213-5299-44f1-9611-26002c8a5d3a@notapiano>
 <87352krcz5.wl-tiwai@suse.de>
 <f5cab2c2-1638-4d19-aff3-d46ed34b857e@sirena.org.uk>
 <87wmzwptu0.wl-tiwai@suse.de>
 <06b8bfde-e4f1-48ea-aa3e-35d2fe5df046@sirena.org.uk>
 <87wmz8i746.wl-tiwai@suse.de>
 <87ef1544-c1aa-4cce-82f2-60c6f1c2b1c8@sirena.org.uk>
 <87ilaofb9s.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rajlGC2kTISHyIRr"
Content-Disposition: inline
In-Reply-To: <87ilaofb9s.wl-tiwai@suse.de>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
Message-ID-Hash: IHPOJ5O54JHK3YFB4O5MQABFPPQTSGZF
X-Message-ID-Hash: IHPOJ5O54JHK3YFB4O5MQABFPPQTSGZF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHPOJ5O54JHK3YFB4O5MQABFPPQTSGZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rajlGC2kTISHyIRr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 13, 2023 at 10:47:43AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > # default.time3.0.0.0.PLAYBACK - 44.1kHz stereo large periods
> > # default.time3.0.0.0.PLAYBACK hw_params.RW_INTERLEAVED.S16_LE.44100.2.16383.131064 sw_params.131064
> > not ok 10 default.time3.0.0.0.PLAYBACK
> > # time mismatch: expected 2000ms got 2229

> > reliably (the actual time drifts by a few ms).  The other boards I've
> > got coverage of seem fine, and I didn't check any broader CI yet.

> Interesting.  With the current patch, we rather extended the margin in
> proportion; formerly 4 sec +/- 0.1s, now 2 sec +/- 0.1s.  And it
> exceeded out of sudden.

Right.

> I guess this rather caught a problem of the driver itself.

Well, there's doubtless something driver/hardware related going on but
I'm not sure if it's a problem there or not.  The results from the 4s
runtime were:

# default.time3.0.0.0.PLAYBACK - 44.1kHz stereo large periods
# default.time3.0.0.0.PLAYBACK hw_params.RW_INTERLEAVED.S16_LE.44100.2.16383.131064 sw_params.131064
ok 10 default.time3.0.0.0.PLAYBACK

so the same buffer sizes and so on, and the period size is only 10ms
unless I miscalculated which should be quite a long way off from the
100ms of margin we give ourselves.  It does seem a little suspect that
it's the large periods test that's falling over though.

--rajlGC2kTISHyIRr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSwYPwACgkQJNaLcl1U
h9AAjAf9G1zzfng/beUy+UkABu6GsH4CgzFwfSum/wi7FgrnLo8yNYSH8M5RU/qf
dxoSuJF2Jf7glSBeBxFI+1lBUoEI0YmTuYez1QFQcdaOybZ1R0SgfrPFZ9sj6+14
vdSgMfk98QkgcnU0V0HHnUrSNkXP6Nd2y9hkukv6tTzEsICWnBLC8w4WS3qu92fQ
Z65B7dti1tOCTydBPjirhzybNy8qm3xOgw+tdIBPvEM1HMgSSYcZQIm3r2Mk3+EK
fEjhT0ol+azg2AvW/V78L/JaaeapItkoWfvB8VtI3IWFt1JjbjL0l3PoXQR4ZNGy
Pc4j3nYqATnS6J9OsLLgMBWzYKt6xg==
=9JRd
-----END PGP SIGNATURE-----

--rajlGC2kTISHyIRr--
