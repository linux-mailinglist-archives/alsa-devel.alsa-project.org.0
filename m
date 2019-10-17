Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EB0DA868
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 11:33:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BD6715E2;
	Thu, 17 Oct 2019 11:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BD6715E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571304802;
	bh=c284ApGdNXGscaXxasezOcjDyhFDzWx/FY/tyY9GycQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K2wZt8xQDVjc7AHD+K7yWpbTtl2AfgC9Xqc3Jx64nxrTvukTI8K9cyFNfN9cVsDFW
	 krj9J/9Wers9dNX2HHCkZQ6ewZQY7CM9I2E3bIFW5j2bU/KziePWCVzl8BPE705QDA
	 F+HJl6ut6ZeLQcJVWJFOPNA+bBjdCKtFIeBuC+jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16425F804AB;
	Thu, 17 Oct 2019 11:31:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC67EF804AA; Thu, 17 Oct 2019 11:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PRX_BODY_30,SPF_HELO_PASS,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ACECF802A0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 11:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ACECF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="dcccMuNb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dahryvCP/fa5HiLi27dIJIP4+hSRejdXJuTA2cpRqbRbVpsEyQ7BPGQLMWgbcVrlFNX8QAYF3+GwXD0TPI2HBdrTbiSuEETwzAFyYWi5NoTHzZo8tD59RXVOFf+6srl3W/jMtfSBxzx10QyWErvFnVwbCmlMlNVfkvJuvaytF9VjLYIHHy0TqDqS9oXOiEDy7PQC4rMckCw6VDm1E04r26bqFlmZqJ2t1KYE6XN659k5ZrZcwChgFMS/X0YPh8MRwCcwE0jDJ6aow0l8IJcpspxTfwiYJafEVj6bEQ9lQXuouRCB15Q20cOovlg2hBPavOuXP4saBbydLZz2AqWnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJiKzlV0mZCzK1+yNJIOzeXVBY8h8tN0j5HF3OyqZS4=;
 b=lgtE544Q8FBLccZFXHJg+lVc/w+Kgs21NuV8/uU7XBoYDBi/lPdxfclY80wMlgtptogOjqwpy7OAhOk7vRmhfR0Nna5WoLJ2Y3fw2khXtoUShis9lwiOqWsFt2Mkf9MMjrLuSnQVMe9VH5Lebenm2BGQfQK5644I0XHmIDtoiqSgoQe8CTLgMlQS29C/v+tnok58l3slyB20A8Xzq0lvJfstRKxat1PzVmEuKr+ymDB3v8OxzT5QJleTkWyAJOOqTbEOiTAkn9tN12X6jnALcxv4JR0eTsSEFsbbLASjZBilc+Wmzubom+Gyu7PIjD30STozevDDCrZjztZsvS7q0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJiKzlV0mZCzK1+yNJIOzeXVBY8h8tN0j5HF3OyqZS4=;
 b=dcccMuNbL7nejyqDz/OctC5jlXZ857fXDxu0x3C1JWgsiiCstsWSVWsPPv031yl+cREmYOOGlsY7F+Tv82Dhgqn3NuvkumTez1/2VWzmqhm8Kqi8egcJZU3GZlHgOJq942ZdE2KiczHBS2JQYOXm7WnLDy44Gc9D4+7pQXIRcEA=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB2889.namprd12.prod.outlook.com (20.179.71.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 09:31:28 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 09:31:27 +0000
From: vishnu <vravulap@amd.com>
To: Mark Brown <broonie@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Thread-Topic: [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
Thread-Index: AQHVd/NK02/86+8bwUqA0+UYmDRNb6dGCguAgAABq4CAGVYTgA==
Date: Thu, 17 Oct 2019 09:31:27 +0000
Message-ID: <88852f59-477f-59ef-8f6e-559f987022a1@amd.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <BN6PR12MB18093C8EDE60811B3D917DEAF79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191001172941.GC4786@sirena.co.uk>
In-Reply-To: <20191001172941.GC4786@sirena.co.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BM1PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::15) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11394baf-2bb5-45d5-7159-08d752e4c92e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2889:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB28893D426A25F12EB31781EEE76D0@DM6PR12MB2889.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(199004)(189003)(6506007)(76176011)(66066001)(8676002)(14454004)(66556008)(66476007)(31686004)(66946007)(66446008)(64756008)(102836004)(81156014)(81166006)(4744005)(25786009)(7736002)(386003)(53546011)(316002)(6636002)(305945005)(478600001)(99286004)(5660300002)(31696002)(36756003)(52116002)(71190400001)(71200400001)(186003)(2906002)(26005)(54906003)(110136005)(11346002)(486006)(446003)(6246003)(476003)(4326008)(2616005)(8936002)(229853002)(6486002)(6116002)(3846002)(6436002)(6512007)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2889;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r3DLhRaI67eUdMhjLzeQpTZZuhOrQobL3hlbv7/5/L668wI7/JTpUaX3VgKlM/zAqrLR1OB05J4XR76uA/VTUOTKUubc60hZFe9oB6qWy6oy1H1ALVAgTBzBGM09Ob/IyRGUcKl5RstKlHNZbzSNkGjojk8sT+hsbeq62FGDb4sl7R69IV9LwpwkDBRcQqJ1oLcm0ZEO90o0llQDntQitp+VWFB3muib8ym13OZvF0gG3ZAhUH0SEeOQH/Q/ETnrHub4s5C8dK3SdDiqCsBNrGXnx/af9Kn9xmiiBAgmZjElUTEd+/PmRwIM6G49y62qjIQ5uQXx3LfoZ1yKO2Z0fBPnlI8t+w9HQKAF3G3e/07NmMOoWvLH0LBhlaSGMqpeWJt4sQIR/y/vL7uOO5y84i9P2GnOFH0ygtaSHTvdLXc=
Content-ID: <B2688D0F3331A44F8F513ACF4C12B497@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11394baf-2bb5-45d5-7159-08d752e4c92e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 09:31:27.8818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yblcpDkHn9iBnrbVooI0QywtbWY1KbqwlLcMUwPyM5I0VNoPZ1fIS9Oiej3F40sGd6nJkoZ3zgWJ+smZdGASzg==
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 01/10/19 10:59 PM, Mark Brown wrote:
> On Tue, Oct 01, 2019 at 05:23:43PM +0000, Deucher, Alexander wrote:
> 
>>> ACP-PCI controller driver does not depends msi interrupts.
>>> So removed msi related pci functions which have no use and does not impact
>>> on existing functionality.
> 
>> In general, however, aren't MSIs preferred to legacy interrupts?
> 
> As I understand it.  Or at the very least I'm not aware of any situation
> where they're harmful.  It'd be good to have a clear explanation of why
> we're removing the support.
> 
>> Doesn't the driver have to opt into MSI support?  As such, won't
>> removing this code effectively disable MSI support?
> 
> Yes.
> 
Hi Mark,

Any further updates on this patch.

Regards,
Vishnu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
