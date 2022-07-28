Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF58583C87
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 12:50:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33C42950;
	Thu, 28 Jul 2022 12:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33C42950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659005456;
	bh=c/xTkxRbWD4FTJsS0u1tXoSZ7j2nlmXNxawdaZwg6Ms=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kNzlZqRMx04EbmrtTfiBwvwIcHUWW1DHN4FWIwooKC0ty7iDkDLbSq11MCUqJEvCK
	 8zQ3BXAbuqJ4K1ssbCJbV+Re3/dGHCs5bEn0RYldF71U4nWmEAq1aEs3IqP9dT9yaJ
	 x6IFFdekiYb4wkZjT1GMxJvTf/UEIxeosr1YT+gY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A33AEF80508;
	Thu, 28 Jul 2022 12:49:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41172F800FA; Thu, 28 Jul 2022 12:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5C4BF800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 12:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5C4BF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EuPBj5Qb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52386B823DC;
 Thu, 28 Jul 2022 10:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB2EC433C1;
 Thu, 28 Jul 2022 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659005388;
 bh=c/xTkxRbWD4FTJsS0u1tXoSZ7j2nlmXNxawdaZwg6Ms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EuPBj5QbHdjkGUBWJJ6hQ+NZfpW65W+gjBZYMO5dwZGGQmnfViFK4YTJ0ScPf/18u
 grSS/ZSb2vZQfDw35zgn3xdME5hLtn2SXwjhpNZnm36TtD97k7iaQhyeUcRumDc4Oe
 YrJnFmvdtXlqPgx5sNI42r8uwYwKwT5af83+42LxTjuub/W9cUChEZGTVm/vg6vpWv
 E0DEOhLq3ZK6X6Dy6bgNn5nnZISii6PY+wEiqjvYL7x98SeebmzUY/xbgDxUYapiCJ
 Vi9I+7pBEPxKgCoc+jdEfKe0x6a0qlPoPVvTk/LkBIUGr8O0OV1xBnbSSBwLBgS1z9
 8r583cZ1J1MuQ==
Date: Thu, 28 Jul 2022 11:49:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: SC7280: Add support for external DMIC bias
 supply
Message-ID: <YuJpxSuPBB++pl/o@sirena.org.uk>
References: <1658992233-28372-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="19Amlz8gj2K5TooV"
Content-Disposition: inline
In-Reply-To: <1658992233-28372-1-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: People respond to people who respond.
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


--19Amlz8gj2K5TooV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 28, 2022 at 12:40:33PM +0530, Srinivasa Rao Mandadapu wrote:

> +static int sc7280_dmic_micbias(struct snd_soc_dapm_widget *w,

> +				struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_card *card = w->dapm->card;
> +	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
> +	int ret = 0;
> +

This is open coding SND_SOC_DAPM_REGULATOR_SUPPLY() isn't it?

--19Amlz8gj2K5TooV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLiacQACgkQJNaLcl1U
h9C81gf9Ga+tG1jtopYoO2vybAFTSEv9+weEyQYVfWYlV/dr54/mFfs5thvXdkQy
C4ZHp1P2Pvc0Zz21fKPITIZ/oUJvMHAFsUN1OvD5QDn9tXyn3QTYjnQvxuKYC9iF
QuwAqQClFBn+VdUNev78ZC8alwfezPpz3RfFVHg6gO22v9w+tsOe6YPeZYU915is
0jI/vXl4PYcb7PYgYp7k0Uyr7wdU8Ju6z9HqRC2KRhwasNRZjndt6XRfGF2QpybG
VOQtO49CDUOLxdDtNfC+hu25oeI4Hi+1WVVpHxmKtzLHlraQkbRf9C94jSyS75qa
4h/gpJnIHzoUwOmrWzLg3ZS8L/vGyA==
=k9u9
-----END PGP SIGNATURE-----

--19Amlz8gj2K5TooV--
