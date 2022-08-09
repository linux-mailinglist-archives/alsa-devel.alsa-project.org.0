Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AC258D8F7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 14:54:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3B5C82A;
	Tue,  9 Aug 2022 14:53:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3B5C82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660049682;
	bh=RO8QNjV+ZI2V2jAgzJmmiJ2UN0NUi71ou+QAg30SrPg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L4kbUio1D9axShcdnmOviR2FrxKtosvav3Ix2CX7ek1agfisfoQwjeOPQcb/K7Swd
	 ADzyKXpNIVaacibkb77TqdtiW1GGszXiIgMzCP/YvVcAi4lToULlnIZFU33Gb433Z/
	 XEK6rl0ZTVFZdrRPnzL9ztvvBpepbg4qxQgQqiHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A004F80132;
	Tue,  9 Aug 2022 14:53:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 934A4F80132; Tue,  9 Aug 2022 14:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F405F80132
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 14:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F405F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ShfPRLho"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 08577CE0ACF;
 Tue,  9 Aug 2022 12:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B471EC433C1;
 Tue,  9 Aug 2022 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660049613;
 bh=RO8QNjV+ZI2V2jAgzJmmiJ2UN0NUi71ou+QAg30SrPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ShfPRLhoVWkdr2fHT1Gx+vd41mCniz5Iq1xdabVC5BzeCgj5KzKFNpKG0piv/M4Xp
 VbR8vTd0dNJIfEAAXOqGeBPTOAjI5dE/4uh2T7JPQ3h1wkiCrg4e2runTj1YcCLkPR
 1HIddGfVB56pHohtngGNX/Qc40/uhWlUVHBOgIb8deKUX25z6OnaZBtMsSRkXuTJyp
 2Jvhv0nGWi1YKgRn27BPJMrv+i3HBZq2k0i9H1JPqHjN/JGxEcEhnpnnRLKjciEdnz
 72kzi6bsKYLeIKEg9Zv+dxtb+hVcAE3N4lSnFtnvfV58OH5ZhSZrlhtwxHqNEkj6wA
 FDXeR1l5i9NTw==
Date: Tue, 9 Aug 2022 13:53:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Matt Flax <flatmax@flatmax.com>
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <YvJYyTggHxDFeFze@sirena.org.uk>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+iaHl+9cIbiNfDbD"
Content-Disposition: inline
In-Reply-To: <20220808214028.2502801-1-flatmax@flatmax.com>
X-Cookie: A nuclear war can ruin your whole day.
Cc: alsa-devel@alsa-project.org
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


--+iaHl+9cIbiNfDbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 09, 2022 at 07:40:28AM +1000, Matt Flax wrote:

>     * Documented the devicetree binding

The DT binding needs to be a separate patch CCed to the DT
maintainers...

> index 000000000000..f8d845d42f42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/src4xxx.txt
> @@ -0,0 +1,20 @@
> +Texas Instruments src4392 DT bindings

...and new DT bindings need to be in YAML format.

> +++ b/sound/soc/codecs/src4xxx-i2c.c
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Driver for SRC4XXX codecs

Please make the entire comment a *C++* one - the SPDX bit needs to be
C++ so the rest of it should be.

> +/* SRC attenuation */
> +static const DECLARE_TLV_DB_SCALE(src_tlv, -12750, 50, 0);
> +
> +static const struct snd_kcontrol_new src4xxx_controls[] = {
> +	SOC_DOUBLE_R_TLV("SRC vol",
> +		SRC4XXX_SCR_CTL_30, SRC4XXX_SCR_CTL_31, 0, 255, 1, src_tlv),
> +};

Volume controls need to end in Volume.  You should run the mixer-test
kselftest against a card with this driver, it should spot problems like
this.

> +	switch (dai->id) {
> +	case SRC4XXX_PORTB:
> +		reg = SRC4XXX_PORTB_CTL_06;
> +		break;
> +	default:
> +		reg = SRC4XXX_PORTA_CTL_04;
> +	}

Missing break in the default case.

> +					SRC4XXX_MCLK_DIV_MASK, val);
> +	} else
> +		dev_info(dai->dev, "not setting up MCLK as not master\n");
> +

{ } on both sides or neither of the else please.

--+iaHl+9cIbiNfDbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLyWMgACgkQJNaLcl1U
h9CHWAf/S6VHHW3AbUEkF1DgbOdWwkKbd4SwKHKHCOsebLD8Rh+VWPMhSCs1tpf5
c2r1teFOxs0IJs/r3Bp+Lts/N3OUpTTmj7rCg13FbpvOMa0E/SbOBVquzVFODZq2
xISDy/CFJBqQhDwp3XztiG1OWIOAPv+S5lwoVJxgQSDcDSNp+uBErCzvBjZ3Zp5V
05s6hZLSVXwFr0lrFvZAsxrZZGyPOYE72k8EVwKGDj4cnHpEhcN+r8QqPgaNNsi5
jYl+G5xywFtmztxIxibRJaH8i5CiGykcvs8RdcGXU7mR9tBKlftjslJVsOFPKrGX
JRc2NHqcdSbSV1vhkxOVNdrnXVno9w==
=fRUJ
-----END PGP SIGNATURE-----

--+iaHl+9cIbiNfDbD--
