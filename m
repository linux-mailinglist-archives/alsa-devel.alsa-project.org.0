Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC6243E37D
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 16:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2430242;
	Thu, 28 Oct 2021 16:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2430242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635430926;
	bh=K4N4O2Vr6kMSbVMluiYr7XqGxdJj7RRu0BWBIVb2y18=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TyJBW5sX7Hcj08Uz4CAiF2RVmfY8frW9by8oEFZtPGvKfEv/uAIT8o0dRXiH6W+0Q
	 nqFU2F6MJ5ZhI7X79Zk30xGVMUlGP3sJEPlBOvT8/nlb3QOh7JmVRZFXM6Ebq/jLSp
	 uwh1tUDILvPctdiNCLUazuLfouDG9ZpSuSotNLWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D32FF802E7;
	Thu, 28 Oct 2021 16:20:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69C1EF802C8; Thu, 28 Oct 2021 16:20:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09BC5F800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 16:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09BC5F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="f+nUu8f6"
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="210490206"
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="210490206"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 07:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="597814583"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 28 Oct 2021 07:20:33 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 28 Oct 2021 07:20:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 28 Oct 2021 07:20:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 28 Oct 2021 07:20:32 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 28 Oct 2021 07:20:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrrzgCn0hfcVq3u5p/u/b8rtK+hzzpbP9gvFSvrBhhP2J0J4q5IAJ/GQHFU1gvEJWrdg8p8xEzLdCxBkam6sueDAEd25QeMJr8TM3BPcp9R2/y9Ni4RPL010nZoEuQS3Q+kirhaTB9hchJdEWPSVeBkMXK/x1BRBd6RN2ivJphCZsAlxTephDIk3iawGTvNvSO8cn+fG14bHrb06kQWCON64i+SrXOK4cKTeHpgSxhJij7n9eq1bgcNljXa93T2jVEBKAilBxS/L/YABW+QfDtoAtq9ZdJEpHxeYfFG1YaSm5RxoIm7tvGR81WJRjuzKF7RdNhnJCOdiN0XAjyJu3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4N4O2Vr6kMSbVMluiYr7XqGxdJj7RRu0BWBIVb2y18=;
 b=PBgUcIhQ+Z6uoNQYtB5XS1Q1OD3vhz+9nC+SBxf9GP7vGUFsyxEGqtjdScxAQe4y4cPKc8E4AqO1oZ58lh4wN/j3+RZVo+SrWcT8YzT9w9aEQzXi+h33LcFp58Zu7SBuoSp/uF9huwnxOE/wOXKb+/nZKg+v3h9YpKAC0tCwkShpqksr6/5041508XGoRThmn2BQ99p8gCouFNg9yNwzKzB7SNZ/GWvANZmm3Y9byp2bIK1+kWPByE+44338+qaaUd1vcyfppgcMCX1SWnV3Um11eAMePv/Cukoyu10zXsGVEi3nc2iE+YnGtMnJd7CNwkhHNHypkN4e6pIsUOLAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4N4O2Vr6kMSbVMluiYr7XqGxdJj7RRu0BWBIVb2y18=;
 b=f+nUu8f6sOYFr2dvO3g2EYzaYFpBMHaw4zCjCRX3qAnlIhosPo4luffuHMKoOp4bFi+Z5m6IIoqF0yt5iwnz5YI7jqS51nORga/d8I8LeBVR49ZvtjuFvcy2DBMLlPHabPX6/Pq4zYkGO4qidzkyNSmWP9pVye6BEWiS5AL6RnY=
