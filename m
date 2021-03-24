Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A378B347F05
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 18:13:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AFDE1672;
	Wed, 24 Mar 2021 18:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AFDE1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616606038;
	bh=PVzfnnbtIbd1BbfeaBHm8hSCMIkz2X9/rSvRJySTva8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L1wuY04hjX7B+KNVNGlNaJxa0qSar7DcaDdOzKSWWRCGKx5WBwjh0zQaT3hnvQgiV
	 JliWH0WOuegcbX/eEP4Vr6wBkU7N2LfqoLwzmECFZIvCFwi5Y0pHigz9CArWdJrRih
	 ZjUVRzAi8YHqNO4qd3f+du+O773TrRvGBW2g7Nus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 364EBF800FF;
	Wed, 24 Mar 2021 18:12:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D02ACF8016B; Wed, 24 Mar 2021 18:12:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A3C3F8012B
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 18:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A3C3F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="RInSzSku"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="WH9tB+z6"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1616605943; x=1648141943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PVzfnnbtIbd1BbfeaBHm8hSCMIkz2X9/rSvRJySTva8=;
 b=RInSzSkuyTK/yp2EPU6wrfhkOzCxNImau5GsPuo0bESrLQZ21DWvjcUs
 cZTi1Trvb+VYjNmg9tx9MLmkoSkrbn1vktALZy3/e6Eob8I9E1J1UldjT
 6ocbzV9XAHWTFOMmlzEf9geiiU+XX2djBASD8Qo/fuf0PqWjUYXxkPmkS
 TXyyhV/wM37Brl+RkkSviztQEXmbuLNHBkzHswk1FYRrtqt56fnaW3BXc
 y/96/ITDY/jUE/5Wuh5brSOkZyQS1BitnQThV2gKuyG2ocmv1kPztOmEs
 Vc5yqp+gxFj9SzgMAu0ec1/Ry+dixpACAySwHvXAzfW+KDTaX5CAI/OG6 A==;
IronPort-SDR: ftPpX5aqWPF/6h+dOQFHIazwkrkFL9SNFjPc188IQrpgf6kMaOF09VnRnUBeCbSI8AYAbqJTrA
 SIbKb2tP4qiSIItn79WPx4KmcAoTh2WMTmzsA5ncxOYczkq/cM8/DPbkTayUAbx6ftonKMmd5a
 BGg8dSvluJQkhZw0B9IfkMX0mYII5bTBGPzM4Ht0tmhd5RqaDrLlwY7fqhZ5IPHtegTtv4piTo
 kxnCuZ8i60e8VKZOjHn6w6KoSKve8RcaIz437QpF8KPcFIJ7WJWjezVlqAwW8I57zAxkRAJ4Bi
 5tg=
X-IronPort-AV: E=Sophos;i="5.81,275,1610434800"; d="scan'208";a="120300616"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Mar 2021 10:12:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 24 Mar 2021 10:12:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 24 Mar 2021 10:12:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMezWeVybzp+EtaVusCOdIWFAq3k32pfpY3b5Vh0VwrJ2drkik31xqWjsZLL4J2bJ4TugGn1Ri+JtQZZq9nlQQtCt75wHRo9nqoX5B5pHDKWJVG2pneuKNIP/9LtOsrvfVLFWKLauyu35tmc8j+j1f8w0nQnC3qo2eLuKha6yOlbCI3q14Y2JWN66OfzqBcPhWAxiRj1P9TBgUz44LLE3XkfeKfiXliLJncZ155A/ghAJzPbXHgU5ww8GHig2PaIBFoqUwAy59rDNxIhAdjBMwlePwsAsVHpuE0CaUrGC9qHcoe8lK09/Bk5UTvlCBv06O4Upeoi3/cHQLyhv6z73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVzfnnbtIbd1BbfeaBHm8hSCMIkz2X9/rSvRJySTva8=;
 b=StTSJhLLw5IAY3xVzKl9hWX5pWrb8zBVEOYpu6BiJyjsGHamXJJAcGVfYPaXwoJw28mvIJY3SfHKVNYEgdOj1nxUBkapSlNLhqd5zWx30fovXSxvUWQuIAn3Lj3Q5o5UySr1By4QAgmRr45r5UEhObrjQBJdGvPPmBl0z+EOJbeXil8sRnsKwW8W5Me3Xyh5+tGDO6qcBvudz0JcRlt4hc0llK0VfXgxpWoGHhA3/eld23Q9VjCLE5TTPRVgKpb03Qg8AyewD37V8aBFcAYFhTuZd4KqXyBD7RkUGkrh768+iD3CU7KzIsFmppE9ISdPYIQU4wqEZ1TWgscgNawvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVzfnnbtIbd1BbfeaBHm8hSCMIkz2X9/rSvRJySTva8=;
 b=WH9tB+z6b0A7ZXWD5ZTDV6t5lAhtBPM2eTbBpM7swz1UsN+7uJFw+jhADZiVWHp92m96c5UgfgM/yC7jJdHDxu1Aj5JqL1uu/KGNH2KaLDzSuBnzsgfsOlA4bRuou8HbGELcK8eGrML6B6fw7l6qPVQs5vw2qw/A6jwBEVeBTKM=
