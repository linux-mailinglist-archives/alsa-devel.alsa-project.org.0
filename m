Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5255364B122
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 09:28:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707A318D2;
	Tue, 13 Dec 2022 09:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707A318D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670920115;
	bh=iOvnyB1lbcoTXkUaxHbOviSOGLhUoULaYGv7lFO7INQ=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VHVHciQ+OSfUSoyG0B9AFvTGTY4kJgHAexEL8Mo5xiodx1lergk49p14tkJwdqmDq
	 msgT/0ireXMKRDXnuXFw1ef/7oQ61lWTnxqSEUdTqr0iqg4o7kwOXueXUV1RZmVT3d
	 DLIyR99P3MQIt3O2YmNKRAQaPAj2v6KTppoWNd/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9774FF804FC;
	Tue, 13 Dec 2022 09:27:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2320F804FC; Tue, 13 Dec 2022 09:27:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9E03F80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 09:27:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9E03F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=microchip.com
 header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=pSmq0zRC; 
 dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=DMuD8Vkk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1670920062; x=1702456062;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iOvnyB1lbcoTXkUaxHbOviSOGLhUoULaYGv7lFO7INQ=;
 b=pSmq0zRCVgps/6gKCpWJU9vsIShvXUAHYDhm62kIN/kt3SlWhXfvsp4Z
 Ek1K+xiWcC3zS7Y32sw/rknrkBpxX+DS5uNev4sAyYpuxurl5zfqC81WP
 5SR97zsXuajhmP9rPcsrO7w6FdJJrqxvWsNdWnrXYg1kq4me1M6pugAi7
 9wgbI0cZ2JGqeG3riQY4Jz5zAN/Id+uxNKORjmpCFDgEZI6MI4z6h1ZIb
 NEg8bX8xym0/ho++PyoVwtSwIiF6FzcaPfV764BoGmFIuaWrXbsYhURgK
 SjS4udmU3+d+GOS6eYEs8S11ge2q4N8aFPkrFhJ99DzumKbWkObdHWTaU Q==;
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; d="scan'208";a="203760427"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Dec 2022 01:27:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 01:27:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 01:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV437uZQbRM1kBcGDGREOWcboYVSgPhd7Oimn6x+MIlu9Lg3CKBc9mrVLD175BerD1YhLROslxAGAbNt98d/VzkpH/05bUSd8T3+9JZP1d64Z6f2+3nxwM52Iieo4t88g/BJorlrYCy3xcKF/p2iFzx17aqnkUZqavdeCIg+Gm5zCSGzhvsu2L+3UYYWkYvaKEQJ0Xnia5GwcImhEjLz3Pha0N3X5ztAODtQKSj3bGNjXQM3MFujckIWuh3DlKLuwkdIRaOGDMkyG0gdQdTtXBxWnF77BqBGJSNO1C0ZQokP80m7+DrXO5bb3DsL0U/OeYC90M33Xm/bSgFDCD+Vcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOvnyB1lbcoTXkUaxHbOviSOGLhUoULaYGv7lFO7INQ=;
 b=OXLABSOI8PcxtLkKcrUyGaXiImhTHmgDY40ZWg2EVMZfizo/nFvG2XA+LRC4lTAwIyf7le+B8oaiM7AEanhnYCCrCJd5/08XZuYgrHOY36tBOTfNy3ecm/Cz1QICksI6txUBQC/k58auLhVbDxlS4m+1Ccep412LAJaRWRhCjJCUWFikxcI6M2FXGrIzC+WLOmPoP6TaLZsFhtLxeDwTSMrFWjaOZLr8yP3Y5IryjoA/NisDlwl/EH64WqcaGEAD7LwpSMEzGWf1hTWZteNm5lz5CTLj2Ty5Hy6Ea5gf60XPmtbmu+BoWh8PaIEukysYLhm7hZRTDBOfg1oz0ZAiVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOvnyB1lbcoTXkUaxHbOviSOGLhUoULaYGv7lFO7INQ=;
 b=DMuD8VkkJr5vGQ2BCG3dJj5KMSsIHgI88DZ5OhHt1jXgwiCxIqggdzkGQbp74i0Zx029eFqqnzPKhQSxn/RqURvGvNPwkDs/l7zXLBxeZzv7vzCGlbJFxtb/g2RhaZBI19VvgfZD2F+oVrTvrgzIGdkn36Wd8BcBveM1gpRtJY8=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 08:27:35 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::98f6:c9d1:bb68:1c15]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::98f6:c9d1:bb68:1c15%10]) with mapi id 15.20.5880.019; Tue, 13 Dec
 2022 08:27:35 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>
