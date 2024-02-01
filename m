Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252AA845632
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 12:26:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079249F6;
	Thu,  1 Feb 2024 12:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079249F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706786788;
	bh=8FsMzGJfsM0aOcmxMpvBjhVsj+8VYxKWtsJcxs8GM5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NaGJDhQ2/d+ZGNJfaQsJ90dFrGVEp4yRgw0WB5L8+/yxlDiRay2mv353rgXRjDNC8
	 a9vTWKCksdnfQrhdCZcYZbz257DRSoKzoafSOIH3hVvcPF/Lb6YAIvBTDMOktzDs26
	 bOyokWWrYk50lTJwrXaZbDm4VBMPYY8hDPNO8X1U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F27CF805AB; Thu,  1 Feb 2024 12:25:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9663BF80563;
	Thu,  1 Feb 2024 12:25:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E834F8055C; Thu,  1 Feb 2024 12:25:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13942F80149
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 12:25:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13942F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OZz4QSq+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E826CE2298;
	Thu,  1 Feb 2024 11:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EC9C433F1;
	Thu,  1 Feb 2024 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706786737;
	bh=8FsMzGJfsM0aOcmxMpvBjhVsj+8VYxKWtsJcxs8GM5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZz4QSq+RagaDlfjVVz5KtwyqN+z6+sFOtdgVwirtr8OUVEyjsqZmctO07hi8NI32
	 7CXregjsqNFCRgNzAQC6LkIWzv5+FlZ5wptO3v4wdXf9QnO1eGpacIgLM+ofZOdYxj
	 hAVJ2KjiNLCky+UQLUuEHvtkt1AjCPRNtR+Gf4R7opVdUrpjheRe1N1Z6Ile36juWk
	 LyEHXJ1jGYRdeA/3Qd/ypbl0w5N5Zld3EkS/FrAXVZWt29xWDcW/7+Tb1+hdFwMFor
	 epg+86jqzzvkzy+KV9xJKQ8Wb03jVceOWng1nGR8KT30YOw61WiY7hww8gsNtTPFGI
	 B1ljn8Z04DlNA==
Date: Thu, 1 Feb 2024 11:25:27 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
	ribalda@chromium.org, nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de, kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com, alsa-devel@alsa-project.org,
	trevor.wu@mediatek.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, lgirdwood@gmail.com
Subject: Re: [PATCH 0/7] ASoC: mediatek: AFE drivers cleanups
Message-ID: <6f7a34b6-6f65-42c3-a92d-6b064bf9dee1@sirena.org.uk>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
 <cace3472-7ee3-459b-ab2c-51764db99bd7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PVPGHszu86wFrqHg"
Content-Disposition: inline
In-Reply-To: <cace3472-7ee3-459b-ab2c-51764db99bd7@collabora.com>
X-Cookie: You can't cheat the phone company.
Message-ID-Hash: CBK6IR7YS2UJ7H2IADZEEXR4VQMET64Y
X-Message-ID-Hash: CBK6IR7YS2UJ7H2IADZEEXR4VQMET64Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBK6IR7YS2UJ7H2IADZEEXR4VQMET64Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--PVPGHszu86wFrqHg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 11:08:41AM +0100, AngeloGioacchino Del Regno wrote:
> Il 11/01/24 11:52, AngeloGioacchino Del Regno ha scritto:
> > This series converts MediaTek AFE drivers' probe functions to use
> > dev_err_probe() and devm functions where possible and, in some
> > cases, dropping the .remove_new() callback, reducing the size.

> Gentle ping for this series, afraid that went out of the radar :-)

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--PVPGHszu86wFrqHg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW7f6cACgkQJNaLcl1U
h9CaHgf8CtVCkC6J116wxuSCyfeBTiCzoyj46PgrA3xwNRTTduzax3JoO/1grpq3
5NlOg1xyh3YtqEDvxa2wBDCc6fM3zw9mAQPKiXCqHHI2A8WH8xMPSJzvlhfrC14S
SDY7qm/mG8CiXyEI84YBRHdgoxBnBqECwRehV975FL3ZvrDYSQTFO4EbYI0I1oNI
arokA5pQoEzgBMazkodUtmgDueOoBVtbT7HQMsMTjtn+iQ7dMAhf2wGc8uhMC3K1
8jB9piZTC2sZHVRli3Rbzrs4TMYz8Ji5ey/zUMcsfKBO1/awWWGrYqm8eEZJiME4
TtANCMujJdC2XSTWBBod6hXZGV07oQ==
=z6oI
-----END PGP SIGNATURE-----

--PVPGHszu86wFrqHg--
