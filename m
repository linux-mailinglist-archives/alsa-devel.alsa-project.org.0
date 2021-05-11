Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1742237A3F9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 11:46:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C6ED1785;
	Tue, 11 May 2021 11:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C6ED1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620726412;
	bh=b6qwRHdngQbiFO34bDoFKnhqGCRlkXGNHBZfGP33JJI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HJCXHn22BYL3MnKvhHLM8YDPtR8iHpVFMd2FYM0Ecp53clfGpnWJfJTjdRKmoQSO3
	 wfwOX5I2JGKbhDHf51sD/Jqw7pwKTJgKDFKPDgcOJfOqMPegL42jlWE9CVfm6q41b0
	 6+0211HfEfEkBs4juijwAQIPv33QnhZp1bIFRzT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 113ACF800E9;
	Tue, 11 May 2021 11:45:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4E5CF80163; Tue, 11 May 2021 11:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17C57F8013A
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 11:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17C57F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="BRchQeb0"
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14B9ghTY002129; Tue, 11 May 2021 05:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=b6qwRHdngQbiFO34bDoFKnhqGCRlkXGNHBZfGP33JJI=;
 b=BRchQeb0HHWEF3nkNELX3Z6VLf+rcxu8k3Rx+rupDNnK+Vn0mM1t+75tICTIGijPCCyB
 FZrB5ICAsRUHn1Jfyv2eqGibKySRn3kM/NcTP9KQ04hSFCJA9DZBFUDCsJsRNwQYNBFP
 g7vORshn6sEt/xS/fiOlZCuRynzujEOkWhyvfPgbUAlehMZ+UBhXIJbtgAPKpugafBuS
 AyPH7ozWntsOkGbe83DrLfdeMoJjHTqsXno7wODp3r/AG6A/bo75KuWrglDr48EuHTir
 MrvVvq9Q4VvYSAcIZmwIeT3sU8TC8Gq1uO0g/M9Q5JyL1zisAdmTdKCPIObaw/97GIoq sg== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 38f3ejvg42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 05:45:10 -0400
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14B9j9Qd057169; Tue, 11 May 2021 05:45:09 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0b-00154901.pphosted.com with ESMTP id 38fabc1pyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 05:45:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euw/c6U+uh02Uy256jf7Ps67pBdDjwaQtGWOewhmOG4DJHtWf98CBy/lpTBRV5gI8VgtEb1iocE9vy1VhUuO4mOyrPV7rRMGn9h79eO8iFUNwb1BsvdC9XIIwRgn6q4EhRclYY9vEVvJwol3ypB4NoyxfDuuksoQyOlxqjcxDUw888G8rHN/EWYOu76txDeoOMsrlUkoOZPEDTflh9CRs0F+hk/nurLL/FzVNG616FHMDEZoDok2BfcEAf+v+qLVNjfXQ894TCqCC7uL9O66APdAkgsLf8xTBTnkrlzB56ZFvUTHb99k3QtpOnLE18JLVdVuFTXokvv8JBbFLiTiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6qwRHdngQbiFO34bDoFKnhqGCRlkXGNHBZfGP33JJI=;
 b=LyJtbeNNVGS/yz183den1TzhrQlVyZGS/lmi0Hx+wMttYp59rchxSPi2QaH/BaXgtnBn/jaeHx93MzKeqB0o8g/FW0QHeRJesp44LodEmNLcli8or9/lON/LOW4DZphCDsOcv8o4xjDUr7NKFmvpqf0R7a0V5vaxu8hOw/CwD2FeNJN90wPaVrHERawMyBd2my/3VaJ//yjS7k2KiSGv1RhgxFQ0ClTpzgXLznocp2d59OF6VmExbfMF+IfnLE+RJdEIBV75Srz034Pb0/WRByT6Z72a+oAKiQ17nHFRE0mqDbh+8nAhJx2kpBB8M7saF+aKZi+tsHNPT8NOIoPSwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BY3PR19MB4977.namprd19.prod.outlook.com (2603:10b6:a03:36f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Tue, 11 May
 2021 09:45:07 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%8]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 09:45:07 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Hans de Goede <hdegoede@redhat.com>, "pobrn@protonmail.com"
 <pobrn@protonmail.com>, "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "oder_chiou@realtek.com"
 <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>
Subject: RE: [PATCH v8 2/2] ASoC: rt715:add micmute led state control supports
Thread-Topic: [PATCH v8 2/2] ASoC: rt715:add micmute led state control supports
Thread-Index: AQHXQm7erdqZ7itfEkycL96MQTfklKrYAeyAgAYKcVA=
Date: Tue, 11 May 2021 09:45:07 +0000
Message-ID: <SJ0PR19MB4528D952A9040B008A2BB57A84539@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210506115626.12480-1-Perry_Yuan@Dell.com>
 <050c2e9d-9510-523b-5504-10397d7ec96f@redhat.com>
