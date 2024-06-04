Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEAA8FB673
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 17:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F05857;
	Tue,  4 Jun 2024 17:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F05857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717513297;
	bh=GlEUR22ZhAnZ0czhVF3LVHsj/uX/hRrel5FcmB2yiZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ujLr7TcRwNph4tz3P7br5PzwG9F7+WjRgNMkWp4vgtE7hl3vK6pAGMaI5iCeYJvhA
	 Rapp2NSU1fiyvEs1gCZygdzHopMMUXkOUjpWFklwwe8YAVh+5PJZh/fW+Al+Gzdb2q
	 XCW683KzmlOi6Gf0A5OkqpOCrrfY3KB8gDw4KBbU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5986F8055C; Tue,  4 Jun 2024 17:01:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D881F8051E;
	Tue,  4 Jun 2024 17:01:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99C78F802DB; Tue,  4 Jun 2024 17:01:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87DC1F800FA
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 17:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87DC1F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FO5candx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1BA7612E7;
	Tue,  4 Jun 2024 15:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4328C2BBFC;
	Tue,  4 Jun 2024 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717513257;
	bh=GlEUR22ZhAnZ0czhVF3LVHsj/uX/hRrel5FcmB2yiZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FO5candxFF+rT/EM4wzRldxm9ScSz8CgV47O38RUXqJLMJzutBYLcl+/JxigqC1aM
	 bU0J4c9iiXxpC9AKmhkaIh0IUhJ8ZvoOdwdQm0PllzmuSxxK6nLXuWvA7Xdz8YMkgE
	 NHe1SIzxyGd9grO01+XPWod7zLGOYivGcimb4akviHahUEU8LZmg01wKGJRPRHzA/4
	 2sAS91L3EQLV2lzkYfuQI6Q9+GPt6xPJyJT6MNKQCsutBojEgKSsh3ep0ojtFnH2YS
	 VcLfSa4gw28Wf53x6DQa7lkf9S6BTzs0jLaHF8PqzPPABPyOC7qtTR9gxY9qJcl8So
	 CkJNWxksUtslQ==
Date: Tue, 4 Jun 2024 16:00:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH] ASoC: qcom: add missing MODULE_DESCRIPTION() macro
Message-ID: <9a6636af-26f4-49b3-bd4c-91f9ccc29322@sirena.org.uk>
References: <20240603-md-snd-soc-qcom-sdw-v1-1-101ea8bcdd38@quicinc.com>
 <0bd0a518-4d85-4251-9bf9-d056dc3d7b08@sirena.org.uk>
 <7a0cde5c-db6f-4de1-9dc2-aa2c21fd0210@moroto.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4FjINuUocUrb0j8X"
Content-Disposition: inline
In-Reply-To: <7a0cde5c-db6f-4de1-9dc2-aa2c21fd0210@moroto.mountain>
X-Cookie: Is it clean in other dimensions?
Message-ID-Hash: EB6KQ5SWJVM2X7CUT4MESGP6NZEVKEIW
X-Message-ID-Hash: EB6KQ5SWJVM2X7CUT4MESGP6NZEVKEIW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EB6KQ5SWJVM2X7CUT4MESGP6NZEVKEIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4FjINuUocUrb0j8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2024 at 05:46:14PM +0300, Dan Carpenter wrote:
> On Tue, Jun 04, 2024 at 12:56:09PM +0100, Mark Brown wrote:

> > Is anyone getting any value from these MODULE_DESCRIPTION()s?  This all
> > just seems like a huge amount of noise and I'm having trouble thinking
> > of a use case.

> The missing MODULE_DESCRIPTION() warnings are very annoying.  We
> recently missed a link error issue because the warning was drowned out
> in MODULE_DESCRIPTION() warnings.
> https://lore.kernel.org/all/202405182038.ncf1mL7Z-lkp@intel.com/

Yeah, adding the warning seems premature without having first added the
descriptions and I'm not clear in what situation anyone would actually
care given how rare it is for someone to manually interact with module
loading.  The number of cases where anyone would not just look at the
source seems vanishingly small.

--4FjINuUocUrb0j8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZfLCMACgkQJNaLcl1U
h9C22QgAhndQ9RATpqJtQSgVZgFEEyID4beRXIYAjMsdhg6/YZUD9FP7c37lw64x
g6ooe2ddBuxvD0qwNV29KW/rPzAJglDv0RXd8JCbC0h753RyR3d7eGDhDYlkqAMc
hHZP0vuZT9bKnbflS7/W333OhG1H9Aj5stiNu60supirROlX4HgjjOCPCg2990Qa
yqZqCJdYywC8i1ZRBYTpAfcuIUX0jGuHas680Do9VR5BTyWyyI/LMaWS/xVJka92
1mQDlsXc6mSEgzrqOC+Zi+Is9lne1DMz5Xrud/srQweNCsoLnOwI5DOwbQ3SVUe+
YDtmyebX2W/Na9jAm7JCAlDcoEOAFg==
=E42r
-----END PGP SIGNATURE-----

--4FjINuUocUrb0j8X--
