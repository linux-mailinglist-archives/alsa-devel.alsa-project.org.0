Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE768B17E0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 02:13:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2FD7B6A;
	Thu, 25 Apr 2024 02:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2FD7B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714004017;
	bh=7ImAgBBQMI2fMCLWLrxtbt4jeMOHsO3he336I8xXxVE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pX/ms0ikD9mwnZQFxHSJkU7oGF8Jo0kNHuPpuxall7DlHcUhZYK9luzy/d2FpxKOg
	 4mSxh6F5poxwZnwAy240Ojlco2EwQ8pg6pnA77ZVUFrckfkfHz7r4qKf4UWbWPv+MJ
	 q6YfgNAOiHtSiJrQM7zeikfmQCtjO+hWUZsjBhbc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E837F80589; Thu, 25 Apr 2024 02:13:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E7E8F80423;
	Thu, 25 Apr 2024 02:13:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02A26F80423; Thu, 25 Apr 2024 02:12:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEB72F800B5
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 02:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEB72F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HY9klLoM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714003973; x=1745539973;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7ImAgBBQMI2fMCLWLrxtbt4jeMOHsO3he336I8xXxVE=;
  b=HY9klLoM9r4eUnhKXbbt7hZI0oqjRDnopKjocnXnMVpJ3VUXKdOHcgFa
   LcWRjYqbpmIBcZj0O2O/kiS0XS49EjUhBMaD7z5GkFwJnkHJThuUG/kKj
   1LkzW7MqS9EpeDjfqstM2x76C4DtuKF0e+y03e1teY3yuRnqHbnzLbeqH
   B4Z1+YzPMIqNLauA6Ofpl/vVxlrJgdymRPJDLS+qS9MaDV8NP1/yw5qTs
   9V0tGS8M/CUV2ZKlwnwYwwYqFFIk4xGAT9KVA3Uz1jxNvl9vrat0RCH+x
   FUUoCRJiipuRSr+6PJl5gsl8nmHZkbAg5tqXQUEd/lw/k7D2Y2sTPq0O+
   w==;
X-CSE-ConnectionGUID: SvXz0izNS3CgiNs1DkLptA==
X-CSE-MsgGUID: OS8igp97TWOa/3vgJZGXIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9777142"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000";
   d="scan'208";a="9777142"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 17:12:47 -0700
X-CSE-ConnectionGUID: qsgigaAKQICh/gZjUY10UQ==
X-CSE-MsgGUID: 0w7JQEM/TKWuPT6a3n96eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000";
   d="scan'208";a="25389063"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 17:12:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 17:12:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 17:12:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 17:12:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZ4EuIj8q+TJOhxWje8gajYeymTFH2tRq2YsAAH7mjJsrkqfyZ85em6LiSTIwRNEP0d4gl2HLHlpNi+FZBAT6EPJd5pXSNNRgi0fCh7aVrm3eR5pmitvkHlfi5wZfPAb54WZdauUT+VQrnhZSSVkKYSeDg4mOq5IpAvdAZBzhf6nFkF4U4azKN5B1ut95fRf+jOnTH27kMVX32lPi89zz1d01XRsmOodq8xWrxPX1/Rvb2hzIFYHWLZ8mP4Ag0pvXxts8+1c5YTvlh7FzqPgZIoZCbM53A5HEXNlH4k/ckBXRWs6ugomwAqRWSw4v9LUHAW0IMBuS8UP7U0LFpJhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6VV4/6D68P4Rc1TvqYj1ppyf9AUY3IoJee5SdVanwM=;
 b=UahBavwddeDlyKeASg6aux/3oxQO9zQ7u8PC8SugICgmNfTdFNxLVDAyBIsoF4HW05FUelLqxwzuP6441nwU+MXSqEzNs473gwpDCeIGnXLbqn79Lh8f7W8M7TAAhDQDNc0py1icWkp5fbuLhQ0vQZ+oEF52qP7ZnppeZhUeHvUQ9dZ9DcLayuBx2Ig1qTorbjbXCemF7Gnkr6FnWaJrWSUkqZeFiiBB3UGOTJ9U0DE7mPG896CPuYWCpB7m2/bkIbcm8/Nq40Xcu+erRZ/rUUNvbOjYpoCGQX6NyNuwe+q9La8jDAZbd346MqBpWM129o8eez3JOu3DRh3lzt8aew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS0PR11MB7849.namprd11.prod.outlook.com (2603:10b6:8:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 00:12:42 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::fca9:7c00:b6d0:1d62]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::fca9:7c00:b6d0:1d62%5]) with mapi id 15.20.7519.015; Thu, 25 Apr 2024
 00:12:42 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Mark Brown <broonie@kernel.org>
