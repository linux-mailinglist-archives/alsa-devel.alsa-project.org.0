Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E0796934E
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 07:46:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7DB6DEE;
	Tue,  3 Sep 2024 07:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7DB6DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725342362;
	bh=lXc83kZbxoWed7K2lyiLusHA3uEKPVrHCt3Nx8gZCAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=inQJ86IFVm5KLhv4c/sfPRhpNsSf1hpHyxNVywyok2SX84Cq8j0SGUjxMIW1UPDiX
	 nuyAp6/qowrgu40rqhY4s7ENsPCPJRkmBBRP2N1RsBxgLa/ZDihfI0Fd/JxxkdH0Fz
	 vBszw/IXnT2yXdbXYxp4E8nYpR+XhVUsMCrkzWbI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4D1DF80601; Tue,  3 Sep 2024 07:45:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48483F80603;
	Tue,  3 Sep 2024 07:45:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7124DF805C2; Tue,  3 Sep 2024 07:45:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0751BF80107
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 07:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0751BF80107
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+hDKGjWI4Ar72VIZdYmMh4/Rp2brV02L/bfbC76ig6RIo+PweA/tpn+oXRUi1wAvNAsJzaQm7HMNnwCF6UjPoml1IX3ryW2RNacFQXzwN541/YTMdRz7sms+H7wcCuyWtp/tqpK8R/2UBSA7rSVfpzvyAheTkbW0WsLcTpJs7rzsGosCyIFjothw5G2ftngQTTLK72C32ZDxrrZqLUMMLjjSrBEMKb0Pe1MbidIJUlpC8koHOnKPtEl56adpkh+acnJUXvRJukfRjJ81Qev7Fnncz/uGrxDvV5SE4KXC44gXQASbisO35rTQLbIRxhD+48Vj1EPyQMjR7OEG2PNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEOeg1prSdUj5W7WAI4dFWYypiT0WZAoRHJ0/Y6Fliw=;
 b=vlX0LGJJjDAU/5VBePxzf9MwcwRWeJtHhbhpZ6+stsk4Zy4SFb8maok2XWX6aLi2HkvZpI5ppa16EsCjSDOGI7CN1KgpBVa+BCF6+roqgJR+vTnToBG96TxkaZmiVrxgyAItKOpUXtLoYC3ZdCeYuBv5KSDCe/CBDP1p1dkMrW2FDxKonREvK1qiIbT1R+M3jcdUft+jF7RO7hRqZcow3KmGlEjQPXNlSBgSyEXX4Hjx+MEG/ROreeCQHukEiGadDlimBnp8BX0+eNY74I9xcQCLkcm7t/kpMn0DDRQcRKOxsK+hvUsi0imS6dHx5/IyQcUrn14WVqa4qZ3hTRsbzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE1P216MB1543.KORP216.PROD.OUTLOOK.COM (2603:1096:101:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 05:44:48 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 05:44:48 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	application@irondevice.com,
	Kiseok Jo <kiseok.jo@irondevice.com>
Subject: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Date: Tue,  3 Sep 2024 14:44:33 +0900
Message-Id: <20240903054435.2659-2-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903054435.2659-1-kiseok.jo@irondevice.com>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0056.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::7) To SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:14c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2337:EE_|SE1P216MB1543:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cceecbe-0570-477a-00fc-08dccbdb85f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9A372SuwYznzwdAfakqjNBFJcdVqLUTM168yY3mC77U+mqDEOPEJUOJctkSp?=
 =?us-ascii?Q?Pzd6gfHOeIKS87peEPPaUbUEQIyn0eHmg5uUbqY5BJIyKHUkx+Cm/tO2rgLU?=
 =?us-ascii?Q?9SczuCYv04DpHfhljy7PYFvgP0oXjjYEMzLqwlJ6gRIjHhO8YTvgbyChAM6e?=
 =?us-ascii?Q?1cjawFyZJTC+pETgpQj/oTDItd9kOIb9uALXDfGxiv9H9UTgeKQJSOLqptbt?=
 =?us-ascii?Q?1PTOJy2FtovFvDc5MzYuic0cwxceVyx2nC1rInmIHVoIAhJF/lCutlrKmMti?=
 =?us-ascii?Q?FNrYeNpTTZvKZTuXt/oh2v3+WtqvCQBv06VHqeeBvBm51+KevkyWM/ZV/xk4?=
 =?us-ascii?Q?/5s4WCBl4CwiGYnTJHAOSJ0vsEXQ+8xfHG7BRKHcbD1Xs88xxsFXL0eKvLTl?=
 =?us-ascii?Q?C3ZKO3XIQ6SrChnuIs6GwtZzuOMvsFZ/gIvqRdHaJLGXbno9meoU6QOWry2a?=
 =?us-ascii?Q?8yEQlSyzCuHHt7B5ufVfVFQFoxFTsIhzAa4weDRzovhLh8rL5PwbO2yfKyfq?=
 =?us-ascii?Q?mF1SY7d0VtSpilHT8TakbKO9IxI/Wbq0PIwLda9xA8ge9jS/FMhVWMUO4aw/?=
 =?us-ascii?Q?fOYusXKrwPKp+piT84fMajDrmXv+m2diBWaPKEGbnB7o1JoPRv3woh5xh0x2?=
 =?us-ascii?Q?KMXoJcZIy9zV+LnIBsgcm4fj1FUnx+1NLnmI4GnsTs1xis8EBt5i2+BaCaaD?=
 =?us-ascii?Q?9NBXhHF7Q93/xQWaiBIeYyymCt7p0S7cXsQ2MspkibT6U9Qp1ZAi0CFoUfrG?=
 =?us-ascii?Q?UwiVolBYaDNUpNHRfU4VDf4QOB/h9x19AkHMFy20hlwTWS1K9bnbAvAp4sUg?=
 =?us-ascii?Q?oCSnQnvZ/j8WG/jNvthai9VmQjyYmb5prJt4xzrxYwVFb+uZQ66XQE04Yx8j?=
 =?us-ascii?Q?mGbMO1YuklGTFxHCpipdvFNfJn9iji2MRn+YEBtlbSHR05dBbdkVo/0mhik9?=
 =?us-ascii?Q?MfwADbZHguG4N094cVGEdbx0R60di0IC4AHBrPDbxVVsrS+/JAwmAEXu9tpx?=
 =?us-ascii?Q?+LhKPdXEmYoZWMtJr5f+ERoWVGPFR4qwJAXsJAHRKanRjAk5fFAUShf/Ztg9?=
 =?us-ascii?Q?6lHH5J0livz4OWJ0eFDfd0jnQqdMEUzQwOCFlpK+9uNevY78xduuGmvggXqO?=
 =?us-ascii?Q?dHmaV2iA8Jy7SmJsvKOIaDsipYEJSRKZYI2VziKZVYrf7Ypmax961zzYQSZM?=
 =?us-ascii?Q?MOWo8Tb4270FwesjW2/ZyfNGq3N0OpOHWKxaROd9MVElILCNUQMboG4mHmde?=
 =?us-ascii?Q?CNGLSbtwnnkHdGfwdxP62xPzsJGH2V0iSQA1FaOs3NRM4nYkKw0l+HCl8xd+?=
 =?us-ascii?Q?kwJXyH8NPIzBwOyXcIGQ2787P4VFLgwdG+Z+JXzwK6ILsqvCumGt8arV2652?=
 =?us-ascii?Q?bHFqcy/5tsvfrlVKT7nbyOCLwcC+U3HYB530KkWIIcsZOuqVMQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U+WOcj7pGPx4KDN2AJtvBcPDkMC6l6L+ghAJgVrwLnTT5FBvmhCAr4sYxhPL?=
 =?us-ascii?Q?O1leT/59ca4NE0TI8cGiUjgsLKBvP2vs1Qj25F73T/4hS3iP16/2t0973iBZ?=
 =?us-ascii?Q?FLFDwmbA+3Z9b4ur+SuxVnd/B0HKjlPxw9jrvousuF00Z21x3b1y4f3hpK2B?=
 =?us-ascii?Q?eY31r4JYAl9XdWgXfJQStGsuTkk9WquR07aDDv/xCW+fHf3vFAnc0PbrCuqi?=
 =?us-ascii?Q?pH+urztlgqkUdtSIuFZxc90yBeikyUY1XToUWWeV3tR4mYBHoIi8tZyGsIiJ?=
 =?us-ascii?Q?U/HgTyU0xVctRvY+3/2X1Xx1YwudSc4LZGkSW3xnoXgzOaqfTf5L4S3KQomo?=
 =?us-ascii?Q?QqHiBUjw7IwFrAZqf+YfonECuheloJSoSUAwe+4pcnN441u5JJX4ARxon9Ev?=
 =?us-ascii?Q?7As4zaYG503arRLBXb8UdIo8uZcfnAjEoLKhpFK0xfPt6e3ZpmVR7KxAKlUw?=
 =?us-ascii?Q?HtHt/C2xEfYvwr25NC/pRb6vyQlraBm8sP0cagkUgLGWSJvJbtVo4GDc6PYd?=
 =?us-ascii?Q?Hip8TZpOdpFzf1G8ID7VoqxYeXkM5QqpfieyC4aiSzmtA7LzF1UmY0yvFMo3?=
 =?us-ascii?Q?9JYqFutiJUczbgkpx9mhSf58Hlrx2PujsZsKENUsxWZczaB9mN5PM2TAiCp7?=
 =?us-ascii?Q?gJoAwAeZmG1L4xH3GsE8IObz95nO4Lo2xMni4gm2/GdlT9bj1GNyW7F1Hp0h?=
 =?us-ascii?Q?HkY4XFZXRnxRQWw6g3iV8rreSnYXZuFEgAXwJWKRVPyc24I1nHziIm3rtUZI?=
 =?us-ascii?Q?bUT6/VaOXRi7xr7but9t9fHMpmcUUmddU9dqnUHEVemLZj4dj7r6TXCfO+Ps?=
 =?us-ascii?Q?u9qIJiX/aY+u3eqsY+GmhzMWGCEqKQD3EVncC3/WvGCd7EV2+aiaW1/nFQwC?=
 =?us-ascii?Q?MHOfWv0WK0NfmUmoP7srGcZxf7DDAhg/uKdhAe5nYscTiqCU6jVeDGgushdH?=
 =?us-ascii?Q?kRje67ArFc6SYSJY3ZMS6MU2fCrmG97x4pTG1aXMNv7vhtLZOiyxUTWz8rPd?=
 =?us-ascii?Q?Mq9zv1RxxUr77znqn1LqjkaAjU5oR205iUPqHb+jXJGmLeNWEZqINeeG3hKI?=
 =?us-ascii?Q?GgHsysrlvpci3Iuf81Sf3E+oaJarXoOGhzzlkWvKNsAu85bWvmULj0CuFXRa?=
 =?us-ascii?Q?irPkrzltu6Ny5H98iLtaecrFngZ0iKxZ3ndKm3FCsgQ8UEHQSP2eB/N9b7vv?=
 =?us-ascii?Q?DwzDliw1ifngbZpVwV9fmMm/30qPKOcM1X0HDHSy9+bfyH7+vBGUGSirjch3?=
 =?us-ascii?Q?U7mj7Z7nK9BdfpO1i0YVP8g6yMKu33d3hq0UMla1U6jIZBy11DfCuuddr5/V?=
 =?us-ascii?Q?v7g7H/MnHcHQYLyAipUXGttV7eEny/Np1kelYFn9WaaBlNTdk4DUdM7OYjU/?=
 =?us-ascii?Q?t3qzBg16aCC0+awEYxUG5dEHjtD7mX8/YwvKjZnztGZw23mydmWKhCT886KE?=
 =?us-ascii?Q?Hmtm4a2un7nKxJWfYb++GGK2N/5C/xUxZbAtR+OXGH8M1tc+kB38dZvVW2dT?=
 =?us-ascii?Q?jCf+M6hnuvYXhWuikkhvST79QonFnHLBHU7DQBmNIBK2WZ2NuACcOD3PjvWW?=
 =?us-ascii?Q?1VnjO1UqbAa9ff3ESy7smxeakbjs/aEhhfOiPEvS?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9cceecbe-0570-477a-00fc-08dccbdb85f7
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 05:44:48.7989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BJpDV+xXdttRQank7yOpC0PwheFPILmFXttUfJOm7OT6H97S0+vvcu2ocwmj8onozWI7EkPTmg26wqJit4ns57EOvtbwri9091ob1N4i8Yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1543
Message-ID-Hash: LWPDUNZL2X7FLLNNFWQU4M6ODPDQBWRM
X-Message-ID-Hash: LWPDUNZL2X7FLLNNFWQU4M6ODPDQBWRM
X-MailFrom: kiseok.jo@irondevice.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWPDUNZL2X7FLLNNFWQU4M6ODPDQBWRM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 sound/soc/codecs/Kconfig   |    8 +
 sound/soc/codecs/Makefile  |    2 +
 sound/soc/codecs/sma1307.c | 2191 ++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/sma1307.h |  454 ++++++++
 4 files changed, 2655 insertions(+)
 create mode 100644 sound/soc/codecs/sma1307.c
 create mode 100644 sound/soc/codecs/sma1307.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index b5e6d0a98..b3e75933f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -235,6 +235,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_SIMPLE_AMPLIFIER
 	imply SND_SOC_SIMPLE_MUX
 	imply SND_SOC_SMA1303
+	imply SND_SOC_SMA1307
 	imply SND_SOC_SPDIF
 	imply SND_SOC_SRC4XXX_I2C
 	imply SND_SOC_SSM2305
@@ -1835,6 +1836,13 @@ config SND_SOC_SMA1303
 	help
 	  Enable support for Iron Device SMA1303 Boosted Class-D amplifier
 
+config SND_SOC_SMA1307
+	tristate "Iron Device SMA1307 Audio Amplifier"
+	depends on I2C
+	help
+	  Enable support for Iron Device SMA1307 boosted digital speaker
+	  amplifier with feedback-loop
+
 config SND_SOC_SPDIF
 	tristate "S/PDIF CODEC"
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 622e360f0..5c584eeeb 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -270,6 +270,7 @@ snd-soc-sigmadsp-i2c-y := sigmadsp-i2c.o
 snd-soc-sigmadsp-regmap-y := sigmadsp-regmap.o
 snd-soc-si476x-y := si476x.o
 snd-soc-sma1303-y := sma1303.o
