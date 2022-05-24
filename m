Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263F2532234
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 06:41:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6EB8170C;
	Tue, 24 May 2022 06:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6EB8170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653367296;
	bh=YWKkqMoU+Lc7IQR5PsQj8YftDRCJzlJScYYAt3QodoY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y7cOg4Jaf4t709uNtJrRwDr23fQ/Sq67SJmr+CfmcEHIQBmUn0h7EnZk4veL08ZVX
	 pBoZR1o9m5nflz49MEBNrMzfSUGZ7LdQBC+Me1cYB0sWiJNAgY9cpecB07gR3PIIib
	 TgulLWBjvGR+fk9+U1J/UsbNDGbj2df/x6S7VqwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F908F800E3;
	Tue, 24 May 2022 06:40:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9081CF800E3; Tue, 24 May 2022 06:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::713])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97EA0F800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 06:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97EA0F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="ZsdEOuB1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKNDSCA5r3SMBLDdkO92VF41ciDYAxtGZTbNd7ngTK0uPGpkWhyozTh1NEpNFdOt4waMI8ejMJCg0aY0iwUyMoM59Pl+NOA/OvxdrgKhVo6/XyOCqDnp3qdEIruYsdB57aOP9PFMcwY6t9Fs6rBfY7B67VF5n/Wf7rd++DszGDpOQfUlfEmP5iZgWVipQLIkmoZ/D/TFIBSxelRKquWACBGy7PaXBpZq+Ek+VMHofIC3/Y4PKT60GoNqQKmWwCtq/n0s7LpZ0kHxCfBXAk8/Etnk/58Ev6T67Zg3BK4kDi8EZieUzTGvwfdXkrWLvzgm+SSYjJX80AwAWbWKzIv+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eo9j0X4BTr1MHglECi0JFpb7rougk2kitQNOI2QK1I=;
 b=G3sMTbbju0qduDaIGBTc2aWlAKlPtp2QY7IgbEF4nRA7DL0o44j2sy0g/F+nm7ksAkHjJPUf3sWat5vlU7wdnsa9FdAnBgrs8pTQJEteoV1OaYM4mHW+Y3hKtTzds0htCf3yyisaOtdstvkZAxEiuKq8DVINef1oN4P26uC8azLUHFRhA8xY+ffouupTPqKPorCRw/TCWVrDWFTfszE5dafk3AQOaOC1jUD+xQplZtKvpl0FLFQDDQ3xBnl8xeUHp++yX1w8mreyd2A6YzipVz0/sOKo7Cc41THc9NPR5Irlok0dx+O0I0mGvOijRxUmuzwh+Bu5YQA8r6+YgblJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eo9j0X4BTr1MHglECi0JFpb7rougk2kitQNOI2QK1I=;
 b=ZsdEOuB167mtLhY3HrI345iZi/Dz2emBTJao606TUZGrNRfOcCxtW0e+hwOPxW5Bx+30LdhAR3L7JpiJZtiwKI+/7299T2lvNtO57dCRU9vvAOjGMIlloRBL81AkydkgsdiWP2WQc1AracmWRYB360X+X9cmqUU57RJ1ICShGZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB4027.jpnprd01.prod.outlook.com (2603:1096:404:db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Tue, 24 May
 2022 04:40:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%8]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 04:40:24 +0000