CC: Borislav Petkov <bp@alien8.de>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, "Rojewski, Cezary" <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, =?iso-8859-2?Q?Amadeusz_S=B3awi=F1ski?=
	<amadeuszx.slawinski@linux.intel.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: RE: [PATCH v4 68/71] ASoC: Intel: avs: es8336: Switch to new Intel
 CPU model defines
Thread-Topic: [PATCH v4 68/71] ASoC: Intel: avs: es8336: Switch to new Intel
 CPU model defines
Thread-Index: AQHalnNypAm37i9ZEk6+7LiAmvGSwbF4GbEAgAABFJA=
Date: Thu, 25 Apr 2024 00:12:41 +0000
Message-ID: 
 <SJ1PR11MB6083B93F3972A5A41EAB5AA6FC172@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20240424181245.41141-1-tony.luck@intel.com>
 <20240424181550.42466-1-tony.luck@intel.com>
 <Zimcol_3kmP2Bv_J@finisterre.sirena.org.uk>
In-Reply-To: <Zimcol_3kmP2Bv_J@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DS0PR11MB7849:EE_
x-ms-office365-filtering-correlation-id: 64b094fc-0c61-426f-a846-08dc64bc6cae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|1800799015|7416005|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-2?Q?t+YEzK/xGtMAmR8QoX+awtoVzvL9u3Xz2KX6IjhSmcebxMqJfDNPlQdxSe?=
 =?iso-8859-2?Q?AuMhQcJRllKf/ANLEBCwlDshm3g/XLvI819hWE1Y0vcCdrbILhkF03r+z+?=
 =?iso-8859-2?Q?dxbFyza/1va0evBvAemQ4sYLDvdJl67KYcLRbhWvGUBF3r51BcRgkoTv7t?=
 =?iso-8859-2?Q?hJi3bWmq4en+0t317FvZSvJdxy5uxtNsT9JqMrhCLS8XimpAzZrAA0l7+G?=
 =?iso-8859-2?Q?N7uKG/8edhD/SDwPnbfhEAK007iwpFrWbwCW8YCsP651/3YFA3KkGJvwey?=
 =?iso-8859-2?Q?2Yu6rBlt6Ji7oRfFipwVWjFYBmkIa63ItmcQZSw8TZBNAyR42hUty9ZmsN?=
 =?iso-8859-2?Q?MvshcXAkMocM8ONg5gOgznBHAx39k5j6QunXVebiCNVI793+uAW0/vg2S1?=
 =?iso-8859-2?Q?nPpV3cqDpRvDlyxtoN9btBKB5OUdUzRsoLfFw/SDWxCzI7CuCaRPu1GW2i?=
 =?iso-8859-2?Q?EibprZanED8OtAocaUQYUOTFvZ7y4zlI8H0SsIw+wh4fjZEzFrYoQDbFPF?=
 =?iso-8859-2?Q?drIpeFxVx99lE4DgJS5vZQxP42In8OfkveoJ8ExxXnIKEr5jJSbYoxuQ2+?=
 =?iso-8859-2?Q?VhJbvsz90ymGPp7HBR5pazcpCO4BaZzYERtUZr6ryKikhzshdu/GVnd45r?=
 =?iso-8859-2?Q?IoVi5kzkHAgAVJl119aht1nBmTziBemOrqZ8a11/YKyp4PXIM3B07Pn9Gv?=
 =?iso-8859-2?Q?aO6d+vWecNCAttupnk2snPwM/xCmVlIhZjoBDTu8dcBy2Q3YsvPr7ut+sE?=
 =?iso-8859-2?Q?8wA9LKCwHswRFZb2Wb/VA+ItXN10zxqu8qC+8TUcLHl4remAEvDM8k+uFn?=
 =?iso-8859-2?Q?0LrgDNW6uWBBHC08gfPENkXiGcQkRPAPYOg4W2aZGa4o0lrCGSR6vG4R74?=
 =?iso-8859-2?Q?qTN5WgE6iEMfkSNviSiiJfJRW85gCIhlVLTf8NXg4O1CnIz4Lc+TOTBOqF?=
 =?iso-8859-2?Q?86m5PctyUknTnA8EVTWEhtFHJbkKN39I854DxjnVgr5euigsWiNykc/2Qh?=
 =?iso-8859-2?Q?xPynLqcFf16sijQON44coyqahsuGZPZpl8BaQnvVRaPrmvI5AUBm9xSKBd?=
 =?iso-8859-2?Q?BrKkWnr9BXH6ss/Q0IiZ1ORMQXwotGKW7/xzwdcR16uSgQ4uHVi2feRc1j?=
 =?iso-8859-2?Q?ocfAUZq/aoJSDB7AVwVcIUXedu9RTmGwWPvxDA0n5DxiF+Dgd2SMnZzRz6?=
 =?iso-8859-2?Q?Vc6XWZW1M/YhpYfdFeNhTh5TzMGIda29yRyLGH4dskOhscxVVPAN1YZhfu?=
 =?iso-8859-2?Q?lMdPQBbgcEgVoM+pS1WIhNrejoOtLHVtPSbLVaOUtH8sZkNwkmGM8h3961?=
 =?iso-8859-2?Q?Rg4o27TSoITmzmcDPprLNMI3Rp7eeY8HJG5gcbDKwBeka07j5///pWhR8g?=
 =?iso-8859-2?Q?4/8k4d1LIOw49Bg1uLP2qnERD8BdTRTg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?vTYN3OrBk33M1DuK0qwHslH7BZLWKpVm2ZqVFZSeofWv8aRWq0ByrkmMkG?=
 =?iso-8859-2?Q?DrVP7+r2KPNZ0GZM71GfJPeIA+2WlMKOQRfhW2id66LeyQOOGaepcW/Tpc?=
 =?iso-8859-2?Q?TjSuWGCu4g54Cc+vDK/hIf/Z5cO7Oci6CXCWIWZ3QPPlYRD3fpa+0EsSD9?=
 =?iso-8859-2?Q?RGR0eq5LcBIizlEX8PezEZKRM8c2sL8VzChI+uOYIPc8Hly0vzjLjamhX4?=
 =?iso-8859-2?Q?KI4+9HBZjBM9GCj2wzlxOt1bFcVEHb/svEE36GoKd0o/bLjAwIH+xmZn4a?=
 =?iso-8859-2?Q?aLClDF1M3nqXd8LK5D8hd2hiz2rBs/Pt4rfXq0RljjzUy04OutFH2M7T+L?=
 =?iso-8859-2?Q?q3MtmnunDhABvCXRmxcheB8lTI+p5N+PVytn7vanGot4BYJ2jsIdn+2BQl?=
 =?iso-8859-2?Q?C/i064s+FkOTfZLPIKJdJmPNZHkfRheyhogW+Ymv2zoE5mDf5niL/q7Ygx?=
 =?iso-8859-2?Q?1wKOePtGPJ4kD/fE7YX+vFF2/U7Uv6o4d8AyyFip+h3opRtBQMqrQOXJZH?=
 =?iso-8859-2?Q?F1DivsSYd4sX7PLKRH9CS+hNLP650cUSQp/JHZGlwKVTM4L+v2RIMO+8vc?=
 =?iso-8859-2?Q?ccxajNKmFkoT7Fbd04OA25U3R9JFop7a9IHt0+rlREAUcFGjvaSqGNgsm3?=
 =?iso-8859-2?Q?EBp4JLmWFnRM/Vu30DvONTH/+uyvU5gh02akLudzA29hooieFJnitTugAt?=
 =?iso-8859-2?Q?7P3Q3FQAg2n8XrXsy1W5pV6IsLj5TIH0gcRGk/4Dasj3O0Dz3DVSflfOc1?=
 =?iso-8859-2?Q?HpZT1PZ9fm8Hd7VmHRCVvLgxleU0Y/1IxNIdiBwaSzinzRwnyL8pQ+hO/E?=
 =?iso-8859-2?Q?XWlBU4m1KiJPqGmHeLe/OeKUYHvVbpfsIYO6OnOXmI9bM04lBAjxXlsaCi?=
 =?iso-8859-2?Q?FB38/6rp87aZUd8hZzLPZ4o7WMU5/51IVDAB+OP/O43XdyQikUgw4KMcTD?=
 =?iso-8859-2?Q?FwKXLNExPSgTUqwiEs/8mDwUfFjAUusMs+NSO9EsLeAD+jH2tqVcWY5TwC?=
 =?iso-8859-2?Q?BipVBLzyXcf/YvOpfLB/QGPCmuO0Q0WzrqmyqqyYDz6MPDd1xDKN2ec8ms?=
 =?iso-8859-2?Q?njJSLu0bcpHcCzmobsQvsOIsqkyp9eThHuvRkS+s073NLp2aJtsFk4h+gg?=
 =?iso-8859-2?Q?SJgOk4IOPkT5ZCOPmewOTVlZtoCAnF4ctIVOjFTHMrHuILDok+JTzHM9tx?=
 =?iso-8859-2?Q?o3TxXDS4bh3g2zszlemdt4o+zcU+QnurZL//Wj+NIC2KvwYV+n0RnpIjeA?=
 =?iso-8859-2?Q?nwmVnkwg3hhMXBcGxCEI36ZThDl5eirVYqXh9eq7NLovajQiubs1xvvRke?=
 =?iso-8859-2?Q?FNkisaakqYgDDQiF+WAFCcZgMtEb06VpBvwEGX2/7dEqcvJZj+O/ceM/5V?=
 =?iso-8859-2?Q?IdJNIgM+tN7w4Nc3E1znvJxQQ59LenwpEvgb6niKBtB5XMbnQZDFvyJ26n?=
 =?iso-8859-2?Q?42+2UAAwp//tIF1PQD/0Fe4DZ3eaeqTBQOpP3dWhYH2sHa/zR7qrT2GSRK?=
 =?iso-8859-2?Q?MFDp+uoQ7bEdFiIDtzFZ8R1Lcym+EP/JoTwOOKUujQ803Yt+GUHwVpuyIw?=
 =?iso-8859-2?Q?8M+36tubjgeEFD3QeuErF029TmlSML7hMwhlVztj2vI3oF6IH9VjP5deTJ?=
 =?iso-8859-2?Q?1Fwco3PNYnCBAeFEMokhJA/hLbo1H7M00T?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 64b094fc-0c61-426f-a846-08dc64bc6cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 00:12:41.9576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 T+fs+vCQWOiBqW26MpCQ5gtkjIxAhL5j+m2ARe+isKEQRlO5RF4eLlBJKCFIpbRIvre3P7htO5bp3PyMfCdvCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7849