Subject: Re: [PATCH 04/15] ASoC: atmel-pdmic: Drop empty platform remove
 function
Thread-Topic: [PATCH 04/15] ASoC: atmel-pdmic: Drop empty platform remove
 function
Thread-Index: AQHZDszACV5HPW5rHUKJ7lWQ0JDwDA==
Date: Tue, 13 Dec 2022 08:27:35 +0000
Message-ID: <17c4588e-52ee-fc13-d417-67fe3aaa8276@microchip.com>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
 <20221212205406.3771071-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221212205406.3771071-5-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|SA2PR11MB5067:EE_
x-ms-office365-filtering-correlation-id: 3f8b7312-bed5-43d2-6b15-08dadce3e34e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: as0Ld+d2OkdO6gVTBZRwHwwWB/AC8IfoE5XGLOCxpobW+55kwrhetY9CV38Hr5dS63LPWaswFx49R9tR/5b0mydmJ6LUTdV6afoUYWjFDhXKy1sXe/xkI8WpQBs4Qohw46I2Amre+VdJR0syCnmjI8P46mCJJ2K0SBVpEeA/lbsvRs/8VNva4/vtHcZfvfGCp36SOXD5tXWPxJafTlgooK1csq366fpU90TYl51Tt1tVJ6Exd8L/UKc8QAlKb0kdFm7iLNifl7mPZcJ2cbUYruueCdQ9WTIX7KfpPuoqN4zz4+7po1Rn6j9B5cI7TzhX3vDbW0CDLa1Qbrq44A2hBjxz+1fVj6shrt+P62Fzl55gEBFayIEW1pdJccyXQNWNJSEVzJFAVsFhdyESgoYvEKldAenjkqYij5uqAiXDxE/p+nQiZf2pM/vIxbaE2H4byTS4FsWuqBJGDgZQVJPRjE8/OZh//Krx3TH9NBfT3MjVDQxoIP2IBOzuVzyWs3pGe7QRWhx+9CcX2l9dqEEg9yUbdGD6eFIqNnHpZdf+A/f8kd3BtJmLzXQAqXPmpRk0YDw8atXPj94WAlIkaW5P9v4QTlLX+YkP/yOrUaPvK9T/0MrJzW3LLlqXU3PbuCA0ksivQq4aj4m6YBctUuAgOUMjGWNq9lpdB2MmrwkeYO8QCRYje87NfqsD/8UYT9e0ndSlipAhBx11gnn/roo8q+ecuizU8N++PPjZqwfeKRIHaL2MJ7eR1zF7KSZf4EUAv5w0nqs+nO+/wjndKDvQfw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(122000001)(31686004)(2906002)(6486002)(186003)(478600001)(83380400001)(38070700005)(316002)(5660300002)(86362001)(66556008)(31696002)(41300700001)(8936002)(53546011)(66946007)(66476007)(66446008)(64756008)(91956017)(38100700002)(76116006)(54906003)(36756003)(6506007)(6512007)(110136005)(26005)(8676002)(71200400001)(2616005)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnZuSy9JN3pGeWVuU0NOQis2Umg2Vy9kWkY3dGxuYnJmV1IzK3JFblNsVHJ2?=
 =?utf-8?B?NHczS1MyL0ZrdFNyL1ZBbzFTUDlHRkRzNUFvQ1dmQ1RIUy93MSsrVzNLSkpx?=
 =?utf-8?B?QlJodXNTcGJtTkoxSlpNNElNMC84ODVkMkFpdUpta3NjZ1RIV0xFZzZqZk03?=
 =?utf-8?B?K0k5bzlLVlRrYWlSV1Nvcnk1Y3BTM1M0ZEloT21WeDdLdGZDdVNoYlpGR2lj?=
 =?utf-8?B?ZVBjNnM4MDdQeWZnMW54WUowdE1ad081ZHovZEs5MlhGMmNYNHE4eG1weUVF?=
 =?utf-8?B?Y3ZTS3EwOE5NeGpSVGQxckpRN2xsZmxJcmN1QlhKQWpCSFBTQm80Q0J6cWdD?=
 =?utf-8?B?dWk0VGtzM2VPSW9LRkljQVJuZGxyRTBtaGk1WnBVTjdQREppYUZzRXoyZng5?=
 =?utf-8?B?ZkdxcDRBTU15Sjl5UTZpSVhCTzZqVFMzdS9rcXdtTkg0akRBNGVoRkVleWwz?=
 =?utf-8?B?OVAyUlBtdWFPZkNhUUcvQ3FnRWp2djUxcmZJczBmRUtiTk9PM0NmR241QkRs?=
 =?utf-8?B?R1hheWcyMWVkT1RTMkRUTEdFdlVMcGN3TlZHRDArTjNLWnV3akttQzJNQWNy?=
 =?utf-8?B?UC8raE8vbkZNdkI5YkhzR21wTTd1KzVsMGlybytQSkRxYVNWRGZyS01JQ3Zx?=
 =?utf-8?B?T09IWWQ1a1pQTHVobFE4VktzVDFpVUpzdVd6SUpjVjhEbGlKd2orVUw2ejBR?=
 =?utf-8?B?YWZZV3NFb0ZCZ3RDcUluQURPNGdqVU1BWjVwYU5XWGpkd3lTTG9MUnpVS0Vu?=
 =?utf-8?B?ckExTXozSjFabUVxU0IzMjRtOGVGaGdHWFZOZ0pFTzVtb2dpb1J4akZKMEJT?=
 =?utf-8?B?czUvZlI0MFhQQjNkMXdhU3VXKyszby9JaGsvWnJkb2U1TExOUmxYK3VRcVJZ?=
 =?utf-8?B?d3JHNkU1ZnZ2RW0rU1U1cDZ2QTRKWEJHZlVSN25Jc0txWDUyaDBzclpTbHNo?=
 =?utf-8?B?U09oeDBKSzlFdkJrZGtnTDF3M0lRb0wvZ05tNEwwOXBtcUxwZ05LanpWV1Jj?=
 =?utf-8?B?ems2L2R1eTM4RzNDMUlpNVp1VW1kZGJVcS9Pc1pVeWw1WDZYOTJ5Lyt0YjlD?=
 =?utf-8?B?QWxGYU0weFYrVUJpWFI1VHltbUVCR2JRMjNGV2MyckFSSGFLL2Y0eUtGeVZt?=
 =?utf-8?B?bDlueDdOaHFHZFFsTk4weFRVOU0vdkw0NmtxTys3U2o0VExIQ3FIeSttODlJ?=
 =?utf-8?B?SDl0di93dTlKVi9EUEZWVWUrMytYNDhnaXE4QVZHUlE0THRiN1RvTXlQVlEz?=
 =?utf-8?B?dkZGYmxBdHJRU1dlVFZuS0ViYVRReWFJckR0bUNtZzBtOGttYVpYTmRzTi8r?=
 =?utf-8?B?UGxtWTBJL3NJdytRcHZMT3BCVzAxUW0zbHhia2tTNmNTNi9HVW1ZSEhsV29G?=
 =?utf-8?B?WDlmVHhxL2I0SXBrazVuaCsyeXVnQXhZMGFTWXlRaVZaT3c5VElXemZiRDVo?=
 =?utf-8?B?TUVzbFRLNzBrOUJxbmsrZlBsRUpRYndURFJ2dWdLaG1UTFRZUVc3OFRqa2lh?=
 =?utf-8?B?NVVlRHE3cHI4L2IyK25UN1U4ajVGM0hMMG5DTk1UZWpjNXFjS2M2Y1V1eWdB?=
 =?utf-8?B?NGo2Q2ZrcWdhbUtYekE2RmhMTG8xTzRJMHVsbkFSS2RIb2lLakJsaEdTeHNj?=
 =?utf-8?B?U1lDYmN0N2pqV21USithSHY2SmMzU0xycEpIU2hHbHJRT3pqZFFrSjNxMkhZ?=
 =?utf-8?B?TnpSV1FTZ3ZiVjVHeHUzNCtjdW5oaDRzb084NzNwQjBRUlcrWlBnQmkrNUUr?=
 =?utf-8?B?NkxOYi92Mis2bHY5T0xDUm9IajM0TmJVYkhESlZpU3FDQUxXSEtSVGN0dkJX?=
 =?utf-8?B?SU9XM05PZm9IZnVyRWdONEVvQTFBaURQYTQ3d1YyRENDZVVaeDJ6c3kzZkd0?=
 =?utf-8?B?dUdZbU4vNWZPa1VPSGNzdUFPTjEwb0c1TlNkSWxZMEF3ZzJ1V3FDamg2cnU4?=
 =?utf-8?B?aXNqVTJWWUwxTU1vc0xETVdKeEM5aFBTT2tLMmVCMVRmWHdXNTd2cTYxQlVi?=
 =?utf-8?B?U01iU0lJcTJza1RyYTJ6QTFZR2pXaXF5R0dYV3Y2dURrZUhvRDVDNjErZHo4?=
 =?utf-8?B?Mmg4eUxOMU9HeG54d21ISlUxTnBNQlQ3WUVhZ29Nd3ZkcGtoUFpMdkFKME95?=
 =?utf-8?B?L2k1b0gvNVNNMDlnc0dnTjhoZlZBMWFhTzJKK0NMQTA3YXRVMVJRcnBlcVlv?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23A04686F887184F9AC217E2466D3389@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8b7312-bed5-43d2-6b15-08dadce3e34e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 08:27:35.4975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiU+CJwFoWm9ix4ELkpHh8IovGn8BMb7FCRBTgsYF7fXp3MsEwBB2bnw2srGUeYlIvgLmd5DIbwYlYphXa/y6qmnXfpGhPAM/7zv3ZCk2+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 Nicolas.Ferre@microchip.com, tiwai@suse.com, kernel@pengutronix.de,
 codrin.ciubotariu@microchip.com, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMTIuMTIuMjAyMiAyMjo1MywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQSByZW1vdmUgY2FsbGJhY2sganVzdCBy
