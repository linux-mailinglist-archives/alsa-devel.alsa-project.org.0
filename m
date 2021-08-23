Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEE83F4988
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 13:18:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D0D11654;
	Mon, 23 Aug 2021 13:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D0D11654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629717482;
	bh=qvyFfqbM6vx5V9xzKTxQ2lMQRmbnh+TF96BB26a0dtQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IVJDkVprTKR5L48lXED18Yi5KY70DFcR+dgmW6YYscWwfus5GqnJbzNTjzXYVT+RB
	 tS2abA4K0ZanAkomuLmwNnXz0E2Hcb32VCDrkMS5ZZjBmMZOiMLeEwttJxCdlaPs07
	 D3p0vNYvDzO3vqwmX7L2/gZS3TTUqy+UlY0tHRsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D48DF80229;
	Mon, 23 Aug 2021 13:16:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D02AF80217; Mon, 23 Aug 2021 13:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6302F800B6
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 13:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6302F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="btzjXBqM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AE0F6138E;
 Mon, 23 Aug 2021 11:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629717397;
 bh=qvyFfqbM6vx5V9xzKTxQ2lMQRmbnh+TF96BB26a0dtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=btzjXBqM/DnLarO29gpB27o0Ko3T4oNQZIPfjWxwuYNpMrFtwIOcJj0N14r9bHEFF
 1hps2PCuPQTJpAakUIP1gfvzIziJRz3sZaPwRjgQNKzQI4MSF2kRFBQA8+UP3i3I7X
 4EArdqoXSsG+sA28Ej7a2EzN0iFa+HlAjCa+D3iBWk0d7sZgUcdQcS9SQ2ZTgs8CsP
 nWuMHTs8XQSW8obBcTe4Q7dAwRwOcZo1oxhRf3UZ3qAGhgL5CbNi4Qd20yCnk0Mcim
 CzPzwYI/xm2++SSt7rU20iEPIfw1v6sApCM5ZONsDPEmLll02k2ZhiZDnaiMlrP/7a
 xQxBZvFeSuhsw==
Date: Mon, 23 Aug 2021 12:16:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: Re: [RESEND 1/3] ASoC: ics43432: add CMM-4030D-261 support
Message-ID: <20210823111608.GA4380@sirena.org.uk>
References: <20210821082658.4147595-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <20210821082658.4147595-1-angelo.dureghello@timesys.com>
X-Cookie: APL hackers do it in the quad.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ricard.wanderlof@axis.com, lgirdwood@gmail.com
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


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 21, 2021 at 10:26:56AM +0200, Angelo Dureghello wrote:

>  config SND_SOC_ICS43432
> -	tristate
> +	tristate "ICS43423 and compatible i2s microphones"

This is an unrelated change not identified in the changelog, it should
have been submitted as a separate patch.

>  #ifdef CONFIG_OF
>  static const struct of_device_id ics43432_ids[] = {
>  	{ .compatible = "invensense,ics43432", },
> +	{ .compatible = "cui,cmm-4030d-261", },
>  	{ }

cui isn't a know vendor prefix, you should also update the list of
vendors in vendor-prefixes.yaml.

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEjg3cACgkQJNaLcl1U
h9AXRAf8DkKQZA7H/YBusbVKGl7khdVhrZKhHGUmfURjmm8+09bao5HNa4sslnWc
l6+WYo0mGmMDfxMKHdGOnBSJ7Uv4EGY/vwhopX6T88Lp7dLNAjUX4e/iiTxct/Ai
3MNreAtrIZJGBjM1oznEPwVmrSxwETBj5yBy+5+KV+jX7tu4PclVLYXYPPr8KUJJ
H/KSNu02wEThZ5oGe057bxmcE2Efj8Azj+mgJzqu9tYy+Scp89gjplsamUbpzcTK
KZ6ZPWKm9rVU2sZ+0FV/nyqfyhMK1Hjrht+jBFR+qtqRjbaXi7t3b16sHBIuOcKI
ycJw7jqNg3rgIohtdDGr/nPhpVH+cg==
=chlp
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
