Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4407C4B28E6
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 16:16:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D45D9191B;
	Fri, 11 Feb 2022 16:15:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D45D9191B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644592593;
	bh=IBFj2X+hcyPR39ZMQ3rlleTF8vNjd5w2MnpIK3BBRMY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iUKBNkKR4vdjo6BNE5wvIBrb6ciEO4f/UgjzQHiPqER5cfGwk/DdT7saEM5ad1FMW
	 fZBLV9thcmcs2qSgy+FXaqBXUBQWIEqDqRcAmoLL8XCgsFwVKMxKpKvJoVnf6tBV4k
	 2OvNgKPMievUgeKzytp8c4aRruNb/iFsIB8oXgCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE3CF8012C;
	Fri, 11 Feb 2022 16:15:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85BD8F80139; Fri, 11 Feb 2022 16:15:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37353F80054
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 16:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37353F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MmGCHoL2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B131461FE5;
 Fri, 11 Feb 2022 15:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D12EC340E9;
 Fri, 11 Feb 2022 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644592519;
 bh=IBFj2X+hcyPR39ZMQ3rlleTF8vNjd5w2MnpIK3BBRMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MmGCHoL2jBqJx8fSZnFJir8mkhPKSgxt2JUHRSn60wV1qepXUXKX5nrall0vTrbG6
 b/4Kyddinm/0jrcIJnuDm/pPNxU2mm0I3mbiSPOQX80EEtFmpeLDb7b8vLPKk3s/Ro
 GKEDYUaWCIpvV3t4nrNROIi6XxRbm0NC9G/eyxfe+7FSsM8lOaTMH4SThmDZoM7pc/
 XikLLCFV3CnMYX1CqbZm0O6V79kllMYeXpgsHA5Hcfx5KUOSJfNJI2bsow6rSTEjel
 dLIwQcvks95mIbWaUlz2dw3PpzeUZbmP/8ZLz6gDeCZ9gqYi9pJZQ+kLVQxoE7fpwE
 LvfbdduK+f4FQ==
Date: Fri, 11 Feb 2022 15:15:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 05/15] ASoC: mediatek: mt8186: support hw gain in
 platform driver
Message-ID: <YgZ9gadN8RksWeWN@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-6-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c+ZpsOQ7A1I9zFvP"
Content-Disposition: inline
In-Reply-To: <20220211103818.8266-6-jiaxin.yu@mediatek.com>
X-Cookie: do {
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


--c+ZpsOQ7A1I9zFvP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:08PM +0800, Jiaxin Yu wrote:

Again, mostly looks good just some minor issues (I've not repeated some
that applied to the prior code):

> +static const struct snd_kcontrol_new mtk_hw_gain2_in_ch1_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN15,
> +				    I_ADDA_UL_CH1, 1, 0),
> +};

These end up as regular user visible controls so should have standard
control names - in this case ending in Switch since it's a simple
on/off.  A similar issue was there in the earlier patches.

> +static const struct snd_kcontrol_new mtk_hw_gain_controls[] = {
> +	SOC_SINGLE("HW Gain 1", AFE_GAIN1_CON1,
> +		   GAIN1_TARGET_SFT, GAIN1_TARGET_MASK, 0),
> +	SOC_SINGLE("HW Gain 2", AFE_GAIN2_CON1,
> +		   GAIN2_TARGET_SFT, GAIN2_TARGET_MASK, 0),

These should have standard names like "HW 1 Volume" so userspace has a
better idea how to display them.

--c+ZpsOQ7A1I9zFvP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGfYAACgkQJNaLcl1U
h9Ct/Af/SB+lHd2ZvAn42VmwpobHVEpUjwZsElRbAQHPqUKPY43uoQ75NXOvyRQS
HLaoNrQ0kkAVtNBtcolPvRac1ke9kTDEapfuhrUuv4QrgtdgRG3N6bL+m+dyQ6g5
33pIVvYTByz9HsJbzdSFqP527RJqmIUMGucj/p91edb9vTx/SEUZSuj6qqlohr2h
eVoa/P+QCK9bs29/EAD3HmucuJispsMgmntjOE9sYcGFmMDydZSHmyBozPDUuEJ0
S/8o/RVRY7h/KFKLAcc6+kSH4SctBryW4lXtdbZzueBFSefbMzjcHePyeJ0qox5N
Xa9RTpXYvvkNT7fsmvi3+zf0sBZGrw==
=22jY
-----END PGP SIGNATURE-----

--c+ZpsOQ7A1I9zFvP--
