Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F224A48289
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2025 16:10:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E64DE60372;
	Thu, 27 Feb 2025 16:10:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E64DE60372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740669057;
	bh=wO4dIWOY99Vk7o+zIQs+KGMbPFI2pdB543Uc/VguDaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pxweCBAYeWI5BbFS/GhwZ3Ct5gw7ppHecQwKJjtO4LwTwGD5vvNrCLKSOq+xxrJqe
	 HfMdnFEUd56HfO1EhMmXODBVYxBiI5W0hRn5SUSIbitDbPFNxuL4PFpCnmXksejtqw
	 g+JE9VOlg1p0hJlhBTSR8NhYChcBjy08BmWDzOyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 902B4F805C3; Thu, 27 Feb 2025 16:10:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A7D0F805BB;
	Thu, 27 Feb 2025 16:10:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30923F8021D; Thu, 27 Feb 2025 16:09:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 707C4F80116
	for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2025 16:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 707C4F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TOXTJ7mJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740668969; x=1772204969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wO4dIWOY99Vk7o+zIQs+KGMbPFI2pdB543Uc/VguDaM=;
  b=TOXTJ7mJyXyRj1YlqBfEifbsakDGp3iPEmUPD/hfdalu0krWL6uY00nC
   kmssLJWsldhNu1PyTfu/tIr3Oun0OFUDaVgFevp/540VyOw2HZXTDY0R9
   H0bVfGYfiV7z/NqsKIl2mR2ywOlrSlX++wQyQrob2Y78vuNeQq4+LOw9p
   jXbWb7gjWeKXEfTERXmx4EFa6jJDdHj8t+TdrpQCr8QMFR/jQweYMDab0
   yv2cL+n+l5cQREo0LQB6egV+rFaZgct/UFY2WiyLjxeBnXqdjscN+Bak4
   ZP2M6Mfm8KSAp9AB4tE4YFJFDtWfpfU3WKM9hQY/unSBI+9/+wOfhMKg4
   A==;
X-CSE-ConnectionGUID: fE1lBQ9cTJeGGXiNgOZjBg==
X-CSE-MsgGUID: 8VHI/ry8SrSWmVOV1wAnjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="64030559"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000";
   d="scan'208";a="64030559"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:09:24 -0800
X-CSE-ConnectionGUID: K2tP1GgjTF+7z00rBSXGYA==
X-CSE-MsgGUID: nMbiVZSQTzGzz2QsYpOODg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000";
   d="scan'208";a="116845514"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:09:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnfVm-0000000Fd39-3waT;
	Thu, 27 Feb 2025 17:09:18 +0200
Date: Thu, 27 Feb 2025 17:09:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"13916275206@139.com" <13916275206@139.com>,
	"13564923607@139.com" <13564923607@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Xu, Baojun" <baojun.xu@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH v3] ASoC: tas2781: Support dsp firmware
 Alpha and Beta seaies
Message-ID: <Z8CAHiFyJ3B8tzZ5@smile.fi.intel.com>
References: <20250225140316.1049-1-shenghao-ding@ti.com>
 <Z73WZLrBrtVc69dn@smile.fi.intel.com>
 <bc2147c6f31d47afbec108cfdb5acfd2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc2147c6f31d47afbec108cfdb5acfd2@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: LIFXCPS2YZHTYHJYGFJPOJ4OSRV5ISY7
X-Message-ID-Hash: LIFXCPS2YZHTYHJYGFJPOJ4OSRV5ISY7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIFXCPS2YZHTYHJYGFJPOJ4OSRV5ISY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 27, 2025 at 11:58:24AM +0000, Ding, Shenghao wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Tuesday, February 25, 2025 10:41 PM
> > On Tue, Feb 25, 2025 at 10:03:16PM +0800, Shenghao Ding wrote:

...

