Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EC12F5FA3
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 12:16:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F669168F;
	Thu, 14 Jan 2021 12:15:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F669168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610623005;
	bh=HEn6x8XwIMQYX5cf2Cfwj/acaJyDmQOqh8W59GekF8E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azyPfVrEpLYIhbDEqjN/HPd1AFDajZQuv6hA57rgyCdQt188BjckbEHQxm8DNh8G2
	 CRqZ3fHXQjW47bWWMaY13QBnKKZGFzryTeyoH24Xnzj6SIhrn6hKwmE7d/TXeQqK21
	 dY4FeUi1jEiJyA43txnCVQ/iTAnfOkjibDFWdQaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C361F80134;
	Thu, 14 Jan 2021 12:15:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C12B5F8025E; Thu, 14 Jan 2021 12:15:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90EC7F80118
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 12:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90EC7F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V7u08RCL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23634238A1;
 Thu, 14 Jan 2021 11:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610622896;
 bh=HEn6x8XwIMQYX5cf2Cfwj/acaJyDmQOqh8W59GekF8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7u08RCLdM+KtZsvcdKRaIMwQwwW+USMkLqv2FG95OT9E3vTITF7t82wi97ZJqYog
 trIPVU4lmVePaaR7vfeitaonyAmiKNYCM0keKY9/HxE20EFIl02QNkvTzVzwWk7GGC
 u1iuXXs+6pLCsJ23d1+AmpL7iTKgAJMoq7akF+4EnW9epo6tq8Mc3VWvWw8rTqmP5l
 FCwB5wG6gCBQHqyuC1ec23U3TmMaoT1ivo/D0hu0/UqfH6ImGVo1P60KQdWzBhHbOm
 z3XW/LW+3zL5ygnfZO/xpQU+PAheuw3LsLhrXGO44JBJuJ+/XPo3SsEr7xDV2H6lUh
 VQEJiOuajCz9g==
Date: Thu, 14 Jan 2021 11:14:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: audio-graph-card: Add plls and
 sysclks properties
Message-ID: <20210114111422.GA4854@sirena.org.uk>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
 <20210108160501.7638-3-rf@opensource.cirrus.com>
 <20210113152225.GA2334778@robh.at.kernel.org>
 <c12a846f-9e79-4646-e7f4-397f074eb613@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <c12a846f-9e79-4646-e7f4-397f074eb613@opensource.cirrus.com>
X-Cookie: You have taken yourself too seriously.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 alsa-devel@alsa-project.org, f.fainelli@gmail.com,
 kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 nsaenzjulienne@suse.de
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


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 14, 2021 at 10:31:10AM +0000, Richard Fitzgerald wrote:
> On 13/01/2021 15:22, Rob Herring wrote:

> > This appears to all be configuration of clocks within the codec, so
> > these properties belong in the codec or cpu nodes.

> audio-graph-card doesn't have codec or cpu nodes. Those were in
> simple-card but are replaced in audio-graph-card by a simple phandle
> array forming a graph.

> I could assume that all clock settings apply to the codec and that there
> is only ever one codec in an audio-graph-card configuration.

The suggestion here is to put properties in the node for the relevant
device rather than the card.

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAAJ44ACgkQJNaLcl1U
h9C5hgf/c2ZJGYL10xAvFbrBmbviZFuAh9cGNdSkafHv1OUH4E5CZNwTOSCwi+CE
fJ7wykl1RjbEdTBdW0LFyMN47/dHLLFh2579jfRqVgBlEHn9oRLyfdJZjhjbrFfb
FApz80U1oaVv6OlzmGdpzXvtuyqBooIt9yYyd3n9yFWWoetQGT9gn/ulWrrL3qyh
J5GYZl0aoCdzxl2pA++666p7B5SYtwedDO+NeRVpuHVSvz/nFl7JKHoQWYaVXTmx
0MTbcB+BtfSwN73s1YQW7CXmi+Pa2nDg552Wfld2eSf/lYnqBpPohF0jU05OAb1y
vPPBJMABELNIG8+Cod8+RCi7wDzaLQ==
=3PWv
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
