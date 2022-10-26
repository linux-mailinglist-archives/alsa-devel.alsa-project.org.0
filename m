Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3841060E441
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 17:12:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5B53AC3;
	Wed, 26 Oct 2022 17:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5B53AC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666797171;
	bh=4Z5zLso9XNCBCHEEuJMM/rcAgVuqzF4fw0BCdufFO5Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nE0IWa/UEM287wFUbwGZ7l5mEh185qbw+eYgy9mb6DsqjupLmid3lJUEbrLxjZXzH
	 Mt1RhWYtZVwOfPmBGjSD6kDQG/n60RlQL88I/LwCvMLb6Z33Me+v0MiQL/S7GalRKF
	 ACR6tOSM7YKWTRL1zH4RqkQdLKXi+mYHbuj4If4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31047F8027C;
	Wed, 26 Oct 2022 17:11:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0A98F80271; Wed, 26 Oct 2022 17:11:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75D4CF80100
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 17:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D4CF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XbUqWf/U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94F7361F62;
 Wed, 26 Oct 2022 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C25C433C1;
 Wed, 26 Oct 2022 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666797108;
 bh=4Z5zLso9XNCBCHEEuJMM/rcAgVuqzF4fw0BCdufFO5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XbUqWf/UNHlwTkNxQkTZ1K6W0GJk+JvCByByAYT51qdtLQpqEpX602AOL0P95C/sD
 CY73cmiO8ktDHurGqpaMAY5PlkDfrAfpHNGU5INpNLac6CNVx10EBPknWx0UYEMKhw
 uTuz+pKi+5Pkj3xjY4oIl/+Yrfy7yZchBQmf12bB4vvhC6AEgEprC/MI7ZUuTrNPpv
 25KGRiiF/D0PVka6WdMYU/fU1vdOwqwLLY3fsvUnMwSRnJa9MhIdlEYn3FO3EoNQX2
 3RpPu6fTs/ziU8Tz4+xVLlkQxF7eBviR8ZilkIUhv3F5R+SdneQMGdULvZc3gn0k5i
 zWRfnsWMWBuFA==
Date: Wed, 26 Oct 2022 16:11:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: simple-card: Support custom DAI system
 clock IDs
Message-ID: <Y1lOLgLNDgsmvfe5@sirena.org.uk>
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <Y1Z74/vKHbnaCLrX@sirena.org.uk>
 <XaoRSEMyUlabAR8wEJITmm2lGCjwfPZg@localhost>
 <Y1fCfej+/WH8TI39@sirena.org.uk>
 <FgO8Xz5MtaEBdBidpT8So4X5posjL95Y@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="STgcsZayb3dhE5DX"
Content-Disposition: inline
In-Reply-To: <FgO8Xz5MtaEBdBidpT8So4X5posjL95Y@localhost>
X-Cookie: Prunes give you a run for your money.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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


--STgcsZayb3dhE5DX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 26, 2022 at 03:42:31PM +0100, Aidan MacDonald wrote:
> Mark Brown <broonie@kernel.org> writes:

> > There is a strong case for saying that all the clocking in CODECs might
> > fit into the clock API, especially given the whole DT thing.

> The ASoC APIs don't speak "struct clk", which seems (to me) like a
> prerequisite before we can think about doing anything with clocks.

Right, they probably should.

> Even if ASoC began to use the clock API for codec clocking, it's not
> clear how you maintain backward compatibility with the existing
> simple-card bindings. You'd have to go over all DAIs and mimic the
> effects of "snd_soc_dai_set_sysclk(dai, 0, freq, dir)" because there
> could be a device tree relying on it somewhere.

Of course, you'd need to define bindings for devices with multiple
clocks such that things continue to work out compatibly.

> So... given you're already stuck maintaining .set_sysclk() behavior
> forever, is there much harm in exposing the sysclock ID to the DT?

Yes, it's ABI and the more baked in this stuff gets the more issues we
have when trying to integrate with the wider clock tree in the system -
for example when devices are able to output their system clock to be
used as a master clock for a device which can use the clock API as an
input.  It's fine in kernel but we should be trying to keep it out of
ABI.

--STgcsZayb3dhE5DX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNZTi0ACgkQJNaLcl1U
h9D/qgf/YOsJbQ4nQ75FNpRwHXAqvJR2rYBAW8fcMr3YrbLRTFOb03bpLFqa26nB
tfJdkMrYr61OwPJY57vjlxoEJjSgdMHNuk7wB/Jo+n1PoPiHTg2SiLVbbG/pOqfw
iENggEi02xvC4zGMmdEqzewObfbACRu0ZdIeKl4cXmFarL4/INkruO9WgABAFjtF
ER7DoDv7Klfk28I6fP49gzEGIV8Omn6qHViJkz4fcrPbGpQcJzJtLU45amKZi/Eu
NAy0T5bI48u/fcOZYup5lQYK/QyOb7XiI5CjLnd/MOjsBUjzUlukyeKnD/RLT6o2
Sd7w6TFggE4pjNnE6GfxQ15P+Iw1Rg==
=hC+q
-----END PGP SIGNATURE-----

--STgcsZayb3dhE5DX--
