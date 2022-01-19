Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 118E5493E8F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 17:48:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FAC43168;
	Wed, 19 Jan 2022 17:47:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FAC43168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642610888;
	bh=jcFYJMa4KHuzmvPQKCs7JdmJXADGOrQOZ7yiO5vDztM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sv0boFvU+lhDfAKfpbwGJpXHBOwtuZJ6l7B4XRvr39caixrCs/msehnSLe2yd0Hmz
	 yXw7BHu86YCxL1yMz1yytYON3QcT4XmdYUqBepbWJu9Ij8b88prLiLowOwayKfBZoG
	 DVAbsNwlqYUzs6Ex6+wNeiyz523JuqU3yilhfHmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C899FF800F8;
	Wed, 19 Jan 2022 17:47:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B851CF801F7; Wed, 19 Jan 2022 17:47:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AA11F80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 17:46:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AA11F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ufL4z/Kq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC5E961556;
 Wed, 19 Jan 2022 16:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D772C004E1;
 Wed, 19 Jan 2022 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642610811;
 bh=jcFYJMa4KHuzmvPQKCs7JdmJXADGOrQOZ7yiO5vDztM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ufL4z/Kq1K7yccutI10koc9w/C/Ue7o6ubD5rp1l79h79Z7FIFu+0LwtIG6T8yzHP
 7tjEGxGQBcosFEhSwZcWkjNaNPRA4PThoZWefyDJiVcpRHLqArASg+i4fxGQ+KTAcF
 vPpfN6iTnXt9MezWt4gUCi2YftxdJkUVbMS+oiuCcrxiXTmIcBlndjVH1tbVC/yUY/
 1RCmWEzn94bQ9LVQB6aIEe9CM0jiXrccBRwMpeV10vWJ0uqk6bSVnXLyD/2Aa8jCbG
 rfDEwGy37njcfmFSyXui/bMj1Mz/Gu+Mhs10CTcmrZku/9zTT/lw5T/m/vKuUkEv29
 nEXXIoZV45s6w==
Date: Wed, 19 Jan 2022 16:46:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: codecs: Check for error pointer after calling
 devm_regmap_init_mmio
Message-ID: <YehAdeQAlPubkNZ3@sirena.org.uk>
References: <20220114065713.1246619-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JFhvXVQvk5tjTnut"
Content-Disposition: inline
In-Reply-To: <20220114065713.1246619-1-jiasheng@iscas.ac.cn>
X-Cookie: YOW!!  The land of the rising SONY!!
Cc: cezary.rojewski@intel.com, bgoswami@codeaurora.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org
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


--JFhvXVQvk5tjTnut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 14, 2022 at 02:57:13PM +0800, Jiasheng Jiang wrote:
> Since the possible failure of the devm_regmap_init_mmio(), it will
> return error pointer and be assigned to the regmap.
> Then the error pointer will be dereferenced.
> For example rx->regmap will be used in rx_macro_mclk_enable().
> Therefore, it should be better to check it.

This doesn't apply against current code, please check and resend.

--JFhvXVQvk5tjTnut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHoQHUACgkQJNaLcl1U
h9DHWgf/dwBXaKQcvpj3mwPc9R2yoQkwmc8zfpixVlq00cQOS0JHq2a1st/qcSBq
iqWL4AtENPGRIrw9Lnw6a9u+nwoE76TS7yzt5PNqq1jq2T+kqaO+fMGj62QoVX/u
wNLWTfd0SebMrchZKSXkursHv0CBUydYiF6n/yjgJb3VVj/fhcrrrZ9SOGbfxdyq
17cm7S+bc0r6EMEVIUeSFcSNsWnRayIzP2O5OLkImC0+hUgy6uaI2Vjndg7yCqbZ
WApyAOyqm8Pfhb9CU3PcMupfgB4MqISA+PyeayR5gX6TtxhoGxZbapmDHVB8nN+4
q1liOHkZa9rg2JIg8M1DOzY7R4n0OA==
=MJdS
-----END PGP SIGNATURE-----

--JFhvXVQvk5tjTnut--