Message-ID: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: About Cleanup ASoC
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 May 2022 04:40:24 +0000
X-ClientProxiedBy: TY2PR06CA0047.apcprd06.prod.outlook.com
 (2603:1096:404:2e::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea8b1f86-0ec3-4204-e9c6-08da3d3f84a5
X-MS-TrafficTypeDiagnostic: TY2PR01MB4027:EE_
X-Microsoft-Antispam-PRVS: <TY2PR01MB40278DBF72093BDED2821F2AD4D79@TY2PR01MB4027.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sbT14jMikjYwRMRhkqRH/YlEXKtmuIn4qzOiWnGW6QioGLRmbMENf7TnjLjix/GiYKnJ4yTcWZqgOGThkzNtMkq4JxUdXRYNRk6L9/2blQbn0C5UJxk70THit6m7CcDM8nlYJXMbzfS8YKuWEhVqtF+z/nmUrb6gngQiXbQUe5xa1X/jtPfEkns/ltiafdf/KeiwwUeVl7jxW3w6UIjlzr4F3G8dUhyTtGiHG+XgXK0TXBFCUrYi57RFUjEyxQHXNqBFsf5IK5v+Y/XDMhPt6HDay/1PAyHwNMHNd5mQdL8CXwcdPl7l6G+OCmJwUNWMMI5RpxtRjw9hVDIVMYK9YbEQA/t9fuDGvXTMtg7X0HeqfMySHMAbSgm/oFvg7Y80pWxcggWsJk+ZpKO8YBjKIE3lzuy06qWD9VnrMg0Q8sAnEmFKjiH1lGrNeNkeQDweWzCnAaSTbZm6fx+MySaxggVsIWri/mAOofIM9u+6pmWK6dGp3kAyZRjnyImf9MB0zm4d8+iJpZEa5bkssZYJx7eRTXFk/ySQnjwlG54aPQONeb/YvN9UZSq17KIoFRRPidamYnjoluK+9w7fsl9u+ReVG8LnvQZwV8Glr5jeh6uiphZTw1tG1aSVrolHPIEObvw1tKvK5QVi/ysdY/x2qhqk31ozcIRTgsnbC+p9vQTQBnbohhDkbX6IZD0YX/F4xVQvucx79STCMTdckV+4O6Z/RDWeQiiJhIoO3KKoO/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(52116002)(5660300002)(6486002)(38350700002)(26005)(36756003)(38100700002)(508600001)(2616005)(6916009)(54906003)(8936002)(4326008)(86362001)(186003)(316002)(2906002)(7116003)(66946007)(3480700007)(83380400001)(66556008)(6506007)(66476007)(8676002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3XMcejPFbfrjHS0T3CyZlGRJDhMVPHHf/rWmD3FSZZWV4U2faLeVEfDRcdF9?=
 =?us-ascii?Q?HdRFnvyGovClENq3YOJOGJRLnR1bc/uX5d9OfAmqa8G0YQkFb+IcY+CdY2nR?=
 =?us-ascii?Q?5j5OsSTIPHqJur3Dk0Ye4jKOj9XHhAyr7lKI3j3W5jHkv9OuofupL7aUb7ag?=
 =?us-ascii?Q?C7U4sB0lrdOH/Bu/TGGeEVbmaZ+ct+wMhXxL8LL7QLaZLOexnzrXtSUyxp8R?=
 =?us-ascii?Q?yOTzuY2e7LGQ9uxwt2J8NUxs1RoWV6Z4uWGJkMBr22NqxsBqp6Q0/O8fFTDT?=
 =?us-ascii?Q?SL9dFxX5UA5qpcVYaEHRs0jxZOiHeR5fSQEa4fnsWVq7yuN/Td3zv/Sa96B7?=
 =?us-ascii?Q?ttfAArCaonem65OX58UpaFhKwK8RKbdaE4+2fC/X86Gs0N8v5iYlPJGIkFUv?=
 =?us-ascii?Q?LEGW3Mvcd3NkcS18tyAmp7iD0fzyjivmAbv6vZ6KEx823PKvjVSpXxgkRRwQ?=
 =?us-ascii?Q?YmfKfktBDVIcI85oVwB20YnY6iFa7wJKIgrMNPXMV0k6prsqQq95nMnM7Hjd?=
 =?us-ascii?Q?7Wu8eS1eJzyoGe7l7x3FWjqgw/Si5U8smmTzRbqQMfycMFlbiGUtXTpZ+67Q?=
 =?us-ascii?Q?DHf37iZEnJa96/BFCK+a3fTE961i+U9n5mPm+fuH3tvfySxuWs7ateQYYiEo?=
 =?us-ascii?Q?oVsf/p2uP6RWqMuXfwvqxY/+bT5Sd7bN2y1HxnuJ0VtZhIfJZ2HVWN0TMwcM?=
 =?us-ascii?Q?hhBrajVixTX6T/BZRmFQyVb3j3ajw7ULt6RiswAi6tnArL/jaPlL811UqWyJ?=
 =?us-ascii?Q?mOL4kLcGEk981hLdBEC+V3VEVH6irFPtFsml1f5WqzZQiLrHAqja8EgSGgYk?=
 =?us-ascii?Q?8QxHGZXOGuUA7QC2Mfbx5kjTOfoC4FBny0JjWjnmvGULegMKFQGsyoryclJf?=
 =?us-ascii?Q?jv3hSqePLCx7IkIp/pHqLSwB2ai0Spn2iJ/Tcs7ywjywz0aIUENPxtG6e5Ap?=
 =?us-ascii?Q?jWmj9AzwchBeCXE5g6FARHUAyqU2Y6HfZjcCOvO/7uVSjso88dx5lpsWBHSm?=
 =?us-ascii?Q?Q8yi7fg3+erGnDZvaJv6252ZbqVumPtEct1T/VKh0pJbloePlrN7GxpTOD5v?=
 =?us-ascii?Q?8BNxTFZKEBSBCzFwSMWBpJFQg7GqDBrtL1uCnV4pS7SmKUvdCKX5FSdYS99D?=
 =?us-ascii?Q?pM1Tdosbj+I4yk4TzHwbEntWO/73OuWcxjOEZ0jGR1mi2jEekvb1hr0aS/YI?=
 =?us-ascii?Q?U+VwgLVUOHdya2tvvi353nEQhJyDlRrSX1camzTfeyb2hH8nG1mC8AFXYwFs?=
 =?us-ascii?Q?IsFg2UNPL/CMvHynch5SjPPUXSJ2vCn8dglsMHkw3LeOiJ7jr312Wsdjxive?=
 =?us-ascii?Q?nfEWYvTC1oamgn3NMF09FYTr5x08RfqCtJvOcw+HDO6CcoSHfXiqLGSHDy0O?=
 =?us-ascii?Q?77FlFot2rBZT7aupWoUy7JeV3YFFl1Ruk5reSC4f+43n0qBdKYlC6EDjn1Lw?=
 =?us-ascii?Q?Cs2C8FiUdfrD93LnIzhhHF5Pvo79WF8JJTIlhRyMKFBnQRbkBfTDqeLhfXPr?=
 =?us-ascii?Q?zxnmqRUsnjyKn/BMrcs/hqGxJDWWIXjjJzZYbVrWH5UWCkOMAd1ou8mWoCJd?=
 =?us-ascii?Q?aTMbKNvo6gohF9gtXcNOW1sHmW49DoIXsg9/oxyyz8pFJa65NvLRNdrbxd2q?=
 =?us-ascii?Q?FgyZsk0n9L6Q+hy8eYlpUf4b5CABB0koq9lrZQ+f2QG1zk33xZIXSz8Xlz2u?=
 =?us-ascii?Q?e5krFsi3ix9Lv5GfgF/bmlnhzADgdd7I0ugkomgl3bvCaaXctV4HDUAsoYVw?=
 =?us-ascii?Q?SDbCEkRiIgFUNINq9pNZfpHTJ2iO7GhCpqp179cp15lsPRHnF3kK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8b1f86-0ec3-4204-e9c6-08da3d3f84a5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 04:40:24.5139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9O7xN78Xui+1K58zAcjfxqaQ5MMqpAh4PWD0rw/001SQC8mvqGQUG/EhiqQNupZIupUhESwBepUkLe6xauw5riHfN/grshDUJjUZH3XIxV3DneEn2vseA1yBVRUk2G6/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4027
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


Hi ASoC
Cc Mark, Pierre-Louis, Cezary

I have very interesting to clean up ASoC.
I think it is still very complex, thus, non flexible.
I'm thinking that we want to cleanup...

	- Component with multi Card connection
	- fixed playback vs capture
	- fixed CPU vs Codec
	- DPCM connection vs normal connection

About first topic,
I guess the biggest reason why we have limitation is
its connections. Text based image is a little bit difficult,
but if my understanding was correct, current connections are...


	card <-> rtd <-> rtd <-> rtd <-> ...
	 |        |
	 +--------|-----+---------------+-----------+ (A)
	          |     |               |           |
	          +-> component ->  component -> component -> ...
		  |    (CPU)         (Codec)     (Platform)
		  |    |      |      |      |
	          +-> dai -> dai -> dai -> dai -> ...

Card has "component list", and Component has pointer to Card (A).
This makes the limitation which blocking multiple Card connections, I think.

One note here is that "Platform" doesn't have "DAI".

So if rtd have something other connector list, let's say "ep" list here for now,
instead of "dai", and remove Card <-> Component connection,
I think the connection can be simple, and the issue can be gone,
but what do you think ?

	card <-> rtd <-> rtd <-> rtd <-> ...
	          |
		  |   dai    dai    dai    dai
		  |    |      |      |      |
	          +--> ep --> ep --> ep -> ep -> ep -> ...
	               |      |      |      |     |
	              component     component   component
		       (CPU)         (Codec)    (Platform)

Here, ep is like this

	struct rtd_entry_point {
		struct list_head list;  // list for rtd
		struct struct snd_soc_pcm_runtime *rtd;
		struct snd_soc_component *component;
		struct snd_soc_dai *dai;
	};

Current for_each_xxx() can be like this

	for_each_rtd_components()  = for_each_rtd_ep() + ep_to_component()
	for_each_rtd_dais()        = for_each_rtd_ep() + ep_to_dai()
	for_each_card_components() = for_each_card_rtds() + for_each_rtd_components()

I guess Component can have multiple Card connection on this idea,
but what do you think ?

Maybe I'm misunderstanding and/or missing something, because ASoC
is complex enough :)
Please let me know if I was misunderstanding or missing.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
