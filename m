Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 214805EE136
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 18:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7320382B;
	Wed, 28 Sep 2022 18:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7320382B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664381287;
	bh=yR40IyiKNghcwozl5s4qZL70bzhELlgHqRQpLqph6PE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mlVRhBGthKs26fvKjf0MP+YWXvOgCij5OH5xyGFcpi8Ac746sVfqpRcvK0bzUyFac
	 LG1jl+Ulu3oaRfE6dteJvKsPaijNa+IqSf0x3HECc/unIbULRAQrHdQTyVWcaMQwkM
	 sPOWRtUDgvYxX6SkGFEjG/tzDnWYFuaDUJu6NORU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D88CAF804B3;
	Wed, 28 Sep 2022 18:07:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 447D8F80310; Wed, 28 Sep 2022 18:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04053F80109
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 18:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04053F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q8FqFRW6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B8DF9CE1F13;
 Wed, 28 Sep 2022 16:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5A6C433D6;
 Wed, 28 Sep 2022 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664381220;
 bh=yR40IyiKNghcwozl5s4qZL70bzhELlgHqRQpLqph6PE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q8FqFRW6g9N8kJ4CKlga6Su7lex28H8npg4J8QOM3iF4T86T5r/gU1LWisnRwiLAs
 engUFgZgzTE8VpBC+t+8FiRqzYna2BvSXnpmFfb16aZVzYlKzoMqFYzgStykyP1UjY
 kUCBDKIoHTmrbP5rUN4myZsf/Hoq4nLP2NCOd+7Z5iW4Vt4/gePNAStajpZPp4ubk3
 iPrIGFmKjPqxqfvAjrChG8bgRbtl5Zt+rqbvpSkYeAkn4gmrMgHO0f3duLBhPBlONr
 4fN1p5P/wQzpLTaNKS8Eo1O7tNwdRXGJpXiSJyAhx4pLZWL/Wcvx48xvLUPiyrCV/b
 GRgxClZQTy48w==
Date: Wed, 28 Sep 2022 17:06:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH -next 2/4] ASoC: wm5110: Fix PM disable depth imbalance
 in wm5110_probe
Message-ID: <YzRxHjYeWvZF6eLW@sirena.org.uk>
References: <20220928160116.125020-1-zhangqilong3@huawei.com>
 <20220928160116.125020-3-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="shKddTOcU1EEaNy6"
Content-Disposition: inline
In-Reply-To: <20220928160116.125020-3-zhangqilong3@huawei.com>
X-Cookie: You look tired.
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com
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


--shKddTOcU1EEaNy6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 12:01:14AM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of wm5110_probe.

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

--shKddTOcU1EEaNy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM0cR0ACgkQJNaLcl1U
h9ARKgf/XT+YEn5Jf/8OTfDyxC1ZZM2eH/2FjIo/2Ft11x0up6D3/PB//lgfo2OE
3mgpLNN5tdCHrBZTK7mccNaByUPe2hlozWKz3qNAhmjMnKsYQCsUrqcS6pwQxzBt
DVx7TSPbywHG+Bey0otce8BhZDe9mkHLvruPnDF7GMGhDFhcYVAHSjfZHvTKvogD
fD1VyKZVzTjP17u3njFVcyQBkHUTCHtcRftqNaByfT9rmGxTBwuk1ULIhZc+N+Mr
D9fCbPxVWQ6MkfVQ6y0VmLviyJM+eohDpSSW5Dt8LEqMz4aWbSGWhPVYsM1GOG5b
5My9wrwmHlpJ5vAf8ws0eH0Aev14+g==
=zqUB
-----END PGP SIGNATURE-----

--shKddTOcU1EEaNy6--
