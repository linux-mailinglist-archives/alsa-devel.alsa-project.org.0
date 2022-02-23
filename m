Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C21DE4C1A20
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 18:46:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52AA11959;
	Wed, 23 Feb 2022 18:45:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52AA11959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645638386;
	bh=1r9SfSx7/nO9MV6j5ddvX/n3LarVOe+sjHrIT6ZK9fA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YGnLz4JjOAwwMqIJB6GyEtjqpM1adDF9yb3cuTnr5jAPtoDpaI1ToI4kALE7Wk4eW
	 sLv+z92M+gf+Y92cOE+zMbYOahOHhox+LCvMl2T6KfpmoMLdv1i6DWFEQ9xBBmOQLw
	 nLulEx0tZ3ePmIqANXeRwRG9ajNlaLxe/boAPTuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70EFFF8025D;
	Wed, 23 Feb 2022 18:45:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B990DF80237; Wed, 23 Feb 2022 18:45:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 155A9F80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 18:45:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 155A9F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VVBkCk7w"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A136760EF1;
 Wed, 23 Feb 2022 17:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB1EC340EF;
 Wed, 23 Feb 2022 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645638310;
 bh=1r9SfSx7/nO9MV6j5ddvX/n3LarVOe+sjHrIT6ZK9fA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VVBkCk7w/c4DZVbeBicjFjK5olhg87LsvDpdxtSV11yKd8ELyw4uWw3wLS20jFKte
 e1ME+a8aaC0c73K9bRmen1AFPBg0fpNUCoo2yjZDl8koygGXGGjdzJ56v+jkp5YleB
 NvFxzo3wkzF2vw0E2IexCTK4LZppG5bFOeM7zEuIza45c1+9SvBqPntPD1tAq4Xn3I
 wDpxUiloXysvO7piilxpfnjpbgRI3WiTO5wIAPTy11vUvs1wW1+X2AwzS6uNp98UxO
 AqvHyCUOf1nFyKrRUTwD9l/puj0h0dLVDVeBGw3coh3qOIK7cpY+00385iV4K8oGLw
 aZnVXv2GPdXJg==
Date: Wed, 23 Feb 2022 17:45:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v15 01/10] ASoC: qcom: SC7280: Update config for building
 codec dma drivers
Message-ID: <YhZynroGqrGZXeek@sirena.org.uk>
References: <1645630745-25051-1-git-send-email-quic_srivasam@quicinc.com>
 <1645630745-25051-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BgxGnRv0ITTKSGV7"
Content-Disposition: inline
In-Reply-To: <1645630745-25051-2-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: I smell a wumpus.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 rohitkr@codeaurora.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 quic_plai@quicinc.com, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--BgxGnRv0ITTKSGV7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 23, 2022 at 09:08:56PM +0530, Srinivasa Rao Mandadapu wrote:

> +snd-soc-lpass-cdc-dma-objs := lpass-cdc-dma.o
>  snd-soc-lpass-hdmi-objs := lpass-hdmi.o
>  snd-soc-lpass-platform-objs := lpass-platform.o
>  snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
>  snd-soc-lpass-apq8016-objs := lpass-apq8016.o
>  snd-soc-lpass-sc7180-objs := lpass-sc7180.o
> +snd-soc-lpass-sc7280-objs := lpass-sc7280.o

This will break the build given that neither of these source files are
present yet?

--BgxGnRv0ITTKSGV7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIWcp0ACgkQJNaLcl1U
h9CNAgf/fgT85WLXUxvPTW+bdBxpXXG4xGbT3a/xOpeZwtb9IGS8T8CEhrNyMMUy
M3Hugbmecjtc9uJkjidtB6gtcdDfSBdBndnS2a0GrbHUxF64xHsa5D/Af3zVVXzo
UgS4RSolole5NP1bZbCBLtp0PHiAqpEezwCNX46YPjtOyF+Z7Tq1hwJv6tI1DLda
t1lVDT3nN601EguQf/A0nzZXl7Iu0868+Eln49TGhVSHibUt3qE5w2kDSiElaWQ9
D8Dx/MhzXIAu7aQc9nsMHAa2xGX/7nEFdNmWMRFAT060DjaWFCAqvAade9y3HUGI
rSPDjjvk7U0+l+xqc9V/1Axp/NZSbg==
=LxWV
-----END PGP SIGNATURE-----

--BgxGnRv0ITTKSGV7--
