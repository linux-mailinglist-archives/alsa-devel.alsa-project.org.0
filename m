Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1995C8D1
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 11:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10B8B20C;
	Fri, 23 Aug 2024 11:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10B8B20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724404074;
	bh=gIB2TJheovV1v9z2PyqBJKTVOtzHTmetTgKJxxIWdwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NpLWfG/HHz61qMzdFEFoMPy4/sFclljVsQaWXhXEISrPgzvbvmBQzRblVH5vCVKMu
	 Y9Uxg1Vo+GpFwamcVddYMsA2cNhJucLxgkOu68SQGi3lSA5SEsc4qhTLBNsGp2iGzz
	 s9czfbwkn/PSRcZTh7oEK4qortQ+9TlDL90eaHXA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61772F805A8; Fri, 23 Aug 2024 11:07:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9FACF805A0;
	Fri, 23 Aug 2024 11:07:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42126F8049C; Fri, 23 Aug 2024 11:07:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3983DF8016E
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 11:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3983DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d9qweSqZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724404030; x=1755940030;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gIB2TJheovV1v9z2PyqBJKTVOtzHTmetTgKJxxIWdwA=;
  b=d9qweSqZJpwqNByUfTJ3cmBc4LeCjuvE8NV6YPLslZntU3fcetpOW9V9
   RHLDUWWO4H3mT/PbMeGXXCuArx5t0p3Ri+MMBTxYAzzewjG1FCLpsPMyJ
   tYvvSXd8xvIaiP3rYCR7CMfSvEmUZvO2eEXFjF76oLOv7NIFdJAJqBFs2
   LT03t5sm+4hGODqqGFtCXz8a2p7YTu9RE8gPCmOKZOGdcQNVETLlfvdz6
   mNgwLCcOtmyuh/QbP93k2XbFwMY6ZpnGwzf6DxqZeuQwId9qd7TppW8Zc
   20T0GcBvKJsVW827NxzLkoTpAASZrxW5qjijq3IvIUjlW2O1/hk4lFfaV
   w==;
X-CSE-ConnectionGUID: Y+M4n903RayFfE9p5HcCGA==
X-CSE-MsgGUID: 5VbtiqqtRY+oKnmz5+T3qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40377612"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600";
   d="scan'208";a="40377612"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:07:04 -0700
X-CSE-ConnectionGUID: DRJGRhJ6Rt+62hyXIBh6WA==
X-CSE-MsgGUID: uusFQn/DQoGKZqliEoianQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600";
   d="scan'208";a="62041940"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.219])
 ([10.245.246.219])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:07:01 -0700
Message-ID: <17e94fd8-f2e4-4e8a-a05b-0d7ae7b261d8@linux.intel.com>
Date: Fri, 23 Aug 2024 09:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F
 DMI match less strict
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240823074305.16873-1-hdegoede@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240823074305.16873-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SBKA32TT75PKRNCNG2ZYCDLZ63CVFEXU
X-Message-ID-Hash: SBKA32TT75PKRNCNG2ZYCDLZ63CVFEXU
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBKA32TT75PKRNCNG2ZYCDLZ63CVFEXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/23/24 09:43, Hans de Goede wrote:
> There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
> turns out that the 2G version has a DMI product name of
> "CHERRYVIEW D1 PLATFORM" where as the 4G version has
> "CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
> unique enough that the product-name check is not necessary.
> 
> Drop the product-name check so that the existing DMI match for the 4G
> RAM version also matches the 2G RAM version.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/common/soc-acpi-intel-cht-match.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index 5e2ec60e2954..e4c3492a0c28 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> @@ -84,7 +84,6 @@ static const struct dmi_system_id lenovo_yoga_tab3_x90[] = {
>  		/* Lenovo Yoga Tab 3 Pro YT3-X90, codec missing from DSDT */
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
>  			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
>  		},
>  	},

