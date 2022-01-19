Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCBC4936A3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 09:55:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39CE032BD;
	Wed, 19 Jan 2022 09:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39CE032BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642582523;
	bh=ZQzeeHk6f/cHO5Y2vQaTqsdHk2jn2Kp8e4HKhiiB7H4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QQGDFrLb33el61iNru/oRmQacH4dOki//MOhSuyw48NXD92KVm9OGkenkVaiJ7O47
	 sOQ4jwZVCZo+s5L0OzW82JCamUGRcRtMZm+Rmv+9kJYnjJmb6B7rFMN1CC7eR5DTk6
	 cPGyQfA5Wp1Xu7SxXEUj3xyV0tsQ/TfBw9WExsVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91102F800F8;
	Wed, 19 Jan 2022 09:54:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5180DF800F8; Wed, 19 Jan 2022 09:54:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 819C8F800F8
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 09:54:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 819C8F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Q/W2clz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642582452; x=1674118452;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZQzeeHk6f/cHO5Y2vQaTqsdHk2jn2Kp8e4HKhiiB7H4=;
 b=Q/W2clz488bRcB/VVerwIadORRLtrsHG+qgWQND4KOnsNkjzpsluJIzN
 pmTGKifx5Ewgdg+dPlSCAudW28T57yAvvCLvD1zC5Atz9LSdcrKs0AeSs
 8DdTDzRZmiB9ziedyGaFRPRz09rfDZnAK4sKzCyJWKdX03jsax6vUAAF0
 x+9dF2pgMBG8qQuxmu8cSxa9f0UGoREQt9OnQt6M68UdThDVUCIQQiE8z
 xIw3yKl1yjs3YgjdpXTMFEAMh0hPDjROiPAL0MMPL87X2o1SXxfNFkKzu
 cX5GRKkUYpcCIwfMaV+usXR+nNfEBP9fo2HAIHqgNuKf6HxkScv/Sgntn w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="232383979"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="232383979"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 00:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="578757467"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jan 2022 00:54:07 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 00:54:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 19 Jan 2022 00:54:06 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 19 Jan 2022 00:54:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XV7K7hd36R1h3vp2HUaQ9mRmYxhPs3wO1MTPW7pwn4IfrxXncMO7IJ0CAdS0hnMvc7gyvuzFZUKfY/N749XDtXy2bhJdAyHjDhLa6NZj0KIAhZTbvRloExdBrRmVL2KSsJCvGFkbYJozTGUhGozJTQVa18BVZMo9d35+fYtEmA8aOTTLeROsRzGKI2qJRoYk8XFSONlJJ2uY5fJ7R3qD+238abGx+YaVVNvUkAOHF1PMIAm++AAcq1lb96DAG7SyLXC5FptT3/C03KTvCZZgib1lvosOXml2UWPCTasHmYxN9cdkx6TxOl+/tVBaB/RxUCNjuuwY5Ll3PODVoMWvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQzeeHk6f/cHO5Y2vQaTqsdHk2jn2Kp8e4HKhiiB7H4=;
 b=WaTLNzXf/IbunvEXl+PSKSzc0vy2s0CabFm9accsfi+6kqelM4UqRxrqJJxriu64qqZYG97D59qp3YjH0ebYJpIrPqE5N1kgVd9s2DNS/GkFw7u/rU+tJ/M3QaG7m+vBdqajmR0fpB2A57ga6eK/mlwxUuwBPnzNtVs7IsrKIUz/FKchd1aPKIdRPpBDbeEUSZisQWLSVWHdNNs5pbwCub7xipRg8Ykd1dVL0BVUXafBKw2sIGcUer/M3OQ/zAIChtxZadagsBEBkdBJhsxHERsnDEKStk3ycXvgtsdOXdVTv2ZRUEjZaNw+va9c9tUwBdBOCrY4y53uqG0Cx+haRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18)
 by CY4PR1101MB2264.namprd11.prod.outlook.com (2603:10b6:910:24::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 08:54:05 +0000
Received: from SA2PR11MB4891.namprd11.prod.outlook.com
 ([fe80::e8dc:d31:287e:ded1]) by SA2PR11MB4891.namprd11.prod.outlook.com
 ([fe80::e8dc:d31:287e:ded1%8]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 08:54:05 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "Chiang, Mac" <mac.chiang@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sof_rt5682: add 512FS MCLK clock
 configuration
Thread-Topic: [PATCH] ASoC: Intel: sof_rt5682: add 512FS MCLK clock
 configuration
Thread-Index: AQHYDEiD/m6bZjx1L0SO7d0G//0/i6xo5QaAgAEBO4CAACQa0A==
Date: Wed, 19 Jan 2022 08:54:05 +0000
Message-ID: <SA2PR11MB48916D2EE16AA103C1ED3E4E97599@SA2PR11MB4891.namprd11.prod.outlook.com>
References: <20220118084952.9555-1-mac.chiang@intel.com>
 <6aba2a91-695c-c69b-db0a-59a6b27fb425@linux.intel.com>
 <PH0PR11MB583286547DFF8BA8CEB2B0D584599@PH0PR11MB5832.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB583286547DFF8BA8CEB2B0D584599@PH0PR11MB5832.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63b06776-0989-4245-c771-08d9db293f63
x-ms-traffictypediagnostic: CY4PR1101MB2264:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR1101MB2264B3767C2446749D8605FE97599@CY4PR1101MB2264.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4R4OG3MGJShOxClG7837HKg92TNcngW76iKhr0gzelkGSO1O422X9dQD1+aTgdvf+46RKCrttBbWjONB4l0lr1pZE74fudqU7Kbsw9PCAZRZpt6KZ5omTn+CQpeAtNcO+xwF26B30RJbqGGSus9QNWnXPomEKMjBKo+K6knw4oOwkOKvUgiVLyrAzZKc+Za7fUlENlPfUh2Qp4IYPSRQmELgPoZIWyGGHfo4ZsdDmUGCJeaOZMNZDmTG1R2JRNMnuJiMzYd1dQuFDnlBNmmIBUgpYLYOXDFPl4dAl4k1Trjty1bj2LnUK8x3Nx+lXgYfPAu8Uoq/aICnzgjVC3qARIhsO54WsWwm6T6g4gDQsjvyMHwCNbXFQTXA5b/ovFtp5u6ACst1HHg922rSC+12R2AVkD5NNLNpGDbhgagJ7nrY57yRkz28D+mSTWqAXv0rEbL5U7kvEHe0p2cJUYRc+Tb5DsP6GgSSZc1e962HbLNr+k83QuXcpNFw+6Ip+XaqSzlsHlOQCPgKlHHcnBb4r0O1Fga8u9pAE0VQkXrTes8bQ9KWQUgfaEw+lWNP/efG7ye2nDhinemaQO6bSF3peknid8bWqDuWkMP8MyLzHHdQxZHQurhgIxbeiuBV33mlCf+ZOOSVL2lCKLBVR0TJ/3P84FoOvtMtCJ0GgPy3mOSOJqj9qzblGq5Es6wILrOmuOps6BoFF/uOswcHRzRiAR8LaIiFRFl4tutyo49Qjjg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4891.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(6506007)(508600001)(55016003)(33656002)(316002)(8676002)(82960400001)(4326008)(186003)(54906003)(66946007)(71200400001)(66446008)(38100700002)(64756008)(66556008)(66476007)(52536014)(86362001)(7696005)(5660300002)(122000001)(76116006)(2906002)(26005)(8936002)(110136005)(9686003)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFFRQU1xZUxQb2xJbkNKRXpWSTYrWjIvZ3U1TFNUWDN4YmxpWVlTNHZrV05Q?=
 =?utf-8?B?dW1PSEJVcDI0THM5cUg4bmdhSkMrK0llWjcxS2pmS0FXL2ZiZENGc29wVlZ4?=
 =?utf-8?B?eFhCQUJjL2Ntc1V0NllVOTNiblBWT29ZMzErRmFIUEhqblRadHJENXM4ZWU3?=
 =?utf-8?B?R0pHUU5vbGVXY3FUWTFKMUVia1Y5cm9RdHc2dVJ6a1hPemNueWpiQ0M1L2xp?=
 =?utf-8?B?aGVDOGRweUE4MkZ0N3NtV0Q3M2hpTzV1dkJxcGFUendoYkZ1ZXh2YU5BbXY0?=
 =?utf-8?B?Mm4zT1F0eUJoY1dLOHU2RlRVSXRXTER3c1VoYzBiU21DQ1RDbXJCS01VZ0Iw?=
 =?utf-8?B?Yk94QUMzb1dVMmliSWFtT3RZNGFWcDRWUWdwVjUwVTI3NXR0RXNJMG1yQVpS?=
 =?utf-8?B?K1JCWUpSeEpzT2JnL3E5czZQczNlU1pCMFlBaUxFYUNSUzU4SVBOYTV5NFkw?=
 =?utf-8?B?QnZHd25qQkpnWU0wL2JubENVZjkrVUo0dWZjNjZDR3lOMFlzcmJoTkFkY2tI?=
 =?utf-8?B?eHZUMHNLbHZ0b2I0VnFkL05heTE2Y013Z0RSdG4rY2JoMS9pQjhxaWNoZVEw?=
 =?utf-8?B?VStFaHMwYjBzZ2dBbWNEN1JWdjNoNnpPRUhuY3VQY1dUd3cyNFYySXo5VHp3?=
 =?utf-8?B?eU41Y2Q0RW10VkJWVC9UZUpKZnFBZG9vS3RzbzJkaWdqRXorRUo5Y3l3a1dn?=
 =?utf-8?B?TC9jV2lobURKUWJTWmZvcEloQnJUVmNXL1FEQWpOMnpGaGM5dmRIOSt0bHpz?=
 =?utf-8?B?aWlBMlJMeVJhSmpLcHRTV01rckRrY1JIZjV1RFlNNXBoRHFwTyttdk14dDNI?=
 =?utf-8?B?Nzc4dXF4anQ5VFFIYlB2N0p6SXJNNkE5ak0yR3ErMTB4aW9PYzVSNGRVbGw5?=
 =?utf-8?B?akI3RVlLR1JuQSsrNjlrcUlqN0J1SG8yRkRPRDhkL3BQcUtha3djeFR3NzRq?=
 =?utf-8?B?UDVCQlhlQlFDbEJOTENCKzFxTE9FaHovT1R4QmRLUm13bHVXRUR4U3k3MUJO?=
 =?utf-8?B?MGxybnFSVFd6TFVmRXdhZlh6QnJxdUlJc0Y3Q0dIRnBZd3Nmc1hNVnd6cnpt?=
 =?utf-8?B?b1FQOVRtNmlCd2JKR1VtTkJOSzNybVRxdml1bGFzUWdEbGg0SnVLdlRkaXVs?=
 =?utf-8?B?bkt3TjdnWjhnY3Q4Z1g1blM4MHhNUFFmOTcrKytQQmpiamxkbk42L1pRM1px?=
 =?utf-8?B?SVZuMTZObjFoNVpYclJna2d4RmNuUTJkblR5Q1NBd29VQURiQnpCMWJPRlZw?=
 =?utf-8?B?UlRvU3VySkN3MFNCMnJNMklja3ZkRExZOWt1VmFGQTZ1WUQwbzdkZ0RsdUpt?=
 =?utf-8?B?S0hueFBBcXVpejVyZlFDbURacWh1YkFYNGlXMTJUWFpOZStiWVJHdmJmbHcy?=
 =?utf-8?B?TDU1clZ2NVhpWjlqaG0yRVhlUjltb2xVRXBNZ2lSWFVuNFlWMDhMQTNkcEdp?=
 =?utf-8?B?WXdrRVIzS2xTNmJaZkdMNEt5VjR4T0kzUC9yc0hiYTMxcTY4WlM2UENtZkNE?=
 =?utf-8?B?M1Q4Mm1lNkZmVDdqcGNSbFVvYjFPeURjdjJncXF3TS9GbkxGZUp4ZG9DSXNB?=
 =?utf-8?B?SGxMZy9IY2FHRTMzV1NIRVNQTndCK2RmTjUzZmJSd3h2WW1mVzN5MXp4WSs4?=
 =?utf-8?B?UnJSY2lGdjlid20zYTR0dStySnMrOWxHRHVUU1dCdlhJUU9aNDVmZ2FmR3k2?=
 =?utf-8?B?ejlZUjIxYmtsa2xPQ3NONis2NG9rN3FVZDVtQXJNZ0R6UmRWa3EvWklvS2Z0?=
 =?utf-8?B?b0RDL1ovQmpsekdzeHR6bU1WMkZheGFyL29kdXhpanFsTE5pQllZWlRyN3p4?=
 =?utf-8?B?MW1UZlhRVnphb0d0N09VYWR4V0g4Z0JGd2MrMm5JbVkydUk2N3JHeFYxY3po?=
 =?utf-8?B?S2ViWnByWEdHMWxScU9PQTcvRmZKOVJ3T05sK09tQXRjRFJUK0hqV2tocWhR?=
 =?utf-8?B?aHBZaW5FaXQ4Rk9QZkZRcmUzYzByUWpmMHpjUFIxemRqZnpXL21SZWFjM0U3?=
 =?utf-8?B?ekxQL21OS2EzSjkyUHFhQXUxRFJNWDBVYXlBK0l3Ukx5eUlFYkFTUldwNHp4?=
 =?utf-8?B?cGh3aTQxeTJSaFNkUUIrYnJ3YmN0TzhQempWY1lhRzlDeTZCQW0renJUQnVx?=
 =?utf-8?B?WSs4UmJ4MmYrT05nYjA1MGVFRmZxRy81UXkzMHQ2cVgwcWRRL2NmcGZhN3VE?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4891.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b06776-0989-4245-c771-08d9db293f63
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 08:54:05.2500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: inzSpdY08vTxFA3OpJpXzYbSLrC8bLhD+Wb4HMvVKQEXQ5V/n3nqRnDKHONg3amJaVcqA+wJpz7W+br5+i586w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2264
X-OriginatorOrg: intel.com
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>, "fan, 
 shuming" <shumingf@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>
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

PiA+ID4gQEAgLTM2Miw2ICszNjEsOSBAQCBzdGF0aWMgaW50IHNvZl9ydDU2ODJfaHdfcGFyYW1z
KHN0cnVjdA0KPiA+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sDQo+ID4gPiAgCWlmIChz
b2ZfcnQ1NjgyX3F1aXJrICYgU09GX1JUNTY4MlNfSEVBRFBIT05FX0NPREVDX1BSRVNFTlQpDQo+
ID4gew0KPiA+ID4gIAkJcGxsX2lkID0gUlQ1NjgyU19QTEwyOw0KPiA+ID4gIAkJY2xrX2lkID0g
UlQ1NjgyU19TQ0xLX1NfUExMMjsNCj4gPiA+ICsNCj4gPiA+ICsJCWlmIChwbGxfaW4gPT0gMjQ1
NzYwMDApDQo+ID4gPiArCQkJY2xrX2lkID0gUlQ1NjgyU19TQ0xLX1NfTUNMSzsNCj4gPg0KPiA+
IHRoaXMgY2FzZSBvbmx5IGFmZmVjdHMgdGhlIFJUNTY4MnMgY2FzZS4NCj4gVGhhbmtzIFBpZXJy
ZSwgeW91IGFyZSByaWdodC4gUGVyIGRpc2N1c3NlZCB3aXRoIFNodW1pbmcsIGJvdGggNTY4MnZz
IGFuZA0KPiA1NjgydmQgaGF2ZSB0byBhZmZlY3QuDQo+ID4NCj4gPiA+ICAJfSBlbHNlIHsNCj4g
PiA+ICAJCXBsbF9pZCA9IFJUNTY4Ml9QTEwxOw0KPiA+ID4gIAkJY2xrX2lkID0gUlQ1NjgyX1ND
TEtfU19QTEwxOw0KPiA+DQo+ID4gZm9yIHRoZSBSVDU2ODIgd2Uga2VlcCB1c2luZyB0aGUgUExM
LiBJcyB0aGlzIGludGVudGlvbmFsPw0KPiA+DQo+ID4gSSBhbHNvIHdvbmRlciBpZiB3ZSBjYW4g
YXZvaWQgdGhlIGhhcmQtY29kaW5nLiBDYW4gd2UgdXNlIGUuZy4NCj4gPg0KPiA+IGlmIChwbGxf
aW4gPT0gcGFyYW1zX3JhdGUocGFyYW1zKSAqIDUxMikNCj4gQWdyZWUsIG5vIGhhcmQtY29kaW5n
Lg0KPiA+ID8NCj4gPg0KPiA+DQo+ID4gPiBAQCAtMzY5LDExICszNzEsMTQgQEAgc3RhdGljIGlu
dCBzb2ZfcnQ1NjgyX2h3X3BhcmFtcyhzdHJ1Y3QNCj4gPiA+IHNuZF9wY21fc3Vic3RyZWFtICpz
dWJzdHJlYW0sDQo+ID4gPg0KPiA+ID4gIAlwbGxfb3V0ID0gcGFyYW1zX3JhdGUocGFyYW1zKSAq
IDUxMjsNCj4gPiA+DQo+ID4gPiAtCS8qIENvbmZpZ3VyZSBwbGwgZm9yIGNvZGVjICovDQo+ID4g
PiAtCXJldCA9IHNuZF9zb2NfZGFpX3NldF9wbGwoY29kZWNfZGFpLCBwbGxfaWQsIHBsbF9zb3Vy
Y2UsIHBsbF9pbiwNCj4gPiA+IC0JCQkJICBwbGxfb3V0KTsNCj4gPiA+IC0JaWYgKHJldCA8IDAp
DQo+ID4gPiAtCQlkZXZfZXJyKHJ0ZC0+ZGV2LCAic25kX3NvY19kYWlfc2V0X3BsbCBlcnIgPSAl
ZFxuIiwgcmV0KTsNCj4gPiA+ICsJLyogd2hlbiBNQ0xLIGlzIDUxMkZTLCBubyBuZWVkIHRvIHNl
dCBQTEwgY29uZmlndXJhdGlvbiBhZGRpdGlvbmFsbHkuDQo+ID4gKi8NCj4gPiA+ICsJaWYgKHBs
bF9pbiAhPSAyNDU3NjAwMCkgew0KPiA+DQo+ID4gY2FuIHdlIHVzZSBpZiAocGxsX2luID09IHBs
bF9vdXQpID8NCj4gQWdyZWUsIHdpbGwgbW9kaWZ5IGFzIGlmICghKHBsbF9pbiA9PSBwbGxfb3V0
KSkgew0KPiA+DQoNCk1heWJlIHNvbWV0aGluZyBsaWtlIHRoaXM/DQoNCglpZiAocGxsX2luID09
IHBsbF9vdXQpDQoJCWNsa19pZCA9IFJUNTY4MlNfU0NMS19TX01DTEs7DQoJZWxzZSB7DQoJCS8q
IENvbmZpZ3VyZSBwbGwgZm9yIGNvZGVjICovDQoJCXJldCA9IHNuZF9zb2NfZGFpX3NldF9wbGwo
Y29kZWNfZGFpLCBwbGxfaWQsIHBsbF9zb3VyY2UsIHBsbF9pbiwNCgkJCQkJICBwbGxfb3V0KTsN
CgkJaWYgKHJldCA8IDApDQoJCQlkZXZfZXJyKHJ0ZC0+ZGV2LCAic25kX3NvY19kYWlfc2V0X3Bs
bCBlcnIgPSAlZFxuIiwgcmV0KTsNCgl9DQoNCj4gPiA+ICsJCS8qIENvbmZpZ3VyZSBwbGwgZm9y
IGNvZGVjICovDQo+ID4gPiArCQlyZXQgPSBzbmRfc29jX2RhaV9zZXRfcGxsKGNvZGVjX2RhaSwg
cGxsX2lkLCBwbGxfc291cmNlLCBwbGxfaW4sDQo+ID4gPiArCQkJCQkgIHBsbF9vdXQpOw0KPiA+
ID4gKwkJaWYgKHJldCA8IDApDQo+ID4gPiArCQkJZGV2X2VycihydGQtPmRldiwgInNuZF9zb2Nf
ZGFpX3NldF9wbGwgZXJyID0gJWRcbiIsDQo+ID4gcmV0KTsNCj4gPiA+ICsJfQ0KPiA+ID4NCj4g
PiA+ICAJLyogQ29uZmlndXJlIHN5c2NsayBmb3IgY29kZWMgKi8NCj4gPiA+ICAJcmV0ID0gc25k
X3NvY19kYWlfc2V0X3N5c2Nsayhjb2RlY19kYWksIGNsa19pZCwNCj4gPiA+DQo=
