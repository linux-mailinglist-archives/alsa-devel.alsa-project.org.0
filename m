Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3D83493CD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 15:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D7551660;
	Thu, 25 Mar 2021 15:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D7551660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616681588;
	bh=8HThyyo95GylefnaGB6H8UfvrkWt1OR3QGmMtPI+lSI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KyhU807w7P6drzQplgINoSYVgKzKngmquwFQw1ZhWPZ1tUBslRh1+n0HgvdJZsrRP
	 efBsAlFTp4WocSNDK5MkMuP495Uj8/EG2L0bRclRUEnGbg14Jpw7ykh2sgaDBHGtX+
	 kPUxcv842dctJAgyvCpN+WUYxua/R+XYy8h9NwG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74831F80268;
	Thu, 25 Mar 2021 15:11:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C394DF8025F; Thu, 25 Mar 2021 15:11:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74D11F800FF
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 15:11:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74D11F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="oRN63F5F"
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PE6viV029451; Thu, 25 Mar 2021 10:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=8HThyyo95GylefnaGB6H8UfvrkWt1OR3QGmMtPI+lSI=;
 b=oRN63F5FpRo5wrqyaQvoIdA93HRuuBKIlwTV2APegM+KAgx24PJ2PmdNJbvRUck69igj
 sOPG5fXvnxrNCwqwZdCOWYbjk5nW05zRUbLWnsxxbpK+8CroR2AL1AeGjkUBfBkVHMr9
 VeKKlPOLGxgFuVos6IqbLR45wYq9vbAkxYLpDiQkzA0frzfT93yq8H0cloMcauR7ebSg
 yZGWDMqUj1EoWTE6AneBGH6ulchqO14kaAs9l2tyTi6YxFM1J1fEfEO8LlseuKpNP+8x
 x4hrlj1sSGIQzE1fiujnT6OgbepjXeWbsDgVa9f2FDwyIXUa0SnFaCBOv5cnWaWHtGSo hQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 37dc6x2deu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 10:11:25 -0400
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PE9wDm166889; Thu, 25 Mar 2021 10:11:24 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0b-00154901.pphosted.com with ESMTP id 37dx1jbvpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 10:11:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jD1Pu0jySo0ONoX2K1OGPg4xxTziKEi+GBiCxaRG7D8w+HpNCsI6mEb9Y7fxR2NSKSDAIQGYNZLE81Dm7jO0koDfAB23ZuCqAfi6qxHTitqFfKcj0ZJ+P+4z5yo3Xu5IKAMIzyrzldy/IfZhla/3aw1mb06FuaXGVwiAO5oiSOtKdfTjnNZQnQGuJuyv7DdCfCp49wOk+LEniRMU+JmsyW7NmsCviRIJSYTI6GhNmStSP1ecNKtqa6jIQAI3XX3W9kNsoAAV7LiuOItlzi0r1sKM/rblFZlyXy9pNFdqbHJtnD/KteIhGm3PIVj5TZClzjtY/SlQL7EfaxnfPEDJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HThyyo95GylefnaGB6H8UfvrkWt1OR3QGmMtPI+lSI=;
 b=CAqzZK6uH9ChjTdyTv/hdtssx54GOyJ3rNoxzLKDO5U2d8mawkwDMqdKr7CMVa1fOoNRoLKfDTrBTKfi0aJQeTizpMmQrrToL/amVB7wS7Z1WlQ5vjtQpf0kQv8EX7BlmQb1ykK4L07IbYn34+z9Higw9rfoKLgmrkS9piB/EMyK50cWxFR/5A5iUrUmgrP20Y0uMM9ej4PGQa2XCs4BXWIuJ3Cm/+1SPjSHB+ehYGbSmefn9hcoDwyPyULuTmR6OULMW6M1b7c05iVM9IRhfJQS53PapDIyKnDiGdyLl4+Kp2lttII49OCzyFGZUQkoll3mM58Kz/RpBtRLOc9A4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BY5PR19MB3665.namprd19.prod.outlook.com (2603:10b6:a03:1c3::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 14:11:22 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%7]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 14:11:22 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Limonciello, Mario"
 <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