In-Reply-To: <050c2e9d-9510-523b-5504-10397d7ec96f@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Perry_Yuan@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-05-11T09:45:04.7336940Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=e9409010-06fd-4598-95e6-54fad433c457;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [163.244.246.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 203e1e01-53c4-4874-4378-08d9146175e6
x-ms-traffictypediagnostic: BY3PR19MB4977:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY3PR19MB4977BC80EC1125BB57BF3CFD84539@BY3PR19MB4977.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PQmEq2mOZihSEn/YOOvI7uZgEvIsncc/Jwi+n/jsrNwL02bxBz3DoPuatAwpgUKzW/dhF+w8ZOpvym0E0V0txV/sv7IA+T4b9wowqDGSYQ5jfJjGiffKyaFwlMYB78BEn32qnjInANfo04KhZZ0BNdK+O49ZraewEIGIdMRL+cJYS2xz6MbRGL7s85nb5z7oqu8mooyQ3re4rKYdeXo0bNVpygUuKazbIlRw1gSuJSSCXKwApoSJjYhVtOoebIDbN6knwf3wtS7LSs7MAD2xW1mbfqpPhqZ05oIDhvwVhIjLKeNvydjC2x8ps3wyM4gEHIbt+vS+TsW2wTDr30HgExWWbfcHDi9eaHT4uCDzk2AJK4sk9zjQpFpU/M/y3zM0QRiTWwVycjKLH1em6jG/kperQ5go8NUVyygZjsuDZLwUvD2veBlWsVxu1cOfgIJCT3yX0mxfEVkm2AN1hTDsuX/ORJQg7KFJzsd8cDNYESjD/Q69PXk7HixuXLkGQOqF9R74ftQt0FbZJDqMf1RLk4UdH8SDYotmayppG+wM1taTTiVCuHYjcadTMZJ3Ojqy4bsf0yqfGwOMqRuBdTj/HBptWyiCVYleYp5/ymUnoq0d8YAjd62FTokQMhEn0y789tOgYqzM/0hoC3yZfPdxBL0R4glPLlDHizhBkyL0EFAX1uGf6kXghbT3Ye815L12CjAI2kkDOgQvo24qfE73pmU83M0ZoHGH3K9vMIBSAKo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(7696005)(4326008)(966005)(478600001)(71200400001)(45080400002)(53546011)(8936002)(6506007)(786003)(316002)(33656002)(54906003)(110136005)(8676002)(186003)(26005)(66946007)(66556008)(9686003)(38100700002)(66446008)(86362001)(76116006)(64756008)(83380400001)(66476007)(107886003)(2906002)(55016002)(122000001)(7416002)(52536014)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aFk5WGEvWmpsaVlVMW82U2RCRlpMZ2xYc3hacTNKSmZBRGVoVDRxNUdvUzho?=
 =?utf-8?B?UG1lajNjRzQ4YmMyYzJhSmg5UnFHaURXVXhZeUNsblY1Y2lVdnVJdzBmQ0lI?=
 =?utf-8?B?MzFFYTd2Qkh5Y29Qancya0RhTER1ai9XMVA4T1RpaE1hU1o4Z0ZjU0djRmhL?=
 =?utf-8?B?a1phYmpibVpwblFMcVhEd2UvWmJPOFRnb3hEcFNuTzhTRUZZREY3ZDlDL0E1?=
 =?utf-8?B?OFhFR1QxL1lZckxyUHNjV3J5RUxnZG82Y1FLY2pJL0NqNnc1Q0VIZ05GSUZn?=
 =?utf-8?B?Rnd3c3h4eDl2ZTVZcEN0NXN6bjM1LzRrYTVlWEpYSFFQQ0JPeXJJS2VwMU9M?=
 =?utf-8?B?aytYbmpJQWY0M0hyZk5lY1hLb2FPSmg4bXc3MVlMWEsxMUtWbEVRbTc1ZW51?=
 =?utf-8?B?dVdFRlZRaXVCMS8ramFDc1Z2Z3lEdHdMU05uaFVZOTZ3djVRNHR5amViTWJr?=
 =?utf-8?B?WjY5bVIvS0NRcDVhREZ1ZnlNOUhPWE1kTjQ5Rk9SU2EzUGxWU1I0b0NUUExC?=
 =?utf-8?B?bm40a2sxdzFUNUNMdE1QUDNORWdLbmVKYm9CR09sbTU1d0tNZXQrdmIycDR3?=
 =?utf-8?B?WDhEdFFtUEI1dVgzTXozMHBZTGFPMStHcDhlaWQ4TCtnK1V5UlJuZFA3cmpK?=
 =?utf-8?B?OTk1SFhvRVVsMW5yOStFeC8wUHp4TXE4QUhVMmtFLzhENC9GajRiUzJBeGYv?=
 =?utf-8?B?enI4RnQrZGZiVlQxdkorZDRaZEFPQXN2T3ZsNGVISXlMdXJNQUoxR1ZvdHhE?=
 =?utf-8?B?ZmdTengwWVZaNHpLRVEwaWRqelJ6aWMyNExYUmUzOXJlSVNzZE40Q01LMU5S?=
 =?utf-8?B?WkxrT1FOV0xEd2Jzd1VwZmFXejI0eUNTS08wNGxPaitzaHV3dUtHaWJVQ2pM?=
 =?utf-8?B?S2VkbmdzVG9zUUZEbVFVYUFIbUFWSnZ4YURmQlBubU12ZDZZanVLZlQ5dUEz?=
 =?utf-8?B?UW04ZjlwRzY1bHRGS08zRWQyLzAzUGQ5RTY3dGJjRkJuS2ZNRnUyUlM1QndS?=
 =?utf-8?B?ZWlkTlhxZmpxNGNwK0pVU2VYWnN4MVJvdDZmZlVMb1dSd0lOL2ZVcnJ2OFVL?=
 =?utf-8?B?alA2Qk1MZXoweGZZS1FvaURFVzQyNzJGME1RQkM0RGRINlNCVVYzZnNPWUcw?=
 =?utf-8?B?SmdSYllhdnR2TmVLSStEVWRYeE5WUWM4c3krUVgwQ0g4NkcyYUl1WG9nTHA1?=
 =?utf-8?B?dHFQUGxpcCtFL3lDb0Z1QzQxcU9rSVAvTHoyZW9WNVBvWmFOaVcwV2ZvTjUx?=
 =?utf-8?B?WHhNamNITHFWditwR2ladTg1amFiRHRFYm1OVjlueUFRdjlScGhzQzh0Y2NF?=
 =?utf-8?B?Tkl0b3Bsb3Zoc1pxSjlKR0JGWmQwU3NuUkt1a00wOEZDaXZzOWFTNHhjcDI2?=
 =?utf-8?B?UjYxVGJUWHNPY0hzZ2ZXdEs2bk5kOXQ5NUgwMEJ2cEhVaEVoL1ljM1FlRGlL?=
 =?utf-8?B?dmR2Y2lRbm1pWFpwQ0dYWVA3ODZqZEs3SHJUa05HMXZpWCtBT3RVUFBkcWVz?=
 =?utf-8?B?VWhlOFdJU0JlNlMwSTVqZGJMRzhJTEZKZEFzMjczUW54WDcrTXJYMjdVN05l?=
 =?utf-8?B?OTVJbzZPbTNTelNjalBuaVYzWEIrbjZadmNTN2t3bU1mQzhjbSs0N3pYb0VP?=
 =?utf-8?B?RUpYdzRwZEljQjB3N0liOXJEbCt2cFZodGMwQ2RscDkxTEIrRDNsakU0enRH?=
 =?utf-8?B?d3pNelh0YzFiMXF1RTFSekk2cjNxemU2RVQ4VTlwL3pKejdyY1JCV3FkQlRZ?=
 =?utf-8?Q?yAPp15FsOWCoN6xoMhr3xvd+o0j6P+ZmeagmetK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203e1e01-53c4-4874-4378-08d9146175e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 09:45:07.0799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6rG74T7L+5FXjrFP2hMw708bf4EXHIufqi5QMV0zFwcxYaAtnjPER+rHuVuzSDkI8L5l9/s4W++ppSfa6KJfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4977
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-11_02:2021-05-10,
 2021-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105110073
X-Proofpoint-ORIG-GUID: 1fGQB_14dZK_ZKxTJoRfFF7NXxmvN7W7
X-Proofpoint-GUID: 1fGQB_14dZK_ZKxTJoRfFF7NXxmvN7W7
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105110073
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Dell Client Kernel <Dell.Client.Kernel@dell.com>,
 "mario.limonciello@outlook.com" <mario.limonciello@outlook.com>
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
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+IFNlbnQ6IDIwMjHlubQ15pyIN+aXpSAyMTox
OA0KPiBUbzogWXVhbiwgUGVycnk7IHBvYnJuQHByb3Rvbm1haWwuY29tOyBwaWVycmUtDQo+IGxv
dWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tOyBvZGVyX2NoaW91QHJlYWx0ZWsuY29tOyBwZXJl
eEBwZXJleC5jejsNCj4gdGl3YWlAc3VzZS5jb207IG1ncm9zc0BsaW51eC5pbnRlbC5jb20NCj4g
Q2M6IGxnaXJkd29vZEBnbWFpbC5jb207IGJyb29uaWVAa2VybmVsLm9yZzsgYWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBwbGF0Zm9y
bS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZzsNCj4gbWFyaW8ubGltb25jaWVsbG9Ab3V0bG9v
ay5jb207IERlbGwgQ2xpZW50IEtlcm5lbA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDIvMl0g
QVNvQzogcnQ3MTU6YWRkIG1pY211dGUgbGVkIHN0YXRlIGNvbnRyb2wNCj4gc3VwcG9ydHMNCj4g
DQo+IA0KPiBbRVhURVJOQUwgRU1BSUxdDQo+IA0KPiBIaSBQZXJyeSwNCj4gDQo+IE9uIDUvNi8y
MSAxOjU2IFBNLCBQZXJyeSBZdWFuIHdyb3RlOg0KPiA+IEZyb206IFBlcnJ5IFl1YW4gPHBlcnJ5
X3l1YW5AZGVsbC5jb20+DQo+ID4NCj4gPiBTb21lIG5ldyBEZWxsIHN5c3RlbSBpcyBnb2luZyB0
byBzdXBwb3J0IGF1ZGlvIGludGVybmFsIG1pY3Bob25lDQo+ID4gcHJpdmFjeSBzZXR0aW5nIGZy
b20gaGFyZHdhcmUgbGV2ZWwgd2l0aCBtaWNtdXRlIGxlZCBzdGF0ZSBjaGFuZ2luZw0KPiA+IFdo
ZW4gbWljbXV0ZSBob3RrZXkgcHJlc3NlZCBieSB1c2VyLCBzb2Z0IG11dGUgd2lsbCBuZWVkIHRv
IGJlIGVuYWJsZWQNCj4gPiBmaXJzdGx5IGluIGNhc2Ugb2YgcG9wIG5vaXNlLCBhbmQgY29kZWMg
ZHJpdmVyIG5lZWQgdG8gcmVhY3QgdG8gbWljDQo+ID4gbXV0ZSBldmVudCB0byBFQyhlbWJlZGRl
ZCBjb250cm9sbGVyKSBub3RpZnlpbmcgdGhhdCBTVyBtdXRlIGlzDQo+ID4gY29tcGxldGVkIFRo
ZW4gRUMgd2lsbCBkbyB0aGUgaGFyZHdhcmUgbXV0ZSBwaHlzaWNhbGx5IHdpdGhpbiB0aGUNCj4g
PiB0aW1lb3V0IHJlYWNoZWQNCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWxsb3cgY29kZWMgcnQ3MTUg
YW5kIHJ0NzE1IHNkY2EgZHJpdmVyIHRvIGNoYW5nZSB0aGUgbG9jYWwNCj4gPiBtaWNtdXRlIGxl
ZCBzdGF0ZS4gRGVsbCBwcml2YWN5IGxlZCB0cmlnZ2VyIGRyaXZlciB3aWxsIGFjayBFQyB3aGVu
DQo+ID4gbWljbXV0ZSBrZXkgcHJlc3NlZCB0aHJvdWdoIHRoaXMgbWljcGhvbmUgbGVkIGNvbnRy
b2wgaW50ZXJmYWNlIGxpa2UNCj4gPiBoZGFfZ2VuZXJpYyBwcm92aWRlZCBBQ1BJIG1ldGhvZCBk
ZWZpbmVkIGluIGRlbGwtcHJpdmFjeSBtaWNtdXRlIGxlZA0KPiA+IHRyaWdnZXIgd2lsbCBiZSBj
YWxsZWQgZm9yIG5vdGlmeWluZyB0aGUgRUMgdGhhdCBzb2Z0d2FyZSBtdXRlIGhhcw0KPiA+IGJl
ZW4gY29tcGxldGVkLCB0aGVuIGhhcmR3YXJlIGF1ZGlvIGNpcmN1aXQgc29sdXRpb24gY29udHJv
bGxlZCBieSBFQw0KPiA+IHdpbGwgc3dpdGNoIHRoZSBhdWRpbyBpbnB1dCBzb3VyY2Ugb2ZmL29u
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXJyeSBZdWFuIDxwZXJyeV95dWFuQGRlbGwuY29t
Pg0KPiANCj4gTkFDSywgYXMgZXhwbGFpbmVkIGJlZm9yZSB3ZSB3YW50IHRoZSBiaW5kaW5nIG9m
IHRoZSBjb250cm9sIHRvIHRoZSBMRUQtDQo+IHRyaWdnZXIgdG8gYmUgZG9uZSBmcm9tIHRoZSBV
Q00gcHJvZmlsZS4NCj4gDQo+IFN1cHBvcnQgZm9yIHRoaXMgaGFzIGxhbmRlZCBrZXJuZWwtc2lk
ZSBpbiBMaW51eCB0cmVlIG5vdyAodGhpcyB3aWxsIGJlIHBhcnQgb2YNCj4gNS4xMy1yYzEpLiBU
b2dldGhlciB3aXRoIHRoZSBsYXRlc3QgZ2l0IGFsc2EtbGliIGFuZCBhbHNhLXV0aWxzIGNvZGUs
IHlvdSBjYW4gbm93DQo+IGRvIHdoYXQgdGhpcyBwYXRjaCBkb2VzIGZyb20gYW4gVUNNIHByb2Zp
bGUgZmlsZSBhbmQgQUZBSUsgdGhhdCBpcyB0aGUNCj4gcHJlZmVycmVkIHdheSB0byBkbyB0aGlz
Lg0KPiANCj4gU2VlIGhlcmUgZm9yIGFuIGV4YW1wbGUgVUNNIHByb2ZpbGUgcGF0Y2ggaW1wbGVt
ZW50aW5nIHRoaXM6DQo+IA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxzYS0NCj4gZGV2ZWwvMjAyMTA1MDcxMzExMzkuMTAyMzEtMy0NCj4g
aGRlZ29lZGVAcmVkaGF0LmNvbS9ULyp1X187SXchIUxwS0khek05clZQWWFUakxFWVVtQnJJYXlp
M2FqX1F2QjVwMQ0KPiB1Mmx1RWNrZlFDVWVWYm5SUGs3REw4aHdkaElETGpFYyQgW2xvcmVbLl1r
ZXJuZWxbLl1vcmddDQo+IA0KPiBOb3RlIHRoYXQgaWYgeW91IHRlc3QgdGhpcyB1bmRlciBGZWRv
cmEgeW91IHdpbGwgaGl0IGEgc2VsaW51eCBkZW5pYWwsIHRvDQo+IHdvcmthcm91bmQgdGhhdCB5
b3UgY2FuIHB1dCBzZWxpbnV4IGluIHBlcm1pc3NpdmUgbW9kZS4gVGhpcyBzZWxpbnV4IGlzc3Vl
IGlzDQo+IGJlaW5nIHRyYWNrZWQgaGVyZToNCj4gDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20v
djMvX19odHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTENCj4gOTU4
MjEwX187ISFMcEtJIXpNOXJWUFlhVGpMRVlVbUJySWF5aTNhal9RdkI1cDF1Mmx1RWNrZlFDVWVW
Ym5SUGs3DQo+IERMOGh3ZF9mbXhvMEkkIFtidWd6aWxsYVsuXXJlZGhhdFsuXWNvbV0NCj4gDQo+
IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIGEgbG90Lg0K
SSBhbSB0cnlpbmcgIHRvIG1ha2Ugb25lIG5ldyBwYXRjaCBmb3IgdGhlIHVjbTIgcHJvZmlsZQ0K
Q291bGQgeW91IGhlbHAgdG8gY2hlY2sgaWYgdGhlcmUgaXMgc29tZSBvdGhlciBjaGFuZ2VzIEkg
bmVlZCB0byBtYWtlIGZvciB0aGUgcHJpdmFjeSBkcml2ZXIgPw0KDQpQZXJyeQ0KDQo+IA0KPiAN
Cj4gDQo+IA0KPiANCj4gDQo+ID4NCj4gPiAtLS0tLS0tLQ0KPiA+IHY3IC0+IHY4Og0KPiA+ICog
Ti9BDQo+ID4gdjYgLT4gdjc6DQo+ID4gKiBhZGRyZXNlZCByZXZpZXcgY29tbWVudHMgZnJvbSBK
YXJvc2xhdg0KPiA+ICogdXNlIGRldmljZSBpZCBpbiB0aGUgcXVpcmsgbGlzdA0KPiA+IHY1IC0+
IHY2Og0KPiA+ICogYWRkIHF1aXJrcyBmb3IgbWljbXV0ZSBsZWQgY29udHJvbCBhcyBzaG9ydCB0
ZXJtIHNvbHV0aW9uIHRvIGNvbnRyb2wNCj4gPiAgIG1pY211dGUgbGVkIHN0YXRlIGNoYW5nZQ0K
PiA+ICogYWRkIGNvbW1lbnRzIGZvciB0aGUgaW52ZXJ0IGNoZWNraW5nDQo+ID4gdjQgLT4gdjU6
DQo+ID4gKiByZWJhc2UgdG8gbGF0ZXN0IDUuMTIgcmM0IHVwc3RyZWFtIGtlcm5lbA0KPiA+IHYz
IC0+IHY0Og0KPiA+ICogcmVtb3ZlIHVudXNlZCBkZWJ1ZyBsb2cNCj4gPiAqIHJlbW92ZSBjb21w
aWxlIGZsYWcgb2YgREVMTCBwcml2YWN5DQo+ID4gKiBtb3ZlIHRoZSBtaWNtdXRlX2xlZCB0byBs
b2NhbCBmcm9tIHJ0NzE1X3ByaXYNCj4gPiAqIHdoZW4gSmFyb3NsYXYgdXBzdHJlYW0gaGlzIGdl
cm5lcmljIExFRCB0cmlnZ2VyIGRyaXZlcixJIHdpbGwgcmViYXNlDQo+ID4gICB0aGlzIHBhdGNo
LHBsZWFzZSBjb25zaWRlciBtZXJnZSB0aGlzIGF0IGZpcnN0DQo+ID4NCj4gPiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxzYS1kZXZlbC8yMDIx
MDIxDQo+ID4gMTExMTQwMC4xMTMxMDIwLTEtDQo+IHBlcmV4QHBlcmV4LmN6L19fOyEhTHBLSSF6
TTlyVlBZYVRqTEVZVW1CcklheWkzYWpfUXYNCj4gPiBCNXAxdTJsdUVja2ZRQ1VlVmJuUlBrN0RM
OGh3ZHkyNDA1MTgkIFtsb3JlWy5da2VybmVsWy5db3JnXQ0KPiA+IHYyIC0+IHYzOg0KPiA+ICog
c2ltcGxpZnkgdGhlIHBhdGNoIHRvIHJldXNlIHNvbWUgdmFsIHZhbHVlDQo+ID4gKiBhZGQgbW9y
ZSBkZXRhaWwgdG8gdGhlIGNvbW1pdCBpbmZvDQo+ID4gdjEgLT4gdjI6DQo+ID4gKiBmaXggc29t
ZSBmb3JtYXQgaXNzdWUNCj4gPiAtLS0tLS0tLQ0KPiA+IC0tLQ0KPiA+ICBzb3VuZC9zb2MvY29k
ZWNzL3J0NzE1LXNkY2EuYyB8IDQyDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ID4gIHNvdW5kL3NvYy9jb2RlY3MvcnQ3MTUuYyAgICAgIHwgNDINCj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNl
cnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9ydDcxNS1z
ZGNhLmMNCj4gPiBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ3MTUtc2RjYS5jIGluZGV4IDkzNmUzMDYx
Y2ExZS4uZGU0NjUxNGUwMjA3DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvc291bmQvc29jL2NvZGVj
cy9ydDcxNS1zZGNhLmMNCj4gPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LXNkY2EuYw0K
PiA+IEBAIC0xMSwxMiArMTEsMTQgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZXBhcmFt
Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4
L2luaXQuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2xlZHMuaD4NCj4gPiAgI2luY2x1ZGUgPGxp
bnV4L3BtX3J1bnRpbWUuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BtLmg+DQo+ID4gICNpbmNs
dWRlIDxsaW51eC9zb3VuZHdpcmUvc2R3Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAu
aD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZG1pLmg+DQo+ID4gICNpbmNs
dWRlIDxzb3VuZC9jb3JlLmg+DQo+ID4gICNpbmNsdWRlIDxzb3VuZC9wY20uaD4NCj4gPiAgI2lu
Y2x1ZGUgPHNvdW5kL3BjbV9wYXJhbXMuaD4NCj4gPiBAQCAtMzQ0LDYgKzM0NiwzMiBAQCBzdGF0
aWMgaW50IHJ0NzE1X3NkY2FfZ2V0X3ZvbHN3KHN0cnVjdA0KPiBzbmRfa2NvbnRyb2wgKmtjb250
cm9sLA0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgYm9vbCBtaWNt
dXRlX2xlZF9zZXQ7DQo+ID4gK3N0YXRpYyBpbnQgIGRtaV9tYXRjaGVkKGNvbnN0IHN0cnVjdCBk
bWlfc3lzdGVtX2lkICpkbWkpIHsNCj4gPiArCW1pY211dGVfbGVkX3NldCA9IDE7DQo+ID4gKwly
ZXR1cm4gMTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArLyogU29tZSBzeXN0ZW1zIHdpbGwgbmVlZCB0
byB1c2UgdGhpcyB0byB0cmlnZ2VyIG1pYyBtdXRlIExFRCBzdGF0ZQ0KPiA+ICtjaGFuZ2VkICov
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBtaWNtdXRlX2xlZF9kbWlfdGFibGVb
XSA9IHsNCj4gPiArCXsNCj4gPiArCQkuY2FsbGJhY2sgPSBkbWlfbWF0Y2hlZCwNCj4gPiArCQku
bWF0Y2hlcyA9IHsNCj4gPiArCQkJRE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAiRGVsbCBJbmMu
IiksDQo+ID4gKwkJCURNSV9NQVRDSChETUlfUFJPRFVDVF9TS1UsICIwQTMyIiksDQo+ID4gKwkJ
fSwNCj4gPiArCX0sDQo+ID4gKwl7DQo+ID4gKwkJLmNhbGxiYWNrID0gZG1pX21hdGNoZWQsDQo+
ID4gKwkJLm1hdGNoZXMgPSB7DQo+ID4gKwkJCURNSV9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkRl
bGwgSW5jLiIpLA0KPiA+ICsJCQlETUlfTUFUQ0goRE1JX1BST0RVQ1RfU0tVLCAiMEEzRSIpLA0K
PiA+ICsJCX0sDQo+ID4gKwl9LA0KPiA+ICsJe30sDQo+ID4gK307DQo+ID4gKw0KPiA+ICBzdGF0
aWMgaW50IHJ0NzE1X3NkY2FfcHV0X3ZvbHN3KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9s
LA0KPiA+ICAJc3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWNvbnRyb2wpICB7IEBAIC0zNTgs
NiArMzg2LDcgQEAgc3RhdGljDQo+ID4gaW50IHJ0NzE1X3NkY2FfcHV0X3ZvbHN3KHN0cnVjdCBz
bmRfa2NvbnRyb2wgKmtjb250cm9sLA0KPiA+ICAJdW5zaWduZWQgaW50IG1hc2sgPSAoMSA8PCBm
bHMobWF4KSkgLSAxOw0KPiA+ICAJdW5zaWduZWQgaW50IGludmVydCA9IHAtPmludmVydDsNCj4g
PiAgCWludCBlcnI7DQo+ID4gKwlib29sIG1pY211dGVfbGVkOw0KPiA+DQo+ID4gIAlmb3IgKGkg
PSAwOyBpIDwgNDsgaSsrKSB7DQo+ID4gIAkJaWYgKHVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZh
bHVlW2ldICE9IHJ0NzE1LQ0KPiA+a2N0bF9zd2l0Y2hfb3JpZ1tpXSkNCj4gPiB7IEBAIC0zOTQs
NiArNDIzLDE4IEBAIHN0YXRpYyBpbnQgcnQ3MTVfc2RjYV9wdXRfdm9sc3coc3RydWN0DQo+IHNu
ZF9rY29udHJvbCAqa2NvbnRyb2wsDQo+ID4gIAkJCXJldHVybiBlcnI7DQo+ID4gIAl9DQo+ID4N
Cj4gPiArCS8qIE1pY211dGUgTEVEIHN0YXRlIGNoYW5nZWQgYnkgbXV0ZWQvdW5tdXRlIHN3aXRj
aA0KPiA+ICsJICogdG8ga2VlcCBzeW5jaW5nIHdpdGggYWN0dWFsIGhhcmR3YXJlIG1pYyBtdXRl
IGxlZCBzdGF0ZQ0KPiA+ICsJICogaW52ZXJ0IHdpbGwgYmUgY2hlY2tlZCB0byBjaGFuZ2UgdGhl
IHN0YXRlIHN3aXRjaA0KPiA+ICsJICovDQo+ID4gKwlpZiAoaW52ZXJ0ICYmIG1pY211dGVfbGVk
X3NldCkgew0KPiA+ICsJCWlmICh1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXSB8fCB1
Y29udHJvbC0NCj4gPnZhbHVlLmludGVnZXIudmFsdWVbMV0pDQo+ID4gKwkJCW1pY211dGVfbGVk
ID0gTEVEX09GRjsNCj4gPiArCQllbHNlDQo+ID4gKwkJCW1pY211dGVfbGVkID0gTEVEX09OOw0K
PiA+ICsJCWxlZHRyaWdfYXVkaW9fc2V0KExFRF9BVURJT19NSUNNVVRFLCBtaWNtdXRlX2xlZCk7
DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJcmV0dXJuIGtfY2hhbmdlZDsNCj4gPiAgfQ0KPiA+DQo+
ID4gQEAgLTEwNjksNiArMTExMCw3IEBAIGludCBydDcxNV9zZGNhX2lvX2luaXQoc3RydWN0IGRl
dmljZSAqZGV2LA0KPiA+IHN0cnVjdCBzZHdfc2xhdmUgKnNsYXZlKQ0KPiA+DQo+ID4gIAlwbV9y
dW50aW1lX21hcmtfbGFzdF9idXN5KCZzbGF2ZS0+ZGV2KTsNCj4gPiAgCXBtX3J1bnRpbWVfcHV0
X2F1dG9zdXNwZW5kKCZzbGF2ZS0+ZGV2KTsNCj4gPiArCWRtaV9jaGVja19zeXN0ZW0obWljbXV0
ZV9sZWRfZG1pX3RhYmxlKTsNCj4gPg0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiBkaWZm
IC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9ydDcxNS5jIGIvc291bmQvc29jL2NvZGVjcy9ydDcx
NS5jIGluZGV4DQo+ID4gMTM1Mjg2OWNjMDg2Li40ZGJkODcwMDA5YjggMTAwNjQ0DQo+ID4gLS0t
IGEvc291bmQvc29jL2NvZGVjcy9ydDcxNS5jDQo+ID4gKysrIGIvc291bmQvc29jL2NvZGVjcy9y
dDcxNS5jDQo+ID4gQEAgLTEzLDYgKzEzLDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2luaXQu
aD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9p
MmMuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2xlZHMuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4
L3BtX3J1bnRpbWUuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BtLmg+DQo+ID4gICNpbmNsdWRl
IDxsaW51eC9zb3VuZHdpcmUvc2R3Lmg+DQo+ID4gQEAgLTI1LDYgKzI2LDcgQEANCj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+DQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2RtaS5o
Pg0KPiA+ICAjaW5jbHVkZSA8c291bmQvY29yZS5oPg0KPiA+ICAjaW5jbHVkZSA8c291bmQvcGNt
Lmg+DQo+ID4gICNpbmNsdWRlIDxzb3VuZC9wY21fcGFyYW1zLmg+DQo+ID4gQEAgLTcwLDYgKzcy
LDMyIEBAIHN0YXRpYyB2b2lkIHJ0NzE1X2dldF9nYWluKHN0cnVjdCBydDcxNV9wcml2ICpydDcx
NSwNCj4gdW5zaWduZWQgaW50IGFkZHJfaCwNCj4gPiAgCQlwcl9lcnIoIkZhaWxlZCB0byBnZXQg
TCBjaGFubmVsIGdhaW4uXG4iKTsgIH0NCj4gPg0KPiA+ICtzdGF0aWMgYm9vbCBtaWNtdXRlX2xl
ZF9zZXQ7DQo+ID4gK3N0YXRpYyBpbnQgIGRtaV9tYXRjaGVkKGNvbnN0IHN0cnVjdCBkbWlfc3lz
dGVtX2lkICpkbWkpIHsNCj4gPiArCW1pY211dGVfbGVkX3NldCA9IDE7DQo+ID4gKwlyZXR1cm4g
MTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArLyogU29tZSBzeXN0ZW1zIHdpbGwgbmVlZCB0byB1c2Ug
dGhpcyB0byB0cmlnZ2VyIG1pYyBtdXRlIExFRCBzdGF0ZQ0KPiA+ICtjaGFuZ2VkICovIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBtaWNtdXRlX2xlZF9kbWlfdGFibGVbXSA9IHsN
Cj4gPiArCXsNCj4gPiArCQkuY2FsbGJhY2sgPSBkbWlfbWF0Y2hlZCwNCj4gPiArCQkubWF0Y2hl
cyA9IHsNCj4gPiArCQkJRE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAiRGVsbCBJbmMuIiksDQo+
ID4gKwkJCURNSV9NQVRDSChETUlfUFJPRFVDVF9TS1UsICIwQTMyIiksDQo+ID4gKwkJfSwNCj4g
PiArCX0sDQo+ID4gKwl7DQo+ID4gKwkJLmNhbGxiYWNrID0gZG1pX21hdGNoZWQsDQo+ID4gKwkJ
Lm1hdGNoZXMgPSB7DQo+ID4gKwkJCURNSV9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkRlbGwgSW5j
LiIpLA0KPiA+ICsJCQlETUlfTUFUQ0goRE1JX1BST0RVQ1RfU0tVLCAiMEEzRSIpLA0KPiA+ICsJ
CX0sDQo+ID4gKwl9LA0KPiA+ICsJe30sDQo+ID4gK307DQo+ID4gKw0KPiA+ICAvKiBGb3IgVmVy
Yi1TZXQgQW1wbGlmaWVyIEdhaW4gKFZlcmIgSUQgPSAzaCkgKi8gIHN0YXRpYyBpbnQNCj4gPiBy
dDcxNV9zZXRfYW1wX2dhaW5fcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLA0KPiA+
ICAJCQkJCXN0cnVjdCBzbmRfY3RsX2VsZW1fdmFsdWUgKnVjb250cm9sKQ0KPiBAQCAtODMsNiAr
MTExLDcgQEAgc3RhdGljDQo+ID4gaW50IHJ0NzE1X3NldF9hbXBfZ2Fpbl9wdXQoc3RydWN0IHNu
ZF9rY29udHJvbCAqa2NvbnRyb2wsDQo+ID4gIAl1bnNpZ25lZCBpbnQgYWRkcl9oLCBhZGRyX2ws
IHZhbF9oLCB2YWxfbGwsIHZhbF9scjsNCj4gPiAgCXVuc2lnbmVkIGludCByZWFkX2xsLCByZWFk
X3JsLCBpOw0KPiA+ICAJdW5zaWduZWQgaW50IGtfdm9sX2NoYW5nZWQgPSAwOw0KPiA+ICsJYm9v
bCBtaWNtdXRlX2xlZDsNCj4gPg0KPiA+ICAJZm9yIChpID0gMDsgaSA8IDI7IGkrKykgew0KPiA+
ICAJCWlmICh1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVtpXSAhPSBydDcxNS0NCj4gPmtj
dGxfMmNoX3ZvbF9vcmlbaV0pDQo+ID4geyBAQCAtMTU1LDYgKzE4NCwxOCBAQCBzdGF0aWMgaW50
IHJ0NzE1X3NldF9hbXBfZ2Fpbl9wdXQoc3RydWN0DQo+IHNuZF9rY29udHJvbCAqa2NvbnRyb2ws
DQo+ID4gIAkJCWJyZWFrOw0KPiA+ICAJfQ0KPiA+DQo+ID4gKwkvKiBNaWNtdXRlIExFRCBzdGF0
ZSBjaGFuZ2VkIGJ5IG11dGVkL3VubXV0ZSBzd2l0Y2gNCj4gPiArCSAqIHRvIGtlZXAgc3luY2lu
ZyB3aXRoIGFjdHVhbCBoYXJkd2FyZSBtaWMgbXV0ZSBsZWQgc3RhdGUNCj4gPiArCSAqIGludmVy
dCB3aWxsIGJlIGNoZWNrZWQgdG8gY2hhbmdlIHRoZSBzdGF0ZSBzd2l0Y2gNCj4gPiArCSAqLw0K
PiA+ICsJaWYgKG1pY211dGVfbGVkX3NldCkgew0KPiA+ICsJCWlmICh1Y29udHJvbC0+dmFsdWUu
aW50ZWdlci52YWx1ZVswXSB8fCB1Y29udHJvbC0NCj4gPnZhbHVlLmludGVnZXIudmFsdWVbMV0p
DQo+ID4gKwkJCW1pY211dGVfbGVkID0gTEVEX09GRjsNCj4gPiArCQllbHNlDQo+ID4gKwkJCW1p
Y211dGVfbGVkID0gTEVEX09OOw0KPiA+ICsJCWxlZHRyaWdfYXVkaW9fc2V0KExFRF9BVURJT19N
SUNNVVRFLCBtaWNtdXRlX2xlZCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJLyogRDA6cG93ZXIg
b24gc3RhdGUsIEQzOiBwb3dlciBzYXZpbmcgbW9kZSAqLw0KPiA+ICAJaWYgKGRhcG0tPmJpYXNf
bGV2ZWwgPD0gU05EX1NPQ19CSUFTX1NUQU5EQlkpDQo+ID4gIAkJcmVnbWFwX3dyaXRlKHJ0NzE1
LT5yZWdtYXAsDQo+ID4gQEAgLTEwODgsNiArMTEyOSw3IEBAIGludCBydDcxNV9pb19pbml0KHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0DQo+ID4gc2R3X3NsYXZlICpzbGF2ZSkNCj4gPg0KPiA+
ICAJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgmc2xhdmUtPmRldik7DQo+ID4gIAlwbV9ydW50
aW1lX3B1dF9hdXRvc3VzcGVuZCgmc2xhdmUtPmRldik7DQo+ID4gKwlkbWlfY2hlY2tfc3lzdGVt
KG1pY211dGVfbGVkX2RtaV90YWJsZSk7DQo+ID4NCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+
ID4NCg0K
