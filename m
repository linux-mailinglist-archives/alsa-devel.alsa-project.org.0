Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF561E7B53
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 13:11:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C20617B7;
	Fri, 29 May 2020 13:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C20617B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590750666;
	bh=bNs4Fp0Ooi+xfHhQ8BXp4A2WXIzoLKgHBPiDTBQ4BUg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qzlA+FRIne1MpymAYwIZpv/Yo8SDtq56UWSw29viPalrFsFKpEVEzlSuIeEQ+nto0
	 Lk6xy8Ir2vLpX7WsP5kadL1B1l6XSGjMDYOHLqvt9vojfgng2a2TFEek282IeASkIY
	 +h+xFcVh+fEMlMafolF6RITGHi8suqNA2kXpXHkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAC90F8016F;
	Fri, 29 May 2020 13:09:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE0F6F8014E; Fri, 29 May 2020 13:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 410FBF80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 13:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 410FBF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C1cE12Lr"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A1292074B;
 Fri, 29 May 2020 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590750558;
 bh=bNs4Fp0Ooi+xfHhQ8BXp4A2WXIzoLKgHBPiDTBQ4BUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C1cE12Lrdc/YrKo0DmHo/ufRLkXADE8la0AOb7Bwp8gFC4QmPr35agLnvnpbLxngn
 cTgy0Hk+Na707yQKdL05M3NWniNbQZOdU6DVlCPLift57F56RgRd71rL3slc3W1VaP
 Jv+9vAUe1fBnks/TB62lYrEQwu/oIzoP4t42r24c=
Date: Fri, 29 May 2020 12:09:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: support DMIC one-wire mode
Message-ID: <20200529110915.GH4610@sirena.org.uk>
References: <1590750293-12769-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QDd5rp1wjxlDmy9q"
Content-Disposition: inline
In-Reply-To: <1590750293-12769-1-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: hariprasad.kelam@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, howie.huang@mediatek.com, lgirdwood@gmail.com,
 tiwai@suse.com, tzungbi@google.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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


--QDd5rp1wjxlDmy9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 07:04:53PM +0800, Jiaxin Yu wrote:
> Supports DMIC one-wire mode. Adds a mixer control to enable and disable.

What is DMIC one wire mode?  This doesn't sound like something I'd
expect to vary at runtime.

--QDd5rp1wjxlDmy9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Q7VoACgkQJNaLcl1U
h9DwIQf/QoUXcR5znRfl1nQpP4QTwnoPi7CPIFAYYQv475mekxLBWIopRSwlj19A
kwQRFL85PeTib/Pngyr5KhcHjyDqURrVmuCRgO+8dtEXcq8RVYVo0J/tSSMcYtKw
bNpDZKkp98v+uMHgY5ldvoscyTMC/hFjsN9c31bMIjhSSyvFsAkjTTGTTsg9o8iy
bmMzVAEUwkuYfYFXypmN0PYIgMo74x0CxmAjbvp1WoZpQv1vI0Hxe+Fc3s0LgjLC
CUka+MsG6+52tpHF/fazhv8oBFbUOh70roWkZ4ZlhxV7CpR2iWFjw/0Om/T+2U1L
27KuaQ/3mh5q4RPeSDyAMeFwOjQJbg==
=Texz
-----END PGP SIGNATURE-----

--QDd5rp1wjxlDmy9q--
