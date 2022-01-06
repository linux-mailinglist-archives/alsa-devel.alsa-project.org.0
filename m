Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019A14868C3
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 18:40:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78A60191D;
	Thu,  6 Jan 2022 18:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78A60191D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641490801;
	bh=dZ2TqDanpl7IAT65KWR8EIV1IffT/ll+QMY5EIlotc0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WJ1J2VmDNewwciMaBz6RypHNFXXTVNTPZ/0piq2Amye1eBbFYeWu7cD744mdVCzSD
	 969RZ+vY29rBNZAj9ROfbzQ7hV+3b7Jgy1d3dNlP+MUxY+EXJkPkqXqozRF09ivsr6
	 n5AKTUA7yA/KYc7xh8wF9mz3KfAjICKsoq8nJiBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E56E0F8007E;
	Thu,  6 Jan 2022 18:38:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF07FF80155; Thu,  6 Jan 2022 18:38:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA038F8007E
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 18:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA038F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="yXueErRm"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206HU9PM023113;
 Thu, 6 Jan 2022 12:38:44 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2051.outbound.protection.outlook.com [104.47.60.51])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqg058-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 12:38:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcH/6dcMJU1cHwzSVhd+lHXcuvxR0F2/MV5HuXSpbJcYSSLATPcVCH3pEnF5LthsnEXXQz+d6by0VLG2w1ywr5Iz/wq4pJuaQjv0/WG4DM21AsTfMQNXlPbk3K5XRsZeDrpP/KFgo8ryG3OtLg5D3TI6o7xncH40On/3D2UguXyXrCcc57jA8PdaoHhavXAiEEEXf8PfmSnAIqlKeGwrm5VkpTD+IbV5cp7gru9p1FrRSFVbM3Je4xift02zIPDOsX+UZWQvBe1150xNJHVVK3kVzsOdriCoC/8MC71wAv0U601cXrlYJ9gEvh6l8rD6232uHO4dfKwc4DyU8iU/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ2TqDanpl7IAT65KWR8EIV1IffT/ll+QMY5EIlotc0=;
 b=cy6w2Hh6/IDUdvIDfNmFsSlTOcys0R4rYbKawDKlevBMiPix8AXv6D1eA33HVgU58SsLd7VeA32T81S7an9SEh4Xtwub65MXlYHY+ErNDSGQKCf7ili0wvWQ9/JM9RGL4PAc0UY80tiry7mRXE1Q3y5sWVBdNq7wl5Zn6emBErwGLmd70/QpW2rYeeN8fNAdEo5N/DyS6JNJMatdHjTwxKdh/cHAIr/FMS0+xR7q2FZnFDUd011Ud178h7WRH7KaN03O+YlidxoUQREq0GEDMQg+t3oDeAcLy1lxpAAD9TwF9nNOj4Yopes19ut93tCJm8y5pirQJW04y3rTz11CXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ2TqDanpl7IAT65KWR8EIV1IffT/ll+QMY5EIlotc0=;
 b=yXueErRmtp51SeW3NACNjOxslEJJvy1f8/7IH6i6JRHGGXYlg9PraNM8aTMPIjYGWuTjHo+Nvl7b/Ys2kpe1WPGCzW6nEIsDqZAiJJIQlJ3YqBJOdnIxYlUwyspzkzSLGu/7sVr4/OfgHgBUUy7ww5zCcKEV9w6WFnp5WeA90ik=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB6439.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:72::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 17:38:42 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Thu, 6 Jan 2022
 17:38:42 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH 2/5] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Thread-Topic: [PATCH 2/5] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Thread-Index: AQHYAoblygXsRm34PUi9ITQsFoqwFaxV7B4AgABXUAA=
Date: Thu, 6 Jan 2022 17:38:42 +0000
Message-ID: <9317ec383e5330e244f2598af8c1ca4c606a98ce.camel@calian.com>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
 <20220105225146.3517039-3-robert.hancock@calian.com>
 <Ydbf4ga5jTluJ3HQ@sirena.org.uk>
