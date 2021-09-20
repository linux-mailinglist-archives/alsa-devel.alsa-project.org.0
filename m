Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 294594126F5
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 21:39:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 686F916E1;
	Mon, 20 Sep 2021 21:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 686F916E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632166756;
	bh=pHqSv7GRksYsPv3dULhsirHWVlwMeBy4QC+QtCYtYGk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sPav/l6EoiIU3AmV9Fk4o2qW/lQt49Mk6vdMpXOeg0Pox8/pXaBxZx0idPv0LEFIh
	 mTF0QEjRG50ffG8P2uuR7xKsvmnDP1W3IhnhZHm1ZGVBmO1mJlCqApER050mnFgleU
	 dOiYYJbSVEHV5G8MfIZsfR7UEiPAlRHNvzHd9DFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1F2BF80129;
	Mon, 20 Sep 2021 21:37:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFB6EF8025D; Mon, 20 Sep 2021 21:37:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2135.outbound.protection.outlook.com [40.107.22.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16876F80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 21:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16876F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se
 header.b="Pol2hbHC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ed8QGFbpFI2laymFL5WEE1i0MgMDh3z9/D/JzzvyGqjTIO6HPA2Ih0uvpPuFMyCw7E3VRTVC9nP6szVtwcfg52Wz3rCpHJtcr1ME/3ymFmnY6d05FAEoBe2d1hDEDiEfYzosMCJK7Xv8kv6vT1VBra/Ovr7ZQmuCFfv2XBEXKMTd5iPL8qN5y0tmK7Kc/gJF58NV87DUKzmUgv1qUlc9B2LKSuXkmK4N29uuv9nUGFXo6kKOL85FcUnBuxi5eIxpB4SJP0z317Fco0K2V1+qyQK3+RhXgxpPOEnSCnL5kNmcTayrYekrXkZ4JKMOxX9M/q5lcrTbASLgl6Sz975UBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=U7sEZA305k3ajGkWJDZcxsvDkDd98S51QC8Yg2W1cmk=;
 b=hZXS4Nne0MxxbM1qWn71hVmHXkuJQTU3Hj7GHgej4gYXVYzibHLxLPc0y+pL02yAE5ov5vEvhFFIAaHFjvXeSLPI7zoI/mjdtkOFSaRx47Ob8LGCSKyaVT9XU2JJYg4NF/1cpyaGJdce73RdujBMD5wPQQ7sRsxDI324JiGb2ucj7GPc+ysv4l86O1NcduIRrH5HMu9KUiy28lCtdjayOuiX8I3apZbf8J6jC17yBKNZW7KHVyUroOwEeL9qd2cXPqLeOG9H1NodvOLVVlkwltxv19GMasA//YPISiab5jwiiYredIZ11wY1U9H5SHztbdbswfkoUjQiudu4D1tEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7sEZA305k3ajGkWJDZcxsvDkDd98S51QC8Yg2W1cmk=;
 b=Pol2hbHC3b4R1igNL7ajqRiLKyWsRNRTUBqxMNYiTUiTpzMQyFHPUmz1S/StHWCfvqRycMGuT3iQalqWemShfTCag+cS484EiaAckHDmzThR5C3FxaDQ1H2lBysnwplNeYjceyPnU95ek6J1WnGhOApcxF/juvl4lkGKWaewHrI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB4105.eurprd02.prod.outlook.com (2603:10a6:10:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 20 Sep
 2021 19:37:40 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a%4]) with mapi id 15.20.4500.019; Mon, 20 Sep 2021
 19:37:40 +0000
Subject: Re: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2
 registers
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
 <ae4b25f1-2b2c-d937-e23d-0f7d23bdf0c4@gmail.com>
