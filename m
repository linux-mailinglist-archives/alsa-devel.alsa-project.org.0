Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D8D545210
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 18:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDFC91AE8;
	Thu,  9 Jun 2022 18:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDFC91AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654792616;
	bh=nLV0GvHy/KQCKd/BLxkCqqI+MIgBK4mD0qJiit652bw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eIvSyUtrcpw1OKkgp0YlTcb+JwfIP3mnjNVVuaBfA8KkBxWWz2oxmgtp3T4zrdY71
	 CNBsQ0ugRYq0s9beRON3dLpaXgsEqOOmQMTU8RtEC7W+ygAGYGfjDdsKyLbSIdK6hZ
	 DNGH+IBWRfoeXnpS8kCY5Zt12b8BMoQQ00+8GbD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30BA8F80240;
	Thu,  9 Jun 2022 18:35:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E379F801F5; Thu,  9 Jun 2022 18:35:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_10,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 324BFF80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 18:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 324BFF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F0DX+M6G"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 15691B82E71;
 Thu,  9 Jun 2022 16:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AC1C34114;
 Thu,  9 Jun 2022 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654792550;
 bh=nLV0GvHy/KQCKd/BLxkCqqI+MIgBK4mD0qJiit652bw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F0DX+M6GHhaVTxSNRfrenUrPcrKyVKIyaxOc8mh6FV1QFP33FNxx5J4Wp2izWBWbA
 QbQJ/fmKfazZgJYXTg4okVDZgX3qv5eglx4DLyGB18ouro5GwCkLbvCetMQea5n9vZ
 rYlUfxyxZNJs/gzMISsCVmBin/qnqZ0VsiO/7v5VrHvoI6X44TtmqdoCVQKIaF/lVl
 bS16JFaULKyFIM0lgk9voFtJoDde1zrujgymcYrbZqwP+IwD0KspgTQD+jPU+0k8/L
 RwQLz0cmmT9kzvNSnFAKWtq0PJLKZUnlecE0yQniAqzEcQZePRNachnrcVRZPoDxrD
 JtFRd0+FtAD2w==
Date: Thu, 9 Jun 2022 17:35:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
Message-ID: <YqIhYPBpVcvz9iLQ@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
 <YqHylN3xba9XFrF8@sirena.org.uk>
 <0E611F13-96E3-41FD-9550-F900B2EFB00A@cutebit.org>
 <YqILv21K+tZ00Qhx@sirena.org.uk>
 <2A0422B8-8367-457E-A146-730F7C3DE66B@cutebit.org>
 <YqIWtzphzVGmbIOe@sirena.org.uk>
 <4DA6EE04-D23B-437B-8FBA-9223EAA71219@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8PA9aIQYrjMhOXsy"
Content-Disposition: inline
In-Reply-To: <4DA6EE04-D23B-437B-8FBA-9223EAA71219@cutebit.org>
X-Cookie: Space is limited.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--8PA9aIQYrjMhOXsy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 06:19:37PM +0200, Martin Povi=C5=A1er wrote:
> > On 9. 6. 2022, at 17:50, Mark Brown <broonie@kernel.org> wrote:

> > Can you say anything more about the use case?

> I can restate: The alleged use case is running userspace without sound
> server, but having playback switch transparently between speakers and
> headphones even mid-stream based on jack detection.

Sure, but why?

> > No, that works perfectly fine - you can enable or disable pins depending
> > on the jack state.

> Ah, I peeked into soc-jack.c. What about this then: If I understand what
> pins represent, they would be at the remote end of the DAPM paths. So if
> for the speakers I add something like

>    Headphones Codec Out =E2=80=94> Jack pin
>=20
>                        +--> Always-on pin
>                        |
>    Speaker Amp Out -> Mux
>                        |
>                        +--> Jack inverted pin

> and let userspace control the mux, it would in effect support the same
> use cases as what I attempted in the code so far. Sounds somewhat right?

Yes, that should DTRT.  If the mux is working properly with DAPM (not
sure it does with DPCM but ICBW) then you shouldn't even need the jack
integration since the mux would disconnect the unused output when it
gets switched.

--8PA9aIQYrjMhOXsy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKiIWAACgkQJNaLcl1U
h9CPXQf/ZMQGcAD7+pTSBWR4+WU2VepcoHhnVLOflAgyJQjnRir5E8L3PN0OaI/D
dvAR3rvl9pttuZZCiK7Dr7xjWyep9qh3Wbh0Tv4CcR7fb88qYgSiZRzvDVDql24W
JYQusypBqzGCPadH2+XUnrI7jKGaagm46KTxNdnEEnnMEUosu+/bhnoFnOi8tBvP
ANAengNgcpTfFvbakGrHg7LL6EYTR9gsjNpPnd8nnhoMcJGylTbYwcWO2oSPJccF
Eu+W+HN2OGE3j3j5tW5jJ4fhOaXQ2b7R8ngc8VWHncgUKKFgtlXt5NF1PZ1x0XUh
yTN7VXtNkQRolvvX+GrjQk9uN9N08g==
=tdB1
-----END PGP SIGNATURE-----

--8PA9aIQYrjMhOXsy--
