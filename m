Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E6C2F4150
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 02:46:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28EC21688;
	Wed, 13 Jan 2021 02:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28EC21688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610502399;
	bh=Eqn7e2gW62EWPcUMMXHbkKACR5MetC+VzyKAhMNS/nA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UIlRIpYTsVnWxk3PhFaUkcVKpLeye+kxbWPLVQHXNhhqXlebZKHz4MhWxKuHDnlLz
	 7ycpxd0Lwzl6b8Sy65UPI2LRuSIcU93mhzi/TjjxmwoOv4CQqBLIArZsxxjdEkKO5H
	 Og1QybMC2fD6E8r6q2q50ymE0X71gfMtkn8NiPJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87403F8025E;
	Wed, 13 Jan 2021 02:45:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAABEF8025E; Wed, 13 Jan 2021 02:45:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51CE5F80113
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 02:44:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51CE5F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="Ygdw16+B"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="hK9RvLV2"
Received: from pps.filterd (m0170395.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10D1hohX029514; Tue, 12 Jan 2021 20:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Eqn7e2gW62EWPcUMMXHbkKACR5MetC+VzyKAhMNS/nA=;
 b=Ygdw16+B/S4pxhj3/mmZtYTR84VrcHAAfxaIMqaL5km1za4IAyr06eOZEmW+d7oRBcqq
 3wto7MjhoXO61md9QucBaL8c57XYimWpXPM1nckji7y+zj25E1lhwjYCdYya9QabgXCT
 jv5kLPY3l3P/4pJmRFSLsEauv7wl43lF8/qpQNUVkBnegPQN/TVmigy+bi5aczWgXRn7
 jg9rTBww5CvQAILzQj69ZQ9GdaQGFTCluP1PYD2f3IuRJQ+MLHFhh2pKifmSOiNnYOJT
 syz+vFU+x4oL94KV7Tn/WJoYXzySD1S89VSsp1338v42eHhwbnHyXhRkc6E6IY8jLPAY gQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com with ESMTP id 361fyb9fe8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 20:44:51 -0500
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10D1eBcM017192; Tue, 12 Jan 2021 20:44:51 -0500
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0b-00154901.pphosted.com with ESMTP id 361q70g54x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 20:44:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAu6jzOnTfjP90e+l8mwckGgKa/tfUyD09wltvhgKGoW7N9uRIRc8ZdwZozp1dBXk1r1KF+2lAvOLeEBDqJXmjIh1/kOaz1oCNv98nYexdcD2UN9SAvx4mBBE2SxDmcyshgKMzuuQckEJwWlB0K69cu4gGx690ztdsIehsbJpP2C37PXDK6OwnuOp27aSQOJVBxlM3TlNU867CTxlgwUVg0ZdIuijmFpwmoEH+S5XsljWS8VCCjfZqOCHaJeB7RisxU2ZhEbWsg5GzivZ5YDejgWC/FAyJoRqppJUlotgTocsKiTOz38iMQGoWhOliN6SDvX1WcVKbH7JhmTiyK2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eqn7e2gW62EWPcUMMXHbkKACR5MetC+VzyKAhMNS/nA=;
 b=CeGneQdRbSa6Y7vswMiOp7hj158q9Mv8ULav+15xXn3tCE9ltvSXuunOfBdBpRSfk/vxlSvaMztcGMoYjaE97rJTOy9dm2X9Kqer4YXb/39le0cQYeJaB0fmjzArhHD6yk9jvOyLVoGLFg6c4VUNo/Oes5+8kggNFEfxUUVkstAX/ToLR7FLitQb1NRv4j71IYNFzj+EGx2d3D4RDPBeqM4zjKx5LTAIkmzLABbzOWYC6dk4Kh0dFTeto1Zk/CJfZgvYZ8kUr2jbmVCbeo90aPE4F3+/ChFGgYUpwqzBVF0ONSl8UqojD2k2IrGBKyQgFtAdJlj55E4MQC7qc3+/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eqn7e2gW62EWPcUMMXHbkKACR5MetC+VzyKAhMNS/nA=;
 b=hK9RvLV2Q1Yy8TGFl9kr5K99LPQ3KxODmaXC1637uigjJXcndcinars+T819+q6AKwwqnlcytCLYzIBYLcVs3StNV6fR5X/tqRG2IbmuN6rypimzDGFDVqckuNQqHJhx83O91JfJepQBIcQ0Tfo1v3JKDW0CGBHCnn/m4v4Eza8=
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BY5PR19MB3205.namprd19.prod.outlook.com (2603:10b6:a03:18c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 01:44:48 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::f49a:eb87:f48b:9e13]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::f49a:eb87:f48b:9e13%5]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 01:44:48 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "oder_chiou@realtek.com"
 <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: RE: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Thread-Topic: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Thread-Index: AQHW3R7JEBZDYV5120aC5Vics2sfNKoizuyAgAC7FFCAAJ95AIAAtLhQ
