Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0959D565355
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:26:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9852D1715;
	Mon,  4 Jul 2022 13:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9852D1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656933998;
	bh=Inrl3JbpmMewNIcTW5Yg+lqgC602PELewviPFeorsms=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ec9gyTtchqnL/s5nTXAOOLO6+WR64irCwT5fPUW7W51GPLbogkon9G//9hOzd8AqC
	 2H8JPSx9d2XhBnwEz8ZcSioFCJ8O6i4OeNEBZ9BHho3ueoRIb9BPub6ikEEoVeK3kp
	 eveiW1uvLyMfUBA14Q/4i8r1dEU1l1F5i95iYsGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5144F80568;
	Mon,  4 Jul 2022 13:23:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE95DF804D8; Thu, 30 Jun 2022 17:26:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, HTML_MESSAGE, PRX_APP_ATTACH, PRX_BODY_135, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70DBDF8014E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 17:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DBDF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="BM1i+uik"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lt3JDugxaUhX4kTOjp9x2+WwvnODAijfPbV9lfUyCIKGfhNF4Yyuv1wByelS+kNx7dgEY/2AVJcMcxcqRkQsGi2/SJ21OrmSz6b+cqe+xI7/5DKPn5WiU2pNfDh400jNgJsbkiPge05JFhC0QNReCPZ8RBBoW1KFHvbiQboOLkLKh9/PuGSJBsRvGDAl51jm5tyB0n3a3h9xYosWjvDa78RjTU894/+WL5kAL8f05iGxAxDg42ZVVo2U8SAtSwvxUEGgrcVNBeDm07YZXqbypYuw0ObxBRctAyfQyfK2VOC3Ix1iPEzpRTbN3Fyz6aL/eyxGafChrUe0HVdvfk0LdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7uX0eZSgsYAI1v4qjMQFv/RCVE8dgDoUnc+OhWtOnk=;
 b=IiCmcaehr2jNobDofDyJ5e2WyvP+H9BJBNV/7WY/Dcx2rHRHnE22d8vebdMzmBMPHFLYNb8+a6dkxE5oL/5HemeFiJaaUv1IzKqCuI6iCLXR/9d7kyr+rABtjIYNmsq1kBZOeMevwsFEQUvwXqZlgQDSEbWXYpYD14qG15tN1ONvfTiYWVNoFUcwMT2lqcVBPSpfMPtiDMROLg+tsPZzVCIb4k6CyU5LbmPlBYBeNMs9EBhP8zxRFaYu/4kEwyvB96BO473bCwBYI03ePpuPxubZTgLWvj2luA8RMY3kS4huqHaV6vC95MNZKSfz8Bq3XQqfpgym+hwKdOCVrPZIaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7uX0eZSgsYAI1v4qjMQFv/RCVE8dgDoUnc+OhWtOnk=;
 b=BM1i+uikP+oj1iG5sB2iaItdiLoCeQp1IYYCe+/5IVe8yXr8CUSR4ZYqx0NZWp3AA8SOPrTYIkxcyAPZa2eiutU06/EvE8r8MFSmfK4cprIsl6Z1GUYy90MLRZp5aEEloxA7nbmjjv+U2QAKV8NWF7Parm5GughfhmgahTmEyBY=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DM6PR12MB4795.namprd12.prod.outlook.com (2603:10b6:5:164::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 15:26:26 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::7d16:a6b1:7a6a:aae8]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::7d16:a6b1:7a6a:aae8%9]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 15:26:26 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v1] Fix: SYNCOBJ TIMELINE Test failed.
Thread-Topic: [PATCH v1] Fix: SYNCOBJ TIMELINE Test failed.
Thread-Index: AQHYi34ZGFS9AIc920ecGuR1O9XU2q1mGbeAgAH6gGA=
Date: Thu, 30 Jun 2022 15:26:26 +0000
Message-ID: <DM4PR12MB5152BA76985C98A0AAB033E2E3BA9@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20220629060236.3283445-1-jesse.zhang@amd.com>
 <8499b1f1-cd39-5cb4-9fac-735e68393556@amd.com>