X-OriginatorOrg: intel.com
Message-ID-Hash: CZWMYJ6PFPOUU52RIDT7A62DSEVMITUG
X-Message-ID-Hash: CZWMYJ6PFPOUU52RIDT7A62DSEVMITUG
X-MailFrom: tony.luck@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZWMYJ6PFPOUU52RIDT7A62DSEVMITUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>> New CPU #defines encode vendor and family as well as model.
>
> This appears to be part of a series but I've no cover letter or anything
> else from it.  What's the story for dependencies and merging?

Sorry. I should have at least added a link to the individual patches to
provide some pointers. It's my first time with a patch bomb of this size,
so I'm learning as I go.

You can pick up the cover letter, and the whole series, from lore with:

$ b4 am 20240424181245.41141-1-tony.luck@intel.com

or pull from: git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git =
new_families_v4

The dependencies for this patch are already in tip x86/cpu, and in linux-ne=
xt.
Basically these three patches:

f055b6260eb3 x86/cpu/vfm: Update arch/x86/include/asm/intel-family.h
e6dfdc2e89a0 x86/cpu/vfm: Add new macros to work with (vendor/family/model)=
 values
a9d0adce6907 x86/cpu/vfm: Add/initialize x86_vfm field to struct cpuinfo_x8=
6

For merging. This can either go through tip with the rest of the series.
Or you can take it through your own tree after the dependencies get
merged into v6.10-rc1 (I'm expecting this to take a couple of release
cycles to complete).

-Tony


