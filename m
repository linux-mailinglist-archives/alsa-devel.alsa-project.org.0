Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487D412FFB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 10:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7EAD166A;
	Tue, 21 Sep 2021 10:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7EAD166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632211941;
	bh=ttiVNIj4Ud3HgGFTc2itILq0XouLjDXr3ntk/t3SP/0=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NoDWHOovANhc+HmieHQQe9XQZMF9uemlMWtXpt0gkcIZLdHE+l2Y9ZiY/BlUY9TAB
	 4Jqo3MrD104UUdN0b0tORGmSC4mcMmoizy6nIf143QTg2jy+u0aq6pFCeX0f55F1CA
	 4sgDKLTzC0Aa5BEdgW0J8rTny0E+ORFXTDGLBZt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32909F8026A;
	Tue, 21 Sep 2021 10:11:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F8D8F80268; Tue, 21 Sep 2021 10:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80099.outbound.protection.outlook.com [40.107.8.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EC2CF8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 10:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC2CF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se
 header.b="NKt9Q/D2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMuoR/yvgZoLxaredLzWAC/7LfesmHTjSmnoaQgZCc5TMc6L4W3gL3F0UpvMnwWvUyxFF4yGFyDnF7amgehR/2OYjLBpMAW35nNG+vWO5R9Y5wA3VFPOcE04EVxyW1rV3Xjta5UebMWd67bT2UEUaSo3mNTjOUoaPxj4w+CEfIAmsExgdWOCIA+9cMDa8zPv3QYTnf4iaxKRJDh7Kf+43hwujQlQF4XLGGiFCjlPSgV5T5dlTM6qQYBx2r8nFqSwjP9BzAmEXomClxSublZawZkuGVceshgNFSkmx6A+yebCXfQ0oH8dU1C4K0WpVE43U8yWrx284lSUJz+QNhipjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0RqIt98EVpki+D1WognAsp2n8lZGEc7npZQahLEkhqc=;
 b=aY5m3DSRhurPVO249pQBFRYpE+odvhl7YGIXZ1sJv4abXhbjR7/RmWWrslV8Ifqo5zhR1u7mkodaEKCO2dYlDCFZeFFldhU5d81j9pZ33lEVCTTGdixmVfyVD5qQ4QdGuXy08alVQbsQZ9IBH6wlBHHEVqww8+MuC+GLvhIatu0ow3tMBHcRHfHLOCwgKPihxTRxASHuZIxJViyq8c1W2w01hqWURNSBP+/IEarmG3MNeFBwevIFA1Y6OyKISqqdGOsfPt5uGjBCC6RaSgghtJI1IznTmTOQT9zAZMKex9sZAl9TRIJSHemMgVPaPs0J2QEpXQuwOC0rV0PIw6Tenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RqIt98EVpki+D1WognAsp2n8lZGEc7npZQahLEkhqc=;
 b=NKt9Q/D2bGd5VgQfFYy0cHWIir27KQHjdS1FIozYDWOEHJUS1cdMEPr5zyxGGGmm/NAcEn6WpFC+5HHYx+xMovMnkXdcBwHR9N/xu+T5xVkVCbnc2RV3Z1la8h+keGsFfaCFu17tl1d3Lgnk1pDd3bTbGcdquzk50T92xnj26Os=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0201MB2454.eurprd02.prod.outlook.com (2603:10a6:4:34::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 08:10:52 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a%4]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 08:10:52 +0000
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
Organization: Axentia Technologies AB
Message-ID: <27f903d9-a74e-182e-b715-4124cf666f45@axentia.se>
Date: Tue, 21 Sep 2021 10:10:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d9850534-df41-a6b3-48e2-34823f5866e9@axentia.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0502CA0007.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::17) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (185.178.140.238) by
 HE1PR0502CA0007.eurprd05.prod.outlook.com (2603:10a6:3:e3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 08:10:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efefcdee-56f2-43f1-2a9e-08d97cd7545a
X-MS-TrafficTypeDiagnostic: DB6PR0201MB2454:
X-Microsoft-Antispam-PRVS: <DB6PR0201MB2454BE15E25473A143279938BCA19@DB6PR0201MB2454.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5HvFcEnDZP4GqXgNQL92cjEQjMEKUI0k5XrBC6nmos79RGu+7ry3qi5v7VO4w6e8PKBSk59f4oCsZDEWjPESh8n2FWHwcwX9OBWnHoeDqX+935XGuh8K8wHN6AxBfF5JK1jDR8viv24jH3FEfpMmOq87HGPDLtdL36uCR/B8qo5l7MvLjkO3biKILXn0s4sUC496R5PvSB15y/OPbkVuRh4949fghRW1fNSYn+zCftwIDwcNdTgdBbmjzfMHA0jBeg9gWl9ypWAvg1TbCQP2g+XyRJnrcZxU1xnt8MeTwhOgPktnrTVUf0GEiKtdb4i4emzYxoufC7g35zUdrZ2+quZnlY/SqzrGtX099QpdGnz4JLfPDjxwnVvEv/moxkClXgNB0aPDeeYA9XFT0nS50tvTu69aJKCjkbey6xrm3Uox3OLrhhBYPBXSIhtfhU6yJ8FrALDlcbP75vpUlpfHAWLEhWbymfZSL1OrbwGzFs918WQWe4WmmsSBfBBe5wvxesWCVy6HpqD4uaHAZ9WjQyBuXyDbrR9VrOgO5XIL6IlQp7Mfs39M83r4Ow663I2GoI26MKqbqIxNAN8EmhWG+QniT5oomBhIqRnrFzgN/nWIJbo9vfC7IhsGapgWoMKy6rnkJmgH2aol09d2dI/4czsKdPNnNAcEX5Wq6OOkB3ak9NGBEJrHxQ1WzUJlHwD/i4Upzb1e+JfNBQzWb4mNhEULHDxrVGaHz4ExjK0PuCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(396003)(376002)(39840400004)(136003)(36756003)(186003)(86362001)(66476007)(31696002)(66556008)(8936002)(66946007)(38100700002)(316002)(2906002)(6486002)(5660300002)(16576012)(8676002)(508600001)(31686004)(26005)(36916002)(83380400001)(54906003)(4326008)(956004)(2616005)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHhHTkY4NzBLb3JuQWhuazJLblNMWWhuVDltMkJhRXl5VHB2YU52ZXZCL21K?=
 =?utf-8?B?WlJWWmQ0UEVrTVppYkI2WTdrN2k1Z2RrcWtjclRJQkRpMUdFRWpHMmhsWlpt?=
 =?utf-8?B?VVNJdDdHYldRNW4xVHZ1ZnNtM3BHZjFQdW5rcE1KQ1M5OURMYzJFOHlleDFN?=
 =?utf-8?B?bDQ2VFV2SzA4cm1POFYvNVNtR3hFOE5Ld0NRNDRHNkVOOFUvM3FTRStKRzVP?=
 =?utf-8?B?S1VONkJBVDRUVFhpQllhVXdLSUV5a01tY3didkFMUlR3dXpZRlljbG5iMVF1?=
 =?utf-8?B?M2N5ajkwNzJvMnVYVTFaU0hBNUxmNEY0RE1Yelp0RTBmYzBjOHppb2dkMlpP?=
 =?utf-8?B?bkpQMTNtSFBucUNtaERzSEllU2EycWprbFpSTi9xQ0RjamxXUUd4eXorRlRo?=
 =?utf-8?B?SlAvTERxWG9yV0lGUzN4b2ZCRHNsQWw0dXBNVmtaUlJJc0l3UmpkcERCOTM3?=
 =?utf-8?B?NENyUTh6L0hLUVhOWUI4VWJodlZETytFMXF4cFNKd2gzRzd0ZUM1YUtUYXZt?=
 =?utf-8?B?ZHJvdUlBMGFuV2ZFV2VRdjQ0UTBKSmM3dVFzNnlRMklYOEcxaXQyR0xJS2VZ?=
 =?utf-8?B?OW5PeUZoVTdVNkJ2NHErWlpEUUs4ck80ODc3Wno0akxQbGFYRjBEbmNlSm1H?=
 =?utf-8?B?dCt2akJ5b09PMmg2THZscjJkWjlGTzUrR2FMUHYyV2FqQXBzQ2JyMGVHeUJH?=
 =?utf-8?B?Z2pjeUtONzlvSUNXRFVPSldqTHVDNVJkQ2w4UnltemtyM1BHM2FiV3BFUkRp?=
 =?utf-8?B?WEg5M0hsc3BKSE5HYlJrWnRna1RjMUdIR3Ixd0RCcEN4N0wrSFpraVA5YW95?=
 =?utf-8?B?NTJqYnU1dXRoR1cxZU1WRUpXOTNiTGJWTDlRcUthQlhGQk9Ic0pDQ2h1L0xt?=
 =?utf-8?B?VTJJcHM5UnBmOWlQRmo2Qkk0Nzl0VGRkenZyanFSa29JYWV2OGZRcWNDNXlV?=
 =?utf-8?B?aVFOTWR0Q3N4cFZQaGlZdDhkR0N1OUVKWE9PVGhQVThvL0Nob3g2MnozaUVQ?=
 =?utf-8?B?R29GTWlvaG55S2kxNkU5aytQKzV1MnlQdHE0a0IwUzg0OGFWTmZHQVkxSGJF?=
 =?utf-8?B?VXcySnR6WGU0TERTS1l6YWFzVUtRTzFNczBkZHhyWktqb1hWdHhhN3Y5MlBH?=
 =?utf-8?B?ZkMrSDhmUU4vQUJrbERhWXVOQmd4RzY1QU5xeDE0UzdDNkVwR2tQZEx1dktZ?=
 =?utf-8?B?V0o5bnNUbkp5ckZ4WGFLZXBuaGlTUkdXTUw3bDk4QlBNaEY5YVJiOURRTFZw?=
 =?utf-8?B?L1ZtRGU5SS9NdUtSQy9IMWVUb3RHSjNZSjY0RnJpRGhLVlFmbXlOZElFaDB1?=
 =?utf-8?B?THlpQnFET200dVo2Ly9nN0JLQkRCTTFZeDI0WHZqWWp1UEJwUHZNTUFLaWVO?=
 =?utf-8?B?eFM0SVEzNTR6dGhQQndkRUd6VWw1OHBhbTZxcTRSTzlQWkpWK0krS1NiU2sy?=
 =?utf-8?B?aXpabDlkTXY4dW1ra0gxajNvNG9SK0tSYkpEejNEVlByYTlmaXh3OG5MT1VV?=
 =?utf-8?B?MitNQ1p2TjZOZ2NjT1l6RnhwVlVEMFE1OTI2Y3RrbDQ5S09nQTBQSFU4WCsx?=
 =?utf-8?B?L0psbU1wN3RxK0ptd2xGTHQwblY4b2U2SjgxUm1xSGgraUVnVkVwKzRWYnJa?=
 =?utf-8?B?SlZzRGpHakJBaENxbS91NEJvQnFjRzQrNTBNSVFseEtYTDFnSEhTNk1MSW9G?=
 =?utf-8?B?N2wycGJxTkxMRmtoZW5NQ0ZFakVXS1JxaW9WSC9KUjlaUjVvanJKUUYySzRm?=
 =?utf-8?Q?Z/sUNbI1zcQNx5vI8zaX0Rdmhz1wAAXEA7k674G?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: efefcdee-56f2-43f1-2a9e-08d97cd7545a
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 08:10:52.5843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ll8FGFL1E+p+C4/6WnXYG9NW4O44pnnbTji5G4yX0awon9AZjrF6FXeXOStdF55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2454
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

>> Can you try the attached patch w/o without the defaults for i2s_1/2?
>> Not even compile tested...
> 
> [added a couple of underscores]
> 
> I get this early during boot/probe
> [    1.506291] pcm512x 0-004c: pcm512x_set_fmt: failed to read I2S_1: -16
> [    1.512905] pcm512x 0-004c: pcm512x_set_fmt: failed to read PLL_EN: -16
> [    1.519517] pcm512x 0-004c: Failed to set data format: -16
> [    1.525045] pcm512x 0-004c: Failed to set data offset: -16
> 
> and then this later, triggered from userspace when an app opens
> the device
> [   14.620344] pcm512x 0-004c: pcm512x_hw_params: I2S_1: 0x2
> 
> So, reading *can* work.

I added some traces and verified that accesses to I2S_1/2 fail (as do
PLL_EN accesses) when the chip is in Powerdown mode (pcm512x_suspend
has set the RQPD bit in the POWER register), which it is when
pcm512x_set_fmt runs. During pcm512x_hw_params the chip is in Standby
mode instead (pcm512x_resume has cleared the RQPD bit, but the RQST
bit is set).

So, my patch seems wrong, and the I2S_1/2 accesses instead need to
move to some point where the chip is not in Powerdown mode.

Or, is the problem that pcm512x_set_fmt is called while the codec is
suspended and the chip thus is in Powerdown mode? Because, that
seems problematic to me?

Cheers,
Peter
