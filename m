Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A25441306D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 10:49:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035641661;
	Tue, 21 Sep 2021 10:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035641661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632214173;
	bh=Em9m1YzFIv7xscvR9yYAlYzJc9dpsRne9xyyHvwpzwg=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fkxq8qn0ZmIawk/79JJqZqNoWIYgb93CZ1RIwl4FGx2PczN3Sn1yuuXxRiEOGDcOk
	 glAx4mt1KgGelnsPjy72S58PdBJCWHIdxc2KIvjD9csXouMahH02bGbz4p47U2PJW6
	 mV519p6dNg+VlHCpw6LbSSMH+tw9y/IABJh9k3FE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D1C8F8026A;
	Tue, 21 Sep 2021 10:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06469F80268; Tue, 21 Sep 2021 10:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40097.outbound.protection.outlook.com [40.107.4.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07A13F8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 10:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A13F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se
 header.b="f2KoW+nT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYigS2G4e2IY0bZf6ZWzAxv2EA9KAnyRhwZFLenuxH9+8iv9DHV3UYPN7wpc4GLrbSML0Hlot9vsIOHYmsCpMQIO+hWoW3Pb2N/6eDRMqGaby0Rgpuycxi407eoiA8pw1j/ks5UMiIUV9pTqwoTvmBM7P5CJaPq8y8CYsqwoD3JTiwhTySHBAJHbJ1HUkko4TDowDJWb+sJtORj+QyHesEo3S68AnCA4tS5nLvvSsSRy+WH0BlkumRqTZIHaJ3PRzRLpnK+9XW8joGJqgC2i5kVlo/1dnRQ7JEwWqpKqZhYP9F2cmVOVBslnGJD16OI9EOb/YGYpGfr5/VYubrJ24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=iHJmQ1V4mRYWdFNrpkneOWGUT8jdHcH8Tlfcsq4CXcU=;
 b=mPMC4WBrWMZMuR6hE8SMMxKlZNHYa92WlULUSr9u1GGAB+MEkc/x2p9AXNLevf3Mk5AtKmNLrSkQRRhixXkeniwslPE+hDMmGAquJeW+ZOnVpev9aY3hp1+LKNuWUhruuWYnoWX/EuAJQcMfkPfTFDzsxhn+H6PJ/bfMI4jJrB/zxXlG34NFSKtl/LpjPPEUSTg8WkaJ5ltdl4hH6hOKVVgojMaIcAYBw9/c2wmxuHpS8fTcYT3ISCMf7sPjySBYhcBgsIjYmofV+mMXqiczPVUFgeMpaf1r+IU0r0IbqjTDfzxFHY/MoVD4pSgtVzpjvN3fu9539wJ8CpvEu96Q5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHJmQ1V4mRYWdFNrpkneOWGUT8jdHcH8Tlfcsq4CXcU=;
 b=f2KoW+nTueDOcm8WHvKZaT4yVWhUfQB2QXf/dIbqM9CGmUOM6rdzQTKxOSMMHVgPpeL9Bk1wMSHV8e4OUDKa3SRLp1oiAzOOCZj0ZejFDadVaYC54SPhrd0SFlRibB99Z6IvqUeyfZNfsGsN6FhTlf2reoOqg8Zr3H09TMgcUTI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6421.eurprd02.prod.outlook.com (2603:10a6:10:195::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 08:48:05 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a%4]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 08:48:05 +0000
Subject: Re: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2
 registers
From: Peter Rosin <peda@axentia.se>
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
 <ae4b25f1-2b2c-d937-e23d-0f7d23bdf0c4@gmail.com>
 <815cbba4-60d6-8d97-c483-146c2f7c3912@axentia.se>
 <7537b141-0ef1-fb44-7e02-27b4dd1e772b@gmail.com>
 <d9850534-df41-a6b3-48e2-34823f5866e9@axentia.se>
 <27f903d9-a74e-182e-b715-4124cf666f45@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <8b96eb7b-8829-443f-481c-ab1772ece098@axentia.se>
Date: Tue, 21 Sep 2021 10:48:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <27f903d9-a74e-182e-b715-4124cf666f45@axentia.se>
Content-Type: multipart/mixed; boundary="------------38DF1ACA3FF361AD12ACC20C"
Content-Language: sv-SE
X-ClientProxiedBy: HE1PR0102CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::40) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (185.178.140.238) by
 HE1PR0102CA0063.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 08:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75986d7f-79d9-46e6-435a-08d97cdc86c1
