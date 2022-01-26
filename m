Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF449CAD3
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 14:30:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF93B1F05;
	Wed, 26 Jan 2022 14:29:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF93B1F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643203844;
	bh=mT467lBcrkRN4C1rEJBsO2WswZT4g34rFOdg2XuL/QE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LhrqwZgimb4J+5+Ob2YRQwvFIgbiieK0Byw27FA5pYPOctwkoYnmEZJs9MpOR7h79
	 VV0oUUp8+F5f1j7e1T7CQ5S6G9J8tkJ9Ait+8PXXe2pMPuAFWN6WZFSW3zFL7T8eRp
	 XK4cpLulejvtQ4YYN+vUrxL97505CxG6d0ljEfTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63984F804BC;
	Wed, 26 Jan 2022 14:29:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0B6CF8049C; Wed, 26 Jan 2022 14:29:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BCDDF80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 14:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BCDDF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="POt3supP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D000261047;
 Wed, 26 Jan 2022 13:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82922C340E3;
 Wed, 26 Jan 2022 13:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643203767;
 bh=mT467lBcrkRN4C1rEJBsO2WswZT4g34rFOdg2XuL/QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=POt3supP7bahwATNplivNqDPiUs/ZuZkvO418KhR8QTMp38J2I3KXes17ltjd6ufX
 WqVxgLVzkRrL4izM2zOqqcsgvZqeYva61AteYLR71Tzv5Lj92lpJNZgM9Bsb7jhYo+
 whiOgnS4ldS47IkmfYqbOAOXKcH7HAiLl4qNpW380c7Chp1uwle9Yb4vJZLy2tJDmw
 GSF+AaKhn6El/64oCIZOCVKLkWv4INpmunw0t0csAajvtaTuLTlrunV0yUcyM6xbtz
 kjlwBDvpTjCbg9ww5P496scGrRwjtPxP3ANwjiny4pPMCgAY645OaOaQ/cM5F/RLjv
 LDRI5zSLCLtlw==
Date: Wed, 26 Jan 2022 13:29:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: qcom: fixes for Qualcomm codecs and q6apm
Message-ID: <YfFMsvoqrJLbw28Q@sirena.org.uk>
References: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="laBfigsUZbIoY+DU"
Content-Disposition: inline
In-Reply-To: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
X-Cookie: Use only in a well-ventilated area.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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


--laBfigsUZbIoY+DU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 26, 2022 at 11:35:45AM +0000, Srinivas Kandagatla wrote:

> Some recent testing found few issues with wcd938x and lpass-tx codec drivers.
> WCD938x was accessing array out of boundaries resulting in corruption and
> system crashes along with not handling kcontrol put return values correctly
> and rx-macro had incorrect sidetone registers offsets. One final fix in q6apm
> to add a check if graph started before stopping it.

You probably want to run the new mixer kselftest on these devices,
including with the patch I posted the other day testing out of bounds
writes.  It doesn't cover change notifications yet, you might want to
set up some automation for that for whenever someone gets round to
adding coverage.

--laBfigsUZbIoY+DU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHxTLEACgkQJNaLcl1U
h9A24Qf7BSQjv9pYcwSdLpOiHP11HMd2IlRIWbcDJy4eIix5+yG1DfVCcVSCkKqd
XPzTl/dv9Iam0MY4gIRFLq6yk0ZPU3VZwGpUm4f31FHnhm0ChLscUesrSKFhmBGi
O7ffonEWdZyx90ROp6QdQMt1Qbn6S9TsxZWIarmslMb4uzjlx+w5QO+sPA5qpvXD
JDpyl3/0qpzPvNtRCpYJd6APUD2VZFWIg2uYDbhnN7l+ctGmXH+VZK52aC/XR+It
CWBDK5d8y3DG9qtG+dYpja22pgVgQhCG/PXeT3UhNYKnJ8y4NC4VotmQY2qFu/AS
A5ida18UnF5VaQ1OFimDJDWNAepAZQ==
=4is7
-----END PGP SIGNATURE-----

--laBfigsUZbIoY+DU--
