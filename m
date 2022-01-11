Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1370348B3CE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 18:27:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21CC1AB2;
	Tue, 11 Jan 2022 18:26:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21CC1AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641922054;
	bh=+USC2U210eNPZ+gGshSrTxgkE8++ZidiVRNzC37IG8Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FAkNAyWLIQ0hBFXMUpHwkDIngW5qZROextcW82HB+CsuDgVlNQZNNc6+F1WfHVS6g
	 cdCWjujhl1CUwlLbCFcp54LcMrjieJmCLJjbhkenQpLVz0t3v6AVAIV9ALovTAn+rA
	 Mohn2bQsEfLJTLsxhWrh5SQi9erCxhCqGonnF0Bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 377CFF8047C;
	Tue, 11 Jan 2022 18:26:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6046F80430; Tue, 11 Jan 2022 18:26:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D5A8F8025E
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 18:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D5A8F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nUslgCvz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 271ADB81C0E;
 Tue, 11 Jan 2022 17:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C43C36AE3;
 Tue, 11 Jan 2022 17:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641921979;
 bh=+USC2U210eNPZ+gGshSrTxgkE8++ZidiVRNzC37IG8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nUslgCvzMWyjlcrZ6gTSHZAyRbpXwq56Pos/HFPUqTWplqQtjCYmXA3t8yBCHDuyO
 sk0YWNpoVY416UjjHojvnooAsygaXWxvkXu4uma7+Hmt9Ez8vaSgBoQe3TpozY2Pls
 g4n6Cmsi3JCT1vVw8sWtM2c01DBtdOs8OOkDBgvlR53h73Z0ZTPoDU+Kf+k/rjkTsM
 w6DYvgbwPDd+nFl3CmHKLorS23ug/0byIO/xvaWOsfEbt9Wc9esRYcB1YojSaGm+++
 9c2rL2ybunT1F9GKF7MIo2hyTL0ZffIvZ6gZwFrL9xma/hYYVGaDQ1Y/SZEmz8xlIi
 iVrSEbsFJ9QYQ==
Date: Tue, 11 Jan 2022 17:26:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Beer <daniel.beer@igorinstitute.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: add bindings for TI TAS5805M.
Message-ID: <Yd29tk6ZJgDFDvVI@sirena.org.uk>
References: <61dccc5c.1c69fb81.9af91.0df6@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pespAewDyHzmcXC6"
Content-Disposition: inline
In-Reply-To: <61dccc5c.1c69fb81.9af91.0df6@mx.google.com>
X-Cookie: Many a family tree needs trimming.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Liu <andy-liu@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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


--pespAewDyHzmcXC6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 11, 2022 at 01:00:09PM +1300, Daniel Beer wrote:

> +  ti,dsp-config: |
> +    description: |
> +      A byte sequence giving DSP configuration. Each pair of bytes, in
> +      sequence, gives a register address and a value to write. If you
> +      are taking this data from TI's PPC3 tool, this should contain only
> +      the register writes following the 5ms delay.

This doesn't look appropriate for DT, it looks more like it should be
loaded as firmware since systems might want to support multiple
configurations at runtime based on use casea.  It would also be good to
have code to validate that any supplied coefficeints/firmware don't
overwrite registers managed by the driver, just in case.

--pespAewDyHzmcXC6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHdvbUACgkQJNaLcl1U
h9B+qQf/RAvCDjhhHqPNniWnFRpjbe5z/2NuAauqqYPNQYky/skCoi7zrmxcDK4w
rT59+xQSENPoqc+ribF28qL5PE1XMPyqU+IoplUZ01rwJ+gXBScRECdnpK0geABv
jWnM2ofpoy1pgAweDEbTi9NiSBGrcOZUrIsN+vVEvKIe45BZ5mV+BmCTMY7m2zl7
gY0Vvo2wNEhWQmL7B9+6WxNijM7V5SoS8S3KQ/kLudr6Q2ey2ZkD5qq2VpxAUV6t
qqyDh/agk+j8uhyvn9Rpxem25jDl/7fM4kBMsKAKokYvvKb79rmwcA46mqYwK5D6
mPevtQRnZDGKTZ/mC2IrK8t8xYx2pA==
=uhKS
-----END PGP SIGNATURE-----

--pespAewDyHzmcXC6--
