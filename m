Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B75B8E38
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 19:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28FE818F9;
	Wed, 14 Sep 2022 19:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28FE818F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663176901;
	bh=hD4qLko9ybG5VEbZI2KNcV4H+6npoAocwl0Ue90vNjg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V2L998d6MmYkskETp6rZT9PXgPjMpOTg6NVJcgBONqp0nqp+dIpI0GvK50SNNH7XU
	 A2Pu13I+l+l/q99W+9ViPtsrMXaX7sThug2EC/9E2d0J5Lq/QFbD14JlrTnqldkH7f
	 vjlgkVCABZxnW7jtoy+1Acu7a2eMHGyVJR7ecCXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C24CF800C0;
	Wed, 14 Sep 2022 19:34:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 881F7F8014E; Wed, 14 Sep 2022 19:34:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B044F800C0
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 19:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B044F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KCUtLSfu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 27F15B819D5;
 Wed, 14 Sep 2022 17:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77040C433C1;
 Wed, 14 Sep 2022 17:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663176836;
 bh=hD4qLko9ybG5VEbZI2KNcV4H+6npoAocwl0Ue90vNjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KCUtLSfu9mB/jXtQ/YdVRPH2gLdUlQr87nJLtqQbGLjrcvicF28a15woa0I9mcXjK
 ZktAzQnNNugkK33MCnYwjWQqTrrrG8kprEWpI5ReBZuzWXNK3XNQpZilQ9rCtInKha
 M16xJUAOXprweOv3DvcRsJKRpj+KF8p1U+QGTUaZoEh+SwF7fe55YKI78f7rkfgtXO
 Gnnf3L2o5UmiKAeY3pWSWpm3tPHVLLd2ZWF5jCrdocmFsieOkgoGzSRhR+t/DogXM1
 IHuGaawxhyDGLJiLNfS3x8vFP/U7dRes73ZdIR/EWfpuJKYpCgcEBnTSsRvrHyxSR4
 RN7OWpsWRlImw==
Date: Wed, 14 Sep 2022 18:33:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin Pietryka <martin.pietryka@streamunlimited.com>
Subject: Re: [PATCH] ASoC: codecs: ak4458: only perform reset if any bits
 actually changed
Message-ID: <YyIQf+HQeMd1z20P@sirena.org.uk>
References: <20220914141146.117340-1-martin.pietryka@streamunlimited.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BhE5NkTc+Wqvn3KJ"
Content-Disposition: inline
In-Reply-To: <20220914141146.117340-1-martin.pietryka@streamunlimited.com>
X-Cookie: One FISHWICH coming up!!
Cc: alsa-devel@alsa-project.org
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


--BhE5NkTc+Wqvn3KJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 14, 2022 at 04:11:46PM +0200, Martin Pietryka wrote:
> This reduces the amount of small audio artifacts that happen when a reset
> is performed as documented in the data-sheet.

This doesn't apply against current code, please check and resend.

--BhE5NkTc+Wqvn3KJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMiEH8ACgkQJNaLcl1U
h9BpXAf+P4LAdTDoDo2rUEsycF1nV+SP7Zi8Tk71kYa1y6JR8MiznJ9XCDcNHQIj
1oSSG5b3ia2Rvc+mmYYcMDJzGV6S4sYNCEG5tLo9dbHz85vFNmoWn+4KYHedRnLr
5mIQWsDHaHbPBdZzpyqEQhGnv72WuqTEHgPQ/wynVNOnXDLcoRyRJq0o2/tgkfQW
pzqPZ8U1lNwH8+h6IMAW3UBXJySx74spjXbRimXQ4ZcLRDTKFOLsm4/jdvIDBpas
JCnT8m1px0+U1pvvg3aaMchNoInw8VoT4JRqeCXSMKCjKaMn4IoytuD+/TXefvQl
EamL7y72egqwmISoMmgiKCRq6Nex0w==
=yu7s
-----END PGP SIGNATURE-----

--BhE5NkTc+Wqvn3KJ--