In-Reply-To: <8499b1f1-cd39-5cb4-9fac-735e68393556@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-30T15:26:16Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=e0bfb699-69e9-41a8-97e5-1d8afe424baf;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-06-30T15:26:16Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 9bc8e904-51a1-4df8-9348-4fb83e2907f1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c426c188-9209-4082-cbbc-08da5aace5eb
x-ms-traffictypediagnostic: DM6PR12MB4795:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nQd0OYkRa0yGdhcXi3BvDwIekP+GgrDsojlu1nVyVhpm+MyNMfcd72vYlg1smhDFUI0KUMcrGwKPZ/P9aKYdvxcl8G+hX8oWW8wsK2/b68bTcR+XQHZhGKzEhn6rjJdC21O9YYUIo1WOym1rCIJOFK1S9JpGFo+CNcC+IXGjJfS7uV2vCWo2TY/BCOTzXfEC9yHengcGy5AhvayHR9kzFnw0E9NwPtYExAq0GwPZ5N1OJSokqtFv/yP+3T8cVefF8B3I+j2dBZiy/FKWTatdgFbWEynSV1IMWdteFFs5KFsKep6b96xA5UdC374M13ytb8onatgmooOM+uDHoeCsHwfx9si8idpKrOyqiQuqm1erPMGfJgjxPzWFlYLOxJMsFBRXEwAVY2RpBLhTh0N1tjMB60Y8QOWaxvYPaG3LQLzX+gSZWGPk1i9ltiTuFhFtYGprf/NPcsdD5DcchQ3sT6FFnI1LELan/qiCb7CiHmVSKWnJxZZCyB9GkuB08gsIrV7cGxt5iX8L943HwI7LkaSpfvmtvU6qAzJ2UxBzlz2MwT8hqHYXZS3jZQ0SvAHoJIlPJrcNWtyyVl6KbrMaAIIwKwW/tn1pMGS5uwkUvglKjEnGwiTLswVYXg+DTJR2Kfa2H6OJJItHiGXbr+lRqaLgBiB8eCGen2C2AsenY+uuhXNuqF6sunQ7bK5Lgdb2HTxJK8k5Q2Yrqr4U2Vi+P+cOsDBIeilY76KWr8bRSxq/Va8nxoaaksVYJKzzhVktgFKlBy0qf3XmeFJ+Oq8Ixx3n/MUFBt0Iglbp8iObE20M/LD7yPIYKG8i7ydyzpSFcEKUmk2ACR7+dqEllClzLz+TKoi+VDBD/g6Y1RKVtjT37OUvK9oVRQb0wxI+V3RILSg97duDipb7yh41eKjPPA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(8936002)(66574015)(33656002)(186003)(966005)(38100700002)(66946007)(86362001)(316002)(55016003)(4326008)(83380400001)(8676002)(7416002)(7696005)(54906003)(53546011)(71200400001)(478600001)(110136005)(41300700001)(66556008)(6506007)(9686003)(66476007)(66446008)(2906002)(38070700005)(99936003)(52536014)(5660300002)(26005)(122000001)(64756008)(76116006)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFg5b2pnOEhKZE16dCtUL202UW12c01lM2JmMWUyVUhVT0hiKzQzcjlJckNQ?=
 =?utf-8?B?dzZETEJKOHM5OWpzWW5kazU5ME5weG9PcGk1eUp2TXVzR0JYbUV5emRjeEw3?=
 =?utf-8?B?Z3hEbmxXWlQrODVlY0NvanlzaW9DM1g5Z3BpWGNrY040Smc4dDU2Z29wR0k4?=
 =?utf-8?B?VUF5b3BYeUdyRi9hRHVZRGMzaDd5TjZ4TUVJV0hrdGZhb3NNdGJjOVNpdzN2?=
 =?utf-8?B?SnRjMUg0aWdnMStTZThIY0NEQTNhcGp6UVA5clFqTmpSOGFCV0RMSjRpL05F?=
 =?utf-8?B?TVhGZExFZy9oUENBQUcycnRtTFpYWThUNnlOdU03bzdvYUNGRUUzcUFJQlVZ?=
 =?utf-8?B?ZEpSSkZ2RVc2MUY2U3RsZk4yckhDVG45d3ZCTzAvWVBkUU1ncWQyTDBIU1R5?=
 =?utf-8?B?SkplblEzVlJNNkJNOENZNnpsZ0lwTWEvVW1xTTcxLzQzRzZTaHN1QVlEYWl6?=
 =?utf-8?B?MTZPeDZFb2JvdWhGek9hcWs2OHZtblNOR3Z4MXhrTTlpWmZvV2I5US9YSXpz?=
 =?utf-8?B?RnpXNEJmU1pPeHMyNldqem9RVVFzaHcvK0FvYTgwQ09wSHozMGRtZGFwOEJz?=
 =?utf-8?B?N0ZlTXVTZm1pNlhkdGtXNEpxcmxLeEVteW43MFBOd213c25aQWtJVzdObU9l?=
 =?utf-8?B?RVNSQ1UrRXArcUp0V1pIT2lxWWR6M1htdVlUWTJtVlhNbUlUTXFsdDBuR3F0?=
 =?utf-8?B?VU4rSktuVHREamErTmF3RWlZL3podUM3cm1sZkRvZjg1MjJpdGY4V0hNa2pO?=
 =?utf-8?B?OXBIbEVxcGdDUVBYamxwSVdaYmluSzdSckdZUWFOdUdQQndiY3BNWGdMRDd4?=
 =?utf-8?B?NmYvQmNralo4d3hnTnhJYWZnUSs4TWJlUWZ3aTM0M0pJYWQwQm5DWTdxVUYw?=
 =?utf-8?B?WGpWOWFUMVdzcFdrVEcwRXRRVUtIVXR0QUhlSFd6bURLYUc2cmdOKytZSWts?=
 =?utf-8?B?ZDBEUmhlUE83a0JpSDJ3b2EvWVU0Z3pud1pBMm5FRy9XV2xDc2RqMDhKbTRw?=
 =?utf-8?B?OEdVYUs4d2Y1aHJFbXFlMWduWHpPNWorQ200NjdXT3ExdzBxd0J3amVhOVhR?=
 =?utf-8?B?MVB3cDFoMHc2Z2c5cWhnVWRKQ3M4UUcvQmVKSUhMVU5mbXR1U0dGSzM3WDM5?=
 =?utf-8?B?WXh0bkJlenowNStCdklwZVowVk1iZHExbzkrWUxpelUwd0FJT3RsK0RqQnM2?=
 =?utf-8?B?SUdaNWg3bjNCZVBEVVdIQlV6RHkvUWxPK2lDVG8vL2dYYjd6Z0VCdy9YbzAy?=
 =?utf-8?B?WnRxejkwcGhQeHZUb2licm0vakROS3FrcWo0MDJOcWJHNVVFQWRZR2NFRC9Q?=
 =?utf-8?B?T0ZOVmlodXhlKzc3TTJ1NDdybzFIdGwxTmpJVDA0QVN6MmYzUHc5ZUc4dDYy?=
 =?utf-8?B?ODIzVkNwb21DUks2L2lUenpwbEczM2RrN3pDRW54a1VaU1d6aHRJSkhPZDVr?=
 =?utf-8?B?K09lZmFBdzhqOGtqY280VHJvZlgyR3c3RUVtbVdkM2ErYnVraW1wUnJZNGNt?=
 =?utf-8?B?akhoQzVrUjRiVWNDZ1kvOXZxRkxwWXpHejZSV3NObS90eTd5WnpoaFdtVUdj?=
 =?utf-8?B?RUNGeHQ0YUI4Q0hpcFlqVEdkbUF5TjZyQUpGbEUyWVQxR2NsejlySjI4ei81?=
 =?utf-8?B?MnVKZWpZbTlUUWNRWTU1Z2RsUURHZ2FUd0ZndzhEQ09xcFlVd1NWTEViM1hW?=
 =?utf-8?B?UnVXM25QdFpzbFZuMjJYSStVSC9xWXlHRjhmZjd1Z2YraXdqa0pUVjNHbkQ4?=
 =?utf-8?B?a3BLWml3ck9CVnQrdTNtcitmSHg1Q0FWbTBaZTN5Q21YVVpSMDdZRDdMeVVj?=
 =?utf-8?B?OEN6bXQzSUM4TXM5STNmOU1RT25TYzIra29zV2t1SWlmbTdqZDhUclBweXdM?=
 =?utf-8?B?NUJ3dzB4WXFVb2NjdUJZcldreDhKMnF6TXB6MFJGSjhYNnhiWHMwaGRWZzdt?=
 =?utf-8?B?Y244NlhGc0psVk1temlUcmk1bTgxMWtNTEpMakh6VDNPWUJ3WXNOdzBvZitF?=
 =?utf-8?B?cFlSU3BHSUpjRFN5Q1VqeWVmZ1l2ak1UcUluVk11M2F2azJTSEg1TXZNYUls?=
 =?utf-8?B?THhaMnk3V211NHljandUV1FwNW52UnRVTmVyT0RidzhNNUNtVjA2cFFwbnNr?=
 =?utf-8?Q?X8v7mCbu1IVs78YZB1XbnmHqv?=
