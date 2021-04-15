Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C05A360F82
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 17:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A591675;
	Thu, 15 Apr 2021 17:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A591675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618502112;
	bh=5J3/cKo7EjuWQS6hYFqVkAslTkZJDiDhzJ2wtcWF09Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/BLAmWCEbsMR4AhAqGxTUuPqV374QvgIWyd5/olUC36xcArs3I95JkpgcFLljlL0
	 mRgmPk+e0SnOnMnLNSQv90z6F766f1XWh0hk5GCPgX1fDrLC3peZL8CYiqK6XuFYHt
	 4+4nDoxgsco2QyOZgS2VjU1DQ/bqrISvlU93DDG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47ADAF800ED;
	Thu, 15 Apr 2021 17:53:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A8BF8022B; Thu, 15 Apr 2021 17:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7443DF800ED
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 17:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7443DF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UxJ84pL2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A045610EA;
 Thu, 15 Apr 2021 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618502014;
 bh=5J3/cKo7EjuWQS6hYFqVkAslTkZJDiDhzJ2wtcWF09Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UxJ84pL2Sb2ru6mbONiWhtZO0PaS0tdcTfaAdWwQe2tIP8HYOtd43uZcL8C5I6+LY
 84nuQjNrios74C/1Y8/XkxVrlltjtQ7m9PzrJBDkkCuBeog4pIvpuw5xw3mMbaq8tN
 ZpGNgHIjcb2uUZFoPhgYhEjNd4cxHKW4bBN/boIog2n7atbfmta4C9AalJXAMIzT0l
 AkwxV2fYuhfeqGfQI/jYtVJsY4RCtQepTkKa0/cWwR+rtVxOCPQXuHvbvzKml/8j9o
 eJVyvwVcB60p03pMovF5kelJ6rJRGx+h5qz+dUH0bstEfRVWFF233C0+XDe8uHhjSs
 z4ELj0vASgMpA==
Date: Thu, 15 Apr 2021 16:53:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: use current DAI config during resume
Message-ID: <20210415155309.GA48833@sirena.org.uk>
References: <20210414165926.1875465-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20210414165926.1875465-1-ranjani.sridharan@linux.intel.com>
X-Cookie: You will have long and healthy life.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 09:59:26AM -0700, Ranjani Sridharan wrote:
> Recently, the sof_pcm_dai_link_fixup() function was
> updated to match SSP config with the PCM hw_params
> and set the current_config for the DAI widget.
>=20
> But the sof_restore_pipelines() function still chooses the
> default config for the DAI widget upon resuming. Fix this
> to use the last used config when setting up the DAI widget
> during resume.
>=20
> Fixes: a1e1f10a6ed6 ("ASoC: SOF: match SSP config with pcm hw params")

I don't seem to have that commit.

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB4YWQACgkQJNaLcl1U
h9BFuAgAhB1DmxSd6J7keZ/vTT4klnU58fcbJ3wRP73O/kUBy6wuFVyuoEWUZIL/
usNOl1qfsUPMbSDQ//Cm2C+nXnU1YJLBPicK86XTiwxxLbK6nRZZkDXX5Skw8clf
K8cA48bJ0K2G3hd521M/yKDsI9Ytns6jcUU6NzIgtrJouNWxUw91PRuvLzyJfBba
oVbU5AIYefPNeIQ/1zOrwA3yr7n497kPbv8I9yP6kkMT8WJhsY2PeLabNpJag6eL
v1q6wbiN46I8cASf4wwP4O+szxysv9xEWWUYgKlqkn1TQWt4B/PD1qDHJx80jvnM
agy6SqJkfZf6Ag1u6v9bVQmjJ5BcwA==
=Lr7P
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
