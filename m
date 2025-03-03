Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CB1A4BB02
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Mar 2025 10:43:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB126023C;
	Mon,  3 Mar 2025 10:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB126023C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740994991;
	bh=mkCv1xGUshLbU6tAVKn+Tb+AZPjjFz1LvKij8R1PrD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oWgTMP6ZUulFPOdmrbJ8fRBigGEryTgCC8fV0c6IPy+Fc5BmdYZMLIqAwbae9GM1S
	 TsEEhaKkSxu4LbAU8dleDpWMZoS9Sn22JBVAZDJyPdxVr+u0Q/asULcj1LIoJwCb+9
	 QfDKP/V0n8Rp770C/mxs0RN4INVmnnURfxuFnsUI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0381BF805B5; Mon,  3 Mar 2025 10:42:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8FD6F805B0;
	Mon,  3 Mar 2025 10:42:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6219F80424; Mon,  3 Mar 2025 10:42:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36E65F801F7
	for <alsa-devel@alsa-project.org>; Mon,  3 Mar 2025 10:42:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36E65F801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jmRnH8mN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740994952; x=1772530952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mkCv1xGUshLbU6tAVKn+Tb+AZPjjFz1LvKij8R1PrD8=;
  b=jmRnH8mNuVEQWnKleFz2W3hEBUnCHoZV75CeUz6yEuLJ15gA4kUFyXs5
   llY4FWT4Sni7EgaKckctwXWbLxP2TEzdDOL5Eu4nlo8Zs4Bpqpqf85JCX
   Gqe9ZWqQ2ePnHGvMpTw4K07S8U9z3aGM9Cpp57mBeNxBwxsnzvb+TXTek
   MIBkyqQOsKFltQv6KIdo0MTBarIPgn19X0TDDFks9Jm3WN4+p6dBtnzQb
   yOccrmhxJ8B5kmXy0U98+1JvdtlXf56zwu+i25gX41WNiqXF+oCYdy4SS
   0dKPBn1+7leprGon6nwki1dpVX8KtSqZVl6pE7K4NWgc0/on+UqsjJMXL
   w==;
X-CSE-ConnectionGUID: aVcsA/KqQf+DkP39h4WDVw==
X-CSE-MsgGUID: HsLfRD9UQbmlsbcq14NKAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="42053223"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000";
   d="scan'208";a="42053223"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:42:26 -0800
X-CSE-ConnectionGUID: u2DcFBSzT2OPt2OGdLvv/A==
X-CSE-MsgGUID: 0TIrD+t/Th+JGQe38CRFjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600";
   d="scan'208";a="155131119"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:42:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp2JZ-0000000Glnx-2d7C;
	Mon, 03 Mar 2025 11:42:21 +0200
Date: Mon, 3 Mar 2025 11:42:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, 13916275206@139.com,
	13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com,
	v-hampiholi@ti.com, navada@ti.com
Subject: Re: [PATCH v4] ASoC: tas2781: Support dsp firmware Alpha and Beta
 seaies
Message-ID: <Z8V5fd0dEYEkDjvK@smile.fi.intel.com>
References: <20250301043001.1262-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301043001.1262-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: IZCX6HEBPCMBZ3DCPTWOQMYI4HQKQRGH
X-Message-ID-Hash: IZCX6HEBPCMBZ3DCPTWOQMYI4HQKQRGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZCX6HEBPCMBZ3DCPTWOQMYI4HQKQRGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Mar 01, 2025 at 12:30:01PM +0800, Shenghao Ding wrote:
> For calibration, basic version does not contain any calibration addresses,
> it depends on calibration tool to convey the addresses to the driver.
> Since Alpha and Beta firmware, all the calibration addresses are saved
> into the firmware.

...

