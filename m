Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 007768C1C6
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 22:00:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E095167A;
	Tue, 13 Aug 2019 21:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E095167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565726396;
	bh=s2Clk3CIcn2ILDMKIUI0jGQX9KdnvHnMK7qSKjfNdDw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Plh5wh9tkB+V7cGDyqvElB/ZWuJ9SsLiy1uk71NAM9d8z4VjVaVYFyak/D/ihB7jP
	 /uMYr9/SE01nBERHlnPCZERnx/1Ma2Xg+e5B+tca0lcxiNTolQvPIJ6iY60QEKJrF0
	 eZibjhmLvNpHgXoDt6uTAm6GbDR5GgCjtI2OZi7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D53DDF8026A;
	Tue, 13 Aug 2019 21:58:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D16E9F80273; Tue, 13 Aug 2019 21:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A383F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 21:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A383F80120
Received: by mail-wm1-f97.google.com with SMTP id g67so2493174wme.1
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 12:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X82eQ3JesOlbLJhrRrufAi8tlKQch8wVXL6Dn+B2NqY=;
 b=doLZe6JTz48UuXPayXORIkm74MYppWCkho9TB5T2AlzEuKGGYUbTDlPDehQR8I4vWN
 AWFimSuP0YkV+uX3yOBPOjPK92g1n330ae1n+wjou6/+dyrMaSEFmD009gkuq4kcp6EW
 gfvMhaOg8TmvsS8dAohXiqs2Yny3W4tNlnmFNTm5PtdX9fNhgK9aiESz/EtN65H5tlmC
 LwFF14bLvarMIyeogLUDQPyrnIxWOF0YNFEsdfZKZhkF5iyEMBRYtbZYxnRQAaOg8+9C
 rozO3ej+DSJoOhRnQXhxJqQyjUvnCuL2qOZ2zFpzTlJd9Di1yDROenOFCSTPhp3mJ2Dc
 uBzw==
X-Gm-Message-State: APjAAAXfUCQxlMxg7NADjA6pyoEc3er+E8MO/0LVPxoduKE07R3gldnz
 RKPPHMmi59ipFXqXP5rTsZRkErhgok7R/ju7yGNO9BBW/EB31Hr5rQVdrVRP9LnRzA==
X-Google-Smtp-Source: APXvYqxon/uIKJW/6DSkZ8aDwhMWpVie1mmPg+IR6ytDM3UjTwfMbi1b1iVaauIXbL6K4CEGs+8TGRrQW6+T
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr4521112wmd.34.1565726285375; 
 Tue, 13 Aug 2019 12:58:05 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id q2sm1475349wre.51.2019.08.13.12.58.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 12:58:05 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxcvl-0001Al-5G; Tue, 13 Aug 2019 19:58:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A97052742B44; Tue, 13 Aug 2019 20:58:04 +0100 (BST)
Date: Tue, 13 Aug 2019 20:58:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190813195804.GL5093@sirena.co.uk>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
 <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
 <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
 <f0228cb4-0a6f-17f3-fe03-9be7f5f2e59d@linux.intel.com>
 <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
X-Cookie: Poverty begins at home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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
Content-Type: multipart/mixed; boundary="===============2763926679098538496=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2763926679098538496==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k1BdFSKqAqVdu8k/"
Content-Disposition: inline


--k1BdFSKqAqVdu8k/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2019 at 02:38:53PM -0500, Pierre-Louis Bossart wrote:

> Indeed. I don't have a full understanding of that part to be honest, nor why
> we need something SoundWire-specific. We already abused the set_tdm_slot API
> to store an HDaudio stream, now we have a rather confusing stream
> information for SoundWire and I have about 3 other 'stream' contexts in
> SOF... I am still doing basic cleanups but this has been on my radar for a
> while.

There is something to be said for not abusing the TDM slot API if it can
make things clearer by using bus-idiomatic mechanisms, but it does mean
everything needs to know about each individual bus :/ .

--k1BdFSKqAqVdu8k/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1TFksACgkQJNaLcl1U
h9BHfQgAhhh0D7Hg5E7dHFAw9gfqCTOCQFEV16Tm0f23eAZ2yPanGpNNC0hohDnH
y77jzS/Zh0WxkcN5gH7rQI0bTrbDVeZpQd0+Wo1egQK9eqfVkjZi+gE2O8v/VjCW
Hcou9+7P7205uP/LB7vuMzVbhKpTF4fPpbhIuJ44MV39BO+sQ+nptMl4ialTd/Y2
kjLdoCl/v6TIAY3GztKKmOvUo58xPak85st45COal2f5bUIBbKxs1Ss/x8VMSPlE
OvPxl5aUzKuFFiVXGekHr+hR/INMri9LWuBQpqrTatdyS0P2p/Sc/r9oNzrl8z+7
PKRpKAk3EYaOsSo49DWaJw3wREGyqQ==
=REil
-----END PGP SIGNATURE-----

--k1BdFSKqAqVdu8k/--

--===============2763926679098538496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2763926679098538496==--