Content-Type: multipart/mixed;
 boundary="_002_DM4PR12MB5152BA76985C98A0AAB033E2E3BA9DM4PR12MB5152namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c426c188-9209-4082-cbbc-08da5aace5eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 15:26:26.4031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qx4pMugntYDkrTJ0xn+I1CQr27oN1xKGjCJXujZohZPX2+4CLDaaUTwDUQTnPjozKct+IW8D3+n3IxKYD+3CXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4795
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:03 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Pandey,
 Ajit Kumar" <AjitKumar.Pandey@amd.com>, David Airlie <airlied@linux.ie>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nirmoy Das <nirmoy.das@linux.intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
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

--_002_DM4PR12MB5152BA76985C98A0AAB033E2E3BA9DM4PR12MB5152namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KSGkgIENocmlzdGlhbiwNCklm
IHdlIHJlbW92ZSB0aGUgZm9sbG93aW5nIHBhdGNoLCB0aGUgICJzeW5jb2JqIHRpbWVsaW5lIHRl
c3QiIGNhbiBwYXNzLg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9NzIxMjU1YjUyNzAwYjMyMGM0YWUy
ZTIzZDU3ZjdkOWFkMWRiNTBiOQ0KDQoNClRoZSBmb2xsb3dpbmcgbG9nIGlzIHByb3ZpZGVkIGJ5
IEFNRCBDUUUgdGVhbS4gVGhleSBydW4gdGhlIGFtZGdwdV90ZXN0IHRvb2wgb24gdWJ1bnR1MjIg
KGtlcm5lbCB2ZXJzaW9uIDUuMTUuMC0zOSkNClN1aXRlOiBTWU5DT0JKIFRJTUVMSU5FIFRlc3Rz
DQogIFRlc3Q6IHN5bmNvYmogdGltZWxpbmUgdGVzdCAuLi5GQUlMRUQNCiAgICAxLiBzb3VyY2Vz
L2RybS90ZXN0cy9hbWRncHUvc3luY29ial90ZXN0cy5jOjI5OSAgLSBDVV9BU1NFUlRfRVFVQUwo
cGF5bG9hZCwxOCkNCiAgICAyLiBzb3VyY2VzL2RybS90ZXN0cy9hbWRncHUvc3luY29ial90ZXN0
cy5jOjMwOSAgLSBDVV9BU1NFUlRfRVFVQUwocGF5bG9hZCwyMCkNCllvdSBjYW4gZ2V0IG1vcmUg
ZGV0YWlsIGluZm9ybWF0aW9uIGJ5IHRoZSBhdHRhY2htZW50Lg0KDQpTbyB3ZSBuZWVkIGZpeCB0
aGlzIGlzc3VlLiBBbmQgaWYgeW91IGhhdmUgYW55IGJldHRlciBzb2x1dGlvbiB0byBzb2x2ZSB0
aGUgaXNzdWUsIHBsZWFzZSBsZXQgbWUga25vdy4NCg0KVGhhbmtzDQpKZXNzZQ0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5L
b2VuaWdAYW1kLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIDI5IEp1bmUgMjAyMiA1OjEyIHBtDQpU
bzogWmhhbmcsIEplc3NlKEppZSkgPEplc3NlLlpoYW5nQGFtZC5jb20+OyBicm9vbmllQGtlcm5l
bC5vcmc7IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZw0KQ2M6IE11a3VuZGEsIFZpamVuZGFy
IDxWaWplbmRhci5NdWt1bmRhQGFtZC5jb20+OyBIaXJlZ291ZGFyLCBCYXNhdmFyYWogPEJhc2F2
YXJhai5IaXJlZ291ZGFyQGFtZC5jb20+OyBEb21tYXRpLCBTdW5pbC1rdW1hciA8U3VuaWwta3Vt
YXIuRG9tbWF0aUBhbWQuY29tPjsgUGFuZGV5LCBBaml0IEt1bWFyIDxBaml0S3VtYXIuUGFuZGV5
QGFtZC5jb20+OyBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGxpbnV4LmludGVsLmNvbT47IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUg
UmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD47IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5v
cmc+OyBvcGVuIGxpc3Q6RFJNIERSSVZFUlMgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc+OyBvcGVuIGxpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6
RE1BIEJVRkZFUiBTSEFSSU5HIEZSQU1FV09SSyA8bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3Jn
PjsgbW9kZXJhdGVkIGxpc3Q6RE1BIEJVRkZFUiBTSEFSSU5HIEZSQU1FV09SSyA8bGluYXJvLW1t
LXNpZ0BsaXN0cy5saW5hcm8ub3JnPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MV0gRml4OiBTWU5D
T0JKIFRJTUVMSU5FIFRlc3QgZmFpbGVkLg0KDQpBbSAyOS4wNi4yMiB1bSAwODowMiBzY2hyaWVi
IGppZTF6aGFuOg0KPiAgIFRoZSBpc3N1ZSBjYXVzZSBieSB0aGUgY29tbWl0IDoNCj4NCj4gNzIx
MjU1YjUyNyhkcm0vc3luY29iajogZmxhdHRlbiBkbWFfZmVuY2VfY2hhaW5zIG9uIHRyYW5zZmVy
KS4NCj4NCj4gQmVjYXVzZSBpdCB1c2UgdGhlIHBvaW50IG9mIGRtYV9mZW5jZSBpbmNvcnJlY3Rs
eQ0KPg0KPiBDb3JyZWN0IHRoZSBwb2ludCBvZiBkbWFfZmVuY2UgYnkgZmVuY2UgYXJyYXkNCg0K
V2VsbCB0aGF0IHBhdGNoIGlzIGp1c3QgdXR0ZXJseSBub25zZW5zZSBhcyBmYXIgYXMgSSBjYW4g
c2VlLg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IGppZTF6aGFuIDxqZXNzZS56aGFuZ0BhbWQuY29t
Pg0KPg0KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPg0KPg0KPiBSZXZpZXdlZC1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BsaW51eC5p
bnRlbC5jb20+DQoNCkkgaGF2ZSBzdHJvbmcgZG91YnRzIHRoYXQgTmlybW95IGhhcyByZXZpZXdl
ZCB0aGlzIGFuZCBJIGNlcnRhaW5seSBoYXZlbid0IHJldmlld2VkIGl0Lg0KDQpDaHJpc3RpYW4u
DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCAyICstDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyANCj4gYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3N5bmNvYmouYyBpbmRleCA3ZTQ4ZGNkMWJlZTQuLmQ1ZGI4MThmMWM3NiANCj4gMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jDQo+IEBAIC04ODcsNyArODg3LDcgQEAgc3RhdGljIGlu
dCBkcm1fc3luY29ial9mbGF0dGVuX2NoYWluKHN0cnVjdCBkbWFfZmVuY2UgKipmKQ0KPiAgIAkJ
Z290byBmcmVlX2ZlbmNlczsNCj4gICANCj4gICAJZG1hX2ZlbmNlX3B1dCgqZik7DQo+IC0JKmYg
PSAmYXJyYXktPmJhc2U7DQo+ICsJKmYgPSBhcnJheS0+ZmVuY2VzWzBdOw0KPiAgIAlyZXR1cm4g
MDsNCj4gICANCj4gICBmcmVlX2ZlbmNlczoNCg==

