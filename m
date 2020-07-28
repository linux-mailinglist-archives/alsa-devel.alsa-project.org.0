Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6322230DB7
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 17:26:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FC3C16D2;
	Tue, 28 Jul 2020 17:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FC3C16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595949997;
	bh=ZHHTBJVbpQvfYptUyfc13tK2GD4lHLOt69s2CM6SoRM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=STzmU5G0Kzu+kUKAGPv58W1IGQOp1zq7pUDJ3NkTBHzKvsA3BeePwI8pj4jQArKnJ
	 BtB063Vbc1Dc/Q5YWqJM7+WF/6BO3EZU4rdNK2N4dkj0kbI1Za5Pivdoa5hpRxyeWK
	 poFkZIDsyIUz7L6gKrrIS985M+kTpNj3iCj5I4WM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79EC3F800DE;
	Tue, 28 Jul 2020 17:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95786F8021E; Tue, 28 Jul 2020 17:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D251CF8012F
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 17:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D251CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="q9lmQALf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPoNlqX2fT2TTd9ZJG2O3ZwYYlZdC6+VLIq+qJCLzZ2V4j2JtfMbS9L0V2sb3yFykDkLykpvZ2EYE3XR0K5Vvbgh2RvU4cYA5sDwewwKXH4aVdAObi4Q3CrLHURXKb1brKvCAN+c+vYT7tx7nuKVDsPeEchphFPZxXfRp7Hw800pVTeIMLXvzdVcBYAd0HDGuStKXDJNBDRr7LGbJBAKh84xzRFlCzmnwVT/eLewIWWzCcGuBAq9qu+zBmt/sEQsGeHEN88tnU6rmIH6cWndQKfZgVgb8QNCDwKYg3MiakaBUWPLJ4UdryE3wH1DlTz9JPrs80PVME7r7iNAUrBLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaMUln79GxgSkRGYEsPQx2uQ2IAm8MxWZS0aB3Ib+Ns=;
 b=OsJfoE35FL5G7Jzs/nxizutilTmY8ZkzJb4bV6W5IwrXYKRyG7x5CVctyFGPe6mi94bzfBoQUMHcbAKqDRiqr69T9UV/bBUKRt/VT03jNemCk7jp6DDV1YdQjhcer1yif6fQsrztDJEkbEUXpMhZ92VoRP9AdHxGRIdnu7ay4rhcm2tRGfa9f59OmHqtCx1zElwou7nDsZtEAlVUHgKHctUB9ADw/m6tKR0cPwtwPebivWr2Pyzdnyo7dPG+SgQuZ0yVNzGj8rYXcmcdSoY/b4tJpWcrL8Ws2+D0gVgpKmty8arTtBjt3kweaurV8Yd6aBIUxBYMOWsHKf6xeMtx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaMUln79GxgSkRGYEsPQx2uQ2IAm8MxWZS0aB3Ib+Ns=;
 b=q9lmQALfLqeWivgT6kTvcOIuifgK0/vMxnH4VEWi3pIRHkOSWcUcW9xDbww/di+TnUznrtxu2ZIbA+o3P2Ii4o43qQNp643xr4VS9O9Q3EnEpxMxP5nxnjDhXfRb97kUn687AEYU7HeDa0PfasU9l3fqPGhYegit5sPPdO3hYic=
