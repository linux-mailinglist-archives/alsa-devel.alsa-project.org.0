Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CCDA44323
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2025 15:41:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60C026028D;
	Tue, 25 Feb 2025 15:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60C026028D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740494485;
	bh=1ElzBznPdnkPDv8+fSxbhaG6UjuEfqk1KN7Blqg2KF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S7jcvQRRi2Uwa6N897wIZ81cEI9pz9mieznwMaoP3wP12UjrZNHGShAbtE7bsMY8a
	 8IeJWX8R5IYa+OLkSF2K4cDkDTKwXp3FV4IIYuyL5H8p5Q4cRbdpDn96LsluMz+p2h
	 xZr8l8OUWOguiOi5M85GY1l/QiandBXdQgwGJIcQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54616F805BD; Tue, 25 Feb 2025 15:40:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37D5BF805B2;
	Tue, 25 Feb 2025 15:40:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 602EEF80526; Tue, 25 Feb 2025 15:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE8C9F800BF
	for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2025 15:40:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE8C9F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XhQakHg7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740494447; x=1772030447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1ElzBznPdnkPDv8+fSxbhaG6UjuEfqk1KN7Blqg2KF4=;
  b=XhQakHg7QNpgUdtrNxErLWczvETExl6NaNScSFypqJ1bQ9fojkDfgcYa
   TNiCh7nVXOhYc906faA/vcZt5SxDZORojSFu9V/Ic0FMi28fn2/lrdLii
   dvEdA70hIEB6HmSrBzh0cYWU52JcW00MZb5xd/mJUNx2t/zFE34uZAZ+n
   8vk+Vsf0ON4ihxUvkQgoUPcF8pyOwaY3AJ4nkDQ025qjp7bMv/L5Sp8ku
   7N929vs72yNEvyp+PdkGzBhArj6iLAdWgOmPT+SOYn7kH4hFc/48qw6FZ
   koJNKM3Xkkbz6HyIc07ziU+1PwySnJiX/M78JHURwR3PcLtmGxATleEGk
   g==;
X-CSE-ConnectionGUID: 5vG6+KWuRjOivz6z5/jOtw==
X-CSE-MsgGUID: WgWfnkJlQZ+OiA+eJIlGaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66671463"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000";
   d="scan'208";a="66671463"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:40:41 -0800
X-CSE-ConnectionGUID: B83mQ2NGRBmfRVv1zL1gPA==
X-CSE-MsgGUID: gIAdkGqBS7qM2CnxVHbjOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000";
   d="scan'208";a="121018469"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:40:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmw6v-0000000F1GL-0GCl;
	Tue, 25 Feb 2025 16:40:37 +0200
Date: Tue, 25 Feb 2025 16:40:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, 13916275206@139.com,
	13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com
Subject: Re: [PATCH v3] ASoC: tas2781: Support dsp firmware Alpha and Beta
 seaies
Message-ID: <Z73WZLrBrtVc69dn@smile.fi.intel.com>
References: <20250225140316.1049-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225140316.1049-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 63W7C77QX4GCEYIUOUWUMIQUCLVTC4FO
X-Message-ID-Hash: 63W7C77QX4GCEYIUOUWUMIQUCLVTC4FO
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63W7C77QX4GCEYIUOUWUMIQUCLVTC4FO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 25, 2025 at 10:03:16PM +0800, Shenghao Ding wrote:
> For calibration, basic version does not contain any calibration addresses,
> it depends on calibration tool to convery the addresses to the driver.
> Since Alpha and Beta firmware, all the calibration addresses are saved
> into the firmware.

...

> +static void hex_parse_u8(unsigned char *item, const unsigned char *val,
> +	int len)
> +{
> +	for (int i = 0; i < len; i++)
> +		item[i] = val[i];

memcpy() ?

> +}

...

> +static void hex_parse_u24(unsigned int *item, const unsigned char *val)
> +{
> +	*item = TASDEVICE_REG(val[0], val[1], val[2]);
> +}

Also useless function, just use this  macro directly.

...

