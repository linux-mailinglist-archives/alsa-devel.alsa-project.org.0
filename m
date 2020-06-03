Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B2F1ECE68
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 13:32:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C4BF1676;
	Wed,  3 Jun 2020 13:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C4BF1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591183970;
	bh=gM5y3C32ED1XSw4KgaZ6/TuCIlt4f+Y+Lfe6pcm+aas=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FiTW4mGUypisCYDejKXz4kKRgHdbhmwZmtYDfBWAgoQkC82NS0XaR5tS4cojGf9QN
	 j5VHrhFMRGdwBS37wJ4M5wDNRrzEUdvivnCUOdIvwS31CsMIQ+Kr3vJ8ZkGvZQBvN8
	 cv4T66EromKVWP5mXDNumYWMQapqcVJoWIEDWLLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 174FAF801F5;
	Wed,  3 Jun 2020 13:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 635E0F801F5; Wed,  3 Jun 2020 13:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77A52F80212
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 13:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A52F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B9IrNHP1"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD93C20679;
 Wed,  3 Jun 2020 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591183907;
 bh=gM5y3C32ED1XSw4KgaZ6/TuCIlt4f+Y+Lfe6pcm+aas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9IrNHP1AzzYH1IFahskpuLNaeFg7oWTsN6QM57NRZ1Lpl8Dmr8iQt2UcVkjEeBVA
 pYY8BOpBRBN1rfFZyh8q6WaR/F++FmHyTAzrembzuJUx/8/7b4z/ETXJOfqUofCban
 ixPqDENdgKMszly1ZKo17csizywvQNvhn4+Icjt0=
Date: Wed, 3 Jun 2020 12:31:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <steves.lee@maximintegrated.com>
Subject: Re: [PATCH] ASoC: max98390: Fix potential crash during param fw
 loading
Message-ID: <20200603113145.GC5327@sirena.org.uk>
References: <20200603111819.5824-1-steves.lee@maximintegrated.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline
In-Reply-To: <20200603111819.5824-1-steves.lee@maximintegrated.com>
X-Cookie: Your supervisor is thinking about you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, ryan.lee.maxim@gmail.com,
 ckeepax@opensource.cirrus.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 krzk@kernel.org, lgirdwood@gmail.com, nuno.sa@analog.com, geert@linux-m68k.org,
 dmurphy@ti.com, shumingf@realtek.com, srinivas.kandagatla@linaro.org,
 rf@opensource.wolfsonmicro.com
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


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2020 at 08:18:19PM +0900, Steve Lee wrote:

> +	param_start_addr = (dsm_param[0] & 0xff) | (dsm_param[1] & 0xff) << 8;
> +	param_size = (dsm_param[2] & 0xff) | (dsm_param[3] & 0xff) << 8;
> +	if (param_size > MAX98390_DSM_PARAM_MAX_SIZE ||
> +		param_start_addr < DSM_STBASS_HPF_B0_BYTE0) {
> +		dev_err(component->dev,
> +			"param fw is invalid.\n");
> +		goto err_alloc;
> +	}

This is now reading the size out of the header of the file which is good
but it should also validate that the file is big enough to have this
much data in it, otherwise it's possible to read beyond the end of the
firmware file (eg, if it got truncated somehow).  Previously the code
used the size of the file read from disk so that wasn't an issue.

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7XiiAACgkQJNaLcl1U
h9BWzQf/caANAxCS61zFk2A9ang2ns0xTLILhZ3lBoZYjNRa6FOl5piohx/OBPt7
3qFtraruHxJAimWKqf0ms2LasyxtPhYAUr7NvkTw3eNjVgMIe32eRP8QPY/mJ2D+
7kg4NLYxWgoTUQHPJWc4OJ7jwHAsemal+6l+t+m5ndUZOgDGcFhP82QrSYa4j+A1
YVXt/8Kbh3MUjHp+ydjBpOeEjy9c2AdCCqX0B/Ul3z1OjuS6+20UzlbsUCGw0roP
JUg3e68SzJmRqUroBF/YSRD9skx77tMqvrGTHNKXC/XIO7r0L7IdDgRIjD3ETe7a
zOwynkWzaydw+v4kmWb0sNfBuIGeoA==
=leSn
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
