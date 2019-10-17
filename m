Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFEDDA84A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 11:28:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A518585D;
	Thu, 17 Oct 2019 11:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A518585D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571304515;
	bh=jasZ5H5pa+gkXsgbY7bG+WVKci9vtfkdG+5gKgFWIq4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y1MITBBjmyLBWOAZOO2Ac63XLV8M8cUApZ9bM/Uca/bhJbjE3zvql28gWVhzkOYvU
	 J05P7mRfF/DZCJ6v0M7fQ8k9ic7ZY2OF6pNeHRGx2HgKr7swzGptt+ho2S8OZUgfeG
	 LQue31lYYILY/8sXUyfY/yDup4BuTd5qvthXiQmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF0C9F804A9;
	Thu, 17 Oct 2019 11:26:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BEE0F804AA; Thu, 17 Oct 2019 11:26:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690066.outbound.protection.outlook.com [40.107.69.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0383FF80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 11:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0383FF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="cBp8zqu1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKAdGZFjXSKevQNzr+M1PycqcVPXYWjyxV0hr3I4PnFwfjNmfqHDl/96pmR2fFHeOPBtHV/oF40FLbzWSKF3G193BQMsbAGbYTNFd1nnsThwSk0ZX58RvxCz4vSBFCbxcxOXCTeR3vGf6zUx6pj0K6J1al8uDcFBKzzg3bM0vG95uyGdmUJwd7KpjObZjQRC5Rq1z5+wGtGdwX2cxozCXgRGNaZcehFKxLPr15VOr7ts4jh5bd2XC8awrih2KJvbfp3iiqVPpbM95mnQBHRYJIyAGqX+pxrItpHa2T9KlG3qWkw1K6GDTWHB4dxdg9FdVdhYeqwHXJlSegoZSLHIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebgojj5lmzkjXyBQkywOKrjP11zL1M6jDKVkZzVDaIo=;
 b=CwmD/7bJPqGr1vofl7eFS9NseVJPhzWNh/i/qbLY4IDKubr4xmSMpZtuWzkLglbYBf4VafGQWcwgm5K63/Dthy2gj8Ck9eLZZysqNR51j9+krlhUlKAT2Mp8jCMYmgM5b832Oq1fUeKoYCJVRkQO//JcVk6MsugIiW2/a1bVWQmAnBvFNCTUHf0e/u0BE0zIRctQrWhNYWyUsTsaioL0lgF1fY/+NYLPZUhx8WPa2QPvXYMhDpIaURxmUmAmsBzGCqcIGjKhJvHoO/wOz/ufHdKAJU9u7umypm84BnSI1c7Q0vHFH5x6N8+aegGfpmZLHRocWUufdP344tWMSNZUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebgojj5lmzkjXyBQkywOKrjP11zL1M6jDKVkZzVDaIo=;
 b=cBp8zqu1NfRTPQEH2yVJ5QKZOA8Gdr8dxxXGbSqKAkAzkJMJDZNaM0V/okELnczvIWLQcHrrMHQaz/zK+wktjMFX7hRIc3dVnovmHXHmuP5kVjcGhiCTLlQG7CnOH94tFSzmR06kowqzsxAjYcLS3X3elQGo7a7MWK6ByD7erPs=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB3033.namprd12.prod.outlook.com (20.178.30.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 09:26:40 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 09:26:39 +0000
From: vishnu <vravulap@amd.com>
To: Lee Jones <lee.jones@linaro.org>, "RAVULAPATI, VISHNU VARDHAN RAO"
 <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 2/7] ASoC: amd: Registering device endpoints using MFD
 framework
Thread-Index: AQHVd5gysBGn4q83rEe097OrmwWXeadFWHuAgADs8gD//2r6AIAAc1YAgAEphICAAAlmgIAABseAgAyKavCABePhAIAFlW4A
Date: Thu, 17 Oct 2019 09:26:39 +0000
Message-ID: <ca3d7434-e15e-b701-8a42-3d9eadacf227@amd.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569891524-18875-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191001064539.GB11769@dell> <2ff13a61-a346-4d49-ab3a-da5d2126727c@amd.com>
 <20191001120020.GC11769@dell>
 <BN6PR12MB180930BD7D03FD7DEB14D7C1F79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191002123759.GD11769@dell>
 <BN6PR12MB1809451A3152488F3D8D1371F79C0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191002133553.GA21172@dell>
 <DM6PR12MB3868561CDEEF9D21940E8F57E7940@DM6PR12MB3868.namprd12.prod.outlook.com>
 <20191014070318.GC4545@dell>
In-Reply-To: <20191014070318.GC4545@dell>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::17) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88c61541-ce33-4d31-e558-08d752e41d67
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3033:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3033FF3DA04CAF085A5D8C2EE76D0@DM6PR12MB3033.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(189003)(199004)(81156014)(99286004)(486006)(6306002)(316002)(31686004)(6512007)(71200400001)(71190400001)(11346002)(446003)(81166006)(26005)(52116002)(8676002)(31696002)(256004)(53546011)(76176011)(6246003)(102836004)(6506007)(8936002)(66946007)(2616005)(4326008)(476003)(66476007)(64756008)(186003)(2906002)(3846002)(66446008)(14454004)(25786009)(386003)(6486002)(6636002)(6116002)(5660300002)(66066001)(66556008)(478600001)(54906003)(110136005)(7736002)(229853002)(305945005)(36756003)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3033;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 66An7w43HP0b048ZwTCRr2uSsnBAa43sWmBwrm2+rvnofSO70auqk7sPEIL774M3HL+6ty7iYcLtFGwCGP3OAujUsIu1UDVVrQDENBbaSZPQMZm6me3rUob4N1HVXHXYeIdKJgTLe5tEsxGfnSk+oAomuRAGK5934eP4KqbxrsYTjTWVklY7jX6Wmc35oPYG5qZ1YRYTkHWotaw9ZXrlQpymRSIuEeEiErLeqUTg0CD4IWMBHXWsNkvCNjSBGnI/G5jXU5lCiVBV4JYL7LSkorc51d5FsgyWKGSKPBPsxBpcNdja9ZgL25fUji5wmwP5+V7A2WJa53U6UqibF1vSj2uUs8ZRd9w4/885MRPHZcdcWgP+xDIfw8lp4u4M5Coat7z09fRtmNKZYZUV4Nom0jXGYHYUMkTuEvymAOHiWnw=
Content-ID: <B026E4F768F0C642A15381F8EE109635@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c61541-ce33-4d31-e558-08d752e41d67
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 09:26:39.7352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rb5kMJuBApSZ3ZCntMmUJ9KelmFsUgYZP8AL1bRZbKyhLviSjtipAYFl/l61YP2H4ump9nao8OcbAmZub5csEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3033
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mehta, Sanju" <Sanju.Mehta@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 2/7] ASoC: amd: Registering device
 endpoints using MFD framework
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

