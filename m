Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED02F37B3
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 18:54:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3116F1704;
	Tue, 12 Jan 2021 18:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3116F1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610474073;
	bh=VqjWwr8sYM4UfIqymZZ9xOULpRujsuH2E0b3TTkP3oc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YUuT2NDN14H4JY5S1haEq5qKtRJBwVmXKVQiNNVMZeG+WheSoSHfY9mGhLH/vdUT8
	 P215caYgfqcB9g3HC61oPuBWMh2yVwY4rcVDoMA/I+buFgVGFdaX+FcxfXnmQttP1f
	 MZdnCQPIRmS6UyeuOKROfQ6aBvHQwHeUIQ6U5HoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A15DF800EB;
	Tue, 12 Jan 2021 18:53:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1B24F8025E; Tue, 12 Jan 2021 18:52:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B45CBF800B9
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 18:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B45CBF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="bEcslzZg"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="Fs6tdQm8"
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10CHq6dY003872; Tue, 12 Jan 2021 12:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=5HmsngxhwXeTX9SJW2jo5rLE07Uq0qc3wmGb3p89Zjk=;
 b=bEcslzZgsmHt5ZG2p6gT9/v8sJUUaRAPzcVjVNdRwQhlkxt8/YKnvvGePCEJBbofuebx
 Y6fLzMcPqat4wnvS/p21JNISeujm7bED+dUi/8DDFtm37dSC9RgFdgrE2grNWMyBIRGJ
 NaK0wY9Ie9bi6G8lAWSspsckP0HDNVK7OOZA35yYuIn2XpiXBgTVfrxJ4/Ztv0kqjPAF
 9FFqRmjuwHvI5KXcjJd8shDVrsQSMeMvSY15cEVlFHU9dUrA/EDtXQPHyFP2CE3qERCT
 Q1Ja9QVwD+6e2ZxYbr3cepu+HDMI2FRRVYts5CU557EkdTwf24zEBNtskAsb1ecxJzDS SQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 361fyer4yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 12:52:51 -0500
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10CHqk3a095757; Tue, 12 Jan 2021 12:52:50 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by mx0a-00154901.pphosted.com with ESMTP id 361fqch2nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 12:52:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmqndnMApE19NmI7PFgVOxOFeAQgjr7u+5FeQRWi//PQWVsbEGzUvz7ORQ/nWkB7pkySMRxQ5Vv6kdU8OB5JvzwFhXoS3K9ayyQzsGXgQiyADUKQW3wgvTaNZxEDGS1OYDKeJq7UE0d1X2o2PxqCm7+0zwI4E0U8u10wdxxIU0FOn6ftzWq8Rj1mcVsCl8qCILnKaPOVhLBCOO5oa3HLzPXJPCBIgT1NMu/7B3sERnvcyLayyUidNiB5AzGaryXaB6/nzcwmEjMT6zIhxdO7DWc3QsxrgCMiKdqt6dncdsJbOvK26suMcEQkUcKOCooWLb0lUtN1hQlhgJZ/HlHagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HmsngxhwXeTX9SJW2jo5rLE07Uq0qc3wmGb3p89Zjk=;
 b=JjFd5QcI6ibN7Z9i/YdsJrtYTe+7a9mM7n4LzULLDNKmitEEsuKdLt3XAxdB2i0g6j3El+d1qn6gBJQtqyirLVJ11RCQM71dJkLYGjbvNg0WrE07grbya00D0bgfP2t9Sf010dHCYrC4V/850y5SxGAFuslbLM5kcLZ+XUC1VUhpzBdMbnZCiiw6ys3PwZmlkGPpp9zkNWDfP38ZdIFZwVyZibPsUWTxUHHwEuojW/+mVJogx8gaRuWCrTZWvkfgkU3hAbiBy4HV9o5ecl3m8xjqzfWRbAKL6wuZ7KJ8Qw9LnGhJWSGEACxyrCT0L9n83pARUQeITWCDFf+Ln2NDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HmsngxhwXeTX9SJW2jo5rLE07Uq0qc3wmGb3p89Zjk=;
 b=Fs6tdQm8Uro0qoqPAiVJi0yrSaMwdzRg6vLC6ixhZMHMeFOj99lYQ6MfoA4US2GPcqI1v6PdGWJW+aV9W+XyjCFiP2as90B+v0VFartBUWtPNQLcWpAbkS2h1f+jWNUR5J605dZBM7+pF6Y++UBszUe3u/4QPGVQHDq6fNFmXZc=
