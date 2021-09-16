Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D935040D59E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 11:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A4C517C7;
	Thu, 16 Sep 2021 11:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A4C517C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631783594;
	bh=3qZB6660U2N/NDM4rdG64Z+yYB3bd/FIz4P9+aNJ+zw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iD8SFBRUt3SpyyCVv5rnmKemi5LLJhfGrcF6EmmbOoNY8jLjKJdqL7JcaGrIVqaSU
	 6JDpVeF1O/nFYk1x+5HSu/FXMYB8YW/pdDHkA/YE6IAocE6PB0RtBjwgbN7k5CVOya
	 24VBer3yPnwusH+4O5ijWH8acD0drF4DeYeGFII8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7AAEF80271;
	Thu, 16 Sep 2021 11:11:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FF1FF8025E; Thu, 16 Sep 2021 11:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30112.outbound.protection.outlook.com [40.107.3.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C23DF80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 11:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C23DF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se
 header.b="Gabu0WJF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KE0X8HujvRikAwrnlyVRiohBEra1QiyxZzMyAW0X06K3JS4yCFJwTWg6SQLJST7MAUzY+O6umFVd9RTvlXdV6h3pam9oHWzbN1pPM7AQ8cCQt+eYOAhhKCL+U4C3h+cKnkqYWF60+Wed55YsrXqbvs3qTdsSZv3vk/htMBLZ3LO6HgxdEO4sNcJntsqAp9JwrVvuNUUEqyGpzGH/KvAytkoZxH2QjuVX7ABE5/U2vB6rKEAX/Galsv4+w19LHNrMCGI7utwEzHdOvmEKD3M6IjlbHL8bago9oKwwZjIYffAtByeuMENwOUxp9njMmdTo79szLmMJN5ya62e8Jj2vMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=G5ITN+UmjeMIPAcwYnzgOlsRJU+aJiS3dqEOhB6ZzYk=;
 b=DmQ//gvh5Ot8ddAU0kLzpPCmijlEmCCyuI+A2fIAITto1DnyiXh/K5hJUvhxJaBh8fSPDuD8czB2ptCjX8IdorWRb3Lz5wMDKQraxeh9q/w4ENcWmXve3cyVsUWNM3PHO4eSPgr2BqsiFpcjBS2M95cE9LC5uVFuz6CePbnE6VsYGC0BBgtYwSn3OI2FezET71+2jnCHrLVs5rAlzUFAexp/zUm7vv6yWK1CM26UnfEfs8qSC5I28Ua3xLes5jb/Plsev0C0sYXdtTihh6EEwtGVmd1XY+nWLYqtpmHHyliktQ3HX3+ioYqZJixomD3JgDLl5nGh4NbtA8Qv/0inTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5ITN+UmjeMIPAcwYnzgOlsRJU+aJiS3dqEOhB6ZzYk=;
 b=Gabu0WJFVcxw7uZHocXYRBpHYnqz7/R1+qK+8KZkDA3/mXKsF4kOERBiiiweLqnzs+cyv5G3TBrA+FTgPC/GK4Pw0G1MsSXzExYU0oyVypltwaTN4+muxW5qN5GIQvRHDwbpeii/AZyjdJPxMaVNqeGVj3I8dTcQb5+IOfWnt7Q=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB9PR02MB7257.eurprd02.prod.outlook.com (2603:10a6:10:25d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 09:11:42 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a%4]) with mapi id 15.20.4500.019; Thu, 16 Sep 2021
 09:11:42 +0000
Subject: Re: [PATCH v2] ASoC: atmel: Convert to new style DAI format
 definitions
To: Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20210915181048.40070-1-broonie@kernel.org>
From: Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <953add27-87c1-0ed3-b753-291ee0b7d8f7@axentia.se>
Date: Thu, 16 Sep 2021 11:11:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210915181048.40070-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0102CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::27) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (185.178.140.238) by
 HE1PR0102CA0050.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Thu, 16 Sep 2021 09:11:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d58d30ee-6b65-483c-25e0-08d978f1ffca
