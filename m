Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3E2D317D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 18:52:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C283616E0;
	Tue,  8 Dec 2020 18:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C283616E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607449935;
	bh=F2GShQeFz25LLAVWd8KW56HgxYNuZ6vceadKXwHyFWw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZrLOHrZ0SAeFh+SA5p7eICWXDVtp8LeVZ3goLjbPmB9lzM4/yfk8ibUk+fMn/QFBH
	 PtxB+kogTXVrwFsJcFqxxKPKknEmHkQMAkWapvGS2oPOvbjnm9NI7Zp+n6qvvPY70d
	 qn5gb08bKinXTTL31a7dS48c4TZ3CWUv49o3U0Mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D634DF80130;
	Tue,  8 Dec 2020 18:50:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD344F8019D; Tue,  8 Dec 2020 18:50:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12EBEF800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 18:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12EBEF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="BRoCRix8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftg7l5rJlIhvDNe86UPRXqDXekKANfI61yf3f4V4+ATwL7C8y5pfPfsWztA7gTnuHmJl/Mervxf+oha9PLvc1SRCnoisU5cRWNQn/q8qE9b8AUeM9ki/r1eV0DthBO+qbGURW+GDr+FxKiOXJY2LdbMto8dYaDXxLryOV2iEl7fTv4BpSW4YIHnSztfElgz3T5PQXoaQqlusamwtclo3lP5V4LPt3/cIvqrQK1r2ZXDMEHcEJ2YtpwC4I/GYdt/QSKVDp9RL9vM+mxoPhRHxICCKtci8vApEFu0JDPv/g3jaKgfkTyiYHVcjjLK1cW8PtUq5JhraGLSXp9WS3iOe1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgrvvrFWaPiOSFewT/epMQkymncR8zHF41jKM4cVAiQ=;
 b=X6YuBMVHNGAJap5CHpI422s0u0XH0FGgQlFzuID5gdVvmksVo5BRbbqQ/J6ZopFX58aNTXISZC1lhXB3eK6q7tj9SKUt4IOxR4suchksgtyp7ol9Ej97EQBkWCDWu6dS2lCzF/ulgNGkB2Db1QrDoFS1k8r/DG80G7pitgO59nFQTbU7AQBqlqct/v9gQVvvvutwHGHiwplVdkpR8NcdbkbASUzVtkrqg4rQ/28q8MFTs7w1poXjOp4bSZGkE3phu/R1QM0OsIrRSdOpKnp7GXlQr11ArCC6tIoPU6hp3UOqhvQCUwIgtV1zcYuuzIFBAoO8F55TQQb/haxvMOpogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgrvvrFWaPiOSFewT/epMQkymncR8zHF41jKM4cVAiQ=;
 b=BRoCRix8OLdn8tXzVOVg/upN15ItgkOuC1G69q/VAveGJf1+r5uU2tHE311B0WudRdPWFSb6KdXMBci5KOW97RnZJSFHRKACA9z3SUczsT7tQydDlGMSTZKgUFlND4lwu3Iv5V14/zHG3Y7ZvCggXHkKeOAraRjbgkJoxW4M0/g=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MWHPR12MB1597.namprd12.prod.outlook.com (2603:10b6:301:e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Tue, 8 Dec 2020 17:50:31 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34%5]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 17:50:31 +0000
Subject: Re: [PATCH] ASoC: AMD Renoir - add DMI table to avoid the ACP mic
 probe (broken BIOS)
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20201208153654.2733354-1-perex@perex.cz>
 <s5h4kkww9j3.wl-tiwai@suse.de> <20201208174002.GH6686@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <2e4587f8-f602-cf23-4845-fd27a32b1cfc@amd.com>