Date: Wed, 13 Jan 2021 01:44:48 +0000
Message-ID: <SJ0PR19MB4528FA846E29C0BB197725CA84A90@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20201228133831.17464-1-Perry_Yuan@Dell.com>
 <a12075b1-09f3-a993-eace-008224ca5f52@linux.intel.com>
 <SJ0PR19MB4528225B226C4F9AA7F7ECBE84AA0@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <BY3PR19MB49130372226D65A235757BA1FAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
In-Reply-To: <BY3PR19MB49130372226D65A235757BA1FAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-Mentions: pierre-louis.bossart@linux.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Perry_Yuan@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-12T05:27:54.6998913Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=1db1f06f-0d4f-4b2c-88ae-b672c477372f;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: Dell.com; dkim=none (message not signed)
 header.d=none;Dell.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [114.84.248.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c94bbd0-c385-4fb9-1a09-08d8b764d005
x-ms-traffictypediagnostic: BY5PR19MB3205:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR19MB320549870825B87AE962CB3684A90@BY5PR19MB3205.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GJDbAWpwBS5ufwRNYzxtgnSzWHRkjs676WlcBHnvguyTT57x9SpDhK4i5FTL1phQQvYW2x1iPARtAfIR0xqkdaW5zAbxo79BZ6rwcXt5fkrQmHsF2BlYKmuoVE1fJlRNlbT1VNeh63uTI0bZxi8cTwimwb1G/mKcBVKiYhvjaUwz8O4onqL02CIz8e9y7jL7sYbG0xHEOULvecoCflZXhupmbmGBqGOw+lLjrBEHBt5TGp0Q0SHvl+5hlByhy2IJQqFtkPF+1L8B4ThmQIdzpDjlBJrkXpS19Ghggr2rUNL7CBjB8dg10EKKU0xYL2X74/nZASmunPFqpIMZ2eGAQisb8LpADupYQX0pxJNElZKjlNjolykDwSv65ZpzG1bbjfSPtT0wnDH7UcErbbD0Mg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(2906002)(33656002)(83380400001)(786003)(86362001)(71200400001)(6506007)(8676002)(8936002)(478600001)(4326008)(9686003)(66446008)(5660300002)(186003)(53546011)(55016002)(66946007)(66476007)(64756008)(52536014)(66556008)(7696005)(76116006)(26005)(316002)(54906003)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cFVVUitTc0ZCNVF5aE1pTUlzQzJDb1UrTGFOcmNSSlArRzZIcUlXZ2hkRjZh?=
 =?utf-8?B?aTVRa1MzaXJ2Tk9QWkE3Q2RvY3V2SFdTM09ZUWRSUUNxd1VnMzFrMUlFakJu?=
 =?utf-8?B?YWhHM1pQbWVMQlpRNzJYUk5OMXBRb1dISXBPMjg3VHVkbE5oOXJvSGYxSVlo?=
 =?utf-8?B?SGJrT3VzM0E2SnlpVFBnc0F0dzRvM3poWkQ5cmNjbEw0eml6d1BxYld1NlNv?=
 =?utf-8?B?cEV4enppQlhIODYrTzJzRGx1WjZRZC8zUmo2MnhuTjB1bnVQSm5SeDFHRTlo?=
 =?utf-8?B?Mm5mYXdsdmYwWGl6aFVQdnNJMVhOQkI0L3gyOGFKUVFLcVByMURSejhrYUxZ?=
 =?utf-8?B?Q1dqaGRLU1ZmeExOTlY4V1MxSXZTVU1QenJjeVdaVERwaENjWkExY09YR0gv?=
 =?utf-8?B?ZkFCSVJOSlFnVjF0NXhFSGFHRmcvYmljcEFRa1JMRGxpeU1wT3lIWFpmQWVS?=
 =?utf-8?B?ck5kRUZKS2ZUaFBWbkpSTDVsWTZ4TUN0TTR4Z0VINEdlU3lDVnVuLzVTbk5P?=
 =?utf-8?B?MFFwK25IdUh0eEF2WEFQSnJKY1lUQk9KTVYrV0txR2ozZnl4Zjh5ZS9aOXgx?=
 =?utf-8?B?b3habnJzY2pockpLd0c4VytSeXlyOElDWDFxQkR1SVlwSnlpcnA4dk9hT3BW?=
 =?utf-8?B?M2NoMElvcklHMDJHbXBzUGdvQnp6ZVJQSnVydG5NTjFjRWQ3eXhYbnVUN3Rs?=
 =?utf-8?B?c1AzdlQ4OVJsNm93Y2FWWStUOXFOamp4SHRIZDJBRTJmc2JSRW1ackM4ME4y?=
 =?utf-8?B?R2Qrb1c1dE5ueC91emt2ZTFBem9MRU1ZamdmalZpQms2all5L2MybnlmT3or?=
 =?utf-8?B?UjkxNnNEVEdqZGJ4VGJ5N2V4VXZEaUloWVVZczBvMVlpa3VNM2h4aG1OcEtM?=
 =?utf-8?B?OWZRNGZvVEczRHFIdkR3K1EwUVZRWDArY2dNRDE3dGJ3ZW12cXBlYTE2cTMr?=
 =?utf-8?B?SE11U1UzT1hYOVhMdmZUZnh4TkxGT3RNRFp4cGZiYnd2clc0MGlONDZqcW5w?=
 =?utf-8?B?cWtXV2QyUTJzNkd1cExKQWxKczZPSWtMclhLTVJtaUpKM2RuSjQyOGZwVnVm?=
 =?utf-8?B?NGJaN0NlbE5JbFpzU3B0N292V2xCNU5CV2VRUExsWmhZTk1DWlJTc2ZFWGtq?=
 =?utf-8?B?dStDdlNUWXRaZjNUN2lOL3JkckNLZTRCa0lkaGRrU2dpOWpYZHJLTGdZN2RZ?=
 =?utf-8?B?RGFIWisxNndtK1JiZG9NQmE4dzRkbkxaalhsOXNjTjZWTHFaNzNnV2lMZ05Z?=
 =?utf-8?B?LzQzeHU3YmhQazhxT0dHcFFuWkpPZE1SMUkrYkE4cHN2UmNzQm1JM09CU1BD?=
 =?utf-8?Q?biOuzWSS8qkf4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c94bbd0-c385-4fb9-1a09-08d8b764d005
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 01:44:48.6547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fC/wuSbgCf7Adqg376100CqDJk2bOd82U3/GpfNpFJFgmsdJr5ed4tnrHPa+LQ8QAyW3Diws3/hlWjluH+uzUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3205
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_21:2021-01-12,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130006
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130006
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExpbW9uY2llbGxvLCBNYXJp
byA8TWFyaW9fTGltb25jaWVsbG9ARGVsbC5jb20+DQo+IFNlbnQ6IDIwMjHlubQx5pyIMTLml6Ug
MjI6NDgNCj4gVG86IFl1YW4sIFBlcnJ5OyBQaWVycmUtTG91aXMgQm9zc2FydDsgb2Rlcl9jaGlv
dUByZWFsdGVrLmNvbTsNCj4gcGVyZXhAcGVyZXguY3o7IHRpd2FpQHN1c2UuY29tDQo+IENjOiBh
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IGxnaXJkd29vZEBnbWFpbC5jb207IGxpbnV4LQ0K
PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBicm9vbmllQGtlcm5lbC5vcmcNCj4gU3ViamVjdDog
UkU6IFtQQVRDSCB2MiAyLzJdIEFTb0M6IHJ0NzE1OmFkZCBNaWMgTXV0ZSBMRUQgY29udHJvbCBz
dXBwb3J0DQo+IA0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206
IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5j
b20+DQo+ID4gPiBTZW50OiAyMDIx5bm0MeaciDEy5pelIDI6MDcNCj4gPiA+IFRvOiBZdWFuLCBQ
ZXJyeTsgb2Rlcl9jaGlvdUByZWFsdGVrLmNvbTsgcGVyZXhAcGVyZXguY3o7DQo+ID4gPiB0aXdh
aUBzdXNlLmNvbQ0KPiA+ID4gQ2M6IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgTGltb25j
aWVsbG8sIE1hcmlvOw0KPiA+ID4gbGdpcmR3b29kQGdtYWlsLmNvbTsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsNCj4gPiA+IGJyb29uaWVAa2VybmVsLm9yZw0KPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAyLzJdIEFTb0M6IHJ0NzE1OmFkZCBNaWMgTXV0ZSBMRUQgY29udHJvbA0K
PiA+ID4gc3VwcG9ydA0KPiA+ID4NCj4gPiA+DQo+ID4gPiBbRVhURVJOQUwgRU1BSUxdDQo+ID4g
Pg0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4gPiBAQCAtMjY4LDYgKzI2OSw3IEBAIHN0YXRp
YyBpbnQgcnQ3MTVfc2RjYV9wdXRfdm9sc3coc3RydWN0DQo+ID4gPiA+IHNuZF9rY29udHJvbA0K
PiA+ID4gKmtjb250cm9sLA0KPiA+ID4gPiAgIAl1bnNpZ25lZCBpbnQgcmVnMiA9IG1jLT5ycmVn
Ow0KPiA+ID4gPiAgIAl1bnNpZ25lZCBpbnQgcmVnID0gbWMtPnJlZzsNCj4gPiA+ID4gICAJdW5z
aWduZWQgaW50IG1heCA9IG1jLT5tYXg7DQo+ID4gPiA+ICsJdW5zaWduZWQgaW50IHZhbDAsIHZh
bDE7DQo+ID4gPiA+ICAgCWludCBlcnI7DQo+ID4gPiA+DQo+ID4gPiA+ICAgCXZhbCA9IHVjb250
cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBdOyBAQCAtMjg2LDcgKzI4OCwyMiBAQA0KPiA+ID4g
PiBzdGF0aWMgaW50IHJ0NzE1X3NkY2FfcHV0X3ZvbHN3KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtj
b250cm9sLA0KPiA+ID4gPiAgIAkJaWYgKGVyciA8IDApDQo+ID4gPiA+ICAgCQkJcmV0dXJuIGVy
cjsNCj4gPiA+ID4gICAJfQ0KPiA+ID4gPiAtDQo+ID4gPiA+ICsjaWYgSVNfRU5BQkxFRChDT05G
SUdfREVMTF9QUklWQUNZKQ0KPiA+ID4gPiArCS8qIFByaXZhY3kgTEVEIFRyaWdnZXIgU3RhdGUg
Q2hhbmdlZCBieSBtdXRlZC91bm11dGUgc3dpdGNoICovDQo+ID4gPiA+ICsJaWYgKG1jLT5pbnZl
cnQpIHsNCj4gPiA+ID4gKwkJdmFsMCA9IHVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBd
Ow0KPiA+ID4gPiArCQl2YWwxID0gdWNvbnRyb2wtPnZhbHVlLmludGVnZXIudmFsdWVbMV07DQo+
ID4gPiA+ICsJCWlmICh2YWwwID09IDEgJiYgdmFsMSA9PSAxKSB7DQo+ID4gPiA+ICsJCQlydDcx
NS0+bWljbXV0ZV9sZWQgPSBMRURfT0ZGOw0KPiA+ID4gPiArCQkJbGVkdHJpZ19hdWRpb19zZXQo
TEVEX0FVRElPX01JQ01VVEUsDQo+ID4gPiA+ICsJCQkJCXJ0NzE1LT5taWNtdXRlX2xlZCA/IExF
RF9PTiA6DQo+ID4gPiBMRURfT0ZGKTsNCj4gPiA+ID4gKwkJfSBlbHNlIGlmICh2YWwwID09IDAg
JiYgdmFsMSA9PSAwKSB7DQo+ID4gPiA+ICsJCQlydDcxNS0+bWljbXV0ZV9sZWQgPSBMRURfT047
DQo+ID4gPiA+ICsJCQlsZWR0cmlnX2F1ZGlvX3NldChMRURfQVVESU9fTUlDTVVURSwNCj4gPiA+
ID4gKwkJCQkJcnQ3MTUtPm1pY211dGVfbGVkID8gTEVEX09OIDoNCj4gPiA+IExFRF9PRkYpOw0K
PiA+ID4gPiArCQl9DQo+ID4gPiA+ICsJfQ0KPiA+ID4gPiArI2VuZGlmDQo+ID4gPg0KPiA+ID4g
U2hvdWxkIHRoaXMgYmUgYWN0aXZhdGVkIGZvciBzcGVjaWZpYyBETUkgcXVpcmtzPyBUaGlzIGRy
aXZlciBpcw0KPiA+ID4gdXNlZCBpbg0KPiA+IG5vbi1EZWxsDQo+ID4gPiBwbGF0Zm9ybXMgKEkg
YW0gdGhpbmtpbmcgb2YgSW50ZWwgUlZQcyBvciBSZWFsdGVrIGRhdWdodGVyYm9hcmRzKSwgSQ0K
PiA+ID4gYW0gbm90IHN1cmUgaWYgYSBidWlsZC10aW1lIGJlaGF2aW9yIGNoYW5nZSBtYWtlcyBz
ZW5zZS4NCj4gPiA+DQo+ID4gPiBPciBjb252ZXJzZWx5IGNvdWxkIHdlIGp1c3Qgc2V0IHRoZSBM
RURzIHVuY29uZGl0aW9uYWxseSBpZiBkb2luZyBzbw0KPiA+ID4gaXMgaGFybWxlc3M/DQo+ID4N
Cj4gPiBUaGUgY3VycmVudCBtaWMgbXV0ZSBsZWQgc2V0dGluZyBwYXRoIGlzIG5vdCBjb21tb24g
dXNlZCBmb3Igb3RoZXINCj4gPiB2ZW5kb3JzLCBqdXN0IERlbGwgcGxhdGZvcm0gc3VwcG9ydCB0
aGlzIG1pYyBtdXRlIGxlZCBzZXQgb3BlcmF0aW9uLg0KPiA+DQo+ID4gRG8geW91IHRoaW5rIHRo
YXQgSSBuZWVkIHRvIGFkZCBvbmUgRE1JIHF1aXJrIGluIHRoZSBuZXh0IHZlcnNpb24gPw0KPiA+
IElmIHNvLCBJIGNhbiBhZGQgdGhhdC4NCj4gPg0KPiA+DQo+IA0KPiANCj4gSW4gdGhlIEhEQSBh
dWRpbyBjYXNlIHRoaXMgaXMgbW9kZWxlZCBvZmYgb2YsIHRoZSBjb2RlIHJ1bnMgd2hldGhlciBv
ciBub3QgYQ0KPiB2ZW5kb3IgaGFzIHN1cHBvcnQgZm9yIGEgbWljIG11dGUgTEVELiAgVGhlIGNh
bGxzIHRvIGxlZHRyaWdfYXVkaW9fc2V0IHNob3VsZA0KPiBiZSBhIG5vLW9wLiAgSSBhZ3JlZSB3
aXRoIEBQaWVycmUtTG91aXMgQm9zc2FydCBpbiB0aGlzIGNhc2UsIHdlIHNob3VsZCBqdXN0IGJl
DQo+IHJ1bm5pbmcgaXQgd2hldGhlciBvciBub3QgZGVsbC1wcml2YWN5IGlzIGNvbXBpbGVkIGlu
LiAgSWYgYW5vdGhlciB2ZW5kb3INCj4gY2hvb3NlcyB0byBhZGQgTEVEIHN1cHBvcnQgdGhleSds
bCBqdXN0IG5lZWQgdG8gc2V0IHVwIHRoZWlyIGxlZHRyaWcgc3VwcG9ydGVkDQo+IGJhY2tlbmQg
YW5kIG5vdCBjaGFuZ2UgY29kZWMgY29kZS4NCg0KSGkgQFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IA0K
U2VlbXMgbGlrZSB0aGF0IHdlIGhhdmUgdHdvIHdheSB0byBnby4NCiogRE1JIHF1aXJrcyxzZWVt
cyBsaWtlIHRoYXQgaXQgbmVlZHMgdG8gbWFpbnRhaW4gdGhlIHF1aXJrIGxpc3Qgd2hlbiB2ZW5k
b3JzIGhhdmUgbmV3IHN5c3RlbSB0byBzdXBwb3J0Lg0KKiBXZSBqdXN0IHNldCB0aGUgbWljIG11
dGUgbGVkIHN0YXRlIHVuY29uZGl0aW9uYWxseSAuDQoNCldoaWNoIHdheSB3b3VsZCB5b3UgcHJl
ZmVyIGZvciBuZXh0IHBhdGNoIHJldmlldz8NCg0KDQoNCg==
