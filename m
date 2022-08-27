Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617B5A38E9
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 18:54:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A385E82C;
	Sat, 27 Aug 2022 18:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A385E82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661619262;
	bh=4mXfDvE+/0W3S+DyWASKTM4QD3JXTWrRx1gTqqMLEUU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Em+hpH1loxLZ2zniIT+7MPakceRgFQrLe4BPfOQhPrrKM3CJdU6TWlHSKAiQJ3Q4q
	 cxHF4ItOE1I6PtNlnolheEglUK257ucMtYhDYEyLrqb4y2cqCaePTXbyStxwe+6OrP
	 VGxaXWJSh4usvgTyZMnQReoxpQD9AFcYst9XV6WY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1270FF8021D;
	Sat, 27 Aug 2022 18:53:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5C46F80132; Sat, 27 Aug 2022 18:53:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2046.outbound.protection.outlook.com [40.107.212.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4821FF800AA
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 18:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4821FF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="STCjkebb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEC9IXi/yHgryZtmd9hmzTD+guFj0lwKWgxhsKax9mBu8VkpSiuhwypTLjuGPY/G/x4y/AwB+kfYKufp+2WTj9dPCCyc/CP08c58gyXbC731cBJlvYVy/5+4cAiKCh7XyU+ZO0wWHmEareOnP+dDtoxa/M4pjsCAyqTUqoVOK0azN4sMXSsUcwrIxNH2UKR+tgSsHNFlbCtjeoMTVAjnmkPRcSDsvPKjmrQO/Guvo5JGV2Ybj27IGgRdlrTTBRhop3cMigBYY6f8NV7fPjk0N38k9s0PFRxcsYmBQr4vkeGXOBJl3ZRPYlEAOb7WyQnPQHqRUUDiKXesPSRupkJT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mXfDvE+/0W3S+DyWASKTM4QD3JXTWrRx1gTqqMLEUU=;
 b=FJV4Qm7cgRsvTmsrVxD9D3qttSuyKMEDcXeM9Aber+UxXZyb6TOdUQWNXXoda72u9xRkB5igyhz0/BXFIooqHHM5DwkQXw/zI2bXZ5zIjbA1BIT3IhGxR8JcVnoOp3/vE9Gmp6Up5l2+yC2RWbJzc3mpk4c0pY2mOoVulH0ZXrDmQii+t9GFQ3cw/vagA80FOsvsf6Tu3ykH8p265sjAx3Qp2tgABBp60XE2HJpkDl54JAmDzr6sO6B3aJWOiY84gI0z8WfI4XnvFuFut4YVLCV1G1qs9jsnXnFQeTLpRLzmjGT8WFZq18jQ77SSodqzzmVspZBo3I8gpJ7KhNe7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mXfDvE+/0W3S+DyWASKTM4QD3JXTWrRx1gTqqMLEUU=;
 b=STCjkebb0fkttpgs0DldG/I+m9p60jFY6JzDNUxuL34o96jjqQF3aU28hjPA1433wlRldJgLowV4aUxB3C4rUFvBi68yPccK/vBM/l2gIFsQ7L2eehJdSXVKsuQZiMjpyHOjiuu/fOSU7nl1oo5q4MNLRIcpd+0X9xUHk2CbpnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by CH2PR12MB3831.namprd12.prod.outlook.com (2603:10b6:610:29::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Sat, 27 Aug
 2022 16:53:11 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::bc80:d6e7:d73f:d955]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::bc80:d6e7:d73f:d955%5]) with mapi id 15.20.5566.015; Sat, 27 Aug 2022
 16:53:09 +0000
Message-ID: <471a7a14-a312-b9ae-a8f4-0a3d4f6087fc@amd.com>
Date: Sat, 27 Aug 2022 22:20:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/13] ASoC: amd: enable Pink Sardine acp6.2 drivers build
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Syed Saba kareem <Syed.SabaKareem@amd.com>
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
 <20220812120731.788052-11-Syed.SabaKareem@amd.com>
 <YvZeNDg++YwEsgdI@sirena.org.uk>
