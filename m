Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0127D9D0A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 17:33:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4617EAE9;
	Fri, 27 Oct 2023 17:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4617EAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698420823;
	bh=aChtwQGdHEGlL/2vHSMUTmEjJHwKdxF69/sIZezXbkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=laCKz7Lmg8V0pYp4eN0uDoAILMDHOea/gO3akthCGcmYZX7n4YKnDn9CfX4rVRJw8
	 vb/aQY5Bu4bwcpKMq1+8IvUtLfFl8m88ORIng2VdifYlGowXvH42ud5Lc4zVCT+Bwn
	 51U3KmdVK5TvWOC/4QJtoziBotdPcOkJoKtYXPb0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F5FCF8014B; Fri, 27 Oct 2023 17:32:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D04AF80165;
	Fri, 27 Oct 2023 17:32:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9633DF8019B; Fri, 27 Oct 2023 17:32:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA78AF8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 17:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA78AF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M1aMFD/p
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1C6B7B80816;
	Fri, 27 Oct 2023 15:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4065C433CC;
	Fri, 27 Oct 2023 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698420764;
	bh=aChtwQGdHEGlL/2vHSMUTmEjJHwKdxF69/sIZezXbkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1aMFD/pecquhT5urGcllCPxNxNhhAJ+4z2/3M2sxxhBbVXvc7yJ9VmyhScgBJ7yX
	 7RWIP1Wf3E6EJrvlyBYkvT5cFH0l677Y5Uz89WoRLJlna37ukA7h786W7n4sIT28UW
	 TuX8Tg7tdBWbvizs8EWM0as6WJTl9RM99yD08BuvFg6TGpsFnYZ4et3B5nVSHmCBA0
	 mRiYmOxQNwKFvrbzpwMEWy1zTbGivYGTYo6OabXnxzUbnE1tR9ATX5xMq8u705BPUu
	 /b9lACQs1snP+ZThGBH3V5HbfO2S+D3GfSswdkEfQnDXrYvAt6SJd3cg+OpMJMP/6l
	 9a7imxoufexgA==
Date: Fri, 27 Oct 2023 16:32:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, johan@kernel.org,
	perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute
 stream during trigger.
Message-ID: <ZTvYFzwltTCMqUHY@finisterre.sirena.org.uk>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
 <54c44548-c2e4-466d-bfe4-b48db9e5d20c@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9XWll2GzhA2eHJ8H"
Content-Disposition: inline
In-Reply-To: <54c44548-c2e4-466d-bfe4-b48db9e5d20c@linux.intel.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: GHSE3UWA72Y4HPQVJEU66SRJ6TFFPE5A
X-Message-ID-Hash: GHSE3UWA72Y4HPQVJEU66SRJ6TFFPE5A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHSE3UWA72Y4HPQVJEU66SRJ6TFFPE5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9XWll2GzhA2eHJ8H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 02:00:13PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 10/27/2023 12:57 PM, Srinivas Kandagatla wrote:

> > Click/Pop Noise was a long pending issue with WSA Codecs which are prone
> > to accumlate DC when ports are active but without any data streams.
> > There are multiple places in the current setup, where this could happen
> > in both startup as well as shutdown path.

> Have you tried something like:
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index e40d583a1ce6..f02362cf95dc 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c

=2E..

> WSA883X_VBAT_ADC_COEF_F_1DIV2);
> +               snd_soc_component_write_field(component, WSA883X_DRE_CTL_=
1,
> +                                             WSA883X_DRE_GAIN_EN_MASK, 0=
);
>                 snd_soc_component_write_field(component, WSA883X_PA_FSM_C=
TL,

=2E..

> As it is one thing from wsa883x_digital_mute() which seems missing in
> SND_SOC_DAPM_PRE_PMD switch case, so it seems to leave GAIN always enable=
d?
>=20
> Anyway this seems like something that if possible should be fixed on codec
> driver side instead of introducing global flag?

If the issue is that the device misbehaves as soon as the incoming data
stream stops then we need to do something strictly before we do the
actual trigger operation which we don't currently have hooks for.  Even
if we run quickly after the trigger there's going to be a window where
there's no incoming audio and no mute.

--9XWll2GzhA2eHJ8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU72BcACgkQJNaLcl1U
h9BJdAf+MgNS4dzqiUaPAPLBuQUJ8Eds5JgTvgd3LKT+ci6/ihqIo1ohl8ioniwe
qDfG8kH2PGHNtVh6V0ZscNaO2Q3tH4CZThajaxH001HBk71wAFIUg+6vI9jt398v
gbg42Pvss2VLiDiapocyo9f84icai+r8rB6HKdVogHAuFwzyGL0OBjkF7bEPBleF
6FAY8tkbmGzcvj4/nN9iKnhkD4Sw4uGfGYQ/LPFv4I/62I+3NyIGsExKYDs/c9bP
k2rWh8EX/FngG+qXZxxvDjL/OOY5omvv6nTiHe+yWnga2028i2dT09KEdDkhiqm+
Ci1KBcmqgkk17tL/brBL14W5BxkOpA==
=vQG3
-----END PGP SIGNATURE-----

--9XWll2GzhA2eHJ8H--
