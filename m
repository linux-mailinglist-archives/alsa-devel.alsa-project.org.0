Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B22B26E50B9
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 21:17:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 649A8A4C;
	Mon, 17 Apr 2023 21:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 649A8A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681759020;
	bh=3pjer+RGMILMz18g1Tf5vlj2E6yHnERNJKjfP9RlMZQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LFR0c4C009sdf1QFmEdXAE0Itdup+mqlQIoMKGaXV5fsiuza9eFJoSB1ZzrXWHexh
	 cq80b6w0BNK/EqHtDEXRlF+V5xT0EVyOxKEeFcWHZEjZmQDvoR0X7t4iyFSw1hG3Jh
	 iZoGBQZSvLAXr0YoBoqu/U2XqfML/RaOI1+hcGf0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF21DF8025D;
	Mon, 17 Apr 2023 21:16:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F429F80266; Mon, 17 Apr 2023 21:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4635F8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 21:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4635F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P71Uwm3O
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5852D62115;
	Mon, 17 Apr 2023 19:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75103C433D2;
	Mon, 17 Apr 2023 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681758957;
	bh=3pjer+RGMILMz18g1Tf5vlj2E6yHnERNJKjfP9RlMZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P71Uwm3OV9bNItKXU+tAYmFshPVvY4lQzMfChiVKoKQbqxnxcEbNn6amFMSanMuaL
	 HGgGWtX0E2oEKL1POmtRWv0crAZDTtyk3OtHm9LPwSL3I3PIx1kCqU9LstG0t22PSC
	 zp0eFMcUz0c6vAWXenaBoOLcR6ig5XGTetQtvDLGRpH/0g2tmQdbb/xWCrUUy5khCT
	 3z4okM/GsAc1JEHVYLeFVhfpR62k1tz2GbLjLOT4KEIOsdaE2Nuv/rD9/kdm6M77tx
	 jlg0JZjAYKt5bLmZMdgGwN7yMSwCV9Bzvh+c16WueNqQZRbS2wEjdGtAHQBh1XT1C4
	 fk7gnZ3f+5GhQ==
Date: Mon, 17 Apr 2023 20:15:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Liliang Ye <yll@hust.edu.cn>
Subject: Re: [PATCH 2/2] ASoC: fsl_mqs: call pm_runtime_disable() on error
 path
Message-ID: <591e902d-afb9-4b2b-baa0-910b6d74e4e7@sirena.org.uk>
References: <20230403152737.17671-1-yll@hust.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9F6xcT18d9sN4CTo"
Content-Disposition: inline
In-Reply-To: <20230403152737.17671-1-yll@hust.edu.cn>
X-Cookie: I'm having an emotional outburst!!
Message-ID-Hash: EEZCB4DVE7HQDM7DKDJR65CQP7CTVNIZ
X-Message-ID-Hash: EEZCB4DVE7HQDM7DKDJR65CQP7CTVNIZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 hust-os-kernel-patches@googlegroups.com, Dan Carpenter <error27@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EEZCB4DVE7HQDM7DKDJR65CQP7CTVNIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9F6xcT18d9sN4CTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 03, 2023 at 11:27:37PM +0800, Liliang Ye wrote:
> pm_runtime_disable was missed in cleanup operation, which corresponds to
> the earlier call to pm_runtime_enable.

This doesn't apply against current code, please check and resend.

--9F6xcT18d9sN4CTo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ9muYACgkQJNaLcl1U
h9BMUAf+PnW18wz6sGANQlExJIeon2TwYOrrp9RHa2hkx65i/UJjI36L50t3jcg9
vZngy/COz43Es/GqsNfNBntqHgL66yH332vDc/17NXKRpf0jYb7oR6UO5D7WQPCt
cb/+PO4zE7sPIwDuOlemNGL8iqnV9ya6oXDPYJfmU0njYGJVClEkw9Th8iqu7dOA
dUOmGg6/Bdop+lAzX3S0W3EcocCHqHAJT3fXXcbttqLeP01KC4DOCnik29oBmMAp
t6lHdlgrDglj/HCq1u7LsZmoQG8GEtg1mdo43qNx3m1glwm3XehOmSZNh7G55qL6
BiL4K4amqeutEfx/23OAKiY3T2tuoA==
=Hr0m
-----END PGP SIGNATURE-----

--9F6xcT18d9sN4CTo--