Date: Tue, 8 Dec 2020 23:36:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201208174002.GH6686@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.251]
X-ClientProxiedBy: MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::24) To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 17:50:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d174b06-8396-47e1-7527-08d89ba1c1b1
X-MS-TrafficTypeDiagnostic: MWHPR12MB1597:
X-Microsoft-Antispam-PRVS: <MWHPR12MB159723F33ADC55E861F4316097CD0@MWHPR12MB1597.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N/TK83CzMj8HBnC/Qw9ZB8Us0OcSlLI8jzoTVb0boQslmoWvDv2D+n6EUMrZl1o43kjJyGDcHKptLtbj78eZKpYiUHPDXyj1EbG3gCdzqgsE7F0ELsWBn8r1lc+BJTvTsEFJd6pm464wbIGy+Ynz0RZsrX7C1zUPERP1Hs/1XY6DOMjXkc5rddsS/0gJr7uAwUNnCS1uw+gkfRCPldHmraFrO7hQl/0H5s5vQIFaMDooUWVCcVRVIcNnFw3+5mJYXYZw43cO5BxKoDCweKwu/PzCxWYLgRWWH7HECIGtQ4TjwarEAiej51BE4FB8p7VVDxf2PMv+YYHbngOdbcgNbUyLzo24QQr5ZAOjNNFULBHSsZlevabwmHrZna0J+mDGiBMdbKh6m+p16u3JHmuKb2wb2Iae6C59JwfBP6DCgfZ1Krpeb3MoPDny7K386VB+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(36756003)(16576012)(4326008)(31686004)(2906002)(8676002)(53546011)(8936002)(4744005)(52116002)(66476007)(5660300002)(86362001)(6486002)(54906003)(2616005)(66556008)(6666004)(956004)(31696002)(66946007)(26005)(16526019)(34490700003)(186003)(110136005)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?0sMyliSQLgBaOQdQeXUFp1fVQ3oVmn9hEmsq++snE/tCxq/vC0pmlNfS?=
 =?Windows-1252?Q?JxbMSgaC3VukWu7xBcNG2KhgKyLR1iAzlzNMJ/8HA4qfUzB8p8Jdkx+p?=
 =?Windows-1252?Q?caE6pv1x9wXjSgRgqQOjmMmpD2DDaahmTGc4yvckJ7BKUeHW4r/S3jn9?=
 =?Windows-1252?Q?xUx/xB4tA/LVdWiYLrFefTiMjegcBfL1mAWxXqQuIZvJOyr0Y6mb3bF2?=
 =?Windows-1252?Q?cYn+sJoF+pXnXHlRQTCz59c0TZMrsNzLFSs4lSM9jjSWXet/UagpIUXj?=
 =?Windows-1252?Q?FFkYTSy8KhO3XI6dHP1XxL1tDZBf0xvnKE1J1ePzwOSE2PEhc/HkqaFC?=
 =?Windows-1252?Q?ZKP+aKe9KKMzrIsAtwV2okRGwvi5ms81bEPVpXNfdVTJgKJ2UZ005hID?=
 =?Windows-1252?Q?RB7jfblxg7+vObUkPvCBhEQru21jtSLtoqklCr34ZqI0XtBmhTpIo+C6?=
 =?Windows-1252?Q?ekXmkvq4hy8Eyp0DAws1+90I5+eaBHImea1zDeB1PNMwXuijN3j4c1JN?=
 =?Windows-1252?Q?6B/hggVFZ7bR3AkzsBAxCuIR79aJ7i7NGJdpOZ5zq71VMPClaDjZ/q/R?=
 =?Windows-1252?Q?kq6xYAZU4DVKIomPmzMUTIw5HHKIMFRowgkFAIvlEMLofvHepXqfzr+E?=
 =?Windows-1252?Q?bsAF1MzGjwV8B0T8AviaJvU3byrd//BfFjpPy+3l9O2CevPeYf5hVPXj?=
 =?Windows-1252?Q?h+HvDyjT+EEmzi9MWu/NxpnxZVpQrglcfTHyO/5OvlWoLuGwcfFjQzu7?=
 =?Windows-1252?Q?LG7KeEhI1zaGmPWkHsZSB14Wk0XTkbNjjE3fZQVM+MjZ2P+GqzZU65pG?=
 =?Windows-1252?Q?eVNkG6Ol4VL+W2HhrO1vuO8Thx6LPb+GcusfIzC1zzCGPnAqAVCl6L+E?=
 =?Windows-1252?Q?98+dZgS9G/rwhy+XkslodpQqm8A99owWS87BeX8ntp8aNfBP/6ukr1mM?=
 =?Windows-1252?Q?u+Rw/QZMPr/V1pbVecFNRz61ELFVkEo+dS/EMg1RyXh14aVJgsCrwM+3?=
 =?Windows-1252?Q?8axYFMs0aPDuyzDJq9dWtJiAEmeb3tCc7tIIYva498BNmCQVjB5u9lKL?=
 =?Windows-1252?Q?zEZL8zPj0dNzz3Wi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 17:50:31.4047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d174b06-8396-47e1-7527-08d89ba1c1b1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHp/KlKPR2R/iq2MaurttfGo+0jjdhlZTIG/fb55e2u6WhWmMWPlqLel/PSjeRiaQkgaw3/uK6GTQDmWTr431g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1597
Cc: ALSA development <alsa-devel@alsa-project.org>, stable@kernel.org
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



On 08/12/20 11:10 pm, Mark Brown wrote:
> On Tue, Dec 08, 2020 at 05:24:32PM +0100, Takashi Iwai wrote:
> 
>> BTW, both Raven and Reonir drivers point to the very same PCI ID,
>> and both drivers will be probed for this machine (and both to be
>> skipped).
> 
> Ugh, that's not good.  It's not even super obvious from the code that
> this is happening.  Seems like it should be one core driver which
> instantiates the components for Raven and Reonir as appropriate, the PCI
> driver is pretty thin at present anyway.
> 

Raven and Renoir has same PCI ID but both platforms have different 
revision ID. Raven platform revision id is 0x00 where as for Renoir it 
is 0x01.
