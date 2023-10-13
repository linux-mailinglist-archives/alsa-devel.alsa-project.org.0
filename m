Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6464B7C8788
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 16:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88B2A83B;
	Fri, 13 Oct 2023 16:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88B2A83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697206342;
	bh=yblgfOK1RNan7Z74qeOHcSvb7Lln2WHm9wFm6gXbhf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q6wC97hhggdzK7EaQ6BQObxIVQWGp7pg6d+G0cZUyXEU8L5jSVNVVMHkT7T6R8sch
	 zM/igG/VtpVzjfENDBXPnKmBfRuKSpyEdUcjJNTlQ51iQWre62KWwnd+Mx2W7N0V3h
	 qpVOLwiZsvIirkLmdOa1cxpjTw11hry+22ZaD8OQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20E4EF802BE; Fri, 13 Oct 2023 16:11:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F0A0F8027B;
	Fri, 13 Oct 2023 16:11:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AF71F802BE; Fri, 13 Oct 2023 16:11:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08F46F80166
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 16:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08F46F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BDgw2I9R
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 881EE620F4;
	Fri, 13 Oct 2023 14:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76931C433C7;
	Fri, 13 Oct 2023 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697206260;
	bh=yblgfOK1RNan7Z74qeOHcSvb7Lln2WHm9wFm6gXbhf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDgw2I9RUVi8FmfXMdDwfGWWNWixrlRokLda/7jno+fJ0koZRbGXp4dIOEsmtjntk
	 6fTddidzhz/mBuaPzrgogyNNdQ4S/lmQAX+MOzr6brBSVnw8KeMcPv8anPgzJdIlKd
	 4trW7twlDDnTL7za8haPzW56eNNAUr/sVEvMqRvex2XCQQRRqBNKLpBFiZJEMthMLz
	 0RKpWnMpUztZPjibvq/g53a3cHwBso92RdxE1Hu11O9jXTAoWHQ+EnBQkRbto/DNjS
	 qQ8ECY/K6f3DxAk2jfce54Obn1QWtZMLUuYoodqBF+OM0hH1f5lS2YGjeCbn5ELlkc
	 kJow/8QLddtPw==
Date: Fri, 13 Oct 2023 15:10:56 +0100
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, herve.codina@bootlin.com,
	shumingf@realtek.com, rf@opensource.cirrus.com, arnd@arndb.de,
	13916275206@139.com, ryans.lee@analog.com, linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com, fido_max@inbox.ru,
	sebastian.reichel@collabora.com, colin.i.king@gmail.com,
	liweilei@awinic.com, trix@redhat.com, dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw88399 amplifier driver
Message-ID: <ZSlP8GvTAOe35peC@finisterre.sirena.org.uk>
References: <20231013104220.279953-1-wangweidong.a@awinic.com>
 <20231013104220.279953-4-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ralK2eSCf+ixFXP0"
Content-Disposition: inline
In-Reply-To: <20231013104220.279953-4-wangweidong.a@awinic.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: FL2DQCKGIQ6Y5IPHB3RK6ZCVTFTU7L2B
X-Message-ID-Hash: FL2DQCKGIQ6Y5IPHB3RK6ZCVTFTU7L2B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FL2DQCKGIQ6Y5IPHB3RK6ZCVTFTU7L2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ralK2eSCf+ixFXP0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2023 at 06:42:20PM +0800, wangweidong.a@awinic.com wrote:

This looks good - some *very* minor comments below.

> +static const struct regmap_config aw88399_remap_config = {
> +	.val_bits = 16,
> +	.reg_bits = 8,
> +	.max_register = AW88399_REG_MAX - 1,

I see this is already the case for the aw88261 driver but it is a bit
weird that _REG_MAX isn't the maximum register - it looks like it should
probably be _NUM_REG.  Not the end of the world though.

> +static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
> +			unsigned char *data, unsigned int len, unsigned short base)
> +{
> +	int i, ret;
> +
> +#ifdef AW88399_DSP_I2C_WRITES
> +	u32 tmp_len;

This looks like debug code which can hopefully be removed in favour of
the regmap implementation?

> +static int aw88399_codec_probe(struct snd_soc_component *component)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
> +	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	ret = aw88399_request_firmware_file(aw88399);
> +	if (ret < 0) {
> +		dev_err(aw88399->aw_pa->dev, "%s failed\n", __func__);
> +		return ret;
> +	}
> +
> +	INIT_DELAYED_WORK(&aw88399->start_work, aw88399_startup_work);
> +
> +	/* add widgets */
> +	ret = snd_soc_dapm_new_controls(dapm, aw88399_dapm_widgets,
> +							ARRAY_SIZE(aw88399_dapm_widgets));
> +	if (ret < 0)
> +		return ret;
> +
> +	/* add route */
> +	ret = snd_soc_dapm_add_routes(dapm, aw88399_audio_map,
> +							ARRAY_SIZE(aw88399_audio_map));
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = snd_soc_add_component_controls(component, aw88399_controls,
> +							ARRAY_SIZE(aw88399_controls));

You should just be able to pass these arrays in the component strucutre?

--ralK2eSCf+ixFXP0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpT+8ACgkQJNaLcl1U
h9CaAggAgc0J/p2bTSZNLjaIAKHFr9ldNYbl+3tMxNJwBnPfL3p07scPxSt/foY8
rLrtsYpfxKahAjbKlN1R9JtZVYuMyUfO33ed2Ww093sWB513nZMd31yCzh1+sY1g
DlRT6ezLSe2XTkGTt2mFyzJcqLZOIrIzfOndism4/Esuk872ziqlaMTjq/2GBLVb
WNY4D5bUcRxlFl1jphCDCSsJYCy9lpZMLaHPWrlbJh0tq1k5r7WvJ/rG0vOhGQTN
GT5x1j0CifyeA5x5TjI/wWuJhAVRjHxc4NYaI8806i34cybrI8JUIf98JYyD/M7+
7xDFdzxO/GXPZzSRctMol3uf+grzhQ==
=22g1
-----END PGP SIGNATURE-----

--ralK2eSCf+ixFXP0--
