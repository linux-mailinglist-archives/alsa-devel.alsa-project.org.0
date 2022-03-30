Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790C4EC302
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 14:08:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCA011AC6;
	Wed, 30 Mar 2022 14:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCA011AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648642123;
	bh=jc8kMXIBKp9TnaxWPUYRTe23rEECejIQK8a9f9YdQnA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Np26L99lz1kuluzLPMJzQ2wwEXyTrcLN2G20IQ8+77Qz1BJFOF8PGspxprX8mLe0s
	 m2V63AXcH/+R+u5GYgIotUOlKR5pCFFC4+E9NyJaQVvaJ9VHVbJfBTnpyjo3pfkeCs
	 3iZKRJlRWYhq1UZewL45roivSmPm/F25VZUsyeO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 714B6F8051C;
	Wed, 30 Mar 2022 14:05:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1686F80520; Wed, 30 Mar 2022 14:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B833F80519
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 14:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B833F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RAnlztVw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7799561791;
 Wed, 30 Mar 2022 12:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB921C340EE;
 Wed, 30 Mar 2022 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648641931;
 bh=jc8kMXIBKp9TnaxWPUYRTe23rEECejIQK8a9f9YdQnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RAnlztVwfzZCrWDFKdF8tDhpUxQDMrM3Iiw0gMAkNSBiQOQwLLFefTUDutqw5Zj3a
 bGWmZkL4LZMnAADSfWa/4D7if6k7yymEgKiiT15aNqIGBl6agGOVLtuLASGqI06zQ5
 FZ86jW0b0h9LBIU1vCDc15PYyVWz0nRMbjBf5kRrk0IDwpBip8L2U5KrgAjpz/plwt
 ofap8qFZfYN2uFjeSXwI8Rc3NRdhD2WSJY1Vr0QHA5Mt5hl7g9XU2ipNOyJD6VPm/4
 Cpf5RV4jn5f6pcvqImdzg2WbGiSMc7YHAWJBLN2O10h0+D4UaacOZJVRkT6cCApJmS
 tIgJBF+RM/U9A==
Date: Wed, 30 Mar 2022 13:05:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.17 64/66] ASoC: ak4642: Use
 of_device_get_match_data()
Message-ID: <YkRHhksDIqDpHoCz@sirena.org.uk>
References: <20220330114646.1669334-1-sashal@kernel.org>
 <20220330114646.1669334-64-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wY49DEhnV+VGZ3C0"
Content-Disposition: inline
In-Reply-To: <20220330114646.1669334-64-sashal@kernel.org>
X-Cookie: Two is company, three is an orgy.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com, lgirdwood@gmail.com,
 stable@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>
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


--wY49DEhnV+VGZ3C0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 07:46:43AM -0400, Sasha Levin wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
>=20
> [ Upstream commit 835ca59799f5c60b4b54bdc7aa785c99552f63e4 ]
>=20
> Use of_device_get_match_data() to simplify the code.

This is just a random code style improvement, I can't see why we'd
backport it to stable?

--wY49DEhnV+VGZ3C0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJER4UACgkQJNaLcl1U
h9DEKQf/UkrC0gTTDsQeNN8/3QnuRX6+/uuqssECa7EsnrhZO6vGmSimjxhC+YVU
5ycvzD3REZCYQN0dVxku+ecC1u8LM761uY6UJLlPkEZM3lPy8LXhk7zxxFNxJt3X
7jtYlsj1f29ouXj22xjCGYIc91srPZUApnb5xYqZUEo4XIX0/JNQwlnVO1bNGSzv
qREppIDOzV2gSTS9RrjrIZF5+GjxHHD+0j1xti13tzcfikT0+hTNgqhCVfgqhtmG
1/MUncVvmL6W/NNgWNPtPGlId6Db5xMgKA+r4p8IjSACCX6P2lXXSQuTfHf+U1+X
nyh+U7Dr/rm2ZkrKuI2AuU4pIP8CUA==
=NIEe
-----END PGP SIGNATURE-----

--wY49DEhnV+VGZ3C0--