+snd-soc-sma1307-y := sma1307.o
 snd-soc-spdif-tx-y := spdif_transmitter.o
 snd-soc-spdif-rx-y := spdif_receiver.o
 snd-soc-src4xxx-y := src4xxx.o
@@ -670,6 +671,7 @@ obj-$(CONFIG_SND_SOC_SIGMADSP_I2C)	+= snd-soc-sigmadsp-i2c.o
 obj-$(CONFIG_SND_SOC_SIGMADSP_REGMAP)	+= snd-soc-sigmadsp-regmap.o
 obj-$(CONFIG_SND_SOC_SI476X)	+= snd-soc-si476x.o
 obj-$(CONFIG_SND_SOC_SMA1303)	+= snd-soc-sma1303.o
+obj-$(CONFIG_SND_SOC_SMA1307)	+= snd-soc-sma1307.o
 obj-$(CONFIG_SND_SOC_SPDIF)	+= snd-soc-spdif-rx.o snd-soc-spdif-tx.o
 obj-$(CONFIG_SND_SOC_SRC4XXX)	+= snd-soc-src4xxx.o
 obj-$(CONFIG_SND_SOC_SRC4XXX_I2C)	+= snd-soc-src4xxx-i2c.o
diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
new file mode 100644
index 000000000..12d787987
--- /dev/null
+++ b/sound/soc/codecs/sma1307.c
@@ -0,0 +1,2191 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// sma1307.c -- sma1307 ALSA SoC Audio driver
+//
+// Copyright 2024 Iron Device Corporation
+//
+// Auther: Gyuhwa Park <gyuwha.park@irondevice.com>
+// Auther: Kiseok Jo <kiseok.jo@irondevice.com>
+
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/of_gpio.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include <sound/tlv.h>
+#include "sma1307.h"
+
+#define CHECK_PERIOD_TIME 1	/* sec per HZ */
+#define PLL_MATCH(_input_clk_name, _output_clk_name, _input_clk,\
+		_post_n, _n, _vco,  _p_cp)\
+{\
+	.input_clk_name		= _input_clk_name,\
+	.output_clk_name	= _output_clk_name,\
+	.input_clk		= _input_clk,\
+	.post_n			= _post_n,\
+	.n			= _n,\
+	.vco			= _vco,\
+	.p_cp			= _p_cp,\
+}
+
+static const char *setting_file = "sma1307_setting.bin";
+#define SMA1307_SETTING_CHECKSUM 0x100000
+
+/* PLL clock setting Table */
+struct sma1307_pll_match {
+	char *input_clk_name;
+	char *output_clk_name;
+	unsigned int input_clk;
+	unsigned int post_n;
+	unsigned int n;
+	unsigned int vco;
+	unsigned int p_cp;
+};
+
+struct sma1307_priv {
+	bool force_mute_status;
+	bool reset;
+	bool sw_ot1_prot;
+	char *name;
+	enum sma1307_mode amp_mode;
+	int binary_mode;
+	int dapm_aif_in;
+	int dapm_aif_out0;
+	int dapm_aif_out1;
+	int dapm_amp_en;
+	int dapm_sdo_en;
+	int dapm_sdo_setting;
+	int num_of_pll_matches;
+	int retry_cnt;
+	long check_fault_period;
+	long check_fault_status;
+	struct attribute_group *attr_grp;
+	struct delayed_work check_fault_work;
+	struct device *dev;
+	struct kobject *kobj;
+	struct mutex default_lock;
+	struct regmap *regmap;
+	struct sma1307_pll_match *pll_matches;
+	struct sma1307_setting_file set;
+	unsigned int cur_vol;
+	unsigned int format;
+	unsigned int frame_size;
+	unsigned int init_vol;
+	unsigned int last_bclk;
+	unsigned int otp_trm2;
+	unsigned int otp_trm3;
+	unsigned int rev_num;
+	unsigned int sys_clk_id;
+	unsigned int tdm_slot0_rx;
+	unsigned int tdm_slot1_rx;
+	unsigned int tdm_slot0_tx;
+	unsigned int tdm_slot1_tx;
+	unsigned int tsdw_cnt;
+};
+
+static struct sma1307_pll_match sma1307_pll_matches[] = {
+	/* in_clk_name, out_clk_name, input_clk post_n, n, vco, p_cp */
+	PLL_MATCH("1.411MHz", "24.554MHz",
+		  1411200, 0x06, 0xD1, 0x88, 0x00),
+	PLL_MATCH("1.536MHz", "24.576MHz",
+		  1536000, 0x06, 0xC0, 0x88, 0x00),
+	PLL_MATCH("2.822MHz", "24.554MHz",
+		  2822400, 0x06, 0xD1, 0x88, 0x04),
+	PLL_MATCH("3.072MHz", "24.576MHz",
+		  3072000, 0x06, 0x60, 0x88, 0x00),
+	PLL_MATCH("6.144MHz", "24.576MHz",
+		  6144000, 0x06, 0x60, 0x88, 0x04),
+	PLL_MATCH("12.288MHz", "24.576MHz",
+		  12288000, 0x06, 0x60, 0x88, 0x08),
+	PLL_MATCH("19.2MHz", "24.48MHz",
+		  19200000, 0x06, 0x7B, 0x88, 0x0C),
+	PLL_MATCH("24.576MHz", "24.576MHz",
+		  24576000, 0x06, 0x60, 0x88, 0x0C),
+};
+
+static struct snd_soc_component *sma1307_amp_component;
+
+static void sma1307_startup(struct snd_soc_component *);
+static void sma1307_shutdown(struct snd_soc_component *);
+static void sma1307_reset(struct snd_soc_component *);
+static void sma1307_set_binary(struct snd_soc_component *);
+static void sma1307_set_default(struct snd_soc_component *);
+
+/* Initial register value - 6.0W SPK (8ohm load)  */
+static const struct reg_default sma1307_reg_def[] = {
+	{ 0x00, 0x80 },
+	{ 0x01, 0x00 },
+	{ 0x02, 0x52 },
+	{ 0x03, 0x4C },
+	{ 0x04, 0x47 },
+	{ 0x05, 0x42 },
+	{ 0x06, 0x40 },
+	{ 0x07, 0x40 },
+	{ 0x08, 0x3C },
+	{ 0x09, 0x2F },
+	{ 0x0A, 0x32 },
+	{ 0x0B, 0x50 },
+	{ 0x0C, 0x8C },
+	{ 0x0D, 0x00 },
+	{ 0x0E, 0x3F },
+	{ 0x0F, 0x00 },
+	{ 0x10, 0x00 },
+	{ 0x11, 0x00 },
+	{ 0x12, 0x00 },
+	{ 0x13, 0x09 },
+	{ 0x14, 0x12 },
+	{ 0x1C, 0x00 },
+	{ 0x1D, 0x85 },
+	{ 0x1E, 0xA1 },
+	{ 0x1F, 0x67 },
+	{ 0x22, 0x00 },
+	{ 0x23, 0x1F },
+	{ 0x24, 0x7A },
+	{ 0x25, 0x00 },
+	{ 0x26, 0xFF },
+	{ 0x27, 0x39 },
+	{ 0x28, 0x54 },
+	{ 0x29, 0x92 },
+	{ 0x2A, 0xB0 },
+	{ 0x2B, 0xED },
+	{ 0x2C, 0xED },
+	{ 0x2D, 0xFF },
+	{ 0x2E, 0xFF },
+	{ 0x2F, 0xFF },
+	{ 0x30, 0xFF },
+	{ 0x31, 0xFF },
+	{ 0x32, 0xFF },
+	{ 0x34, 0x01 },
+	{ 0x35, 0x17 },
+	{ 0x36, 0x92 },
+	{ 0x37, 0x00 },
+	{ 0x38, 0x01 },
+	{ 0x39, 0x10 },
+	{ 0x3E, 0x01 },
+	{ 0x3F, 0x08 },
+	{ 0x8B, 0x05 },
+	{ 0x8C, 0x50 },
+	{ 0x8D, 0x80 },
+	{ 0x8E, 0x10 },
+	{ 0x8F, 0x02 },
+	{ 0x90, 0x02 },
+	{ 0x91, 0x83 },
+	{ 0x92, 0xC0 },
+	{ 0x93, 0x00 },
+	{ 0x94, 0xA4 },
+	{ 0x95, 0x74 },
+	{ 0x96, 0x57 },
+	{ 0xA2, 0xCC },
+	{ 0xA3, 0x28 },
+	{ 0xA4, 0x40 },
+	{ 0xA5, 0x01 },
+	{ 0xA6, 0x41 },
+	{ 0xA7, 0x08 },
+	{ 0xA8, 0x04 },
+	{ 0xA9, 0x27 },
+	{ 0xAA, 0x10 },
+	{ 0xAB, 0x10 },
+	{ 0xAC, 0x10 },
+	{ 0xAD, 0x0F },
+	{ 0xAE, 0xCD },
+	{ 0xAF, 0x70 },
+	{ 0xB0, 0x03 },
+	{ 0xB1, 0xEF },
+	{ 0xB2, 0x03 },
+	{ 0xB3, 0xEF },
+	{ 0xB4, 0xF3 },
+	{ 0xB5, 0x3D },
+};
+
+static bool sma1307_readable_register(struct device *dev, unsigned int reg)
+{
+	if (reg > SMA1307_FF_DEVICE_INDEX)
+		return false;
+
+	switch (reg) {
+	case SMA1307_00_SYSTEM_CTRL ... SMA1307_1F_TONE_FINE_VOLUME:
+	case SMA1307_22_COMP_HYS_SEL ... SMA1307_32_BROWN_OUT_PROT19:
+	case SMA1307_34_OCP_SPK ... SMA1307_39_PMT_NZ_VAL:
+	case SMA1307_3B_TEST1 ... SMA1307_3F_ATEST2:
+	case SMA1307_8B_PLL_POST_N ... SMA1307_9A_OTP_TRM3:
+	case SMA1307_A0_PAD_CTRL0 ... SMA1307_BE_MCBS_CTRL2:
+	case SMA1307_F5_READY_FOR_V_SAR:
+	case SMA1307_F7_READY_FOR_T_SAR ... SMA1307_FF_DEVICE_INDEX:
+		break;
+	default:
+		return false;
+	}
+	return true;
+}
+
+static bool sma1307_writeable_register(struct device *dev, unsigned int reg)
+{
+	if (reg > SMA1307_FF_DEVICE_INDEX)
+		return false;
+
+	switch (reg) {
+	case SMA1307_00_SYSTEM_CTRL ... SMA1307_1F_TONE_FINE_VOLUME:
+	case SMA1307_22_COMP_HYS_SEL ... SMA1307_32_BROWN_OUT_PROT19:
+	case SMA1307_34_OCP_SPK ... SMA1307_39_PMT_NZ_VAL:
+	case SMA1307_3B_TEST1 ... SMA1307_3F_ATEST2:
+	case SMA1307_8B_PLL_POST_N ... SMA1307_9A_OTP_TRM3:
+	case SMA1307_A0_PAD_CTRL0 ... SMA1307_BE_MCBS_CTRL2:
+		break;
+	default:
+		return false;
+	}
+	return true;
+}
+
+static bool sma1307_volatile_register(struct device *dev, unsigned int reg)
+{
+	if (reg > SMA1307_FF_DEVICE_INDEX)
+		return false;
+
+	switch (reg) {
+	case SMA1307_F8_STATUS_T1 ... SMA1307_FF_DEVICE_INDEX:
+		break;
+	default:
+		return false;
+	}
+	return true;
+}
+
+/* DB scale conversion of speaker volume */
+static const DECLARE_TLV_DB_SCALE(sma1307_spk_tlv, -6000, 50, 0);
+
+static int sma1307_regmap_write(struct sma1307_priv *sma1307,
+				unsigned int reg, unsigned int val)
+{
+	int ret = 0;
+	int cnt = sma1307->retry_cnt;
+
+	while (cnt--) {
+		ret = regmap_write(sma1307->regmap, reg, val);
+		if (ret == 0)
+			break;
+	}
+
+	return ret;
+}
+
+static int sma1307_regmap_update_bits(struct sma1307_priv *sma1307,
+				      unsigned int reg, unsigned int mask,
+				      unsigned int val)
+{
+	int ret = 0;
+	int cnt = sma1307->retry_cnt;
+
+	while (cnt--) {
+		ret = regmap_update_bits(sma1307->regmap, reg, mask, val);
+		if (ret == 0)
+			break;
+	}
+
+	return ret;
+}
+
+static int sma1307_regmap_read(struct sma1307_priv *sma1307,
+			       unsigned int reg, unsigned int *val)
+{
+	int ret = 0;
+	int cnt = sma1307->retry_cnt;
+
+	while (cnt--) {
+		ret = regmap_read(sma1307->regmap, reg, val);
+		if (ret == 0)
+			break;
+	}
+
+	return ret;
+}
+
+static const char *const sma1307_aif_in_source_text[] = {
+	"Mono", "Left", "Right"
+};
+
+static const char *const sma1307_sdo_setting_text[] = {
+	"Data_One_48k", "Data_Two_48k", "Data_Two_24k",
+	"Clk_PLL", "Clk_OSC"
+};
+
+static const char *const sma1307_aif_out_source_text[] = {
+	"Disable", "After_FmtC", "After_Mixer", "After_DSP",
+	"Vrms2_Avg", "Battery", "Temperature", "After_Delay"
+};
+
+static const char *const sma1307_tdm_slot_text[] = {
+	"Slot0", "Slot1", "Slot2", "Slot3",
+	"Slot4", "Slot5", "Slot6", "Slot7"
+};
+
+static const char *const sma1307_binary_mode_text[] = {
+	"Mode0", "Mode1", "Mode2", "Mode3", "Mode4"
+};
+
+static const struct soc_enum sma1307_aif_in_source_enum =
+SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1307_aif_in_source_text),
+		    sma1307_aif_in_source_text);
+static const struct soc_enum sma1307_sdo_setting_enum =
+SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1307_sdo_setting_text),
+		    sma1307_sdo_setting_text);
+static const struct soc_enum sma1307_aif_out_source_enum =
+SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1307_aif_out_source_text),
+		    sma1307_aif_out_source_text);
+static const struct soc_enum sma1307_tdm_slot_enum =
+SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1307_tdm_slot_text),
+		    sma1307_tdm_slot_text);
+static const struct soc_enum sma1307_binary_mode_enum =
+SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1307_binary_mode_text),
+		    sma1307_binary_mode_text);
+
+static int sma1307_force_mute_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = (int)sma1307->force_mute_status;
+
+	return 0;
+}
+
+static int sma1307_force_mute_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	bool change = false, val = (bool)ucontrol->value.integer.value[0];
+
+	if (sma1307->force_mute_status == val)
+		change = false;
+	else {
+		change = true;
+		sma1307->force_mute_status = val;
+	}
+
+	return change;
+}
+
+static int sma1307_tdm_slot_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	int val1, val2;
+
+	sma1307_regmap_read(sma1307, SMA1307_A5_TDM1, &val1);
+	sma1307_regmap_read(sma1307, SMA1307_A6_TDM2, &val2);
+
+	if (!strcmp(kcontrol->id.name, SMA1307_TDM_RX0_POS_NAME)) {
+		ucontrol->value.integer.value[0]
+		    = (val1 & SMA1307_TDM_SLOT0_RX_POS_MASK) >> 3;
+		sma1307->tdm_slot0_rx = ucontrol->value.integer.value[0];
+	} else if (!strcmp(kcontrol->id.name, SMA1307_TDM_RX1_POS_NAME)) {
+		ucontrol->value.integer.value[0]
+		    = val1 & SMA1307_TDM_SLOT1_RX_POS_MASK;
+		sma1307->tdm_slot1_rx = ucontrol->value.integer.value[0];
+	} else if (!strcmp(kcontrol->id.name, SMA1307_TDM_TX0_POS_NAME)) {
+		ucontrol->value.integer.value[0]
+		    = (val2 & SMA1307_TDM_SLOT0_TX_POS_MASK) >> 3;
+		sma1307->tdm_slot0_tx = ucontrol->value.integer.value[0];
+	} else if (!strcmp(kcontrol->id.name, SMA1307_TDM_TX1_POS_NAME)) {
+		ucontrol->value.integer.value[0]
+		    = val2 & SMA1307_TDM_SLOT1_TX_POS_MASK;
+		sma1307->tdm_slot1_tx = ucontrol->value.integer.value[0];
+	} else {
+		dev_err(sma1307->dev, "%s: Invalid Control ID - %s\n",
+			__func__, kcontrol->id.name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sma1307_tdm_slot_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	int val = (int)ucontrol->value.integer.value[0];
+	bool change;
+
+	if (!strcmp(kcontrol->id.name, SMA1307_TDM_RX0_POS_NAME)) {
+		if (sma1307->tdm_slot0_rx == val)
+			change = false;
+		else {
+			change = true;
+			sma1307->tdm_slot0_rx = val;
+			sma1307_regmap_update_bits(sma1307, SMA1307_A5_TDM1,
+				SMA1307_TDM_SLOT0_RX_POS_MASK, val << 3);
+		}
+	} else if (!strcmp(kcontrol->id.name, SMA1307_TDM_RX1_POS_NAME)) {
+		if (sma1307->tdm_slot1_rx == val)
+			change = false;
+		else {
+			change = true;
+			sma1307->tdm_slot1_rx = val;
+			sma1307_regmap_update_bits(sma1307, SMA1307_A5_TDM1,
+				SMA1307_TDM_SLOT1_RX_POS_MASK, val);
+		}
+	} else if (!strcmp(kcontrol->id.name, SMA1307_TDM_TX0_POS_NAME)) {
+		if (sma1307->tdm_slot0_tx == val)
+			change = false;
+		else {
+			change = true;
+			sma1307->tdm_slot0_tx = val;
+			sma1307_regmap_update_bits(sma1307, SMA1307_A6_TDM2,
+				SMA1307_TDM_SLOT0_TX_POS_MASK, val << 3);
+		}
+	} else if (!strcmp(kcontrol->id.name, SMA1307_TDM_TX1_POS_NAME)) {
+		if (sma1307->tdm_slot1_tx == val)
+			change = false;
+		else {
+			change = true;
+			sma1307->tdm_slot1_tx = val;
+			sma1307_regmap_update_bits(sma1307, SMA1307_A6_TDM2,
+				SMA1307_TDM_SLOT1_TX_POS_MASK, val);
+		}
+	} else {
+		dev_err(sma1307->dev, "%s: Invalid Control ID - %s\n",
+			__func__, kcontrol->id.name);
+		return -EINVAL;
+	}
+
+	return change;
+}
+
+static int sma1307_sw_ot1_prot_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = (int)sma1307->sw_ot1_prot;
+
+	return 0;
+}
+
+static int sma1307_sw_ot1_prot_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	bool change = false, val = (bool)ucontrol->value.integer.value[0];
+
+	if (sma1307->sw_ot1_prot == val)
+		change = false;
+	else {
+		change = true;
+		sma1307->sw_ot1_prot = val;
+	}
+
+	return change;
+}
+
+static int sma1307_reset_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = (int)sma1307->reset;
+
+	return 0;
+}
+
+static int sma1307_reset_put(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	bool val = (bool)ucontrol->value.integer.value[0];
+
+	if (sma1307->reset == val)
+		return false;
+
+	sma1307->reset = val;
+	if (ucontrol->value.integer.value[0] != 0
+	    && ucontrol->value.integer.value[0] != 1) {
+		dev_err(sma1307->dev, "%s: Invalid value\n", __func__);
+		return false;
+	}
+	sma1307_regmap_update_bits(sma1307, SMA1307_00_SYSTEM_CTRL,
+				   SMA1307_RESET_MASK, SMA1307_RESET_ON);
+	sma1307_reset(component);
+
+	return true;
+}
+
+static int sma1307_binary_mode_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct sma1307_priv *sma1307 = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.enumerated.item[0] = (unsigned int)sma1307->binary_mode;
+
+	if (!sma1307->set.status) {
+		dev_warn(sma1307->dev,
+			 "%s: no information has been read, try reset control again\n",
+			 __func__);
+	}
+
+	return 0;
+}
+
+static int sma1307_binary_mode_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct sma1307_priv *sma1307 = snd_kcontrol_chip(kcontrol);
+	bool change = false;
+	int val = (int)ucontrol->value.enumerated.item[0];
+
+	if ((val < 0) || (val >= ARRAY_SIZE(sma1307_binary_mode_text))) {
+		dev_err(sma1307->dev, "%s: out of range\n", __func__);
+		return -EINVAL;
+	}
+
+	if (sma1307->binary_mode == val)
+		change = false;
+	else {
+		change = true;
+		sma1307->binary_mode = val;
+	}
+
+	if (!sma1307->set.status) {
+		dev_warn(sma1307->dev,
+			 "%s: no information has been read, try reset control again\n",
+			 __func__);
+	}
+
+	return change;
+}
+
+static void sma1307_startup(struct snd_soc_component *component)
+{
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	sma1307_regmap_update_bits(sma1307, SMA1307_A2_TOP_MAN1,
+				   SMA1307_PLL_MASK, SMA1307_PLL_ON);
+	sma1307_regmap_update_bits(sma1307, SMA1307_00_SYSTEM_CTRL,
+				   SMA1307_POWER_MASK, SMA1307_POWER_ON);
+
+	if (sma1307->amp_mode == SMA1307_MONO_MODE) {
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_10_SYSTEM_CTRL1,
+					   SMA1307_SPK_MODE_MASK,
+					   SMA1307_SPK_MONO);
+	} else {
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_10_SYSTEM_CTRL1,
+					   SMA1307_SPK_MODE_MASK,
+					   SMA1307_SPK_STEREO);
+	}
+
+	if (sma1307->check_fault_status) {
+		if (sma1307->check_fault_period > 0)
+			queue_delayed_work(system_freezable_wq,
+					   &sma1307->check_fault_work,
+					   sma1307->check_fault_period * HZ);
+		else
+			queue_delayed_work(system_freezable_wq,
+					   &sma1307->check_fault_work,
+					   CHECK_PERIOD_TIME * HZ);
+	}
+}
+
+static void sma1307_shutdown(struct snd_soc_component *component)
+{
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	/* for SMA1307A */
+	cancel_delayed_work_sync(&sma1307->check_fault_work);
+
+	sma1307_regmap_update_bits(sma1307, SMA1307_0E_MUTE_VOL_CTRL,
+				   SMA1307_SPK_MUTE_MASK, SMA1307_SPK_MUTE);
+	/* Need to wait time for mute slope */
+	msleep(55);
+
+	sma1307_regmap_update_bits(sma1307, SMA1307_10_SYSTEM_CTRL1,
+				   SMA1307_SPK_MODE_MASK, SMA1307_SPK_OFF);
+	sma1307_regmap_update_bits(sma1307, SMA1307_A2_TOP_MAN1,
+				   SMA1307_PLL_MASK, SMA1307_PLL_OFF);
+	sma1307_regmap_update_bits(sma1307, SMA1307_00_SYSTEM_CTRL,
+				   SMA1307_POWER_MASK, SMA1307_POWER_OFF);
+}
+
+static int sma1307_aif_in_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+	    snd_soc_dapm_to_component(w->dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	unsigned int mux = sma1307->dapm_aif_in;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		switch (mux) {
+		case SMA1307_MONO_MODE:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_11_SYSTEM_CTRL2,
+						   SMA1307_MONOMIX_MASK,
+						   SMA1307_MONOMIX_ON);
+			break;
+		case SMA1307_LEFT_MODE:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_11_SYSTEM_CTRL2,
+						   SMA1307_MONOMIX_MASK,
+						   SMA1307_MONOMIX_OFF);
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_11_SYSTEM_CTRL2,
+						   SMA1307_LR_DATA_SW_MASK,
+						   SMA1307_LR_DATA_SW_NORMAL);
+			break;
+		case SMA1307_RIGHT_MODE:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_11_SYSTEM_CTRL2,
+						   SMA1307_MONOMIX_MASK,
+						   SMA1307_MONOMIX_OFF);
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_11_SYSTEM_CTRL2,
+						   SMA1307_LR_DATA_SW_MASK,
+						   SMA1307_LR_DATA_SW_SWAP);
+			break;
+		default:
+
+			dev_err(sma1307->dev, "%s: Invalid value (%d)\n",
+				__func__, mux);
+			return -EINVAL;
+		}
+		sma1307->amp_mode = mux;
+		break;
+	}
+	return 0;
+}
+
+static int sma1307_sdo_setting_event(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+	    snd_soc_dapm_to_component(w->dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	unsigned int mux = sma1307->dapm_sdo_setting;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		switch (mux) {
+		case SMA1307_OUT_DATA_ONE_48K:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A2_TOP_MAN1,
+						   SMA1307_SDO_OUTPUT2_MASK,
+						   SMA1307_ONE_SDO_PER_CH);
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A3_TOP_MAN2,
+						   SMA1307_SDO_OUTPUT3_MASK
+						   |
+						   SMA1307_DATA_CLK_SEL_MASK,
+						   SMA1307_SDO_OUTPUT3_DIS
+						   | SMA1307_SDO_DATA);
+			break;
+		case SMA1307_OUT_DATA_TWO_48K:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A2_TOP_MAN1,
+						   SMA1307_SDO_OUTPUT2_MASK,
+						   SMA1307_TWO_SDO_PER_CH);
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A3_TOP_MAN2,
+						   SMA1307_SDO_OUTPUT3_MASK
+						   |
+						   SMA1307_DATA_CLK_SEL_MASK,
+						   SMA1307_SDO_OUTPUT3_DIS
+						   | SMA1307_SDO_DATA);
+			break;
+		case SMA1307_OUT_DATA_TWO_24K:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A2_TOP_MAN1,
+						   SMA1307_SDO_OUTPUT2_MASK,
+						   SMA1307_TWO_SDO_PER_CH);
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A3_TOP_MAN2,
+						   SMA1307_SDO_OUTPUT3_MASK
+						   |
+						   SMA1307_DATA_CLK_SEL_MASK,
+						   SMA1307_TWO_SDO_PER_CH_24K
+						   | SMA1307_SDO_DATA);
+			break;
+		case SMA1307_OUT_CLK_PLL:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A3_TOP_MAN2,
+						   SMA1307_DATA_CLK_SEL_MASK,
+						   SMA1307_SDO_CLK_PLL);
+
+			break;
+		case SMA1307_OUT_CLK_OSC:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A3_TOP_MAN2,
+						   SMA1307_DATA_CLK_SEL_MASK,
+						   SMA1307_SDO_CLK_OSC);
+
+			break;
+		default:
+			dev_err(sma1307->dev, "%s: Invalid value (%d)\n",
+				__func__, mux);
+			return -EINVAL;
+		}
+		break;
+	}
+	return 0;
+}
+
+static int sma1307_aif_out_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+	    snd_soc_dapm_to_component(w->dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	unsigned int mux = 0, val = 0, mask = 0;
+
+	if (!strcmp(w->name, SMA1307_AIF_OUT0_NAME)) {
+		mux = sma1307->dapm_aif_out0;
+		val = mux;
+		mask = SMA1307_SDO_OUT0_SEL_MASK;
+	} else if (!strcmp(w->name, SMA1307_AIF_OUT1_NAME)) {
+		mux = sma1307->dapm_aif_out1;
+		val = mux << 3;
+		mask = SMA1307_SDO_OUT1_SEL_MASK;
+	} else {
+		dev_err(sma1307->dev, "%s: Invalid widget - %s\n",
+			__func__, w->name);
+		return -EINVAL;
+	}
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		sma1307_regmap_update_bits(sma1307, SMA1307_09_OUTPUT_CTRL,
+					   mask, val);
+		break;
+	}
+	return 0;
+}
+
+static int sma1307_sdo_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+	    snd_soc_dapm_to_component(w->dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_09_OUTPUT_CTRL,
+					   SMA1307_PORT_CONFIG_MASK,
+					   SMA1307_OUTPUT_PORT_ENABLE);
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A3_TOP_MAN2,
+					   SMA1307_SDO_OUTPUT_MASK,
+					   SMA1307_LOGIC_OUTPUT);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_09_OUTPUT_CTRL,
+					   SMA1307_PORT_CONFIG_MASK,
+					   SMA1307_INPUT_PORT_ONLY);
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A3_TOP_MAN2,
+					   SMA1307_SDO_OUTPUT_MASK,
+					   SMA1307_HIGH_Z_OUTPUT);
+		break;
+	}
+	return 0;
+}
+
+static int sma1307_power_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+	    snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		sma1307_startup(component);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		sma1307_shutdown(component);
+		break;
+	}
+	return 0;
+}
+
+static int sma1307_dapm_aif_in_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sma1307_priv *sma1307 =
+	    snd_soc_component_get_drvdata(dapm->component);
+
+	ucontrol->value.enumerated.item[0] = (unsigned int)sma1307->dapm_aif_in;
+	snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+
+	return 0;
+}
+
+static int sma1307_dapm_aif_in_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sma1307_priv *sma1307 =
+	    snd_soc_component_get_drvdata(dapm->component);
+	int val = (int)ucontrol->value.enumerated.item[0];
+	bool change;
+
+	if ((val < 0) || (val >= ARRAY_SIZE(sma1307_aif_in_source_text))) {
+		dev_err(sma1307->dev, "%s: Out of range\n", __func__);
+		return -EINVAL;
+	}
+
+	if (sma1307->dapm_aif_in != val) {
+		change = true;
+		sma1307->dapm_aif_in = val;
+	} else
+		change = false;
+
+	snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+
+	return change;
+}
+
+static int sma1307_dapm_sdo_setting_get(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sma1307_priv *sma1307 =
+	    snd_soc_component_get_drvdata(dapm->component);
+
+	ucontrol->value.enumerated.item[0] =
+	    (unsigned int)sma1307->dapm_sdo_setting;
+	snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+
+	return 0;
+}
+
+static int sma1307_dapm_sdo_setting_put(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sma1307_priv *sma1307 =
+	    snd_soc_component_get_drvdata(dapm->component);
+	int val = (int)ucontrol->value.enumerated.item[0];
+	bool change;
+
+	if ((val < 0) || (val >= ARRAY_SIZE(sma1307_sdo_setting_text))) {
+		dev_err(sma1307->dev, "%s: Out of range\n", __func__);
+		return -EINVAL;
+	}
+
+	if (sma1307->dapm_sdo_setting != val) {
+		change = true;
+		sma1307->dapm_sdo_setting = val;
+	} else
+		change = false;
+
+	snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+
+	return change;
+}
+
+static int sma1307_dapm_aif_out_get(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sma1307_priv *sma1307 =
+	    snd_soc_component_get_drvdata(dapm->component);
+	unsigned int val = 0;
+
+	if (!strcmp(kcontrol->id.name, SMA1307_AIF_OUT0_NAME)) {
+		val = (unsigned int)sma1307->dapm_aif_out0;
+	} else if (!strcmp(kcontrol->id.name, SMA1307_AIF_OUT1_NAME)) {
+		val = (unsigned int)sma1307->dapm_aif_out1;
+	} else {
+		dev_err(sma1307->dev, "%s: Invalid Control ID - %s\n",
+			__func__, kcontrol->id.name);
+		return -EINVAL;
+	}
+	ucontrol->value.enumerated.item[0] = val;
+	snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+
+	return 0;
+}
+
+static int sma1307_dapm_aif_out_put(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sma1307_priv *sma1307 =
+	    snd_soc_component_get_drvdata(dapm->component);
+	int val = (int)ucontrol->value.enumerated.item[0];
+	bool change;
+
+	if ((val < 0) || (val >= ARRAY_SIZE(sma1307_aif_out_source_text))) {
+		dev_err(sma1307->dev, "%s: Out of range\n", __func__);
+		return -EINVAL;
+	}
+
+	if (!strcmp(kcontrol->id.name, SMA1307_AIF_OUT0_NAME)) {
+		if (sma1307->dapm_aif_out0 != val) {
+			change = true;
+			sma1307->dapm_aif_out0 = val;
+		} else
+			change = false;
+	} else if (!strcmp(kcontrol->id.name, SMA1307_AIF_OUT1_NAME)) {
+		if (sma1307->dapm_aif_out1 != val) {
+			change = true;
+			sma1307->dapm_aif_out1 = val;
+		} else
+			change = false;
+	} else {
+		dev_err(sma1307->dev, "%s: Invalid Control ID - %s\n",
+			__func__, kcontrol->id.name);
+		return -EINVAL;
+	}
+
+	snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+
+	return change;
+}
+
+static int sma1307_dapm_sdo_enable_get(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sma1307_priv *sma1307 =
+	    snd_soc_component_get_drvdata(dapm->component);
+
+	ucontrol->value.integer.value[0] = (long)sma1307->dapm_sdo_en;
+	snd_soc_dapm_put_volsw(kcontrol, ucontrol);
+
+	return 0;
+}
+
+static int sma1307_dapm_sdo_enable_put(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sma1307_priv *sma1307 =
+	    snd_soc_component_get_drvdata(dapm->component);
+	int val = (int)ucontrol->value.integer.value[0];
+	bool change;
+
+	if ((val < 0) || (val > 1)) {
+		dev_err(sma1307->dev, "%s: Out of range\n", __func__);
+		return -EINVAL;
+	}
+
+	if (sma1307->dapm_sdo_en != val) {
+		change = true;
+		sma1307->dapm_sdo_en = val;
+	} else
+		change = false;
+
+	snd_soc_dapm_put_volsw(kcontrol, ucontrol);
+
+	return change;
+}
+
+static int sma1307_dapm_amp_enable_get(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sma1307_priv *sma1307 =
+	    snd_soc_component_get_drvdata(dapm->component);
+
+	ucontrol->value.integer.value[0] = (long)sma1307->dapm_amp_en;
+	snd_soc_dapm_put_volsw(kcontrol, ucontrol);
+
+	return 0;
+}
+
+static int sma1307_dapm_amp_enable_put(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sma1307_priv *sma1307 =
+	    snd_soc_component_get_drvdata(dapm->component);
+	int val = (int)ucontrol->value.integer.value[0];
+	bool change;
+
+	if ((val < 0) || (val > 1)) {
+		dev_err(sma1307->dev, "%s: Out of range\n", __func__);
+		return -EINVAL;
+	}
+
+	if (sma1307->dapm_amp_en != val) {
+		change = true;
+		sma1307->dapm_amp_en = val;
+	} else
+		change = false;
+
+	snd_soc_dapm_put_volsw(kcontrol, ucontrol);
+
+	return change;
+}
+
+static const struct snd_kcontrol_new sma1307_aif_in_source_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = SMA1307_AIF_IN_NAME,
+	.info = snd_soc_info_enum_double,
+	.get = sma1307_dapm_aif_in_get,
+	.put = sma1307_dapm_aif_in_put,
+	.private_value = (unsigned long)&sma1307_aif_in_source_enum
+};
+
+static const struct snd_kcontrol_new sma1307_sdo_setting_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "SDO Setting",
+	.info = snd_soc_info_enum_double,
+	.get = sma1307_dapm_sdo_setting_get,
+	.put = sma1307_dapm_sdo_setting_put,
+	.private_value = (unsigned long)&sma1307_sdo_setting_enum
+};
+
+static const struct snd_kcontrol_new sma1307_aif_out0_source_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = SMA1307_AIF_OUT0_NAME,
+	.info = snd_soc_info_enum_double,
+	.get = sma1307_dapm_aif_out_get,
+	.put = sma1307_dapm_aif_out_put,
+	.private_value = (unsigned long)&sma1307_aif_out_source_enum
+};
+
+static const struct snd_kcontrol_new sma1307_aif_out1_source_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = SMA1307_AIF_OUT1_NAME,
+	.info = snd_soc_info_enum_double,
+	.get = sma1307_dapm_aif_out_get,
+	.put = sma1307_dapm_aif_out_put,
+	.private_value = (unsigned long)&sma1307_aif_out_source_enum
+};
+
+static const struct snd_kcontrol_new sma1307_sdo_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Switch",
+	.info = snd_soc_info_volsw,
+	.get = sma1307_dapm_sdo_enable_get,
+	.put = sma1307_dapm_sdo_enable_put,
+	.private_value = SOC_SINGLE_VALUE(SND_SOC_NOPM, 0, 1, 0, 0)
+};
+
+static const struct snd_kcontrol_new sma1307_enable_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Switch",
+	.info = snd_soc_info_volsw,
+	.get = sma1307_dapm_amp_enable_get,
+	.put = sma1307_dapm_amp_enable_put,
+	.private_value = SOC_SINGLE_VALUE(SND_SOC_NOPM, 0, 1, 0, 0)
+};
+
+static const struct snd_kcontrol_new sma1307_binary_mode_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Binary Mode",
+	.info = snd_soc_info_enum_double,
+	.get = sma1307_binary_mode_get,
+	.put = sma1307_binary_mode_put,
+	.private_value = (unsigned long)&sma1307_binary_mode_enum
+};
+
+static const struct snd_kcontrol_new sma1307_snd_controls[] = {
+	SOC_SINGLE_TLV(SMA1307_VOL_CTRL_NAME, SMA1307_0A_SPK_VOL,
+		       0, 167, 1, sma1307_spk_tlv),
+	SOC_SINGLE_BOOL_EXT(SMA1307_FORCE_MUTE_CTRL_NAME, 0,
+			    sma1307_force_mute_get, sma1307_force_mute_put),
+	SOC_ENUM_EXT(SMA1307_TDM_RX0_POS_NAME, sma1307_tdm_slot_enum,
+		     sma1307_tdm_slot_get, sma1307_tdm_slot_put),
+	SOC_ENUM_EXT(SMA1307_TDM_RX1_POS_NAME, sma1307_tdm_slot_enum,
+		     sma1307_tdm_slot_get, sma1307_tdm_slot_put),
+	SOC_ENUM_EXT(SMA1307_TDM_TX0_POS_NAME, sma1307_tdm_slot_enum,
+		     sma1307_tdm_slot_get, sma1307_tdm_slot_put),
+	SOC_ENUM_EXT(SMA1307_TDM_TX1_POS_NAME, sma1307_tdm_slot_enum,
+		     sma1307_tdm_slot_get, sma1307_tdm_slot_put),
+	SOC_SINGLE_BOOL_EXT(SMA1307_OT1_SW_PROT_CTRL_NAME, 0,
+			    sma1307_sw_ot1_prot_get, sma1307_sw_ot1_prot_put),
+	SOC_SINGLE_BOOL_EXT(SMA1307_RESET_CTRL_NAME, 0,
+			    sma1307_reset_get, sma1307_reset_put),
+};
+
+static const struct snd_soc_dapm_widget sma1307_dapm_widgets[] = {
+	/* platform domain */
+	SND_SOC_DAPM_OUTPUT("SPK"),
+	SND_SOC_DAPM_INPUT("SDO"),
+
+	/* path domain */
+	SND_SOC_DAPM_MUX_E(SMA1307_AIF_IN_NAME, SND_SOC_NOPM, 0, 0,
+			   &sma1307_aif_in_source_control,
+			   sma1307_aif_in_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_MUX_E("SDO Setting", SND_SOC_NOPM, 0, 0,
+			   &sma1307_sdo_setting_control,
+			   sma1307_sdo_setting_event,
+			   SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_MUX_E(SMA1307_AIF_OUT0_NAME, SND_SOC_NOPM, 0, 0,
+			   &sma1307_aif_out0_source_control,
+			   sma1307_aif_out_event,
+			   SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_MUX_E(SMA1307_AIF_OUT1_NAME, SND_SOC_NOPM, 0, 0,
+			   &sma1307_aif_out1_source_control,
+			   sma1307_aif_out_event,
+			   SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_SWITCH_E("SDO Enable", SND_SOC_NOPM, 0, 0,
+			      &sma1307_sdo_control,
+			      sma1307_sdo_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER("Entry", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_OUT_DRV_E("AMP Power", SND_SOC_NOPM, 0, 0, NULL, 0,
+			       sma1307_power_event,
+			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD |
+			       SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_SWITCH("AMP Enable", SND_SOC_NOPM, 0, 0,
+			    &sma1307_enable_control),
+
+	/* stream domain */
+	SND_SOC_DAPM_AIF_IN("AIF IN", "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF OUT", "Capture", 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route sma1307_audio_map[] = {
+	/* Playback */
+	{ "AIF IN Source", "Mono", "AIF IN" },
+	{ "AIF IN Source", "Left", "AIF IN" },
+	{ "AIF IN Source", "Right", "AIF IN" },
+
+	{ "SDO Enable", "Switch", "AIF IN" },
+
+	{ "SDO Setting", "Data_One_48k", "SDO Enable" },
+	{ "SDO Setting", "Data_Two_48k", "SDO Enable" },
+	{ "SDO Setting", "Data_Two_24k", "SDO Enable" },
+	{ "SDO Setting", "Clk_PLL", "SDO Enable" },
+	{ "SDO Setting", "Clk_OSC", "SDO Enable" },
+
+	{ "AIF OUT0 Source", "Disable", "SDO Setting" },
+	{ "AIF OUT0 Source", "After_FmtC", "SDO Setting" },
+	{ "AIF OUT0 Source", "After_Mixer", "SDO Setting" },
+	{ "AIF OUT0 Source", "After_DSP", "SDO Setting" },
+	{ "AIF OUT0 Source", "Vrms2_Avg", "SDO Setting" },
+	{ "AIF OUT0 Source", "Battery", "SDO Setting" },
+	{ "AIF OUT0 Source", "Temperature", "SDO Setting" },
+	{ "AIF OUT0 Source", "After_Delay", "SDO Setting" },
+
+	{ "AIF OUT1 Source", "Disable", "SDO Setting" },
+	{ "AIF OUT1 Source", "After_FmtC", "SDO Setting" },
+	{ "AIF OUT1 Source", "After_Mixer", "SDO Setting" },
+	{ "AIF OUT1 Source", "After_DSP", "SDO Setting" },
+	{ "AIF OUT1 Source", "Vrms2_Avg", "SDO Setting" },
+	{ "AIF OUT1 Source", "Battery", "SDO Setting" },
+	{ "AIF OUT1 Source", "Temperature", "SDO Setting" },
+	{ "AIF OUT1 Source", "After_Delay", "SDO Setting" },
+
+	{ "Entry", NULL, "AIF OUT0 Source" },
+	{ "Entry", NULL, "AIF OUT1 Source" },
+	{ "Entry", NULL, "AIF IN Source" },
+
+	{ "AMP Power", NULL, "Entry" },
+
+	{ "AMP Enable", "Switch", "AMP Power" },
+	{ "SPK", NULL, "AMP Enable" },
+
+	/* Capture */
+	{ "AIF OUT", NULL, "AMP Enable" },
+};
+
+static void sma1307_setup_pll(struct snd_soc_component *component,
+			      unsigned int bclk)
+{
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	int i = 0;
+
+	dev_dbg(component->dev, "%s: BCLK = %dHz\n", __func__, bclk);
+
+	if (sma1307->sys_clk_id == SMA1307_PLL_CLKIN_MCLK) {
+		dev_warn(component->dev, "%s: MCLK is not supported\n",
+			 __func__);
+	} else if (sma1307->sys_clk_id == SMA1307_PLL_CLKIN_BCLK) {
+		for (i = 0; i < sma1307->num_of_pll_matches; i++) {
+			if (sma1307->pll_matches[i].input_clk == bclk)
+				break;
+		}
+		if (i == sma1307->num_of_pll_matches) {
+			dev_warn(component->dev,
+				 "%s: No matching value between pll table and SCK\n",
+				 __func__);
+			return;
+		}
+
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A2_TOP_MAN1,
+					   SMA1307_PLL_MASK, SMA1307_PLL_ON);
+	}
+
+	sma1307_regmap_write(sma1307, SMA1307_8B_PLL_POST_N,
+			     sma1307->pll_matches[i].post_n);
+	sma1307_regmap_write(sma1307, SMA1307_8C_PLL_N,
+			     sma1307->pll_matches[i].n);
+	sma1307_regmap_write(sma1307, SMA1307_8D_PLL_A_SETTING,
+			     sma1307->pll_matches[i].vco);
+	sma1307_regmap_write(sma1307, SMA1307_8E_PLL_P_CP,
+			     sma1307->pll_matches[i].p_cp);
+}
+
+static int sma1307_dai_hw_params_amp(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params,
+				     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	unsigned int bclk = 0;
+	int ret = 0;
+
+	if (sma1307->format == SND_SOC_DAIFMT_DSP_A)
+		bclk = params_rate(params) * sma1307->frame_size;
+	else
+		bclk = params_rate(params) * params_physical_width(params)
+		    * params_channels(params);
+
+	dev_dbg(component->dev,
+		 "%s: rate = %d : bit size = %d : channel = %d\n",
+		 __func__, params_rate(params), params_width(params),
+		 params_channels(params));
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (sma1307->sys_clk_id == SMA1307_PLL_CLKIN_BCLK) {
+			if (sma1307->last_bclk != bclk) {
+				sma1307_setup_pll(component, bclk);
+				sma1307->last_bclk = bclk;
+			}
+		}
+
+		switch (params_rate(params)) {
+		case 8000:
+		case 12000:
+		case 16000:
+		case 24000:
+		case 32000:
+		case 44100:
+		case 48000:
+			break;
+
+		case 96000:
+			dev_warn(component->dev,
+				 "%s: %d rate not support SDO\n", __func__,
+				 params_rate(params));
+			break;
+
+		default:
+			dev_err(component->dev, "%s: not support rate : %d\n",
+				__func__, params_rate(params));
+
+			return -EINVAL;
+		}
+
+		/* substream->stream is SNDRV_PCM_STREAM_CAPTURE */
+	} else {
+
+		switch (params_format(params)) {
+		case SNDRV_PCM_FORMAT_S16_LE:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A4_TOP_MAN3,
+						   SMA1307_SCK_RATE_MASK
+						   |
+						   SMA1307_DATA_WIDTH_MASK,
+						   SMA1307_SCK_32FS |
+						   SMA1307_DATA_16BIT);
+			break;
+
+		case SNDRV_PCM_FORMAT_S24_LE:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A4_TOP_MAN3,
+						   SMA1307_SCK_RATE_MASK
+						   |
+						   SMA1307_DATA_WIDTH_MASK,
+						   SMA1307_SCK_64FS |
+						   SMA1307_DATA_24BIT);
+			break;
+
+		case SNDRV_PCM_FORMAT_S32_LE:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_A4_TOP_MAN3,
+						   SMA1307_SCK_RATE_MASK
+						   |
+						   SMA1307_DATA_WIDTH_MASK,
+						   SMA1307_SCK_64FS |
+						   SMA1307_DATA_24BIT);
+			break;
+		default:
+			dev_err(component->dev,
+				"%s: not support data bit : %d\n", __func__,
+				params_format(params));
+			return -EINVAL;
+		}
+	}
+
+	switch (sma1307->format) {
+	case SND_SOC_DAIFMT_I2S:
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_01_INPUT_CTRL1,
+					   SMA1307_I2S_MODE_MASK,
+					   SMA1307_STANDARD_I2S);
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A4_TOP_MAN3,
+					   SMA1307_INTERFACE_MASK,
+					   SMA1307_I2S_FORMAT);
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_01_INPUT_CTRL1,
+					   SMA1307_I2S_MODE_MASK, SMA1307_LJ);
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A4_TOP_MAN3,
+					   SMA1307_INTERFACE_MASK,
+					   SMA1307_LJ_FORMAT);
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		switch (params_width(params)) {
+		case 16:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_01_INPUT_CTRL1,
+						   SMA1307_I2S_MODE_MASK,
+						   SMA1307_RJ_16BIT);
+			break;
+		case 24:
+		case 32:
+			sma1307_regmap_update_bits(sma1307,
+						   SMA1307_01_INPUT_CTRL1,
+						   SMA1307_I2S_MODE_MASK,
+						   SMA1307_RJ_24BIT);
+			break;
+		}
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_01_INPUT_CTRL1,
+					   SMA1307_I2S_MODE_MASK,
+					   SMA1307_STANDARD_I2S);
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A4_TOP_MAN3,
+					   SMA1307_INTERFACE_MASK,
+					   SMA1307_TDM_FORMAT);
+		break;
+	}
+
+	switch (params_width(params)) {
+	case 16:
+	case 24:
+	case 32:
+		break;
+	default:
+		dev_err(component->dev,
+			"%s: not support data bit : %d\n", __func__,
+			params_format(params));
+		return -EINVAL;
+	}
+	if (ret < 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int sma1307_dai_set_sysclk_amp(struct snd_soc_dai *dai,
+				      int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	switch (clk_id) {
+	case SMA1307_EXTERNAL_CLOCK_19_2:
+	case SMA1307_EXTERNAL_CLOCK_24_576:
+	case SMA1307_PLL_CLKIN_MCLK:
+	case SMA1307_PLL_CLKIN_BCLK:
+		break;
+	default:
+		dev_err(component->dev, "%s: Invalid clk id: %d\n",
+			__func__, clk_id);
+		return -EINVAL;
+	}
+	sma1307->sys_clk_id = clk_id;
+
+	return 0;
+}
+
+static int sma1307_dai_set_fmt_amp(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+
+	case SND_SOC_DAIFMT_CBC_CFC:
+		dev_dbg(component->dev,
+			 "%s: %s\n", __func__, "I2S/TDM Device mode");
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_01_INPUT_CTRL1,
+					   SMA1307_CONTROLLER_DEVICE_MASK,
+					   SMA1307_DEVICE_MODE);
+		break;
+
+	case SND_SOC_DAIFMT_CBP_CFP:
+		dev_dbg(component->dev,
+			 "%s: %s\n", __func__, "I2S/TDM Controller mode");
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_01_INPUT_CTRL1,
+					   SMA1307_CONTROLLER_DEVICE_MASK,
+					   SMA1307_CONTROLLER_MODE);
+		break;
+
+	default:
+		dev_err(component->dev,
+			"%s: Unsupported Controller/Device : 0x%x\n",
+			__func__, fmt);
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+	case SND_SOC_DAIFMT_RIGHT_J:
+	case SND_SOC_DAIFMT_LEFT_J:
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
+		sma1307->format = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
+		break;
+	default:
+		dev_err(component->dev,
+			"%s: Unsupported Audio Interface Format : 0x%x\n",
+			__func__, fmt);
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+
+	case SND_SOC_DAIFMT_IB_NF:
+		dev_dbg(component->dev, "%s: %s\n",
+			 __func__, "Invert BCLK + Normal Frame");
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_01_INPUT_CTRL1,
+					   SMA1307_SCK_RISING_MASK,
+					   SMA1307_SCK_RISING_EDGE);
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		dev_dbg(component->dev, "%s: %s\n",
+			 __func__, "Invert BCLK + Invert Frame");
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_01_INPUT_CTRL1,
+					   SMA1307_LEFTPOL_MASK
+					   | SMA1307_SCK_RISING_MASK,
+					   SMA1307_HIGH_FIRST_CH
+					   | SMA1307_SCK_RISING_EDGE);
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		dev_dbg(component->dev, "%s: %s\n",
+			 __func__, "Normal BCLK + Invert Frame");
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_01_INPUT_CTRL1,
+					   SMA1307_LEFTPOL_MASK,
+					   SMA1307_HIGH_FIRST_CH);
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		dev_dbg(component->dev, "%s: %s\n",
+			 __func__, "Normal BCLK + Normal Frame");
+		break;
+	default:
+		dev_err(component->dev,
+			"%s: Unsupported Bit & Frameclock : 0x%x\n",
+			__func__, fmt);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sma1307_dai_set_tdm_slot(struct snd_soc_dai *dai,
+				    unsigned int tx_mask, unsigned int rx_mask,
+				    int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	dev_dbg(component->dev, "%s: slots = %d, slot_width - %d\n",
+		 __func__, slots, slot_width);
+
+	sma1307->frame_size = slot_width * slots;
+
+	sma1307_regmap_update_bits(sma1307,
+				   SMA1307_A4_TOP_MAN3,
+				   SMA1307_INTERFACE_MASK, SMA1307_TDM_FORMAT);
+
+	sma1307_regmap_update_bits(sma1307,
+				   SMA1307_A5_TDM1,
+				   SMA1307_TDM_TX_MODE_MASK,
+				   SMA1307_TDM_TX_MONO);
+
+	switch (slot_width) {
+	case 16:
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A6_TDM2,
+					   SMA1307_TDM_DL_MASK,
+					   SMA1307_TDM_DL_16);
+		break;
+	case 32:
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A6_TDM2,
+					   SMA1307_TDM_DL_MASK,
+					   SMA1307_TDM_DL_32);
+		break;
+	default:
+		dev_err(component->dev, "%s: not support TDM %d slot_width\n",
+			__func__, slot_width);
+		return -EINVAL;
+	}
+
+	switch (slots) {
+	case 4:
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A6_TDM2,
+					   SMA1307_TDM_N_SLOT_MASK,
+					   SMA1307_TDM_N_SLOT_4);
+		break;
+	case 8:
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A6_TDM2,
+					   SMA1307_TDM_N_SLOT_MASK,
+					   SMA1307_TDM_N_SLOT_8);
+		break;
+	default:
+		dev_err(component->dev, "%s: not support TDM %d slots\n",
+			__func__, slots);
+		return -EINVAL;
+	}
+
+	if (sma1307->tdm_slot0_rx < slots)
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A5_TDM1,
+					   SMA1307_TDM_SLOT0_RX_POS_MASK,
+					   sma1307->tdm_slot0_rx << 3);
+	else
+		dev_err(component->dev, "%s: Incorrect tdm-slot0-rx %d set\n",
+			__func__, sma1307->tdm_slot0_rx);
+
+	if (sma1307->tdm_slot1_rx < slots)
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A5_TDM1,
+					   SMA1307_TDM_SLOT1_RX_POS_MASK,
+					   sma1307->tdm_slot1_rx);
+	else
+		dev_err(component->dev, "%s: Incorrect tdm-slot1-rx %d set\n",
+			__func__, sma1307->tdm_slot1_rx);
+
+	if (sma1307->tdm_slot0_tx < slots)
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A6_TDM2,
+					   SMA1307_TDM_SLOT0_TX_POS_MASK,
+					   sma1307->tdm_slot0_tx << 3);
+	else
+		dev_err(component->dev, "%s: Incorrect tdm-slot0-tx %d set\n",
+			__func__, sma1307->tdm_slot0_tx);
+
+	if (sma1307->tdm_slot1_tx < slots)
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_A6_TDM2,
+					   SMA1307_TDM_SLOT1_TX_POS_MASK,
+					   sma1307->tdm_slot1_tx);
+	else
+		dev_err(component->dev, "%s: Incorrect tdm-slot1-tx %d set\n",
+			__func__, sma1307->tdm_slot1_tx);
+
+	return 0;
+}
+
+static int sma1307_dai_mute_stream(struct snd_soc_dai *dai, int mute,
+				   int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+	if (mute) {
+		dev_dbg(component->dev, "%s: %s\n", __func__, "MUTE");
+		sma1307_regmap_update_bits(sma1307,
+					   SMA1307_0E_MUTE_VOL_CTRL,
+					   SMA1307_SPK_MUTE_MASK,
+					   SMA1307_SPK_MUTE);
+	} else {
+		if (!sma1307->force_mute_status) {
+			dev_dbg(component->dev, "%s: %s\n", __func__,
+					 "UNMUTE");
+			sma1307_regmap_update_bits(sma1307,
+						SMA1307_0E_MUTE_VOL_CTRL,
+						SMA1307_SPK_MUTE_MASK,
+						SMA1307_SPK_UNMUTE);
+		} else {
+			dev_dbg(sma1307->dev, "%s: FORCE MUTE!!!\n", __func__);
+		}
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops sma1307_dai_ops_amp = {
+	.hw_params = sma1307_dai_hw_params_amp,
+	.set_fmt = sma1307_dai_set_fmt_amp,
+	.set_sysclk = sma1307_dai_set_sysclk_amp,
+	.set_tdm_slot = sma1307_dai_set_tdm_slot,
+	.mute_stream = sma1307_dai_mute_stream,
+};
+
+#define SMA1307_RATES_PLAYBACK SNDRV_PCM_RATE_8000_96000
+#define SMA1307_RATES_CAPTURE SNDRV_PCM_RATE_8000_48000
+#define SMA1307_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+		SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver sma1307_dai[] = {
+	{
+	 .name = "sma1307-amplifier",
+	 .id = 0,
+	 .playback = {
+		      .stream_name = "Playback",
+		      .channels_min = 1,
+		      .channels_max = 2,
+		      .rates = SMA1307_RATES_PLAYBACK,
+		      .formats = SMA1307_FORMATS,
+		      },
+	 .capture = {
+		     .stream_name = "Capture",
+		     .channels_min = 1,
+		     .channels_max = 2,
+		     .rates = SMA1307_RATES_CAPTURE,
+		     .formats = SMA1307_FORMATS,
+		     },
+	 .ops = &sma1307_dai_ops_amp,
+	  },
+};
+
+static void sma1307_check_fault_worker(struct work_struct *work)
+{
+	struct sma1307_priv *sma1307 =
+	    container_of(work, struct sma1307_priv, check_fault_work.work);
+	int ret = 0;
+	unsigned int status1_val, status2_val;
+
+	if (sma1307->tsdw_cnt)
+		ret = sma1307_regmap_read(sma1307,
+					  SMA1307_0A_SPK_VOL,
+					  &sma1307->cur_vol);
+	else
+		ret = sma1307_regmap_read(sma1307,
+					  SMA1307_0A_SPK_VOL,
+					  &sma1307->init_vol);
+
+	if (ret != 0) {
+		dev_err(sma1307->dev,
+			"%s: failed to read SMA1307_0A_SPK_VOL : %d\n",
+			__func__, ret);
+		return;
+	}
+
+	ret = sma1307_regmap_read(sma1307, SMA1307_FA_STATUS1, &status1_val);
+	if (ret != 0) {
+		dev_err(sma1307->dev,
+			"%s: failed to read SMA1307_FA_STATUS1 : %d\n",
+			__func__, ret);
+		return;
+	}
+
+	ret = sma1307_regmap_read(sma1307, SMA1307_FB_STATUS2, &status2_val);
+	if (ret != 0) {
+		dev_err(sma1307->dev,
+			"%s: failed to read SMA1307_FB_STATUS2 : %d\n",
+			__func__, ret);
+		return;
+	}
+
+	if (~status1_val & SMA1307_OT1_OK_STATUS) {
+		dev_crit(sma1307->dev,
+			 "%s: OT1(Over Temperature Level 1)\n", __func__);
+		if (sma1307->sw_ot1_prot) {
+			/* Volume control (Current Volume -3dB) */
+			if ((sma1307->cur_vol + 6) <= 0xFA)
+				sma1307_regmap_write(sma1307,
+						     SMA1307_0A_SPK_VOL,
+						     sma1307->cur_vol + 6);
+		}
+		sma1307->tsdw_cnt++;
+	} else if (sma1307->tsdw_cnt) {
+		sma1307_regmap_write(sma1307,
+				     SMA1307_0A_SPK_VOL, sma1307->init_vol);
+		sma1307->tsdw_cnt = 0;
+		sma1307->cur_vol = sma1307->init_vol;
+	}
+
+	if (~status1_val & SMA1307_OT2_OK_STATUS) {
+		dev_crit(sma1307->dev,
+			 "%s: OT2(Over Temperature Level 2)\n", __func__);
+	}
+	if (status1_val & SMA1307_UVLO_STATUS) {
+		dev_crit(sma1307->dev,
+			 "%s: UVLO(Under Voltage Lock Out)\n", __func__);
+	}
+	if (status1_val & SMA1307_OVP_BST_STATUS) {
+		dev_crit(sma1307->dev,
+			 "%s: OVP_BST(Over Voltage Protection)\n", __func__);
+	}
+	if (status2_val & SMA1307_OCP_SPK_STATUS) {
+		dev_crit(sma1307->dev,
+			 "%s: OCP_SPK(Over Current Protect SPK)\n", __func__);
+	}
+	if (status2_val & SMA1307_OCP_BST_STATUS) {
+		dev_crit(sma1307->dev,
+			 "%s: OCP_BST(Over Current Protect Boost)\n", __func__);
+	}
+	if (status2_val & SMA1307_CLK_MON_STATUS) {
+		dev_crit(sma1307->dev,
+			 "%s: CLK_FAULT(No clock input)\n", __func__);
+	}
+}
+
+static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *file)
+{
+	const struct firmware *fw;
+	int *data, size, offset, num_mode, ret;
+
+	ret = request_firmware(&fw, file, sma1307->dev);
+
+	if (!fw) {
+		dev_err(sma1307->dev, "%s: failed to read \"%s\"\n",
+			__func__, setting_file);
+		release_firmware(fw);
+		sma1307->set.status = false;
+		return;
+	} else if ((fw->size) < SMA1307_SETTING_HEADER_SIZE) {
+		dev_err(sma1307->dev, "%s: Invalid file\n", __func__);
+		release_firmware(fw);
+		sma1307->set.status = false;
+		return;
+	}
+
+	data = kzalloc(fw->size, GFP_KERNEL);
+	size = fw->size >> 2;
+	memcpy(data, fw->data, fw->size);
+
+	release_firmware(fw);
+
+	/* HEADER */
+	sma1307->set.header_size = SMA1307_SETTING_HEADER_SIZE;
+	sma1307->set.checksum = data[sma1307->set.header_size - 2];
+	sma1307->set.num_mode = data[sma1307->set.header_size - 1];
+	num_mode = sma1307->set.num_mode;
+	sma1307->set.header = devm_kzalloc(sma1307->dev,
+					   sma1307->set.header_size,
+					   GFP_KERNEL);
+	memcpy(sma1307->set.header, data,
+	       sma1307->set.header_size * sizeof(int));
+
+	if ((sma1307->set.checksum >> 8) != SMA1307_SETTING_CHECKSUM) {
+		dev_err(sma1307->dev, "%s: failed by dismatch \"%s\"\n",
+			__func__, setting_file);
+		sma1307->set.status = false;
+		return;
+	}
+
+	/* DEFAULT */
+	sma1307->set.def_size = SMA1307_SETTING_DEFAULT_SIZE;
+	sma1307->set.def
+	    = devm_kzalloc(sma1307->dev,
+			   sma1307->set.def_size * sizeof(int), GFP_KERNEL);
+	memcpy(sma1307->set.def,
+	       &data[sma1307->set.header_size],
+	       sma1307->set.def_size * sizeof(int));
+
+	/* MODE */
+	offset = sma1307->set.header_size + sma1307->set.def_size;
+	sma1307->set.mode_size = DIV_ROUND_CLOSEST(size - offset, num_mode + 1);
+	for (int i = 0; i < num_mode; i++) {
+		sma1307->set.mode_set[i]
+		    = devm_kzalloc(sma1307->dev,
+				   sma1307->set.mode_size * 2 * sizeof(int),
+				   GFP_KERNEL);
+		for (int j = 0; j < sma1307->set.mode_size; j++) {
+			sma1307->set.mode_set[i][2 * j]
+			    = data[offset + ((num_mode + 1) * j)];
+			sma1307->set.mode_set[i][2 * j + 1]
+			    = data[offset + ((num_mode + 1) * j + i + 1)];
+		}
+	}
+
+	kfree(data);
+	sma1307->set.status = true;
+
+}
+
+static void sma1307_reset(struct snd_soc_component *component)
+{
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+	unsigned int status = 0;
+
+	ret = sma1307_regmap_read(sma1307, SMA1307_FF_DEVICE_INDEX, &status);
+
+	if (ret != 0)
+		dev_err(sma1307->dev,
+			"%s: failed to read SMA1307_FF_DEVICE_INDEX : %d\n",
+			__func__, ret);
+	else {
+		sma1307->rev_num = status & SMA1307_REV_NUM_STATUS;
+		dev_dbg(component->dev,
+			 "%s: SMA1307 Revision %d\n",
+			 __func__, sma1307->rev_num);
+	}
+
+	sma1307_regmap_read(sma1307, SMA1307_99_OTP_TRM2, &sma1307->otp_trm2);
+	sma1307_regmap_read(sma1307, SMA1307_9A_OTP_TRM3, &sma1307->otp_trm3);
+
+	if ((sma1307->otp_trm2 & SMA1307_OTP_STAT_MASK) != SMA1307_OTP_STAT_1)
+		dev_warn(component->dev, "%s: SMA1307 OTP Status Fail\n",
+			 __func__);
+
+	/* Register Initial Value Setting */
+	sma1307_setting_loaded(sma1307, setting_file);
+	if (sma1307->set.status)
+		sma1307_set_binary(component);
+	else
+		sma1307_set_default(component);
+
+	sma1307_regmap_update_bits(sma1307,
+				   SMA1307_93_INT_CTRL,
+				   SMA1307_DIS_INT_MASK, SMA1307_HIGH_Z_INT);
+	sma1307_regmap_write(sma1307, SMA1307_0A_SPK_VOL, sma1307->init_vol);
+}
+
+static void sma1307_set_binary(struct snd_soc_component *component)
+{
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	int i = 0, mode = 0;
+
+	for (i = 0; i < (sma1307->set.def_size); i++) {
+		if (sma1307_writeable_register(sma1307->dev, i)
+		    && ((i < SMA1307_97_OTP_TRM0)
+			|| (i > SMA1307_9A_OTP_TRM3))) {
+			sma1307_regmap_write(sma1307, i, sma1307->set.def[i]);
+
+		}
+	}
+	for (i = 0; i < (sma1307->set.mode_size); i++) {
+		if (sma1307_writeable_register(sma1307->dev, i)
+		    && ((i < SMA1307_97_OTP_TRM0)
+			|| (i > SMA1307_9A_OTP_TRM3))) {
+			mode = sma1307->binary_mode;
+			sma1307_regmap_write(sma1307,
+					     sma1307->set.mode_set[mode][2 * i],
+					     sma1307->set.mode_set[mode][2 * i +
+									 1]);
+		}
+	}
+}
+
+static void sma1307_set_default(struct snd_soc_component *component)
+{
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	int i = 0;
+
+	for (i = 0; i < (unsigned int)ARRAY_SIZE(sma1307_reg_def); i++)
+		sma1307_regmap_write(sma1307,
+				     sma1307_reg_def[i].reg,
+				     sma1307_reg_def[i].def);
+	if (!strcmp(sma1307->name, DEVICE_NAME_SMA1307AQ)) {
+		/* Guidelines for driving 4ohm load */
+		/* Brown Out Protection */
+		sma1307_regmap_write(sma1307, SMA1307_02_BROWN_OUT_PROT1, 0x62);
+		sma1307_regmap_write(sma1307, SMA1307_03_BROWN_OUT_PROT2, 0x5D);
+		sma1307_regmap_write(sma1307, SMA1307_04_BROWN_OUT_PROT3, 0x57);
+		sma1307_regmap_write(sma1307, SMA1307_05_BROWN_OUT_PROT8, 0x54);
+		sma1307_regmap_write(sma1307, SMA1307_06_BROWN_OUT_PROT9, 0x51);
+		sma1307_regmap_write(sma1307,
+				     SMA1307_07_BROWN_OUT_PROT10, 0x4D);
+		sma1307_regmap_write(sma1307,
+				     SMA1307_08_BROWN_OUT_PROT11, 0x4B);
+		sma1307_regmap_write(sma1307, SMA1307_27_BROWN_OUT_PROT4, 0x3C);
+		sma1307_regmap_write(sma1307, SMA1307_28_BROWN_OUT_PROT5, 0x5B);
+		sma1307_regmap_write(sma1307,
+				     SMA1307_29_BROWN_OUT_PROT12, 0x78);
+		sma1307_regmap_write(sma1307,
+				     SMA1307_2A_BROWN_OUT_PROT13, 0x96);
+		sma1307_regmap_write(sma1307,
+				     SMA1307_2B_BROWN_OUT_PROT14, 0xB4);
+		sma1307_regmap_write(sma1307,
+				     SMA1307_2C_BROWN_OUT_PROT15, 0xD3);
+		/* FDPEC Gain */
+		sma1307_regmap_write(sma1307, SMA1307_35_FDPEC_CTRL0, 0x16);
+		/* FLT Vdd */
+		sma1307_regmap_write(sma1307, SMA1307_92_FDPEC_CTRL1, 0xA0);
+		/* Boost Max */
+		sma1307_regmap_write(sma1307, SMA1307_AB_BOOST_CTRL4, 0x0F);
+	}
+}
+
+static ssize_t check_fault_period_show(struct device *dev,
+				       struct device_attribute *devattr,
+				       char *buf)
+{
+	struct sma1307_priv *sma1307 = dev_get_drvdata(dev);
+	int rc;
+
+	rc = (int)snprintf(buf, PAGE_SIZE,
+			   "%ld\n", sma1307->check_fault_period);
+
+	return (ssize_t) rc;
+}
+
+static ssize_t check_fault_period_store(struct device *dev,
+					struct device_attribute *devattr,
+					const char *buf, size_t count)
+{
+	struct sma1307_priv *sma1307 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = kstrtol(buf, 10, &sma1307->check_fault_period);
+
+	if (ret)
+		return -EINVAL;
+
+	return (ssize_t) count;
+}
+
+static DEVICE_ATTR_RW(check_fault_period);
+
+static ssize_t check_fault_status_show(struct device *dev,
+				       struct device_attribute *devattr,
+				       char *buf)
+{
+	struct sma1307_priv *sma1307 = dev_get_drvdata(dev);
+	int rc;
+
+	rc = (int)snprintf(buf, PAGE_SIZE,
+			   "%ld\n", sma1307->check_fault_status);
+
+	return (ssize_t) rc;
+}
+
+static ssize_t check_fault_status_store(struct device *dev,
+					struct device_attribute *devattr,
+					const char *buf, size_t count)
+{
+	struct sma1307_priv *sma1307 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = kstrtol(buf, 10, &sma1307->check_fault_status);
+
+	if (ret)
+		return -EINVAL;
+
+	return (ssize_t) count;
+}
+
+static DEVICE_ATTR_RW(check_fault_status);
+
+
+static struct attribute *sma1307_attr[] = {
+	&dev_attr_check_fault_period.attr,
+	&dev_attr_check_fault_status.attr,
+	NULL,
+};
+
+static struct attribute_group sma1307_attr_group = {
+	.attrs = sma1307_attr,
+};
+
+static int sma1307_probe(struct snd_soc_component *component)
+{
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm =
+	    snd_soc_component_get_dapm(component);
+	struct snd_kcontrol *kcontrol;
+
+	snd_soc_dapm_sync(dapm);
+
+	sma1307_amp_component = component;
+
+	kcontrol = snd_ctl_new1(&sma1307_binary_mode_control, sma1307);
+	if (!kcontrol)
+		dev_err(sma1307->dev,
+			"%s: binary mode control error\n", __func__);
+	else
+		snd_ctl_add(component->card->snd_card, kcontrol);
+
+	sma1307_reset(component);
+
+	return 0;
+}
+
+static void sma1307_remove(struct snd_soc_component *component)
+{
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
+
+	cancel_delayed_work_sync(&sma1307->check_fault_work);
+}
+
+static const struct snd_soc_component_driver sma1307_component = {
+	.probe = sma1307_probe,
+	.remove = sma1307_remove,
+	.controls = sma1307_snd_controls,
+	.num_controls = ARRAY_SIZE(sma1307_snd_controls),
+	.dapm_widgets = sma1307_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sma1307_dapm_widgets),
+	.dapm_routes = sma1307_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(sma1307_audio_map),
+};
+
+static const struct regmap_config sma_i2c_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = SMA1307_FF_DEVICE_INDEX,
+	.readable_reg = sma1307_readable_register,
+	.writeable_reg = sma1307_writeable_register,
+	.volatile_reg = sma1307_volatile_register,
+
+	.cache_type = REGCACHE_NONE,
+	.reg_defaults = sma1307_reg_def,
+	.num_reg_defaults = ARRAY_SIZE(sma1307_reg_def),
+};
+
+static int sma1307_i2c_probe(struct i2c_client *client)
+{
+	struct sma1307_priv *sma1307;
+	int ret = 0;
+	unsigned int device_info;
+
+	sma1307 = devm_kzalloc(&client->dev,
+			       sizeof(struct sma1307_priv), GFP_KERNEL);
+	if (!sma1307)
+		return -ENOMEM;
+
+	sma1307->regmap = devm_regmap_init_i2c(client, &sma_i2c_regmap);
+	if (IS_ERR(sma1307->regmap)) {
+		return dev_err_probe(&client->dev, PTR_ERR(sma1307->regmap),
+			"%s: failed to allocate register map\n", __func__);
+	}
+
+	/* set initial value as normal AMP IC status */
+	sma1307->name = client->name;
+	sma1307->format = SND_SOC_DAIFMT_I2S;
+	sma1307->sys_clk_id = SMA1307_PLL_CLKIN_BCLK;
+	sma1307->retry_cnt = SMA1307_I2C_RETRY_COUNT;
+	sma1307->num_of_pll_matches = ARRAY_SIZE(sma1307_pll_matches);
+
+	sma1307->check_fault_period = CHECK_PERIOD_TIME;
+	sma1307->check_fault_status = true;
+	sma1307->init_vol = 0x32;
+	sma1307->cur_vol = sma1307->init_vol;
+	sma1307->sw_ot1_prot = true;
+
+	mutex_init(&sma1307->default_lock);
+
+	INIT_DELAYED_WORK(&sma1307->check_fault_work,
+			  sma1307_check_fault_worker);
+
+	sma1307->dev = &client->dev;
+	sma1307->kobj = &client->dev.kobj;
+
+	i2c_set_clientdata(client, sma1307);
+
+	sma1307->pll_matches = sma1307_pll_matches;
+
+	ret = sma1307_regmap_read(sma1307,
+				  SMA1307_FF_DEVICE_INDEX, &device_info);
+
+	if ((ret != 0) || ((device_info & 0xF8) != SMA1307_DEVICE_ID)) {
+		dev_err(&client->dev,
+			"%s: device initialization error (%d 0x%02X)", __func__,
+			ret, device_info);
+		return -ENODEV;
+	}
+	dev_dbg(&client->dev, "%s: chip version 0x%02X\n",
+		 __func__, device_info);
+
+	i2c_set_clientdata(client, sma1307);
+
+	ret = devm_snd_soc_register_component(&client->dev,
+					      &sma1307_component, sma1307_dai,
+					      1);
+
+	if (ret) {
+		dev_err(&client->dev, "%s: failed to register component\n",
+			__func__);
+
+		return ret;
+	}
+
+	sma1307->attr_grp = &sma1307_attr_group;
+	ret = sysfs_create_group(sma1307->kobj, sma1307->attr_grp);
+	if (ret) {
+		dev_err(&client->dev,
+			"%s: failed to create attribute group [%d]\n", __func__,
+			ret);
+		sma1307->attr_grp = NULL;
+	}
+
+	return ret;
+}
+
+static void sma1307_i2c_remove(struct i2c_client *client)
+{
+	struct sma1307_priv *sma1307 =
+	    (struct sma1307_priv *)i2c_get_clientdata(client);
+
+	cancel_delayed_work_sync(&sma1307->check_fault_work);
+}
+
+static const struct i2c_device_id sma1307_i2c_id[] = {
+	{ "sma1307", 0 },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, sma1307_i2c_id);
+
+static const struct of_device_id sma1307_of_match[] = {
+	{.compatible = "irondevice,sma1307a", },
+	{.compatible = "irondevice,sma1307aq", },	//AEC-Q100 Qualificated
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, sma1307_of_match);
+
+static struct i2c_driver sma1307_i2c_driver = {
+	.driver = {
+		   .name = "sma1307",
+		   .of_match_table = sma1307_of_match,
+		    },
+	.probe = sma1307_i2c_probe,
+	.remove = sma1307_i2c_remove,
+	.id_table = sma1307_i2c_id,
+};
+
+module_i2c_driver(sma1307_i2c_driver);
+
+MODULE_DESCRIPTION("ALSA SoC SMA1307 driver");
+MODULE_AUTHOR("Gyuhwa Park, <gyuhwa.park@irondevice.com>");
+MODULE_AUTHOR("KS Jo, <kiseok.jo@irondevice.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/sma1307.h b/sound/soc/codecs/sma1307.h
new file mode 100644
index 000000000..d0cb01f52
--- /dev/null
+++ b/sound/soc/codecs/sma1307.h
@@ -0,0 +1,454 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ * sma1307.h -- sma1307 ALSA SoC Audio driver
+ *
+ * r005,
+ *
+ * Copyright 2023 Iron Device Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _SMA1307_H
+#define _SMA1307_H
+
+#include <sound/soc.h>
+
+enum sma1307_fault {
+	SMA1307_FAULT_OT1,
+	SMA1307_FAULT_OT2,
+	SMA1307_FAULT_UVLO,
+	SMA1307_FAULT_OVP_BST,
+	SMA1307_FAULT_OCP_SPK,
+	SMA1307_FAULT_OCP_BST,
+	SMA1307_FAULT_CLK
+};
+
+enum sma1307_mode {
+	SMA1307_MONO_MODE,
+	SMA1307_LEFT_MODE,
+	SMA1307_RIGHT_MODE,
+};
+
+enum sma1307_sdo_mode {
+	SMA1307_OUT_DATA_ONE_48K,
+	SMA1307_OUT_DATA_TWO_48K,
+	SMA1307_OUT_DATA_TWO_24K,
+	SMA1307_OUT_CLK_PLL,
+	SMA1307_OUT_CLK_OSC
+};
+
+enum sma1307_sdo_source {
+	SMA1307_OUT_DISABLE,
+	SMA1307_OUT_FORMAT_C,
+	SMA1307_OUT_MIXER_OUT,
+	SMA1307_OUT_AFTER_DSP,
+	SMA1307_OUT_VRMS2_AVG,
+	SMA1307_OUT_BATTERY,
+	SMA1307_OUT_TEMP,
+	SMA1307_OUT_AFTER_DELAY
+};
+
+struct sma1307_setting_file {
+	bool status;
+	char *header;
+	int *def;
+	int *mode_set[5];
+	int checksum;
+	int num_mode;
+	size_t header_size;
+	size_t def_size;
+	size_t mode_size;
+};
+
+#define SMA1307_I2C_ADDR_00		0x1e
+#define SMA1307_I2C_ADDR_01		0x3e
+#define SMA1307_I2C_ADDR_10		0x5e
+#define SMA1307_I2C_ADDR_11		0x7e
+
+#define DEVICE_NAME_SMA1307A		"sma1307a"
+#define DEVICE_NAME_SMA1307AQ		"sma1307aq"
+
+#define SMA1307_EXTERNAL_CLOCK_19_2		0x00
+#define SMA1307_EXTERNAL_CLOCK_24_576		0x01
+#define SMA1307_PLL_CLKIN_MCLK			0x02
+#define SMA1307_PLL_CLKIN_BCLK			0x03
+
+#define SMA1307_I2C_RETRY_COUNT 3
+
+#define SMA1307_OFFSET_DEFAULT_MODE		0x00
+#define SMA1307_OFFSET_BURNING_MODE		0x01
+
+#define SMA1307_SETTING_HEADER_SIZE		0x08
+#define SMA1307_SETTING_DEFAULT_SIZE		0xC0
+
+#define SMA1307_DEFAULT_SET			0x00
+#define SMA1307_BINARY_FILE_SET			0x01
+
+/* Controls Name */
+#define SMA1307_REG_CTRL_NAME		"Register Byte Control"
+#define SMA1307_VOL_CTRL_NAME		"Spleaker Volume"
+#define SMA1307_FORCE_MUTE_CTRL_NAME	"Force Mute Switch"
+#define SMA1307_TDM_RX0_POS_NAME	"TDM RX Slot0 Position"
+#define SMA1307_TDM_RX1_POS_NAME	"TDM RX Slot1 Position"
+#define SMA1307_TDM_TX0_POS_NAME	"TDM TX Slot0 Position"
+#define SMA1307_TDM_TX1_POS_NAME	"TDM TX Slot1 Position"
+#define SMA1307_OT1_SW_PROT_CTRL_NAME	"OT1 SW Protection Switch"
+#define SMA1307_RESET_CTRL_NAME		"Reset Switch"
+
+/* DAPM Name */
+#define SMA1307_AIF_IN_NAME		"AIF IN Source"
+#define SMA1307_AIF_OUT0_NAME		"AIF OUT0 Source"
+#define SMA1307_AIF_OUT1_NAME		"AIF OUT1 Source"
+
+/*
+ * SMA1307 Register Definition
+ */
+
+/* SMA1307 Register Addresses */
+#define SMA1307_00_SYSTEM_CTRL			0x00
+#define SMA1307_01_INPUT_CTRL1			0x01
+#define SMA1307_02_BROWN_OUT_PROT1		0x02
+#define SMA1307_03_BROWN_OUT_PROT2		0x03
+#define SMA1307_04_BROWN_OUT_PROT3		0x04
+#define SMA1307_05_BROWN_OUT_PROT8		0x05
+#define SMA1307_06_BROWN_OUT_PROT9		0x06
+#define SMA1307_07_BROWN_OUT_PROT10		0x07
+#define SMA1307_08_BROWN_OUT_PROT11		0x08
+#define SMA1307_09_OUTPUT_CTRL			0x09
+#define SMA1307_0A_SPK_VOL			0x0A
+#define SMA1307_0B_BST_TEST			0x0B
+#define SMA1307_0C_BOOST_CTRL8			0x0C
+#define SMA1307_0D_SPK_TEST			0x0D
+#define SMA1307_0E_MUTE_VOL_CTRL		0x0E
+#define SMA1307_0F_VBAT_TEMP_SENSING		0x0F
+
+#define SMA1307_10_SYSTEM_CTRL1			0x10
+#define SMA1307_11_SYSTEM_CTRL2			0x11
+#define SMA1307_12_SYSTEM_CTRL3			0x12
+#define SMA1307_13_DELAY			0x13
+#define SMA1307_14_MODULATOR			0x14
+#define SMA1307_15_BASS_SPK1			0x15
+#define SMA1307_16_BASS_SPK2			0x16
+#define SMA1307_17_BASS_SPK3			0x17
+#define SMA1307_18_BASS_SPK4			0x18
+#define SMA1307_19_BASS_SPK5			0x19
+#define SMA1307_1A_BASS_SPK6			0x1A
+#define SMA1307_1B_BASS_SPK7			0x1B
+#define SMA1307_1C_BROWN_OUT_PROT20		0x1C
+#define SMA1307_1D_BROWN_OUT_PROT0		0x1D
+#define SMA1307_1E_TONE_GENERATOR		0x1E
+#define SMA1307_1F_TONE_FINE_VOLUME		0x1F
+
+#define SMA1307_22_COMP_HYS_SEL			0x22
+#define SMA1307_23_COMPLIM1			0x23
+#define SMA1307_24_COMPLIM2			0x24
+#define SMA1307_25_COMPLIM3			0x25
+#define SMA1307_26_COMPLIM4			0x26
+#define SMA1307_27_BROWN_OUT_PROT4		0x27
+#define SMA1307_28_BROWN_OUT_PROT5		0x28
+#define SMA1307_29_BROWN_OUT_PROT12		0x29
+#define SMA1307_2A_BROWN_OUT_PROT13		0x2A
+#define SMA1307_2B_BROWN_OUT_PROT14		0x2B
+#define SMA1307_2C_BROWN_OUT_PROT15		0x2C
+#define SMA1307_2D_BROWN_OUT_PROT6		0x2D
+#define SMA1307_2E_BROWN_OUT_PROT7		0x2E
+#define SMA1307_2F_BROWN_OUT_PROT16		0x2F
+
+#define SMA1307_30_BROWN_OUT_PROT17		0x30
+#define SMA1307_31_BROWN_OUT_PROT18		0x31
+#define SMA1307_32_BROWN_OUT_PROT19		0x32
+#define SMA1307_34_OCP_SPK			0x34
+#define SMA1307_35_FDPEC_CTRL0			0x35
+#define SMA1307_36_PROTECTION			0x36
+#define SMA1307_37_SLOPECTRL			0x37
+#define SMA1307_38_POWER_METER			0x38
+#define SMA1307_39_PMT_NZ_VAL			0x39
+#define SMA1307_3B_TEST1			0x3B
+#define SMA1307_3C_TEST2			0x3C
+#define SMA1307_3D_TEST3			0x3D
+#define SMA1307_3E_IDLE_MODE_CTRL		0x3E
+#define SMA1307_3F_ATEST2			0x3F
+#define SMA1307_8B_PLL_POST_N			0x8B
+#define SMA1307_8C_PLL_N			0x8C
+#define SMA1307_8D_PLL_A_SETTING		0x8D
+#define SMA1307_8E_PLL_P_CP			0x8E
+#define SMA1307_8F_ANALOG_TEST			0x8F
+
+#define SMA1307_90_CRESTLIM1			0x90
+#define SMA1307_91_CRESTLIM2			0x91
+#define SMA1307_92_FDPEC_CTRL1			0x92
+#define SMA1307_93_INT_CTRL			0x93
+#define SMA1307_94_BOOST_CTRL9			0x94
+#define SMA1307_95_BOOST_CTRL10			0x95
+#define SMA1307_96_BOOST_CTRL11			0x96
+#define SMA1307_97_OTP_TRM0			0x97
+#define SMA1307_98_OTP_TRM1			0x98
+#define SMA1307_99_OTP_TRM2			0x99
+#define SMA1307_9A_OTP_TRM3			0x9A
+
+#define SMA1307_A0_PAD_CTRL0			0xA0
+#define	SMA1307_A1_PAD_CTRL1			0xA1
+#define SMA1307_A2_TOP_MAN1			0xA2
+#define SMA1307_A3_TOP_MAN2			0xA3
+#define SMA1307_A4_TOP_MAN3			0xA4
+#define SMA1307_A5_TDM1				0xA5
+#define SMA1307_A6_TDM2				0xA6
+#define SMA1307_A7_CLK_MON			0xA7
+#define SMA1307_A8_BOOST_CTRL1			0xA8
+#define SMA1307_A9_BOOST_CTRL2			0xA9
+#define SMA1307_AA_BOOST_CTRL3			0xAA
+#define SMA1307_AB_BOOST_CTRL4			0xAB
+#define SMA1307_AC_BOOST_CTRL5			0xAC
+#define SMA1307_AD_BOOST_CTRL6			0xAD
+#define SMA1307_AE_BOOST_CTRL7			0xAE
+#define SMA1307_AF_LPF				0xAF
+
+#define SMA1307_B0_RMS_TC1			0xB0
+#define SMA1307_B1_RMS_TC2			0xB1
+#define SMA1307_B2_AVG_TC1			0xB2
+#define SMA1307_B3_AVG_TC2			0xB3
+#define SMA1307_B4_PRVALUE1			0xB4
+#define SMA1307_B5_PRVALUE2			0xB5
+#define SMA1307_B8_SPK_NG_CTRL1			0xB8
+#define SMA1307_B9_SPK_NG_CTRL2			0xB9
+#define SMA1307_BA_DGC1				0xBA
+#define SMA1307_BB_DGC2				0xBB
+#define SMA1307_BC_DGC3				0xBC
+#define SMA1307_BD_MCBS_CTRL1			0xBD
+#define SMA1307_BE_MCBS_CTRL2			0xBE
+
+/* Status Register Read Only */
+#define SMA1307_F5_READY_FOR_V_SAR		0xF5
+#define SMA1307_F7_READY_FOR_T_SAR		0xF7
+#define SMA1307_F8_STATUS_T1			0xF8
+#define SMA1307_F9_STATUS_T2			0xF9
+#define SMA1307_FA_STATUS1			0xFA
+#define SMA1307_FB_STATUS2			0xFB
+#define SMA1307_FC_STATUS3			0xFC
+#define SMA1307_FD_STATUS4			0xFD
+#define SMA1307_FE_STATUS5			0xFE
+#define SMA1307_FF_DEVICE_INDEX			0xFF
+
+/* SMA1307 Registers Bit Fields */
+/* Power On/Off */
+#define SMA1307_POWER_MASK			(1<<0)
+#define SMA1307_POWER_OFF			(0<<0)
+#define SMA1307_POWER_ON			(1<<0)
+
+/* Reset */
+#define SMA1307_RESET_MASK			(1<<1)
+#define SMA1307_RESET_ON			(1<<1)
+
+/* Left Polarity */
+#define SMA1307_LEFTPOL_MASK			(1<<3)
+#define SMA1307_LOW_FIRST_CH			(0<<3)
+#define SMA1307_HIGH_FIRST_CH			(1<<3)
+
+/* SCK Falling/Rising */
+#define SMA1307_SCK_RISING_MASK			(1<<2)
+#define SMA1307_SCK_FALLING_EDGE		(0<<2)
+#define SMA1307_SCK_RISING_EDGE			(1<<2)
+
+/* SPK Mute */
+#define SMA1307_SPK_MUTE_MASK		(1<<0)
+#define SMA1307_SPK_UNMUTE			(0<<0)
+#define SMA1307_SPK_MUTE			(1<<0)
+
+/* SPK Mode */
+#define SMA1307_SPK_MODE_MASK		(7<<2)
+#define SMA1307_SPK_OFF				(0<<2)
+#define SMA1307_SPK_MONO			(1<<2)
+#define SMA1307_SPK_STEREO			(4<<2)
+
+/* Mono Mix */
+#define SMA1307_MONOMIX_MASK (1<<0)
+#define SMA1307_MONOMIX_OFF (0<<0)
+#define SMA1307_MONOMIX_ON (1<<0)
+
+/* LR Data Swap */
+#define SMA1307_LR_DATA_SW_MASK	(1<<4)
+#define SMA1307_LR_DATA_SW_NORMAL (0<<4)
+#define SMA1307_LR_DATA_SW_SWAP (1<<4)
+
+/* PLL On/Off */
+#define SMA1307_PLL_MASK			(1<<6)
+#define SMA1307_PLL_ON				(0<<6)
+#define SMA1307_PLL_OFF				(1<<6)
+
+/* Input Format */
+#define SMA1307_I2S_MODE_MASK		(7<<4)
+#define SMA1307_STANDARD_I2S		(0<<4)
+#define SMA1307_LJ					(1<<4)
+#define SMA1307_RJ_16BIT			(4<<4)
+#define SMA1307_RJ_18BIT			(5<<4)
+#define SMA1307_RJ_20BIT			(6<<4)
+#define SMA1307_RJ_24BIT			(7<<4)
+
+/* Controller / Device Setting */
+#define SMA1307_CONTROLLER_DEVICE_MASK	(1<<7)
+#define SMA1307_DEVICE_MODE			(0<<7)
+#define SMA1307_CONTROLLER_MODE			(1<<7)
+
+/* Port Config */
+#define SMA1307_PORT_CONFIG_MASK	(3<<6)
+#define SMA1307_INPUT_PORT_ONLY		(0<<6)
+#define SMA1307_OUTPUT_PORT_ENABLE	(2<<6)
+
+/* SDO Output */
+#define SMA1307_SDO_OUTPUT_MASK		(1<<3)
+#define SMA1307_LOGIC_OUTPUT		(0<<3)
+#define SMA1307_HIGH_Z_OUTPUT		(1<<3)
+#define SMA1307_DATA_CLK_SEL_MASK	(3<<6)
+#define SMA1307_SDO_DATA		(0<<6)
+#define SMA1307_SDO_CLK_PLL		(1<<6)
+#define SMA1307_SDO_CLK_OSC		(3<<6)
+
+/* SDO Output2 */
+#define SMA1307_SDO_OUTPUT2_MASK	(1<<0)
+#define SMA1307_ONE_SDO_PER_CH		(0<<0)
+#define SMA1307_TWO_SDO_PER_CH		(1<<0)
+
+/* SDO Output3 */
+#define SMA1307_SDO_OUTPUT3_MASK	(1<<2)
+#define SMA1307_SDO_OUTPUT3_DIS		(0<<2)
+#define SMA1307_TWO_SDO_PER_CH_24K	(1<<2)
+
+/* SDO OUT1 Select*/
+#define SMA1307_SDO_OUT1_SEL_MASK	(7<<3)
+#define SMA1307_SDO1_DISABLE		(0<<3)
+#define SMA1307_SDO1_FORMAT_C		(1<<3)
+#define SMA1307_SDO1_MONO_MIX		(2<<3)
+#define SMA1307_SDO1_AFTER_DSP		(3<<3)
+#define SMA1307_SDO1_VRMS2_AVG		(4<<3)
+#define SMA1307_SDO1_VBAT_MON		(5<<3)
+#define SMA1307_SDO1_TEMP_MON		(6<<3)
+#define SMA1307_SDO1_AFTER_DELAY	(7<<3)
+
+/* SDO OUT0 Select*/
+#define SMA1307_SDO_OUT0_SEL_MASK	(7<<0)
+#define SMA1307_SDO0_DISABLE		(0<<0)
+#define SMA1307_SDO0_FORMAT_C		(1<<0)
+#define SMA1307_SDO0_MONO_MIX		(2<<0)
+#define SMA1307_SDO0_AFTER_DSP		(3<<0)
+#define SMA1307_SDO0_VRMS2_AVG		(4<<0)
+#define SMA1307_SDO0_VBAT_MON		(5<<0)
+#define SMA1307_SDO0_TEMP_MON		(6<<0)
+#define SMA1307_SDO0_AFTER_DELAY	(7<<0)
+
+/* INTERRUPT Operation */
+#define SMA1307_SEL_INT_MASK		(1<<2)
+#define SMA1307_INT_CLEAR_AUTO		(0<<2)
+#define SMA1307_INT_CLEAR_MANUAL	(1<<2)
+
+/* INTERRUPT CLEAR */
+#define SMA1307_CLR_INT_MASK		(1<<1)
+#define SMA1307_INT_READY			(0<<1)
+#define SMA1307_INT_CLEAR			(1<<1)
+
+/* INTERRUPT Disable */
+#define SMA1307_DIS_INT_MASK		(1<<0)
+#define SMA1307_NORMAL_INT			(0<<0)
+#define SMA1307_HIGH_Z_INT			(1<<0)
+
+/* Interface Control */
+#define SMA1307_INTERFACE_MASK		(7<<5)
+#define SMA1307_LJ_FORMAT			(1<<5)
+#define SMA1307_I2S_FORMAT			(2<<5)
+#define SMA1307_TDM_FORMAT			(4<<5)
+
+#define SMA1307_SCK_RATE_MASK		(3<<3)
+#define SMA1307_SCK_64FS		(0<<3)
+#define SMA1307_SCK_32FS		(2<<3)
+
+#define SMA1307_DATA_WIDTH_MASK		(3<<1)
+#define SMA1307_DATA_24BIT		(0<<1)
+#define SMA1307_DATA_16BIT		(3<<1)
+
+#define SMA1307_TDM_TX_MODE_MASK		(1<<6)
+#define SMA1307_TDM_TX_MONO		(0<<6)
+#define SMA1307_TDM_TX_STEREO		(1<<6)
+
+#define SMA1307_TDM_SLOT0_RX_POS_MASK (7<<3)
+#define SMA1307_TDM_SLOT0_RX_POS_0 (0<<3)
+#define SMA1307_TDM_SLOT0_RX_POS_1 (1<<3)
+#define SMA1307_TDM_SLOT0_RX_POS_2 (2<<3)
+#define SMA1307_TDM_SLOT0_RX_POS_3 (3<<3)
+#define SMA1307_TDM_SLOT0_RX_POS_4 (4<<3)
+#define SMA1307_TDM_SLOT0_RX_POS_5 (5<<3)
+#define SMA1307_TDM_SLOT0_RX_POS_6 (6<<3)
+#define SMA1307_TDM_SLOT0_RX_POS_7 (7<<3)
+
+#define SMA1307_TDM_SLOT1_RX_POS_MASK (7<<0)
+#define SMA1307_TDM_SLOT1_RX_POS_0 (0<<0)
+#define SMA1307_TDM_SLOT1_RX_POS_1 (1<<0)
+#define SMA1307_TDM_SLOT1_RX_POS_2 (2<<0)
+#define SMA1307_TDM_SLOT1_RX_POS_3 (3<<0)
+#define SMA1307_TDM_SLOT1_RX_POS_4 (4<<0)
+#define SMA1307_TDM_SLOT1_RX_POS_5 (5<<0)
+#define SMA1307_TDM_SLOT1_RX_POS_6 (6<<0)
+#define SMA1307_TDM_SLOT1_RX_POS_7 (7<<0)
+
+/* TDM2 FORMAT : 0xA6 */
+#define SMA1307_TDM_DL_MASK	(1<<7)
+#define SMA1307_TDM_DL_16	(0<<7)
+#define SMA1307_TDM_DL_32	(1<<7)
+
+#define SMA1307_TDM_N_SLOT_MASK	(1<<6)
+#define SMA1307_TDM_N_SLOT_4	(0<<6)
+#define SMA1307_TDM_N_SLOT_8	(1<<6)
+
+#define SMA1307_TDM_SLOT0_TX_POS_MASK	(7<<3)
+#define SMA1307_TDM_SLOT0_TX_POS_0	(0<<3)
+#define SMA1307_TDM_SLOT0_TX_POS_1	(1<<3)
+#define SMA1307_TDM_SLOT0_TX_POS_2	(2<<3)
+#define SMA1307_TDM_SLOT0_TX_POS_3	(3<<3)
+#define SMA1307_TDM_SLOT0_TX_POS_4	(4<<3)
+#define SMA1307_TDM_SLOT0_TX_POS_5	(5<<3)
+#define SMA1307_TDM_SLOT0_TX_POS_6	(6<<3)
+#define SMA1307_TDM_SLOT0_TX_POS_7	(7<<3)
+
+#define SMA1307_TDM_SLOT1_TX_POS_MASK	(7<<0)
+#define SMA1307_TDM_SLOT1_TX_POS_0	(0<<0)
+#define SMA1307_TDM_SLOT1_TX_POS_1	(1<<0)
+#define SMA1307_TDM_SLOT1_TX_POS_2	(2<<0)
+#define SMA1307_TDM_SLOT1_TX_POS_3	(3<<0)
+#define SMA1307_TDM_SLOT1_TX_POS_4	(4<<0)
+#define SMA1307_TDM_SLOT1_TX_POS_5	(5<<0)
+#define SMA1307_TDM_SLOT1_TX_POS_6	(6<<0)
+#define SMA1307_TDM_SLOT1_TX_POS_7	(7<<0)
+
+/* OTP Trim SPK Offset */
+#define SMA1307_SPK_OFFS2_MSB_MASK	(1<<5)
+#define SMA1307_SPK_OFFS2_MASK		(31<<0)
+
+/* OTP Trim RCV Offset */
+#define SMA1307_RCV_OFFS2_MSB_MASK	(1<<7)
+#define SMA1307_RCV_OFFS2_MASK		(15<<4)
+#define SMA1307_RCV_OFFS2_DEFAULT (0<<4)
+
+/* OTP STATUS */
+#define SMA1307_OTP_STAT_MASK		(1<<6)
+#define SMA1307_OTP_STAT_0			(0<<6)
+#define SMA1307_OTP_STAT_1			(1<<6)
+
+/* STATUS */
+#define SMA1307_OT1_OK_STATUS		(1<<7)
+#define SMA1307_OT2_OK_STATUS		(1<<6)
+#define SMA1307_UVLO_STATUS			(1<<5)
+#define SMA1307_OVP_BST_STATUS		(1<<4)
+#define SMA1307_POWER_FLAG			(1<<3)
+
+#define SMA1307_SCAN_CHK			(1<<7)
+#define SMA1307_OCP_SPK_STATUS		(1<<5)
+#define SMA1307_OCP_BST_STATUS		(1<<4)
+#define SMA1307_BOP_STATE			(7<<1)
+#define SMA1307_CLK_MON_STATUS		(1<<0)
+
+#define SMA1307_DEVICE_ID			(3<<3)
+#define SMA1307_REV_NUM_STATUS		(3<<0)
+#define SMA1307_REV_NUM_REV0		(0<<0)
+#define SMA1307_REV_NUM_REV1		(1<<0)
+
+#endif
-- 
2.39.2