From: Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <815cbba4-60d6-8d97-c483-146c2f7c3912@axentia.se>
Date: Mon, 20 Sep 2021 21:37:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ae4b25f1-2b2c-d937-e23d-0f7d23bdf0c4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0502CA0018.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::28) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (185.178.140.238) by
 HE1PR0502CA0018.eurprd05.prod.outlook.com (2603:10a6:3:e3::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Mon, 20 Sep 2021 19:37:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0361557-8810-4120-910f-08d97c6e1bbc
X-MS-TrafficTypeDiagnostic: DB7PR02MB4105:
X-Microsoft-Antispam-PRVS: <DB7PR02MB410513BBA573B4ABB41886FABCA09@DB7PR02MB4105.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jF3fLwxM5q/1AAC8VwHEMk5pYgyQSMqePqRam3egVDzfIWXPfOXgamTIMQAEGxMMWDi4sNOylZPzon/Plikf+QQx0gNJx1NLRok2RJxWlD/WCXeJcgIR9se6yFXZDcG5Yaq2XV2nxru01I4ZXmhWHh1zGDjqHXiRv4kJML3vnRA7oxxKDHDvygdJ9d73WSs0gEzqUk3evxp0o/Xt8yyJdeiz+W3M2QIBOLuE39dGRSzJKH7XKyMGl3n1ldzvtZCYrLazlQEJ7Tn2/mcfgAm3RrWjzPi4eYj7xM0IEuLLHzj34+btufDGlLKhzw3DSop0n6DnmKWcXODUv6rTpm/4nOZaGqM0XG53nlP2D6zf94z4YlCnT+2VM/+iXL5AMdAAi2+hru/IxL1/qdH+N80DitVYsvldLpN0LdzWeaTqo5VTFVthoEX2WG+nIwdDSCQa5K/PTgy5jvfPrOUih6woAsxLG1dYhRMHIPx/AAlCDjLNtaOJmlrUjsiHe4TDUNYPhh6GUCEMlM2fiscjujVT/OZgqIO4hlXqUY0O6SGZzfptjtZvYwle4E9cgdHf20Fyoq+XYV8Ae0SE6A5+j0NhA5sN+w2Pvy7zIpAmngWuruWxdrc5BQjQBCfI4WE7K/N9QmhlZw+VFwswNLUeL4SvXce4MJFKJ5Ez3lnP8XuLlOw4dH0gxYDlpOolfyBgYosNaOyc08SyHcEu6nhH4yUy0FAaIt4zMCClNeIo5doqfgQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(366004)(376002)(396003)(136003)(6486002)(2616005)(38100700002)(36916002)(66574015)(8936002)(956004)(83380400001)(66946007)(26005)(36756003)(186003)(110136005)(2906002)(31696002)(53546011)(86362001)(16576012)(316002)(5660300002)(54906003)(478600001)(4326008)(66556008)(8676002)(31686004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFh0bkNDQitFVTlESXA4S0pxUjdNMFJxNWhjL0x3aExlQmtOUzRUazk5aUdE?=
 =?utf-8?B?eWJZbXFDR0h2NkJ6Q0tONUpzSkdKY29ybUlCTE9ZMCsvTWJHVnRmcWVkMXFI?=
 =?utf-8?B?YktaV2pHcUlwYzFMRGxLSWVUZ3VYd09qR1lOSnlqRmpwaHlxTnlNdzU0Z3lY?=
 =?utf-8?B?Ty93Q3JqTjlMU1NMUWkxaTgrZFcvSTVmTXM4VDBMaGNpL0xKd3ZxTURoenFH?=
 =?utf-8?B?UnJ0QXI0K1NNcXZoOHJuRU55ZC9uTmhCcTNmOVJJbUVWd0FKamIwL2RVMkZQ?=
 =?utf-8?B?dUhxRysvTXFQZ2EyUUhsaU9sSTUrN01QL1IxZ0k5RG1VY1I3ZDZ0djc4Wklk?=
 =?utf-8?B?dHJ0U1M5SHJ6WEl2ZkpXQVA3NFljSDQzQWhXNVY5RzBDeHREbEx1eFdTaGdE?=
 =?utf-8?B?WC9IclJwTGVXTlFOUEtjYXdrMTZpUEJseml6ekk3WnZnL29yYmlESjVEcTBL?=
 =?utf-8?B?T0dNeTl4RVZRMG84Y21IMUk0SkVxalNOSllnTjZxNjgrYkdVcXRLZkpxakdq?=
 =?utf-8?B?Z2NFdDIvNTJyT3J6MUhlL2tCd3VISVFmVlNTWUhpb0FrbUthYmxnL3F3SkI1?=
 =?utf-8?B?YTNhME9BNHlBTzZUbEE2TWpCSXcxS1R0MnYwZnE0eG1oMGhtMGtFY0Y4Uk1q?=
 =?utf-8?B?V3l6ZXRUaGM0d1BBUFRzbTBob244bVdCSkpNcTQ0YUJmMUN1YVJDOUo2NThm?=
 =?utf-8?B?d0VqQ0tWRGpuTVhKbE8wUzVPSTQ2VndwbTRYVHFydFVOVHlJelFyQS9zdGdI?=
 =?utf-8?B?cFJOZ2syNkVNMkdqaTVtcGZ6czVhMHUwOFlDTnRzRFNtM0lmWmcvb0kvd2Fi?=
 =?utf-8?B?V3V5YUliYWFtTG9PS2kxSmlxWDIzK002VE54OWl2Uys5U1Ricnh5QzgvOUZG?=
 =?utf-8?B?STZacDVPL1pJK2R0ZUk3WFh0dEYxTElFWmFYSU9aZ1o3K1VvK2dPOHdlVkFD?=
 =?utf-8?B?VWlnczJxSnc3OHhQeW9PWkJkZ01yVU40VURKR2MwRUlRWC82YVMyWnkyTHRa?=
 =?utf-8?B?NkxEWkprNTFyV2JndUxDYkljemdWUkM2cjRhcWRFMUplZjh3QzdsRGlGc2pi?=
 =?utf-8?B?YTJiSW1YMmRxZ1ZDVmhzbHgxSHZwbTVDcmZ2dDJQWU1RaUFIYVJVb1JpLzAv?=
 =?utf-8?B?SnNIQ3J4T2V6MW9rWGJmTkxyc1NaUTZ5d3pHSFJpUCtxQXdKUlR4amdvQ0E5?=
 =?utf-8?B?L2ZyZHpkUXBEWVo5UVZyQ2U2MStzSzZqUDJLaXltSUo1bjNQc01OS1FGM2cx?=
 =?utf-8?B?anJpMFB4a1hrektRemZRaHpkcTlNZ0dvYWgvZ3hJUTlsVGlTVHRiMWpjSENV?=
 =?utf-8?B?YWZ0eklEa2FXODdPekxTSEJySXZ5OERwUldvYml1RkxFWEJ6ZDNBN0xGR1lm?=
 =?utf-8?B?OVJxT1dvNlBDaVVJR2FnaGdNelBzUVFtNnBsZ25iLzRsemZCZDAyWjBhekpT?=
 =?utf-8?B?S0VXWHdSdmdhUXBSMmxpTEVjd1pmWkh0OGdubU82NlZLUXVsWEJYNTRMbXNY?=
 =?utf-8?B?WmlwME9kT0Y2WlV3aVdJdXE4M0VVUjVad3EwU3FjamNRd3ZaQ08rUEdCRDRU?=
 =?utf-8?B?YnZ1WDlGQ0RiT2NkSUlUbkFROFRpbTNqZ0t2b2tpMUpJZWJNMlU3c0JIWDlC?=
 =?utf-8?B?SzluVjJrYXNRWENaSU1BU3VKaHFIa2Q5ZnA1R05TWWF6YUVpckhic2d1R2lH?=
 =?utf-8?B?V05MRjRUaUxhSGNXd2NDdENqZHc1VThZWGVrUHFQSHhMYnV0VHpXM21yZUlk?=
 =?utf-8?Q?Ql/R3i4fjr+TwlmLGxpXFPx7Uk2zuia8Mj+9mTv?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f0361557-8810-4120-910f-08d97c6e1bbc
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 19:37:40.5244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzqSAccIWAsQbDs7wNId6SPg9WBtYAqd8ew1eO6qpJDtIqBJCRd/RONwIu97DuBy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4105
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

Hi Péter,

On 2021-09-20 20:37, Péter Ujfalusi wrote:
> Hi Peter,
> 
> On 9/20/21 17:49, Peter Rosin wrote:
>> From 625f858894af2b7e547cc723b97361081438b123 Mon Sep 17 00:00:00 2001
>> From: Peter Rosin <peda@axentia.se>
>>
>> Commit 25d27c4f68d2 ("ASoC: pcm512x: Add support for more data formats")
>> breaks the TSE-850 device, which is using a pcm5142 in I2S and
>> CBM_CFS mode (maybe not relevant). Without this fix, the result
>> is:
>>
>> pcm512x 0-004c: Failed to set data format: -16
>>
>> And after that, no sound.
> 
> Is it possible that on the board the pcm5142 is in hardwired mode (MODE1
> and MODE2 pin is pulled low)? If it is and FMT pin is also low then the
> codec is in i2s mode.
> 
> I can imagine that the codec would ignore a write to AFMT part of I2S_1
> register - it is wired for 00b.

Nope, MODE1/2 are wired for I2C -> FMT is just the last I2C address
bit. So, nothing to do with I2S. And I can't see how that would explain
the same problem with the I2S_2 register?

>> This fix is not 100% correct. The datasheet of at least the pcm5142
>> states that four bits (0xcc) in the I2S_1 register are "RSV"
>> ("Reserved. Do not access.") and no hint is given as to what the
>> initial values are supposed to be. So, specifying defaults for
>> these bits is wrong. But perhaps better than a broken driver?
> 
> The default of 0x02 (AFMT = 00b - I2S, ALEN = 10b - 24bits) is correct
> for I2S_1 and the 0 is the default of I2S_2.
> 
> The failure happens when updating the AFMT (bit4-5) and when regmap is
> doing a i2c read since the default is not specified.
> 
> It would be interesting to see what it is reading... Out of interest:
> can you mar the I2S_1 and I2S_2 as volatile and read / print the value
> just before the afmt and alen update?

My first attempt was to mark the register volatile, and then read and
compare if the update was needed at all. But marking volatile wasn't
enough. I also tried to set both a default and mark as volatile,
but it seems every read fails with -16 (EBUSY). I don't get why, to me
it almost feels like a regmap issue of some sort (probably the regmap
config is bad in some way), but I'm not fluent in regmap...

So, since I can't read, I can't get to the initial values of the four
reserved bits. So, I winged them as zero.

Cheers,
Peter

>> Fixes: 25d27c4f68d2 ("ASoC: pcm512x: Add support for more data formats")
>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: Kirill Marinushkin <kmarinushkin@birdec.com>
>> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> Cc: alsa-devel@alsa-project.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Peter Rosin <peda@axentia.se>
> 
> The defaults for the two registers are OK, should be safe ;)
> 
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> 
>> ---
>>  sound/soc/codecs/pcm512x.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
>> index 4dc844f3c1fc..60dee41816dc 100644
>> --- a/sound/soc/codecs/pcm512x.c
>> +++ b/sound/soc/codecs/pcm512x.c
>> @@ -116,6 +116,8 @@ static const struct reg_default pcm512x_reg_defaults[] = {
>>  	{ PCM512x_FS_SPEED_MODE,     0x00 },
>>  	{ PCM512x_IDAC_1,            0x01 },
>>  	{ PCM512x_IDAC_2,            0x00 },
>> +	{ PCM512x_I2S_1,             0x02 },
>> +	{ PCM512x_I2S_2,             0x00 },
>>  };
>>  
>>  static bool pcm512x_readable(struct device *dev, unsigned int reg)
>>
> 
