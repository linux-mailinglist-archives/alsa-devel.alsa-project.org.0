Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB7B7B074D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 16:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48CD829;
	Wed, 27 Sep 2023 16:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48CD829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695826220;
	bh=pQlzDx9sfW0GlC0Y7pgv64nygCPa6BrlC7JafprNCP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hoOzqpJyCUp/6VeFz4Bis7y5Hl117hUT0OcczRov+2KP+HRdghOfYLjOi5lc8Fb7h
	 a8DBHTNnDpNVnpbwOFxT9e7IJYS5YM/xfOUYbtEJ9IngQFyHg7tuqHCLI8H5BP/lA1
	 Lklipi3lTv+L8EmE0x6zGbpvSTfOoeMr8ep8gAHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 004C0F80551; Wed, 27 Sep 2023 16:49:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 279D1F80166;
	Wed, 27 Sep 2023 16:49:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 489F1F8016A; Wed, 27 Sep 2023 16:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52F60F800AA
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 16:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52F60F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bl5pzRPn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D7FD6189D;
	Wed, 27 Sep 2023 14:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C22C433C8;
	Wed, 27 Sep 2023 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695826120;
	bh=pQlzDx9sfW0GlC0Y7pgv64nygCPa6BrlC7JafprNCP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bl5pzRPnJbn8R69RlzfxLZsYLcd7bTy1erhWrWzkefed4ZNBTLwDoHhh3WI0s9vrY
	 oIGJeKsnfzGw1V9RLFU84iSr4AysVaJkKBkfCg3djJbCKLYujzkeUHWpUNEibblIwF
	 AhiCXdjtdl1G9XVJPhAHzmg/+FuNmQGcLLJjjCLbbgAqseR8+IF9OAcvFti512XX1S
	 BLEUruF09UdAUW6p73Z9AS6VgWopRMFvXDNn92qKCbif34HVcf7blJ+RRFjOG/L+Uz
	 kzLwNt+jJXC4Ue+Fx5W15WqIetwGZopLjfLVzMa49uc8cTDXowTcDde6Yp+lUOHtQz
	 5yQAI5beGRmzQ==
Date: Wed, 27 Sep 2023 16:48:37 +0200
From: Mark Brown <broonie@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, Thinh.Nguyen@synopsys.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 06/33] ASoC: Add SOC USB APIs for adding an USB backend
Message-ID: <ZRRAxSlk8uvsfMcx@finisterre.sirena.org.uk>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-7-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="euZKnYeBKaUErfx5"
Content-Disposition: inline
In-Reply-To: <20230921214843.18450-7-quic_wcheng@quicinc.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: QKZ4JJ5RR7L5FI5P6QC7KNPUK5QOLLC6
X-Message-ID-Hash: QKZ4JJ5RR7L5FI5P6QC7KNPUK5QOLLC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKZ4JJ5RR7L5FI5P6QC7KNPUK5QOLLC6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--euZKnYeBKaUErfx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 21, 2023 at 02:48:16PM -0700, Wesley Cheng wrote:

> +static struct device_node *snd_soc_find_phandle(struct device *dev)
> +{
> +	struct device_node *node;
> +
> +	node = of_parse_phandle(dev->of_node, "usb-soc-be", 0);

Very nitpicky but this function possibly wants a _usb_ in the name, not
that it *super* matters with it being static.  Or it could just be
inlined into the only user and not worry about the naming at all.

> +/**
> + * snd_soc_usb_get_priv_data() - Retrieve private data stored
> + * @dev: device reference
> + *
> + * Fetch the private data stored in the USB SND SOC structure.
> + *
> + */
> +void *snd_soc_usb_get_priv_data(struct device *dev)
> +{
> +	struct snd_soc_usb *ctx;
> +
> +	ctx = snd_soc_find_usb_ctx(dev);
> +	if (!ctx) {
> +		/* Check if backend device */
> +		mutex_lock(&ctx_mutex);
> +		list_for_each_entry(ctx, &usb_ctx_list, list) {
> +			if (dev->of_node == ctx->dev->of_node) {
> +				mutex_unlock(&ctx_mutex);
> +				goto out;
> +			}
> +		}
> +		mutex_unlock(&ctx_mutex);
> +		ctx = NULL;
> +	}

This seems a lot more expensive than I'd expect for a get_priv_data
operation, usually it's just a container_of() or other constant time
pulling out of a pointer rather than a linked list walk - the sort of
thing that people put at the start of functions and do all the time.
If we need this I think it needs a name that's more clearly tied to the
use case.

I didn't actually find the user of this though?

--euZKnYeBKaUErfx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUUQMIACgkQJNaLcl1U
h9ARZgf8CYja41GdW3VT31//3OXBmHhA+ZyVnUHKPoAk+sVGUSPuWSMWqTuOh8kX
TrPKgwMNXXxoCx9OHwju1RHbawvVqk3u5JcUJbhjoeUJNznxWjlECqzrHh6WyGdL
LRJOl1vyLQKE32a3HCj23yHvD5RSwBDS+v8xLFxT6CH3EUtQ/ss0km0l6jI/6vWy
Q+UxN1Vtn0gbDY7OVRq+wayHhCIypY6Sh/R2NUIzyD/NN3ba8i06y9q571xtInTm
wSpg2pU5eZSPYzP0MUi1thWllS5odon7x41CuVkGn873YXonnOqMuzUb4p9DmAZf
zD42mQwXGJPd5pQUPBGV7mTmP52Gqg==
=q3ep
-----END PGP SIGNATURE-----

--euZKnYeBKaUErfx5--