From: Syed Saba Kareem <ssabakar@amd.com>
In-Reply-To: <YvZeNDg++YwEsgdI@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::7) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b44a8d6a-c253-42b9-201f-08da884c9ecd
X-MS-TrafficTypeDiagnostic: CH2PR12MB3831:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZN5yTsvM+7i4CBSmifiRTtcl/jp8mPZFeZ6DypGdq9A5Ao26mwg8UBmes+2taj4ia9AnBMxLZRnPigXsacILFoNgs2p/xT8+4m/zaf5ZC7gjlKzl9HADIt8py1kKe93c+Nj8FV7GHPX3KTSkwwfxd1qzH16Iv8LwXOy48jivaTrW8Bt5jM1wgMFxwwIHER79+Q7Q+H4u2iE7daKOBXVbkCtXitUkhm+RwRSGSxI/3dADRLqTp0sQq2PKX6zZfxvJ9IIOutJOUEajKXG6USGEx+eBOj0MLYolEhyihlTqufGH0SsFD3Ql4oK24Bf6dmtAMxtaME1TrZy6IGtGbKzGJ/8HHwD68/jbfHaZiUtPC5Dp0LrSh1TE00XAktO1If150Nr1ukxTNE3tfI+jeI+pbqzmKteTF2L4iLXCdut+9ERNx6L3xH5CCQyadDx17tTRUlgPWkMbdhpcCF7s1mqdGTpD9AjnHU0kLLfO9eyL3oqPDQQubiYK9GA1H4T5X9uw7onyZeHuOe9V67tSihRMNviSgMPclgL28j8V5yfZgV1CkP8lAVz8yNz6ga8p+3xFRovIw8LAAuj7VLMv+1TBvFVucBjAZs37Anp4PWBbh8kBsm48eDWzU2RaQFVuzzi/MCHLpil3qHSXJWR9E7USOkJpQhZe8aDh1h+cgfLxk33w0u1+qPgdZkJcHSskvNpwq7R/5lsjD/eQbBwGPOMUm24tOm6xGFcuYnDV3o518+LInFEjjT5QEOX9+6+Tb849Y58emKfiYtszSGbfnNrjr1kHfGroTKiwNV1sr/tyKSc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3661.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(110136005)(66476007)(66556008)(66946007)(316002)(54906003)(6486002)(8676002)(478600001)(6636002)(36756003)(558084003)(38100700002)(31696002)(31686004)(53546011)(186003)(6512007)(41300700001)(6506007)(6666004)(2616005)(26005)(4326008)(5660300002)(2906002)(7416002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDNxb0JESzVIY3A3L0FkdVptQ1V6TjI4K2Z3TTJGTW1FdUJ4MEQ3VDB1cXNx?=
 =?utf-8?B?ZVlEN2ZRbHpEZ015QmNtaUhsOXRFT1o4MDYybERjM1dwQTZiN3pPRVova1JW?=
 =?utf-8?B?QW8zUDgyS2hRelUxSlpaTGZhcmpkUWdzTU9OZGJNUVJnL2swT3hVTkhJRyto?=
 =?utf-8?B?enV6ell5VEVlVWpmdEdiL3p6cUVrNjFjbFJqYzFINEhWSGhtZk1YckE5MzFv?=
 =?utf-8?B?Y2V6b1YwdzNOZWFUa21tWjB1QWJJR0dpdFpoeGpKYXVZM2dQOW92NlgySnBu?=
 =?utf-8?B?VjIzUkZYdGpUUjJlVENneE9hZnUzcXhCRDJHeWZabFJmaTRaQVFWaWo4cTd6?=
 =?utf-8?B?bytXV2FXVElqb1dJSFFudXZaOXdLb2UxdVExR2kwQXpqb0NIVFRhNWJIL2ox?=
 =?utf-8?B?RDZMbUx6RkFEQjZ5MXJXYVJlNjlkMFZ1WWRjNEZFbTEzRFZtRmptc1JwQkxD?=
 =?utf-8?B?dFdpdFQ4Ynp2YjZ6dVlWQWlVanUzUitXK3VRS1VjY1gyUWxQcXM2WVl1OVVv?=
 =?utf-8?B?OUFKODZOV096U0tTNEltMytIMVFuTzcvNk56blFtcThWc2dwc0FQOUwxNkZv?=
 =?utf-8?B?RE9JUisva2dMS05wZXRaWXFzNjVocldXejdtb29WUVdnY2lNN0FSNGRtaThs?=
 =?utf-8?B?Y0pPMis4L2ZETU5xY1VDTkx2K2FkRFM5eTRBRWcramlOb2FqbmRpVkltTTRm?=
 =?utf-8?B?SE5hK2x6R2xVbkZCRitMNTNrTXVSUm9sNTNVSm5zWWg4N2tzMll2OU9rckRC?=
 =?utf-8?B?cFpiVm1vV2JqT28vaXBkTHBhVFdNcUVkV3EzN2VFL0xlWGFsN0JlQ09ac3RN?=
 =?utf-8?B?S05ONWRkemFiVCtERzllcGxVaE02Z3h4ZDArWFFDbm5xTzNiVUFiUFJZU0U2?=
 =?utf-8?B?YXZkWExBT3dUM0s1SVhiQ0NrNUMxYnAyL2dMamxvR2FYa3Bid2VoWVZHSUw4?=
 =?utf-8?B?OWkrOGdLSkx5Z0FWZmRaTjQ5YlVEL3dyeGlwNEllZnE5U2FnQTE4LzhwODE3?=
 =?utf-8?B?Y3hyMWp0V2M4ZlFOdXl3UjRmUVJrdFNMVmd1REl5dXNWTnZmY2drY1cyd1JM?=
 =?utf-8?B?bTYwWklYODg3N1pzaEwzbzZwNGFEa25pN29Ca1BsSmNXVEpRTHVtN2NFN0tk?=
 =?utf-8?B?TjIzNG53Z3FpZFpZZmxLcGJmZHpoUmQ3QVZwOTUxT2JCQ0hkblBKbEZGVGV6?=
 =?utf-8?B?VTdlZ1YydVhzRFFSK0o2MTdvNkZ1c3ZucU9CUHNtUlVuVHJ4QjlQaXFQd0xM?=
 =?utf-8?B?WE80MTA1MC8xWWhvelVwZWtRTDNseTAxVkl4bndkNEZxTTN4M2YyWkVEYlQv?=
 =?utf-8?B?MDBXRmNLc01rYzBmYzA5angwT0lQaTZsa1FTTmZETG1oN2xTcUI5eEZWek1T?=
 =?utf-8?B?MWJWa2ZLYWFWVDUwb3ZGa0hRWVZUUlFzYUtRUVVQeHdaK1BZRXh4b1Y4SFRT?=
 =?utf-8?B?czk4dXE5cjFsWFZtMnF4M1p1NUM2bDdSc2xqUFpJd3hFNEtEOE9WZ3k0MUpt?=
 =?utf-8?B?bXN5YXg1NjlpYWRpV292bGVQTEtOTW5JNHhML1ZTOWh4bzJrN3Jmb3lrZU9n?=
 =?utf-8?B?S3pBYlg1TWJJek9XSk5wKzNlNkhOakNXSVlOMitrRmszOUZaSkRVZWxHQ3Z6?=
 =?utf-8?B?b2svZXRaSS8yeDZiNytyTWFaZjZDTEVxNjNBd3BtTDR3bFltOVJuMVdlV1FL?=
 =?utf-8?B?UnlnTU5mZHVlWjBNOWZvWktsbjNmejJqOGlzVlE1QitxMXE4STFOaktldHI2?=
 =?utf-8?B?OWlWQ0pXRU5rZjVGNFRQSDB1SnFJVHprODFwNGM3VFNCSW9qbFZxZ00yaGFn?=
 =?utf-8?B?cXQreDk4b3FNLy9nMGU5dVBKWHUwWS8vRHZLL29MbEVHQnNtZGlFK0U1eVZF?=
 =?utf-8?B?Y1ZpVkJsZy8xekdWY2FSLzBHVkJQU0NDamdPQXJidnU5OUE3aDNieDBZcFpq?=
 =?utf-8?B?d0F1SENDdHdxcGFqQTlvRFV4aHNJMG5hV2lJZmpISVJteHZnNEZSYUZhUVNQ?=
 =?utf-8?B?NEZRTm0rKzNZMVdDUU9MazFZVjBEcWVIM3lBdFBvT3JCZzh1bmdSS213eDB6?=
 =?utf-8?B?SVJZUDlCU0tEYXhXUHJXTjFBZW1WV2Q3ZXQ5N0gyRUZ2bWw5TmNoSUZJNmo4?=
 =?utf-8?Q?N26cfjBS4L7+CdTp2zx4Y4Ih7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44a8d6a-c253-42b9-201f-08da884c9ecd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 16:53:09.2762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFQrWLFZAE0V3ADbkxLcD/oZhUUAE3WhW46UiS2YdVMzHZ+9+eksa2sKfXqbFHliej9tTpfU3LTZVmTJMYyimg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3831
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 mario.limonciello@amd.com, Vijendar.Mukunda@amd.com,
 Julian Braha <julianbraha@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
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


On 8/12/22 19:35, Mark Brown wrote:
> [CAUTION: External Email]

ACP Driver has strict dependency on ACPI
COMPILE_TEST will relax the flag options. As ACP PCI driver has strict
dependency,compile test flag cannot be used in this case.

