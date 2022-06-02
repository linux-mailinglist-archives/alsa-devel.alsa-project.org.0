Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E7253B9A6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F28316D7;
	Thu,  2 Jun 2022 15:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F28316D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654176484;
	bh=Qyv7kCmGWwi3zIFCoU1SU0/wbG5Gd8GV90Gg3KfJA2I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gAFa9bb1CQvjtysg7GwwgovZVaeYcIHhsvt9Dtc7IUBn1zqITVXMkX4kIxBjqybWP
	 MBnleX9xDU2WZqjG4zjE/jcX89PkcN2gXHzxkGY2IyZTr5NRsYtDlf9/9h/avrqXJt
	 TC9wJoX52bBMFtkSi4+qNfIXNEbtX3JllBkh3WLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5FD7F8025E;
	Thu,  2 Jun 2022 15:27:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ADDDF80236; Thu,  2 Jun 2022 15:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C51D9F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C51D9F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se
 header.b="Wb3xAX5u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWJYFjmCFT44doQuubZ8HWaD1SPC32fBBs9bnC3b41rOqEgoOqS4JlP1IhvpN3QkYZZBJ2QOuT9vSWDK/DWVJ9IRME7gBdspuRBUJBzvXKoiCa7Vs2RM4s1M/L8c2oXFC1Vgiu+0Y5sa6XdDLwctSy4lP7ZsnjDwrmw5rfKxh4VpYtpD0im6aHhcy1C4hZnLt7pQN/rOyrY1VLnPm640VzyuabeowqA5vwu6OcsAse71XWJrja18OKUb+a/Gkd3ho3UV+rCuFoZ3FRm5VJeHfRANg0yy4yE/CH7dw6OVcrthJdExZDrVmT3lq2B2/xDCYWXW5tXiR+LfClxOulaGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0a6dR7fXa/U08l4UiLwh4vmILx7RYHoSawDQiQQlynY=;
 b=GE7jU+jSCsJzawN69s8+oUo4s7XPfkU+Bh6solfwfq5kBTyk8rCV5pENfzfQbwRoxnOSiyVvU6yiybi57MZW9H7R4Zm53ZDmxeFQCYiDXx44JRC8zeszhXAWys7ZihBAjG/4UJSYoACuEee0nSRcZb8n5DHIhqEao4SdA2UGHdwM226wj8XYImlZVCCAXRpty4b44ioHKfY2paNJvvLP8b7WAbq6E/vc7t+l2EkaBF8Tyzr4M8EsSVvKSriFIjCkirC8ThPW/WRzG2ikvWR4Mw+YXpbmVTrUyAkj5h9jMJpOdPmrpjzQ246j0tQSMDWCNvSe4gUcxjmXMa4tKcn4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0a6dR7fXa/U08l4UiLwh4vmILx7RYHoSawDQiQQlynY=;
 b=Wb3xAX5up0WJ5T9xtKHRzzmIu8ezqWcqXErQ9pkyfisgj1QdD9rZ0qoADEoacwwE9S4DSxKphJfKmKr8+MXQjqJrFHi18HJB2v8T4kW+VslvpeFwKQ7XrOyoPFJKBe4zubyuH+B4UZiSIW4mgnyP30b5WFiOHICLcRQt+Ui4+G4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM0PR02MB5634.eurprd02.prod.outlook.com (2603:10a6:208:157::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 13:26:56 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6c12:cd95:b34:7dde]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6c12:cd95:b34:7dde%4]) with mapi id 15.20.5314.012; Thu, 2 Jun 2022
 13:26:55 +0000
