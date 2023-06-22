Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFEC73AC81
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 00:32:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E83839;
	Fri, 23 Jun 2023 00:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E83839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687473127;
	bh=o2GQvxEc5BpUp1uobg6mA0N6S/AMxodCCAZUHy9rv3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kyvuiFJIG63eKgi8frSZg2GA9WerNrcF7DMUMp3mNedTNG1bM9l0N5ST11T12q4yU
	 UzPs2V1tobf+YkHFiVTU3rKM/SXlTjT2H3UO6CHM6e3D86ZvMggkL4yKVl5TSb0wtV
	 nE0dVuLCB0FjuG8FPab5PtBEPmY7yrlbzKQy/0oo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 124A0F8003A; Fri, 23 Jun 2023 00:31:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78DDFF80132;
	Fri, 23 Jun 2023 00:31:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7BF9F80141; Fri, 23 Jun 2023 00:31:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29E11F8003A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 00:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29E11F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IAJCfDuf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD2CF6191C;
	Thu, 22 Jun 2023 22:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A264DC433C8;
	Thu, 22 Jun 2023 22:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687473058;
	bh=o2GQvxEc5BpUp1uobg6mA0N6S/AMxodCCAZUHy9rv3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IAJCfDufzQNn/ivwQcKe6WpJWfFm6IrL67dtFzbHyRxVmBK/MZmxySXvhter1OFQj
	 rE+PU0ik9gNKEEjyyBZTpujD7DAvmCxLf6UqdADbC9E0DtshpoTBM8gNCj7p6frZ+8
	 ST6OuLvM9cD2v0BDKifK1y30/xDdnMcMjkctRY0B7CLvIbwrNXssL/V4znZctPSmTk
	 apFHT7ZT/lBuy1bRtBEdQQeRzxQGZBqDhWaw4qNYvcx8fJz6Pj6v1LmQBuveYrEldL
	 HyjQqVRzK33Gq0/BiK2NsiOps9YgHpbTda+OK2JUoPMI2iQPIp7mXbnIcEtbFM/Tyd
	 uuZCfOtxfK3DA==
Date: Thu, 22 Jun 2023 23:30:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/12] ASoC: amd: acp: add acp i2s master clock
 generation for rembrandt platform
Message-ID: <ZJTLnhlCFhW/s4Vd@finisterre.sirena.org.uk>
References: <20230622152406.3709231-1-Syed.SabaKareem@amd.com>
 <20230622152406.3709231-7-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nQi7X9Rprs7bSeTC"
Content-Disposition: inline
In-Reply-To: <20230622152406.3709231-7-Syed.SabaKareem@amd.com>
X-Cookie: I've Been Moved!
Message-ID-Hash: 3PANK4XMIYE7XJ57S5HANYDU5FOO35VO
X-Message-ID-Hash: 3PANK4XMIYE7XJ57S5HANYDU5FOO35VO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PANK4XMIYE7XJ57S5HANYDU5FOO35VO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--nQi7X9Rprs7bSeTC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 22, 2023 at 08:53:44PM +0530, Syed Saba Kareem wrote:
> Add acp i2s master clock generation logic for rembrandt platform.

This doesn't apply against current code, please check and resend.

--nQi7X9Rprs7bSeTC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSUy50ACgkQJNaLcl1U
h9CrIQf/YzqP801ZgPJ9zmTLdD3IDdoFNp8w5tHi7C3z8VNtXZZkbnFZGVAWzlan
MP8yEnoCvBn0ICgC29Ynunspwp68zp5UgfP/scy0bmYuaaaa74ZAl2QUomJfP+8x
IRgfKhpr344++V8vie6k8sAybOx5GbPBvsmzq96mLgUlN/JzUXYhESiZUcblFLrr
1vZb8iYhnvFDzrL4WqpbfwZAyErut78uk1DEZsvBYbL3CsQ4aj3fTjYnV2AsWH85
Agg2eDKuVpeBWrlvOKBr/fvIRmtd1I9Ro3ncAiZnhLvdTkIXkaS09LybqQViY/qI
txlasQmpvJ+3OcqOEFgmT/m2GTaYSQ==
=/2GN
-----END PGP SIGNATURE-----

--nQi7X9Rprs7bSeTC--