--_002_DM4PR12MB5152BA76985C98A0AAB033E2E3BA9DM4PR12MB5152namp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Thu, 30 Jun 2022 15:26:21 GMT";
	modification-date="Thu, 30 Jun 2022 15:26:24 GMT"

From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
CC: "Zhang, Yifan" <Yifan1.Zhang@amd.com>, "Guo, Shikai" <Shikai.Guo@amd.com>
Subject: SYNCOBJ TIMELINE Test failed
Thread-Topic: SYNCOBJ TIMELINE Test failed
Thread-Index: AdiK2eFJ1vnMujutQ1edii0mGEcBtg==
Date: Tue, 28 Jun 2022 10:44:24 +0000
Message-ID:  <DM4PR12MB51529E90A4913889A100C0A7E3B89@DM4PR12MB5152.namprd12.prod.outlook.com>
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-28T10:28:26Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=58f7bc89-ae88-42d8-881f-b08e83972f48;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
x-ms-exchange-organization-originalclientipaddress: 180.167.199.181
x-ms-exchange-organization-originalserveripaddress: 2603:10b6:5:393::16
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-06-28T10:44:20Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid:  3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid:  db405586-14d8-41d4-b541-dec24b79ca73
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
Content-Type: multipart/mixed;
	boundary="_004_DM4PR12MB51529E90A4913889A100C0A7E3B89DM4PR12MB5152namp_"