In-Reply-To: <Ydbf4ga5jTluJ3HQ@sirena.org.uk>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e55c8f2-0909-451a-91a2-08d9d13b6200
x-ms-traffictypediagnostic: YT3PR01MB6439:EE_
x-microsoft-antispam-prvs: <YT3PR01MB64396F201DBF9F8F15421489EC4C9@YT3PR01MB6439.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rE9ZeWc5oRdGqFrWSxoCrs/TqYpdhJdZu+0DIPupr7HdJkRRxgMdDqyUtlbBfmvEcjjMbc2eY9MQQWkMQFBj24JAwNj1eBEEFhYfDoT+ukrZCbRY3oivwh/fqb+M3vVijKxB+MdKw8KRjbrXqVj5QyZwusnwW5Kp2g+9AYH16yP51uVaAdY46y/OJ4G64tp1At0hDQMitSpiwgnSDTxS+S5pnN7mPGvZRr7rGoE50EMaxniSE2w2ZT2Vikce67SZC297qxQs+sdcstOQKBOk+YVMXRIfvhROtLhemzanBIjLVGefaFivszxJRqucNU3pdto5rfXJnHlqMqFd+7AMI54LlYvhhMtZKTy10OIy7riJ1CGD3W7kk7ywWTa40kD66vbi4t7DrCF5131emowXSzqOWlqocdhVgpPXp7LDn4MEe8f59acZuENiMjZh9/4OKmkSuJKb8QI7moXz0+eQcYPBYNuDHuvIPay0SDeAxdiWLNLM4PztcxScSDwhp2pWcUL6fJ+4ikT0BufPkiZzytswoEIcq4Hh+tErI/fY5wKwZfl4Vbj61/bPdK4Vs/uGgzmERk9LAqcn0XKe4817a5WOPKSCwHrcLlDDlKNWlViKyrqJJkMDue2VEs8N2GEEcvGRsZz89lLhA38irq5b4EJdB7+0AIOOF9IiRXMkox7GBAhHWyizJMp9kVjgeRYur8B6dMxKE7sH9+REDtSCu81ElVUOHaitpAZnUNf5a8HgBFZnIN+Y5mMtG9Gt0Ew8frrrphvx0xM/i6iLiu+SfjD11cZ5zn/fsvP/TmhuOvpBAE9DxLnRpFPqTJuzGSiGqOcXKt3gBVPBAIWFulCN6ZOY1Cu7ewomMq8uFnLR5v4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(8676002)(26005)(71200400001)(2616005)(5660300002)(38070700005)(66946007)(76116006)(186003)(86362001)(91956017)(83380400001)(44832011)(66476007)(64756008)(66446008)(66556008)(54906003)(38100700002)(6506007)(508600001)(6916009)(6512007)(15974865002)(4326008)(2906002)(316002)(36756003)(6486002)(122000001)(99106002)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVJHRll1ZDBnblA1QmlXYk9MS3lOV3d1QTBNaTFTNk81WWtGMG5xUGlJeldj?=
 =?utf-8?B?Zmw3S3I2K2NBc0JJY1N1RGtDYVRUVit4T3pmOG1jdnVXTlRjT2pXTzBDZ3lr?=
 =?utf-8?B?dnVnYTBHNWFXN3dpaEZZVC8rVXFTdkg0QS9FRlhHUE42TnJPSlNLWU1qQjlH?=
 =?utf-8?B?Um8vU0UwL1RBM1FHWnNiVjlvajlPcUdvTDB6WmpwTVdqSTBVTmVPcll1bHRM?=
 =?utf-8?B?dmhJVURPZFkyOVQ4TWtNVUdGY1NDNTlhTjRGaVhNN2RNaExsMklnK3lOMWRk?=
 =?utf-8?B?cmdGVHFKajR0K2hzZ1U0NS9PQ2I3WDJxdmVsZmFQblJtVjNENHd4ZHFvamcr?=
 =?utf-8?B?R1YvNFJYaHN0cGdka0F1WjZLbjcrOGVtT3lackJMV3UwdUhsYzFZdXVqZUE5?=
 =?utf-8?B?YmJuekFOcU9UYXlZbXljd1BmVU94aEJEOXQzallqZldrVXprQ01LZkt2NGlh?=
 =?utf-8?B?bnpVVktMbE1oL0RGTExZZGVHb3FEcmxSZXMxNWpYTTNvQXFwTDZYQnNkK0pa?=
 =?utf-8?B?MFQ5cEFJK0RRN3piTXd0em8yS1pMYmFaMWp4VE93dUdKNlIwUWExMmZZY3lK?=
 =?utf-8?B?R01lejhScWE3SnJ1b2ZKaWF1MkFjcUNwUkNtdlY5Z2dhNG54T0t0RUJ0NW5o?=
 =?utf-8?B?VG9rWGlBOEhnbFhHSDJ3VHFuT3R5eXMxN1RqMS9BL0c0QW5HdWR3c3o1MjRw?=
 =?utf-8?B?V0pJRHNmeVUvdEM5Z2NVK0NYcE5pNXlpV0hpQXZnZUNOVmNQYk1pTjNDZ3V6?=
 =?utf-8?B?QmVad01EdHg4aFd0alFsOHFVRVlLaG1aMTNMTVZNWjc5OHM2Sm0yN20rVjBR?=
 =?utf-8?B?eWpuVkNyT2wvS2tCU0xaejkzSFNMdTNQdDlBNS82bkptUER4NXhTaUxSL2h3?=
 =?utf-8?B?ZmQ2bnphbi8xZ0VBNlhFMEdFaVBuUVpLU2h2b1RDV2ROVitDaktoenFZTXlL?=
 =?utf-8?B?SGpVcktpcXUvdC9VOHdOMkc3dXVhZi9meTNGYk9xeXF4WkE2Q012MWlyWWQv?=
 =?utf-8?B?UjRIL2N0TFltYXR3ckdzdjRKME1VVHhvRytBL2lheVdpZDBtNit0ZEk0OWlq?=
 =?utf-8?B?aWNoVUIzRnZwWE5qd2RXR0c2dEJyRWJmMVVueXYrWEdSd25wN1ZLVmNjdW9s?=
 =?utf-8?B?emxqQ05VWWRYd0Z6NWloaEhuSE5PRC9hTEQyT05aaHpydHhiRkoyeHVSZkVD?=
 =?utf-8?B?Z0lpdTBCcGZNQXJhMjZiUWlCaUovZHVKZVJQQmRkc1dOWE4vSEsrVjlhVXox?=
 =?utf-8?B?R2EyTEZzNis0TjBzMDBqVkRSV0tvdTN3RTBxd3lqV2JaTDB3aTRJM2hEMzdB?=
 =?utf-8?B?UGdWNWxqMHdPQ2Z3OC9ia0lLWUdiV2gvNjVOYnJCdURLdjRiS1BJa2NPRmU1?=
 =?utf-8?B?NFAzdXYzTk04Sk5xTngya1FpRDVseXlRa2daejNJZFBlMlRDcDA1STEzQjBw?=
 =?utf-8?B?aUpYRmIrL1Fta05JNXdRTTZPSTNyMlIyZ3UyazE4QWJJQTI1WjJxWUx0Z1JJ?=
 =?utf-8?B?d240emZ2L1VxTFdIeTh0Q2FIc29oU0ppeHdWbklFa1g1R2VMMEdTelpSRzc2?=
 =?utf-8?B?ZUpKWTV2aFlFd2ZVME1iK3B5aTNBSHVNNEFMWUhoZFZlamN4S0RScVQ2c3Jy?=
 =?utf-8?B?MDBwd3A3aSt4bDErYnlsMFFQUkQ2QmhPNXpXN0w4UWtSM1pYb3h4QUU3bjVE?=
 =?utf-8?B?OFRoUFJLZVo0WHlsVG4vRnJjUHkxdXV1K3FrQWZwTGlqWk1sM3BKTk9RTDl3?=
 =?utf-8?B?eXpmVEZsZ2FtUE1lMHFtN0haZEdsdmdpY3Nvd3A5R0ZkdFUyeGpqOUZCNEdD?=
 =?utf-8?B?N2VKS2lNbi9jZS9mMHcxejZPYmRxVU1CNXgzNHFlYVNVeXZGSVh0SlE2am1n?=
 =?utf-8?B?U0pmQ2ZpRWZLaDhiS1FBRFZiZFRpeUR6OU9TVFVFV3NlMXN3RHM0M3pzQkh0?=
 =?utf-8?B?VmZpUlZRWWtPd0NGQzJ5cUVTMW5VL2I4Wk0xYzY3OGdoNDdOb21aZWlCWm9C?=
 =?utf-8?B?ZVh4MlRaR2dsbWptb3AvRTFiZjBNekFRVFZQY2c4YkcrdFQ5NjhmZVZxYjBM?=
 =?utf-8?B?TkZDVVVURitFK2pBNnVrdjBlQWYzMlY3Rkl1N0dqK2lrL1F4MzNMM1NyejVO?=
 =?utf-8?B?ZkVIQnhLa3VhNlZEeXVkMDZjc3ViMnU0clpPMlhQK0VLT1pHbkJjcFM2Wk5L?=
 =?utf-8?B?Qnl3NUxjQ3pxN3dGQVpuSVBGQXoxTzVVSmlqTXRlMmFDU0tOY2NjdkVDcWU3?=
 =?utf-8?Q?iZ6E75Uc5P7lnK5zprlF7FmSJq6jrFV9qf+5BezOzM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98CEE12D3F0E7E4297D334E86F9EEB78@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e55c8f2-0909-451a-91a2-08d9d13b6200
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 17:38:42.6803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57tJOsmR1jSc4FNvkCLbQiDfn7Y9qOiQ6naCxmZjBFq5/bsCBKcv7jZ3g8cNflj6WkTSAriRa7c3manbLEj2nZ3TgoLUlGCAfnAII/ER5SA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6439
X-Proofpoint-GUID: CYX0G_PlR2CHTnT2TbIAL2r4Y7X0gVvB
X-Proofpoint-ORIG-GUID: CYX0G_PlR2CHTnT2TbIAL2r4Y7X0gVvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_07,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201060118
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "maruthi.srinivas.bayyavarapu@xilinx.com"
 <maruthi.srinivas.bayyavarapu@xilinx.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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

