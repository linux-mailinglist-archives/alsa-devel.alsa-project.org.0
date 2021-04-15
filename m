Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FCF3611EB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 20:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81E681675;
	Thu, 15 Apr 2021 20:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81E681675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618510610;
	bh=jOfjS+NYc4xkl9TndSm/eLJj9hRQyXa0K3+fQF1P+9c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pO07KHglcanFPvu1qGw2Zggb+vy1jAGg0jRejoNFzuU5+tX17neRLmIyAp3+nVdK5
	 FaStGFdO0OZG/sf0sOsCr5XoiaP9/ViGCVrK9lwSZLrGb7kSBUgG/gPD5cD6+/3QDx
	 1q/iXcTuDGfsLK4uBUxYfMDBrkykPRi4Ci6PhX6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AEF0F8022D;
	Thu, 15 Apr 2021 20:15:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13C9DF8022B; Thu, 15 Apr 2021 20:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 829B7F800FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 20:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829B7F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q7rGZZbL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 917E0611CD;
 Thu, 15 Apr 2021 18:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618510513;
 bh=jOfjS+NYc4xkl9TndSm/eLJj9hRQyXa0K3+fQF1P+9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q7rGZZbLOKRelQZLnxLdjK892qxcFQGxlH9dbO/nO7SQ1zqcKxeK1YDQyjKMplrU0
 K7YLDJ1IqFcpzywBSgJ/klAKjmxZFfe8lfARCGoLMKEBHwAHMfh7Qeu8kJwhrN64Vd
 NZfcNX5OmfjGbTaqg2tZl9VdMLU0bD2OWvOCoZ7n9MIbxF9w0vX5erfIOSSMoTMly+
 ODu0iP7IsMzALUVitMTBdXQmEfQDPTI1Illjo5hlw4lx3zcyjSbeaDkZ0mS/nIMcWb
 gSNHt5oj6G8ebGpxnlOvcnowSzlsmChNCjFild4buSayw8Xc9Toh2rI0Vyo9LWbxkZ
 EYzxDMMuxXNeQ==
Date: Thu, 15 Apr 2021 19:14:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 01/14] ASoC: simple-card-utils: enable flexible
 CPU/Codec/Platform
Message-ID: <20210415181450.GJ5514@sirena.org.uk>
References: <87wntmod33.wl-kuninori.morimoto.gx@renesas.com>
 <87v996od2c.wl-kuninori.morimoto.gx@renesas.com>
 <YHh/Y5fXMxm91Ha3@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bgQAstJ9X1Eg13Dy"
Content-Disposition: inline
In-Reply-To: <YHh/Y5fXMxm91Ha3@orome.fritz.box>
X-Cookie: VMS must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jon Hunter <jonathanh@nvidia.com>
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


--bgQAstJ9X1Eg13Dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2021 at 08:01:07PM +0200, Thierry Reding wrote:

> This seems to break display support on a Jetson TX2 board for me, though
> I admittedly don't quite understand how it would be related to display
> at all. Reverting basically the whole series (because subsequent patches
> depend on this on) on top of next-20210415, I get working display again.

Given that we got an oops it's probably just memory corruption
somewhere.

> There's this in the log, which seems to be related:

> [   14.671377] tegra-audio-graph-card sound: too many links
> [   14.799645] tegra-audio-graph-card sound: too many links

This looks like an issue?  Or perhaps it's just DPCM triggered...

> [   15.106135] x9 : 7f7f7f7f7f7f7f7f x8 : feff303f73716e6f
> [   15.111464] x7 : 00000000ffffffff x6 : 0000314000000000
> [   15.116791] x5 : ffff0001f7091d28 x4 : ffff00008c41a010
> [   15.122109] x3 : 0000000000000000 x2 : 0000000000000010
> [   15.127439] x1 : 0000000000000000 x0 : ffff8000094614d8
> [   15.132756] Call trace:
> [   15.135201]  snd_soc_get_dai_name+0x124/0x150

Can you check where that is in the function?

--bgQAstJ9X1Eg13Dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB4gpkACgkQJNaLcl1U
h9Csxwf/R/2+nTEaRQSxN1we3hvnW6LrdBeeMnIPHv5EtJ06WHBMNlZWEioQfSut
vJO/plyE/iPILU0l/hdx2eCVYJC0xpXwvmai8DW1RKEj3C4ogeTr3U3WBvcMQSR7
VTZ6F5/fiXSbChaJPFfCfkpNGQoybkJjY9oHpqApIP32yl3B8jpOG16kCL7mXzq7
QHFeaZ505O5l/Qo2WyKp35rmjMGyoM1SzkSCFdOvVKCsh4GFKQMdrBPp2nyHXF8l
+25Jg957gmvuFowURCxUU05J6iWxifCrL8o1sPNpJpXDErYX/7DIS10C8CPatQBH
/ylwsIpEMGqJmR3+I0SoR+EhOz6Suw==
=+hJj
-----END PGP SIGNATURE-----

--bgQAstJ9X1Eg13Dy--
