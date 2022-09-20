Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C001A5BEC87
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 20:09:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F6B6850;
	Tue, 20 Sep 2022 20:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F6B6850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663697360;
	bh=nGyRyyWPdZouzB5RhOpe8C6asPklIRJUmgmC4z6ZMEA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bk1JRI3uB0dHWB8hVU+BIoHSqN7xLWCkT+AZcEDQtxxFFPln8AScrU3Dj+ffqBDO8
	 hel33yzlCdvn++KGUOOT68Lma2wWV0zuLb5HoRzl9g6tgJB2tQNjftc31rHOHA40qu
	 Syr+Qwx4avFQC31PFidQeXRyRfEN5XIG5M8Rt72s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91E36F80171;
	Tue, 20 Sep 2022 20:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80388F800F2; Tue, 20 Sep 2022 20:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FF91F800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 20:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF91F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZSbOmsCb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33D26B82BDE;
 Tue, 20 Sep 2022 18:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AC6C433C1;
 Tue, 20 Sep 2022 18:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663697297;
 bh=nGyRyyWPdZouzB5RhOpe8C6asPklIRJUmgmC4z6ZMEA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZSbOmsCb1ulQvVqCSfO/cK6oywJYZhHeLftps/oWevlT+caosBVy7UBtw4vRGqO9a
 Llm536sZDdYl+FGcCao72yJOaWmisMecj16H7udMXaJYb3QGr2lHwaRt/3jXAxVF3C
 2YGU6JA2GratgGg3Lw6TMe4yziC+LQGcmDtLAVo3SLR7V8AtY6+XTA0Sok3bbxCLd4
 Wmn1GopF6UMYphFHBbN8PTUV0lBV9mhFYmf1hHpN7u5zI6Q4zHM/Fmx4f4oAYXPsn+
 qt4lbUeS6afQhRoD+kwm7wzq+VbXeKFhzoBersbCYXs3K4R2q351K/2iwdjC4WEhqo
 lsfcOMRAM5Mtw==
Date: Tue, 20 Sep 2022 19:08:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks
 table
Message-ID: <YyoBjHftjG/ACAuJ@sirena.org.uk>
References: <20220920171320.7776-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pBC45qtXHe6amJlR"
Content-Disposition: inline
In-Reply-To: <20220920171320.7776-1-mario.limonciello@amd.com>
X-Cookie: When all else fails, EAT!!!
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Sebastian S <iam@decentr.al>, Xiaoyan Li <lxy.lixiaoyan@gmail.com>
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


--pBC45qtXHe6amJlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 20, 2022 at 12:13:20PM -0500, Mario Limonciello wrote:
> Lenovo Yoga Slim 7 Pro X has an ACP DMIC that isn't specified in the
> ASL or existing quirk list.  Add it to the quirk table to let DMIC
> work on these systems.

This doesn't apply against current code, please check and resend.

--pBC45qtXHe6amJlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMqAYsACgkQJNaLcl1U
h9AAxwf/WSm8pdfnfEKYMeAQnMBAVC0q9xPo59kuidAjXtmRSgN8+bDXNWT0qhLw
drsiLV7ReTO92v7tyAZ2xueCKZPReD2ZJ2jcejK4qa00Fo+7a+mYdxdaclE/2Ips
7fEc/cjReL9T1xp5PqxLokkRvHUR1Ka0NUJB1J+3WLzrx4Vh9aUBcWAa2DNGBDKh
6/ygFRFhPJtvyzUd8yBV5daTnY/imjfWqGPOJRcLAEixRhwWdsfSrLeeRi27whXO
Ie7KbjFjSApftp4LScBvhO9mRNuUJagRuRiBoMn/qiEq3ivUW2BRlisD0faqDGea
h4sZTnDfqrO1LSkOUHlf40VZd/S7bg==
=blfw
-----END PGP SIGNATURE-----

--pBC45qtXHe6amJlR--
