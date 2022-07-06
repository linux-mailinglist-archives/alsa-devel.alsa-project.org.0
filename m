Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C94E9568901
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 15:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA161640;
	Wed,  6 Jul 2022 15:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA161640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657112942;
	bh=IJtDiQq5oZrzCsJMVdMruee3ZZMCVIpbgVe9plawQog=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z5JSQVdkyTHF9lGvTeln7KHcNcy2E+vzLMg0C0vVr0fTn0OQx6HjajtBCHSv3dhBz
	 Xn5gzgUHvy5kM3Jm2kXYhfegaLRTsfLJ6bEuBrPy7n3vXsH8zhcNePYP3ECw/9jHxa
	 Ipp+1y8SoOOOx0OS+PlTv5EXwEaksmE4FvxXmhd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A15EF8012A;
	Wed,  6 Jul 2022 15:08:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C466BF8012A; Wed,  6 Jul 2022 15:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B75A7F8012A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 15:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B75A7F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XLjjhGXE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9148AB81CA6;
 Wed,  6 Jul 2022 13:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D95C341C0;
 Wed,  6 Jul 2022 13:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657112873;
 bh=IJtDiQq5oZrzCsJMVdMruee3ZZMCVIpbgVe9plawQog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLjjhGXEEsJJfQAu7dmLkd9Iz7Ru49i5on9KLJ139PVF31B/yFQVD0YlFn+jsdM9i
 akipGEeqX7VdeQVeyKzUtOcWW0mbEA+nbYdRAuDZ6PUfaylIQ2h9eMigC04SN1vK5E
 eMA2brj63a9E1n95hRvCtlErGSch1o2QppmlbH6RU4COAoLN44HiraHB7wAF5gCiQd
 gh2u+YFDNplVOFvWHZvrGDoTmvDy1kwCtoYqxinNMmU8GW3S0vittYdWGYik/LUHQU
 aL3A2WaFnHyvPORrG0I9jYUaz35IqPYLQ/hQaTaIRUpP1idaL5rxxSHTi2vemCHLHK
 ioR3+vV55u/zA==
Date: Wed, 6 Jul 2022 14:07:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v2] add tas2780
Message-ID: <YsWJJHFb5IeipN9x@sirena.org.uk>
References: <20220706095721.18974-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uVTjtFXKtYrFyOKV"
Content-Disposition: inline
In-Reply-To: <20220706095721.18974-1-13691752556@139.com>
X-Cookie: Only God can make random selections.
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com
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


--uVTjtFXKtYrFyOKV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 06, 2022 at 05:57:21PM +0800, Raphael-Xu wrote:

> +	snd_soc_component_write(tas2780->component, TAS2780_SW_RST,
> +				TAS2780_RST);
> +	if (ret) {
> +		dev_err(tas2780->dev,
> +			"%s:errCode:0x%x Reset error!\n",
> +			__func__, ret);

That's still a very strange style of logging for the kernel.

> +		snd_soc_dapm_to_component(w->dapm);
> +	struct tas2780_priv *tas2780 =
> +		snd_soc_component_get_drvdata(component);
> +	int ret = 0;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		ret = snd_soc_component_update_bits(component,
> +			TAS2780_CLK_CFG, TAS2780_CLK_CFG_MASK,
> +			TAS2780_CLK_CFG_ENABLE);
> +		break;
> +	default:
> +		dev_err(tas2780->dev, "Unsupported event\n");
> +		ret = -EINVAL;
> +	}
> +	if (ret < 0) {

This will turn the clocks on the first time the DAC is turned on and I
can't see anything that ever turns them off again?  If it's sensible to
leave them on then it'd be simpler to just turn them on during probe and
then leave them on.

--uVTjtFXKtYrFyOKV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLFiSQACgkQJNaLcl1U
h9Bg3Qf+P/PQIWeGblR567fjE6CcgQJFJqs7XXFGEQb02manA2xgRay/A9NYUlJO
quOkIKHdsHyIGSubVbrL7EdYjXQG5FRyRctN0BrEz5AOM3f6LdAhFG0X3Br16odm
1gu0U59mmGzaQgWkqN+oxlWulG9Niq3l6jaXlOhkkYy0nTXPDPAqJJcz5wLToBBO
voivJynNtNbqBuGsC3mLuMeiWt93n/ef4YVzmKThQa20UY1puBB80mEOL8uQckGv
fQ8y5xZvnaAKZCnuovwoAuX6CbMekH0klt+sBhUjXTi4bJ1jhCJ+vBu8jrufvRUp
NrJJnJ525ljL8VhTmcjLleBXicljuQ==
=17ca
-----END PGP SIGNATURE-----

--uVTjtFXKtYrFyOKV--
