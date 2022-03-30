Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FEC4EC98B
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 18:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33EC41887;
	Wed, 30 Mar 2022 18:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33EC41887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648657120;
	bh=Q+USGHsR1S1m9ZvzFcgjt7zp0ViNdGcvN3RiBCTFNSM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RNoGjSoGi3TjQDd5augqYaNhMqWenS9b5Mk/YBd79kjMpuaCiWzKJVeAgOsMQNuh4
	 FYknTDYLv+N3F/RLs9cN+bj2UiQSdSz6OjmPsZleHiNUxVkn7uXFvedVbMKkKf+5Fi
	 OhiSpyzotdaAHqHxAVEDjhspd8CpygtZV3FY2icg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B16A2F800B8;
	Wed, 30 Mar 2022 18:17:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89855F800B8; Wed, 30 Mar 2022 18:17:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DA83F800B8
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 18:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DA83F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O8S0hjOf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74C6DB81D87;
 Wed, 30 Mar 2022 16:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E24C340EC;
 Wed, 30 Mar 2022 16:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648657048;
 bh=Q+USGHsR1S1m9ZvzFcgjt7zp0ViNdGcvN3RiBCTFNSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O8S0hjOfWVpcL2d8Ii4T6o+AuXfYtsfA5ix/uX/rPyjwS9bxhfO1i86FHjIdh+puv
 I/W7n5WESGfHjS6nF6gp5uPbz0DSJdmTwsJmdaL3RDAl0eVJBdNT4exUa1F1pmWqy/
 L5TsjMqr9tZXP8WmWGuRJBh+7CyOBurO/HruWy2Zqf2pbxXdUFXjOULx0WFZpkDRTD
 QVfwF0fhifJNU26ElPMrsxlNMoMiEQy7tfASjXepRDVYCV/+WyR1iuE1rYjYLwRcTQ
 3WMZtglRmT0m/phSC+R4aYQMOKh4xxVnG0cpZxbkZbFGBsB3JmOU/q0kciwlqmv+sV
 2kaKH/mpSSGAA==
Date: Wed, 30 Mar 2022 17:17:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix incomplete if/then/else schemas
Message-ID: <YkSCj1wT8E/uAdbU@sirena.org.uk>
References: <20220330145741.3044896-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TNgjpwjwvAc49yPZ"
Content-Disposition: inline
In-Reply-To: <20220330145741.3044896-1-robh@kernel.org>
X-Cookie: Two is company, three is an orgy.
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kishon Vijay Abraham I <kishon@ti.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Jakub Kicinski <kuba@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-tegra@vger.kernel.org,
 netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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


--TNgjpwjwvAc49yPZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2022 at 09:57:41AM -0500, Rob Herring wrote:
> A recent review highlighted that the json-schema meta-schema allows any
> combination of if/then/else schema keywords even though if, then or else
> by themselves makes little sense. With an added meta-schema to only
> allow valid combinations, there's a handful of schemas found which need
> fixing in a variety of ways. Incorrect indentation is the most common
> issue.

Acked-by: Mark Brown <broonie@kernel.org>

--TNgjpwjwvAc49yPZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJEgo4ACgkQJNaLcl1U
h9CMwQf/f8YiUiMex+FwfC/kdvXglTNhRApaQRU6OtuSmz5UEnBb6O6YMmQLA4q4
P3oQ1eCCQFXxr8+P7iqLuM+N4MRXPNabE1q82boC3jBah9e8mvDKJtNZJlz/kRXD
QazSWyj0T9UQpnveVimQMjtE/So0MgZSI/KLiB/hjhG+5Be3Gq5Da9HfdMFwvtA1
nrqW5IcduprA2fSUgucuUddybp9AoCJr+cvoFPx3Zw/1Nnjb/7xWP6TYeh2EpRCp
4z1q0JIEFpwa0vCan+4S1IF9eUjHLTmhnUt3yWgERmRNK7t9GKrhobfSAuK8pmky
vpPGzlJMA9MiagHlb4EugpvmhYzNuQ==
=41nO
-----END PGP SIGNATURE-----

--TNgjpwjwvAc49yPZ--