Message-ID: <9c6081f0-a85b-ec77-b631-feb7875ffcad@axentia.se>
Date: Thu, 2 Jun 2022 15:26:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: max9860: Use modern ASoC DAI format terminology
Content-Language: sv
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20220602125812.3551947-1-broonie@kernel.org>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20220602125812.3551947-1-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0087.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::14) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45d0461d-a193-4998-daa0-08da449b9036
X-MS-TrafficTypeDiagnostic: AM0PR02MB5634:EE_
X-Microsoft-Antispam-PRVS: <AM0PR02MB56345A1F9FDB7FFF9655BE0BBCDE9@AM0PR02MB5634.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7BeMotnukYWixPi7Mlavze546fdm3iEVt9ibzfdZMag//VUC7a+Kx4CwwzA3y4Fc5FzmNBB1xPAf5AvJS8apT1UYpDLatDWEkoorfrGuIZu7EOEBf1zZ3YWA6MX97wu0I6Vx6N7XbzDJ8I9f+e2pUGY2WCzkwAxTL3B5upn43C6/YVbKC5ANEgSVftNN7S5H5qgIlmdprLJWiMoTmR/4pPzFzRyryMFCrnLSeAKLt2td5KGkPUUxO39/4lKILM3EHzwifWCcv00jBWEnwssgRe8p/YzHwl5tc2HvebkFMYxwLaub5J77Vr9YQCfU+Y6IQSZzN1caaoFY8BctKOsv9LB0ABoMzLgjlJTDhZ7tiwz5H0lRUa7h+EPo2DcfKr13t3h0q1cLkhjN6h13uT5yxkzf61/1n4zqk71IBVpJqADCF8NJcGXePbA0qviU9YhnVgECIfj7AmphnTdfsA/c2t+bYl6OoxkyzXKmi+06/a5g4Qv6ACm1lcZrOqxwv9vxtkDqBsfOZ3ipv3vOLOnWsmw0xRwmtAuf6zEThFv8g3Zx4CAn3Ni6YGqSLszPeTnRIoAoJqbP0w84tP1TZgxjuPko0H1B2P+qzoqnxnxbaKuZwDIqHLGf3/FT9djzqIkw2YLIFwva+4dqWJxkQyNGQkmkrncW3Mb+zGr8dQ9KlOXMH9vlaPmNXFZRxyyblbpwkCph95pcHD19kku91HjpjCKEtTffeFtEEqX5O3V+AhddbFSmZ6Q2itzKacYSoeee
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR02MB4436.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39840400004)(346002)(136003)(366004)(396003)(376002)(186003)(558084003)(38100700002)(31696002)(83380400001)(6506007)(110136005)(508600001)(6512007)(316002)(6486002)(26005)(2616005)(2906002)(41300700001)(8676002)(66556008)(66476007)(4326008)(66946007)(5660300002)(86362001)(36756003)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3JpTloyeGM1RkpWWktWNENDMmhreTNvaGgxU0RvMTl6RHlVbkNiU1BIeUlv?=
 =?utf-8?B?eVdVZVhLSlEzWmJlMlhSMWRyOXpNVERGRGJxS21TN0VvT0c0TjBjKzlpejNC?=
 =?utf-8?B?Q3FEdUx2eXRiQjVUMjRGU3IrK3FRWHRoQWNGQisyREZpY1BqRVpVREJHcnVB?=
 =?utf-8?B?cndLYVd0aGRxaUJBeU9MLzlTU2RvM2M4OEJMeGVlYlFXbEdpSGx0a1dGZzI4?=
 =?utf-8?B?cXZiVmZLbHJyUjFGZ0x2cjJHUi90VHNkQ3d0cmVqQnJ5Nk94VkpReUNqUFow?=
 =?utf-8?B?TFVCeFJzajFldkdzbm5aK08vVUxLV0pGUlZzUGM2V1h4Y2JySzRBRWlVN0hi?=
 =?utf-8?B?SVpnK1h1MVF6ck05VWNxMjE3eFRqZ1B3UXFWUENuR2pCR0pJdmNLeVpDU2ZM?=
 =?utf-8?B?NzNISFBDTnlpclk0VmVDTWpFK3FKaWtTVmFNYVRyWXJ0K2xIdk9UVldMbWVK?=
 =?utf-8?B?SFcxc2dTUUtKRzNiRTh4RU1QWXNJQWNGU1AwZkVyYThkR1JTcHdYRlJRbS9n?=
 =?utf-8?B?M29BMzQ2TlgxeFVBeVlxdDJtUFExd1BsQ2tqYzBINDhQendVTG5JYnByMU9U?=
 =?utf-8?B?Y21meVg5NVRUZ1E4UDRuRlhjNVdzUENoa3BKUVh3VWFXZUxuM2hGWWt4Y2hD?=
 =?utf-8?B?M04yZlN3MEkxNmJpQ0daZTBrRHFmd1ZobTJsL1BieHVmakNYRGNNa205eXdk?=
 =?utf-8?B?U2lHLzlZcjhlbUE2bDYzWWFHTkdNQ2lwdGRVZTg5SFdTa0hZaEhwc09LbUtF?=
 =?utf-8?B?aVh5UTQ5SlFOaG5rOU0xMVNEUGxNYWpmc2hralEwYWVBbFRVdzFZdEtPdDVX?=
 =?utf-8?B?QSt4QWdkYkNvTmlHTU5SekJYSS85cnowUFdxY2pZOTBQZ2RoOWttZWhBbzZN?=
 =?utf-8?B?Y1N0MktGcnRpUXZaSFVodE5YYXA3NWhObEFXVjMzUG1CNmkrakhjbW1uS080?=
 =?utf-8?B?TG8wQUUzRDF0UWVIVmxkRkZPUS8vamFLekZzWnc5RDVXNEdrMEhIdnR6d3ds?=
 =?utf-8?B?aGF1YXJxZEIxTW1xenhaUEJ5cFR2NHd3VjlFemdwWDlGS2lMSnY3OTlsMmNj?=
 =?utf-8?B?UU5kSHdkaElMRytpWHczdnZLclJGZVhHMHY1WXJvSDNBZjNKRXF3RHJLcDNl?=
 =?utf-8?B?Y0dTeEZYeGMyU1o2VllpRGxCUWp3SG1TcXZ5ZjVOWXRsWUJDajE4MmJQVVZs?=
 =?utf-8?B?T0lhMlFpWWludUh1UEJHSGNTWG4rVkpRTVFJWjdCYmIxNkhFYitqbTVtTFhU?=
 =?utf-8?B?VHE2THRiUFhrM01hVGVTdDZ5K1BkUDA1SHkxRlRUVW96b3RGbW1EWEZ2SXF0?=
 =?utf-8?B?MGxPWUM4dGVOMVpsMy8zOE0rWitKMnIvMExlV0U0VHZwMDZQd25LS2VlVnJw?=
 =?utf-8?B?N01HTmtHUVhNeUlibCttV0JiV2lrVStzSjBldmxLNHdHTjVsTEJESkFHMVJj?=
 =?utf-8?B?OHpmbTJKaVB5d1NBT09nYURpMWF0Rm9DdGVtQkpqcFhYa25uRDNSNXFYTHVK?=
 =?utf-8?B?TVJ0ZmVackZTR3plbjRwd0VUYlNPaUxXUVVsQzZrcEZLWld2d05PMFV2VmxS?=
 =?utf-8?B?RUNxRWNkQXZnYm5xYW1rVUphUGlPdzNxM2lxbW9GT3J1UFNXckdqU0UveGk2?=
 =?utf-8?B?ZGRaMlRHdStpMjU3b0N5T2ZNZFpVWXU3a2tBZzBsTnpjWnJoZUZxNXA3aEJq?=
 =?utf-8?B?bk1Yd0VtejRFOWVma2pQYjRsMks5RUJ4WW8vcm9PR0RaMXFsSEVYTDB4VW1H?=
 =?utf-8?B?dFkyOXdGNmtnWjVldnRZWGZJMTR2OE54OE1PTElyWXFpZ1I0RWgvWE1xQk9U?=
 =?utf-8?B?K2twbHY2Z0lJRlg2bllxYXBNTUdqSVEvOUJxcmdmN1BUTTkrTklWWGJpSDR0?=
 =?utf-8?B?OVQ5Q2N0QW9jclFRdjlXWG5yRjFmM1FUdFVPK3VURFkydUNGcTU0YnlPZXpr?=
 =?utf-8?B?NzZ6UFdnSWU3QlRBMWt1YjF1ME5aSmxnZDRQMUN2YW1xVGJCV25tTGhiWmJE?=
 =?utf-8?B?RGtoRG10dmdUVVdkb2RKVXdEd2REcjNFTXB3WVJxS0F6b3kyRk56QnhNSS9X?=
 =?utf-8?B?alZ6eGVTZUFzenczc3d6Y0tQZUNyZTBuOHM0T0tzQlZPVTRqRmJhdFJUbDJE?=
 =?utf-8?B?Wkp0NjBrUTBVMWJVQ3E2blNyREo3R3Y3dkVObE1jb3o2QnptQlF3dHg0cmY3?=
 =?utf-8?B?SE80WlVSRGQwOTcwYTk1amlpVWpzMlNhNHo0YUtqQmtVdW9sV0E3QWpIamxr?=
 =?utf-8?B?Y0NPL1F2SkwwYmQ3SXQreXV5UW1UamxzNEgyS0YxakMrb2xINE1ZNlRjcURi?=
 =?utf-8?B?NW16UzUzR21VbVdVcEErNURMME1sMWZVbkNaSkM4ZlB0UXFZcDZQQT09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d0461d-a193-4998-daa0-08da449b9036
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 13:26:55.8980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgxoyFfcbInv59VMmqII0rCgpWYdHf4E6Om0YJ+3MKhaHh0oQLz7JJUDqSlva05A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5634
Cc: alsa-devel@alsa-project.org
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

2022-06-02 at 14:58, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the max9860 driver to use more modern terminology for clocking.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
