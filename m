Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 230C5448116
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 15:14:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8731B1661;
	Mon,  8 Nov 2021 15:14:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8731B1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636380892;
	bh=QXQgyuwO5e5DJl7+NgsjP42hqHtrwuYoXuPmzG8QjRA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rIYQAcDVwMTBINKejuD0BE3Egs6luY3TGLgC3SGbozwQNnQyd/rhxcWm9bpdKlf4T
	 cMW4voEG6JwkQMpTG0FsGj1rZDwxm2iYxGeLg/r6jdjBz2s5jlBzVORJQcttldCkY5
	 ioUb4gafSzk8fpgicMEtalqnvGBdx3f8VFvbK7K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 665C6F804BC;
	Mon,  8 Nov 2021 15:13:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58C9AF8049E; Mon,  8 Nov 2021 15:13:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60058.outbound.protection.outlook.com [40.107.6.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 576E1F8007E;
 Mon,  8 Nov 2021 15:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 576E1F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="TRbV8Jao"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2ZOhlel3lrva3v73P12cTqUsCMKxJudSwJFrumsnhtb/d/duz4FQWjo7koQIgr/Bz4qi8lrhoWSff6Nm3zdMhXd62jwFhecgiZ5N/pAg8uDywVJxXMTjbJurjuDWOYnOR2/9gReeKXxfL5ajbK0E4DFzSCMjhLzvEOwE6hr3GogyyB2/7lHz8YJhdqMJqfCsJ2nFzmpZEfjfVG6hUoxjNhI3mg0+AM/OCbPrl0SRHivuuPWqzXSGfsjhe7GTiH94vhv8bC/Je1oE6H3et/q53t9xkzBUUF7x541Y8o03UYsP2vVbzf9H8HVsak//ayQjIxKtgvp1hFoK0xfS3h+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMdKBErpGg6SaEdEtEg7EYEC+aIVQtuQwsT/zLBaTSw=;
 b=I0xc5AcKiOw5MudmJ3ox6CotAg3fH+f14m3xv+wuB4eiCg1KYUUEN2yg0GKoSdEZ1hidcfzxlWuBNoJjnrMkhQT4GIxBADRupVOMVFw7FICntfWCrIv2rxuH4OwMRR8pYcGOpoKzQBgae8mAclkPx8QaS9jBSf9VaK2V1ueDkZXBel1r0bVplniXfIp8bAYALmMJogUoHcxGQotWQN7spSzZ0vrJ5EN5buTrl+/MpPae1X7fWGb0eVh8agH4eweXTmvKqVQdUwGLQlQcCfQE/OISAstlL2cI6+jC9toZ6O2wEJmt0FfFW4tZs/6OpYRiJRPOQekCd2pRn5QKVBA9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMdKBErpGg6SaEdEtEg7EYEC+aIVQtuQwsT/zLBaTSw=;
 b=TRbV8JaoDafzdresv8d8hVjXOpoGNMB1jQ1TEv9ze/MXgJnVpczDboHrD1XcOawODT2Kx9jIG3nYqwkCseNhHuPI/S+ykt7Gv8aetbVGIbPnKGoQXrXdA6p1s3Ag8RHrQ4eSkx/F1FF2hsJYu/k5Xa3LPD0tYCWk9aNpStahmKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 14:13:32 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4669.015; Mon, 8 Nov 2021
 14:13:32 +0000
Subject: Re: [PATCH] ASoC: SOF: build compression interface into snd_sof.ko
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20211108111132.3800548-1-arnd@kernel.org>
 <63c5b1fb-575e-f026-5a76-f08a366f7f38@linux.intel.com>
From: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <bae1a17c-af6e-d77a-19e7-f3f6408951fa@nxp.com>
Date: Mon, 8 Nov 2021 16:13:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <63c5b1fb-575e-f026-5a76-f08a366f7f38@linux.intel.com>
Content-Type: multipart/mixed; boundary="------------791C240922A1805F6DA45D2B"
Content-Language: en-US
X-ClientProxiedBy: VI1PR0902CA0027.eurprd09.prod.outlook.com
 (2603:10a6:802:1::16) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
Received: from [IPv6:2a02:2f08:570c:ca00:c0fa:6a41:b933:e441]
 (2a02:2f08:570c:ca00:c0fa:6a41:b933:e441) by
 VI1PR0902CA0027.eurprd09.prod.outlook.com (2603:10a6:802:1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Mon, 8 Nov 2021 14:13:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb1cbde3-98f1-4b57-cd23-08d9a2c1f1be
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:
X-Microsoft-Antispam-PRVS: <VI1PR04MB7055EBC3A81BDA3327D1C491F9919@VI1PR04MB7055.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlqHyLAk8F5HBOoIb7p3dQ4yBc/m08BCTodgjLg78ELvOWfMpaOBpW/E6jmL0WAoo0O2L7unBH5EryrJAZT+Bt2LThX6Az4X1aCOLX+kmjyubIsNftaqMk9OvsnI7ncytXU2yeT/u6Y0fXeAsWaR/uJ5qrX5Bd6olkcraMExNPR5iCJ9gE/ZSA0i+LQhza0OqVQM+7VKK9tOm588D1T6ET/JLk17hrzeY5Uk6JGcBOjkStTK1qyzsIGbJzqlPcWCQk+mzsxwTZdJ831Ax89V2BiW+LNnTBkyBOvkZeOswIMUGyTy9Zlu92n8rhQSlRSJoJkdEBPONz2NxQBJXNGNL8zRHBbf6f9ErP3YTbooRyeV9FNUJaKu+yyEV2jnE/Lgs9jaExRzSYOiMuRdB9eQHmHY+UEuNV+sY0KhpivuerrFI6ucQqESocOQK91gb+tsKhLnyIsLftrSm40fK3sNWdQCAZnT6GYzC4+PWIDTLuXrYff8zq65sIe6f3gR21Iz/qicJruVG4HchMdj4UMhy6ftNWKNrzNTtz4QK/n099XFj2eYljyBZQ380u8HOhUBeXn+PPogwhzkGm1OKHUCvA0Jpn9wUIac/PYgYzelCd/pKK4mj2iJTCGzrCzbTv6EJEQmDuHLahQa9wN+Fz1dDf9nov80rkTl7q6cLb3csMXH+4LyLMZPvwQkJ6tL+D1Wk/GtSKjAaNkNufZwHR6C54P6ppawESncOBT6znHYGhV5MpGRYqDecOKFlkxXe1wDSnT21COfzD1HbQP5ZV6AJi6lHA+ly8aRqk5U0lao3jQJ7PKMKf3JfD7xmFrQfW5jRqZUoKWY2PfdgC6EXxh7EDSjDtSoexGRPqZyS6UUmKQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(8676002)(508600001)(235185007)(66946007)(66476007)(6486002)(54906003)(8936002)(5660300002)(45080400002)(36756003)(4326008)(2906002)(44832011)(66556008)(966005)(186003)(7416002)(86362001)(2616005)(83380400001)(38100700002)(33964004)(316002)(53546011)(31696002)(110136005)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0p5U2cyZ0Z6N01oUUJZSEl3N1F0bWFGZ25HMGd3TVFCV3dYck92cXRLaGs2?=
 =?utf-8?B?NFJ4QUdDdkpLTW1naWkvbVBUekVxbGY4OC9abTU4ZkhQMGhETzh0c1diQW81?=
 =?utf-8?B?cVB0enQ3L3drTjFKUW9LRkwxbktFOEN1cDhjY25ETWgwbjN3VHlLbzRoeVlu?=
 =?utf-8?B?QmJkdzRrSzl4a011MjNNM1RLcHJMSm5yazlkeFduZXZGY3o5QkVHdmdsTDdn?=
 =?utf-8?B?S2d5WEV1QTBpM0xDM2plSFdqeXloemZLL2dreFRBanVQY1l2L3YvMk5RN2ND?=
 =?utf-8?B?UHJXWlBaR0xrOUN4RXVHa3IrRmhELzdzSzhvNk1QNnBwbWg4dHdCazI4Mzhz?=
 =?utf-8?B?L3JkMkhTL1ZnM2pVRkhHc1JwL3RIRWNOUzN1TXdYYnExM25WMlI3ZEFUWThH?=
 =?utf-8?B?ZDN3UjRGeldZWXU3YWFSSjFDQlNLZC92Y0txU0lmMStuKzVqaU5DbVZXVlBK?=
 =?utf-8?B?MWZEK0Y2eW1iZmlIeHRtR2x6c0VFcXU2Q2hTVmU1T1JONmUzdVRyVVkyZ00r?=
 =?utf-8?B?bWNBMElObFFCeWZ3VjdJRzAzRnltZzhEWkFpa2FQUkZVOHVOQ21QMHBnQXFO?=
 =?utf-8?B?dmFMc1pXczJ4NTNPYjlYMUJ3Zng3Z1J5Nm0vT29SWmpWUG83TUV5RkVIZWVh?=
 =?utf-8?B?TlZtMVZTL09VVDJ0ZHFDV2dLemJSVVU3dWVVMnFNK2VWbVJMYm01NXdwQzBO?=
 =?utf-8?B?ODBZNi9yWVlaQ2xFcW1reDdRRXliNWR6ejFrcEV0cWQyeUZnRVNIVm9zT1VW?=
 =?utf-8?B?SnRtRE5IQUZna2NQTWh5QVVIUXd3dU9KbzlHM1R2bHhCM0NiR0dlNVFlK0hn?=
 =?utf-8?B?ek03b0pyVVp0YVlnQkpUYWZwdDRmNk1acS9kTFpFd0tCUFhvWXVuNjNYdnVj?=
 =?utf-8?B?a2t1Q1gyb3NLRWZmMzhySXF5MXV6cTZDQm05b1lHdTM0RUkzbWVpTG55UWZ0?=
 =?utf-8?B?WkQ3Rk8yQXlZMEdWR2FVVXZhc3cyNis2Ry9mbndMVVdYY2JkUW1TV2tXNUpv?=
 =?utf-8?B?aEhtUUpWWDgwRDY3SFduaURTWUhBcGtGSU92ZVBXeVFGNkV6MzYwdVlXa2dE?=
 =?utf-8?B?STNlVlRDRGRNZzZDUjdhZHY5NkxhN0ozeFQvVDgzS3d2ZlRMSXUwR3pHenhX?=
 =?utf-8?B?UEJiRFd2OTZzaU1lVmVCT0xjNVJrdmJjUlptTU4zcjFOUXZnWUJlWjF0dVRF?=
 =?utf-8?B?RWRJQVNWSkpiSG56WW9mYWlncG9mRzNsM3VTckkwVUlHSlNPU2o2c3NqNDEy?=
 =?utf-8?B?a3lReTQvaWFJT241dE11V1dmZ21WZ3dhSTdkYk9UVVo2ZU5COHUvb013TnRB?=
 =?utf-8?B?bEYxRjBqaW5JcnE0Q1FqdTMzUjRIc3pOU05zN3JZOG1ONW1OVGJkektreGZK?=
 =?utf-8?B?STh6ZnJSVGozaHdlUW1xK1NnaTJkOWsxZW1aU2lDNnE2RGZ4K3c3cEdnVlly?=
 =?utf-8?B?bUtWU2FKWmlMVDBQY3h2VXhjSFZVcUJOQWgxazcxYlM1ZUpmV1owcFhHUFZN?=
 =?utf-8?B?S1pPR054K0tUczBtdDZ0OU5aSy9wcmFWbVRZbE4xYkFBZ3RySUIybXpCb2VI?=
 =?utf-8?B?Y0t2cXRWU25KQUZFcHdJbzdrLzlqZFJwYVV6VTlsYWQyakUzQTlsRTRCRVJn?=
 =?utf-8?B?cUE3NVpweSt5ZDJweFlRcmRuZTliTWZvTVVuaktBZlMydlFyTXUvdGo1dys4?=
 =?utf-8?B?dUw1emVKRnlLbWU1TVNVdWFlTUd1VG5BMXdZTmtseE9JZ1BsWFJlbXVEejNo?=
 =?utf-8?B?NlV1eGt1Ym9hSmtJTjhrTm9CVjAwYUZKLzFsbk85cTZkY3Yrb2U5Mm1kRTY1?=
 =?utf-8?B?MlkwV3dpSnJ4Wlh3YW1zYThTZlp1Slo5aUUvdG0reDhsRU9jU2F5MVNEZE1U?=
 =?utf-8?B?YjA1RHB1dzNheDRWdEVjeldQMnlWaTFOZWlFWkh3bzh3N3BQRjFDc0dNRGIz?=
 =?utf-8?B?ZVNrTmI2Sm41VjAxcG5XM1JHU2NxL3Q2WkdYalMzYVQ0ZVplT3BKQkVJa01B?=
 =?utf-8?B?UGFhVCtiOExIR09WN3JhUnZjeGhsOWFoSlVkVDFCVVQwWGdPZnVoSitXSGJJ?=
 =?utf-8?B?ZXlVQXZQOXMrcWR1MlFORUpTSXdwTWMyMWNBVlVwTGtacEdrL0plaXdIVFZt?=
 =?utf-8?B?aEgyY096Y2ltUUlzbEJ1bDZjZzJJVklaUXJMMUZzdVFEUXZWdkwvdUNCVE5u?=
 =?utf-8?B?VTIrai9hdTJiSXRQTXRlaTI4MUVURnhnWW9ITEh2SThoczBieHJKcFNVS0JE?=
 =?utf-8?Q?ShEUo6PSLp0tWSeCObfN4XMS3ogStk0zbDCtZJa38Q=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1cbde3-98f1-4b57-cd23-08d9a2c1f1be
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 14:13:31.9726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJnB4SzU2kmTHa6K1BOGJiuBtswsLlanldQzYqYShzYK/lkWhAZUVO4j74UFt26PjQst0tzBa75A5zcRQmjqDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7055
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Bud Liviu-Alexandru <budliviu@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Colin Ian King <colin.king@canonical.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

--------------791C240922A1805F6DA45D2B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/8/21 3:39 PM, Pierre-Louis Bossart wrote:
>
> On 11/8/21 5:11 AM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> With CONFIG_SND_SOC_SOF_COMPRESS=m, the compression code is
>> not built into a the main SOF driver when that is built-in:
>>
>> x86_64-linux-ld: sound/soc/sof/ipc.o: in function `ipc_stream_message':
>> ipc.c:(.text+0x5a2): undefined reference to `snd_sof_compr_fragment_elapsed'
>> x86_64-linux-ld: sound/soc/sof/topology.o: in function `sof_dai_load':
>> topology.c:(.text+0x32d1): undefined reference to `snd_sof_compr_init_elapsed_work'
>> x86_64-linux-ld: topology.c:(.text+0x32e1): undefined reference to `snd_sof_compr_init_elapsed_work'
>>
>> Make this a 'bool' symbol so it just decides whether the
>> code gets built at all.
>>
>> Fixes: 858f7a5c45ca ("ASoC: SOF: Introduce fragment elapsed notification API")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> It's Monday morning and my memory is still foggy but I think we fixed
> this problem with https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fthesofproject%2Flinux%2Fpull%2F3180&amp;data=04%7C01%7Cdaniel.baluta%40nxp.com%7C25ac869cfd1040f1be1708d9a2bd3460%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637719755777370422%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=E4K2DPkpLX2SgVJ1K99Qs3uz7l7mS96gIzYlJw9akbg%3D&amp;reserved=0,
> where we changed the Kconfigs for i.MX. We haven't sent this update
> upstream for some reason.
>
> Arnd, can you share the configuration that breaks with the existing
> upstream code, I can check if the problem still exists.


Maybe someone forgot :) to send 
https://github.com/thesofproject/linux/pull/3180/commits/7122edc88d13db8ba835bdb20f7444ae535f9ffa 
upstream.

I think that's me.

Arnd can you run your scripts with 
https://github.com/thesofproject/linux/pull/3180/commits/7122edc88d13db8ba835bdb20f7444ae535f9ffa. 
I also attached the patch

if it's easier to apply.



--------------791C240922A1805F6DA45D2B
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ASoC-SOF-i.MX-simplify-Kconfig.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ASoC-SOF-i.MX-simplify-Kconfig.patch"

From 8393b756c476a513fc69016d701f22899724fb73 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 27 Sep 2021 13:54:38 -0500
Subject: [PATCH] ASoC: SOF: i.MX: simplify Kconfig

Follow the Intel example and simplify the Kconfig
a) start from the end-product for 'select' chains
b) use 'depends on' to filter out configurations.
c) use snd-sof-of as a common module without any 'select'

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/Kconfig     |  4 +++-
 sound/soc/sof/Makefile    |  2 +-
 sound/soc/sof/imx/Kconfig | 46 +++++++++++----------------------------
 3 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 6bb4db87af03..98ba48982736 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -40,12 +40,14 @@ config SND_SOC_SOF_ACPI_DEV
 config SND_SOC_SOF_OF
 	tristate "SOF OF enumeration support"
 	depends on OF || COMPILE_TEST
-	select SND_SOC_SOF
 	help
 	  This adds support for Device Tree enumeration. This option is
 	  required to enable i.MX8 devices.
 	  Say Y if you need this option. If unsure select "N".
 
+config SND_SOC_SOF_OF_DEV
+	tristate
+
 config SND_SOC_SOF_COMPRESS
 	tristate
 	select SND_SOC_COMPRESS
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 06e5f49f7ee8..1dac5cb4dfd6 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -17,7 +17,7 @@ obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
 
 
 obj-$(CONFIG_SND_SOC_SOF_ACPI_DEV) += snd-sof-acpi.o
-obj-$(CONFIG_SND_SOC_SOF_OF) += snd-sof-of.o
+obj-$(CONFIG_SND_SOC_SOF_OF_DEV) += snd-sof-of.o
 obj-$(CONFIG_SND_SOC_SOF_PCI_DEV) += snd-sof-pci.o
 
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 34cf228c188f..9b8d5bb1e449 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -11,53 +11,33 @@ config SND_SOC_SOF_IMX_TOPLEVEL
 
 if SND_SOC_SOF_IMX_TOPLEVEL
 
-config SND_SOC_SOF_IMX_OF
-	def_tristate SND_SOC_SOF_OF
-	select SND_SOC_SOF_IMX8 if SND_SOC_SOF_IMX8_SUPPORT
-	select SND_SOC_SOF_IMX8M if SND_SOC_SOF_IMX8M_SUPPORT
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-
 config SND_SOC_SOF_IMX_COMMON
 	tristate
+	select SND_SOC_SOF_OF_DEV
+	select SND_SOC_SOF
+	select SND_SOC_SOF_XTENSA
+	select SND_SOC_SOF_COMPRESS
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
 
-config SND_SOC_SOF_IMX8_SUPPORT
-	bool "SOF support for i.MX8"
-	depends on IMX_SCU=y || IMX_SCU=SND_SOC_SOF_IMX_OF
-	depends on IMX_DSP=y || IMX_DSP=SND_SOC_SOF_IMX_OF
+config SND_SOC_SOF_IMX8
+	tristate "SOF support for i.MX8"
+	depends on IMX_SCU
+	depends on IMX_DSP
+	select SND_SOC_SOF_IMX_COMMON
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX8 platforms.
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
-config SND_SOC_SOF_IMX8
-	tristate
+config SND_SOC_SOF_IMX8M
+	tristate "SOF support for i.MX8M"
+	depends on IMX_DSP
 	select SND_SOC_SOF_IMX_COMMON
-	select SND_SOC_SOF_XTENSA
-	select SND_SOC_SOF_COMPRESS
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-
-config SND_SOC_SOF_IMX8M_SUPPORT
-	bool "SOF support for i.MX8M"
-	depends on IMX_DSP=y || IMX_DSP=SND_SOC_SOF_OF
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX8M platforms.
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
-config SND_SOC_SOF_IMX8M
-	tristate
-	select SND_SOC_SOF_IMX_COMMON
-	select SND_SOC_SOF_XTENSA
-	select SND_SOC_SOF_COMPRESS
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-
-endif ## SND_SOC_SOF_IMX_IMX_TOPLEVEL
+endif ## SND_SOC_SOF_IMX_TOPLEVEL
-- 
2.27.0


--------------791C240922A1805F6DA45D2B--