X-MS-TrafficTypeDiagnostic: DBAPR02MB6421:
X-Microsoft-Antispam-PRVS: <DBAPR02MB642177D6CA0D4141DDB29DF6BCA19@DBAPR02MB6421.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iyM6JBPomX14Gs1BUmcegoAMi42cnp0E2G//xr/fBzx4UrFpM/sx4TEpPTTv+AH5bf14f17Wp8W+fEev583W04PfIWs0z/7ySAZiJswo2dAWwn9sRQScB9bnD1fi6R5gO+AaOFVyQreuvaFSPFtkqDLf2nm46r+f/2oein740gdIalIH3LYFwer7/T3BcOTHQBnEJlKYoUjicCKsTUyq5FslugWEcmjIiUTM8jHrHoreq+XeO0+kyneLIf685UOfYWAHEvB8F6kF3i3oi02xyVkntlF8EJkw1SXwtbme4PaSaVv1dAFS1rm03zKfzAndfZVw5vk2qiB/W6WkX21XJY6czZS6fNlkvBgUF1VftKWqpxqXJvjIBEGYftkIw0wwkAHgJvGhExNZVf0k6oHpHWh0a9hYb7/rm6TjpYHwylqnzfgINqkMikg7V+DZqrefOm499l+oqQSfWlxIXxt+7Hxby6W2swCkJGZqPlKYZC9w39MR613j7NcBT+RHInE1DJz03yi/7GO1IRlNDO1UOb+tPn/575qV6AUAhNWsXkYCR+xoMAfcZMyLCHMPgxOpb8oHZAxGrsLcp0bodqgsdBI6eHPRY9uC+wxrUEdP66zxxgWGuH3LnOoLBd7SzPFAOp6HL2PN9YULS7x3SZBiiKtMn4bStuTpNQG/Lxb74SLivtyYf4kqbkbRrxcO7jkWWxOsN2Q4k2MDz8pz8eIsAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(136003)(39830400003)(366004)(8936002)(54906003)(2906002)(5660300002)(83380400001)(31696002)(6486002)(86362001)(31686004)(316002)(16576012)(8676002)(186003)(110136005)(53546011)(38100700002)(36756003)(66616009)(66476007)(508600001)(66946007)(26005)(4326008)(66556008)(235185007)(36916002)(2616005)(33964004)(956004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjFBOTI2aFUrWm1rZEM3Zll5VGhHbTN3Y2duTEs2RkJMemdjTTRlRUE2VGdq?=
 =?utf-8?B?Tjgyb3ZGYTVEUThoaVkrU2o2U3Brak5paEc4S1lodlF1VHRaTHB5M2dIaTBO?=
 =?utf-8?B?TEp6Wm1hVExsdG84STd3WTlVTit6bTBHc0pnaVRUZGd0VkU3VzNSTnE3bEYr?=
 =?utf-8?B?QVJjUktQZ0JqZUFPRWFINEJyd3pCYnJnT1R1ZUFuRU12R1pjbUFEWmd2NEFR?=
 =?utf-8?B?K0w2STM2dzVlL2FWK2F0VlZ4UWlGWFhCSTZMRUZjWjN4aWIxRFRXTWt5ZEFi?=
 =?utf-8?B?elpLRjBSSWVpSjZZL0RQNndNNWV0bnI3elprVDE5QzQzR0NCN1QvK3MzM0VM?=
 =?utf-8?B?UHVkVjFBVW1lYmhUajM2TXljSHBTVCtTYnZscXZPay8xdm5JTjlsUzJDVkF0?=
 =?utf-8?B?alVYZmJySmhnYW1ibXVRVmFaeEd5SmlEYXI4Zm8xUUJzTk5panpudU1Ubzl3?=
 =?utf-8?B?TXJlT2hXa2VjQXJsbjM1ZjlteUZVM1JQcUlhOFlzeHZ3NWNnRkFWZEZDMnY4?=
 =?utf-8?B?MDZXQ2tlaVN4b0lxUGhPYVN6QXpUdmpYV2pUc01tR0FLdUNSeEpWZVFHSWh6?=
 =?utf-8?B?NGlTb0I4by9NWC9wcml2bUpGNW45ZENjazJ4NWFnRWJJb2RLQ0lQdllCSUFs?=
 =?utf-8?B?WXVoR3ZHOTFNdG5LeDJmTlFLTnlBeDBPYlRzK1JFdXhadGUxUXBuZGV4bGpa?=
 =?utf-8?B?ME9Ga1dHNnpCYTN2akY3TW1WclpLT0Jxb0JaMno5SVY2ZGowVlVsdUZuNzBo?=
 =?utf-8?B?SkloK0N0OXBOd0xxVEdsYTVvR25XUWd6SUtsRzJSY1J3Ky9oK0dwaVg1VXdu?=
 =?utf-8?B?SFlDcEp5aVdPUkZYV2ZJTUttYXBVMnRXT3lEWFNSa29UT25KWGFxakxtVzA0?=
 =?utf-8?B?YSs0eHRkazRQR1pmMXdRdklJTEdvL2tZMS9UYjRCcnlXMmliN1BVM0JHZWxs?=
 =?utf-8?B?bjFvQkVUTmVhZGE4TTBhcjZCUEJrRUpUaTdxeTFETGZKd3RXWDVkRHlkNk5J?=
 =?utf-8?B?Sk9FYWIrU1NLYzFWL3cyTm5vNHZTSlF1Z21SV0N1YVVEZnJ5RUpHNWZJakdj?=
 =?utf-8?B?amNGTDRXcXR6ZVl3SmJKa2piRmdhemtZRENYOFMzbGp5UE00VjVkNWVUZm94?=
 =?utf-8?B?K1NXOVBiSWdseERBS1htUVNaaCtqeUJWV3NMZ3lZQ3RFcU0xdTV3OERhREFW?=
 =?utf-8?B?YTFtZU0zeGk1RXZOTFVXTXFPSXQ3Ymh4eU1aQk1LRFFyTWhyYUQ3QUx0VmNG?=
 =?utf-8?B?MGdSWDNIV2F1OHNwU1BFdGEyeURSaWhIa2R5Y0t6OGFnZDVrL2htQWJBem5z?=
 =?utf-8?B?L1NUb2k1YkpiQ0lCNnBDL1VBZWhjTWRVelc4b0JNM3NCNy9EUVpMZktpcmFj?=
 =?utf-8?B?TDgrU0lWc0hZM2VpWEltVUtRSGljWnJHQUFyRDVjK2UyVkZiUmNPQWRMMTlM?=
 =?utf-8?B?bXV4UkFVMzhjM1F3YXdUK3VqK1U1NVRxdHI4NDZoZzZaNGozSmZwb1VNSSsw?=
 =?utf-8?B?anBRVjBvQ2tDV0hVQWo1dFJaNDVPSGFsdU1nQklSMkVUOGY2MGZtQ3FoZlBV?=
 =?utf-8?B?Z2VOV0lOYzNiUSsxRmhRaXg0R2FFSEJwWEtZUjdqRTAvQktOcUk5emdkWlEw?=
 =?utf-8?B?RDlRdy91NE4ybTFQL0tTVHBFc2JVY0xGeVZVQm0zOFVmMGd3enJNMmszSE1a?=
 =?utf-8?B?WlJUcndwQUk5d2d4NVJxZGYwZ2svUEFsL1lQdTBqTUhhMEc1V3A4UUM4ZzFV?=
 =?utf-8?Q?SA+uO9ApMErcdtGryTmdzjRbJ5UXcifUqDt7pDw?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 75986d7f-79d9-46e6-435a-08d97cdc86c1
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 08:48:04.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRulPHnlYO2WEZJ2bdtf53GHHG2C7+CwECUHD0pbdTlTy+D8Nr3lqS37SeadVbRu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6421
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirill Marinushkin <kmarinushkin@birdec.com>, Takashi Iwai <tiwai@suse.com>
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