> > > +
> > > +	for (i = 0; i < 20; i++) {
> > > +		const unsigned char *dat = &p->data[24 * i];
> > 
> > Okay, you have 24-byte records.
> > 
> > > +		if (dat[23] != 1)
> > > +			break;
> > 
> > > +		if (strstr(dat, "umg_SsmKEGCye") != NULL) {
> > 
> > These calls basically suggest that the data may be not at the same offset.
> > But at the same time they don't have boundary checks and there is a chance
> > that the tail of one of these string comparisons may trigger if the value appears
> > to be the same, like "Cye".
> > 
> > Instead, better to introduce a special data type or even data types, where you
> > put string with limited length and respective data, like u24/i8 in your
> > terminology. With that this code becomes much more clearer.
> 
> Calibration parameters locations and data schema in dsp firmware
> The number of items are flexible, but not more than 20. The dsp tool
> will reserve 20*24-byte space for fct params. In some cases, the
> number of fct param is less than 20, the data will be saved from the
> beginning, the rest part will be stuffed with zero.
> 	fct_param_num (not more than 20)
> 	for (i = 0; i < fct_param_num; i++) {
> 		Alias of fct param (20 bytes)
> 		Book (1 byte)
> 	Page (1 byte)
> 	Offset (1 byte)
> 	CoeffLength (1 byte) = 0x1
> 	}
> 	if (20 - fct_param_num)
> 		24*(20 - fct_param_num) pieces of '0' as stuffing
> As follow
> umg_SsmKEGCye	 = Book, Page, Offset, CoeffLength
> iks_E0 		 = Book, Page, Offset, CoeffLength
> yep_LsqM0		 = Book, Page, Offset, CoeffLength
> oyz_U0_ujx		 = Book, Page, Offset, CoeffLength
> iks_GC_GMgq		 = Book, Page, Offset, CoeffLength
> gou_Yao		 = Book, Page, Offset, CoeffLength
> kgd_Wsc_Qsbp		 = Book, Page, Offset, CoeffLength
> yec_CqseSsqs		 = Book, Page, Offset, CoeffLength
> iks_SogkGgog2	 = Book, Page, Offset, CoeffLength
> yec_Sae_Y		 = Book, Page, Offset, CoeffLength
> Re_Int		 = Book, Page, Offset, CoeffLength
> SigFlag		 = Book, Page, Offset, CoeffLength
> a1_Int		 = Book, Page, Offset, CoeffLength
> a2_Int		 = Book, Page, Offset, CoeffLength
> 
> Do you mean to use  strncmp instead of strstr?

Yes,

> Due to the different length of the alias of fct params, 
> I have to pass the max len, 20 bytes, as the str len.

Yes, for each alias you need just to define a data type:

struct fct_param_alias_u24 {
	const char name[20];
	u8 book;
	u8 page;
	u8 offset;
	u8 coeff_len;
};

struct fct_param_alias_u8 {
	...
};

Then in the loop you do the following (just an example, can be done
differently):

	union {
		const char name[20];

		struct fct_param_alias_u8 *u8;
		struct fct_param_alias_u24 *u24;
		...
		const void *data;
	} a;

	a.data = data;

	if (!strncmp(a.name, ..., sizeof(a.name)))
		foo = ...(a.u24->book, a.u24->page, a.u24->offset);
	else if (...)
		...

Also parameters can be split to a table which will have the need to use method
as a callback

> > > +			hex_parse_u24(&r->pow_reg, &dat[20]);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "iks_E0") != NULL) {
> > > +			hex_parse_u24(&r->r0_reg, &dat[20]);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "yep_LsqM0") != NULL) {
> > > +			hex_parse_u24(&r->invr0_reg, &dat[20]);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "oyz_U0_ujx") != NULL) {
> > > +			hex_parse_u24(&r->r0_low_reg, &dat[20]);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "iks_GC_GMgq") != NULL) {
> > > +			hex_parse_u24(&r->tlimit_reg, &dat[20]);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "gou_Yao") != NULL) {
> > > +			hex_parse_u8(p->thr, &dat[20], 3);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "kgd_Wsc_Qsbp") != NULL) {
> > > +			hex_parse_u8(p->plt_flg, &dat[20], 3);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "yec_CqseSsqs") != NULL) {
> > > +			hex_parse_u8(p->sin_gn, &dat[20], 3);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "iks_SogkGgog2") != NULL) {
> > > +			hex_parse_u8(p->sin_gn2, &dat[20], 3);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "yec_Sae_Y") != NULL) {
> > > +			hex_parse_u8(p->thr2, &dat[20], 3);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "Re_Int") != NULL) {
> > > +			hex_parse_u8(p->r0_reg, &dat[20], 3);
> > > +			continue;
> > > +		}
> > > +		/* Check whether the spk connection is open */
> > > +		if (strstr(dat, "SigFlag") != NULL) {
> > > +			hex_parse_u8(p->tf_reg, &dat[20], 3);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "a1_Int") != NULL) {
> > > +			hex_parse_u8(p->a1_reg, &dat[20], 3);
> > > +			continue;
> > > +		}
> > > +		if (strstr(dat, "a2_Int") != NULL) {
> > > +			hex_parse_u8(p->a2_reg, &dat[20], 3);
> > > +			continue;
> > > +		}
> > > +	}
> > > +}

-- 
With Best Regards,
Andy Shevchenko


