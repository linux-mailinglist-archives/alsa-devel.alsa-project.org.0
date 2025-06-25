Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4267AE8686
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jun 2025 16:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 941B9601F7;
	Wed, 25 Jun 2025 16:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 941B9601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750861895;
	bh=kN+UHloIBghTgt0r+pzydOaZOqTVrTHKGRhoLhNDQmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X2b+aocp5l6BanvAPfZitprWKx28ZuNmX8OicCY2wxOWShQlaAKAg4TztKJDnNKhh
	 2NBDaTpEaH5higiCAIDn8MsP6APxVbmsWcnyLxkpIOk5/YHHM8YPWTKufhMVD03wQ2
	 pXu4xDqoLwh1rXWR/ltrSGJeHrNu4S4g2EUlJjmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 871D1F805CB; Wed, 25 Jun 2025 16:31:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 621FDF805C6;
	Wed, 25 Jun 2025 16:31:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D0BCF804FB; Wed, 25 Jun 2025 16:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC6ABF800B6
	for <alsa-devel@alsa-project.org>; Wed, 25 Jun 2025 16:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6ABF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O3saQ4OR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750861857; x=1782397857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kN+UHloIBghTgt0r+pzydOaZOqTVrTHKGRhoLhNDQmk=;
  b=O3saQ4OR7l/cSDs+M/75XthiJtQTvi/cYkdKkUSdiX3EPV8HTXlre/i5
   8T7czs1gitviNPckqbNI6osdvOiOFlTATWEAW7kOXOAXbOYWl7aplGrCN
   qONX5QFVKXYr6XzUuMddrYqKMpGxO1jYsdZ4SmaWTBoN7bH2Dz46nVet7
   UVaKjOx2YD7Vf/tIrV3u3Cdjg+q5Cy1veF5hHv9/ZsYI+mxSJG5bs6Cyl
   ATgS0UmXzzG7WZhiFRLETrcLH+rIIS61EbO4cegaHvS0p+ZtVGvG9pI9r
   g/VELHgMJTgaufOuCwxARE0EpFBX+vHV2JUP+ezAgcsjjNuVx1oXgexJo
   w==;
X-CSE-ConnectionGUID: krVT+LdaQhGIMWAT0Ou8Mw==
X-CSE-MsgGUID: GwtOMBc6Sq69l3UvL17zUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="78563037"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600";
   d="scan'208";a="78563037"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:30:51 -0700
X-CSE-ConnectionGUID: YqHmbnEjTf+gxeSfTKm04g==
X-CSE-MsgGUID: 4m6G1I+oSFOeCf0PjNUPCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600";
   d="scan'208";a="152528823"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:30:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUR9B-00000009nr3-3nZv;
	Wed, 25 Jun 2025 17:30:45 +0300
Date: Wed, 25 Jun 2025 17:30:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, alsa-devel@alsa-project.org,
	baojun.xu@ti.com, shenghao-ding@ti.com, liam.r.girdwood@intel.com,
	navada@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v2 2/4] Asoc: tac5x1x: document tac5x1x codec
Message-ID: <aFwIFRBjR-ORKKmU@smile.fi.intel.com>
References: <20250624153742.1507-1-niranjan.hy@ti.com>
 <20250624153742.1507-3-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624153742.1507-3-niranjan.hy@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: 7VRWZTVLTPCKANPV2MP2NN5VJPJ2IEVB
X-Message-ID-Hash: 7VRWZTVLTPCKANPV2MP2NN5VJPJ2IEVB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VRWZTVLTPCKANPV2MP2NN5VJPJ2IEVB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 24, 2025 at 09:07:40PM +0530, Niranjan H Y wrote:
> tac5x1x family are series of low-power and high performance
> mono/stereo audio codecs consists of ADC and DAC combinations.
> The family consist of Codecs(DAC & ADC), ADC only and DAC only
> configurations. The documentation explains the list of devices
> in the family, their power supply configurations and gpio
> configuration options available for various functionality.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>

Aren't DT bindings changes supposed to follow the common template in the
Subject?

More important, the Cc list missed DT mailing lists and maintainers.
What's going on here, please?

-- 
With Best Regards,
Andy Shevchenko


