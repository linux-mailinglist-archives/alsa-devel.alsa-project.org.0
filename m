Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967F2554A4D
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 14:48:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E3CD1DFE;
	Wed, 22 Jun 2022 14:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E3CD1DFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655902083;
	bh=/JpW+MAHG6QANCQr3Dhf2Dft36ErEiGWlnr8flDHyx4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DcH8Xua7ZLHZ4cNRmmYJ8hnGDkT8UPHvdxp9tWgF6JcF3WYAx7q0+kZ1qh/jldnMa
	 Ne5Q4iU1RpPYUvEbspyiJBH7H7jBsB4LszIfnROpzkJ4AO/abVd+oO+3YUt2ZjVnox
	 jntorZIgQJCw52Lh+60yxyy3IYx7dCbHHtm3L9K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F20BF800CB;
	Wed, 22 Jun 2022 14:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64804F800CB; Wed, 22 Jun 2022 14:47:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C95AEF80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 14:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C95AEF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UXKN57sG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 69E4BCE1F90;
 Wed, 22 Jun 2022 12:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C52CC34114;
 Wed, 22 Jun 2022 12:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655902012;
 bh=/JpW+MAHG6QANCQr3Dhf2Dft36ErEiGWlnr8flDHyx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UXKN57sGJH8mvMvKBd9DwnAWiSGlnl3txMLFktjIqifSztLXkACZQk3EW0IXqVRIe
 2KnTRFlA1ZO9z8bMCU1Q6E2lIQrDHBb4ejyk/l4lxy0DoAGHDz0YJSgG+pG406CQS8
 a8T/Ci1ODscDlnjiMkSDCONDCjYyWf4z4AiiUUU0eaZAqL2EVeV33dD0COgsAI4YUg
 YMIr25VPmVPA7uikrS0LRAgRwss5XUZDD2np98dJlNOI8tXE4Yn/sBnd1dEmCrfbL4
 fV512pxos0Crfdq8aLqCz5A6qLhkUBEISIVmHpYxBQJyq63aBvYjEXmgHtdk+ozF7q
 ifjVTHNRDE2QA==
Date: Wed, 22 Jun 2022 13:46:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH 1/2] ASoC: google: dt-bindings: Update
 sc7280-audioreach-herobrine compatible name
Message-ID: <YrMPNpE+RWIZP372@sirena.org.uk>
References: <1655892799-29641-1-git-send-email-quic_srivasam@quicinc.com>
 <1655892799-29641-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vKK8oBS2+ubOpulY"
Content-Disposition: inline
In-Reply-To: <1655892799-29641-2-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: Truckers welcome.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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


--vKK8oBS2+ubOpulY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 22, 2022 at 03:43:18PM +0530, Srinivasa Rao Mandadapu wrote:
> Update audioreach based compatible string for sc7280 based ADSP enabled
> platforms.

>    compatible:
>      enum:
>        - google,sc7280-herobrine
> +      - google,sc7280-audioreach-herobrine

Isn't the DSP firmware selection a purely software one?

--vKK8oBS2+ubOpulY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKzDzUACgkQJNaLcl1U
h9Cq9Qf/XODQj9ijI4XCvV7JMPgGqnBmpV961ywot0AgWRVTxh+vn1mYXulQq/YU
/NJgVpeyp/+JHvSX7IRr+HpbmaSWp9Yu+GfroD8P47PyceQ+7TEHU4CM7QdxeOAU
bBonT5ukV9nRtaREKW4nKjhTdzGkSa84o3k2zMVUB+1S02LyilDEpQNQ7SrYrJeQ
zIuArN368oSuNYKelxjViqp0knxVQ40YBo8ib6Z749YCtBZCGYDJXUvur722XJ/t
VQPqMf00GufWgH1esQVoVUOJmO9S9WsmO/zj9SHXHFvGMF3BPj9fpy1YVeS1a4vr
cZpjmtLdGdzCiim7L0OmcyB6Ky4jRg==
=wlSz
-----END PGP SIGNATURE-----

--vKK8oBS2+ubOpulY--