MIME-Version: 1.0

--_004_DM4PR12MB51529E90A4913889A100C0A7E3B89DM4PR12MB5152namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]


Hi Christian,

Our QA find the "Syncobj timeline" test failed on ubuntu22 (kernel version =
5.15.0-39).  The relate ticket as following:

https://ontrack-internal.amd.com/browse/SWDEV-343186



We trace the root cause of this issue, and found it cause by your patch.  A=
s the following:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dab66fdace8581ef3b4e7cf5381a168ed4058d779.



I add a patch , please help to review.



diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c

index 7e48dcd1bee4..d5db818f1c76 100644

--- a/drivers/gpu/drm/drm_syncobj.c

+++ b/drivers/gpu/drm/drm_syncobj.c

@@ -887,7 +887,7 @@ static int drm_syncobj_flatten_chain(struct dma_fence *=
*f)

                goto free_fences;



        dma_fence_put(*f);

-       *f =3D &array->base;

+       *f =3D array->fences[0];

        return 0;



Attach the patch file.



Thanks

Jesse


--_004_DM4PR12MB51529E90A4913889A100C0A7E3B89DM4PR12MB5152namp_
Content-Type: application/octet-stream;
	name="0001-fix-SYNCOBJ-TIMELINE-Test-failed.-update-the-point-o.patch"
