Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A384EAC5C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 13:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A8F8172D;
	Tue, 29 Mar 2022 13:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A8F8172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648553538;
	bh=8IHBVA335z9+DxgSxrKjPerzpnuiiqAmIHJNv8kPlSA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M2USMZ3KBs/hIpLLZnVih1xXpGYQV5hLPLNvKoDBOc128UvjStKVASgFooaUuhmvd
	 c9Gcqg+Q0L7XY1DQAmsYOCLr5EYbYwNwWfL2UcX6FX6oRR1SQSQqlcXXaXKP52sO8L
	 obaMiH8dveyNuqVmtIHlhtSTX6KXFjNVHz3FIv1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC61BF800FA;
	Tue, 29 Mar 2022 13:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FA88F80311; Tue, 29 Mar 2022 13:31:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73934F800FA
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 13:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73934F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZoDhW9pW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7213C61343;
 Tue, 29 Mar 2022 11:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA21AC34110;
 Tue, 29 Mar 2022 11:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648553463;
 bh=8IHBVA335z9+DxgSxrKjPerzpnuiiqAmIHJNv8kPlSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZoDhW9pWmYzO+WzHTZU6h9Ok7BIRygXS8CudgpT71Js+3AMoH6VpCVc8WvaPOA2JK
 qmjac818e0PUO6WhvFmNDP23JPWHAIiGEqZOX65jxllqSjRAByDImGWjTgrEx9ymTC
 F3pY3fhvrYyUuIKh9k+vSvIRky2HM7Hlo7a4EO00Q3MhZVI4jwHDicX1t6tFdse9OY
 szBgb5laDXTdZDUrSHtFBpmOcBaS9hBqiURtywywJ60ITAYjfRW6m7HcYkoiJHPMtE
 Rk1z5aBRMXqSh+Fb8Y8LRiz1BlvtyedctdsMR56CscAu59+rtsmFZAXCijMZIVqvdb
 wmfKt3c2OvrvQ==
Date: Tue, 29 Mar 2022 12:30:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 2/6] ASoC: tegra: Add Tegra186 based ASRC driver
Message-ID: <YkLt8U5MnG+0gFxl@sirena.org.uk>
References: <1648447526-14523-1-git-send-email-spujar@nvidia.com>
 <1648447526-14523-3-git-send-email-spujar@nvidia.com>
 <YkHX3/8BbXo4obWI@sirena.org.uk>
 <4e8bd876-48ed-8fd8-7b7b-989b45b54f1e@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="V7EwDDVgYNffjf6e"
Content-Disposition: inline
In-Reply-To: <4e8bd876-48ed-8fd8-7b7b-989b45b54f1e@nvidia.com>
X-Cookie: Available while quantities last.
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, catalin.marinas@arm.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 krzk+dt@kernel.org, will@kernel.org, linux-kernel@vger.kernel.org
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


--V7EwDDVgYNffjf6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 29, 2022 at 02:02:34PM +0530, Sameer Pujar wrote:
> On 28-03-2022 21:14, Mark Brown wrote:
> > On Mon, Mar 28, 2022 at 11:35:22AM +0530, Sameer Pujar wrote:

> > > +	/* Source of ratio provider */
> > > +	SOC_ENUM_EXT("Ratio1 Source", src_select1,
> > > +		     tegra186_asrc_get_ratio_source,
> > > +		     tegra186_asrc_put_ratio_source),

> > ...the sources?  Or does it need to be configured before either side is
> > ready in which case this might be the best we can do for now.

> The ratio needs to be updated before start of the stream and this
> programming via controls is required only when the ratio source is SW.
> When ratio detector module is used (support is not yet added), the
> ratio is automatically updated by HW.

OK, that's not ideal but should be fine for now.  Ideally we'd have the
rate detector support introduced in the same release.

--V7EwDDVgYNffjf6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJC7fAACgkQJNaLcl1U
h9ANSAf+IOqA/07bEMbKWE9/DpOYo8OUux8tdLQWz4Ll7egQt8NHkvEo388AqOTH
t/y6I6zjXwXkALN/IguSFatfz11OkdNuL454wozODL795TEtdJQKTbPuTIM+NGWZ
i4tqNr/nXk9jWWBeeSK7esZIS+a3c/W6e2b54XH1+P7nCYAJoMNW0RtKWIvXWBa/
lzZACNRH6kojanb4bC/BZMIuOVoqOWxFWC5j6dVdO24Z0OWHkPZ11FN+8dp+f3nY
YkvXv2WyEsg2syC6OzZVBn/BQcWgc3p+Yks54AEsNyUdHfyefggOAQ/R3Rj4oZp/
njbYdmDQ1gNUsMD9M3IX0xhoEGkbtQ==
=dnPU
-----END PGP SIGNATURE-----

--V7EwDDVgYNffjf6e--
