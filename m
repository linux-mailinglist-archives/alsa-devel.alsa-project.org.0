Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A1F50E057
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 14:32:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D9DD16B3;
	Mon, 25 Apr 2022 14:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D9DD16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650889929;
	bh=N0EPdIugLassIihiD8xp49ZT5dPSUmJIgdJqAlE+nSE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYyQ4oSF3Fhu1T/hl1Rtilvxn+9RLv4WO9qkSPIiUjYszx6QDvWBWRGqRqGf/yXXt
	 zO4taCe560c/YH4/oV9raBFdZHiYADIr8lgGZDG86ltkGQF1ao93T81f3+0zmTFCc4
	 XTQ134t25RhOOUtNDnEVQTuj2Z24dQx/b35G2FSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF5A7F8016B;
	Mon, 25 Apr 2022 14:31:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A516F8016A; Mon, 25 Apr 2022 14:31:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B511AF8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 14:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B511AF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z/yuTpra"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 209CE613CA;
 Mon, 25 Apr 2022 12:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B728C385A7;
 Mon, 25 Apr 2022 12:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650889861;
 bh=N0EPdIugLassIihiD8xp49ZT5dPSUmJIgdJqAlE+nSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z/yuTpraSYCgI0XxlJDCsizFMfmjirMAtKX4Y1wt7s9LdG4YGyGgc84912JNJ8JjN
 T4vNJwTVGfWLG1aPhxej5T8tjcPU+wGTPRO90URvR4LCJCQDKi+dOxDSNRUmTCVtrK
 Y+vieWmMQPB1oe9xczsqo0kQ7KWJv+LRM6Ks/3Wm0OCeCJKFuXBoVnU+mvwMESXPio
 36iSjDG1FYJlLE7c+wNeN0R3TJ5uUrWD8Rj0q8oLPBLV2zhRq1ggKHHtlB1ER1ApUp
 jufUFMZsfFplUoevdVHPeluIdm6iuFsSIOpyVZC3CqCtzmuJArkGz+P8KwqVMa1rhc
 Ep3wwEYs/48Ag==
Date: Mon, 25 Apr 2022 13:30:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Ryan Lee <ryan.lee.analog@gmail.com>
Subject: Re: [PATCH V3 2/2] ASoC: max98396: add amplifier driver
Message-ID: <YmaUfkvy7YKCSLST@sirena.org.uk>
References: <20220423021558.1773598-1-ryan.lee.analog@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2viRuOuJVnHOO/9B"
Content-Disposition: inline
In-Reply-To: <20220423021558.1773598-1-ryan.lee.analog@gmail.com>
X-Cookie: An apple a day makes 365 apples a year.
Cc: drhodes@opensource.cirrus.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 stephan@gerhold.net, tanureal@opensource.cirrus.com, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, ryans.lee@analog.com,
 lgirdwood@gmail.com, cy_huang@richtek.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, pbrobinson@gmail.com,
 lukas.bulwahn@gmail.com, krzk+dt@kernel.org, arnd@arndb.de,
 kernel test robot <lkp@intel.com>
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


--2viRuOuJVnHOO/9B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 22, 2022 at 07:15:58PM -0700, Ryan Lee wrote:
> This series of patches adds support for Analog Devices MAX98396
> mono amplifier with IV sense. The device provides a PCM interface
> for audio data and a standard I2C interface for control data
> communication. This driver also supports MAX98397 which is
> a variant of MAX98396 with wide input supply range.

I'm missing patch 1 with the DT bindings?

--2viRuOuJVnHOO/9B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJmlH0ACgkQJNaLcl1U
h9Au7wf+LPH2wys4lkiylSgsOXYqnmceMt/19R5Cc7v3Z19l8s2kwrklNBSav+U9
ckbIb9YbZ37YFCy74pHh2xZvWkxVXDIVsqoOIP2cLN04FKahUI7ENAwpjlfDSYZ5
cTkHjfQYhD7s1viNKzbsVrH/G0rXHmBXmS8Pzimf5ycTngeel0RJ1mZY6ydMSjwR
hpEzx5ZUGUnnQ1ukNtwdFcCmnh3eAXgKmhq+fLy1MYkDuiCKvNGGHK5a5pEVEvSa
1g7CFjB8Sxb+WXYXa2d2hjLmfLlb1taU9p64va0uS4ritLofg+vNnwJCV5nZWx/5
JOcQi7nrDP94gooyMGwjc5iVP6byqw==
=R52l
-----END PGP SIGNATURE-----

--2viRuOuJVnHOO/9B--
