Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D562D1431
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 18:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90C051682;
	Wed,  9 Oct 2019 18:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90C051682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570639048;
	bh=dqgAKgazOFueDoqPDHC0a/zpuOBcSlraoD6UQ+eWitI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CnA6Lhm78LbxJ2td1CUL7sGJpLocK6HHVKkKZ6xkiIfGha/3MJsDkpWMtO4S6GfK0
	 1XLsmiZ9ewJDZnn1ZXt76nM3vez1dK7mPEOsEDVvPXtX4QJqo9Ng6QhMgXsduEDy/g
	 24cT67c/uXBMUGeLqInb19pB2HSceKLYOsC1QwGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0366F802FB;
	Wed,  9 Oct 2019 18:35:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61CA9F802BE; Wed,  9 Oct 2019 18:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EFF7F800BF
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 18:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EFF7F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xxg1yPso"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=owdfGfpxxrkSa3bEZCcNRIXecf20ZOjPIlOoM7dfj2Q=; b=xxg1yPso5ztQ/T7iDk98vnYtJ
 yNHDZeAYSyQgIshsARNOL1FqCQHj1VaXP/dJo3gUYOY4qNXNjz8JpcxJEkFrKPBIfNIu4MnUjB0X/
 mrL0zJGtyr4YRB57vqtiNy9kEoc+5kEgCnwLvlhTUdhlab7uBtEBflGAKjCp4spvsCDHE=;
Received: from 188.31.199.195.threembb.co.uk ([188.31.199.195]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIEw5-0005Em-A6; Wed, 09 Oct 2019 16:35:37 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 19E0BD03ED3; Wed,  9 Oct 2019 17:35:35 +0100 (BST)
Date: Wed, 9 Oct 2019 17:35:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191009163535.GK2036@sirena.org.uk>
References: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
 <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v7 2/2] ASoC: codecs: add wsa881x amplifier
	support
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
Content-Type: multipart/mixed; boundary="===============3324649985182184486=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3324649985182184486==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4+GP5VtpSFAXb8tV"
Content-Disposition: inline


--4+GP5VtpSFAXb8tV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 09, 2019 at 09:51:08AM +0100, Srinivas Kandagatla wrote:

> +static const u8 wsa881x_reg_readable[WSA881X_CACHE_SIZE] = {

> +static bool wsa881x_readable_register(struct device *dev, unsigned int reg)
> +{
> +	return wsa881x_reg_readable[reg];
u
There's no bounds check and that array size is not...

> +static struct regmap_config wsa881x_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_RBTREE,
> +	.reg_defaults = wsa881x_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(wsa881x_defaults),
> +	.max_register = WSA881X_MAX_REGISTER,

...what regmap has as max_register.  Uusually you'd render as a
switch statement (as you did for volatile) and let the compiler
figure out a sensible way to do the lookup.

> +static void wsa881x_init(struct wsa881x_priv *wsa881x)
> +{
> +	struct regmap *rm = wsa881x->regmap;
> +	unsigned int val = 0;
> +
> +	regmap_read(rm, WSA881X_CHIP_ID1, &wsa881x->version);
> +	regcache_cache_only(rm, true);
> +	regmap_multi_reg_write(rm, wsa881x_rev_2_0,
> +			       ARRAY_SIZE(wsa881x_rev_2_0));
> +	regcache_cache_only(rm, false);

This looks broken, what is it supposed to be doing?  It looks
like it should be a register patch but it's not documented.

> +static const struct snd_kcontrol_new wsa881x_snd_controls[] = {
> +	SOC_ENUM("Smart Boost Level", smart_boost_lvl_enum),
> +	WSA881X_PA_GAIN_TLV("PA Gain", WSA881X_SPKR_DRV_GAIN,
> +			    4, 0xC, 1, pa_gain),

As covered in control-names.rst all volume controls should end in
Volume.

> +static void wsa881x_clk_ctrl(struct snd_soc_component *comp, bool enable)
> +{
> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);
> +
> +	mutex_lock(&wsa881x->res_lock);

What is this lock supposed to be protecting?  As far as I can
tell this function is the only place it is used and this function
has exactly one caller which itself has only one caller which is
a DAPM widget and hence needs no locking.  It looks awfully like
it should just be a widget itself, or inlined into the single
caller.

> +static void wsa881x_bandgap_ctrl(struct snd_soc_component *comp, bool enable)
> +{
> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);

Similarly here.

> +static int32_t wsa881x_resource_acquire(struct snd_soc_component *comp,
> +					bool enable)
> +{
> +	wsa881x_clk_ctrl(comp, enable);
> +	wsa881x_bandgap_ctrl(comp, enable);
> +
> +	return 0;
> +}

There's no corresponding disables.

--4+GP5VtpSFAXb8tV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2eDFYACgkQJNaLcl1U
h9CtLgf8CePH7+ZsY0W4cRF5zvZs+qrkT8EShEl1pRNhR80s4tivFZnFYccKkM1a
NSlUywoTsagGw1dijsM7tCzj82aQ5pxABSezmv0erVwZv9cFqnbfNG/yh3epnLbH
/T/MBashmZA7sR02wH7y3PFvxlWkH3buk6jlwKeCJtZNnX6pGpv5mfwy5p9nkygB
iIgIG6WEd8pB0/pGk4MVArDRhLIGkH2C+cyxEC46zIG6FVrfi1DlNffgYjmbne6N
UO6g0GtmdlI6HyuLCQ4DO56BrExtnjieHzCJgyyFN6vn86S6OFLwFGfj8P8lduk7
GAvcrZSHg8UKdrOLheSE57TbN6KqGQ==
=ijUj
-----END PGP SIGNATURE-----

--4+GP5VtpSFAXb8tV--

--===============3324649985182184486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3324649985182184486==--