T24gVGh1LCAyMDIyLTAxLTA2IGF0IDEyOjI2ICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBXZWQsIEphbiAwNSwgMjAyMiBhdCAwNDo1MTo0M1BNIC0wNjAwLCBSb2JlcnQgSGFuY29jayB3
cm90ZToNCj4gDQo+ID4gIAlzdHJ1Y3QgY2xrICpheGlfY2xrOw0KPiA+ICsJdW5zaWduZWQgaW50
IGxhc3Rfc3lzY2xrOw0KPiANCj4gVHlwaWNhbGx5IHRoaXMgd291bGQganVzdCBiZSBjYWxsZWQg
c3lzY2xrIC0gY2FsbGluZyBpdCBsYXN0X3N5c2Nsaw0KPiBtYWtlcyB0aGluZ3MgYSBiaXQgY29u
ZnVzaW5nLiAgSXQncyBiZWluZyB1c2VkIGFzIHRob3VnaCBpdCB3ZXJlIHRoZQ0KPiBjdXJyZW50
IHN5c2NsayBhbmQgdGhhdCdzIHdoYXQgc2V0X3N5c2NsaygpIGlzIHN1cHBvc2VkIHRvIGJlIGZv
ci4NCg0KV2lsbCBzd2l0Y2ggdG8ganVzdCBzeXNjbGsuDQoNCj4gDQo+ID4gKwlpZiAoc3Vic3Ry
ZWFtLT5zdHJlYW0gPT0gU05EUlZfUENNX1NUUkVBTV9QTEFZQkFDSyAmJg0KPiA+ICsJICAgIGFk
YXRhLT5sYXN0X3N5c2Nsaykgew0KPiA+ICsJCXVuc2lnbmVkIGludCBtY2xrX2ZzID0gRElWX1JP
VU5EX0NMT1NFU1QoYWRhdGEtPmxhc3Rfc3lzY2xrLA0KPiA+IHBhcmFtc19yYXRlKHBhcmFtcykp
Ow0KPiA+ICsNCj4gPiArCQl3cml0ZWwobWNsa19mcywgc3RyZWFtX2RhdGEtPm1taW8gKyBYTE5Y
X0FVRF9GU19NVUxUSVBMSUVSKTsNCj4gPiArCX0NCj4gPiArDQo+IA0KPiBEb2VzIHRoZSBJUCBh
Y3R1YWxseSBjb3BlIHByb3Blcmx5IHdpdGggaW5leGFjdCByYXRpb3MsIGVzcGVjaWFsbHkgaWYN
Cj4gdGhlIGFjdHVhbCBjbG9jayByYXRlIGlzIGxvd2VyIHRoYW4gbWNsa19mcyB3b3VsZCBzdWdn
ZXN0PyAgSXQncyBtb3JlDQo+IGNvbW1vbiB0byBiZSBhYmxlIHRvIHRvbGVyYXRlIGEgaGlnaGVy
IGNsb2NrIHRoYW4gc3BlY2lmaWVkLg0KDQpVbmtub3duIGF0IHRoaXMgcG9pbnQgLSB0aGUgdGVz
dCBzZXR1cCBJIGhhdmUgaGFzIGEgZml4ZWQgc2FtcGxlIHJhdGUgc28gSQ0KY2FuJ3QgcmVhbGx5
IHRlc3QgaXQuIFRoZSBkb2N1bWVudGF0aW9uIGlzIHVuY2xlYXIgb24gZXhhY3RseSB3aHkgdGhp
cyByZWdpc3Rlcg0KZXhpc3RzIGFuZCB3aGF0IGl0J3MgdXNlZCBmb3IsIGl0IGp1c3QgaW5kaWNh
dGVzIGl0IHNob3VsZCBiZSBzZXQgZm9yIHRoZQ0Kc2FtcGxlIHJhdGUgdG8gTUNMSyBtdWx0aXBs
aWVyLiBBbGwgSSByZWFsbHkga25vdyBmb3Igc3VyZSBpcyB0aGF0IHdpdGggaXQgbGVmdA0Kc2V0
IHRvIHRoZSBkZWZhdWx0IG9mIDM4NCB3aGVuIHRoZSBhY3R1YWwgbXVsdGlwbGllciBpcyAyNTYs
IGl0IGRvZXNuJ3Qgd29yaw0KcHJvcGVybHkuDQoNCj4gDQo+IEl0J3MgaW50ZXJlc3RpbmcgdGhh
dCB0aGlzIGlzIG9ubHkgZm9yIHBsYXliYWNrLg0KDQoNCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNl
bmlvciBIYXJkd2FyZSBEZXNpZ25lciwgQ2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3
LmNhbGlhbi5jb20NCg==
