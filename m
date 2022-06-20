Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62149551FDB
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:09:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F296518C4;
	Mon, 20 Jun 2022 17:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F296518C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655737794;
	bh=PRKe2mFf2/0jpsQlQp0YkYzaobK0MvgwwQ0WU1ehzfI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s/Faiqoacv4WtIYEMKyL21gawS4q46KmBGKuvP4pEvuAZOCxRkwmxzZqPLhQjFnZ/
	 aNW8QuqCJjIWjhoTlgV8OnAtlC0K9B2LCmaki2cKHWBYC8Lv51QbhGbJMeuIx/RI+s
	 pTy0s0ZgN/ZCBdaVTKGiPeU95/GPv5wS/shUHYjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2BBFF80558;
	Mon, 20 Jun 2022 17:06:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76120F804D2; Mon, 20 Jun 2022 10:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A019F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 10:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A019F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="UxAq4Vzy"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="ftv0910C"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1655714831; x=1687250831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PRKe2mFf2/0jpsQlQp0YkYzaobK0MvgwwQ0WU1ehzfI=;
 b=UxAq4VzyJNpHcl/752R+KqRbAOa36k/KTVPWvbkB+Zwy++pJYKQhMPzt
 3hEgy5EpJUm9edkXTfQuMXETCPIe+Cj34tONqAz5/p/YtP6yaXmHd0vMt
 mCDf0lzzsf9iA6CLvba6+bs4dfon1fzJBamfQN9cLwzyNK+Db/lFet4zF
 P9DEHN6i/wK9OM6JOsZXMD6By79aUoz10rubQyo2SZQ+OfbDb4O24W+1V
 /GC1uk43Ip7Zuyj7k021MVQUw8iu1hdIFUlXIEsSmS4uhFpxXsBfa4UhX
 j9A92gczdULhbIttv0FmECC8UmVmgPqui5AgunXP/XduMM74ONMy8/lvD Q==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="169079558"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jun 2022 01:47:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Jun 2022 01:47:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 20 Jun 2022 01:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbEqW3zVBNSnbUNGBCH00dtjqcyJ2e/XojU6RJzV2M/YaPX9JD1MnQWFnM3jA07AN2bBNpS7YG5MYYZiswfREB9TWXsFa349GRww0b1GPVp+vChHkoVvnNPLVhnasd3dU+BJi/okCUENgx5fkRLn1MU7RLuKLnPhjSjTdJsBcF7GjDdPnaamkYvWJrwaOXr+OsZkso13QdiLSZKJsgY+ohoE8H2KBngo1/ka8U8lYwJ3I1VAdzq1ZIelL+KtPwVTnsFP15/kmfTdsMy2YAOg2nZqlSsgf+dwAo2z3mSNcoxEFGOu/sdTseI5SUYA4Sn5GzDAhYEjwFZEY++4oQoaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRKe2mFf2/0jpsQlQp0YkYzaobK0MvgwwQ0WU1ehzfI=;
 b=gzFQ8n9n7Zlra3SvBXoNTQc1Qq6A7g/G/sctZGdz7vkCqLxjcw5m4VvsEbhY9BC4lWHAzbIHNpcXgsAH6qN+o8VTXl9wv/8FTiLWjSzQLzeKkLvdb6/MFlE2g44YYQdFdL5iN4fMjkTmtEw3uHvnLaaECLpMM4jsjDxU/kTSacx9mIX5EONBee5fS/PihgXkNnw8ejXl94IYtBBy5Bp79nZla1/q8ROSWq6D5OXm/tIgB9kuceSlR986lEl1N/d+1JlA1fU6iQy3sVhLIvSWX8xQRrFDHRnciU7MMN6aa6thcCjDGCjl3ZE6LhMvgeq07siRaHIHYkthfEjiMVLlog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRKe2mFf2/0jpsQlQp0YkYzaobK0MvgwwQ0WU1ehzfI=;
 b=ftv0910CsZyxjJcXWEkVxoYlTsuokIBL4jcRUQphLbkq/VOqcj3DakZUcT0QBpZwc3Pxv3KeYkBlbFw9D2J42qvdlYpeotfxH2WxJO+LA0eUDEWlVr2ujwA760xXg3LjsjdEAO1/64k9kMDlk4uElVq1Ud2FAh9Y9xfxRi0OfXU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN7PR11MB2545.namprd11.prod.outlook.com (2603:10b6:406:b0::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 08:47:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.020; Mon, 20 Jun 2022
 08:47:03 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Topic: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Index: AQHYgw+Pu1Tn+/2s8EmHi9NhXNIv361X8fCAgAAMIQA=
Date: Mon, 20 Jun 2022 08:47:03 +0000
Message-ID: <effbd3b1-2d59-c0b2-fb88-215d2fc6e244@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <CAMuHMdXtjZVvy-gGTksVRYa+dS7-1ngQf9_kfp6k29nkfizKbA@mail.gmail.com>
In-Reply-To: <CAMuHMdXtjZVvy-gGTksVRYa+dS7-1ngQf9_kfp6k29nkfizKbA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f63925be-d3b0-4fad-47f9-08da529972f8
x-ms-traffictypediagnostic: BN7PR11MB2545:EE_
x-microsoft-antispam-prvs: <BN7PR11MB25452F837E2ED725BBD6C5BA98B09@BN7PR11MB2545.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W6VNlMX1qCK6LJLHLte7HZvbUoIyyi+oVMUEPZoGisuHOnRN98/wrLhU+IpD0JhO/2A6tqY4X2h35Hcp+Dszq9CTuKfPol1rKxeDwAmdNUSEdh9ByTEuRGU1UwijApd44ecPRklTuHlo+en9wMWQmf0AvUGHiUVOh8FGIjngzCzIRN3Nh4CjW59O3DqhBX9yGAlClAzUFvkZnZhqhCPiXGGNi61ZzH/IufvdcYuk/GiTB1JlE9NI3EZ1UuwyEAwDe4HySnBn3aSM0pVxkYq7SwB1njaDye56qfdZSBqfzFqaawLZm+ZbIRKP6t+XNEJXs24ohSgT1xn9a7y1+hL+IMpJvG0LwanxAvWHJLAiaIy4+mrGbsQ0SH76vkLGP+Hu061jG1+d/TBHrLK3UKVsOUv9sKqJDsZIJv3TQzV5xtrF9MnNBB/GX3CVz4R7Gm6rPAd2U8BaIhTDLjJOX+0uup9IhM4QRQ/FLb7Gql1PsruRggca8+JCmjR9+08bvE5/3+bMTXq9QKkySVKVSNFAq8JDBQwRh5qOg62Pflsxs7xvbBr1TctR1WucgtHBZSwfhZsrihaRYVK9FUeDH5IPyYbGLR+7Lw2VwuUFygOJ2scZwu/JA30e7DLOnaS8a6UR5nH6kultr+hhEkP47qSRS97tCx+UIdHEsel1uhqSI3ABeGiFScryomP+c3KvyPFs+XJdhwOonpTnzCkeeWcoOUUrLjgAYBkjgtiAjx68PoAd37N6xzNHbW0OAp1rVc4DwF9YAmTnUSaBCb3d7yiq8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(2616005)(64756008)(71200400001)(186003)(36756003)(498600001)(6506007)(6486002)(66476007)(76116006)(31686004)(66446008)(66556008)(7416002)(7406005)(53546011)(316002)(66946007)(5660300002)(8676002)(83380400001)(26005)(122000001)(8936002)(15650500001)(4326008)(38100700002)(86362001)(31696002)(2906002)(6512007)(6916009)(54906003)(91956017)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGFOSThYQTQxZTAvYWg3MnpwbUhrTVM5MnVLZGNPYmI4M2JLaVFXYldnQXB6?=
 =?utf-8?B?WkQzZm11eFdxUVlYTHowakpUWC9CWi80Z1Z6RXlXOC9XU005M3lTSFFGbGtl?=
 =?utf-8?B?ak04SHZnWlJnaURza3BOZmVFTFZ4a1RkV04rNzVrUExYVHAyaSthVzUxNmpR?=
 =?utf-8?B?bDRFeXUxSjRBcEcweUswanJ3Vm9lRlZyeC9UQzdYbjc1TWhjQm9SNnNFb1JZ?=
 =?utf-8?B?dlEzSDVPOFM2SE9QRDZmaU9sWkFFQnRnMURIK0Ivd2V1ZG9Rd1lac0ZEaUZC?=
 =?utf-8?B?U3lhRjZIU043d3VtTVFIbkVKTld0ZFpkZTNGNU83V2FpV0g0dFFyeFlhNHFT?=
 =?utf-8?B?TUUwbHdiQzJaaHdVUERyRDREUmVFTUZHZEpVaERmaG5RVC9UQU9JTHFoSnRy?=
 =?utf-8?B?OStISitZSDlTeGk0R2ZGS2JOeHFMazNOQlZLU21meitXRWZDdk5pSHY2dld4?=
 =?utf-8?B?MVJtOEZoSWRVenVKdEpHdTNkRitrQlZNTjdmaVhtQnM1ZDhMSnN0M1VLZkEv?=
 =?utf-8?B?Qmk2dGczcGoxM2lJTUpZcnZOdXFTNTVZVnAybVZiNk1rZVlycFhPQjJjK3Zh?=
 =?utf-8?B?b08rNjBBVHBKTUpSOTZoc2NDZFErdU1IYi9Xc2ZLckN5bnJjNkozakFVZ3BB?=
 =?utf-8?B?R294RzF5M25YN094czdhbm43R0lXSURNd1RITDFrQnE1VkxXS0lGeFl2czdm?=
 =?utf-8?B?VEx6a3FhM05vN1NIZm1FcENEbXRxNGxNZEFDSGRDc2NzcW0ybEdvcThZd1VC?=
 =?utf-8?B?dU04SWxhYmV4V3pHWmlUSit6L2dyTUVhNWluaE5ic3M4L0pmeVJ5QjBvbTJn?=
 =?utf-8?B?TWFOZVJtQXBDNzczN3l2R01ibUd1cGRwbXpSRXJPcmx3OUlnVmxiZXZHcEkx?=
 =?utf-8?B?ZW9tWHpGQlMvMFdrak5LRThQQi9XQWYwSEhvdDFhM2lRemZXZkt5cDdnRDIx?=
 =?utf-8?B?T01KRXdwRzJnSjROWGdsK2RybFR3Z1BkclBudG9zYk9JN0JzZmV6VC9oeHo2?=
 =?utf-8?B?ZTRCQ3lNZHAvTWdiMlJqbG9YU3ljeW03MG10SzlXZGllZm83V1kra0hCWThR?=
 =?utf-8?B?MmRFNGFqOTNjSkJlc1p5czZKdDIzdWtXMXl5YWlxbkRxOTZiS0s5eHZVSFQ1?=
 =?utf-8?B?YXZod3Vid3JMYWlwb1h1UkF2MkNpbUVpVVhMNnBzSG1teS9rRklPOEZQbVF3?=
 =?utf-8?B?MDR3K0VHS2FPNWpoWHhwdXVuWDlhOG5GTVg3QW9qbkxIWTNYM0FXLyt5L0Qx?=
 =?utf-8?B?ZzAxRWVpdHBqK0ZkUHk4ZUtWZit1YW5JZldhTFpyc0NHQm13ZlYrYUcvQVlJ?=
 =?utf-8?B?WmFXMDNSaGxSQytHSW1CMEJPNTlmMDAxN1ZtMFpLRWdDaVdFR3J2ZU5Md3kx?=
 =?utf-8?B?dm1IU1FyNXJDMXVFQ01aVGxaSFVGUC9sQ1ZNekFhQXhtb1Fiamx0eVpaUWhI?=
 =?utf-8?B?UWF3UDdiYngrY2ptSHJXdHI3MTRsL2FvUWpNS2VMdkp6QlhBSnFIL1ZkcmN0?=
 =?utf-8?B?SXc5bG91QU82SGF2NWZ6RUw5M2hNWXhsSFYzTTdJbjk3eEI4dnlkU09VUHAx?=
 =?utf-8?B?TlpmZXBONFVqVG5xZC9ubFZRRWw0TjJmQWJkaTd1ZVI1VUYveC90Z1VkV3Rt?=
 =?utf-8?B?Q3J5c0NLTWVJNjFteWMzT0IyQ3JzZnhweXJTMHFNS2VTRzNzek95a0UrZHpw?=
 =?utf-8?B?Vnd3bGd5bWxqbXYxU3RSODlTRWxGLzlyTWo5dUVTZitLajZiaXNSbVpxQnE1?=
 =?utf-8?B?N0F3S0pPZGgxUmZvN242bXRNUDRvWGs4dkM3N21wYXpTMW9ySkV6Qk9zeTNj?=
 =?utf-8?B?UFdvbXBESlh5anBYeHovNkZ5ZHEvQ2NvZWl5YWtTNDc0Wm5oS0w1cUZVUlhF?=
 =?utf-8?B?Z1V4UGF1ZFgzTnJ4bVcyZDBGREFOcFBJc1RHa2U4RGZ6NWZud1BpTVkvYkR4?=
 =?utf-8?B?ZFBLWitYdStPQ3lvR01uUElUbG8vNGRWYjg4b1prUVhMTWkweEc5WDRHWDJX?=
 =?utf-8?B?VXdrd2oxOVUyczRQd09iQlJBdkRXdjBRM1F0OExNdVZOY0JiUlEwcWZmaml2?=
 =?utf-8?B?WHZBMFNKb3owNzNycDdlOXZFTGgxTjd2UTh4QmQxbThkb3phTnpYanBycjEr?=
 =?utf-8?B?RzZBSmgwNVJZY2p0d3FhNzJjRVdiQ2N6eTV5dnhLZ0FGdWNwWEw4Y1dmOThx?=
 =?utf-8?B?SkJuVmFDZDkzSU16MW8xWGpqNmtmZDZJQXVUYUU2L28zdmdvY1BpbHZhcHdR?=
 =?utf-8?B?SC9RU1M5MkFmVFUwMitsWlJNSkhxa2ZmNnJSQUtUbzFQWVVzWXc2T1ZJU0R3?=
 =?utf-8?B?VDlsMytUMkl5elgzb0ovdmVJOTZKQXBDanJKMUlaNUNHNitWWnNFQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6236C2F76274C04CB2B6512308A40D40@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63925be-d3b0-4fad-47f9-08da529972f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 08:47:03.8068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUtVbxMIawDWzwr1C3ah4EVmJNTeXrAaYvh35RcxAVdo+zqbvSGUYJH22VlCaLMDI8fiKsXfXd72q+Y35zHLUpzuCiPZb2wRhoJZU8SPTZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2545
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:44 +0200
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, jee.heng.sia@intel.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, tglx@linutronix.de, dillon.minfei@gmail.com,
 lgirdwood@gmail.com, fancer.lancer@gmail.com, linux-spi@vger.kernel.org,
 vkoul@kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, daniel@ffwll.ch,
 dmaengine@vger.kernel.org, masahiroy@kernel.org
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

T24gMjAvMDYvMjAyMiAwOTowMiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBIaSBDb25v
ciwNCj4gDQo+IE9uIFNhdCwgSnVuIDE4LCAyMDIyIGF0IDI6MzIgUE0gQ29ub3IgRG9vbGV5IDxt
YWlsQGNvbmNodW9kLmllPiB3cm90ZToNCj4+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4gc25wcyxkd2Mtc3NpLTEuMDFhIGhhcyBhIHNpbmds
ZSB1c2VyIC0gdGhlIENhbmFhbiBrMjEwLCB3aGljaCB1c2VzIGENCj4+IHdpZHRoIG9mIDQgZm9y
IHNwaS17cix0fXgtYnVzLXdpZHRoLiBVcGRhdGUgdGhlIGJpbmRpbmcgdG8gcmVmbGVjdA0KPj4g
dGhpcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc25wcyxkdy1hcGItc3NpLnlh
bWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc25wcyxk
dy1hcGItc3NpLnlhbWwNCj4+IEBAIC0xMzUsMTkgKzEzNSw0MSBAQCBwcm9wZXJ0aWVzOg0KPj4g
ICAgICAgICBvZiB0aGUgZGVzaWdud2FyZSBjb250cm9sbGVyLCBhbmQgdGhlIHVwcGVyIGxpbWl0
IGlzIGFsc28gc3ViamVjdCB0bw0KPj4gICAgICAgICBjb250cm9sbGVyIGNvbmZpZ3VyYXRpb24u
DQo+Pg0KPj4gLXBhdHRlcm5Qcm9wZXJ0aWVzOg0KPj4gLSAgIl4uKkBbMC05YS1mXSskIjoNCj4+
IC0gICAgdHlwZTogb2JqZWN0DQo+PiAtICAgIHByb3BlcnRpZXM6DQo+PiAtICAgICAgcmVnOg0K
Pj4gLSAgICAgICAgbWluaW11bTogMA0KPj4gLSAgICAgICAgbWF4aW11bTogMw0KPj4gLQ0KPj4g
LSAgICAgIHNwaS1yeC1idXMtd2lkdGg6DQo+PiAtICAgICAgICBjb25zdDogMQ0KPj4gLQ0KPj4g
LSAgICAgIHNwaS10eC1idXMtd2lkdGg6DQo+PiAtICAgICAgICBjb25zdDogMQ0KPj4gK2lmOg0K
Pj4gKyAgcHJvcGVydGllczoNCj4+ICsgICAgY29tcGF0aWJsZToNCj4+ICsgICAgICBjb250YWlu
czoNCj4+ICsgICAgICAgIGNvbnN0OiBzbnBzLGR3Yy1zc2ktMS4wMWENCj4+ICsNCj4+ICt0aGVu
Og0KPj4gKyAgcGF0dGVyblByb3BlcnRpZXM6DQo+PiArICAgICJeLipAWzAtOWEtZl0rJCI6DQo+
PiArICAgICAgdHlwZTogb2JqZWN0DQo+PiArICAgICAgcHJvcGVydGllczoNCj4+ICsgICAgICAg
IHJlZzoNCj4+ICsgICAgICAgICAgbWluaW11bTogMA0KPj4gKyAgICAgICAgICBtYXhpbXVtOiAz
DQo+PiArDQo+PiArICAgICAgICBzcGktcngtYnVzLXdpZHRoOg0KPj4gKyAgICAgICAgICBjb25z
dDogNA0KPj4gKw0KPj4gKyAgICAgICAgc3BpLXR4LWJ1cy13aWR0aDoNCj4+ICsgICAgICAgICAg
Y29uc3Q6IDQNCj4gDQo+IFRoZXNlIHR3byBhbHNvIGRlcGVuZCBvbiB0aGUgYm9hcmQgKFNQSSBk
ZXZpY2UgKyB3aXJpbmcpLg0KPiBTbyBhbGwgb2YgWzEsIDIsIDRdIGFyZSB2YWxpZCB2YWx1ZXMu
DQoNClllYWgsIEkgd2Fzbid0IHN1cmUgYWJvdXQgdGhpcyBvbmUgYXMgSSB3YXMgd3JpdGluZyBp
dC4NCmVudW06IFsxLCAyLCA0XSBJIGd1ZXNzLg0KQXMgYWx3YXlzLCB0aGFua3MgR2VlcnQhDQoN
CkNvbm9yLg0KDQo+IA0KPj4gKw0KPj4gK2Vsc2U6DQo+PiArICBwYXR0ZXJuUHJvcGVydGllczoN
Cj4+ICsgICAgIl4uKkBbMC05YS1mXSskIjoNCj4+ICsgICAgICB0eXBlOiBvYmplY3QNCj4+ICsg
ICAgICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgICAgcmVnOg0KPj4gKyAgICAgICAgICBtaW5pbXVt
OiAwDQo+PiArICAgICAgICAgIG1heGltdW06IDMNCj4+ICsNCj4+ICsgICAgICAgIHNwaS1yeC1i
dXMtd2lkdGg6DQo+PiArICAgICAgICAgIGNvbnN0OiAxDQo+PiArDQo+PiArICAgICAgICBzcGkt
dHgtYnVzLXdpZHRoOg0KPj4gKyAgICAgICAgICBjb25zdDogMQ0KPj4NCj4+ICAgdW5ldmFsdWF0
ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
