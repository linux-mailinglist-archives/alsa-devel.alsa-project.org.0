Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F312A81CF
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 16:04:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93C631682;
	Thu,  5 Nov 2020 16:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93C631682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604588682;
	bh=k8FY8nKjBeutJ6Xavr7PcVjJvuWQDn7jxITLi1s4w50=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ENBWaxrnZXo96Tgn8WYFrc4zf9q+knTHKpGT8Uv8/XW4HI+jGqwM4nAyjfxmTh+17
	 HL9vRjp5gu30f8C0uuMTDqLn2kfb3q7JYKAD+ctX+PViup0rsrwiFnrghY8sGScVTG
	 UO6sfbT+U1vCrx9Avas6xXd2PlfqSD6DXCSVS8Z4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB127F80245;
	Thu,  5 Nov 2020 16:03:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12326F80171; Thu,  5 Nov 2020 16:03:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F35BEF800BA
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 16:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F35BEF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pi1bUtS/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A24B3206D9;
 Thu,  5 Nov 2020 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604588581;
 bh=k8FY8nKjBeutJ6Xavr7PcVjJvuWQDn7jxITLi1s4w50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pi1bUtS/+nDH1FEx9Sjvxw+roiQlaVFikFD7XEFv2z0c3o2akid1wV6YtZ3v1MSEt
 ojHlzh7AeI89CkNl9K7kSBuY7OneSv/qsXh8xMr0UrV2r8IXPihIoJZJ1j3xVr2Bvv
 HMNXcIHdk6LeJYjfoBLs6XwEAIuyoeBU2AGjDwTQ=
Date: Thu, 5 Nov 2020 15:02:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
Message-ID: <20201105150249.GC4856@sirena.org.uk>
References: <20201102023212.594137-1-CTLIN0@nuvoton.com>
 <0adb99c2-d0d9-5052-c163-4d9a341239fc@linux.intel.com>
 <da4d4666-3c91-16d7-926b-b339ae4e39be@nuvoton.com>
 <da9232f9-15c9-01ea-44cf-107ff4dd6c58@linux.intel.com>
 <CA+Px+wVGosx=pmSkJKtYd9dQZ98D0aYG0KaDq6-ov67UoiV8Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline
In-Reply-To: <CA+Px+wVGosx=pmSkJKtYd9dQZ98D0aYG0KaDq6-ov67UoiV8Jw@mail.gmail.com>
X-Cookie: It's the thought, if any, that counts!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>, WTLI@nuvoton.com,
 KCHSU0@nuvoton.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YHCHuang@nuvoton.com,
 CTLIN0 <CTLIN0@nuvoton.com>
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


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2020 at 10:20:33AM +0800, Tzung-Bi Shih wrote:

> If nau8315 doesn't share I2S with other components for now, it could
> be better to not introduce the software mute control.

The mute callback is there because there's some controllers that don't
start up cleanly and end up outputing glitches (for example due to not
being able to flush their FIFOs) - keeping the CODEC muted until after
the I2S is running covers those glitches.

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+kFBgACgkQJNaLcl1U
h9CIBAf+K4PhEQViuI18TXdqBVYXq5P8w9MpEiCR5NcYmkffqTe/ym/V5oXqTVYJ
U5DOiTM3V9nco9Ad7Ql3FFssibvrVy0ppS15BrEh7H3GAoxFy8e2bcfNlqyldMjb
flXpwJmW1RgTg0EJ38qHZeMgJt4d+jsQOGS1lV7GLZYtq0cm1k2HfRmIy9Z0p1YC
x6p2oY+EDbKCSESS7t65D/XUAmaogIUBGdUKaS79/Iehyf81HXZsMrYfmRE0pGAF
tfEOhaHRxg6rL1lOB17SpFf1v0xtgUPbusNV+QYGpM/4ZWGY/ef8MopiD4qJnjY8
83sAsRzpI01yG04A2fzteYI+O4Bt5w==
=as/c
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