X-MS-TrafficTypeDiagnostic: DB9PR02MB7257:
X-Microsoft-Antispam-PRVS: <DB9PR02MB72574F100751B99A3C37B5ABBCDC9@DB9PR02MB7257.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iHmYdq5/HcjB0jI6G0tBB0SRPAsLOmGieZsTFEbay7y1n78GcjVUlN7fbFCm5QGOKC0MGhFwdNPmi9I4oPnGeQ8+4Bhw/sHp859eq5s6H7/SaTkC7DB9rtqHWJggDDg/ocEhCRGf3FsBEzkFIhQ3Xfb3iMDTBi38Jy3B0wLtq5OQDzKNQSE2SckzHnbwWxEW5aFPQHykaXtHhiut01/sgLkEm3UWN/I6oeZ0EYXmJS31Vaf2GZyBuJwKSXFT+uXqAbtbuAPwOZ5Qe7vGT5Hn07jAPOpPK/K+gs9uEInqjKHVc3QpwG0BMgGnK/jXEZJ3nGtbQjSHasYrmT7ToKyze8jRkxIF/70ZCLrSbUAvhllMjZ4VNp6TonZq0zAZ2hQgWUHTOo6LFCXs14FQgqz0d35DvsiqW/TZqO2Ty9Ec0JgAK0xFCUfUgdo2L0xN/Jv0n2bfLXITY9i5doD4pfL4Y0AnxQ5any2gzVrLVaVhBTw/ScTnTRcN9JzA/LiGViKbGtsFqgFzrHZDnolwisSFRv41ZKybgXQWRowXqo9bA7S3qZQYAe8vFANjKcGz4aryRaKcTU52EU99gNSLMHabQrZ9PYn8gnL+YbeWnZ48nLo/SzIEVqPONRzjDMkuc1smBW/DdsWOsayPf25mUhc9o+/i1K7vSug7cpQpxrYgLioFNKsUFSQ3Tqw9rbh9TNolwpyfdnCjpQQJubfjZTYxFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39830400003)(376002)(136003)(346002)(4744005)(66556008)(38100700002)(54906003)(110136005)(16576012)(316002)(36756003)(31696002)(86362001)(478600001)(6486002)(8936002)(8676002)(26005)(53546011)(186003)(83380400001)(36916002)(5660300002)(2906002)(4326008)(66476007)(66946007)(2616005)(956004)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmZXYmxXMHhkYzBQVFlQdFdXWks4UE84STRqZUhLWkZoc29nck5oYXZMRzRF?=
 =?utf-8?B?NDlBWTNLemx4cW5yY2VWWGVhZHUwYlY0RVREa2svRzFkbWpyL0RZekkzZVpD?=
 =?utf-8?B?VkZ4bWZ1T1pwWWpxY2ZNNUNtc0UvcDEvL0I2VnhidTRjcGlVUVp0Tlc1QmtD?=
 =?utf-8?B?L2k4YUNuL21RalcxV3BRTFNUVEJ6dHFCTG1SeC9jTkJiZ2RUTXBZdysrNVgx?=
 =?utf-8?B?Y1BJRVVkaXV6eFVxWUJ6ZjE1VEp5Zm5QMDRVcXFnOExWdkk2YU56Ym5oak9M?=
 =?utf-8?B?Q1phSGxwL1c3L3ZVcHVtczZSR0J0K2pNcktWZ1lYNTdseEFsL3Y3R3pCTWNE?=
 =?utf-8?B?K1BUUm1FUmhtRk9vc1BvN0YzT1Fjd3Q4cVlyRkg1bFNBVzU4ZTRPVzRkY1o1?=
 =?utf-8?B?ZTNxVTNWWG5rMjhsTnNxbFFoWjhMWkljeUxmNGRuNHF4bXpoNHlvRFF3R3d0?=
 =?utf-8?B?WTJKM1pybFh0d3BGSWdXZGc5bnZyKytRSmtmTjdIMjFnRkpCQmx2YmZycmlI?=
 =?utf-8?B?SHEzRVRKSkp4TzNiVFlDOHlUVDhTZ0RSdDNOMHU2QXpUYWVBUlVvaUJRK0xO?=
 =?utf-8?B?SHBRNXVBNUVBWGtuS0NVb3BtWGJBYUNFaTBlYTIrbGpvaHZ6TjZSMVhIOWhU?=
 =?utf-8?B?MkozRFZpNFg3YUozR0NRVWk2Y3pUNFJTc2tjRHVNRWZReEZnSEp6OE5rSTVP?=
 =?utf-8?B?K254dTJYR0U3aDBjTHVnZ2ttRWtNY3E1cWh0NFltU2Z0U3ROaEZSWmhRb0FT?=
 =?utf-8?B?NStlSE8vMW1sTisvMHFpL3ZKWHA1ZDlrWHd4Z012WnpIVWNkM0ora2hTUEZP?=
 =?utf-8?B?anYvOFI2NmhpbzZjRnlXOG9aamdsK3ZFb01RanBNRVZXS1M0cTZBamtaUEZQ?=
 =?utf-8?B?cWZjZlE1bzQrSjNmV0NhajVJMTc1eXRqSlJFUUxvSktqbWlNU0VVaCs3Szl3?=
 =?utf-8?B?YmdRUjU1d2FzWU5OeFdiZzNJcDlBV04vTjhtVEUzWm1QKy9UM2dFY1ErNU5V?=
 =?utf-8?B?NFN5Yk84TU9FVFdjM3dzYkh4N0VjY05VbUVLbTAwc29Hc1E3TG1kdHBaY1Yr?=
 =?utf-8?B?cVdlRy8zTXdBcGNJVGg4STB4MlluSkdHOU1UaVBUVDIvd0VjYklTZ3Rid1JB?=
 =?utf-8?B?eE5HM3RIRkx5RkZKMG0vOXJyUytFTm1SbHUxL1NWWGdlMjc1N3puNHQralNs?=
 =?utf-8?B?NG4vR29SbXc0REtHclhzL28yVUdSL0NhelIyWHdSejl2VUk2ZmRBKzJuY1Vo?=
 =?utf-8?B?YkI3MUJYZnRnczhXMDcrcGUwbURaTUk1UW1XdHM4RWxzSXBFTEVrL2NWUzBy?=
 =?utf-8?B?ZDlzVGZnMG5Ya3dZKzJqYVNnVFo3Wlpodjk3aWZ0aUJLenYveE5PK0RtYk0y?=
 =?utf-8?B?bHJVcXUvalFwZVZXc1l4QUp5azdHTzAwVU15RGFSMFBUN3N3UzJPQ2NCQUpz?=
 =?utf-8?B?aThFQkc5WXJaOVhYTitrMjdqTm9UZUtMU3JldUZPOVczYmwyMWtySGVkNWpE?=
 =?utf-8?B?cWxObjB4bVVReVRFVlNnaUQwY1VMSDZmcWEveGcxZU1jYnR0enB6NHBhQXJ4?=
 =?utf-8?B?Z0h0R3NiN2YxdE9WZUtJRFo4bmFVK0pzLzYzMXluYkRmeW1nL0pkVm1RR3Rv?=
 =?utf-8?B?dGUvY2VpdlB0UE9qQTd4RUpUTlR0Nk8zaEpNT0xCeDRITGIrRGZES3EwSTVM?=
 =?utf-8?B?Y1M4RzFiR3hVRmZXQmV0QnFhQUhwT1RjbUtRdnY3aDNXZ3JMZlMzSWdKcjBm?=
 =?utf-8?Q?KFCGF1IOekFg3G+ZX+/sbG8goC++Kb9tPYND24G?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d58d30ee-6b65-483c-25e0-08d978f1ffca
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 09:11:42.4954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGo/lLd50NqAZjzDRD1iNk7hdcxAqBNWxqh8zfXostmAs9YwtDWj7uDc0neT/q7r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7257
Cc: alsa-devel@alsa-project.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
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

On 2021-09-15 20:10, Mark Brown wrote:
> Convert the Atmel drivers to use the new style defines for clocking in DAI
> formats.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/atmel/atmel-i2s.c      |  4 ++--
>  sound/soc/atmel/atmel_ssc_dai.c  | 18 +++++++++---------
>  sound/soc/atmel/atmel_wm8904.c   |  2 +-
>  sound/soc/atmel/mchp-i2s-mcc.c   |  8 ++++----
>  sound/soc/atmel/mikroe-proto.c   |  4 ++--
>  sound/soc/atmel/sam9g20_wm8731.c |  2 +-
>  sound/soc/atmel/sam9x5_wm8731.c  |  2 +-
>  sound/soc/atmel/tse850-pcm5142.c |  2 +-
>  8 files changed, 21 insertions(+), 21 deletions(-)

FWIW,

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
