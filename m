Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B38B9510745
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55AAF1751;
	Tue, 26 Apr 2022 20:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55AAF1751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650998400;
	bh=Um7tQN5c/khfGtLAMRRk2f7fw77MXm+xGDs/7GBcITU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tLe4ZibbK7T2tban2UncO2rD7OtYnL+Od3dGjHk2fmt9b0JufPSQlAwn/kSWGBRPO
	 tTV8icU84gBQadH8l9PhV4yNyMhmiV6LUTA6OWWepGct7xdOzvv0D2RsvL3sYc7hxd
	 juCAJx/xmk6/3OIeH0PYnOBFrLIpR6BxZFpvIMMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1C5FF8027D;
	Tue, 26 Apr 2022 20:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E01BF8025C; Tue, 26 Apr 2022 20:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E5C2F801D5
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E5C2F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PpyFMGRr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAB216175E;
 Tue, 26 Apr 2022 18:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796F2C385A0;
 Tue, 26 Apr 2022 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650998306;
 bh=Um7tQN5c/khfGtLAMRRk2f7fw77MXm+xGDs/7GBcITU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PpyFMGRr0lLGB4hzkOej9/PkVWZKiNLVIbzHe9FUyUTK0k4bC+3U+0d94u2K8Ib13
 /sjyJPOf0xTfZW+zhck5cQzsxjUb9eP8h9Jy/o7HjA+KZGmhF7NQViAiX5aAFL8Q+s
 LSOLTyPUwS9D7g70x2mrQc840tY07WDUUGHcH4gOa/0qLBtimqHHpYPy5e13SvQ1MK
 dSv1gkehNp8xDmamyYnkxbJBvawjcPCXDTUAbX5Bz+vSybJ+yzYctgl1AhCbkFNUVT
 /vVVQ+0Iw4XPPxSeguiCK+07gEKgTDySTgsYVXfcyJ2Cw1WuXQ6j7X80mdFaHgPmUC
 HN8HoIWKqdKEw==
Date: Tue, 26 Apr 2022 19:38:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Depend on CONFIG_ACPI
Message-ID: <Ymg8HTcdxprUZBjH@sirena.org.uk>
References: <20220426115454.685787-1-amadeuszx.slawinski@linux.intel.com>
 <eab567f0-73a4-bf23-76bf-8d576fa942f0@linux.intel.com>
 <YmgnE/HKNmI+agNs@sirena.org.uk>
 <726c58e5-241d-053f-8b4c-d56a5a228f0f@intel.com>
 <Ymg5CAbwf/UxUOff@sirena.org.uk>
 <ba9e90de-94ad-d6c9-b6df-1fe6f802e9d6@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3viuR44h1HFYANFi"
Content-Disposition: inline
In-Reply-To: <ba9e90de-94ad-d6c9-b6df-1fe6f802e9d6@linux.intel.com>
X-Cookie: I'm a Lisp variable -- bind me!
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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


--3viuR44h1HFYANFi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 26, 2022 at 01:26:08PM -0500, Pierre-Louis Bossart wrote:

> my suggestion was the following:

> depends on PCI
> depends on COMMON_CLK
> select SND_SOC_ACPI if ACPI

The X86 || COMPILE_TEST that's there currently is also sensible given
that this can only actually be used on x86 hardware.

--3viuR44h1HFYANFi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJoPBwACgkQJNaLcl1U
h9CNjgf/XqRTecOdKhkhLCjuy/k5IagI1kGOEQTdmLP8SFPogsMkHx0gbKk1EDX9
TfWlUijf/2IlxZSksmhinw5a4JDmt+ErmCkZVK6V2weEMOeDZ+FaE8JnC1izYsZw
QrY4OjDj18O2YFYRyyb6JoggJXcnRmaHO34e6KqBj/EXU3BP9anGl7M5azJn0cM8
a65+YPQR/0LENY2E7N0WxRxJBooRy9Ri2uividUCwXJf0OLrZAzOr36w4f45Fj+5
EROj3e1qttmH+D8GlefdF/kkwyObzHCRw5G39GG9KWM3l4IU9mL1dQOESNZqFXaA
FUSg14RqpLfQLT18zIz+UkteVulSCA==
=dnAN
-----END PGP SIGNATURE-----

--3viuR44h1HFYANFi--
