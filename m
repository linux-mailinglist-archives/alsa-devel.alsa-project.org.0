Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0111B4E73FE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 14:12:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CA4916C0;
	Fri, 25 Mar 2022 14:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CA4916C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648213933;
	bh=DqDQcGIc6eGMUNGty2u8ZVy35BbXvL1WUqD8m7HhIkw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ef1tzN3IlYTWRx1s11LNQYv9wmU7pHv3/rLFhdOdjoPQuLxd5TO+ZlsvahI/5L8JS
	 ByyemFbo/jU9a9NKWYm521rhtnKbmhOlSLGeSZw39c5vs/GfQe3BhdYxp2uyyVqVTr
	 uxqEV3lI+YcwG0mayojuXVbqu2LxWvH3LfunLCYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3CB2F80115;
	Fri, 25 Mar 2022 14:11:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA5E8F80162; Fri, 25 Mar 2022 14:11:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A0FAF800AA
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 14:10:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A0FAF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pC+RcZ6j"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CDDC061A4F;
 Fri, 25 Mar 2022 13:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4116AC340E9;
 Fri, 25 Mar 2022 13:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648213854;
 bh=DqDQcGIc6eGMUNGty2u8ZVy35BbXvL1WUqD8m7HhIkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pC+RcZ6jETlGMEgBOlLd6mA2pXHNMiEZ0zPKtHtj6EG5UlNBYEvYSdkPp3hlFG5n1
 SNsXvyQM57v+bKYdTZPttUknCo9+3VpaTE8ixDqPinemyeVQn9JaEbYztAMxUzOs1X
 hrsCyfz4jhhMvBtZmykHuoIqNeKed39VIa/shMcr98G6mvEtpYn0WJlW7uMhKoKdVd
 RBiSYiBAvck+b9LRkhQvoWFc9GLEvhOM3nk37JeSG9xssLlFeZJm0anqZNiFRYPb6l
 lEox8oebqJnAir1KJW+ZIZYrewp8XLQOctYHSBvCtg+W/8vCMg/eQ8OG7cJVIuoCgu
 CdRZ5b/2MRPIg==
Date: Fri, 25 Mar 2022 13:10:48 +0000
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: rt5682s: Separate the regulator consumer controls
Message-ID: <Yj2/WApI07sny4oJ@sirena.org.uk>
References: <20220325075532.12204-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lM8S8ViKP4CBnzKD"
Content-Disposition: inline
In-Reply-To: <20220325075532.12204-1-derek.fang@realtek.com>
X-Cookie: Man and wife make one fool.
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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


--lM8S8ViKP4CBnzKD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 25, 2022 at 03:55:32PM +0800, derek.fang@realtek.com wrote:

> @@ -3025,8 +3025,17 @@ static struct snd_soc_dai_driver rt5682s_dai[] = {
>  static void rt5682s_i2c_disable_regulators(void *data)
>  {
>  	struct rt5682s_priv *rt5682s = data;
> +	int ret;
> +
> +	ret = regulator_disable(rt5682s->supplies[RT5682S_SUPPLY_AVDD].consumer);
> +	if (ret)
> +		pr_err("%s: Failed to disable supply AVDD: %d\n", __func__, ret);

Please use dev_err() for error reporting.  Otherwise this looks fine.

--lM8S8ViKP4CBnzKD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI9v1cACgkQJNaLcl1U
h9Cy+gf5AYbVW4QGbO2A2l4xRVXAnOUay4IS0YMuHArHpC8PawRy5D6/QarK6hMu
B5sbFc7xGL+VvNo+DhxL+tsW9i+jCXngW/Jh/S/3nbUmqR8vScoaA3bzA+/LXMXG
8PAFpMcmP3agTo4NS6BUJEgPgFFTgdv18by5lg5GTsNXeCccJAGB3YGLL2vPV53E
4AHQqs/SIfV30KxJzMgYFnW9prGff1s0+r5xWSCrg7Q9oAA3l/V0AkgqC4FRWvqh
7vEw/JtMtSdVq6/uicRB5FX1TmjGAUgkfGmyoaoKK1f/Jl6qhGbZkKX6nCkmTCaE
YjFjMWOuoiLXLqooOCZ06V3XNfZYZA==
=S+K2
-----END PGP SIGNATURE-----

--lM8S8ViKP4CBnzKD--
