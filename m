Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E49680BC7
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 12:21:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D36FA1ED;
	Mon, 30 Jan 2023 12:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D36FA1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675077669;
	bh=BQbpGEMNrIZticfkHYba4joXZTxYOMQh1GtvTJH6AdY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E50xe/PAIHyzCgcH2EyGrEQLWEovc/eBcWR+dvvdcoc7fjIwR85nWGdBfibOjnoOS
	 JIqoqsgIorB+rPFIxMpv95+FO8riv1oSSlgNvoidxxg3SuftZ7m5uCC2ZdxQ1d9DkS
	 Ra82ujBzcN7oxKCRPxhK9LIWieIvGsM6jqgJQDw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAAF1F8007C;
	Mon, 30 Jan 2023 12:20:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90FD1F8032B; Mon, 30 Jan 2023 12:20:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0390F8007C
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 12:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0390F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JooE6Sio
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4987FB80F9E;
 Mon, 30 Jan 2023 11:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF36C433EF;
 Mon, 30 Jan 2023 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675077604;
 bh=BQbpGEMNrIZticfkHYba4joXZTxYOMQh1GtvTJH6AdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JooE6SioIhzCxw1gX2MPn4PCYR/tJ6RKdnT87crEBM1fvRVXguzneQFVcHIyCPy9u
 hWa1+EH+QBZAMr1QKd3lpuoHqVB7/qbmW6jH98GSGgkZV/GXYXnlgcwokv6JW11p8f
 TeAYvviEsjHhNanzQjYR0U2vYicRQbpeU8a3NwMQuyop/H2XBcoptCzqCMJEmUOpfm
 0FetQSTFtycQGyuRzvHp77Lb8NxBNsss5+hT+84IN5/3TCXux+DGGelkwcMRIm9lPK
 uaEevFIi+y4k56GlKvAMm4+xLxDSoJjVOiAUnSQIn3WMBtzBPgcKk0980Y+9bC1a8s
 6hFNFL1jJT/5A==
Date: Mon, 30 Jan 2023 11:19:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Subject: Re: FW: [PATCH v4 1/2] The Iron Device SMA1303 is a boosted Class-D
 audio amplifier.
Message-ID: <Y9en3RI2/UXzURYI@sirena.org.uk>
References: <20230126020156.3252-3-kiseok.jo@irondevice.com>
 <167492633558.2479102.3539691390712703265.b4-ty@kernel.org>
 <SLXP216MB0077C55D61BA6F29EE2751838CD39@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RRxR2WqiuA5kQUXl"
Content-Disposition: inline
In-Reply-To: <SLXP216MB0077C55D61BA6F29EE2751838CD39@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
X-Cookie: Some restrictions may apply.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Gyu-Hwa Park <gyuhwa.park@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--RRxR2WqiuA5kQUXl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 30, 2023 at 02:26:57AM +0000, Ki-Seok Jo wrote:

> (Should I need to edit the MAINTAINERS file in root?)

You don't *need* to but it would be good to do so so that you get copied
on patches anyone else sends for the driver.

--RRxR2WqiuA5kQUXl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPXp9wACgkQJNaLcl1U
h9DWXAf+P9qen/b3Gfefd1i5TbOknaPxl5vNXLS/u71yQioYUfFXNy2oIPlh7+Dq
uGeB73de0Qvc+V4FVig5mBd33ekH6lBppzOB/4BKQRVJ0EVFMhcEZk+atH8MsOl/
vjdRUQRZry4MyXarvebMYFVaXfFIp3SneZgEdGzlRbikRJTAEGEFdejTmg1/xHv3
0jFL++tPPvW8l4IGLaoJ2EmVTd3cjQMYa4qiCxu74tqz6EA4ASc78ZMCthV5o/bo
ULzekKFISEX4oAFCdbvw1Jf0IGPp4ik3+5MeephJFB3ADVLCGnZ2cQxS7oCoug3J
MZJjEs0aeDJmnF+qGZkVJr/nfoLtwA==
=luR7
-----END PGP SIGNATURE-----

--RRxR2WqiuA5kQUXl--