Thread-Topic: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
Thread-Index: AQHXDn6s4PfzwhTth0aZP8v1kYirtKp6YrWAgBVxBJCAAGEogIAABqmAgARUF5A=
Date: Thu, 25 Mar 2021 14:11:21 +0000
Message-ID: <SJ0PR19MB452851406C9B48DE688F1C1384629@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210301093834.19524-1-Perry_Yuan@Dell.com>
 <20210308172409.GF4656@sirena.org.uk>
 <SJ0PR19MB4528847687FEEE4A4DED8E3F84659@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <604693cc-08c7-2b5f-632a-58ed537c54a0@perex.cz>
 <5cad3045-7948-3282-c999-926095818d5f@redhat.com>
In-Reply-To: <5cad3045-7948-3282-c999-926095818d5f@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [114.84.248.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc1ea761-fba8-4917-5dd4-08d8ef97de3d
x-ms-traffictypediagnostic: BY5PR19MB3665:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR19MB3665FD00E3199D520B9E84C584629@BY5PR19MB3665.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oVM7pTZPo2QWt7ZWUEm6vuOYDsWWw7G7mbZoptGBpVhBWW0/aqZl9FKm3m2sIq034FLbuXcKeqHt01xiG6vcXohgwx7CiC/O0Ot507j3oMlNLxcFbZKRWDOD/AXpYGIA1XPH6ddd4Ss+rSLhKR9gk4PkOS56bh2HNNlnz6HkOk3T8s6+hydSKSUeE/6xexSkoausrQdCi7DwgNoITISmVDCDmi6vfYZtER7wNoG+tfdb64GoMwce1XBsdZczKs/XbxR+Tt4CCe7/bxLNSOQozxaAxCIm7QWgmHFLgiE7cer2z/uxoR+BkgR44sT8KjevuLNdlUK98Kp15NSD0sD6mFlvP1pKOAfyKYB+YBGFCJKGLKlDIePQNqBaNybJeRvNiqjzBdOJTJXgRKcduNA4orn/SEwyI8V8yoViNa+bXO0U61N+WBSwPbjIr5BAIu2VJPusIkI8/HOnyZIA70SYDTz87GQ+LIxxUmgsnJHV9qrsXeSZqibE9m3doJsitwW90Tu+vVlUfXOhB24QfvBXhO+7sjwOFflwWoTStnYYrtp3rB9uGK7hqj7TlCV7C3ogMKARJepzULItWXiqx3T2xzCtG8EJCCmE5Tkm7ngpwU9huRSVJ4uj/TdvfwrQat4VHjUtVFbWwthHT43IiL7OZ7iZJeXKxCkkXL/LAzANEXJcAawAQCse0LrtIJRqzQNwNnNRpUg+di+NncFDOX/ZAbRYcfCoBgZBh3UE/KJwypQ3yduKOaDTM89K82A3H8KB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(6506007)(786003)(64756008)(76116006)(54906003)(52536014)(66946007)(71200400001)(53546011)(66446008)(66556008)(186003)(2906002)(316002)(26005)(66476007)(86362001)(7416002)(33656002)(110136005)(8676002)(8936002)(55016002)(83380400001)(5660300002)(6636002)(4326008)(966005)(478600001)(9686003)(38100700001)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Sk5yZU4zYUlLYjNtRmFrNGhYcjZJYUY2TzNMMDNROGFOdFJxc2RnbkxQbTQy?=
 =?utf-8?B?RStYVzN5dklZd2ZDLzlSdmdMeVgvdXg0UFJWNW9oL29pNFZXNTVtR29NQWNC?=
 =?utf-8?B?YTFwM3JuSk9aU3dIOC9NUUN5S29Yd2syTXhURnRYRGl2VlpFV0hZYkVudVdu?=
 =?utf-8?B?VzFzOEJmbEdCU0I0ZENPV2R1R1hENlYxV2lWbEZRcGZ1V25Pa0pDbUJ2Uzgz?=
 =?utf-8?B?M2RZUjc3ODBBRk5GTXY1Q3hyZGpuU1JFWVRYb3BNS3I3ZE1PZExZTHJNNjJT?=
 =?utf-8?B?SVh3QjVXMDd5YVZkY3BMRjU3SjZiVXMvd05mem1WYThPTkRLRHYvbGhqVEg4?=
 =?utf-8?B?eGdSMXpXbkQxQjJBWjgxM2U1aUJleldaK3ZPQVY0aENYMmJFN25kYklPL0dE?=
 =?utf-8?B?QUcrWmNPcmxraHFnL0U5Tjg1SXY2amF3RVhIQ3NtU1hyTW1WUkMyTklSckVx?=
 =?utf-8?B?KzkvMEZzeU5UUE1BTzJPMVVxYXp1dTZHcFJCY2FkNnlxMFFLUzQzeTFVTkNG?=
 =?utf-8?B?ZlpQK2FPQ3l0UlZoUG5TSDhoTnBOM0crcWQrR0tJdzZBNndYODRXZUhtSjVo?=
 =?utf-8?B?bit3ZG1jS2FhWkFQbjN1M2dCWmI5dTRucGswcDZSTEdnTkg3K3U3VC9WNUxo?=
 =?utf-8?B?bnhrUDJ3QjcvOHBRQnNWU1V4UjJ0MFA2ZUNHdHE1RkdvZ2I1ZEgyZVBSeGpG?=
 =?utf-8?B?UTBmQTdmZVFSQ05qYkphaVdOa3JxSEZlVlN6STlvQyt2UjBRQVQ1eXRJNkZR?=
 =?utf-8?B?anhVWnBIS2FHWVUyRk11TmxEb2JRNHcrYkJyQ1BObzQzd1lVOXpVWitsRjhU?=
 =?utf-8?B?NnRzc3lRVzNYYWhnRzhxNmd1U01SZUk4NmdMMHh6UHdkTVBGeUw1NSs4UUx2?=
 =?utf-8?B?bTJndlZJM3NBZWk0UjdVNngrUk1zbDEvSVhnRVZDUUcvL2FUbGFGOUYveDJi?=
 =?utf-8?B?WW9JVWNjNW9CM0h5eGJWL2dTNDk5TWQ1RWhnS3picUxRR0NwK2E2TERpYUl2?=
 =?utf-8?B?L1JhM2d5dFIveEo5Q3dVUGJVM0pwWmwya2Fqd2w1TkdBQWZzWE1ic2IyOWsz?=
 =?utf-8?B?U2ZnRFM1bEQvaFZTSEJWaDhUM0d4S3VtU2trei9DQVFZZ0lDZFlZcnlQT1Rv?=
 =?utf-8?B?VkxEVW1zekJKYlJRcGYxanhmVCtQVi93TnpwM2RjRkhuQWMxNHpOKzFlWGoz?=
 =?utf-8?B?QjI2MkdseWFlUDZzQkpySFIrQ3Qwc0RMamJSeVQ3WWlxUHVVTDdldStZRmFC?=
 =?utf-8?B?dVBIVEd0L0FxbVNja2JPV2JoWlNmRVN6bG5VaEV1RDZaeGJUZVlyZGRxSWlk?=
 =?utf-8?B?SXBDVExqa2hlRzJqV2w2RE45TnFNaEJMOSsrMFVoVmRUdUl4QXduekV2NVZF?=
 =?utf-8?B?YnVoYktxc2JrSkxNRlVBSTA5a0NLaDZPVkpoRGd5Rnk0RU5jTGlDb3JSdzU2?=
 =?utf-8?B?V2RqeFlWa0ZnL2ZpYm8vbG51T3hYd21iczhIU2VBME5teCtCL2tOa3BWK1dL?=
 =?utf-8?B?TzR3c29neUF6b2QzenRqMkgwSWFVTkQvc2Z6SFl4c2dLWW15TlJ2R0NRbWtl?=
 =?utf-8?B?T3o2OU01eUphRE5mcUh5RzhYQnV5bDFQVnhWY0dnRlRXejZsSkQ3bVpreDlv?=
 =?utf-8?B?VGhrOHV5S0lLdHBCRnRYSzFUSHpTQXpXODRHYnE1NGRoWnExQTJvME5WZVdC?=
 =?utf-8?B?YzFnMEdTY0wzc1JzNG9rK2R1Nzd5enljRVpWVUQyOGZQbWVXVnppKy9BaVMx?=
 =?utf-8?Q?fzLoJ0EYM4kpypgPH1Ez9VsJR0szZ186V9w0nKv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1ea761-fba8-4917-5dd4-08d8ef97de3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 14:11:21.8816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UU7jh8vXb9cAtooXEco5slQI5LpmTyhOjB87/xTtkdUBOU2Jg00+cv1bg2eEchAZqDWjNGU3ha3yKuCiGjsoOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3665
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_03:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250107
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250106
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
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

SGkgSGFucw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMjIsIDIw
MjEgMTE6MDIgUE0NCj4gVG86IEphcm9zbGF2IEt5c2VsYTsgWXVhbiwgUGVycnk7IE1hcmsgQnJv
d247IHBpZXJyZS0NCj4gbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb207IExpbW9uY2llbGxv
LCBNYXJpbw0KPiBDYzogcG9icm5AcHJvdG9ubWFpbC5jb207IG9kZXJfY2hpb3VAcmVhbHRlay5j
b207IHRpd2FpQHN1c2UuY29tOw0KPiBtZ3Jvc3NAbGludXguaW50ZWwuY29tOyBsZ2lyZHdvb2RA
Z21haWwuY29tOyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi8yXSBBU29DOiBydDcxNTphZGQgbWljbXV0ZSBsZWQgc3Rh
dGUgY29udHJvbA0KPiBzdXBwb3J0cw0KPiANCj4gDQo+IFtFWFRFUk5BTCBFTUFJTF0NCj4gDQo+
IEhpLA0KPiANCj4gT24gMy8yMi8yMSAzOjM3IFBNLCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6DQo+
ID4gRG5lIDIyLiAwMy4gMjEgdiAxMDoyNSBZdWFuLCBQZXJyeSBuYXBzYWwoYSk6DQo+ID4+IEhp
IE1hcms6DQo+ID4+DQo+ID4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gRnJv
bTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiA+Pj4gU2VudDogVHVlc2RheSwg
TWFyY2ggOSwgMjAyMSAxOjI0IEFNDQo+ID4+PiBUbzogWXVhbiwgUGVycnkNCj4gPj4+IENjOiBw
b2JybkBwcm90b25tYWlsLmNvbTsgcGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29t
Ow0KPiA+Pj4gb2Rlcl9jaGlvdUByZWFsdGVrLmNvbTsgcGVyZXhAcGVyZXguY3o7IHRpd2FpQHN1
c2UuY29tOw0KPiA+Pj4gaGRlZ29lZGVAcmVkaGF0LmNvbTsgbWdyb3NzQGxpbnV4LmludGVsLmNv
bTsgTGltb25jaWVsbG8sIE1hcmlvOw0KPiA+Pj4gbGdpcmR3b29kQGdtYWlsLmNvbTsgYWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnOyBsaW51eC0NCj4gPj4+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+ID4+PiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY0IDIvMl0gQVNvQzogcnQ3MTU6YWRkIG1pY211dGUgbGVkIHN0YXRlDQo+ID4+
PiBjb250cm9sIHN1cHBvcnRzDQo+ID4+Pg0KPiA+Pj4gT24gTW9uLCBNYXIgMDEsIDIwMjEgYXQg
MDU6Mzg6MzRQTSArMDgwMCwgUGVycnkgWXVhbiB3cm90ZToNCj4gPj4+DQo+ID4+Pj4gKwkvKiBN
aWNtdXRlIExFRCBzdGF0ZSBjaGFuZ2VkIGJ5IG11dGVkL3VubXV0ZSBzd2l0Y2ggKi8NCj4gPj4+
PiArCWlmIChtYy0+aW52ZXJ0KSB7DQo+ID4+Pj4gKwkJaWYgKHVjb250cm9sLT52YWx1ZS5pbnRl
Z2VyLnZhbHVlWzBdIHx8IHVjb250cm9sLQ0KPiA+Pj4+IHZhbHVlLmludGVnZXIudmFsdWVbMV0p
IHsNCj4gPj4+PiArCQkJbWljbXV0ZV9sZWQgPSBMRURfT0ZGOw0KPiA+Pj4+ICsJCX0gZWxzZSB7
DQo+ID4+Pj4gKwkJCW1pY211dGVfbGVkID0gTEVEX09OOw0KPiA+Pj4+ICsJCX0NCj4gPj4+PiAr
CQlsZWR0cmlnX2F1ZGlvX3NldChMRURfQVVESU9fTUlDTVVURSwgbWljbXV0ZV9sZWQpOw0KPiA+
Pj4+ICsJfQ0KPiA+Pj4NCj4gPj4+IFRoZXNlIGNvbmRpdGlvbmFscyBvbiBpbnZlcnNpb24gc2Vl
bSB3ZWlyZCBhbmQgY291bnRlcmludHVpdGl2ZS4gIElmDQo+ID4+PiB3ZSdyZSBnb2luZyB3aXRo
IHRoaXMgYXBwcm9hY2ggaXQgd291bGQgcHJvYmFibHkgYmUgY2xlYXJlciB0bw0KPiA+Pj4gZGVm
aW5lIGEgY3VzdG9tIG9wZXJhdGlvbiBmb3IgdGhlIGFmZmVjdGVkIGNvbnRyb2xzIHRoYXQgd3Jh
cHMgdGhlDQo+ID4+PiBzdGFuZGFyZCBvbmUgYW5kIGFkZHMgdGhlIExFRCBzZXR0aW5nIHJhdGhl
ciB0aGFuIGtleWluZyBvZmYgaW52ZXJ0IGxpa2UNCj4gdGhpcy4NCj4gPj4NCj4gPj4gQ3VycmVu
dGx5IHRoZSBzb2Ygc291bmR3aXJlIGRyaXZlciBoYXMgbm8gZ2VuZXJpYyBsZWQgY29udHJvbCB5
ZXQuDQo+ID4+IFRoaXMgcGF0Y2ggY2FuIGhhbmRsZSB0aGUgbGVkIGNvbnRyb2wgbmVlZHMgZm9y
IE1JQyBtdXRlIExFRCwgZGVmaW5pdGVseQ0KPiB0aGUgcGF0Y2ggaXMgYSBzaG9ydCB0ZXJtIHNv
bHV0aW9uLg0KPiA+PiBUaGVyZSBpcyBhIGZlYXR1cmUgcmVxdWVzdCBkaXNjdXNzaW9uIHdoZW4g
d2Ugc3RhcnRlZCB0byBpbXBsZW1lbnQgdGhpcw0KPiBzb2x1dGlvbi4NCj4gPj4gaHR0cHM6Ly9n
aXRodWIuY29tL3RoZXNvZnByb2plY3QvbGludXgvaXNzdWVzLzI0OTYjaXNzdWVjb21tZW50LQ0K
PiA3MTM4OQ0KPiA+PiAyNjIwDQo+ID4+DQo+ID4+IFRoZSB3b3JrYWJsZSB3YXkgZm9yIG5vdyBp
cyB0aGF0IHdlIHB1dCB0aGUgTEVEIG11dGUgY29udHJvbCB0byB0aGUNCj4gY29kZWMgZHJpdmVy
Lg0KPiA+PiBXaGVuIHRoZXJlIGlzIG5ldyBhbmQgZnVsbCBzb3VuZCBMRUQgc29sdXRpb24gaW1w
bGVtZW50ZWQsIHRoaXMgcGFydCB3aWxsDQo+IGJlIGFsc28gb3B0aW1pemVkLg0KPiA+PiBUaGUg
SGFyZHdhcmUgcHJpdmFjeSBmZWF0dXJlIG5lZWRzIHRoaXMgcGF0Y2ggdG8gaGFuZGxlIHRoZSBN
aWMgbXV0ZSBsZWQNCj4gc3RhdGUgY2hhbmdlLg0KPiA+PiBCZWZvcmUgdGhhdCBmdWxsIHNvbHV0
aW9uIHJlYWR5IGluIGtlcm5lbCwgY291bGQgd2UgdGFrZSB0aGlzIGFzIHNob3J0IHRlcm0NCj4g
c29sdXRpb24/DQo+ID4NCj4gPiBQZXJyeSwgaXQncyBhYm91dCB0aGUgbWFjaGluZSBkZXRlY3Rp
b24uIFlvdXIgY29kZSBpcyB0b28gbXVjaCBnZW5lcmljDQo+ID4gZXZlbiBmb3IgdGhlIHRvcC1s
ZXZlbCBMRUQgdHJpZ2dlciBpbXBsZW1lbnRhdGlvbi4gV2UgbmVlZCBhbiBleHRyYQ0KPiA+IGNo
ZWNrLCBpZiB0aGUgcHJvcGVyIExFRCdzIGFyZSByZWFsbHkgY29udHJvbGxlZCBvbiB0aGUgc3Bl
Y2lmaWMNCj4gPiBoYXJkd2FyZS4gT3RoZXIgaGFyZHdhcmUgbWF5IHVzZSBSVDcxNSBmb3IgYSBk
aWZmZXJlbnQgcHVycG9zZS4gVXNlDQo+ID4gRE1JIC8gQUNQSSBjaGVja3MgdG8gZGV0ZWN0IHRo
aXMgaGFyZHdhcmUgYW5kIGRvbid0IG1pc3VzZSB0aGUgaW52ZXJzaW9uDQo+IGZsYWcgdG8gZW5h
YmxlIHRoaXMgY29kZS4NCj4gDQo+IEkgdGhpbmsgdGhpcyB3b3VsZCBiZSBhIGdvbyBjYW5kaWRh
dGUgZm9yIHRoZSBuZXcgZ2VuZXJpYyBMRUQgaGFuZGxpbmc6DQo+IA0KPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbHNhLWRldmVsLzIwMjEwMzE3MTcyOTQ1Ljg0MjI4MC0xLQ0KPiBwZXJleEBw
ZXJleC5jei8NCj4gDQo+IEFuZCB0aGVuIHVzZSBhIHVkZXYtcnVsZSArIGh3ZGIgYW5kL29yIFVD
TSBwcm9maWxlcyB0byBjb25maWd1cmUgdGhlIExFRA0KPiB0cmlnZ2VyIGZvciBzcGVjaWZpYyBt
b2RlbHMgZnJvbSB1c2Vyc3BhY2UgPw0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEhhbnMNCj4gDQo+
IA0KPiANCkJlY2F1c2UgdGhlIFNPRiBTRFcgZGVzaWduIGhhcyBubyBtaWMgbXV0ZSBsZWQgY29u
dHJvbCB5ZXQuDQpTbyBJIGFkZCBvbmUgc2hvcnQgdGVybSBzb2x1dGlvbiB0byBtYWtlIERlbGwg
cHJpdmFjeSB3b3JraW5nIGZvciBub3cgDQpEZWZpbml0ZWx5ICwgdGhhdCBpcyBuZXcgc29sdXRp
b24gSSBjYW4gYWRkIG15IHBhdGNoIG9uIHRoYXQgdG8gdGVzdCBhcyBvbmUgdXNlciBjYXNlIC4N
CldlIHJlYWxseSBuZWVkIHRvIHRha2UgdGhlIHNob3J0IHRlcm0gc29sdXRpb24gd29yayBmb3Ig
c29tZSBzeXN0ZW0gd2hpY2ggc3VwcG9ydCBuZXcgU09GIHNvdW5kd2lyZSBoYXJkd2FyZSB3aGlj
aCBoYXZlICBkZXBlbmRlbmNlIG9uIHRoZSBNSUMgbXV0ZSBmZWF0dXJlDQpNZWFud2hpbGUgd2Ug
Y2FuIGNvbnRpbnVlIHdvcmtpbmcgb24gdGhlIG5ldyAgInVkZXYtcnVsZSArIGh3ZGIgYW5kL29y
IFVDTSBwcm9maWxlcyIgc29sdXRpb24gYXMgdG8gcmVwbGFjZSB0aGlzIG9uZS4NCklmIHdlIGFn
cmVlIHRoYXQsIEkgd2lsbCBzdWJtaXQgYW5vdGhlciBWNiBhZGRyZXNzaW5nIG5ldyBmZWVkYmFj
ay4gDQoNClBlcnJ5DQoNCg==