Received: from DM5PR1201MB0139.namprd12.prod.outlook.com (2603:10b6:4:4e::8)
 by DM6PR12MB2908.namprd12.prod.outlook.com (2603:10b6:5:185::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.33; Tue, 28 Jul
 2020 15:24:42 +0000
Received: from DM5PR1201MB0139.namprd12.prod.outlook.com
 ([fe80::213d:5180:d4b:467b]) by DM5PR1201MB0139.namprd12.prod.outlook.com
 ([fe80::213d:5180:d4b:467b%10]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 15:24:42 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [PATCH 3/6] ASoC: amd: SND_SOC_RT5682_I2C does not build rt5682
Thread-Topic: [PATCH 3/6] ASoC: amd: SND_SOC_RT5682_I2C does not build rt5682
Thread-Index: AQHWZCbm+DcS7P+G90ayphwZlFTok6kbjasAgAAKsoCAAPTPkIAAWbgAgAADLQCAADOsQA==
Date: Tue, 28 Jul 2020 15:24:42 +0000
Message-ID: <DM5PR1201MB0139AC067DF7F2E2AB9FCC96E7730@DM5PR1201MB0139.namprd12.prod.outlook.com>
References: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200727145840.25142-3-Vishnuvardhanrao.Ravulapati@amd.com>
 <c467e2ee-727d-4bf5-8ceb-90c784245a43@linux.intel.com>
 <20200727160941.GE6275@sirena.org.uk>
 <DM5PR1201MB01393D93D69F1552408BFE79E7730@DM5PR1201MB0139.namprd12.prod.outlook.com>
 <20200728120700.GA5055@sirena.org.uk>
 <44e86246-516f-3a32-af66-e1c23f560e77@linux.intel.com>
In-Reply-To: <44e86246-516f-3a32-af66-e1c23f560e77@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=ff9c74f7-fbdb-4fa0-8e8f-708dcc81dd75;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-07-28T15:23:19Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.115.91]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ff2cd390-b6c3-4942-ed7e-08d8330a5a1e
x-ms-traffictypediagnostic: DM6PR12MB2908:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB29089D75F332AA82ECFEDB8CE7730@DM6PR12MB2908.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pNbaVJ7avHxPFeITh1M3tUl4t+rAbJy3yFKonwvBHeQzOaEgTLZReD5W0rQcjKetFia83umlUmvH5NUqJDXzPswAExSNsYavJw4N4SKOJ+RArFsanP1Afc8TkjEw9qkxtxrVnN7e0qcv2zgRyF6y/PXI7/PcbxMmyV7mBHzicCFRv7ywPCCHCn8s/rQnGA6e5U1QaEoKZZ4zR+z0odtlofiocYyldSk7MYNVyZsJrD3tOMiTHcBpDOW8Oh7K9Hj5Pv2OtfH1sPyjXR4KpRpGKtD7BjACDsrfhOLxcZfBRh6pHjsLtQWb2AmetKLnrmpM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0139.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(66476007)(66446008)(52536014)(66556008)(5660300002)(478600001)(71200400001)(64756008)(4326008)(54906003)(110136005)(8676002)(8936002)(2906002)(66946007)(316002)(9686003)(86362001)(76116006)(83380400001)(33656002)(26005)(186003)(6506007)(53546011)(7696005)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: O4nJ27LaxUn+QVCihIqQLAHnhiT6H1xA7g9DLRqi/CYfYBhaBVxuu/AndgZIhpqRUGViqW7DR8SgyLEdKSlNg+SiPITQ4Ju6AsKVKAsPH6iEzTzxcmvv8UQRTKPNjv3stm0/m1GR7WHWk58lQbR4z19cyJ+jt/SKsaDSBqsiTE9gCRNMQsoY44ly+UuOorbrDD7htrtSueM+xSEzketm0+ltz3FZAn+7gKtJ3xcT72G5oeVxQuJC993fxQJg5w3ItL15hGqqb1EgEkeorEZppUbtNPB0JVVi5UyM9su81MoAHqQklg3LrWUAzzLMvJW5oP3mA+QLG1lR1tPJS0B28PHgKrdaK2LpNVdfHM0gtq0PgdU6/LspH7YE8q86LhAsWrqvfG8np/QyQt1UcwURklx1jseuy3gLlLqmkaKpxZaNUBYDU3YVSlZUciSfrlj5A7VJ8xBRpwPDJxqmipPffuvUkzu3S3xV+GaYd+qITue5CORxyPSlk0qMMtjDmGeO
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0139.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2cd390-b6c3-4942-ed7e-08d8330a5a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 15:24:42.5731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xec293yxFzj/Mq6NrzDoVZnz7IIktf2+ucdYxaCdLCbl20yUNTlqax7iQ7p9nyFHW/0w9RJbh1MWpQuHDmNtmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2908
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Arnd Bergmann <arnd@arndb.de>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Agrawal,
 Akshu" <Akshu.Agrawal@amd.com>
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

[AMD Official Use Only - Internal Distribution Only]

-----Original Message-----
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Sent: Tuesday, July 28, 2020 5:48 PM
To: Mark Brown <broonie@kernel.org>; RAVULAPATI, VISHNU VARDHAN RAO <Vishnu=
vardhanrao.Ravulapati@amd.com>
Cc: moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM... <alsa=
-devel@alsa-project.org>; Arnd Bergmann <arnd@arndb.de>; Liam Girdwood <lgi=
rdwood@gmail.com>; open list <linux-kernel@vger.kernel.org>; YueHaibing <yu=
ehaibing@huawei.com>; Takashi Iwai <tiwai@suse.com>; Deucher, Alexander <Al=
exander.Deucher@amd.com>; Mukunda, Vijendar <Vijendar.Mukunda@amd.com>; Enr=
ic Balletbo i Serra <enric.balletbo@collabora.com>; Agrawal, Akshu <Akshu.A=
grawal@amd.com>
Subject: Re: [PATCH 3/6] ASoC: amd: SND_SOC_RT5682_I2C does not build rt568=
2



On 7/28/20 7:07 AM, Mark Brown wrote:
> On Tue, Jul 28, 2020 at 06:59:50AM +0000, RAVULAPATI, VISHNU VARDHAN RAO =
wrote:
>
>> So Actually for rt5682 codec Now in 5.8 there are three flags :
>> SND_SOC_RT5682
>> SND_SOC_RT5682_I2C
>> SND_SOC_RT5682_SDW
>
>> But till 5.7.8 we have
>> SND_SOC_RT5682
>> SND_SOC_RT5682_SDW
>
>> So in our design we were using SND_SOC_RT5682 which build
>> snd_soc_rt5682.ko Creates the respective codec_dais as defined in
>> that .ko
>
>> If we use SND_SOC_RT5682_I2C we get snd_soc_rt5682_I2c.ko , it is not cr=
eating the expected codec_dai links.
>
> Could you be more specific about the way in which "it is not creating
> the expected codec_dai links" please?  What are you expecting to
> happen and what happens instead?  Do you see any error messages for examp=
le?
>
>> As there are three flags defined in codecs, I expect that previous
>> one which we were using(SND_SOC_RT5682) is not a wrong flag and I
>> expect to use
>> SND_SOC_RT5682 as it is still available.
>
> Given that the core module does not register with any bus it is
> difficult to see how that could possibly work - the core module
> doesn't contain a driver at all.  Have you tested this change?

I share Mark's point. Have you tested this change on top of Mark's tree, or=
 only on top of the stable kernel?
Ok. I will drop that patch and send the other series.

Thanks,