Hi Lee,

Okay.We will proceed with existing platform device model.

Mark,

I will resend the patches with the review comments addressed.


Thanks,
Vishnu

On 14/10/19 12:33 PM, Lee Jones wrote:
> On Thu, 10 Oct 2019, RAVULAPATI, VISHNU VARDHAN RAO wrote:
> 
>> Hi Lee,
>>
>> We have two instances BT and I2S.
>> We need to create devices with same name added with number of device
>> like example:
>> acp3x_i2s_playcap.1.auto<http://1.auto>
>> acp3x_i2s_playcap.2.auto<http://2.auto>
>>
>> by using MFD we can make it happen automatically by giving
>> "acp3x_i2s_playcap" and other extension will be added by MFD add device API.
> 
> The auto extension is handed by the platform_deivce_alloc() API.
> 
>    platform_device_alloc("acp3x_i2s_playcap", PLATFORM_DEVID_AUTO);
> 
>> This helps us by rectifying the renaming issue which we get by using
>> Platform_dev_create API`s.If we have to use platform related APIs then
>> we need to give different naming conventions while creating the devices
>> and cant use it in loop as we have 3 devices we need to call three
>> explicitly.This make our code lengthy.
>> If we use MFD it would help us a lot.
>>
>> Please suggest us how can we proceed.
> 
> You have 2 choices available to you based on whether your device is an
> MFD or not:
> 
> If yes, move it (or a part of it) to drivers/mfd.
> If no, then use the platform_device_*() API.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
