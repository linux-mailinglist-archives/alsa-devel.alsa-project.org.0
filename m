Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79F8180D2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 06:10:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2F4F83E;
	Tue, 19 Dec 2023 06:10:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2F4F83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702962636;
	bh=e2UxmyQSf1A9h1h+GWIod2M0PtPmslV3TWf4piOmNFA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rTejFzRtxh5ceP+cgP9t69j+lVv97yEu5nvWL2ZFkO4NSwGqqpm6DyV60IzJgNTzA
	 T66q41U/+6okrSOFtNIuit5vvYZQMu7FmjhW3hmZk6qYMB6g0hi5nrm0bJinO21r6o
	 kclbxHN3qpenV3q1nezkelTyplqYk7w0ly7YbzVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4A1EF805A0; Tue, 19 Dec 2023 06:10:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17FFBF80580;
	Tue, 19 Dec 2023 06:10:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D788F80425; Tue, 19 Dec 2023 06:09:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EECAEF8016E
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 06:09:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EECAEF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bexy+x6V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQVpvua5TP6sVJeF2dGNGA37m/Q/TVrfxZrd5mi0SBdN7gol/bEciAevwcM6VbNQFqJT2PqewboUxkeS8NtpEQ0fARxfOWcafNOhhV34xS4ljRpJMkhvnlH1izUv0ZVLa2PkorjASDSMi0D0PCTLeteSTnX/8wutdyTRRv82f/SHDUz6bmTc6cnkoXVN+kIczLa45TAK/QHlyx8HNS5TOhWCNVP4w4knQq9Fo8ehBfXp5riZmxg/GKhIPEaKh0ByVKO+ISazSSrnl+Z91PwqTGq51n6M9MyQsgxxnvvZikP8edijWGt5sV5Hg3+guuue7psNLSt//PlNM4+h1WvJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7LvpRkQsBVb/1TxtS6zbaRoDyCRHqXlBmLMtsqLLtk=;
 b=gtbXVvA8rcBh2AcSNbBnxRdP0rOeYk4H+VfXxq2pxezkdQ4UtEEKoICm2eX9jjyOQSXMgMvbfZtWHw04VKOZjhxSh+g5+xLGl69EAPL/YIa5ITLFzKZ7qcbQx5j19cC1ZibhAsgo/ZYOpFmOqtMW7UPNDp5f2+HWQLqYlF+f2WCY/r9wmyaFRyYVn2lf/yctavJKWVw2kMvm6sJHyXjDBtNPtCN6tev2QCuwZ6xEMhSTkaC8JdUnmOx1KfwZPAltwTw2wkcKFdsDYrof0u8x9pmOwp5D+qMu8mqnqn4vFaWdcMSsZxuG+DVf7QIYovJ3ZtNslBJ/LJcOuvxVB2PZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7LvpRkQsBVb/1TxtS6zbaRoDyCRHqXlBmLMtsqLLtk=;
 b=bexy+x6VztTO1xVx6D8JKQRZX1nP47uSlWRjU/thS2JKb91zQ0d5z8Y8r40maxfHO/4+LlwdlIIY50cEM7HL/8q5M8Zhl1qK01hQScUNXLxY98d2No/DVHMTFoqbL8/FXvJOSTEkugJc6SxumknI+nClGlE813kXk26YKsEauS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10094.jpnprd01.prod.outlook.com
 (2603:1096:400:1dc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Tue, 19 Dec
 2023 05:09:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 05:09:26 +0000
Message-ID: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
Subject: [PATCH v2 0/5] ASoC: don't use original dummy dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Dec 2023 05:09:25 +0000
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10094:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b078dc-c388-46e7-ab18-08dc0050abcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OL37NtETg5MnKRtIIb0mpQ6TcdGl6CzV5XhYc+Ov7efRFY6EWJCmflVP1EEekcqusR0H+bKTtBC9ztbyFQgDfJ9Xal7IRpnIxZ4X+CKRDuo5Qm/MyCHz8a3L2FOlVkSHVGlbfUacizfJ+j6V3rloOXN24YgwGy4chyb1CFaEbRcd3wHwbJgdTTCQrvRN3HlPR2BoKXcp0exGbsHxZg5Cl9WCkGGdlN87A8YGtXviOAJY/WBTF9gpq/kDI+Eycp4+TKr8WX/cICouzb473CBOcPE4V3Tqe6W6ubM61MvuhaOMLUiW9FpRAcYdiCwaYsRphOAusYZC+9nNw3xU5CUIxQk9nJDC6HZDTP3iWqQy13Cqh/UP5xKDH/eoZ9WdtIy1/UA549E8NJvfaKztSyBOHf574Nudy4sd0vGKon6EQ8apKo1baHSvaAfp2AhUJBE+9DoxV2KEYNPYejzRo5IQ1gDLGl0BH+lIXibQIXlBCcETGoVYao/3JX8V5Q0s56/5suTYc35P17h/aL+0DYMk2+6Z11g2pgqnCB2xellz9L4YGfrGuNV/H6yUVlnQWa3tJNvmnEFdF23d+rzsJL3qTeHPjLfQaWyNEzYcgVTasYwV7ogYSldsn7plSfz7yVCE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66556008)(36756003)(66946007)(110136005)(66476007)(54906003)(316002)(2616005)(26005)(6512007)(6506007)(478600001)(38350700005)(41300700001)(6486002)(921008)(8676002)(7416002)(8936002)(5660300002)(2906002)(52116002)(86362001)(38100700002)(4326008)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IruY66f99qEnplAi92z+C8BbR7/A7EI/8cX6Rj3scuzruU9giOBdhSkddeok?=
 =?us-ascii?Q?6RoA1GOmGINc2ov7PQrP8atklB2UjM0JlGY1CpsDRECvZ3BG3jD2MHV+u2nF?=
 =?us-ascii?Q?3ZnGUdPhvINg7qdwh2N16ivvSba9JLKHA6v37Y0LdFvrly0eVxDowlQSrnOc?=
 =?us-ascii?Q?Zb0pN8tje+fqQ1IOZJsBwY0orI2bF6UmzEXs7kvB8ZF5dRd1CwAXv5BbFwGW?=
 =?us-ascii?Q?rpDbJSYANxzCABunskqGiIZ2rsb1oeeActu2OZ5JiDyABHYQtNadmWmfov0j?=
 =?us-ascii?Q?qoV6wpQqXGxDfq3P/0igW18Y65bBspZIthglkmu0rNTaNca6+HCvzjP6X5i8?=
 =?us-ascii?Q?ZAcT/OWgRRUtLLi4hYd9CKZwYRgQySEqdwJ7g3oMU8HXJGfDpwU3lPMVxtRg?=
 =?us-ascii?Q?+rOhC67Gsb2xrwOKQ0uxdQDbVmWdTFRsh1am7fXAjPVn7h0ijS0Z0Fso04lQ?=
 =?us-ascii?Q?Ecqa6wiaqjeFkd9PP0F1P9eDdAFVtur1u5j75VXqyY+RSyH1NRTNvwX9mXn7?=
 =?us-ascii?Q?me4up8lwMmrtPlFysUMm2GMdR6msuzd5Z4j8t3uW8rjo2qz6twjlX7H6JjPs?=
 =?us-ascii?Q?Qq8TgP0UgRW6RJc1cb6y7HOOgz2jFK3MjW2U9j5uHNCnsLDnF+d3ieOjcZm3?=
 =?us-ascii?Q?UkkUE2vgExxOET6KJMvcf+8EuMLPPz/i4XShab7AhEECXC5v2W7XIv2S8AHn?=
 =?us-ascii?Q?nR9bfOosg4BeZ+m5wSqkLG/YkyjwBmKdGn7bfJ2kXOAyUjbRIaL4rzN4rEqb?=
 =?us-ascii?Q?1qLkePSMAieBQLc2LCewF9Xlz8AL6mkZrAknou0qf7eqSZoTLbVs+2n23x1j?=
 =?us-ascii?Q?cTW9mMbDjqPTwjWdX+D4WSpHbAkVsn5nzS5qAf7gxOxJxYhx/zfz3lY/UOPO?=
 =?us-ascii?Q?nog4LAinjipZw49kYAvrxr3wEfhYQZWkKS8eVnYnOVu0gKTM7ApvZuLZpbjA?=
 =?us-ascii?Q?FzHUuTlHmNIUhcU9p1z52K33u3Q3ICiBINYrZ8AI4hMREObMOUYDsRllDYjC?=
 =?us-ascii?Q?BLc52LpaSI/VOHP1i6uQNRBMiBkgrlbUcqeYIkPnvAUMZxrA9/5eo/jur8tL?=
 =?us-ascii?Q?o/PQ6GzhIG4cHMVnmuNDfd/39PRVeWVP0zgUtmuy6SeYJVM9EXdx384v4WU6?=
 =?us-ascii?Q?/fbWD2iNi0SmBIkXrfKkcAxW3vmceHmaO7/GxqTnqwWsbtDt4M8wpVCGiSGc?=
 =?us-ascii?Q?xV74ya1LVuND/5FZbPCu9G4QqjSrndY19tMCkTfHC9MAIPpgoZ2eqIb0tuCJ?=
 =?us-ascii?Q?2n8GW7PnLbptyjI/RrTppyTrGRk51EiNgcOGgxHjQcpFMW8ITVXpyK8pvQCZ?=
 =?us-ascii?Q?0mUBaBUFRPa2C/VgjrIqvgjr9eUaKZqvqRcVYLQhImLm61Yc3rVsXeBNDqUA?=
 =?us-ascii?Q?BGFPicKB5wdKTuiRovAP/ZwwlaCZqKa2FcreWJflfEk3qK7pLAuhHFlF+NO8?=
 =?us-ascii?Q?16Uyz54scoN7FdQURJjCkBrr41UzJ2ZKRA5pQ6StEgcWNKRZwGRgKC0nUtbs?=
 =?us-ascii?Q?scCYv2U9HPB9nEHidjYRPZ1QC51+oNgEiFX9RqfNyGMww9Tcp4Q5Viy05Ghp?=
 =?us-ascii?Q?XBrUhNhhoR0vxLaEYqNSel9t5zJIDiKDOhKtekZAE6I46Y75tFoFyeQqzCUt?=
 =?us-ascii?Q?1u7S5NxRZ4aJQi6KCAk0lEU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4b078dc-c388-46e7-ab18-08dc0050abcb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 05:09:26.0668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AeefBbDc0MS0drWGm7nsndB/0e2j9dsnFkdJ5CXhbHWi4q+vMj7zyxuK1OvkRjlt+90labd6sseZ1fW9YqwOLo3A6PeG2KQ5ZnN2RK78PWRifP+Qimp/zn9836GjBK3D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10094
