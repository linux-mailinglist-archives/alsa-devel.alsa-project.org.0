Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8779FCAE236
	for <lists+alsa-devel@lfdr.de>; Mon, 08 Dec 2025 21:07:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7A44601A3;
	Mon,  8 Dec 2025 21:06:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7A44601A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765224422;
	bh=lCZR3lzGVfSQ5t5wpCvtIDinFW292WvHn21jffCh9PQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=az2oiUdYfGhSdqHApiy4p8jUhTOABekNAev7a9r+0zFLwwWyd7Jz+e2z7DoBetDmA
	 vHQIYHwXAqQoHq43S1Etc0ouQuUETisCakaHnY+PQYRvJxnXOzRx0Ph8rpbugjaEZo
	 AAE0NNjDA64CO4iG3D23NnJ3+UU3H7cass6qD7IA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61892F805E0; Mon,  8 Dec 2025 21:06:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7941F805D7;
	Mon,  8 Dec 2025 21:06:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F681F80525; Mon,  8 Dec 2025 21:06:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 503EDF804B2
	for <alsa-devel@alsa-project.org>; Mon,  8 Dec 2025 21:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 503EDF804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=g6BvJOLP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765224380; x=1796760380;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lCZR3lzGVfSQ5t5wpCvtIDinFW292WvHn21jffCh9PQ=;
  b=g6BvJOLPwP7DtZA+lyNeYh+cdS7EuJ2FvtkNHKOdcYKKgoTQsZynZ10t
   8xrwuTobJpXVzYXpLW1DECGSZMX2esOEmL5MKJS8SKxS9eCzRnw+QLCKN
   bFxdnigR1xNSz1BVHvp7ZYlitevEtJ97RJucPvaBVTdUhgYYISF9PTA1e
   Q1oBUK5Xjmk6XYOEe5hH326CEBj57Wk9p0qVDWkoxKE88C8u2dtoijSxV
   g7RAGDPTWG0fc7XseyAyLvSK5obINvL91OMMSaFuIHOrvdpIrqEqMDGNN
   +Zq7PvaEcQv9Q7PmA8tyJC7pn+d4HJHqZX5TK1CdnddyReOFhnHlHWTzp
   A==;
X-CSE-ConnectionGUID: rmid3shGQiOTjyDHGYsK9g==
X-CSE-MsgGUID: OcNMQ2t7Rc22bRKEDHivvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="71019423"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800";
   d="scan'208";a="71019423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 12:06:13 -0800