Received: from SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18)
 by SN6PR11MB2685.namprd11.prod.outlook.com (2603:10b6:805:58::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 14:20:31 +0000
Received: from SA2PR11MB4891.namprd11.prod.outlook.com
 ([fe80::3d8a:d8b6:947c:f2c3]) by SA2PR11MB4891.namprd11.prod.outlook.com
 ([fe80::3d8a:d8b6:947c:f2c3%5]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 14:20:31 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoc: Intel: glk_rt5682_max98357a: support ALC5682I-VS
 codec
Thread-Topic: [PATCH] ASoc: Intel: glk_rt5682_max98357a: support ALC5682I-VS
 codec
Thread-Index: AQHXy8GV33wTYpHcSkm1Rlt4HlBd66vocB8AgAAF5LA=
Date: Thu, 28 Oct 2021 14:20:31 +0000
Message-ID: <SA2PR11MB4891B36669720A98FA9B348797869@SA2PR11MB4891.namprd11.prod.outlook.com>
References: <20211028060203.446093-1-brent.lu@intel.com>
 <2ca92247-70c6-a092-8fe2-cfca9d6f18e6@linux.intel.com>
In-Reply-To: <2ca92247-70c6-a092-8fe2-cfca9d6f18e6@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff261a58-2c28-4c67-f1cb-08d99a1e1973
x-ms-traffictypediagnostic: SN6PR11MB2685:
x-microsoft-antispam-prvs: <SN6PR11MB2685DCE4189422AC114AFBDE97869@SN6PR11MB2685.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PspaECJiv3lv8b/IDbmkGpXaCZA5qpMNnZiitq1epN7EzqNkuKQ81io3zvB2vu6rIyr6CFQwI2axynuJQRfJR0rTtyDl8UgkoqFXYLWRU42jgbuh+2uUgg/MfWlhpOiOyTov7xkvfua4OeUptFTnDsXr8rTQAkMXVAcuHR+rnqlgYN0mFTrk1uBfMv2wq2hGK4u1hZOP0r80Xobpif3soAAXLRlvKmb7EsS5bYgiDbafx1HsTYABl0lLxVmS56vN7JCBv4DPShMEGz5Lo9xVDU1ZJINwJxHk3r+UyvsdtGjaCEQYj9juS//lfeIQAL07oZS4xXfkdQVNZdR/RwbNQq0KbL9vBwzcxUP2fnweg+k72Lhj7C21jeH2FthZH3fTs8Grfy75LUywJF/NSCBRNYtPB0e1n4aJOt/GuFkhe0bQuKBSmkCQZMzChgZRv2no7TLmUKJ06fzuabIH2OtsTiRmM2GrJtzJ4dkNfo0Wxv3yNTGz1iOeXn3/QIsYuRJ/AaU5rl5PjSQ27bBdTZKHt/3T6o68olgu8rRR3cV87jzcby/r+yYGRz3SaJTiGCHAtGTBq/toPvLfj+qepbtcY8JievM8S5PBMugXysOwpg/CPu5JPxVwKjxNZ/wKo9Ta2byK5lhFIBrU/BSVQd1C0BRAe3qY7nRbSLL7/+Ykt7kK6iyVyAerk5BfW/ZymwT+oYTlS+b7ZW7OIiGTFOomMGj4RYiC+cQlyd/rkAIwvA4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4891.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(9686003)(110136005)(82960400001)(55016002)(33656002)(26005)(2906002)(316002)(4326008)(5660300002)(52536014)(186003)(7416002)(4744005)(54906003)(38100700002)(76116006)(508600001)(66556008)(66446008)(64756008)(66476007)(7696005)(8936002)(8676002)(71200400001)(122000001)(38070700005)(66946007)(6506007)(86362001)(83380400001)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkhweHNpSUY1Q0tRbXRyTFBKSTNhMHVYVDBlMUR6MHlZbWdaV0g0NmVIdDR4?=
 =?utf-8?B?TmtYRTY2eWdtTks1VlJGNFhXZGdvamp5WnNZRzhKcWZTQ295aCtqbFRZM3Vl?=
 =?utf-8?B?SzlVNTl2cFR4YjdDOU0vT205Q0RRQjZROHJjOXZqMGRtYzZKdzhwbmdJNkhD?=
 =?utf-8?B?RjUwNXVZTGVKMkNZU1ZKWWYySk9WZVRDSlF4WGFyZDJJcW5QZnRHTUNyak1Z?=
 =?utf-8?B?VDlwZm9pemMwdlBSb09nMUZnVjB1SHdlbjZnRCs2cm1RTlBDODhxUDVyaVJ1?=
 =?utf-8?B?QkQzYjZTZVNGL2xLZGpMZzliN0FQbmY0UnZxSEVrZkdHUTF0TFpGUlpJU0ZH?=
 =?utf-8?B?SGIrZjRvYUIwZzZ1em1CZE5Ud1RVRHNHbUhsd1lDdHJiYmtqTy9TT3FrTVQ4?=
 =?utf-8?B?VUt6Q0NkNUhXVTJsN1UwK2VHVVlvTnYyNjZOSHRIN0wzSmQ1YjBxemEwcnJo?=
 =?utf-8?B?R3lOZXFkcndEd0N1NUp4UzQvN3Z4NnhzWGhkUXAyV0NYemdQYkhYODc3azE2?=
 =?utf-8?B?a1NlWmQ1WEtNcVpPdDZuN3Z3L1AvWnpyaUhkL3UvdjBML3crZWszUEE1ajFh?=
 =?utf-8?B?NXo3anRHeGY1TzNPV3FjQWFWSWRqbitta2JPNnNzNGZPNDArOW5nbnBzUEt4?=
 =?utf-8?B?WWEzWkpRcnY4T1A3Z1E5T0JEVEN4anJEVUI5SlZPZ3pOdkF4OHpYRjJmYjhp?=
 =?utf-8?B?OHk2OWt3UEgrajZtaG9jRHA2TjVnV3V0Y3VFbStDNXBmYlFUbjdhNHhFK0NJ?=
 =?utf-8?B?bHhFNklBUGpGZFNtS244ZTM1NzdxN0dkeE1naHUzRHNwZkZxeGhyNzRlM003?=
 =?utf-8?B?K1E0azhuYkdRTTZvOTBPWHhxcExEZ3NIZjZxb1JMVDYzMnpFNjE1NFJ4NnU2?=
 =?utf-8?B?OWgrMGpKZ3FCSEZNcUplM3RKY0RZOUtySGpWMUlhUTlUMldvdTJOSURsQ29W?=
 =?utf-8?B?WkkzVVNDeHFqZUNHcWhJSDBJZ0NuaVNrNVJkWFhVNWpIVVNYTUxCQWpCMFhB?=
 =?utf-8?B?cURwUFIzaEpKQ3hhYzBmekVjTEtHc1ZLNUtEYWVKVFBSbnhUNTFjVzhCU3BI?=
 =?utf-8?B?amJOTC9icjQrelVHNDhBdWNsNnhReFhERVdscXlWYVFleTg3ZGVLc2lFWnZO?=
 =?utf-8?B?N1NUOWM0L0VzK3VlQzRMK3l6NmNZcGRiYStXU05YQ3Q1ekNTTnpjdnI5cmlF?=
 =?utf-8?B?MXdRREhwcmxHTWdiRkc5ZXhVM0RQa0RjMndhdHNNSjJsWVRhODViQVM2QW9O?=
 =?utf-8?B?VE5halNVajZqZ2FVMmdzcE9SSmgxK2dlTTF3UW41MFpOcU5UVjJPaEtTc3Nn?=
 =?utf-8?B?ckR2Q1NpMXRzbTRHZ0tPRTVsQ3plNEJVUXZvR3ROWHZjNkM0Ny9nb0Q3TDR1?=
 =?utf-8?B?OXFhZjBKajNHT1l4VjV5UjAxNVdCOE5CUk54dWpLYzVPMnRZR2wvNzAzYjcy?=
 =?utf-8?B?RExxMkpld0pJL1U5QTlMQitNUnRaQkQrM0x6Unh5UmRiOEZ2Um1CeFZocjhr?=
 =?utf-8?B?d0NPZDYxa2Qya3hFZHI2MlNvbG1XdWZubFlPZUdmSU9ybFk3RHZ6Qlh3Y3kz?=
 =?utf-8?B?aTVvQ3RGTXJtM0tobEJmSDNDNFBxUWcrT3gvTUgwdVpEd1ZiYlNMcmFVdVpp?=
 =?utf-8?B?UjFaNkhsR3hmTFQ3WWEwQWJWWXJRa2gvN21VcEJJcVdMYy92REREbm52VTgx?=
 =?utf-8?B?TW1TSE5lZG5FY1VoWlY2Sm5tWTZIbE9yNTN2c3N4SDFiQ2FHVktQcSt0RjlT?=
 =?utf-8?B?VCtNSDROYmoxeGc2ZlNjRHNIOU1PVWZZYlpqS2x5OEdIeVVsSVdvVW5YalVt?=
 =?utf-8?B?bHJhWWlRZFNIR3dHMEh6M1h6TGhPTWRLM2tRSW8xUms1aUZjL08yWEdHUkFJ?=
 =?utf-8?B?eTBkWTZaTE5keGRYYk1PZ2gwcXRwUWdSbkM1ZlZNRjBNdXBDNEFyOHNraUhY?=
 =?utf-8?B?elVUZDFpMDRqZlFGYnJrVnI0QmNDaWF6MmQ0dXJQdnVCNC9kenJ1YTljRFRK?=
 =?utf-8?B?UkJCMTFDYSsxa3l4a2MydjNVcG9SRlBvVGNSeTEzc1A4KzYyaDJZMUVWbU5R?=
 =?utf-8?B?S2tQV28wMExsMVEyYUdPSEtqZmRkWlIrYjdYelcwdXBHTzhFdEhxOStZcjdU?=
 =?utf-8?B?bVRIN1VLcm0xdnRjOXF2TEFYakdFQjhXeVlvVnJ2dVUxajJSWVVsL1ZRSkpW?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4891.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff261a58-2c28-4c67-f1cb-08d99a1e1973
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 14:20:31.5086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53sLV7TI5HJO4gmqWDALivZ4GKoxWxSxVc/H3ZmsdRPpga1THb3sKrdjGdHptFUPaLZp8T0edep3OznGZ1fNOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2685
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski, 
 Cezary" <cezary.rojewski@intel.com>, Julian Braha <julianbraha@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Paul Olaru <paul.olaru@oss.nxp.com>, "Wang,
 Rander" <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

PiANCj4gbml0LXBpY2s6IHRoaXMgYnJhbmNoIGlzIG5vdCByZXF1aXJlZCwgdGhlIGZpZWxkIGlz
IGFscmVhZHkgcmVzZXQgd2l0aCBremFsbG9jKCkuDQo+IA0KV2lsbCByZW1vdmUgaXQuDQoNCj4g
DQo+IEhhdmUgeW91IGFjdHVhbGx5IHRlc3RlZCB3aXRoIHRoaXMgZmlybXdhcmU/IGlmIG5vdCwg
aXQncyBwcm9iYWJseSBiZXR0ZXIgbm90IHRvDQo+IGxpc3QgaXQgYXMgYW4gb3B0aW9uLg0KPiAN
Ckl0J3MgdmFsaWRhdGVkIGJ5IE9ETSBvbiBHTEsgQ2hyb21lYm9vay4gU28gSSB0aGluayBvbmx5
IFNPRiBGVyBpcyB2YWxpZGF0ZWQuDQpXaWxsIHJlbW92ZSB0aGlzIGxpbmUgaW4gVjIgcGF0Y2gu
DQoNCg0KDQo=