Message-ID-Hash: JFQYZWAJ2PTCPCYTL44HJML355W4OLCU
X-Message-ID-Hash: JFQYZWAJ2PTCPCYTL44HJML355W4OLCU
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFQYZWAJ2PTCPCYTL44HJML355W4OLCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, and each driver owner

This v2 patch-set try to not use original dummy dlc.

"Empty" dlc might be used on Platform, but "dummy" dlc is not needed
for it. [PATCH 1/5][PATCH 2/5] removes "dummy" dlc from Platform.

Now ASoC have common dummy dlc (= snd_soc_dummy_dlc).
[PATCH 3/5][PATCH 4/5] will use it instead of original dummy dlc.

Many drivers are using below macro

	SND_SOC_DAILINK_DEFS(link,
		     DAILINK_COMP_ARRAY(COMP_CPU(...)),
(X)		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
		     DAILINK_COMP_ARRAY(COMP_EMPTY()));

But (X) part will create original dummy dlc.
[PATCH 5/5] will try not to create original dummy dlc, and replace
it to common dummy dlc.

v1 -> v2
	- Do nothing for Platform on snd_soc_fill_dummy_dai()

Kuninori Morimoto (5):
  ASoC: fsl: fsl-asoc-card: don't need DUMMY Platform
  ASoC: samsung: odroid: don't need DUMMY Platform
  ASoC: intel: hdaudio.c: use snd_soc_dummy_dlc
  ASoC: sof: use snd_soc_dummy_dlc
  ASoC: soc.h: don't create dummy Component via COMP_DUMMY()

 include/sound/soc.h                  |  2 +-
 sound/soc/fsl/fsl-asoc-card.c        |  3 +--
 sound/soc/intel/avs/boards/hdaudio.c |  6 ++----
 sound/soc/samsung/odroid.c           |  3 +--
 sound/soc/soc-core.c                 | 24 ++++++++++++++++++++++++
 sound/soc/sof/sof-client-probes.c    |  4 +---
 6 files changed, 30 insertions(+), 12 deletions(-)

-- 
2.25.1

