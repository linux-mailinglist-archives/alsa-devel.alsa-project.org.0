Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1E26C6AA0
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 15:19:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C79EC8;
	Thu, 23 Mar 2023 15:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C79EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679581172;
	bh=HqrpakKe5lJcHsgFvPpYXNpcDu87zy3AKYG7fAHjv9I=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZxDbhyo9V1oL/59XDwYOMsiHNt64S8vMDphFTtMwHrGk2YXmDH97hPKkPfhm0rdGL
	 hjx9Yf5h89HjTN3bonFYrX7yLBE9YHqhougQvUdSobTAiWGlGph4lwIiNPqIzuHC1p
	 weYdL0S9/c5wN4C5ZEH5/TgYUtczfyUBI/DqCVI8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F2D7F8027B;
	Thu, 23 Mar 2023 15:18:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F86EF804B1; Thu, 23 Mar 2023 15:18:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AFD7F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 15:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AFD7F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DVC5Br2N
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E001362747;
	Thu, 23 Mar 2023 14:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482D0C433D2;
	Thu, 23 Mar 2023 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679581114;
	bh=HqrpakKe5lJcHsgFvPpYXNpcDu87zy3AKYG7fAHjv9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVC5Br2NhxQscX10B1smeT8zYIWtnkT/j2QfugtZISLy4Zhqi7Am8rHWdfDmNZbCV
	 l7XGBw1Kq9dujwW0pbUoStRK7Pwl6F6sWMpZmYKjou1jjFOFzT8CRwZzreztp5gtno
	 iCMmpqUsaTqTF3TGCAZxu+qX8fn58I5J6DNMqvmEaU2HiLMScVkV2hYOq/agR8d0VP
	 47lK5OJ5nvFJb9rk4A/8k6ydYCgIH3YuFS+cBm3RQ1eLzcoYNBhaoJeBo7dMlDUooI
	 +9M+HkdP/lkeMWubk78U+VtTgoRcGGAVlyk37R526lDJiPoUK+AYRGpzbuxuug7qNp
	 ZGCLgAm0cUpJA==
Date: Thu, 23 Mar 2023 14:18:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 01/20] ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP
 used in LunarLake
Message-ID: <0254bc37-5cb5-4200-b483-de3e3677a468@sirena.org.uk>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
 <20230323054452.1543233-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qAA6JU3CumurpAhC"
Content-Disposition: inline
In-Reply-To: <20230323054452.1543233-2-yung-chuan.liao@linux.intel.com>
X-Cookie: A lie in time saves nine.
Message-ID-Hash: F6OWD65GTW24KESEZXOUX2ZGM3HIM5PW
X-Message-ID-Hash: F6OWD65GTW24KESEZXOUX2ZGM3HIM5PW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, vkoul@kernel.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6OWD65GTW24KESEZXOUX2ZGM3HIM5PW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qAA6JU3CumurpAhC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 01:44:33PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> Add the new enum needed for SoundWire IP selection. The LunarLake PCI
> descriptors and DSP parts will be added at a later time.

Acked-by: Mark Brown <broonie@kernel.org>

--qAA6JU3CumurpAhC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQcX7QACgkQJNaLcl1U
h9DepAf/XSQrsI1JBnl6eDTHtPGEsBtDT/1R90Y3mMDWZxfGkI+F1lupoWdETNdm
cAjF6dJEG9Zho1zVhVmrH37+kRNOG4qaaG5vAAmXNwnJoX6jB94ul7OANJ3Z7pcw
J9yP5z1ZCuPY8T4jfgec3TvDvuFOhgOHUFT5Pqb/hPdhZ9AUI21mK7BIwo4GM4qg
jDFxb6u8XKAkdoWeDVwExq/SJOfqfmcV+pPpvHo1MTMOl/5I773/KTOOs//aLyXX
8gct4XgEFVHr2Cnu5YusJcpRZp6iX4z6UUgMrVW2HA87JhiU337ydW9vB7rNmQi+
xzi6qVZSAY6vmN2m/y3sLhIeYkb3PQ==
=DR0C
-----END PGP SIGNATURE-----

--qAA6JU3CumurpAhC--
