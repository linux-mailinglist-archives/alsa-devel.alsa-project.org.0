Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B7338C63
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:08:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEEEC16EA;
	Fri, 12 Mar 2021 13:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEEEC16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615550880;
	bh=DHmyk8GUReblYUlhSMgM0JiPJvuHbVNLZgcQ4Uqew+8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wo0UeNGdSF7vGbbD93SyKJfdPg402AT53bSkw/QhpbaSgSfjRs1gPhwqBSNPWG+Ok
	 17SwM+Jz8hMxwGXZAhfu7i72Uu0MoRCiZz0BtckIKypBbBdbhnUjn3tQvcl39mxUu+
	 CsZb70OnjY5UJxWolwzEV33JQ0dTlwhleyICg7AE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CB09F8012A;
	Fri, 12 Mar 2021 13:06:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64BDDF8012A; Fri, 12 Mar 2021 13:06:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE511F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE511F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZMnlJOK4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 470F764FD6;
 Fri, 12 Mar 2021 12:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615550769;
 bh=DHmyk8GUReblYUlhSMgM0JiPJvuHbVNLZgcQ4Uqew+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZMnlJOK4+abTr5z6UYLOMd63xUlgezqJXvqxpjbY9ta+qtcZwgxxfDbPmXKjn9G/x
 fJH3pXeWHvA3lHlndJknsq+TlkHWBGctbcZ81JOI6QsX3ZMv0nto7+QDcim7ArHJOj
 9I2mVhq9wW7bbwMSGLddZUQCee/FnVMFe3vTv7qt+FXXGGY2F6rtrcv+V9DZqtm7t+
 WU6H07eYP7vHhX0lFQfBr6wobUMro6CUc76cwUfvvD82C5sTLKLO/AJOmNRIeBK1fe
 6c/mh7emCx1217+ygNXUp4FTLCvL4uNCNfu0hgYTLvLGOVAiG7NWTlatoHNVIMKJGt
 DeotHYNFPoIhQ==
Date: Fri, 12 Mar 2021 12:04:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Message-ID: <20210312120456.GD5348@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline
In-Reply-To: <6ed28bb5330879b1919aced5174f319f@walle.cc>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 12, 2021 at 01:01:41PM +0100, Michael Walle wrote:
> Am 2021-03-12 12:35, schrieb Mark Brown:

> > If the card has a clock API clock as sysclk then set_sysclk(() should
> > be configuring that clock.

> What do you mean by "the card". The simple-audio-card itself?

> Take a look at:
> https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts#L29

> Does the card has a clock? IMHO the WM8904 codec has a clock, but not
> the audio card.

The clock on the CODEC, which the card configures.  The CODEC should be
passing on the configuration to the clock API.

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLWOcACgkQJNaLcl1U
h9Dr4wf/RvhCgjsXMqQfCMBjIX58G+v9Cg2OPPplcaKKCYDjRg91mNXrL3E80qFQ
HOfZJ33uxBY2xnzXmfnttbMlnRrQys2U0XPqbQXNnJTnHmJu4XqVU/j+c8QJeKJK
DCYp/qmAvUqm3i4KDM/bbqIeNCiXHtVZ6FvLdrEL8smdJhXdMGFA24rOvNMlhCyw
T2/y0+K/70cbhiWTrVFs4LyRnGdlIooLdErAfQ0ZoXnsid0QNObGiS0eOSjssjke
gfwoUWcR5skL2eEzLBkWAOnJM1Am5S56kSpMaF/69BfwwINbfV7GpCZFOHbI+Zy1
0ZPH0ScPMHaRdPcpq9ArImBAxwU+Fw==
=mvjs
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
