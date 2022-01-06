Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C534868FF
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 18:44:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16B5A1A43;
	Thu,  6 Jan 2022 18:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16B5A1A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641491079;
	bh=VMZb/vl9Es0TxM394a0l98g/QQb1mxSlcH5oLXhRNLw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K2ovEfTrFDxteyImSVmguSd0AvyYudAFO2QStI+yRRrnGZs5zDgJJyUGL74DxaRdr
	 dXweoMU8uVjn4IOUtd78KTSFBCwjhejlo73hFJQhhwpYLAwjfLwKfQd/xT7pWMnmX+
	 LAe0NdhOPr9Lx5pRte2sWD5vsH/4zi2I9o5hXH2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 730B3F80158;
	Thu,  6 Jan 2022 18:43:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6C27F80155; Thu,  6 Jan 2022 18:43:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62DE5F800BB
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 18:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62DE5F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RPKsT6cG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4756861D3E;
 Thu,  6 Jan 2022 17:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D88FC36AE3;
 Thu,  6 Jan 2022 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641491002;
 bh=VMZb/vl9Es0TxM394a0l98g/QQb1mxSlcH5oLXhRNLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RPKsT6cGI9W2ce0Z7mxUh/JY5Af1GXQee/tzWme7EQSK4XVlA4XCyya+7abozcR6c
 NGVoQzNqvUYRePbLNJM2fwE78G6zrOeR9PjR8svVGjlnklq1rM+wM71ciJM6Ywr7Ih
 FZda90T39dPVm21+Th9JhYBSt9hSIFV28nv4MddWFWTDwNPNa9GUUX+/gwv23Aokin
 zuHIyOxaYmbdsOrql8pYPKJcCeJflRm+Q/gydCIa5Ugk4tkDXZ9sxr/agcIp+mgZA4
 WJ5FAKdx14lRZZ3Oj8Irvpjj8G+djFVz4Pg3oNOwICxr9OmZlnKhAKlwtTFP4938IX
 bo2F5V419wbAg==
Date: Thu, 6 Jan 2022 17:43:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH 2/5] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Message-ID: <YdcqNS3GXCCaiDbE@sirena.org.uk>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
 <20220105225146.3517039-3-robert.hancock@calian.com>
 <Ydbf4ga5jTluJ3HQ@sirena.org.uk>
 <9317ec383e5330e244f2598af8c1ca4c606a98ce.camel@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="S3A01/j/BFR1icU4"
Content-Disposition: inline
In-Reply-To: <9317ec383e5330e244f2598af8c1ca4c606a98ce.camel@calian.com>
X-Cookie: I think we're in trouble.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "maruthi.srinivas.bayyavarapu@xilinx.com"
 <maruthi.srinivas.bayyavarapu@xilinx.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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


--S3A01/j/BFR1icU4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 06, 2022 at 05:38:42PM +0000, Robert Hancock wrote:
> On Thu, 2022-01-06 at 12:26 +0000, Mark Brown wrote:

> > Does the IP actually cope properly with inexact ratios, especially if
> > the actual clock rate is lower than mclk_fs would suggest?  It's more
> > common to be able to tolerate a higher clock than specified.

> Unknown at this point - the test setup I have has a fixed sample rate so I
> can't really test it. The documentation is unclear on exactly why this register
> exists and what it's used for, it just indicates it should be set for the
> sample rate to MCLK multiplier. All I really know for sure is that with it left
> set to the default of 384 when the actual multiplier is 256, it doesn't work
> properly.

Generally the IP will have to do more work than can be done in a single
clock cycle for each bit and needs everything to be done with
synchronous clocks to avoid data corruption.  Based on your report there
it seems like it definitely doesn't tolerate being underclocked well so
DIV_ROUND_CLOSEST is not what's wanted.  Requiring an exact match would
be safest.

--S3A01/j/BFR1icU4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHXKjUACgkQJNaLcl1U
h9A94wf+NlGA+58MCkFtKqS5DeiL/egZuBS9hju1IymA9ESamYYE6ZJ72Ckzz98u
fgvmPbYm4rmJ60kvJuyLKGNAf6Vh0ISnAEJW1zttSIsKWiRTWKzJugADikeMIdk2
T+MGFvGOVqjiFsJF4qhtG3oVNmn+wsbTVMRUlTcGXNekhTg5Na8GzTMzNDkC2gH3
yvlJaYxVw0HK5+obGXj5XzGc6Qxclivd732zZTRiSO2TlUDvtJGCU4F/WTZewgOh
feaAPbvghMiK9ObjbTfxvkdE2bPMtrxZ28gNbVXoA6/6HKcb5g4EUMA9P44cu5Kp
nc6As/jAHCT6+keAVMwksjLlFHr8CA==
=6VgT
-----END PGP SIGNATURE-----

--S3A01/j/BFR1icU4--
