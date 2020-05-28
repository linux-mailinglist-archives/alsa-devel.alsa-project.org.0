Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E4B1E5E9A
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 13:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D301417D7;
	Thu, 28 May 2020 13:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D301417D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590666287;
	bh=dtzMfsSfVshidYNHSmPWv2FMnmJz2lCkiMLmmsPTSXY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R5k2Mpf+RMz6F6QaYmzjmm6ChErpH/FdpPLk2ketiEhdvaIrmb/0IJi7d0wkE5X5B
	 Puxz3Be6AXGF/WktBhAqbC80m99dtc0+o5D/cV7LRUvPjEW/BcuOor1CDX8oH3y4Yb
	 dPxq2EAkQx1OnAuHULITiFb8SWRP6K0AUZ6/vwdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D81C2F80107;
	Thu, 28 May 2020 13:43:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AAF6F800E4; Thu, 28 May 2020 13:43:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1049F800E4
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 13:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1049F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j1pHwIIn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 634702088E;
 Thu, 28 May 2020 11:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590666167;
 bh=dtzMfsSfVshidYNHSmPWv2FMnmJz2lCkiMLmmsPTSXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j1pHwIIn+7acJF4bQkizS5XEuTFfBr+LTUJEdErBiDqFlMp8zl1ncg9FX6AcbrKhp
 i7dXLLYiaSQ4B8pQsG3si4DEJAxH/LiqwT6LLkrID1UvfYt/qPUER8U4wMEKH0jW2+
 y2AxN3BvotPcF3rj6Qt7XBsqJP0lGxo3ug8zjKW4=
Date: Thu, 28 May 2020 12:42:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Akshu Agrawal <akshu.agrawal@amd.com>
Subject: Re: [v2] ASoC: AMD: Use mixer control to switch between DMICs
Message-ID: <20200528114245.GA3606@sirena.org.uk>
References: <20200528060242.24945-1-akshu.agrawal@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <20200528060242.24945-1-akshu.agrawal@amd.com>
X-Cookie: Small is beautiful.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 yuhsuan@chromium.org
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


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 11:32:30AM +0530, Akshu Agrawal wrote:

> @@ -307,6 +295,7 @@ static const struct snd_kcontrol_new acp3x_mc_controls[] = {
>  	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
>  	SOC_DAPM_PIN_SWITCH("Spk"),
>  	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +	SOC_SINGLE_BOOL_EXT("DMIC Switch", 0, dmic_get, dmic_set),

This now looks like a mute for the DMIC which is not accurate.  I really
do think this would be better as a mux, rather than labelling it with
positions on the case you could follow what other drivers do and label
it with the connections on the device.

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Po7QACgkQJNaLcl1U
h9COAgf+PoJVGILg2JFoP6A3vbP+3kX5PehTYV31b0PiK7XzhhNGQdb02C6Z597f
Caqhjgofozl7LyHsEetlNs0bxxrs6YMzmQqnKd+jQ4Fx8DfMvb2XwrWsIG+OluM6
7dQx832oXpfVcMre8toqfNk5//M8/AlVXl5a9jtgl3LZJ4MXg/jxUF153L/csVMN
Hch+BBKkgEW99XSrq9/WPGSIfHTLk0ZtBiqfk31oipkS5Gko2MKAiSNb2pwSMHsD
VcxnUB/XU0zWDDrQRYny6fRbBVvCvdDbNlggYDUMVlv1bbxqg7ubpzpgT6ifzHWt
Q5UsdEeMzVdFisKthaxyyPA4iEslrA==
=KuLc
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
