Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF2364EC4B
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 14:51:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08940172E;
	Fri, 16 Dec 2022 14:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08940172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671198663;
	bh=QFMisP15sjuymDRGXQT7IkSyMcDUWNcSig/PMP/Pqe0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Du9V/TQFTAyz1ynbtHs57nkcTVZKmsHYbZTPforUTClwav9QTI3krSIEX5g4pfI83
	 mXrB86Idd3Ds/kWSV6Lj4zdv2K6AT46Ah2V4D/BtYntV3DZIun+xqQawn0ymPDQUoI
	 AA6nBzrV53rgAWfN1wGr4H/BLj8x+gHMxSUJ6Ih0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB9A5F804CB;
	Fri, 16 Dec 2022 14:50:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63E01F804E2; Fri, 16 Dec 2022 14:50:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46BE9F804CB
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 14:50:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46BE9F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OWIO9sX8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6057DB81D98;
 Fri, 16 Dec 2022 13:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45DEC433D2;
 Fri, 16 Dec 2022 13:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671198599;
 bh=QFMisP15sjuymDRGXQT7IkSyMcDUWNcSig/PMP/Pqe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OWIO9sX8SOZuiEzTnQgL8kfFK8V1LmakqnbFhx/wqDIZnAmXB+ydnW5QBTiIcEwPS
 9ZcIi3Ar5pAC3KiJYvawuiIo4m5J0hK6C22A2M4Bk/uMiOF6D09nMqLLfV1Kv3t5tC
 2tCOaS5O1GyVzy/jiFKR613Cst4JQhk3jfAmi1POjB7qLY5QnNZzJCpZJQW656dUNo
 EVS7Zmdur9wMjSyHVtPEKWVhI5Dta1H0g21xZzkoO+ERFtmB/4net2U6NhlZAaJkDj
 O0Rhj347V1ZpBcxZ0I58P4vrA8HHQulSv6f059vGPd+xLfdSaFfERNwBUN+B0qfKnw
 noLqEB5jJI0og==
Date: Fri, 16 Dec 2022 13:49:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,pcm3168a: Convert to
 json-schema
Message-ID: <Y5x3gQ4yQFTal5WV@sirena.org.uk>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
 <Y5sJV2KfX98KoMYZ@sirena.org.uk>
 <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
 <Y5sVewc7ItFBZkn4@sirena.org.uk>
 <87iliccjoz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="B4Ig2C85qvcn2BWz"
Content-Disposition: inline
In-Reply-To: <87iliccjoz.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: No passing.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--B4Ig2C85qvcn2BWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 15, 2022 at 11:48:29PM +0000, Kuninori Morimoto wrote:

> BTH Mark, this patch is included in this patch-set, but it can be
> stand alone patch if other patch-set were accepted.
> Is is possible to post this v2 patch as [1/1] ? or do I need [PATCH v2 11/11] ?

Just posting it as 1/1 is best - for both patch number and series
version the numbering only makes sense within a single series, you can
just drop this patch from v2 of the main series and send it separately
as just a standalone patch.

--B4Ig2C85qvcn2BWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOcd4AACgkQJNaLcl1U
h9CRfQf/U/FMNAdDXx65RJpVN9Ys/ENAN4EFqRJkYlf6Zcq2SP9iAC4K0wIXTArP
Y0tHd54bT2HU6unXgYi3iKZGVvrc+eM1kfVkuo4PoaYacDtDTq/U387vuXEE1XZ+
p/Wc5oTf/ZbQw49vbFo3iOQdcVPCEr6CrFCtlyppN7p0bD6kO6VFKm7+/qRB0EdA
qAh9nOrVRHrCBV+nBbT3apynlKRrIFRVIkFmS2EeHbDMZPTuILs/Ucd95VB2xjBn
05LiZ1fA6xCRlHD/KHwFIWRthJCE/3oL2v8cAdWHFhEyeyUxKI//GKiOnnBzEtaj
+To7bYmVaJGmfDVSw+uUoiw0SApLbw==
=lJj3
-----END PGP SIGNATURE-----

--B4Ig2C85qvcn2BWz--
