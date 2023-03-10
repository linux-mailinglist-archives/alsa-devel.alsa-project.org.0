Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CFC6B366A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 07:13:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6E81738;
	Fri, 10 Mar 2023 07:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6E81738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678428804;
	bh=C4nl4EzopsDYXhbgeH52kbrvTzjA1n0PuFA/ZNQnpMs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fkpsav7PCw532pNAfqh4XcuqUrlBT/CyyTbWXRFBszoScT3WEyGn76hCrZlla5xnt
	 aQW4nifY8XWZ5BMYjvMnNcKQ7nBCghdVM8RV4F4dpnKPgfSZ5ynzhachb0iWD2L3tJ
	 b1NH2suev5zRb13kdfpAoK+RPtLV4RSDZ1sfOlAk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62A56F80236;
	Fri, 10 Mar 2023 07:12:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE1FBF8042F; Fri, 10 Mar 2023 07:12:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A02B6F80093
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 07:12:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02B6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mrMm+HoV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4Y8stvVJGcpKQHTMMXMCNy2VFtJQ5N9jHUIQdpUzccv4qC9ie7h4saj0XgQ2hH94MJiayEbAyGWXocpj5BJH/gKNts1Gwo0pJ3o6GYd4YOvKhaQh8zH9UeG/7vEMlABrutRzs0tcUX+fT3HlzQagMNUnoCSn75fVbL5VqIWu+92JMgu1cVbuGjWTtyC8U6wmGwqvIgKvN4gTsc8+054iAcqdNqkE2ca6AHDlRPlQ0jDskUBo3yHW/v0+Nb701p6OeznABqn/OOBrY+Hre88SWkw5Xd+t6Qm7i48C8UPLPOY/+sr4D5OozJpReV9wkZURFm6xq+Z6DtQ3bnAjjQj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4nl4EzopsDYXhbgeH52kbrvTzjA1n0PuFA/ZNQnpMs=;
 b=fIoW2t76ThFVt2USH6uEVb3hUCJcyPRPguqvU0npt+jtTVFNFLTrt+wIiwNx6HLdcY+UE36RF6LUFRN5D9zsLdGgzeXDBQ8/QoXhIULJnB4PWPjIa6OlI2ENYQk90TRlKHVUmkyODyg7ed6guQon2WqruFR4XBM9YmRelSqhL6++9EWjgo68kXyZdMKXkTrGlMsobLDgdAcOuUMYkcMR+B2EnjTf62N8OLh37o/T72c4GDif1YHCam0l7Rx1W1BZSYP3uyowooZ+nUO4bjv9lAJVxf6qkTx/cjquS1tvjnhBr5qvi3LZzFw70cM8ydT3Eb08EI5xPQ+TLbPSTOQPKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4nl4EzopsDYXhbgeH52kbrvTzjA1n0PuFA/ZNQnpMs=;
 b=mrMm+HoVoOCHY0kDdkEC/YhNinMx60VHy02j4HZJQV98mDo67JEdmN4+lDv5ZWtcRaB5fnQFWw01gFaWSuuYkYk9wEeK4fB3Z1aYOM++Y52PvYeDDwhUWNuREsRLdLBM23hLAw7E/wSpWoYRkckiSxO8ohGFfdUck7jiwR4f/js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB9427.jpnprd01.prod.outlook.com (2603:1096:604:1d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 06:12:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 06:12:13 +0000
Message-ID: <87fsad2kzn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [RESEND][PATCH 0/2] ASoC: cppcheck fixups
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Mar 2023 06:12:13 +0000
X-ClientProxiedBy: TY2PR0101CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB9427:EE_
X-MS-Office365-Filtering-Correlation-Id: 33878e62-697a-467a-d97a-08db212e63f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qMdu1dXphg4zdq+/bVzh1UQTb7sacGirNPtWXt/ytBJA8sXH+SLJncxDjb3TvyIv/UmKwji3TbFzETxVfAW/dWZiLrs0JQ6QKRDPvhibNlfAU1mKJZ5SBxezBD6TIp67phn0bYROuSl8XuQwxbLSOutGQWp2+qLu/AvOqym4bT1z1+aet6tWbQJS4nAtcba0xyYtEmGoPY4pzctKC6d2yHc1+kOBGNrpEZTeLvyBHaINxpL1Lb1k177dgWrQDu+pKBEW7XVtVnWfQQ09ZrcS+I1F2ejzijHfNgTz2hoVlY6/sIn1JoEuEFGM3HYNoDGL7ECGSUwSutmnkpeWbtJvOXtW5HMbZyzB8uUSxlnws4PQYrDD24zupX8YERgIb1fjBtpKybzFxELCVgcPhEI09G29i/7j1DmY1UtQYEtiiZiKIyY83yB+BSGpdp2uaLWjT8iD4PvnnZmPToMMJfsIt/2VK8b24cigmB9nfFEnEiSS2AUaJnD0R79zqFKz5+Lf2qV1TMmbZt0MLuNMlQRqRYslaTaE2MdnFxOaq/WgeLBXFZsYaDw/q5OArIPREe1IYSWME1a0/JRp8UdQITu6Tjbeo2751TS5VvLKlzm6RpTprFhxlYzdWKdTfC/Mj4ZgilXQjOJ+mPOAI1o8YRvTa0v1SrhEDsqpICsDF6+OowQAEkNJ9HLC+spzJ4aFeRSiWuyL4hlJnv23o43a1yZYAg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199018)(558084003)(2616005)(2906002)(86362001)(38100700002)(38350700002)(66476007)(8676002)(66556008)(66946007)(316002)(4326008)(6916009)(36756003)(41300700001)(5660300002)(8936002)(6506007)(54906003)(26005)(6512007)(186003)(6486002)(478600001)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PUKCyCwhYlg6tNTVVBQJiMrobs5m5gA/d9yxdkfFN1jFEZprJUwzuLF3MH0/?=
 =?us-ascii?Q?ndNkdKW7VyT9kKHcyIEkXIHFwylsAF1lbTO3wZTsNK5seDQNQ+vvYi/tpmJm?=
 =?us-ascii?Q?MikHnV+iqejGi/8iHGLgYTew34brhD7XCu77ARLGSHOudjVPTePhs9iFOYYh?=
 =?us-ascii?Q?XqoRe3/KDuaJRl4hSt/CsknPjSdvw0MGF6V5bJHCNKOWDZCiq1fT3DZH+1GR?=
 =?us-ascii?Q?doqBCktj1JXKy5NLePFtn3WYrtdH0u+GthqCU0Zh2eX5z99yjXFnq3IQtnsG?=
 =?us-ascii?Q?p63GIxOp/ZQQosw6gMjFrv5PqfE6fp6S9lac6ACtTK2d9iEbunTeHKfRlRTV?=
 =?us-ascii?Q?KUc0ZhgSZJ0ia42yQ1VO+tM2e/9YSePnA/C2rtoXr9Gbe3DBwisrajKyxLkb?=
 =?us-ascii?Q?ZbexBM7U1DrPpn9JsELPHaRGKgXEcAwMhCb9IEBCmpIdR2XqP6FefwpLBxws?=
 =?us-ascii?Q?dkSQUA4CSykLZjdcL4/TnGLWRSfVkKa2rXsAobCNPvnPt3R01gosjtx8Ay2x?=
 =?us-ascii?Q?w6jtlPdHTqkSAaEJ/7PxvKy7eBehivCdG+BCuSgHIQXBxWvRSerL0TPnLcZe?=
 =?us-ascii?Q?P5R6PFb8+3wfva6UqIaO2uorlEFyrNhD8RlhaIh/Vo5ffA+sk2qrV0kpXXK6?=
 =?us-ascii?Q?3BsQG12a3ApUt54KXI6ivOwiKSXZPWnt2oXo6+h4H7b0XsWvxo8wKgHBn2Q6?=
 =?us-ascii?Q?O7UgI8kkaJgzCrX6ftXMv4K65vqqIsIEkG2jBH7KyvmsLN+fDOQDbSlHN7EE?=
 =?us-ascii?Q?zds7jPHExuDP7a++khz0OdXRfmBL6KNhJc03d/liwuD9ikPvdZFAbe4m/fOb?=
 =?us-ascii?Q?9yg6YWs6NMB6cMdhvHsO43wrOp3j+sjbxD9RmpM9BM5mbIHYhgjjE75uN/Nk?=
 =?us-ascii?Q?t/50Vge52CHf1enUrgBmdUC2SDw16F20/l1081Slp5Dyt2QMVpawBfJLUt/p?=
 =?us-ascii?Q?G6oaC4GnLy07S8DbqXhg2OCencvhznTVNj8e7XpjCT79dqo6cjalmDUIaBYn?=
 =?us-ascii?Q?SvR6iNr7FC2qysYySf6ao5XOt81JeF88aYs6gJHpT2QeFFGJmgwo18H/jQIC?=
 =?us-ascii?Q?fbUN0TMaabQQJlhPgQrVxF0kIxbSRlgKFQrWfab8txVzNIbefxYuIHGzaI8a?=
 =?us-ascii?Q?FBubU6Rq1Rwf+125mQvV6xKHsCLR29nlcoPfblxP8LtFb7Km0QgjiAu/6yz5?=
 =?us-ascii?Q?1a4GajxTiQZrY2gSDdsZcfFYBkHtN546dnMQxS4VtkPq2nRSn0EAx2NcMoCj?=
 =?us-ascii?Q?vCqjaVvRLCtDrs+hBLAtWGhOj2iLrtP4dyKxgDGr3VwYxUJNuibVMRguw5eJ?=
 =?us-ascii?Q?kSQAlrlYf3I2Y1R+Ms6RdntgK9BAe2gNoJpMNtxkdrVPv8pPJFg4uokLtJBl?=
 =?us-ascii?Q?OTNR5GQLQJdLBe3MbzaQHvvC0+t+isrphtYisiP8ELonUKLdUZvbywW32W6y?=
 =?us-ascii?Q?qQeYOilqMlHHCvmA0PIlCVZduw3PHnun6R34b4nFRoDWFxBdF1Bpjqe0njRr?=
 =?us-ascii?Q?LKKaD9dXR5lRKPjQ5tDGEvDWDhICjHFxXImMB91NWTrdjt+3kkVxzFvk/LGX?=
 =?us-ascii?Q?x/c/Yhgr9x20ORROjSojlIDuh3fIskDUyFa5k05IfRaMxZlsw3r6CUHI8kZp?=
 =?us-ascii?Q?ItZEINxXask4SG4RgMRFud0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33878e62-697a-467a-d97a-08db212e63f1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 06:12:13.3000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rECeEOSdHL7F8WKV61kgNiI/E1AWpTd3Z2OzNjzJfkaMsSNYNmECGQkmkdD1RMdsEs0TJ2bCp8eJubFKiaJai6umu7WKESWO9xumaUBf0OLZHPO2zfq3lIR3h0DWxluq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9427
Message-ID-Hash: UUDM2KZPZOMLXZIRYE2NPZXCKZ4RAOZR
X-Message-ID-Hash: UUDM2KZPZOMLXZIRYE2NPZXCKZ4RAOZR
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UUDM2KZPZOMLXZIRYE2NPZXCKZ4RAOZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Takashi

This is resend of posted patch.
This patch-set fixes the issues which is reported by cppcheck.

Best regards
---
Kuninori Morimoto