Received: from BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 by BYAPR11MB3109.namprd11.prod.outlook.com (2603:10b6:a03:8c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 17:12:11 +0000
Received: from BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0]) by BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0%4]) with mapi id 15.20.3977.025; Wed, 24 Mar 2021
 17:12:11 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Thread-Topic: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Thread-Index: AQHXH9nLKm9Vc1LsR0iPwMHUtMwvV6qR9PqAgADxxgCAAF40AIAAHP4A
Date: Wed, 24 Mar 2021 17:12:11 +0000
Message-ID: <7d2d752b-950a-285a-b59e-81cf06d4e232@microchip.com>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <7364fb08-fe43-167d-a083-db4a6234222c@linux.intel.com>
 <2e9d903f-dd76-5b22-77ea-5fc42be306fd@microchip.com>
 <95d0f1c1-5a89-837f-b1dc-42482a3b1250@linux.intel.com>
In-Reply-To: <95d0f1c1-5a89-837f-b1dc-42482a3b1250@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [2a02:2f0a:c30e:ba00:d73d:bc0:2e7e:9fa7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52253a22-d65a-40d5-86be-08d8eee7f692
x-ms-traffictypediagnostic: BYAPR11MB3109:
x-microsoft-antispam-prvs: <BYAPR11MB310913B52ABF14C4E2F997ADE7639@BYAPR11MB3109.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vNW7uLgPxt+AIk6uXYcQTgq06dEjOK247eZWFsryCCgswpnKHvO38eHaKTpoiZuNGUtx3iUWW1vXcK8sYdzaTKPxZTIjKe6LGvI+BObrCfsezhsEjoMZTb2d8gE1Kjsq3b5PHyHngnFj1d5wlRyq5nvpLHuBHkkaATbR2Yc9u6Ii/yo6dsshn6hu233IHLXHYRPPOepqM9blX1muLmsEDFOz3YFw9Jo1JGZc3qle+FxIsF84ovsc7ghVF8q3grPDxPl8ocrUAHXxUwSxtJkq5RFa8JYO+NvphnU7UropxkyemrSxZKxy3jBOivDvg3dKJ6J0Psyk2DBMkq7EuoX95FJG8Eif7ZTsMVazIC1qQ00XavMg27vwlAn9d6RaUbEEcJJeWomn+s38HPr0ag7vFPddMWN2AmSwOKGqRB7pVIjuPLQXPmHCD1NB8UoS0g72RtirqVIGzGMnlCArNCA6elUVMhKUz3yv8/C5JLqm+bxr2FMqa3mDSdk0oSpc4KADxQTQAqNHMURwHlEluGaZ9ayEaCULytJHzN5gjIAd8yNZVklLiL+sDdh2nYZGQAYi4KBJ1WF5IsArW4NqmN86XwlKHhallixaYCL4pyo2NLkQbNF5dHSYPkibQ9GnLRChWY/ciNM7VwBNvS3btun2X6yxAOse0iZWdRKTclV/PUzFWmRPK7LYjxQm3Rma+wkfl+nhQ+GtZGQOrwQGy7cTvCxDfzCjI44xpjq9XquZgBAZwGCoJpUEC+WYA61KC6GQlW6EKdI0MGUMTAA4DZ9wx0lrT2HLXZrqo4oLSBJLS2U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(376002)(396003)(346002)(136003)(110136005)(54906003)(64756008)(478600001)(8676002)(66556008)(66446008)(66946007)(2906002)(91956017)(2616005)(38100700001)(83380400001)(66476007)(36756003)(316002)(6506007)(5660300002)(186003)(4326008)(31686004)(53546011)(71200400001)(76116006)(966005)(8936002)(6512007)(6486002)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?a01kcHUyWkliaUhhQXNWZTFXTHBtNGF0aVYzY0tSSHMybTBZYzQ4aTE2eG55?=
 =?utf-8?B?WTVsZWJXNXVFNHlOeFhuWmFnSVY0MGxGYjZLbktrRHo5RUpJNlJOVWcrQ1U1?=
 =?utf-8?B?S2lBbkk3ZlI0OGZCRU1WeHZ2N1BsWksvSHA4eXRNa0JHa0czaC9JTitmZ29J?=
 =?utf-8?B?UnJiYldmclVWRjlCajhyOUh3VGtQMlpCM09ldmpuVjYxajlGN2lpSDhWdkpR?=
 =?utf-8?B?TkUzbmZCdXRrRDYvbDdLQmVRamgvdDBtMGNEdlI4RFdLR1Zmbm5IQ0VyeXo3?=
 =?utf-8?B?cThoMzhGWU5Fa21xVXVyNkRQMERnaHliRDhpRmV5eVBaMmZ1aldWMzNVQjdC?=
 =?utf-8?B?MHlvSVRVUzQ0K0xyV0kxZmlBNFR5ZWhjQWt0RFY3a1Z4T1ZWSkprMmhJWWVR?=
 =?utf-8?B?NW9tOHh1dWNmbmcyeEllb2xTZzZHTlVqeWVVZ1NIVDl1Yi80NWhwUVBhZnJP?=
 =?utf-8?B?anlmWis2dWFqemFVWWJsNFVlbk11dnZDRTcxSU9iM3dQcFdVMm94TXczd2ZB?=
 =?utf-8?B?WHNvRXE4L0I5QnZLNnBJUTNkUzg0akg5QXRqMTBib09jcGREOFc3aHBxVXd2?=
 =?utf-8?B?ZktIc1k1S0xMZXpxVTV3OHBpYVFYSUw0T21yYXdvWG93cUQ3OGZNVzhkYWdG?=
 =?utf-8?B?S2dwV3RCVnU0RXFnckFrblBERllBTGJwaVh1RHpDUFozM1ViQkd4TGZ4YTN0?=
 =?utf-8?B?THVoNHJHQXRxSFE4TTRkYmdDcTErdEh0Q2E4UW9EakhWcisyU3cyVThDYkk3?=
 =?utf-8?B?ZDJxSEdMMXAwRjNJZDM5TDZ6Q1JlMGt5VmdYY0JpWGZIZ2JMNExUVXBabHpQ?=
 =?utf-8?B?c3hIR3Rad1FiSVg0WUJyMGZhbXgvOVV5T0Judm9TbkRsTzU2SkJTNm1VWlN5?=
 =?utf-8?B?ZDh0SCtBWVNrNEFQUnhtYUNIS2xOaDZrL0ZyRysrOUpSWjhveE9yY0JLYWFR?=
 =?utf-8?B?MjZ0VUhjZWs5OGFhT05lc1R0cUhuOG5hcnJZbGdHVERsOGQydk5XcXZOUjh6?=
 =?utf-8?B?dzMvcko2dHVmQW1uanExNE8yeU1JUTE4WkRkZ1dyY3NKczkzUXErblVtUVNT?=
 =?utf-8?B?OGNIMHBKYzFqdDNXN0dadE91ZWVVL2t2SFRSWm40MGU4WGdEeCt4cTF0RGhJ?=
 =?utf-8?B?cnNwcHFQVFRFR2dzckY1aXdmOGczbkNlSkNMNG9qb3B2MjNhWDZRaW94UkEz?=
 =?utf-8?B?T01LWXhRU09kSjQxeW1hZWJwM01JTmVzcXJuMVZEMzVtZ3BTMkNyakZVbnhz?=
 =?utf-8?B?V2RmZ01OKy9RL1lwc0tmd3JTV2k5UkovWDNYVHVwcFhNOU1sZ294OG9kQUR5?=
 =?utf-8?B?WElYWWxiMWYwUG9ySnY0ZjA3V2lMQU93N3NLU0l1Q1NPL2VmcURWTE5qMWZ5?=
 =?utf-8?B?L1JBakpHbE5uOHliWW9xK0U2VFdnTjM0bFFWSFVOd0lFV1k5ay9RMy8xcTk2?=
 =?utf-8?B?NHk5R2lsVE5SRkxydDBRd3NQUzhtclczS29KdlZJL01HQmVKSC8yWXRoQ2U1?=
 =?utf-8?B?eXRrR1hYaUcxamZKWlQ5R0EyTWlYTmViMXNMVU5FV0pjVjlwNUw0clFuSGE5?=
 =?utf-8?B?QUlzTERHZ1M5Tit2d0YyMUhXOVNDNlpkSm9aYUMvbzUxUW5DbWdpU2Frb0oy?=
 =?utf-8?B?NitxQzZqSEhiWUptUFB4QjV4bzFLUlcrYnBXZy9ZeVFYdTA5ZTUzMXdYVmVJ?=
 =?utf-8?B?NFRIWkNKYmthZ2FuY3BHT25qWlBod09LRHBBUWV6MGwvZlVYRGptdTlRWkp3?=
 =?utf-8?B?RHhrSFNkMmJxTGtLbGNKZ2hTb1VXc2ZJT1E4STZ0Snk4OGMrNHNNcEgyaDFW?=
 =?utf-8?Q?H4xEYn6n8ZK0B6MEqrUXq+Zg/Uw3VdHzy2Pls=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B39DCC8D024CF54EAF301C5AE26A06E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52253a22-d65a-40d5-86be-08d8eee7f692
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 17:12:11.3549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JvRgs3expG92rt4PRigu6O6jW5fPbD0cNIfbiXT1vbZFAG1DmHpUchf7E6cUfSkfQwOXwyvfq46awepuM93znKB3VqyNMNw+SjDNmdtRvQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3109
Cc: gustavoars@kernel.org, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, mirq-linux@rere.qmqm.pl
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

T24gMjQuMDMuMjAyMSAxNzoyOCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+PiBJIGFt
IHVzaW5nIGh3X3BhcmFtc19maXh1cCwgYnV0IGl0J3Mgbm90IGVub3VnaC4gVGhlIGZpcnN0IHRo
aW5nIEkgZG8gaXMNCj4+IHRvIG5vdCBhZGQgdGhlIEJFIEhXIGNvbnN0cmFpbnQgcnVsZXMgaW4g
cnVudGltZS0+aHdfY29uc3RyYWludHMsDQo+PiBiZWNhdXNlIHRoaXMgd2lsbCBwb3RlbnRpYWxs
eSBhZmZlY3QgdGhlIEZFIEhXIHBhcmFtcy4gSWYgdGhlIEZFIGRvZXMNCj4+IHNhbXBsaW5nIHJh
dGUgY29udmVyc2lvbiwgZm9yIGV4YW1wbGUsIGFwcGx5aW5nIHRoZSBzYW1wbGluZyByYXRlDQo+
PiBjb25zdHJhaW4gcnVsZXMgZnJvbSBhIEJFIGNvZGVjIG9uIEZFIGlzIHVzZWxlc3MuIFRoZSBz
ZWNvbmQgdGhpbmcgSSBkbw0KPj4gaXMgdG8gYXBwbHkgdGhlc2UgQkUgSFcgY29uc3RyYWludCBy
dWxlcyB0byB0aGUgQkUgSFcgcGFyYW1zLiBJdCdzIHRydWUNCj4+IHRoYXQgdGhlIEJFIEhXIHBh
cmFtcyBjYW4gYmUgZmluZSB0dW5lZCB2aWEgaHdfcGFyYW1zX2ZpeHVwICh0b3BvbG9neSwNCj4+
IGRldmljZS10cmVlIG9yIGV2ZW4gc3RhdGljIHBhcmFtZXRlcnMpIGFuZCBzZXQgaW4gc3VjaCBh
IHdheSB0aGF0IGF2b2lkDQo+PiB0aGUgQkUgSFcgY29uc3RyYWludHMsIHNvIHdlIGNvdWxkIGln
bm9yZSB0aGUgY29uc3RyYWludCBydWxlcyBhZGRlZCBieQ0KPj4gdGhlaXIgZHJpdmVycy4gSXQn
cyBub3QgZXZlcnkgZWxlZ2FudCBhbmQgcnVubmluZyB0aGUgQkUgSFcgY29uc3RyYWludA0KPj4g
cnVsZXMgZm9yIHRoZSBmaXh1cCBCRSBIVyBwYXJhbXMgY2FuIGJlIGEgc2FuaXR5IGNoZWNrLiBB
bHNvLCBJIGFtDQo+PiB0aGlua2luZyB0aGF0IGlmIHRoZSBGRSBkb2VzIG5vIGNvbnZlcnNpb24g
KGJlX2h3X3BhcmFtc19maXh1cCBtaXNzaW5nKQ0KPj4gYW5kIG1vcmUgdGhhbiBvbmUgQkVzIGFy
ZSBhdmFpbGFibGUsIGFwcGx5aW5nIHRoZSBIVyBjb25zdHJhaW50IHJ1bGVzIG9uDQo+PiB0aGUg
c2FtZSBzZXQgb2YgQkUgSFcgcGFyYW1zIGNvdWxkIHJ1bGUgb3V0IHRoZSBpbmNvbXBhdGlibGUg
QkUgREFJDQo+PiBsaW5rcyBhbmQgc3RhcnQgdGhlIGNvbXBhdGlibGUgb25lcyBvbmx5LiBJIGFt
IG5vdCBzdXJlIHRoaXMgaXMgYSByZWFsDQo+PiB1c2VjYXNlLg0KPiANCj4gRXZlbiBhZnRlciBh
IHNlY29uZCBjdXAgb2YgY29mZmVlIEkgd2FzIG5vdCBhYmxlIHRvIGZvbGxvdyB3aHkgdGhlDQo+
IGh3X3BhcmFtc19maXh1cCB3YXMgbm90IGVub3VnaD8gVGhhdCBwYXJhZ3JhcGggaXMgcmF0aGVy
IGRlbnNlLg0KDQpSaWdodCwgc29ycnkgYWJvdXQgdGhhdC4gOikNCg0KPiANCj4gQW5kIHRvIGJl
IGZyYW5rIEkgZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZCB0aGUgcHJvYmxlbSBzdGF0ZW1lbnQgYWJv
dmU6DQo+ICJzZXBhcmF0ZSB0aGUgRkUgSFcgY29uc3RyYWludHMgZnJvbSB0aGUgQkUgSFcgY29u
c3RyYWludHMiLiBXZSBoYXZlDQo+IGV4aXN0aW5nIHNvbHV0aW9ucyB3aXRoIGEgRFNQLWJhc2Vk
IFNSQyBhZGp1c3RpbmcgRkUgcmF0ZXMgdG8gd2hhdCBpcw0KPiByZXF1aXJlZCBieSB0aGUgQkUg
ZGFpbGluay4NCj4gDQo+IE1heWJlIGl0IHdvdWxkIGhlbHAgdG8gc2hvdyBleGFtcGxlcyBvZiB3
aGF0IHlvdSBjYW4gZG8gdG9kYXkgYW5kIHdoYXQNCj4geW91IGNhbm5vdCwgc28gdGhhdCB3ZSBh
cmUgb24gdGhlIHNhbWUgd2F2ZWxlbmd0aCBvbiB3aGF0IHRoZQ0KPiBsaW1pdGF0aW9ucyBhcmUg
YW5kIGhvdyB0byByZW1vdmUgdGhlbT8NCg0KRm9yIGV4YW1wbGUsIGFkMTkzNCBkcml2ZXIgc2V0
cyBhIGNvbnN0cmFpbnQgdG8gYWx3YXlzIGhhdmUgMzIgc2FtcGxlIA0KYml0cyBbMV0gYW5kIHRo
aXMgcnVsZSB3aWxsIGJlIGFkZGVkIGluIHN0cnVjdCBzbmRfcGNtX3J1bnRpbWUgLT4gDQpod19j
b25zdHJhaW50cyBbMl0uIEFzIHlvdSBjYW4gc2VlLCB0aGlzIGlzIGFkZGVkIGVhcmx5IGFuZCBh
bHdheXMuIFNvIA0KdGhpcyBydWxlIHdpbGwgYWZmZWN0IHRoZSBIVyBwYXJhbWV0ZXJzIHVzZWQg
ZnJvbSB0aGUgdXNlci1zcGFjZSBbM10gDQphbmQsIGluIG91ciBleGFtcGxlLCBvbmx5IGF1ZGlv
IHN0cmVhbXMgdGhhdCBoYXZlIGZvcm1hdHMgb2YgNEIgDQpjb250YWluZXJzIHdpbGwgYmUgdXNl
ZCAoUzI0X0xFLCBTMzJfTEUsIGV0YykuIEZvciBwbGF5YmFjaywgaWYgdGhlIA0KYXVkaW8gc3Ry
ZWFtIHdvbid0IGhhdmUgdGhpcyBmb3JtYXQsIHRoZSBzdHJlYW0gd2lsbCBuZWVkIHRvIGJlIA0K
Y29udmVydGVkIGluIHNvZnR3YXJlLCB1c2luZyBwbHVnIEFMU0EgcGx1Z2luIGZvciBleGFtcGxl
LiBUaGlzIGlzIE9LIA0KZm9yIG5vcm1hbCBQQ006DQoNCiAgICAgICAgIEhXIHBhcmFtcw0KdXNl
ciAgPC0tLS0tLS0tLS0+IENQVSA8LS0tPiBBRDE5MzQNCnNwYWNlIF4gICAgICAgICAgICBEQUkg
ICAgICAgICB8DQogICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIHwNCiAgICAgICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tfA0KICAgICAgICAgIHNhbXBsZSBiaXRzIGNvbnN0cmFpbnQg
cnVsZSAoMzJiKQ0KDQpGb3IgRFBDTSwgd2UgaGF2ZSB0aGUgc2FtZSBiZWhhdmlvciAodW5mb3J0
dW5hdGVseSkuIGFkMTkzNCwgYXMgYSBCRSANCmNvZGVjLCB3aWxsIGFkZCBpdCdzIHJ1bGUgaW4g
dGhlIHNhbWUgcGxhY2UsIHdoaWNoIG1lYW5zIHRoYXQgaXQgd2lsbCANCmFnYWluIGFmZmVjdCB0
aGUgSFcgcGFyYW1ldGVycyBzZXQgYnkgdXNlci1zcGFjZS4gU28gdXNlci1zcGFjZSB3aWxsIA0K
aGF2ZSB0byBjb252ZXJ0IGFsbCBhdWRpbyBzdHJlYW1zIHRvIGhhdmUgYSAzMmIgc2FtcGxlIHNp
emUuIElmIHRoZSBGRSANCmlzIGNhcGFibGUgb2YgZm9ybWF0IGNvbnZlcnNpbmcsIHRoaXMgc29m
dHdhcmUgY29udmVyc2lvbiBpcyB1c2VsZXNzLg0KDQogICAgICAgICBGRSBIVyBwYXJhbXMgICAg
QkUgSFcgcGFyYW1zDQp1c2VyICA8LS0tLS0tLS0tLT4gRkUgPC0tLS0tLS0tLS0tLS0tPiBCRSBD
UFUgPC0tLS0+IEJFIEFEMTkzNA0Kc3BhY2UgXiAgICAgICAgICAgIERBSSAgICAgICAgICAgICAg
ICAgICBEQUkgICAgICAgICAgICB8DQogICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8DQogICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18DQogICAgICAgICAgc2FtcGxlIGJpdHMgY29uc3Ry
YWludCBydWxlICgzMmIpDQoNClRoZSBmb3JtYXQgY29udmVyc2lvbiB3aWxsIGJlIGRvbmUgaW4g
c29mdHdhcmUgaW5zdGVhZCBvZiBoYXJkd2FyZSAoRkUpLg0KDQpJIGhvcGUgSSB3YXMgYWJsZSB0
byBiZSBtb3JlIGNsZWFyIG5vdy4gVGhhbmtzIGZvciB0YWtpbmcgdGltZSB0byANCnVuZGVyc3Rh
bmQgdGhpcy4gSSBvd2UgeW91IGEgY29mZmVlLiA6KQ0KDQpCZXN0IHJlZ2FyZHMsDQpDb2RyaW4N
Cg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTItcmM0L3NvdXJj
ZS9zb3VuZC9zb2MvY29kZWNzL2FkMTkzeC5jI0wzNjYNClsyXSANCmh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y1LjEyLXJjNC9zb3VyY2Uvc291bmQvY29yZS9wY21fbGliLmMjTDEx
NDENClszXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEyLXJjNC9zb3Vy
Y2Uvc291bmQvY29yZS9wY21fbmF0aXZlLmMjTDY5Mg0KDQo=