Content-Description:  0001-fix-SYNCOBJ-TIMELINE-Test-failed.-update-the-point-o.patch
Content-Disposition: attachment;
	filename="0001-fix-SYNCOBJ-TIMELINE-Test-failed.-update-the-point-o.patch";
	size=1012; creation-date="Tue, 28 Jun 2022 10:36:21 GMT";
	modification-date="Thu, 30 Jun 2022 15:26:23 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmYWIwZWE0MTdiNjg0ZWI4MDE2ZTVjMWUwYTVkNTU4ZGViYWZlMjRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBqaWUxemhhbiA8amVzc2UuemhhbmdAYW1kLmNvbT4KRGF0ZTog
VHVlLCAyOCBKdW4gMjAyMiAxODoyNjozNyArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGZpeCBTWU5D
T0JKIFRJTUVMSU5FIFRlc3QgZmFpbGVkLiB1cGRhdGUgdGhlIHBvaW50IG9mCiBkbWFfZmVuY2Ug
YnkgZmVuY2UgYXJyYXksIHJlcGxhY2UgdGhlIGJhc2Ugb2YgZG1hX2ZlbmNlCk1JTUUtVmVyc2lv
bjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0CgpTaWduZWQtb2ZmLWJ5OiBKZXNzZSBaaGFuZyA8SmVzc2Uu
WmhhbmdAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BsaW51
eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jCmluZGV4IDdlNDhkY2QxYmVlNC4uZDVkYjgxOGYxYzc2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNv
YmouYwpAQCAtODg3LDcgKzg4Nyw3IEBAIHN0YXRpYyBpbnQgZHJtX3N5bmNvYmpfZmxhdHRlbl9j
aGFpbihzdHJ1Y3QgZG1hX2ZlbmNlICoqZikKIAkJZ290byBmcmVlX2ZlbmNlczsKIAogCWRtYV9m
ZW5jZV9wdXQoKmYpOwotCSpmID0gJmFycmF5LT5iYXNlOworCSpmID0gYXJyYXktPmZlbmNlc1sw
XTsKIAlyZXR1cm4gMDsKIAogZnJlZV9mZW5jZXM6Ci0tIAoyLjI1LjEKCg==

--_004_DM4PR12MB51529E90A4913889A100C0A7E3B89DM4PR12MB5152namp_--

--_002_DM4PR12MB5152BA76985C98A0AAB033E2E3BA9DM4PR12MB5152namp_--
