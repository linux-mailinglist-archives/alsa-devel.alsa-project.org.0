Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9A35A59CE
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 05:17:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A5A41652;
	Tue, 30 Aug 2022 05:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A5A41652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661829471;
	bh=2XNvj6+RkceuSqfElfBzA65y4S3I1SgBTwqzxXlk4mc=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pXBh7Xgmd2J9/D2YpXgP2iJv2VBgiJea6K14ODDPr30FNGFqZ2e6ps+3Zpw6+tub8
	 PBUw1pDEJuofYMBzsPEeAVRFKjYThe+wfdGDTFvlfCE+7eJtFCvEhbkIMHewQilNBc
	 tEALICbwFkyOOZsDJh0/oCsWsoknyEng9k8SIddo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1398CF800F2;
	Tue, 30 Aug 2022 05:16:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4EA3F8023A; Tue, 30 Aug 2022 05:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BFBBF800AA
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 05:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BFBBF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="TZU7fBCG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcJyzDiH/L+q6s9Aj3ea+BejE8FgKq4O8WZ9oOSd75+wRaBrm4/HxFYWQFmWlxFfJmeCG/K/PnVmXkrOyahGOqPeNDH6XhwTZezv0zlXolpRUBbVcjiPB0PHnYT5kyPoDVWyRVmq6KK9XrzGmuwZrlyJfFSWaJVz/vGlAJTlHt1XpYHLNorfEp8q6IBto3+sO6J13IbymJE4eQIQa5iXqHl/fUOc1r7pOhaeiIBEhAj/okjo5jT4h81d9cEWJW+/j1XvyyGmCblAjZuF6OYK/7mwyfwzm6MEA7FT7l2lITW4YMbNL1nmvosU42Mol+KYJlRsSf0isqURAuRZWEEvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyYa1k/0ApN1kjyTX3Ls+DkDBx+2uN1jPFn8iLoVzLk=;
 b=SjAML8cgCKiFCKZGmkPYT7pmeMYVJ209LAmwqqbt1Vdo5Eh+jyDEnr3rCqfkrAjR9kE/OWysWgTPBc8UC6BrxnSAF+PfrrQhyeFgO7hFBHA5owRloLUtDd+BEpyYH6NLwp318Z2WnLUICTZ/tQZG38opX1VXUGCPEMS1X8TTXiUPemZKaQIJZogsiZNq1ons9Y2hYM/QJmIlhZZ43oH1Y1iwtK74R7Ya2tLKWGt5q0MEntGrxn1Wx4Oni3AdI94QoAtuF2LDpX37akxReECpiZvIoKj4FuIpOkllCq8DQyc5fWyaByKNqs3OqTyuzFYxKXd1h2KEqeSG/XbtFubBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyYa1k/0ApN1kjyTX3Ls+DkDBx+2uN1jPFn8iLoVzLk=;
 b=TZU7fBCGgCTYkBgAf/ZWYIDy/uMBR6R0YPSU3UmmbQPQACkNHJ6PsWsfJTV2ySZ8dE4t/noHNzRxGhi6FlsBlZa3QbV2d6yVTU29ARaRHnNDjjcBP8D2LIs18URXjL3/3k/TqJKRfrWaQPIdymB+wIvHXVj/zYf1hYwBxYKEpk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSAPR01MB2675.jpnprd01.prod.outlook.com (2603:1096:604:8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 03:16:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 03:16:35 +0000
Message-ID: <87tu5u4e0c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: soc-pcm.c: random cleanup
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Aug 2022 03:16:35 +0000
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef68ef30-bb2c-42fd-f4c1-08da8a360bc8
X-MS-TrafficTypeDiagnostic: OSAPR01MB2675:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CsCq6HceKWk0BfrrF24hs0J/4xW2uxnOMiaykg22PXq2ulWqRgQFEHcFEs8LqvUjSExXOA6kbpT44RJ/J43DtvIkvXpSmF19HJRuDscuSqmpsnZIVKgwxKVpI4uy+4Q7x82RATrVotdlADcUZr0G+MmVSCywx+K7AoC7asufC72izLcUHfg5fP28fQqpSdLc/CEOU26vtDjRq3Q3z+7xtIMfWvEM9wCooHF4TgDW+SmDGAmnCEb5LIy/y4HDTIJfOZU+J2hBciHIFFt7GFOJrakXpp5OQ/V6AiAQLokMlpdfnnPyupm2vwxpSiiY0G4c+C3PfUKvdJMhMr11aHnO8vzsE6tVaDp/xGvrKKgg+zKVBhssaEFHYzbdC24BmxCtGHPCWFHYfHL96M05CBJMBZRwtrKMm4sN/tT3HAQ4EQAdU0wQ6uL/1kcjRAO2M2bwH0pjMItxyAswzQ0kYYDCeut3WJHVdj+mcloKuJPKvHnL+gnv07MpJY5CvrP5owtx7DKn6ZLLqIwVtKxUj7l4Pel6GA3v+1vmOGkLWcqnW8M2jJMIPJZdafJFmNNmWePVQW/PDiRr/py722JCSfO4y3R1XwIFNXyFXdAktTudnVvornT1MKNmO84TszEXkCvLWimGUsGC0tmxH1fROMt+us44tsBBBKlejm80KFQdy8uh67dJXbf2xa1FFJ5JMvSYxnQJjjK2ETh9CRp52ar9mmOgNJQyZdA6Kn9/OGCDxibXbKNd0oA6XXzzYZ+XHyJvq+F92Gy5Ck71e7v9ZUVodQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(316002)(38100700002)(38350700002)(6512007)(26005)(8936002)(4744005)(41300700001)(5660300002)(478600001)(86362001)(4326008)(8676002)(2906002)(66946007)(52116002)(6486002)(6506007)(66556008)(66476007)(2616005)(83380400001)(186003)(36756003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2hsOi2GrYKDcULXBa5L5K+s8DVzpO4VDzcJzQ8U2jldJqCHbddZLIEwzpfL3?=
 =?us-ascii?Q?2ABzimbK9IUtjJlrGHbc0Usv/kTbsf2Umr83ehvDX5ppuvfKtgMjZlAJcqXE?=
 =?us-ascii?Q?ZuiRlfJ4bzvrkzZKlQaZVc+HHsOMxqylpgoCZoejw64Wnx41mHr2MuKDI7q4?=
 =?us-ascii?Q?Rip5LfVNVxkV6rIoQYn1qqY/9tooqhpnfIE+Fr6fpZ0pUqG3F2aIz0ED2OcT?=
 =?us-ascii?Q?/oiYCe1AkswTyaJBNEJP9pAmtcyavldsOJbvg2C+zE91HArGzdT3LQDzwl0+?=
 =?us-ascii?Q?kcnhUF5iOBIhu+FYItZuZVHdxbZltP+Rv3gG3Sq98Yq3f6adW+UcnazUm2V5?=
 =?us-ascii?Q?7SfpgWL873dC32RzvkfOMgNl3odivM7AWC4fCKm1ZO0HaoA6te6MF2eYWDKt?=
 =?us-ascii?Q?eOxykuTuu9aLkDgW4WSuSKhsRG7FuBdXA+btZ5fxGcNpeI4jWhI33wav01hb?=
 =?us-ascii?Q?13jfo9MdIiYoc4L2A66YMrZLvmrZ0gfCla2iWMcIHJ5HAkpoa7QUtQF7Xnkd?=
 =?us-ascii?Q?bs1864WtWALgZIyGlUFHeHuBrss5ybkouSKaxEO9ZHOM2TKOeHpIRikOayyW?=
 =?us-ascii?Q?vM5ZRH09XAWFyXJLV/qLE32eZV9vxS24qjJkE+o4xb/ieD+VvvUGOD37yCrs?=
 =?us-ascii?Q?BZzBDG229Ap6l/6PbgbTA2tYJY+2OjPDGskWNtPKvoqgpXtKjhVqwlgWf9UA?=
 =?us-ascii?Q?8+K/qW986OQN8vpIf00VRR8Y0Oj0i5XCMfr2DilOPam25Cdfql4CLP02KfLv?=
 =?us-ascii?Q?Yqzf8LklaDxcO4TkBxwsOysSDyYLtvS0DBmx+AaVb8CtdSTX1r3L7nMbPhWT?=
 =?us-ascii?Q?Ue/OfUHFB6woV6QFzMiY45B+Vslv+KyjZrad8+LYPTq2/G30kXFKaPXTnMpG?=
 =?us-ascii?Q?hETWgwc3+NsqANDFv+nUvsTSKTWLYNSmY78p+CoKKAvJCZB02MoXhrrVkSAM?=
 =?us-ascii?Q?KFxRz5c2KxOwDs578OGEoNk198fLmJ2SFVpreJ8OST1a9c93jmWFuHa4qj42?=
 =?us-ascii?Q?DiEVqSq0DHNYqfFz7kOgAroZrmADkIOVnWHhJvKSXprgh8JWyWtOcLxkjBuF?=
 =?us-ascii?Q?A7DXpVFvwG5TaZrV3ZBUgyEryN3EP8V6zLi3ygNf8CWQSQIaJYEnAJK5BJ+S?=
 =?us-ascii?Q?ayTsSsY29S+DVnBBeCpCEWAuu0EhCHRM+vb0D5fbR6zjBrZ6nZYh7WUibiWu?=
 =?us-ascii?Q?U36aoHlus7g1BpqSNuoNLtsTgjjlyoZmZtSJrajz9LCztsBH3xVeo/qT4fRg?=
 =?us-ascii?Q?NKSwuu3CXwdWn9P26rZsAbz6YVfasQ3CCl3vkRrTfg51pDO+MOE635+NjIut?=
 =?us-ascii?Q?76VmjYVJA5k/WCiBjske85bHClSxLOCZVOUuHRAaLx+mMKNJ1xG7Wy5LgluY?=
 =?us-ascii?Q?xgRbbhhhxxJEmrtpmqWBLOD9tT3sqz/ImEPjEPePSj6MK4cazhKH+6NUaRru?=
 =?us-ascii?Q?zppo9s2P1S4RPOknspOhCs73zqcrBpAHifpXPSh9Q1bEFG8A7V5QrXlZdu5z?=
 =?us-ascii?Q?IB2k9dL632YCjJitIY4wfz/bvCN4nQwDMmhVE5ojW40bLdPhRGQr+RDZ9fnm?=
 =?us-ascii?Q?5MdS2iaFJ8a/orjhWUZxeOqta9aoGMpmbs2TKNfVXQhbujPXZs4O2I3hYM+F?=
 =?us-ascii?Q?1+HAd+zzUR9cu+LXT7wXBrQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef68ef30-bb2c-42fd-f4c1-08da8a360bc8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 03:16:35.8182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoj8ydtLQ0jEm75lt5viWlz9KesURQV56akwAa9XeOR4Ojpz6XYQx3p3MuSDJCJEEK779v4EoCtdYuPdIrDddqivKvjR5EWHk0OZRyAavTcW3trsDkISOFJFenuoxlb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2675
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


Hi Mark

These are not related, but random cleanup patches for soc-pcm.c

Kuninori Morimoto (3):
  ASoC: soc-pcm.c: remove unnecessary codec2codec_close_delayed_work()
  ASoC: soc-pcm.c: add soc_pcm_ret()
  ASoC: soc-pcm.c: check fe condition at out of loop

 sound/soc/soc-pcm.c | 112 +++++++++++++++++++-------------------------
 1 file changed, 47 insertions(+), 65 deletions(-)

-- 
2.25.1