--------------38DF1ACA3FF361AD12ACC20C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 2021-09-21 10:10, Peter Rosin wrote:
>>> Can you try the attached patch w/o without the defaults for i2s_1/2?
>>> Not even compile tested...
>>
>> [added a couple of underscores]
>>
>> I get this early during boot/probe
>> [    1.506291] pcm512x 0-004c: pcm512x_set_fmt: failed to read I2S_1: -16
>> [    1.512905] pcm512x 0-004c: pcm512x_set_fmt: failed to read PLL_EN: -16
>> [    1.519517] pcm512x 0-004c: Failed to set data format: -16
>> [    1.525045] pcm512x 0-004c: Failed to set data offset: -16
>>
>> and then this later, triggered from userspace when an app opens
>> the device
>> [   14.620344] pcm512x 0-004c: pcm512x_hw_params: I2S_1: 0x2
>>
>> So, reading *can* work.
> 
> I added some traces and verified that accesses to I2S_1/2 fail (as do
> PLL_EN accesses) when the chip is in Powerdown mode (pcm512x_suspend
> has set the RQPD bit in the POWER register), which it is when
> pcm512x_set_fmt runs. During pcm512x_hw_params the chip is in Standby
> mode instead (pcm512x_resume has cleared the RQPD bit, but the RQST
> bit is set).
> 
> So, my patch seems wrong, and the I2S_1/2 accesses instead need to
> move to some point where the chip is not in Powerdown mode.
> 
> Or, is the problem that pcm512x_set_fmt is called while the codec is
> suspended and the chip thus is in Powerdown mode? Because, that
> seems problematic to me?