> +	for (i = 0; i < 20; i++) {
> +		const unsigned char *dat = &data[24 * i];
> +
> +		/*
> +		 * check whether current fct param is empty.
> +		 */
> +		if (dat[23] != 1)
> +			break;
> +
> +		if (!strncmp(dat, "umg_SsmKEGCye", 20)) {
> +			r->pow_reg = TASDEVICE_REG(dat[20], dat[21], dat[22]);

> +			continue;
> +		}

Instead of this lengthy approach, just replace the chain with

		if (foo)
			...
		else if ...
			...

It will reduce this by 2/3 of LoCs.


> +		/* high 32-bit of real-time spk impedance */
> +		if (!strncmp(dat, "iks_E0", 20)) {
> +			r->r0_reg = TASDEVICE_REG(dat[20], dat[21], dat[22]);
> +			continue;
> +		}
> +		/* inverse of real-time spk impedance */
> +		if (!strncmp(dat, "yep_LsqM0", 20)) {
> +			r->invr0_reg =
> +				TASDEVICE_REG(dat[20], dat[21], dat[22]);
> +			continue;
> +		}
> +		/* low 32-bit of real-time spk impedance */
> +		if (!strncmp(dat, "oyz_U0_ujx", 20)) {
> +			r->r0_low_reg =
> +				TASDEVICE_REG(dat[20], dat[21], dat[22]);
> +			continue;
> +		}
> +		/* Delta Thermal Limit */
> +		if (!strncmp(dat, "iks_GC_GMgq", 20)) {
> +			r->tlimit_reg =
> +				TASDEVICE_REG(dat[20], dat[21], dat[22]);
> +			continue;
> +		}
> +		/* Thermal data for PG 1.0 device */
> +		if (!strncmp(dat, "gou_Yao", 20)) {
> +			memcpy(p->thr, &dat[20], 3);
> +			continue;
> +		}
> +		/* Pilot tone enable flag, usually the sine wave */
> +		if (!strncmp(dat, "kgd_Wsc_Qsbp", 20)) {
> +			memcpy(p->plt_flg, &dat[20], 3);
> +			continue;
> +		}
> +		/* Pilot tone gain for calibration */
> +		if (!strncmp(dat, "yec_CqseSsqs", 20)) {
> +			memcpy(p->sin_gn, &dat[20], 3);
> +			continue;
> +		}
> +		/* Pilot tone gain for calibration, useless in PG 2.0 */
> +		if (!strncmp(dat, "iks_SogkGgog2", 20)) {
> +			memcpy(p->sin_gn2, &dat[20], 3);
> +			continue;
> +		}
> +		/* Thermal data for PG 2.0 device */
> +		if (!strncmp(dat, "yec_Sae_Y", 20)) {
> +			memcpy(p->thr2, &dat[20], 3);
> +			continue;
> +		}
> +		/* Spk Equivalent Resistance in fixed-point format */
> +		if (!strncmp(dat, "Re_Int", 20)) {
> +			memcpy(p->r0_reg, &dat[20], 3);
> +			continue;
> +		}
> +		/* Check whether the spk connection is open */
> +		if (!strncmp(dat, "SigFlag", 20)) {
> +			memcpy(p->tf_reg, &dat[20], 3);
> +			continue;
> +		}
> +		/* check spk resonant frequency */
> +		if (!strncmp(dat, "a1_Int", 20)) {
> +			memcpy(p->a1_reg, &dat[20], 3);
> +			continue;
> +		}
> +		/* check spk resonant frequency */
> +		if (!strncmp(dat, "a2_Int", 20)) {
> +			memcpy(p->a2_reg, &dat[20], 3);
> +			continue;
> +		}
> +	}
> +}

...

> +static int fw_parse_fct_param_address(struct tasdevice_priv *tas_priv,
> +	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
> +{
> +	struct calidata *cali_data = &tas_priv->cali_data;
> +	struct cali_reg *r = &cali_data->cali_reg_array;
> +	const unsigned char *data = fmw->data;
> +
> +	if (offset + 520 > fmw->size) {
> +		dev_err(tas_priv->dev, "%s: File Size error\n", __func__);
> +		return -1;

Use proper error code here. Check include/uapi/asm-generic/errno.h.

> +	}
> +
> +	/* skip reserved part */
> +	offset += 40;
> +
> +	fct_param_address_parser(r, tas_fmw, &data[offset]);
> +
> +	offset += 480;
> +
> +	return offset;
> +}

...

>  	offset = tas_priv->fw_parse_variable_header(tas_priv, fmw, offset);
> -	if (offset < 0) {
> -		ret = offset;
> -		goto out;
> -	}
> +	if (offset < 0)
> +		return offset;
> +
>  	offset = tas_priv->fw_parse_program_data(tas_priv, tas_fmw, fmw,
>  		offset);
> -	if (offset < 0) {
> -		ret = offset;
> -		goto out;
> -	}
> +	if (offset < 0)
> +		return offset;
> +
>  	offset = tas_priv->fw_parse_configuration_data(tas_priv,
>  		tas_fmw, fmw, offset);
>  	if (offset < 0)
> -		ret = offset;
> +		return offset;

The below...

> +	if (tas_priv->fw_parse_fct_param_address) {
> +		offset = tas_priv->fw_parse_fct_param_address(tas_priv,
> +			tas_fmw, fmw, offset);
> +		if (offset < 0)
> +			ret = offset;
> +	}
>  
> -out:
>  	return ret;

...can be written in this form:

	if (tas_priv->fw_parse_fct_param_address) {
		offset = tas_priv->fw_parse_fct_param_address(tas_priv,
			tas_fmw, fmw, offset);
		if (offset < 0)
			return offset;
	}

	return 0;

...

> +static void cali_reg_update(struct bulk_reg_val *p,
> +	struct fct_param_address *t)
> +{
> +	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);

> +	int reg = 0;

Unneeded assignment.

> +	int j;
> +
> +	for (j = 0; j < sum; j++) {
> +		switch (tas2781_cali_start_reg[j].reg) {
> +		case 0:
> +			reg = TASDEVICE_REG(t->thr[0], t->thr[1], t->thr[2]);
> +			break;
> +		case TAS2781_PRM_PLT_FLAG_REG:
> +			reg = TASDEVICE_REG(t->plt_flg[0], t->plt_flg[1],
> +				t->plt_flg[2]);
> +			break;
> +		case TAS2781_PRM_SINEGAIN_REG:
> +			reg = TASDEVICE_REG(t->sin_gn[0], t->sin_gn[1],
> +				t->sin_gn[2]);
> +			break;
> +		case TAS2781_PRM_SINEGAIN2_REG:
> +			reg = TASDEVICE_REG(t->sin_gn[0], t->sin_gn[1],
> +				t->sin_gn[2]);
> +			break;
> +		default:
> +			reg = 0;
> +			break;
> +		}
> +		if (reg)
> +			p[j].reg = reg;
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko


