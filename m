Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B5515A44A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 10:10:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0D0A1662;
	Wed, 12 Feb 2020 10:09:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0D0A1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581498642;
	bh=E9z+g5bjWYyFvXQB4kULsMM1Vy9sdrn5FZXOs1kNAvM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YPbppZjMinLbRRpk+SuTkSw0dzzcY0EHxRBSf+ixXFjkEe8CsNjBuyYpjHW/TrRAW
	 +hlZED+781ykWc3dK56ITu1q4u1Bq9jj42ZM/Yb4c3G+JZ5L/6DykUgVsVvFPKDzBl
	 6g3NJZjckcVeHWz62sj18s4OhhpptiFAnf3WAxWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B44F80158;
	Wed, 12 Feb 2020 10:09:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8943F80125; Wed, 12 Feb 2020 10:08:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94984F80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 10:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94984F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Cm1guE96"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9HBgyw/MCki5eoDurA7EFkMrYHLzvaW8aRcEIYlkAco65zDv2Hot0yiSzpg762xYSAlB4WM6THwQ6mlrIhegogjGG/uaxKAAEHZ4VreIS0S1oHMg65Moy6Pt2UvoFSW2OXGz7yQ+F3WG6uVGEzxk///3f4I/RwRnxx9U8Ur3qOn9zTY33W1f0haBaDlsMUXH5WHg4NJLjoyy++z/5RnvnkW0KX7DZ0l8EbN893Nzc0awlsD3uS25/hCPG1hpvYhRrK7zklTwy9Jxts8DXSv2PPKD1gLwPhhLUDQj9WDQcIXdXXkRf7gvPnSw2+DRwz0eQRssDmwGrAmVKjoZilb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXTivQ7eLvuhRAMBqe3k4QgJPPe6DRGwzA+6HB/RF0A=;
 b=LH3U2n5MRv8O2Cn4XfATy7Rr0Kn8Ax3TyGPRmEJ3JzTm7qT34TNM6lu+QjYszYjuPKNL6wArLYZKm2XlH/jyXrZuI/ZDGj3zzGspSqwT67kuIEXEKTd6u2Tly0VCohXUeeI33h8OdycuMlp1kp4y4h8ctMa8MAMI68hETlIWSIhI423Z79yrVeaWscmqmCH+Z0WxJZ6cu7q3o3eenlBAV3wh83D0eh0XSZo5AVRs9zs31g0oeSmdCr1dGSBZL1M60dT3h2u0kO+spWQ/6nN3pwr9XvFlyKtGYZttAHKnTZYj/RKMCFwBeM5kK3BxRPGS2Sc1LShcdwIBbJWZgs5pAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXTivQ7eLvuhRAMBqe3k4QgJPPe6DRGwzA+6HB/RF0A=;
 b=Cm1guE96R5CmV21CcX3QUIRndAkralc45OQxFKgLbjumfJGzqZRO3dX54C6QUjARM1X8nmlduYbgkCAP6A4CH4m1kRkhX7qpa/x1ZAyOAfpohapHyXMl+TIFwTc+4XvnUjex+4xkykWEYpwt7l2GMpkcqXvu+/Rd5/NtQlsay/I=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB2986.namprd12.prod.outlook.com (20.178.198.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.28; Wed, 12 Feb 2020 09:08:52 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::acd1:24ec:991:f353]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::acd1:24ec:991:f353%5]) with mapi id 15.20.2707.030; Wed, 12 Feb 2020
 09:08:52 +0000
To: Mark Brown <broonie@kernel.org>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1581426768-8937-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200211153847.GK4543@sirena.org.uk>
From: vishnu <vravulap@amd.com>
Message-ID: <c4b900ee-743e-8ce0-1061-02c383bff90e@amd.com>
Date: Wed, 12 Feb 2020 14:36:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <20200211153847.GK4543@sirena.org.uk>
Content-Language: en-US
X-ClientProxiedBy: BMXPR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::22) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
MIME-Version: 1.0
Received: from [10.129.9.12] (165.204.159.251) by
 BMXPR01CA0036.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22 via Frontend Transport; Wed, 12 Feb 2020 09:08:48 +0000
X-Originating-IP: [165.204.159.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64dd54c0-e341-4ab9-9ef8-08d7af9b2e02
X-MS-TrafficTypeDiagnostic: DM6PR12MB2986:|DM6PR12MB2986:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2986C3710F2A4230585E4A0CE71B0@DM6PR12MB2986.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0311124FA9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(199004)(189003)(81166006)(81156014)(26005)(110136005)(36756003)(2616005)(8676002)(31696002)(6636002)(956004)(7416002)(8936002)(52116002)(478600001)(4326008)(6486002)(186003)(53546011)(66946007)(16526019)(54906003)(16576012)(316002)(6666004)(5660300002)(31686004)(66476007)(2906002)(66556008)(43062003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2986;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cEmVanYSlK2r3LWwnyNdoEJ1bfExplo6LuFjX1v4sqp5zUihTljpfdOLoMxmcFm5NalJ8/S37GOcoa86NR2IexkRPpQhHRkMKM0/0pkyQ17ZF4Km96Hg5qcbcaS8R01OjGNregn1uqTk/Kmc8rkR+vagZBManCcLUlkz0awZo7+m0gf6UcdU16ItarArlbvQbBzUpi9fxbVXhI9nQqlZtZP6vgNLJd1U1bBS87jiRQ9UMWCOuDfkiYgSQRI3AmTU4kqhNfOh0jkXcdbo5bgMH1zseJlKo+V/rKR+9rR+NJwwU+w62AulqQPp8kxWI2xFZlZnwcaAzyqt7HBZX0SC2N6bFanCYOH1/XRe042cxrSQu4g0sFgMkL2NZ1KlbHHIfG27AEUEpqjcgzdm3pzsPM2iDQFVmk+X1ADCJAMUDXSsex74mjSGOaf0QUiCOmX6C3Hqu2r3PfSoPfFhiAsyPwJOtl8cQP3nm6xs2esGZKY/raZQ3hACxEms1RFLoFRT
X-MS-Exchange-AntiSpam-MessageData: tl7kj3LiJ5IKYjrazo8LSlu10xCpyWvRQPxbMpA4kzyBneyulX4C3EiU+J8GauNB/GcoDchseEY6dh0fL3hFpjJoOJOQ8vSaFZ9Gey5lR1IhglN3/KNtobeyxCSmEB6EDr9XkyxC6l/HL860pS1n+g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64dd54c0-e341-4ab9-9ef8-08d7af9b2e02
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 09:08:52.6248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEswVZVh0AK8b5Dz+CICfLvWX2hIUpbLFZZxUKz+8DHkVU4OwbDoIxR6A2kYwDcH+ZAUF5exckLW56ddkcVVcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2986
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: amd: Buffer Size instead of MAX
	Buffer
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 11/02/20 9:08 PM, Mark Brown wrote:
> On Tue, Feb 11, 2020 at 06:42:28PM +0530, Ravulapati Vishnu vardhan rao wrote:
> 
>> Because of MAX BUFFER size in register,when user/app give small
>> buffer size produces noise of old data in buffer.
>> This patch rectifies this noise when using different
>> buffer sizes less than MAX BUFFER.
> 
> In what way does this patch fix the issue?  I looks like it's moving a
> buffer size setting from DMA to I2S but it's not clear why or how this
> fixes the issue, or indeed what the actual issue that's causing what are
> presumably underruns is?
> 
prior to this fix the value in Tx/Rx Ring Buffer Size register 
ACP_BT_TX_RINGBUFSIZE,ACP_BT_RX_RINGBUFSIZE and same in I2S RINGBUFSIZE 
registers was statically set to maximum which is wrong.
Buffer size must be equal to actual allocated.

Due to which When I play any audio:aplay -Dhw:2,0 test.wav and then stop 
and play  aplay -Dhw:2,0 -c2 -fS16_LE -r48000 /dev/zero 
--buffer-size=2048 I hear some part of old audio.


So after adding above fix the issue is not reproduced.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