> +static void fct_param_address_parser(struct cali_reg *r,
> +	struct tasdevice_fw *tas_fmw)
> +{
> +	struct fct_param_address *p = &(tas_fmw->fct_par_addr);

Unneeded parentheses.

> +	int i;

unsigned int ?

> +
> +	for (i = 0; i < 20; i++) {
> +		const unsigned char *dat = &p->data[24 * i];

Okay, you have 24-byte records.

> +		if (dat[23] != 1)
> +			break;

> +		if (strstr(dat, "umg_SsmKEGCye") != NULL) {

These calls basically suggest that the data may be not at the same offset.
But at the same time they don't have boundary checks and there is a chance
that the tail of one of these string comparisons may trigger if the value
appears to be the same, like "Cye".

Instead, better to introduce a special data type or even data types, where
you put string with limited length and respective data, like u24/i8 in your
terminology. With that this code becomes much more clearer.

> +			hex_parse_u24(&r->pow_reg, &dat[20]);
> +			continue;
> +		}
> +		if (strstr(dat, "iks_E0") != NULL) {
> +			hex_parse_u24(&r->r0_reg, &dat[20]);
> +			continue;
> +		}
> +		if (strstr(dat, "yep_LsqM0") != NULL) {
> +			hex_parse_u24(&r->invr0_reg, &dat[20]);
> +			continue;
> +		}
> +		if (strstr(dat, "oyz_U0_ujx") != NULL) {
> +			hex_parse_u24(&r->r0_low_reg, &dat[20]);
> +			continue;
> +		}
> +		if (strstr(dat, "iks_GC_GMgq") != NULL) {
> +			hex_parse_u24(&r->tlimit_reg, &dat[20]);
> +			continue;
> +		}
> +		if (strstr(dat, "gou_Yao") != NULL) {
> +			hex_parse_u8(p->thr, &dat[20], 3);
> +			continue;
> +		}
> +		if (strstr(dat, "kgd_Wsc_Qsbp") != NULL) {
> +			hex_parse_u8(p->plt_flg, &dat[20], 3);
> +			continue;
> +		}
> +		if (strstr(dat, "yec_CqseSsqs") != NULL) {
> +			hex_parse_u8(p->sin_gn, &dat[20], 3);
> +			continue;
> +		}
> +		if (strstr(dat, "iks_SogkGgog2") != NULL) {
> +			hex_parse_u8(p->sin_gn2, &dat[20], 3);
> +			continue;
> +		}
> +		if (strstr(dat, "yec_Sae_Y") != NULL) {
> +			hex_parse_u8(p->thr2, &dat[20], 3);
> +			continue;
> +		}
> +		if (strstr(dat, "Re_Int") != NULL) {
> +			hex_parse_u8(p->r0_reg, &dat[20], 3);
> +			continue;
> +		}
> +		/* Check whether the spk connection is open */
> +		if (strstr(dat, "SigFlag") != NULL) {
> +			hex_parse_u8(p->tf_reg, &dat[20], 3);
> +			continue;
> +		}
> +		if (strstr(dat, "a1_Int") != NULL) {
> +			hex_parse_u8(p->a1_reg, &dat[20], 3);
> +			continue;
> +		}
> +		if (strstr(dat, "a2_Int") != NULL) {
> +			hex_parse_u8(p->a2_reg, &dat[20], 3);
> +			continue;
> +		}
> +	}
> +}

...

> +static int fw_parse_fct_param_address(struct tasdevice_priv *tas_priv,
> +	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
> +{
> +	struct fct_param_address *p = &(tas_fmw->fct_par_addr);
> +	struct calidata *cali_data = &tas_priv->cali_data;
> +	struct cali_reg *r = &cali_data->cali_reg_array;
> +	const unsigned char *data = fmw->data;
> +
> +	if (offset + 520 > fmw->size) {
> +		dev_err(tas_priv->dev, "%s: File Size error\n", __func__);

> +		offset = -1;
> +		goto out;

Just return directly and use proper error codes.

> +	}
> +
> +	/* skip reserved part */
> +	offset += 40;
> +	p->size = 480;
> +	p->data = kmemdup(&data[offset], 480, GFP_KERNEL);
> +	if (!p->data) {

> +		offset = -1;
> +		goto out;

Ditto.

> +	}
> +	offset += 480;
> +	fct_param_address_parser(r, tas_fmw);

> +out:

Useless label.

> +	return offset;
> +}

...

>  	offset = tas_priv->fw_parse_configuration_data(tas_priv,
>  		tas_fmw, fmw, offset);
> -	if (offset < 0)
> +	if (offset < 0) {
>  		ret = offset;

This is the error code from offset, right? what you use is -1 in both cases
which maps currently to EPERM.

> +		goto out;
> +	}

...

> +	if (tas_priv->fw_parse_fct_param_address) {
> +		offset = tas_priv->fw_parse_fct_param_address(tas_priv,
> +			tas_fmw, fmw, offset);
> +		if (offset < 0)
> +			ret = offset;

Ditto.

> +	}

...

>  out:

Yet another useless label.

>  	return ret;

...

> +		if (tas_priv->dspbin_typ == TASDEV_ALPHA)
> +			tasdevice_dev_bulk_write(tas_priv, i, t->reg,
> +				t->val, 4);

Follow the logical splits

			tasdevice_dev_bulk_write(tas_priv, i,
						 t->reg, t->val, 4);

or do it on a single line (it's only 81 characters).

			tasdevice_dev_bulk_write(tas_priv, i, t->reg, t->val, 4);

...

> +		if (tas_priv->dspbin_typ)
> +			reg = TASDEVICE_REG(p->tf_reg[0], p->tf_reg[1],
> +				p->tf_reg[2]);

One line will be not so big (86 characters).

...

> +static void cali_reg_update(struct bulk_reg_val *p,
> +	struct fct_param_address *t)
> +{
> +	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
> +	int reg = 0;
> +	int j;
> +
> +	for (j = 0; j < sum; j++) {
> +		switch (tas2781_cali_start_reg[j].reg) {
> +		case 0:
> +		reg = TASDEVICE_REG(t->thr[0], t->thr[1], t->thr[2]);

Indentation issues with all these reg = ...

> +			break;
> +		case TAS2781_PRM_PLT_FLAG_REG:

> +		reg = TASDEVICE_REG(t->plt_flg[0], t->plt_flg[1],
> +			t->plt_flg[2]);

You have room on the previous line.

> +			break;
> +		case TAS2781_PRM_SINEGAIN_REG:
> +		reg = TASDEVICE_REG(t->sin_gn[0], t->sin_gn[1], t->sin_gn[2]);
> +			break;
> +		case TAS2781_PRM_SINEGAIN2_REG:
> +		reg = TASDEVICE_REG(t->sin_gn[0], t->sin_gn[1], t->sin_gn[2]);
> +			break;
> +		default:
> +		reg = 0;
> +			break;
> +		}
> +		if (reg)
> +			p[j].reg = reg;
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko


