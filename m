Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2C259C013
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 15:05:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83C3516A5;
	Mon, 22 Aug 2022 15:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83C3516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661173531;
	bh=vIb4UZI/92cxyBbJg8AExe91iFXBczfLb+FceTDbGNg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nJLOXMoMcMTaFmycIOmV+LaKN0wsf//lHs80ytz/jZqupzLjl1boY3CYwmH6P90+L
	 xqSriH3hCgDitE4yVUPpyBNN/s1Elun1ub9AG3yX3yiQsCEYlUTPZ/PqgjX66p661I
	 Mo9qbgVl2uhOXwujKtMqDC6eJ9ujv2e0mavzcDyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE59CF8026D;
	Mon, 22 Aug 2022 15:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AE83F8026A; Mon, 22 Aug 2022 15:04:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C55BBF800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 15:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C55BBF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rmCuKh5f"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2474C61150;
 Mon, 22 Aug 2022 13:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1475C433D7;
 Mon, 22 Aug 2022 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661173464;
 bh=vIb4UZI/92cxyBbJg8AExe91iFXBczfLb+FceTDbGNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rmCuKh5fGisFQtbi/Y2IeMMO7GS/Jyd9g61b3drBtxAKDYmlBuHX5/ykHliH1t6vy
 1M2YTfhDjLbf+66FHG4jrSXDc0cExFBq3Bo1/iH41AWuhZSadr/PQL6agp7XdtubcG
 HHZSjkuuQcPYJMjJ5bxa/UMla+wHrMPwTB/wH6G3v9qsx4Xa7It0a02ATv2yadYdg8
 ZU/BUmynZaVHLGxID3koqT/+EHKoS0P7BXOA3TLCZumMw6C5GJ8Bl/TQu3w/GN2Eqf
 4Xrabqm2XRpPRtzhkgiXfg8u0ECGWofKugPWnDbTw0Wxuyo1fj8Niujle0tMMA5SiG
 D8PjbEfdwU6zA==
Date: Mon, 22 Aug 2022 14:04:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: dapm: Export new 'graph.dot' file in debugfs
Message-ID: <YwN+0yHSOSC2aD+J@sirena.org.uk>
References: <20220822095242.3779-1-povik+lin@cutebit.org>
 <YwN2Pd4Ez08yDFno@sirena.org.uk>
 <3234D74E-0DFF-4BB5-87ED-6135BAC1F31D@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XpiXeP+qgN0GU/v6"
Content-Disposition: inline
In-Reply-To: <3234D74E-0DFF-4BB5-87ED-6135BAC1F31D@cutebit.org>
X-Cookie: Do not write in this space.
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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


--XpiXeP+qgN0GU/v6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 02:38:09PM +0200, Martin Povi=C5=A1er wrote:
> > On 22. 8. 2022, at 14:27, Mark Brown <broonie@kernel.org> wrote:

> > There was a tool floating about in the past (last copy I knew about was
> > on Wolfson's git but they took that down) - can we not just continue to
> > do that?

> I don=E2=80=99t know the tool or where would I find it. I think it=E2=80=
=99s neat

Copying in Charles and Richard who might know about the status of the
tool Dimitris wrote.

> simply having a =E2=80=98graph.dot=E2=80=99 at hand, especially since it =
requires
> little code. (Although sure there=E2=80=99s the danger of it growing.)

I'm also worried about people going in and wanting other more tool
specific formats adding, if we didn't have anything at all it'd be one
thing but we do have something.

--XpiXeP+qgN0GU/v6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDftIACgkQJNaLcl1U
h9BhVQgAhlYauVDB2TMVjfnWr1F+7/cau+jUQ0QXgSPk1Ypqi1/ENVv2H4kyM09x
Qsk7wyl8aFnnn/zl4RFiZH2FT9H9dSZENhlb124dH0+FlAYXrCEuUn52/mg7Jddk
aRhlmWlBtFqpt+hKBGokVm9uImJ7Pcq6ISjXVjzhft6AN44gC8XpzBhQnMPgKHbL
+UFQtYcTIIpq+PBB6XpnbvOm9BXFy/7+fmviPM+SmUlbwtTPxnTlMYUZPQea9AQw
DbIPKx09nrL83HACwh7XFCpNWu9zX3jOWC4mrJMQunjDriXbyX3um/QgLKvqvrb4
s56C/Ac+73PfnD5/qeenUr09NK4j4w==
=T8Gc
-----END PGP SIGNATURE-----

--XpiXeP+qgN0GU/v6--