X-CSE-ConnectionGUID: so32AtsHT3GyncjM5qs0KQ==
X-CSE-MsgGUID: I2Zdny32TaesrgNp/0hLJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800";
   d="scan'208";a="200469428"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 12:06:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 12:06:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 12:06:12 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 12:06:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Byt3UHvpdqur0gSAJqqfcQCirSV7MJo8NSRnJznfOjGXJkNUhzKotQ75kQMbfP0s9uufVYE+rdXG9RgSR4zMzTdjUmBH0pjGXbIZ+nHWPMJLKNhNRKPEotN5NjHgRe4XN0Fktma9WkmG8RoT4k/CqvORrTrPYw30j1YQ48MZR7dfmwc7aJNwSr+r2wm1OhSzxLTePeVbIt97UKedlqkYiAXqdy9xCXoHLA1LKrKoEInercjE2A5dxIwbOmW2ohgWARG17LDUzLgVCQD/76gWFmAuwsrmHY+EUTGV30+Qb9GoWfyZuiMpzvjMneZV9ipqte0SMI2VWEG1iPl/AIr2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvdnT8esOqI33NmUvctLMKVaJM30ja47eni+6Zaq6PQ=;
 b=c4aiHvkB9lQWR42EWWO6b6cdw3XO33+fzJW78s367yC6DzhiZi5cH9g7UKfNW9SfWNDuYbP980CUffUKCG63CVVbR0vWIPLUkjUFbFRtFwU+N3GEaFnYBV5KKAV+6GXy8EbFgcqITFreOuJWxjS5Z2JnGZnhmMwX84+vrjeQtIgxDDPvJz7mYyLFKYoGsHoqr7Oy8ZafKmVHSI+NrgKYpZJNlksKk3Wrbbm+YvMl2h5F+aVgz1zIhWbstVNRUzydjMWtcttHLpj61on/rz7OMc3R6h6m78sEZNbPGyAOGWivofj73einQUdBcNHUfa4jtpBTGMhjI7VONNpQXOAGvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by BL1PR11MB5320.namprd11.prod.outlook.com (2603:10b6:208:316::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 20:05:59 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 20:05:59 +0000
Message-ID: <1392db4b-968c-4458-bdf0-de6aedc29fc6@intel.com>
Date: Mon, 8 Dec 2025 21:05:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
To: Oder Chiou <oder_chiou@realtek.com>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
	<derek.fang@realtek.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-2-oder_chiou@realtek.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20251201105926.1714341-2-oder_chiou@realtek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|BL1PR11MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7b0ab6-38c8-4bd1-af1d-08de3695340e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?dWVZVWhJcFNuT2R0c0t4Z1FnZzI1TnQxR3oyUGs5clhNZFFqL09PV291TE1I?=
 =?utf-8?B?T2hDMHUwdXNTOEpBV0Y2c0NUdlYwOVVtQVM5Zk1XYU8veW5HQ3VhZ0JBMDJH?=
 =?utf-8?B?eU1wekRaTjFranFabStQWmNQSkVXaHpmYit1N1NmL0lKK0hyVHFTbWdTZDdh?=
 =?utf-8?B?L2szMEhiSnFXNWFPR2RVUTh4ei9pdjVnaGdkZnVnWUxDRUF5bTZUUkpBY0xH?=
 =?utf-8?B?ZW1VczFValZXVFZyTklWRFRiQ2MrVmFMMGdtSHlwbTZOU0JYcEFTVTdQZXVo?=
 =?utf-8?B?cjVkcm9SNUpyd0pyMDRYSUNBQ1FpcWM3Ykl6a2JMRWJQUVFNVFhsTTVtWS9E?=
 =?utf-8?B?V3d0MlY0ZksvTTBBb3p3aFlGWTNKOVpvR3hZZlRsVWFIbjV3SGVSSzRnRTB2?=
 =?utf-8?B?YWgzSkx5SmUwdkFjUXR1NTFOVitCYkl2S0F5R3FERlFNRzB5WnIrRE9zTFBs?=
 =?utf-8?B?WUZIekdueU4vRDdyQmp0anp1OHh5TWx2YmsyTkd0dmI2VzhiYzlBdHRTVGlD?=
 =?utf-8?B?OXZhRG5oNURDMmpURzNCazBWRld1NnJ0ZDBlQ2ZrSE5BTGRyd1pXVTZ1dTUx?=
 =?utf-8?B?RXd5UVVKNW5YTVZqcTUyNHY0dXNqZDMxRW4yOGYwQ3hHU1dsczRXdkM1dXdr?=
 =?utf-8?B?T01mV3FlU3VpWWFZaUUyUDlNU2VpTkNzaXppNFkvTkdtcUN4VWpjOHZjc0Z0?=
 =?utf-8?B?YWhkc2FuaWtpRHd6Yi9lL0hPcWZXbmhSZzJLK004MjNYOVdLeGx3L2V1WUty?=
 =?utf-8?B?TUl5Wm5USVNUdWtua0NVL0UrWnNqWXdOc0c1TTNsSitQd2svWFZTYitabU5O?=
 =?utf-8?B?a2ZIdXliSXhWWm1DSEgwY0xDSjNkZmUxT2xBNXdNdXFOelExd3RqdmRUYkZI?=
 =?utf-8?B?NFpta2M4SFdwb0RIWUNNdjlQaTdlZnlJYXZGdm4wN2lzYlFkbm43NFRwWVZu?=
 =?utf-8?B?bm9YS2lDd24wT1p3Wlh0ejdOTkdWTUlYQmVMblZhZmd1UHh6TzVHc0dQTUo5?=
 =?utf-8?B?RlFEdjhSbUxacmNSbzFYZmhlTCtTSjkybzRZZ00zdG40MXIxRWs3S3N2NkJK?=
 =?utf-8?B?cHRvdjkzeFFUc25vUXRsNng3Nk1NVENhRWJuS0RPQjN6MWt2NklEVUhzVWxh?=
 =?utf-8?B?TytSQ1JHMGNPS0J1NERQYTJGeE9VaXFNZCtaRllqOFFqY0hMRGVUZnlOdzdj?=
 =?utf-8?B?elpsNzYzK0YzRDg3SHlhUmpDNVJ5SXIvb3B2eUE0b1UxdThLa2ZOTHVCMndW?=
 =?utf-8?B?U0NzL1NkMWlubGk0MC9rcFhLT0ZIMVhSTkVCR3lodmo5eTVKMFV3R2hMclZj?=
 =?utf-8?B?OVh2Q0xEdnpJVUExY3hNSVI2K3FsdW5Pc3p0WXhJSUJLMmhtemxPUUd4Lyta?=
 =?utf-8?B?K0cyb0NHUENLRmNWSXpCazE4SzRVT29lSUMwL2hVTkJxWlE4NWNmRFZGdCtC?=
 =?utf-8?B?L0ZBK0k0MjJoQW0va1N4N2xTRENmUnpRSHVqci9qQnRRaW10bGFTUHJ1N3dR?=
 =?utf-8?B?d2F0c2ltZjJLVEpHcnNJemhMYm4vb2dxcHBJdWpmRnp1RlhyTG4rVGdwWHBo?=
 =?utf-8?B?c0hwdHd0RGNpbXJGTWNLZ1NjZWo3NnBKRmNNbldDSlJGcmd5M1QzRENUOWtV?=
 =?utf-8?B?RHhjTDhyN1pwUTI4ekJQNVZYa0ZkWWZRbWNMbGhkdnBnV0Vta2ZuVGloelZu?=
 =?utf-8?B?T0dac0p6SDZnek5TV1Fta3g5QW5nOHkxYUJrdTJwNVErOWtna2lGUSs0a2VT?=
 =?utf-8?B?N2NDcjZ5Wm9wbFBBeDVESVhFd25SYXZCRE9ydkRTZWFDVUZrcGVXaGd0eUM2?=
 =?utf-8?B?V0lWT1ZCVFJpMS9vMjZXTUJNRDBJTE9JUTgvQnl6S0NQRHZWK09tbmVRby9n?=
 =?utf-8?B?Sk42RUJzSnBWTjNjcmZtZFFuaXVKZkpEeWNubk1WODQvdEdWNUxDQ2dPRmNy?=
 =?utf-8?Q?rqXxwmCbIiKiSYGxJbLH6G9x+fasOV+/?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?RndFREt6MEdQS2ZndTBhdjlWNDk1ZHBRZ1lTSWZLdVkvNGxJczI3bDM1bTBF?=
 =?utf-8?B?NjU4Rzd4RDRZZDdxc3A0b0JsNkpUTis0ZnByWitDSk5Na0xNMnUwRW5UL2U4?=
 =?utf-8?B?YVF5elpuWC9GdUtnMUxZYi9IR2xRWXViVmhselRZVmVlZzJ1Qkx6NVRhOWsz?=
 =?utf-8?B?WnpaMjZWbXRFaHJVSzRYbldRSW1VUkIxTHZTUGhDVlNSS0dYWHB4eWJJRUpV?=
 =?utf-8?B?VFRLbG4xNW0wNEg4ZFNla3lCbkhkM2RlVWt3Wm5jRkwxVSsxOTk1Y2xnWHo0?=
 =?utf-8?B?UnpYSy9xM2JmQ2MwL0NodHFXNFkvKzR4Mk1pQ1NOdzNOYklZY0F0anRRcHBR?=
 =?utf-8?B?MzhBS0YwZXNrOGl5cWdYditWbEhEdnVYeHRpNGpxUURZR0ZjZUp1eUE4cElM?=
 =?utf-8?B?dGhnVkREdUhuVmRBQXN1SjUrL004RkZRNDlzNUd2cHlmQ3dNS1BucS81N2l5?=
 =?utf-8?B?ZytHUEdxckh3VWJCbm8zWEFkT1RFaGZmVzBpSE95bGdobXhGZjdxcWlVVUJu?=
 =?utf-8?B?MVNLSGJieWRqVGs1NkI5bVFLU21LTStVT0VaNXpiSTVpb0p3d3lxNlZjNkVH?=
 =?utf-8?B?emtILy9zU0VyUmxyVDFIWnR2cUxRL3F3bmtZZFFwKytxeTRIcTE4bHpmWWlW?=
 =?utf-8?B?bks4SVpMcnhqRHNleDdmQXM2a3p3dVg5MkxmQlQxMHFMMk9UM2JSUnRES3B6?=
 =?utf-8?B?Qzk3UlB4U2FOeFhDcE84VnU5U3Y2RmNRc3NBRVM4bzFDQ0VQd2lxb0NzUG82?=
 =?utf-8?B?Zy96YWdCcEl4b3NEUUdEeWVyQUNpM0Y4djJLa2hob3NEQ01OcTJDNk1sV0kz?=
 =?utf-8?B?YzRaRkVGSXVxOWNxNkRMMFMyUmRPQ0lvWVloWXJ1b1pzcmZwbWdQNnJ6Tmh1?=
 =?utf-8?B?K0NaYnVPYk96T0p5WGk4dlVheitQN09NbHlkZmJ1ZWU2ZDhoTGNTVjM1MDdB?=
 =?utf-8?B?Z2hsdFdCbnhlUzQzc3hzS1JDRnE4NUE4U0dWL0VNS0s3aVRSenBzZTJGb3BY?=
 =?utf-8?B?N1ZCUnkwNWxBN0FtVVZmOWdUb0hFcE9kc3BoSWo4Wml1T3NkMUtVUWNidGtW?=
 =?utf-8?B?cUVQVURRZkE5aUhKK0NlSGxoRDFYcHIzb3hwS2pQQVoxTlUrTnliNWNiaHE1?=
 =?utf-8?B?OXV5OW9EMTE2K3lNS2VUVFUweGFjaUZQYXFBYUVrZWRmVkhDY1NXNThhNWow?=
 =?utf-8?B?U0JCNG9OUW5EYUhBa3dDYkdVRG0xc3pPNnkvKzlhWFNtV0Jrb2pzZ3JzWDhU?=
 =?utf-8?B?c0ltZnl1QWl6WW5IcDNrMUEybVF5b3lOZi92UzR6c1l5a29qSkdsZVZ2TmVS?=
 =?utf-8?B?Qmk1cmZVSUxBS1NUOU9obHRCa1Vpb1hQaWRiTEdhdUhEWDBHM2VDZ216UGgz?=
 =?utf-8?B?NTlSZHBJSWsrRmxKUEJldXdwTTBvdzRYR1VCTlE2aFJDaEp3My9nVThlbkwv?=
 =?utf-8?B?MEEyR2FIc2txYTVXbFFnejFEZDlRS1hUL3UzdlFMQmpJWXU5VTN4OUhSb0da?=
 =?utf-8?B?WS9nemR1aWt5NWZwbEg2VlpmSUZxR1hjMzUwWlhjVkZPYUEyS0hYNzhiSXNL?=
 =?utf-8?B?NDBWMWtBeWZ1bjNrVWw0V3U3cHdHUUxvRFY1RmJVT0ZvQjdlNHk0c1UybW9F?=
 =?utf-8?B?elFpSnJsMXBBTlI3TU1aWGUxWlN6Z1hRZllwUWc4OTUrb0NmV25SWnpSVTZr?=
 =?utf-8?B?Q2ptQWpNMjlFbWlVR3hGYW53dnA4VUJmaEJpRnB1aUs3OHVDZTI3bHNwclJS?=
 =?utf-8?B?SElnbnlqRzlQQVkvWFRRRThKMm1sS3JNKzNvM2NlMkhMM2lZWmRPQWVXZzJD?=
 =?utf-8?B?RXBRSy8vNXJkSHdOc0w1QVc5U2luUFBuQmd1N0RxbXNrNGIrZ210K0tkU0J0?=
 =?utf-8?B?bEtkRUppdW4xMW5rL2F2bW5wQWU2aE5lcVpUR1NzVFZCTk5pSndCT29Ub0Iz?=
 =?utf-8?B?M1pWOTBTTlVKUEd6UDg1K3pDTmwyVWNHeXJqY0pDRDZlM2MzL0pYMUdQSm9t?=
 =?utf-8?B?c29xUzlpZWJWVEcwNFNFeUdZdmFEdXRWL3FPNnVRcmc1OCtIWGZWbGtoNVdr?=
 =?utf-8?B?ekZPZ0lnMWJLQUdMbjlJbDMvWFVjWFFXcG9qcnJCSFlQb2J6ZjJJLzFMK1hz?=
 =?utf-8?B?NjU5R05oNGRRTVBNaWF3NGZ0UUMyU09rZFd2NTYwZEtQOTA0TFBpMGpLTXBJ?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3c7b0ab6-38c8-4bd1-af1d-08de3695340e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 20:05:58.7914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aQMZNE0XDlBCsS+8rHKccTalq/IXjBeCB+lR+sKz0RdKRfOBHbWMbhvbfiFxhQJDdyOuzTikO7TtUUTERRqvUMsVLL6Pm5z1UIfhfbz0E6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
X-OriginatorOrg: intel.com
Message-ID-Hash: T5OKWBRDIIF7FNWWXJSSXZL3BQOK2OQS
X-Message-ID-Hash: T5OKWBRDIIF7FNWWXJSSXZL3BQOK2OQS
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5OKWBRDIIF7FNWWXJSSXZL3BQOK2OQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2025-12-01 11:59 AM, Oder Chiou wrote:
> The ALC5575 integrates an audio DSP that typically loads its firmware
> from an external flash via its own SPI host interface. In certain
> hardware configurations, the firmware can alternatively be loaded
> through the SPI client interface. The driver provides basic mute and
> volume control functions. When the SPI client interface is enabled,
> firmware loading is handled by the SPI driver.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>

...

> diff --git a/sound/soc/codecs/rt5575-spi.c b/sound/soc/codecs/rt5575-spi.c
> new file mode 100644
> index 000000000000..12c2379a061e
> --- /dev/null
> +++ b/sound/soc/codecs/rt5575-spi.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * rt5575-spi.c  --  ALC5575 SPI driver
> + *
> + * Copyright(c) 2025 Realtek Semiconductor Corp.
> + *
> + */
> +
> +#include <linux/of.h>
> +#include <linux/spi/spi.h>
> +
> +#include "rt5575-spi.h"
> +
> +#define RT5575_SPI_CMD_BURST_WRITE	5
> +#define RT5575_SPI_BUF_LEN		240
> +
> +struct rt5575_spi_burst_write {
> +	u8 cmd;
> +	u32 addr;
> +	u8 data[RT5575_SPI_BUF_LEN];
> +	u8 dummy;
> +} __packed;
> +
> +struct spi_device *rt5575_spi;
> +EXPORT_SYMBOL_GPL(rt5575_spi);
> +
> +/**
> + * rt5575_spi_burst_write - Write data to SPI by rt5575 address.
> + * @addr: Start address.
> + * @txbuf: Data buffer for writing.
> + * @len: Data length.
> + *
> + */
> +int rt5575_spi_burst_write(u32 addr, const u8 *txbuf, size_t len)
> +{
> +	struct rt5575_spi_burst_write buf = {
> +		.cmd = RT5575_SPI_CMD_BURST_WRITE
> +	};
> +	unsigned int end, offset = 0;
> +
> +	while (offset < len) {
> +		if (offset + RT5575_SPI_BUF_LEN <= len)
> +			end = RT5575_SPI_BUF_LEN;
> +		else
> +			end = len % RT5575_SPI_BUF_LEN;
> +
> +		buf.addr = cpu_to_le32(addr + offset);
> +
> +		memcpy(&buf.data, &txbuf[offset], end);
> +
> +		spi_write(rt5575_spi, &buf, sizeof(buf));
> +
> +		offset += RT5575_SPI_BUF_LEN;

Make it cohesive by proper spacing - it's a logical block, and logical 
blocks are easier to read if grouped together e.g.:

<assuming newline after the if-else-statement>

		buf.addr = cpu_to_le32(addr + offset);
		memcpy(&buf.data, &txbuf[offset], end);
		spi_write(rt5575_spi, &buf, sizeof(buf));

		offset += RT5575_SPI_BUF_LEN;

See?  Clear separation of operations leading to spi_write() and the 
offset increment.

> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rt5575_spi_burst_write);
> +
> +static int rt5575_spi_probe(struct spi_device *spi)
> +{
> +	rt5575_spi = spi;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rt5575_of_match[] = {
> +	{ .compatible = "realtek,rt5575" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rt5575_of_match);
> +
> +static struct spi_driver rt5575_spi_driver = {
> +	.driver = {
> +		.name = "rt5575",
> +		.of_match_table = of_match_ptr(rt5575_of_match),
> +	},
> +	.probe = rt5575_spi_probe,
> +};
> +module_spi_driver(rt5575_spi_driver);
> +
> +MODULE_DESCRIPTION("ALC5575 SPI driver");
> +MODULE_AUTHOR("Oder Chiou <oder_chiou@realtek.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/rt5575-spi.h b/sound/soc/codecs/rt5575-spi.h
> new file mode 100644
> index 000000000000..b364b49bb43e
> --- /dev/null
> +++ b/sound/soc/codecs/rt5575-spi.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * rt5575-spi.h  --  ALC5575 SPI driver
> + *
> + * Copyright(c) 2025 Realtek Semiconductor Corp.
> + *
> + */
> +
> +#ifndef __RT5575_SPI_H__
> +#define __RT5575_SPI_H__
> +
> +extern struct spi_device *rt5575_spi;
> +
> +int rt5575_spi_burst_write(u32 addr, const u8 *txbuf, size_t len);
> +
> +#endif /* __RT5575_SPI_H__ */

The entire header can be dropped and its content moved to rt5575.h. 
It's included in both C-files plus we want to get rid of the global 
rt5575_spi anyway.  I do not think rt5575_spi_burst_write() belongs here 
either, see my comments regarding rt5575_fw_load_by_spi().

> diff --git a/sound/soc/codecs/rt5575.c b/sound/soc/codecs/rt5575.c
> new file mode 100644
> index 000000000000..c7e8f5a606bc
> --- /dev/null
> +++ b/sound/soc/codecs/rt5575.c
> @@ -0,0 +1,375 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * rt5575.c  --  ALC5575 ALSA SoC audio component driver
> + *
> + * Copyright(c) 2025 Realtek Semiconductor Corp.
> + *
> + */
> +
> +#include <linux/firmware.h>
> +#include <linux/i2c.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>
> +
> +#include "rt5575.h"
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
> +#include "rt5575-spi.h"
> +#endif
> +
> +static bool rt5575_readable_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case RT5575_ID:
> +	case RT5575_ID_1:
> +	case RT5575_MIXL_VOL:
> +	case RT5575_MIXR_VOL:
> +	case RT5575_PROMPT_VOL:
> +	case RT5575_SPK01_VOL:
> +	case RT5575_SPK23_VOL:
> +	case RT5575_MIC1_VOL:
> +	case RT5575_MIC2_VOL:
> +	case RT5575_WNC_CTRL:
> +	case RT5575_MODE_CTRL:
> +	case RT5575_I2S_RATE_CTRL:
> +	case RT5575_SLEEP_CTRL:
> +	case RT5575_ALG_BYPASS_CTRL:
> +	case RT5575_PINMUX_CTRL_2:
> +	case RT5575_GPIO_CTRL_1:
> +	case RT5575_DSP_BUS_CTRL:
> +	case RT5575_SW_INT:
> +	case RT5575_DSP_BOOT_ERR:
> +	case RT5575_DSP_READY:
> +	case RT5575_DSP_CMD_ADDR:
> +	case RT5575_EFUSE_DATA_2:
> +	case RT5575_EFUSE_DATA_3:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const DECLARE_TLV_DB_SCALE(ob_tlv, -9525, 75, 0);
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
> +static void rt5575_fw_load_by_spi(const struct firmware *fw, void *context)

So, rt5575_spi_burst_write(), a wrapper for spi_write(), is exported to 
be available outside of the rt5575-spi module while its only user, 
rt5575_fw_load_by_spi(), which performs no I2C-specific tasks, is found 
with the common, rt5575.c file?

We can do better.  There are couple options here, one of them consists of:

1) privatize rt5575_spi_burst_write()
2) make rt5575_fw_load_by_spi() public
3) change rt5575_fw_load_by_spi() from void to int and return 
request_firmware_xxx() result
4) reword to rt5575_spi_fw_load() to match its friends

In regard to 1), have a #if-else preproc added to rt5575.h that governs 
the implementation of said function.  If xxx_RT5575_SPI is disabled, let 
is be a stub that returns 0.

