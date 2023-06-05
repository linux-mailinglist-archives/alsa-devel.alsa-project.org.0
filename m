Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08987722596
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 14:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BD65822;
	Mon,  5 Jun 2023 14:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BD65822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685967909;
	bh=3XJ3CX74cEF4Q3nfqZps5CttXlclsjstFcGlPIPxyEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iCgcEvU2FE7iSvRHvnHHKpDVhcp/GDcH6F9A0k79k8urzT9yPGAlgSFEFnCSdKSQ5
	 i4WDoPBWg931jQUp40EMevvTzuqSGfzBzwKqUVWPgu62Z1CzdpBj/7/OcFxhAcZS8w
	 HyCkbpm+wDfWpabgcoOm/RGfDM2tShhybjk4O+nY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9EBFF80548; Mon,  5 Jun 2023 14:24:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 932EFF80254;
	Mon,  5 Jun 2023 14:24:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 710D1F80254; Mon,  5 Jun 2023 14:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55D30F800ED
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55D30F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LK1vq9wA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22400617A4;
	Mon,  5 Jun 2023 12:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF35C433D2;
	Mon,  5 Jun 2023 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685967850;
	bh=3XJ3CX74cEF4Q3nfqZps5CttXlclsjstFcGlPIPxyEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LK1vq9wAGu1rIw7HVwmgO8/4HPXscMR8ynOztaTsRQewzenEddwGbzUNMCEHawBhm
	 L6c6c4mKNEx6HjFXDrSYebEf3+lBNvsSUS7HBqrRtC/FSlehigYdAywo/8CJO3RNMn
	 QCu0v65m8hzBSDDdHpbvoQfApWRcLGaE0JzGKkXwzacS5MlD4XeiYn26fk/YjXn9u0
	 6p7wDrsnnlXhElKftGTyx3/1bUMZu/PwKfgJrthynfyuVR6b+hNvWSukuOHybXv8/w
	 0GyDczyLhAi/NVa74vYE+Jg6sKGbfBMPNVcRI/O2JphLhV2Q8wkvDnJs1au24rLh6x
	 qcfuiBRAJB4Zw==
Date: Mon, 5 Jun 2023 13:24:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Message-ID: <b3bc0a07-4dcb-4f50-a7b3-91a4a62fac56@sirena.org.uk>
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
 <168492769030.49784.4719862081052299023.b4-ty@kernel.org>
 <ZH2YAmBY-GNKABSB@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ok25a2MEpMxstcGN"
Content-Disposition: inline
In-Reply-To: <ZH2YAmBY-GNKABSB@hovoldconsulting.com>
X-Cookie: Biggest security gap -- an open mouth.
Message-ID-Hash: SMP2ROGQCKDYUF6AH3Y4DUY4NC2YIJQ3
X-Message-ID-Hash: SMP2ROGQCKDYUF6AH3Y4DUY4NC2YIJQ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SMP2ROGQCKDYUF6AH3Y4DUY4NC2YIJQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ok25a2MEpMxstcGN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 05, 2023 at 10:08:34AM +0200, Johan Hovold wrote:

> Is it possible to get also these fixes into 6.4 final?

They're already queued for 6.4.

--ok25a2MEpMxstcGN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR90+MACgkQJNaLcl1U
h9BuzQf9E2vipezYFq9x6blmKPb2enncfDAG+fuefll3u6zaRBmvsMSYn+h0w0gI
IuPcXAbCrCOietnX7Xa9A+3hF0RFYiKEjhWQZpNdq5zAOnd2IzSFDIX+AZvzSsop
tszKa+KFjvKLiGUvCnwwpJoNH/urkz+CHoFmY5jX22GXI8zbryYmVc4FIn2nfupk
jGMi3gRxmC1itgyIwjpMe3jCBtFNeDCn0Dxo3nRh2ggRn0aXhMlCFNO4vmxOE0SJ
MlrCHzAn26E4Sumkftlcwn9YlNCaejtYxwR85SW72EUfo7qFm+CpureSmJkXf+W7
BS/JwMuJ0rxJtsmqbmKHBaJJUY3C6Q==
=+bss
-----END PGP SIGNATURE-----

--ok25a2MEpMxstcGN--
