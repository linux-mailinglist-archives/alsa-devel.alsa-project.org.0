Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CBC63C72D
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 19:28:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C36471695;
	Tue, 29 Nov 2022 19:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C36471695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669746515;
	bh=Bn1EjV5Z2D/9rZ4hniykDLaoKLrRx2gea+VyDgC6Ql4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EMoKZF5UaM5cwGNiWR7AYXrtk383L0YV4sCXhP0/KWQ19ypoqFll59xeP65ciKZ/R
	 ChQVkNYZZz+RLOtLCU+JghEvmSI70dA5dKLbKN7EWxXM3PBg4PZWldPQb37Kc5fwm4
	 Zu7Jlhq1m1x+zEGXG9N5bw95njcn7bsTGw3tWIHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D940F80212;
	Tue, 29 Nov 2022 19:27:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1381CF801F7; Tue, 29 Nov 2022 19:27:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E86BF80166
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 19:27:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E86BF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o0fYEYXu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E170561892;
 Tue, 29 Nov 2022 18:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D174C433D6;
 Tue, 29 Nov 2022 18:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669746448;
 bh=Bn1EjV5Z2D/9rZ4hniykDLaoKLrRx2gea+VyDgC6Ql4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o0fYEYXuXRTPGWaasYTj0gwLduZbOilJm4sUhilmGWXEUwmrgx11TyqvyKErG4Qxf
 1cg9joxfRTViNkIs9oU9sCIyoonBC2Vis5X/uZ0uSfY1E6V+t1cf3iLB+FpJO57KkI
 cUkh2COcZqSuB1y3/380KgPMEcevhPoEmSbZwHDoMnvfTPIrsMH0oLmiVpsVyhbO3G
 e2z4R9BVPb33qnch47QKLmTg0r9yfBz+qr2hj1qDLz5oIhtddy3qbFkuLDGZYdnT0P
 o6W4vKOLHrGGOE0kuofWwg5FjxY48K70Z2GA2JRYT4+E+6ZTvjK9nuMQ0CCH1n3T6G
 sirec0kLTDRBg==
Date: Tue, 29 Nov 2022 18:27:21 +0000
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Subject: Re: [patch v5 2/5] ASoC: codecs: Implementation of aw883xx
 configuration file parsing function
Message-ID: <Y4ZPCa1rIM8dFVXp@sirena.org.uk>
References: <20221115022423.6437-2-wangweidong.a@awinic.com>
 <20221125092727.17414-1-wangweidong.a@awinic.com>
 <20221125092727.17414-3-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2ZQpEXguQlZNjbtt"
Content-Disposition: inline
In-Reply-To: <20221125092727.17414-3-wangweidong.a@awinic.com>
X-Cookie: An apple a day makes 365 apples a year.
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 duanyibo@awinic.com, liweilei@awinic.com, tiwai@suse.com, zhaolei@awinic.com,
 cy_huang@richtek.com, yijiangtao@awinic.com, robh+dt@kernel.org,
 zhangjianming@awinic.com, krzysztof.kozlowski+dt@linaro.org,
 quic_potturu@quicinc.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--2ZQpEXguQlZNjbtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 25, 2022 at 05:27:24PM +0800, wangweidong.a@awinic.com wrote:

> +	check_sum = GET_32_DATA(*(p_check_sum + 3), *(p_check_sum + 2),
> +				*(p_check_sum + 1), *(p_check_sum));

We've got the be32_to_cpu() and so on macros - I suspect that
GET_32_DATA() should be one of those.

> +static int aw_check_data_version(struct aw_bin *bin, int bin_num)
> +{
> +	int i = 0;
> +
> +	for (i = DATA_VERSION_V1; i < DATA_VERSION_MAX; i++) {
> +		if (bin->header_info[bin_num].bin_data_ver == i)
> +			return 0;
> +	}
> +	pr_err("aw_bin_parse Unrecognized this bin data version\n");
> +	return -DATA_VER_ERR;
> +}

This seems like an inefficient way of writing

	if (bin->header_info[bin_num].bin_data_ver < DATA_VERSION_V1 ||
	    bin->header_info[bin_num].bin_data_ver > DATA_VERSION_MAX ||)

surely?

> +static void aw_get_single_bin_header_1_0_0(struct aw_bin *bin)
> +{
> +	int i;
> +
> +	bin->header_info[bin->all_bin_parse_num].header_len = 60;
> +	bin->header_info[bin->all_bin_parse_num].check_sum =
> +		GET_32_DATA(*(bin->p_addr + 3), *(bin->p_addr + 2),
> +				*(bin->p_addr + 1), *(bin->p_addr));

The standard way of writing this would be with a packed struct with
endianness annotations, that's a bit less error prone than this.  I also
didn't spot the size validation that ensures that we're not walking past
the end of the binary image anywhere in the code, it might've been there
but it could do with being rather more obvious.  There are some size
checks further down but it's not clear that they align with what's going
on here.

> +static int aw_parse_each_of_multi_bins_1_0_0(unsigned int bin_num, int bin_serial_num,
> +				      struct aw_bin *bin)
> +{

Given a function with an each_of name I'd expect to see a loop over
multiple binaries?  I see the loop in the caller but it's a bit
confusing.  Perhaps one_of.

> +	for (i = 0; i < cfg_hdr->a_ddt_num; ++i) {
> +		if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MUTLBIN) &&
> +			(aw_dev->chip_id == cfg_dde[i].chip_id) &&
> +			((aw_dev->i2c->adapter->nr == cfg_dde[i].dev_bus) &&
> +			(aw_dev->i2c->addr == cfg_dde[i].dev_addr))) {
> +			(*scene_num)++;
> +			}
> +	}

Some of the indentation in this code is really hard to read - for
example here it'd be better to align the if conditions with the brackets
in the if statement to separate from the code that gets run if the
condition is true.

--2ZQpEXguQlZNjbtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOGTwgACgkQJNaLcl1U
h9BSbQf/UPYBwUuZJvZzStHf0MBZLMXnbUBfVxq++Dnf8K+h1fy2H0tsPwgFWLaV
qN8FsJNmtE2VEQIztZ0699Q6JPgDaydZYcJwYlnPPo+lNBrWILlkbTm7/bvpC3iN
7LJoV8U+6Roo3tpDn33ahp6lJRNKkZvkMcCnZ1lC7D9qrG9VBX9i5cYQiAhFG37Z
TerCJzNVEJpSx5R2FZBnRws6Mjey9OOje9Mgp2/hz+5FITlHQJ0CpWPdp2k17t8f
ul43xkDivw9hc7LnfizrJpJWlOQIP433+zcMjmwpZlO6xFIN++21fLFi3kHXX4R+
7SN3JA3oFj8qWEmIkDxmz/ikw1SsRg==
=jzKH
-----END PGP SIGNATURE-----

--2ZQpEXguQlZNjbtt--
