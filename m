Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD0D73A09C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 14:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36F02845;
	Thu, 22 Jun 2023 14:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36F02845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687435997;
	bh=6Xu2wCENStSvaqj43E0Q17bFqGPg6/KNIkyezGCjmnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LKHeFbPU88/8DFMUPCdtsrnA4v8ZrtfhZ8g6thDSbYLunhfTfuB4Aoroimp0G8+GO
	 vH9UJvE7tWv7zfMEPlkxNspAbyDv5fl974h91G65w5hl90K+J+P0xJDw2lYkTzPZYo
	 Pw0whmFLE8bp8kc/UYwfhnZe79WaJg4DH7wgXi8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63C8DF801D5; Thu, 22 Jun 2023 14:12:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C453DF80132;
	Thu, 22 Jun 2023 14:12:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77D1DF80141; Thu, 22 Jun 2023 14:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8630CF80130
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 14:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8630CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lEijQyi4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB14161812;
	Thu, 22 Jun 2023 12:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C498C433C9;
	Thu, 22 Jun 2023 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687435937;
	bh=6Xu2wCENStSvaqj43E0Q17bFqGPg6/KNIkyezGCjmnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lEijQyi4tSvUQdLQTfvjGyAXE13WFLKTiKn9tymotGyj9MrpyhZSM7jxUtoXTnhlQ
	 9Rs2WrifoUxDkLoN3Fxsjh2/03rA2HwHIx1OtFENRQSVl1GvQS4O7DG7eKMi2b4D1n
	 ct6UCFzsprZqVyfmn3PV4zP0GnVHHOuEnbLc0FJbz5N6ZEZ0k75dnBEUQ90EraDg+4
	 MY6Gu13FmEtBPGDk5io18V5/rCYIY1DJEkptOvU49XuUJmy77lu+11XUmHDauCkYox
	 JdTnd30ahs5uhB5/0lVwaC0BWzyLUSWO1axZxwSEXj0JiTDyb08V5Kvo7EV9xip3YU
	 i4SUA21+MSwzQ==
Date: Thu, 22 Jun 2023 13:12:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Cc: robh+dt@kernel.org, krzk+dt@kernel.org, thierry.reding@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	jonathanh@nvidia.com, mkumard@nvidia.com, sheetal@nvidia.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH 4/8] ASoC: rt5640: Fix sleep in atomic context
Message-ID: <f7414eb4-71f8-486b-81d3-6f467521c013@sirena.org.uk>
References: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
 <1687433656-7892-5-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PmZf6YixTAJnTWBR"
Content-Disposition: inline
In-Reply-To: <1687433656-7892-5-git-send-email-spujar@nvidia.com>
X-Cookie: Please ignore previous fortune.
Message-ID-Hash: E5OMKYQOMJP3TOTOVLAILP5R5AEFOYAN
X-Message-ID-Hash: E5OMKYQOMJP3TOTOVLAILP5R5AEFOYAN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5OMKYQOMJP3TOTOVLAILP5R5AEFOYAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--PmZf6YixTAJnTWBR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 22, 2023 at 05:04:12PM +0530, Sameer Pujar wrote:

> The IRQ handler rt5640_irq() runs in interrupt context and can sleep
> during cancel_delayed_work_sync().

> Fix this by running IRQ handler, rt5640_irq(), in thread context.
> Hence replace request_irq() calls with devm_request_threaded_irq().

> -		ret = request_irq(rt5640->jd_gpio_irq, rt5640_jd_gpio_irq,
> -				  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
> -				  "rt5640-jd-gpio", rt5640);
> +		ret = devm_request_threaded_irq(component->dev,
> +				rt5640->jd_gpio_irq,
> +				NULL, rt5640_jd_gpio_irq,
> +				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
> +				"rt5640-jd-gpio", rt5640);

This is rt5640_jd_gpio_irq() which just does a queue_delayed_work() not
a cancel.  Why is it being changed?

--PmZf6YixTAJnTWBR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSUOpkACgkQJNaLcl1U
h9Cs8wf/UEwbtTdAHWhK0Uu6tv5x19scLqiFmt/RTXgMBciw2qZ3rUJ4O1QUQPlX
U7c0gneOB6DTzi+Hu3kfRdDvBjssXw962tweKWabtHgAN0KtJPjpPS65N2H43QeB
N1GtXkNBhQuHfCebmyvMch0Q4lptS4VZP05IRwMnOk85w0qCg4q+FbIZR0IF8V6D
5nzYgpoNaG02mha0jX6Wh7+10Ln3qPEFmTaoEUAYxBh+xpMC0TGUfuCkQOp4eSD/
uskCAVoBstJpyWtqalSm7Z9HUjX58qwk8hro8IRWPdg7T+FPcZUgW8dnhJ5Srs4+
UGV61KEklv6gSCJI63L0jH5dtFly7Q==
=erIT
-----END PGP SIGNATURE-----

--PmZf6YixTAJnTWBR--