Ok, so the attached works for me as well. But I don't know if it's
appropriate to resume/suspend like that?

Cheers,
Peter

--------------38DF1ACA3FF361AD12ACC20C
Content-Type: text/plain; charset=UTF-8;
 name="0001-ASoC-pcm512x-Mend-accesses-to-the-I2S_1-and-I2S_2-re.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename*0="0001-ASoC-pcm512x-Mend-accesses-to-the-I2S_1-and-I2S_2-re.pa";
 filename*1="tch"

RnJvbSBhYzRkNTVjNzc0MWExM2Q0ZjIwOWE2M2NjZTk0YTlhY2JiYmY0ZjI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgpEYXRlOiBU
dWUsIDIxIFNlcCAyMDIxIDEwOjMxOjI3ICswMjAwClN1YmplY3Q6IFtQQVRDSCB2Ml0gQVNvQzog
cGNtNTEyeDogTWVuZCBhY2Nlc3NlcyB0byB0aGUgSTJTXzEgYW5kIEkyU18yCiByZWdpc3RlcnMK
CkNvbW1pdCAyNWQyN2M0ZjY4ZDIgKCJBU29DOiBwY201MTJ4OiBBZGQgc3VwcG9ydCBmb3IgbW9y
ZSBkYXRhIGZvcm1hdHMiKQpicmVha3MgdGhlIFRTRS04NTAgZGV2aWNlLCB3aGljaCBpcyB1c2lu
ZyBhIHBjbTUxNDIgaW4gSTJTIGFuZApDQk1fQ0ZTIG1vZGUgKG1heWJlIG5vdCByZWxldmFudCku
IFdpdGhvdXQgdGhpcyBmaXgsIHRoZSByZXN1bHQKaXM6CgpwY201MTJ4IDAtMDA0YzogRmFpbGVk
IHRvIHNldCBkYXRhIGZvcm1hdDogLTE2CgpUaGUgcm9vdCBjYXVzZSBpcyB0aGF0IHRoZSBjaGlw
IGlzIGluIFBvd2VyZG93biBtb2RlIHdoZW4KcGNtNTEyeF9zZXRfZm10IHJ1bnMuIFNvLCBicmlu
ZyB0aGUgY2hpcCBvdXQgb2Ygc3VzcGVuZCBmb3IKdGhlIHVwZGF0ZSBvZiB0aGUgZm9ybWF0LgoK
Rml4ZXM6IDI1ZDI3YzRmNjhkMiAoIkFTb0M6IHBjbTUxMng6IEFkZCBzdXBwb3J0IGZvciBtb3Jl
IGRhdGEgZm9ybWF0cyIpClNpZ25lZC1vZmYtYnk6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEu
c2U+Ci0tLQogc291bmQvc29jL2NvZGVjcy9wY201MTJ4LmMgfCA5ICsrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3Mv
cGNtNTEyeC5jIGIvc291bmQvc29jL2NvZGVjcy9wY201MTJ4LmMKaW5kZXggNGRjODQ0ZjNjMWZj
Li4wN2NkZTZkNDUyMzMgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvcGNtNTEyeC5jCisr
KyBiL3NvdW5kL3NvYy9jb2RlY3MvcGNtNTEyeC5jCkBAIC0xMzM5LDYgKzEzMzksNyBAQCBzdGF0
aWMgaW50IHBjbTUxMnhfc2V0X2ZtdChzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwgdW5zaWduZWQg
aW50IGZtdCkKIAlpbnQgb2Zmc2V0ID0gMDsKIAlpbnQgY2xvY2tfb3V0cHV0OwogCWludCBtYXN0
ZXJfbW9kZTsKKwlpbnQgcmVzdXNwZW5kID0gMDsKIAlpbnQgcmV0OwogCiAJc3dpdGNoIChmbXQg
JiBTTkRfU09DX0RBSUZNVF9NQVNURVJfTUFTSykgewpAQCAtMTM5Niw2ICsxMzk3LDExIEBAIHN0
YXRpYyBpbnQgcGNtNTEyeF9zZXRfZm10KHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpLCB1bnNpZ25l
ZCBpbnQgZm10KQogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKKwlpZiAocG1fcnVudGltZV9zdXNw
ZW5kZWQoY29tcG9uZW50LT5kZXYpKSB7CisJCXJlc3VzcGVuZCA9IDE7CisJCXBtX3J1bnRpbWVf
cmVzdW1lKGNvbXBvbmVudC0+ZGV2KTsKKwl9CisKIAlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMo
cGNtNTEyeC0+cmVnbWFwLCBQQ001MTJ4X0kyU18xLAogCQkJCSBQQ001MTJ4X0FGTVQsIGFmbXQp
OwogCWlmIChyZXQgIT0gMCkgewpAQCAtMTQxMCw2ICsxNDE2LDkgQEAgc3RhdGljIGludCBwY201
MTJ4X3NldF9mbXQoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksIHVuc2lnbmVkIGludCBmbXQpCiAJ
CXJldHVybiByZXQ7CiAJfQogCisJaWYgKHJlc3VzcGVuZCkKKwkJcG1fcnVudGltZV9zdXNwZW5k
KGNvbXBvbmVudC0+ZGV2KTsKKwogCXBjbTUxMngtPmZtdCA9IGZtdDsKIAogCXJldHVybiAwOwot
LSAKMi4yMC4xCgo=

--------------38DF1ACA3FF361AD12ACC20C--