Received: from BY3PR19MB4913.namprd19.prod.outlook.com (2603:10b6:a03:367::23)
 by BY5PR19MB3537.namprd19.prod.outlook.com (2603:10b6:a03:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 17:50:11 +0000
Received: from BY3PR19MB4913.namprd19.prod.outlook.com
 ([fe80::7572:e4d1:248f:95e7]) by BY3PR19MB4913.namprd19.prod.outlook.com
 ([fe80::7572:e4d1:248f:95e7%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 17:50:11 +0000
From: "Limonciello, Mario" <Mario.Limonciello@dell.com>
To: "Yuan, Perry" <Perry.Yuan@dell.com>, "oder_chiou@realtek.com"
 <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>
Subject: RE: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
Thread-Topic: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
Thread-Index: AQHW6QbweaIJGc2Wt0KLd/ydkCC48aokRDcQ
Date: Tue, 12 Jan 2021 17:50:11 +0000
Message-ID: <BY3PR19MB49131AA4EAE7C24D365FAC8DFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
References: <20210112171814.5404-1-Perry_Yuan@Dell.com>
In-Reply-To: <20210112171814.5404-1-Perry_Yuan@Dell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-12T17:48:32.0519032Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=e567c948-e8b8-4133-bf11-8a9ec001aac6;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: Dell.com; dkim=none (message not signed)
 header.d=none;Dell.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81c01d08-122c-4762-6a6b-08d8b7228277
x-ms-traffictypediagnostic: BY5PR19MB3537:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR19MB3537243187414255BE67AB0BFAAA0@BY5PR19MB3537.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TJ8abgUhz3eHZN1f/H5Zhmy4MyHtuFYPOBYQ7fN/XmtFbW+LZC2EVvkoFGQDFHo5kfIGkvcZhAIirTodmaluxzZgBvIAWJBakSoVaunqo6CrqzsKlqjOYobIw0+htbIKMhxd+A+F0T8JtBXE7EVJBfYJVA/6DH9oni7vJpOd2Y7WxuicvNkhWSI72/QYwWhH1cSC6lbf/HSmX9USrfKOud7dMocqK9Jpf8dQGDhYxSVtMxRHOVDiQU9P6PUcKhdDBSpaq2I84AWsgfsQj4xaQDDxVsRG9z+M+sF4HVBmRM1WfXRblML+6ge/Kcu5/zlx97V/mTH0SQcGHBvLgf3vZm/FSJULieGsEjViFb+D1YRSa+pZjDcJi5G5TeFvANHV/t/N2XPEccX6C6ibIBaveQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR19MB4913.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(4326008)(53546011)(8676002)(786003)(316002)(71200400001)(6506007)(7696005)(8936002)(26005)(186003)(478600001)(55016002)(9686003)(110136005)(2906002)(54906003)(83380400001)(52536014)(66946007)(66556008)(66476007)(86362001)(76116006)(33656002)(64756008)(7416002)(66446008)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?slxbAPGs+tDeAzacs0wtW0YOqPK8FbvBT86BE4XbBbKtXv4GHPPxCIQ80G41?=
 =?us-ascii?Q?kLkz+Y9njoQIDd5mMp8VlhBtubg6y4pmjkFlshLIdt66apLxwkB2FEpjJH/U?=
 =?us-ascii?Q?ZWG/SsHpIvIxa5O0GBQB2OwGsFLBUAlOJ7l+rNnMk72cAIn5VQF9K+hNUYbC?=
 =?us-ascii?Q?wkX2H8+aACvXsb2yPQHOyIESYWXvd23mLOUsN7uRBT6rUMqvE+MUENyvxrUE?=
 =?us-ascii?Q?80mjuiqvsuZXhj00OJkUp8FJoln2BDj9C01F59of57LW1XHsPl/N0w1kGRA3?=
 =?us-ascii?Q?/H2GcQJhLMyDeR1TOirWEVWSUceRH/BksuZ/lkoW6JTtCkzA7FHiPorLoymB?=
 =?us-ascii?Q?YoJaIT6Ei/m44VhaWH0dBTGZijpDN5z6owRRNtISqka4sk8EkIe37D/E3o4M?=
 =?us-ascii?Q?/109TKwk1oON5nHU4iAhA+BUlpWIWjnSfDDkbIBo8R8DbMlnkJddqSfmXiai?=
 =?us-ascii?Q?RYSKM13RrvqPKywNZw+ZL1O55srcMwpcXu4A+jSPLirnEaPspbUNbev0BgwO?=
 =?us-ascii?Q?dP6TZ4aQnCBx3p7DV4UivXrkHYdn0aiqhmferUH85i3bJ+Z3jHANbKCrWsz8?=
 =?us-ascii?Q?j9PVnrmsCMatvc6DsWurb7xhQP1Rutb+C/P81b0nMuzkMDFFWJDZQrSzmoEb?=
 =?us-ascii?Q?HchOc27AYZVIAkltYprnmtxnTZ8bL3SXHHTKJ4JRKfJi7nPF3Vyfo5Ezvlp2?=
 =?us-ascii?Q?DFPPwOiFe+A+rSbInd7Du9I/Od+e/zzfH16gzGAGNIJj4TcE2fEQ7oNTDQSQ?=
 =?us-ascii?Q?OtzLRhzPIJGzQ0cERloKrFmPOYzJ4sB2xkVuOdRWPrEr8uMLEn+xWDzGaISz?=
 =?us-ascii?Q?fiAWYYsainoTcRix4KgDSy5HH9Ptf+wChY1CNskuvHXyMuCa5ftSYkwYQrRG?=
 =?us-ascii?Q?XFNNFjSddCAhRaTfWQayRUL4gRMDtfmPeyrAGv6LyeolJPprPhL3wyvaFTkO?=
 =?us-ascii?Q?udKHOR63QlAfPM3h8avOBE51whJpz2AiFB4bs6XeiY4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR19MB4913.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c01d08-122c-4762-6a6b-08d8b7228277
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 17:50:11.7514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xq/woqfPk16shPM63mbos/cAls7ub3rhD83qfhCFQUZVbDetgzHvMrBVC/Afrld7hT/hiF907gHkrh1AoxnrDKsOAc6jyOCNi1OCFl7mloo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3537
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_12:2021-01-12,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120105
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101120105
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
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

> -----Original Message-----
> From: Yuan, Perry <Perry_Yuan@Dell.com>
> Sent: Tuesday, January 12, 2021 11:18
> To: oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
> hdegoede@redhat.com; mgross@linux.intel.com
> Cc: lgirdwood@gmail.com; broonie@kernel.org; alsa-devel@alsa-project.org;
> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Yuan,
> Perry; Limonciello, Mario
> Subject: [PATCH v3 3/3] ASoC: rt715:add micmute led state control support=
s
>=20
> From: Perry Yuan <perry_yuan@dell.com>
>=20
> Some new Dell system is going to support audio internal micphone
> privacy setting from hardware level with micmute led state changing
> When micmute hotkey pressed by user, soft mute will need to be enabled
> firstly in case of pop noise, and codec driver need to react to mic
> mute event to EC(embedded controller) notifying that SW mute is completed
> Then EC will do the hardware mute physically within the timeout reached
>=20
> This patch allow codec rt715 driver to ack EC when micmute key pressed
> through this micphone led control interface like hda_generic provided
> ACPI method defined in dell-privacy micmute led trigger will be called
> for notifying the EC that software mute has been completed
>=20
> Signed-off-by: Perry Yuan <perry_yuan@dell.com>
>=20
> --------
> v2 -> v3
> * simplify the patch to reuse some val value
> * add more detail to the commit info
>=20
> v1 -> v2:
> * fix some format issue
> --------
> ---
>  sound/soc/codecs/rt715-sdca.c | 16 ++++++++++++++++
>  sound/soc/codecs/rt715-sdca.h |  1 +
>  sound/soc/codecs/rt715.c      | 14 ++++++++++++++
>  sound/soc/codecs/rt715.h      |  1 +
>  4 files changed, 32 insertions(+)
>=20
> diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.=
c
> index b43ac8559e45..861a0d2a8957 100644
> --- a/sound/soc/codecs/rt715-sdca.c
> +++ b/sound/soc/codecs/rt715-sdca.c
> @@ -12,6 +12,7 @@
>  #include <linux/version.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/leds.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm.h>
>  #include <linux/soundwire/sdw.h>
> @@ -244,6 +245,7 @@ static int rt715_sdca_get_volsw(struct snd_kcontrol
> *kcontrol,
>  	unsigned int max =3D mc->max;
>  	int val;
>=20
> +	pr_err("++++++rt715_sdca_get_volsw++\n");
>  	val =3D snd_soc_component_read(component, mc->reg);
>  	if (val < 0)
>  		return -EINVAL;
> @@ -261,6 +263,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol
> *kcontrol,
>  	struct snd_ctl_elem_value *ucontrol)
>  {
>  	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct rt715_sdca_priv *rt715 =3D
> snd_soc_component_get_drvdata(component);
>  	struct soc_mixer_control *mc =3D
>  		(struct soc_mixer_control *)kcontrol->private_value;
>  	unsigned int val, val2, loop_cnt =3D 2, i;
> @@ -268,6 +271,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol
> *kcontrol,
>  	unsigned int reg2 =3D mc->rreg;
>  	unsigned int reg =3D mc->reg;
>  	unsigned int max =3D mc->max;
> +	unsigned int val0, val1;
>  	int err;
>=20
>  	val =3D ucontrol->value.integer.value[0];
> @@ -287,6 +291,18 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol
> *kcontrol,
>  			return err;
>  	}
>=20
> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
> +	/* dell privacy LED trigger state changed by muted/unmute switch */
> +	if (mc->invert) {
> +		if (ucontrol->value.integer.value[0] || ucontrol-
> >value.integer.value[1]) {
> +			rt715->micmute_led =3D LED_OFF;
> +		} else {
> +			rt715->micmute_led =3D LED_ON;
> +		}
> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
> +	}
> +#endif
> +
>  	return 0;
>  }
>=20
> diff --git a/sound/soc/codecs/rt715-sdca.h b/sound/soc/codecs/rt715-sdca.=
h
> index 840c237895dd..f8988ab88f80 100644
> --- a/sound/soc/codecs/rt715-sdca.h
> +++ b/sound/soc/codecs/rt715-sdca.h
> @@ -31,6 +31,7 @@ struct rt715_sdca_priv {
>  	int l_is_unmute;
>  	int r_is_unmute;
>  	int hw_sdw_ver;
> +	bool micmute_led;
>  };
>=20
>  struct rt715_sdw_stream_data {
> diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
> index cdcba70146da..b4e480744c94 100644
> --- a/sound/soc/codecs/rt715.c
> +++ b/sound/soc/codecs/rt715.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
> +#include <linux/leds.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm.h>
>  #include <linux/soundwire/sdw.h>
> @@ -88,6 +89,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol
> *kcontrol,
>  		RT715_SET_GAIN_MIX_ADC2_L};
>  	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
>  	unsigned int read_ll, read_rl, i, j, loop_cnt;
> +	unsigned int val0, val1;
>=20
>  	if (strstr(ucontrol->id.name, "Main Capture Switch") ||
>  		strstr(ucontrol->id.name, "Main Capture Volume"))
> @@ -95,6 +97,18 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol
> *kcontrol,
>  	else
>  		loop_cnt =3D 1;
>=20
> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
> +	/* Micmute LED state changed by muted/unmute switch */
> +	if (mc->invert) {
> +		if (ucontrol->value.integer.value[0] || ucontrol-
> >value.integer.value[1]) {
> +			rt715->micmute_led =3D LED_OFF;
> +		} else {
> +			rt715->micmute_led =3D LED_ON;
> +		}
> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
> +	}
> +#endif
> +

You might have missed my other comment on v2 feedback, but is there a reaso=
n
to keep it behind a compile time flag for dell privacy module?  In practice
any other future led backend provider should work too.  Another way to thin=
k
about it - if dell privacy wasn't enabled would this cause a problem to run
this code?  I think it would just be a no-op.

>  	for (j =3D 0; j < loop_cnt; j++) {
>  		/* Can't use update bit function, so read the original value first
> */
>  		if (loop_cnt =3D=3D 1) {
> diff --git a/sound/soc/codecs/rt715.h b/sound/soc/codecs/rt715.h
> index 009a8266f606..57c9af041181 100644
> --- a/sound/soc/codecs/rt715.h
> +++ b/sound/soc/codecs/rt715.h
> @@ -22,6 +22,7 @@ struct rt715_priv {
>  	struct sdw_bus_params params;
>  	bool hw_init;
>  	bool first_hw_init;
> +	bool micmute_led;
>  };
>=20
>  struct sdw_stream_data {
> --
> 2.25.1