ZXR1cm5pbmcgMCBpcyBlcXVpdmFsZW50IHRvIG5vIHJlbW92ZSBjYWxsYmFjaw0KPiBhdCBhbGwu
IFNvIGRyb3AgdGhlIHVzZWxlc3MgZnVuY3Rpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQpSZXZpZXdl
ZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQoNCg0K
PiAtLS0NCj4gIHNvdW5kL3NvYy9hdG1lbC9hdG1lbC1wZG1pYy5jIHwgNiAtLS0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy9hdG1lbC9hdG1lbC1wZG1pYy5jIGIvc291bmQvc29jL2F0bWVsL2F0bWVsLXBkbWljLmMNCj4g
aW5kZXggNzdmZjEyYmFlYWQ1Li4xMmNkNDBiMTU2NDQgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3Nv
Yy9hdG1lbC9hdG1lbC1wZG1pYy5jDQo+ICsrKyBiL3NvdW5kL3NvYy9hdG1lbC9hdG1lbC1wZG1p
Yy5jDQo+IEBAIC02OTIsMTEgKzY5Miw2IEBAIHN0YXRpYyBpbnQgYXRtZWxfcGRtaWNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICByZXR1cm4gcmV0Ow0KPiAg
fQ0KPiANCj4gLXN0YXRpYyBpbnQgYXRtZWxfcGRtaWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+IC17DQo+IC0gICAgICAgcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4gIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGF0bWVsX3BkbWljX2RyaXZlciA9IHsNCj4gICAg
ICAgICAuZHJpdmVyID0gew0KPiAgICAgICAgICAgICAgICAgLm5hbWUgICAgICAgICAgID0gImF0
bWVsLXBkbWljIiwNCj4gQEAgLTcwNCw3ICs2OTksNiBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBhdG1lbF9wZG1pY19kcml2ZXIgPSB7DQo+ICAgICAgICAgICAgICAgICAucG0gICAg
ICAgICAgICAgPSAmc25kX3NvY19wbV9vcHMsDQo+ICAgICAgICAgfSwNCj4gICAgICAgICAucHJv
YmUgID0gYXRtZWxfcGRtaWNfcHJvYmUsDQo+IC0gICAgICAgLnJlbW92ZSA9IGF0bWVsX3BkbWlj
X3JlbW92ZSwNCj4gIH07DQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGF0bWVsX3BkbWljX2Ry
aXZlcik7DQo+IA0KPiAtLQ0KPiAyLjM4LjENCj4gDQoNCg==
