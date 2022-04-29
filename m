Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61A514F67
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 17:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8C8D15E0;
	Fri, 29 Apr 2022 17:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8C8D15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651246085;
	bh=SUnUZkDd73soW1N/ykAh7VePtc9efFucR1Xq+G0eU5U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oz/YyLN0k8Fx873bkvjKgwEQ6EKzbl4vy5tqq3vXFIlPeJKL4Zqq3GK/Esh75km8p
	 6JEZmf9JPvkNX9Yy10fJTSBxKZaX/lA3WIT5B8HTnxvvy1PJyF9khBFjw5Zkzoz+gy
	 oYp2vcgHdDz8UCRRJsW5nVgxsosNqXOKwLOP7pZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2650EF80269;
	Fri, 29 Apr 2022 17:27:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D15F8025D; Fri, 29 Apr 2022 17:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7B3CF8007E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 17:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7B3CF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nbTA3k5b"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B661BB835F2;
 Fri, 29 Apr 2022 15:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692DBC385A7;
 Fri, 29 Apr 2022 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651246020;
 bh=SUnUZkDd73soW1N/ykAh7VePtc9efFucR1Xq+G0eU5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nbTA3k5bfn8df0zXd/SKQiv7+X7ycY//ernj8FINdGhn05rho2YIOD3JzuU71v0Bt
 J1KOFH+E4HK7MeWBoE9dopA+fBRoMsu/2UaevqzHDyWHUDSPqqezBu0DQOJroIV58t
 55rqTScvewit8sEj7TmEvQJ30MwNkVEq5AgWLDtQHHmIbbInBhd6ifMnFNIYRbRoD1
 fSplyjgGngXK3Wc+MthBuI4374fl/9dXoxZcCfGW75VxdTjMBYQGS/WsxD8WHGlZ/2
 G6Y118jKFUrVsuQcN5dJKHmSJg39o6u1r4lETQ0VQk5kqi2Ma4I1YQshXLokSz6uN7
 Ny0HM2GvRaW3Q==
Date: Fri, 29 Apr 2022 16:26:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: Add option for ELD bypass
Message-ID: <YmwDv7poot/5pcgb@sirena.org.uk>
References: <1651245218-47201-1-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VckDS60gwZWkzTBt"
Content-Disposition: inline
In-Reply-To: <1651245218-47201-1-git-send-email-sugar.zhang@rock-chips.com>
X-Cookie: Are you still an ALCOHOLIC?
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Dmitry Osipenko <digetx@gmail.com>
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


--VckDS60gwZWkzTBt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 29, 2022 at 11:13:38PM +0800, Sugar Zhang wrote:

> So, add this option to allow user to select the manual way
> to output audio as expected. such as multi-channels LPCM(7.1),
> or HBR bitstream for these sink devices.

Please check this with mixer-test, it'll help validate that you've got
the control interface correct.

>  		.info	= hdmi_eld_ctl_info,
>  		.get	= hdmi_eld_ctl_get,
>  	},
> +	HDMI_CODEC_ELD_BYPASS_DECL("ELD Bypass"),

This is a true/false value so the name should end with Switch.

--VckDS60gwZWkzTBt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJsA74ACgkQJNaLcl1U
h9C18gf+LZXgJ4+4HfVLJqBdrahLBTFQtsuI72+qv9apcg2Z9VuDucQ1ebjWg88P
QhVy+TURKh0fHgty//mJGg0FqQ8aUCpdT1o0Yv6zhSbJnv3hQ5VuVJKelB4XO3iw
s5jXHY3DxSlQ5Ihv1zRoGRUmAgSe/NVUP9rOjBowYnUkgyBPhlYu8QSpxi/5iaO7
Wojcd8otdpJBu7NGESF54g2zrcd2yIn+CT5qbWvCIWk6CFFSJN7oywIVbRX0VOjB
tsC+qqkEeWY/d//ndjHIGrIfuKPLyJl+Ic5mhzNrWuqo6wbNb24IAcpnVGVK1LZ/
PNvKi/+9bxQ1mDF3pPhT+sLDeEBNEA==
=BM0O
-----END PGP SIGNATURE-----

--VckDS60gwZWkzTBt--