In regard to 2), please do not ignore failures from firmware loading, 
that's a recurring point in this review and keeps being ignored.  No, 
async-firmware loading in not the answer why potential errors are left 
unhandled.

Another option, perhaps a better one is to have both 
rt5575_spi_burst_write() and rt5575_spi_fw_load() privatized and move 
the firmware-loading to the SPI-device probe.  See my comments targeting 
rt5575_probe().

> +{
> +	struct rt5575_priv *rt5575 = context;
> +	struct i2c_client *i2c = rt5575->i2c;

The whole reason this function needs i2c_client is ->dev retrieval. 
Let's simplify by listing 'struct device *dev' as an argument instead. 
With that, your function's argument list is also more explicit.

> +	const struct firmware *firmware;
> +	static const char * const fw_path[] = {
> +		"realtek/rt5575/rt5575_fw2.bin",
> +		"realtek/rt5575/rt5575_fw3.bin",
> +		"realtek/rt5575/rt5575_fw4.bin"
> +	};
> +	static const u32 fw_addr[] = { 0x5f600000, 0x5f7fe000, 0x5f7ff000 };
> +	int i, ret;
> +
> +	regmap_write(rt5575->dsp_regmap, 0xfafafafa, 0x00000004);
> +	regmap_write(rt5575->dsp_regmap, 0x18008064, 0x00000000);
> +	regmap_write(rt5575->dsp_regmap, 0x18008068, 0x0002ffff);
> +
> +	rt5575_spi_burst_write(0x5f400000, fw->data, fw->size);
> +	release_firmware(fw);
> +
> +	for (i = 0; i < ARRAY_SIZE(fw_addr); i++) {
> +		ret = request_firmware(&firmware, fw_path[i], &i2c->dev);
> +		if (!ret) {
> +			rt5575_spi_burst_write(fw_addr[i], firmware->data, firmware->size);
> +			release_firmware(firmware);
> +		} else {
> +			dev_err(&i2c->dev, "Request firmware failure: %d\n", ret);
> +			return;
> +		}
> +	}
> +
> +	regmap_write(rt5575->dsp_regmap, 0x18000000, 0x00000000);
> +
> +	regmap_update_bits(rt5575->regmap, RT5575_SW_INT, 1, 1);
> +
> +	regmap_read_poll_timeout(rt5575->regmap, RT5575_SW_INT, ret, !ret, 100000, 10000000);
> +
> +	if (ret)
> +		dev_err(&i2c->dev, "Run firmware failure: %d\n", ret);
> +}
> +#endif
> +
> +static const struct snd_kcontrol_new rt5575_snd_controls[] = {
> +	SOC_DOUBLE("Speaker CH-01 Playback Switch", RT5575_SPK01_VOL, 31, 15, 1, 1),
> +	SOC_DOUBLE_TLV("Speaker CH-01 Playback Volume", RT5575_SPK01_VOL, 17, 1, 167, 0, ob_tlv),
> +	SOC_DOUBLE("Speaker CH-23 Playback Switch", RT5575_SPK23_VOL, 31, 15, 1, 1),
> +	SOC_DOUBLE_TLV("Speaker CH-23 Playback Volume", RT5575_SPK23_VOL, 17, 1, 167, 0, ob_tlv),
> +	SOC_DOUBLE("Mic1 Capture Switch", RT5575_MIC1_VOL, 31, 15, 1, 1),
> +	SOC_DOUBLE_TLV("Mic1 Capture Volume", RT5575_MIC1_VOL, 17, 1, 167, 0, ob_tlv),
> +	SOC_DOUBLE("Mic2 Capture Switch", RT5575_MIC2_VOL, 31, 15, 1, 1),
> +	SOC_DOUBLE_TLV("Mic2 Capture Volume", RT5575_MIC2_VOL, 17, 1, 167, 0, ob_tlv),
> +	SOC_DOUBLE_R("Mix Playback Switch", RT5575_MIXL_VOL, RT5575_MIXR_VOL, 31, 1, 1),
> +	SOC_DOUBLE_R_TLV("Mix Playback Volume", RT5575_MIXL_VOL, RT5575_MIXR_VOL, 1, 127, 0,
> +		ob_tlv),
> +	SOC_DOUBLE("Prompt Playback Switch", RT5575_PROMPT_VOL, 31, 15, 1, 1),
> +	SOC_DOUBLE_TLV("Prompt Playback Volume", RT5575_PROMPT_VOL, 17, 1, 167, 0, ob_tlv),
> +};
> +
> +static const struct snd_soc_dapm_widget rt5575_dapm_widgets[] = {
> +	SND_SOC_DAPM_AIF_IN("AIF1RX", "AIF1 Playback", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("AIF1TX", "AIF1 Capture", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("AIF2RX", "AIF2 Playback", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("AIF2TX", "AIF2 Capture", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("AIF3RX", "AIF3 Playback", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("AIF3TX", "AIF3 Capture", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("AIF4RX", "AIF4 Playback", 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("AIF4TX", "AIF4 Capture", 0, SND_SOC_NOPM, 0, 0),
> +
> +	SND_SOC_DAPM_INPUT("INPUT"),
> +	SND_SOC_DAPM_OUTPUT("OUTPUT"),
> +};
> +
> +static const struct snd_soc_dapm_route rt5575_dapm_routes[] = {
> +	{ "AIF1TX", NULL, "INPUT" },
> +	{ "AIF2TX", NULL, "INPUT" },
> +	{ "AIF3TX", NULL, "INPUT" },
> +	{ "AIF4TX", NULL, "INPUT" },
> +	{ "OUTPUT", NULL, "AIF1RX" },
> +	{ "OUTPUT", NULL, "AIF2RX" },
> +	{ "OUTPUT", NULL, "AIF3RX" },
> +	{ "OUTPUT", NULL, "AIF4RX" },
> +};
> +
> +static long long rt5575_get_priv_id(struct rt5575_priv *rt5575)
> +{
> +	int priv_id_low, priv_id_high;
> +
> +	regmap_write(rt5575->regmap, RT5575_EFUSE_PID, 0xa0000000);
> +	regmap_read(rt5575->regmap, RT5575_EFUSE_DATA_2, &priv_id_low);
> +	regmap_read(rt5575->regmap, RT5575_EFUSE_DATA_3, &priv_id_high);
> +	regmap_write(rt5575->regmap, RT5575_EFUSE_PID, 0);
> +
> +	return ((long long)priv_id_high << 32) | (long long)priv_id_low;
> +}
> +
> +static const struct of_device_id rt5575_of_match[] = {
> +	{ .compatible = "realtek,rt5575" },
> +	{ .compatible = "realtek,rt5575-with-spi" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rt5575_of_match);
> +
> +static int rt5575_probe(struct snd_soc_component *component)
> +{
> +	struct rt5575_priv *rt5575 = snd_soc_component_get_drvdata(component);
> +	struct device *dev = component->dev;
> +
> +	rt5575->component = component;
> +
> +	dev_info(dev, "Private ID: %llx\n", rt5575_get_priv_id(rt5575));
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
> +	if (of_device_is_compatible(dev->of_node, rt5575_of_match[1].compatible))
> +		request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,


An ASoC card is typically a mariage of platform-component (e.g.: SoC 
level DSP) and a codec-component (e.g.: rt5575).  If for any reason the 
platform-component becomes unloaded, codec-component will also be.  When 
the platform-component becomes available again, the 
codec-component->probe() would be invoked again - firmware would be 
loaded again.  Is this the desired behaviour?

To answer that, the follow up question is:  Is the firmware-loading for 
this particular solution, a chip -level operation or, a sound-card 
-level operation?  Typically firmware-loading is the former.  Once 
succeeeds, an ASoC component can be registered.  There is no reason to 
register ASoC component, which is mainly used for PCM/streaming reasons, 
if the preliminary setup - firmware-loading - is unsuccefull.

Perhaps a good approach is to move the firmware loading to the 
SPI-device's probe()!

> +		"realtek/rt5575/rt5575_fw1.bin", component->dev, GFP_KERNEL, rt5575,
> +		rt5575_fw_load_by_spi);
> +#endif
> +
> +	return 0;
> +}

...

> +
> +static const struct i2c_device_id rt5575_i2c_id[] = {
> +	{ "rt5575" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, rt5575_i2c_id);
> +
> +static int rt5575_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct rt5575_priv *rt5575;
> +	struct device *dev = &i2c->dev;
> +	int ret, val;
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
> +	if (!rt5575_spi && of_device_is_compatible(dev->of_node, rt5575_of_match[1].compatible))
> +		return -EPROBE_DEFER;
> +#endif
> +
> +	rt5575 = devm_kzalloc(dev, sizeof(struct rt5575_priv),
> +				GFP_KERNEL);
> +	if (rt5575 == NULL)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, rt5575);
> +
> +	rt5575->i2c = i2c;
> +
> +	rt5575->dsp_regmap = devm_regmap_init_i2c(i2c, &rt5575_dsp_regmap);
> +	if (IS_ERR(rt5575->dsp_regmap)) {
> +		ret = PTR_ERR(rt5575->dsp_regmap);
> +		dev_err(dev, "Failed to allocate register map: %d\n", ret);

"Failed to allocate DSP register map:" so it differs from the one below?

> +		return ret;
> +	}
> +
> +	rt5575->regmap = devm_regmap_init(dev, NULL, i2c, &rt5575_regmap);
> +	if (IS_ERR(rt5575->regmap)) {
> +		ret = PTR_ERR(rt5575->regmap);
> +		dev_err(dev, "Failed to allocate register map: %d\n", ret);
> +		return ret;
> +	}
> +
> +	regmap_read(rt5575->regmap, RT5575_ID, &val);
> +	if (val != RT5575_DEVICE_ID) {
> +		dev_err(dev, "Device with ID register %08x is not rt5575\n", val);
> +		return -ENODEV;
> +	}
> +
> +	regmap_read(rt5575->regmap, RT5575_ID_1, &val);
> +	if (!val) {
> +		dev_err(dev, "This is not formal version\n");
> +		return -ENODEV;
> +	}
> +
> +	return devm_snd_soc_register_component(dev, &rt5575_soc_component_dev, rt5575_dai,
> +		ARRAY_SIZE(rt5575_dai));

Alignment.

> +}
> +
> +static struct i2c_driver rt5575_i2c_driver = {
> +	.driver = {
> +		.name = "rt5575",
> +		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(rt5575_of_match),
> +	},
> +	.probe = rt5575_i2c_probe,
> +	.id_table = rt5575_i2c_id,
> +};
> +module_i2c_driver(rt5575_i2c_driver);
> +
> +MODULE_DESCRIPTION("ASoC ALC5575 driver");
> +MODULE_AUTHOR("Oder Chiou <oder_chiou@realtek.com>");
> +MODULE_LICENSE("GPL");
