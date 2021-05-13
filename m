Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B22837F95D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 16:08:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15F2117CD;
	Thu, 13 May 2021 16:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15F2117CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620914898;
	bh=4rN+VVlc8ibw3oXGCckMjpVShm3yI4NuuKf5/cjLR7U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9qZcTWpyd27DyDWGjrHbDeb3mlv0hV9GaPSItZ9vyAGyQXW7SUBO62x4WV/dbZJD
	 x9jOT4AfuPawM10sy63WREtCBOMsJL+d6vkxQtNerUu+OjmkTrsRObv9yiDqRIM0AE
	 ++zmR4ytyJtxqjIbJmHFIi3i6WrD+5hK47HULGcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D59FF80156;
	Thu, 13 May 2021 16:06:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 429E8F80163; Thu, 13 May 2021 16:06:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAEBDF8013A
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 16:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAEBDF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="peVuKaSP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A496F60FE3;
 Thu, 13 May 2021 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620914798;
 bh=4rN+VVlc8ibw3oXGCckMjpVShm3yI4NuuKf5/cjLR7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=peVuKaSPy1xii6lSFRq++WcAMLUe07WXffeuebnVowAyjX4FQyHPg00L7khinSz+j
 kTINuPDLIAqe3fFT6vVYpP/OoNXWP72iooecMWNyhYXY5AJ8NtywC4OLQhFaMhTqWf
 NgQyjT9YTYcN9ukf9+uIUGV5ZXb5k2BVMLdpm6vxIOFJEN5GBSfjJYNvGD7S0Y7RG3
 gRPCItwiNNLIa5kaBjfTjTYc+T6u6d4oCbp+bTQW3chVQ5RSPcjzUSsErN9Qr7v2n8
 cL7T/vcX1lBMvohiNwQ+TN1BHn/OqReTs4/9IhXcUHvZMCFq1AZS41MHnovtg+GqQA
 r1pakCjLk70lg==
Date: Thu, 13 May 2021 15:05:56 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: Re: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN
 to dwc driver
Message-ID: <20210513140556.GD5813@sirena.org.uk>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
 <20210423164617.GG5507@sirena.org.uk>
 <e1268120-7a91-da49-0bb6-89d5cb4e2cce@gmail.com>
 <b32fcc42-d67e-bfbd-ed83-7f7274fb2f79@amd.com>
 <ac5244d1-643d-6577-80cd-bf6867e75ca2@gmail.com>
 <b86ad586-9513-8fa9-54e3-a0b4a3a7fd92@amd.com>
 <070b4e5b-b7bd-b8a6-beea-593a94ec3078@gmail.com>
 <26c79eec-5e74-38bc-465b-0ca2b2d9a6f5@amd.com>
 <9b689495-e956-6242-0784-af3ccf7c3238@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline
In-Reply-To: <9b689495-e956-6242-0784-af3ccf7c3238@amd.com>
X-Cookie: snafu = Situation Normal All F%$*ed up
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 amistry@google.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Alexander.Deucher@amd.com,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>,
 nartemiev@google.com
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


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 10, 2021 at 10:57:25PM +0530, Mukunda,Vijendar wrote:

> How about declaring a flag in sound card structure and this flag will be set
> in stoneyridge machine driver.

> Based on flag check trigger stop sequence will be re-ordered.

A couple of people suggested that already, making sure the core knows
what's going on is probably the best way forwards here.

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCdMkMACgkQJNaLcl1U
h9CnIQf8CZTlwmEvhbx0XYcSv9tj7ITIo7+jFMz6cTd6x5LQfqk08xg0xOrij+im
FW5gReU/GxTEgE7K483MSbITxxRjPgLqURXSBrmub5Dp+2vCvNiXu3bX4X4vF4MG
pt9LnM0wibEgBg431MlbaPLiL9SbOCCzQJ2o0zn8kJQ3gK7ttgtDarXjjAXvJkaZ
Tcnfx9yY+zFrmfoC1wjphihSG2Gr+6y/2h+TYl1FWyw2lzJjsZh7U4w8vzE94+N3
FJz5Rm9c7Y/mMCumRHlJPED1ZIeWo+vchwf2dz7nOgtcId5yBkeSGvZewauMnSOB
onDJfyVf7Kc/qA4NYupS1QeJ8Dzwkw==
=lt08
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
