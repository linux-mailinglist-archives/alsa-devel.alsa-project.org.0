Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF81DA869
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 11:34:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0819C167E;
	Thu, 17 Oct 2019 11:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0819C167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571304849;
	bh=AwN/uWlsGIjVbVqAMKWoKBpFwD+uQpj8KAPrP/YSkxQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ara41GbbGHVYgh93/VusZI1t/e7HbRP0nbx3bzmMWGOxUUmVm6P20n0lppzF+7i9G
	 EUstS55NYmqif8GqCmBnUmZHzs5IGECBdX9OWtHecMt7WUYSaXNEyELmtXkn7zR0j9
	 MSTKVUfag5Du8ak5Yc5wjLqExLIGx9VtJUdDRCz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7753F805AA;
	Thu, 17 Oct 2019 11:33:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA508F80528; Thu, 17 Oct 2019 11:33:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PRX_BODY_30,SPF_HELO_PASS,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780089.outbound.protection.outlook.com [40.107.78.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 679F1F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 11:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 679F1F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="BOTULZab"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2EC0L4E3ucE0+lZR6CVZeinYlRHsMNLESOR6GPGZJTV+MRh8/e8+dpzqLdZFaj+NBeAiwWAfo0kF2XOpnWiyMNe74KzqWerbbu8NyOMLWfjHUqExSTC4jLMD/HwiII0pB0fUoTdkzPGDm8XsC+EyVTADQTWiEdmWUKzuw15PhSdR84nhTi+r4GEvPe27WPDLCF8Sk2AXBjiKnWSPeft0crdNQIZl+3TSAXVCZXYw/Gu32EODB2IY7ha5ToGu/IyGh9qtCRblA27/0A5rVSjt2eguZKQDuqnlWO0w6NuV/58M/NoGrEiZoAwZqM7dNl9I/Awe8GaSB0qFsxNVxPE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWow3HfrVKIDprZArFQqovx80ZCZB5a3BFHSA73eCn8=;
 b=MCS3UezBc1ck9IQnbgqY4qj+KXg5gg7DjIqCha2SDVw+F0GRVnBwKud0FtkHMs5UM+sUWpHfjRuyzUpN2kSLYIhr5+DcNtT18ZxLPHl7pfNQBLUf1HsFXMxhmNXAytGFWnGzmEsWjyfXCcc3960DE1beBwu8QOPunGOrXWwwmbiCgd7ZlxOcErEOG18j1Gi0PaU+Bbf4I8l06mZUyWamWsal8A4a16+vDmEjpfJPl/7Mk48+3x9tb5BgTKi0XPOkNo1f0JBTUx9hCSQTgpGSQs9l9zsu5yAovmLt6V545pSYDFDhwGXuMCf2EEx4kJ3UlbShcpYQONWEX6Kigv1nvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWow3HfrVKIDprZArFQqovx80ZCZB5a3BFHSA73eCn8=;
 b=BOTULZabuTRLBR15oLPqCXPoXP7U3KsxEwPD5HpdLQBPXVlrShozQ83gQt5IsOflO4k/XRWppwpAqd4qkcObKfQB7HlyXLFtb6M+t//xR7mBtzXsgxQ2wux4V9eHx1LU1wqXKdxeGIxBWgN1q6uNS5hiFbgmrTrAVWpYwiCsuog=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB2889.namprd12.prod.outlook.com (20.179.71.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 09:33:06 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 09:33:06 +0000
From: vishnu <vravulap@amd.com>
To: Mark Brown <broonie@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Thread-Topic: [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
Thread-Index: AQHVd/NK02/86+8bwUqA0+UYmDRNb6dGCguAgAABq4CADmkpAIAK7WKA
Date: Thu, 17 Oct 2019 09:33:06 +0000
Message-ID: <76668467-5edf-407a-a063-50f322fe785d@amd.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <BN6PR12MB18093C8EDE60811B3D917DEAF79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191001172941.GC4786@sirena.co.uk>
 <f9b1c3d5-6e02-354f-91b6-3b57e2f88bde@amd.com>
In-Reply-To: <f9b1c3d5-6e02-354f-91b6-3b57e2f88bde@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BMXPR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::20) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebdd151c-22e3-43c9-da08-08d752e50403
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2889:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB288917FDC6A7A2DABC1542C9E76D0@DM6PR12MB2889.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(199004)(189003)(6506007)(76176011)(66066001)(8676002)(14454004)(66556008)(66476007)(31686004)(66946007)(66446008)(64756008)(102836004)(81156014)(81166006)(25786009)(7736002)(386003)(53546011)(316002)(6636002)(305945005)(478600001)(99286004)(5660300002)(31696002)(36756003)(52116002)(71190400001)(71200400001)(186003)(2906002)(26005)(54906003)(110136005)(11346002)(486006)(446003)(6246003)(476003)(4326008)(2616005)(8936002)(229853002)(6486002)(6116002)(3846002)(6436002)(6512007)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2889;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Owyg3vey/bbRRPUuiE4r6gGsNDieu63N8gN+h5DW9+TTzQG9CsKln/ih9mwWXLGWnhlhuj1TEjp30cuFhE2LuqcC0zgGd/0dPYXYUtzOKRsb/lKe5yVSu7kb1/uqi7dqBpKFI2GSNhHjS1p/Vq5s7Ve8nqITOqBDAaSZ3N/woZJyvGEoaBwXVIWlO0G2c3ssJ3gh3Alrk81BwX+FV+1QQ8rzki63mgohTTwWjx+4nKxGMc7EZ87/8ZIiScObMDsZayIfUoGtkM9VDOftiwVAlOpTfatJGhlE1Ze6vVveDtMG3hXgDyRUoHTrI4d1jHlA5zjbE2aAM8aOuPl4szDqcX6oNEhNGUvtL5IHm4YCZfjsAk9qDb8NGcg2TGKrs8MIvd461PjMVNDsnUl9XWtV7RDzrDFR2NzOfJn6WysYTA=
Content-ID: <C7CB0298D99CA54F859578B2C90D58F1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdd151c-22e3-43c9-da08-08d752e50403
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 09:33:06.6003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T6L64v7ix7nt9h3njGjGJ/3ghJxcUv3MD1V5D4JVcSU4O0akqffgYeoU5VHWqdSYDcxmx5XshF+bTM0NBsaFZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2889
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 11/10/19 3:03 AM, vishnu wrote:
> Hi,
> Please find my inline comments.
> =

> Thanks,
> Vishnu
> =

> On 01/10/19 10:59 PM, Mark Brown wrote:
>> On Tue, Oct 01, 2019 at 05:23:43PM +0000, Deucher, Alexander wrote:
>>
>>>> ACP-PCI controller driver does not depends msi interrupts.
>>>> So removed msi related pci functions which have no use and does not =

>>>> impact
>>>> on existing functionality.
>>
>>> In general, however, aren't MSIs preferred to legacy interrupts?
>>
>> As I understand it.=A0 Or at the very least I'm not aware of any situati=
on
>> where they're harmful.=A0 It'd be good to have a clear explanation of why
>> we're removing the support.
> =

> Actually our device is audio device and it does not depends on MSI`s.
> So we thought to remove it as it has no purpose or meaning to have
> this code in our audio based ACP-PCI driver.
> =

>>> Doesn't the driver have to opt into MSI support?=A0 As such, won't
>>> removing this code effectively disable MSI support?
>>
>> Yes.
> =

> =


Hi Mark,

Any updates on this patch.

Regards,
Vishnu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
