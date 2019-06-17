Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D34E48648
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 16:58:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FA731727;
	Mon, 17 Jun 2019 16:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FA731727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560783523;
	bh=/Xfaar/Y6ouKO/A6k+XAgbaNyZHpJRJkh2OhMHERbDk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JVUx9pYU351ll/M7BP/pljHIfyHO/R+Ocqw1tS+uLqWonyTDPtbKThv1jqqtldhtX
	 7uHzE0BNcjgOuomy7nc5zZCo3/2kkE2k+yyWrOj023tY5Vr1GRnF+AKJYK2XzqWrQr
	 la+U7QrcICiJm7nkH8+CNJZ7MgP/KY6gJ/EVNBag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91EAEF8075C;
	Mon, 17 Jun 2019 16:56:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFE68F896C7; Mon, 17 Jun 2019 16:56:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EE29F80764
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 16:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE29F80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="p0siBZN6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wSZVFoXXA9VznjmlzJhQDN4bJXX4kPrS+kisWxProTE=; b=p0siBZN6TTz9U9trmfZ8+2XP5
 ZtHi1jd5JKXGAR8xDa6Ajo07mFiYaHqv99wSFqknauJlVtCuiXqL/rM0mZaWsgpkZJbOuzFRjkYS6
 i5bwsXmkwRne1bT++Ecvh0XxMIna9AgjKGXU2BJctIWm+azw1H9q3Ft4c7lmcEZFbQ8V4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hct3y-0001rr-N4; Mon, 17 Jun 2019 14:56:50 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 2C1A8440046; Mon, 17 Jun 2019 15:56:50 +0100 (BST)
Date: Mon, 17 Jun 2019 15:56:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Message-ID: <20190617145650.GS5316@sirena.org.uk>
References: <20190617035526.85310-1-yuhsuan@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190617035526.85310-1-yuhsuan@chromium.org>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jon Hunter <jonathanh@nvidia.com>, dgreid@chromium.org, cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH v5] ASoC: max98090: remove 24-bit format
 support if RJ is 0
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
Content-Type: multipart/mixed; boundary="===============0758305200227211716=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0758305200227211716==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EDQ/wMYGX5nr2pOQ"
Content-Disposition: inline


--EDQ/wMYGX5nr2pOQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2019 at 11:55:26AM +0800, Yu-Hsuan Hsu wrote:

> +	/*
> +	 * When TDM = 0, remove 24-bit format support if it is not in right
> +	 * justified mode.
> +	 */
> +	if (!max98090->tdm_slots &&
> +		(fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J) {
> +		substream->runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
> +		snd_pcm_hw_constraint_msbits(substream->runtime, 0, 16, 16);
> +	}

Do you need both the addition of constraints and the one way
modification of the formats here?  Also the indentation is messed up
which makes things hard to read, the second line of the conditional is
aligned with the contents of the if block.

--EDQ/wMYGX5nr2pOQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HqjEACgkQJNaLcl1U
h9DdJgf/bo+F60U/71HCEMfPhkQogg7oTTvWn/LCTQqrC6hilrPo9g/nkRR62SXa
weDewr+wLKzBnuF89pNEzWkLXzSjVfaNZTb33kHwufVmHasqM+6czV2N92xaPdyM
0rI39R0ruvqol6My31Xtwb/KwUfcKDD4RS7dyYnEfLsy1btrFiNXNJPYui3KjTvp
rEUskwmv8gJSyZc/BPWwkSUZJ11bm2Bge8y/0887UddrwvQDC3jNIVCIygnph8hz
INIaDDlVTiMPBJtkL8gustEiXstjZXANwnR36bTe1zWYH94tBuI76FsoXwR+n/F0
kOn+Gs+TTzzzT8YM42fIkGS4a4hQsw==
=yS7N
-----END PGP SIGNATURE-----

--EDQ/wMYGX5nr2pOQ--

--===============0758305200227211716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0758305200227211716==--
