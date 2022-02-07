Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 469004AC3BF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 16:34:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C671B1841;
	Mon,  7 Feb 2022 16:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C671B1841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644248046;
	bh=Mq106m8yyKX3YIQVfps5ge1Yi6S8qgsZvMGmU0HEAgc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EwL+hcbk73MaDFIj1gSAIM6ozzGtjqmMTRihOQKC79ePKlZgNkpE/pN6lebTwj0Be
	 G8w9bGmwVP/WXrmiNyh8ffs4nhIJj8+0qf/+MAhq8dmNTkpLQIVM/cM5skHqJJ+nEm
	 QeGCUiFQIuqoucOXNAP7odrpZ99tOWPYztJL4qrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31235F80246;
	Mon,  7 Feb 2022 16:33:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19E16F80240; Mon,  7 Feb 2022 16:32:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:4023::711])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 648A4F800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 16:32:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 648A4F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="gKxBujAN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RImreoTtt4L4qvbQU22DswzkSDlAs0LNfZOuFPoZKQaEBQH/lUOEFjf0Xbp6pLOqww25souY8i0MuLjUfMmlVHak2unn75xB3Yv5qLCUS5H5aABPoZglAys0Ud97WkMnZIVX17zTU8yTYzXYuBZhHWkt1eESo3eAWAtApxtXwlLXK0zaEm8kPA59hl+Z+W64OtO7dRTmM3FM9xMf8t9/vPHe6RY1fEB6v0JhqbGvSGylChq+dmGftciW4iFstMt1gAvzmIMB7wOrYW/uTBLOlGYvJPKv6TFMEz6j4+vaoYhy1Bac1x8S5QPLC0utf58JnBXwgM7tRsHT3Nm+QQvqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwarZf0agzyoz0h/pitzgDlVs69f4zOz9ZhS91eVGE8=;
 b=Hcz7Kd3g913BcmISix6v8wAucDMsp1mTfLY3G1NX6DzVdMI49JWLnB957vrGH1sRvVgO4jKyRb9bqwRpNiVmsqG2m+QQk+67BtP5gK6W5HnFQFJudVL446itndh28kRui6DgQyhFpBCazrrtSLFKJPKR3QYk1bg7YaQvpemmdrV+VdakiSlpHSjeUQv5qP/7Q2Oq+xeL4GcrqhOcZ8F1fPmoPTfzIfsjaGBEbqh5juWpGN1ol9jgviiudmlRGi3buyToAnONI+o7fgrY4iFhi6IkbciJgcOQ7ZujnU0C2ab2mOSoYvAxukG2cF55NySdOXdXGuplxzpO4EhhuGU9Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwarZf0agzyoz0h/pitzgDlVs69f4zOz9ZhS91eVGE8=;
 b=gKxBujANAPgO9iQwHY5bwpe/6BAdztdJFprJCqgVhloHenrfRIjbqSE9DK7PasI2+mEwYBVQhmWLUZ60oxQ3T80jbWC7DhjlPxe97/7bwyOlsgTvaLqMvBA8k2PkmCUdyZdvgRwL728U270XjDWf16vo/Kb7MDN2fH98xQsY3c8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3d::11)
 by GV0P278MB0720.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 15:32:49 +0000
Received: from ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c4e:9890:b0f5:6abb]) by ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c4e:9890:b0f5:6abb%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 15:32:49 +0000
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1] ASoC: nau8822: export right speaker inversion
Date: Mon,  7 Feb 2022 16:32:29 +0100
Message-Id: <20220207153229.1285574-1-francesco.dolcini@toradex.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:26::15) To ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:3d::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a43b187-09be-4987-75f5-08d9ea4f190b
X-MS-TrafficTypeDiagnostic: GV0P278MB0720:EE_
X-Microsoft-Antispam-PRVS: <GV0P278MB072003B48A7B572F0E75858AE22C9@GV0P278MB0720.CHEP278.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMgLgTlE72Rw1NRMfie2auSDJll+BAF/D+dZ8gj3WPWun6nRxzlTe+j3kxaBUw0d9ltYDJ3Ln5OzW5ui6cPzaH1vpTRzRFh9ztY6PsNELsp3ESj3yILDkXKuavTskUEwc7CnS26QDBZfGOz4WOEO2SjcpU2XqCm3c/cWXkvYkp3qnqfTC/9Ot7xfDVoKkgH6Kc8DfTqsZzJjmMgdOd46eVDU8NELDd1XSQflXbBAQNkYQ2AW0z5j8AVh0R2lObWJJR+J+J5mKah60Vz29HV61pV5jJfRiE+k9U5Oh1LNpvc5U9XIqrYYH+uazm6SoZZodVFtd+B6cyrHflCGNvt3WyIR7HSlNkUq5JsvYpT+6qiAwIlOGNVEjBXlkVKQDp1pEJTv91BG1lhI5TMWKEhZidn8fgXmghup2zAy3hPQyNZg5tuqlkf5LSTvfKoMosRHaUPO0iemLv4CVQqMbKjfTgccwxYphN8OlU+opPQVIWEDFZlk7fm4ckR09emfKMDk78SoPoGmL+9KT0wxtFSRvuSCe3sB7gNQ8bU3UI+TQgoLPlaM1lRjRARY5PUMPuEhOoXdhrQjEIFsVap0hGFeOSIZEJ/dIU5Zxdc7XSWotXr6s3WzJ6mCEAGmyuaZBohaZFwmtjtanpRHpYSAEEnitvvM4DtVkJ78rrY4114tuBeiE4a0jowf7DbfL/5/etCdiuH2zoP9o7yiC2z6d260qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(2616005)(1076003)(8676002)(8936002)(107886003)(66476007)(26005)(4326008)(36756003)(66556008)(6486002)(186003)(508600001)(44832011)(316002)(38350700002)(38100700002)(6506007)(6666004)(110136005)(4744005)(5660300002)(86362001)(66946007)(54906003)(2906002)(6512007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4DT+G3W/RIHoze4bYyemxf3RV+IkDqVQ5wFjbHX5HYAdp5YxejHhLy7r2x2J?=
 =?us-ascii?Q?/CJuOvyYlrfm23+gBoZMegtyEVSizgPrX5KoiXXmwYdN5iorNkF7HnqbTiqx?=
 =?us-ascii?Q?9kM0bM87XwVj6ZXDblNGnCS6J72mq7F1XKBux39ZBSSjkBgjddarYwLYWl15?=
 =?us-ascii?Q?us78+kuOlNSJGzlOgJbsJmf1o3EmsDrg5/8B65shbJMQkWaHKibAsamd/P0l?=
 =?us-ascii?Q?rV/EbbW144T4VF77JqYucF2Cge8yt81XbaceXEFA/mjskA3JRETGWBY0Sboi?=
 =?us-ascii?Q?uoJh51e5Z57Kap3BwUOlQ4q8sZE5un0TtJ+148H/fT6WPumrZ4pBMFWG/e1b?=
 =?us-ascii?Q?zBVVg+ztdADyOKxAOujNyIVv/fII4XZjBwU8Jz15/MZM4OAry9EHxgWuZPVr?=
 =?us-ascii?Q?08v8viYR7oK+dyJTVRZZdGPJfbbwl80NlXyB05+ZVe7DI0pBrXF4P3WdUZ7r?=
 =?us-ascii?Q?w1jj6NcZu2J0RpMlwHmEdbGAWl2VJKC7srts8KMgP1ddjmkh++GVn1FFyLaJ?=
 =?us-ascii?Q?91D6AFT2SLN1CSLrS5qAwDSk5W8Y/aWJtMaf1h33uhdHb1z6kLvDYU+QZpvv?=
 =?us-ascii?Q?FpiFAD7JquEAGNHeSw/fHWwOclO1YgdNVyS0ynzzKJn2LHGYtx2pycD57LQo?=
 =?us-ascii?Q?C4/ChP9BUmsRPsIsRiQlmEIXZdOwgpqR1Bnda2U8QliFExrPc8ph0KSemphg?=
 =?us-ascii?Q?SinbsnifnMAk+Q4JBsCu7Nv1aUR5E8VB50NZtsNAIAaF5OMRlJeBuXNgEFOX?=
 =?us-ascii?Q?10Mp44gJrot7LHhg7q4FDJOmhkngQwlM8XRassqp0JhUtWSfi42OiLJpr6c3?=
 =?us-ascii?Q?C4d4Pq3MLa/Wcau6aJCwTC22HcLH0kzNRLJh/ldkyBzVVaeBdKQ9zZFWylze?=
 =?us-ascii?Q?j17uxlWwveVVdl20xQ54XttuKY7q1tU2gIzh6XeidazfCfZnGah7SMbpcXPd?=
 =?us-ascii?Q?JQHITqtDJD/HZA0Ud9Yy7RIdGCnCNLGdBDWnUIAPTbiCcy16qJbeP2g6mnce?=
 =?us-ascii?Q?JePZJDOVCp+XJoR6iGiB0hZeKTpSFxsAncwPU+28KDjP7d2ebMYj0qFJe87y?=
 =?us-ascii?Q?K4op6Jp0jKjxtF8Yb7kxN9HvizGeofvy+Yw+4W6rmDX7uHm2uXpl7KHP2Y48?=
 =?us-ascii?Q?hJ9Yky4XwOAwhrSiXzEhSgUkKPd2DLsQMwo4MsivYkgf+311X6fHZTuGhxbE?=
 =?us-ascii?Q?Us6lNKUEuoRKXZHTsjax+g39eTh1AcQmARjRLZ+/GCSev7Q1NFAe7xW511Bt?=
 =?us-ascii?Q?da+UO6WlaJq/4ItyYJHitETNCtOx91ygi4Lv3gSgQKM6UmrYBdIoPjkcAOcE?=
 =?us-ascii?Q?vzgqV3y2jmUkX/lW7z7rM6GIjOFhewNwd72NHeRtYqf5xvdNBlOIniPT2P6r?=
 =?us-ascii?Q?rxKpqCffVgvygrdLgTeObTx9N6pJPebdxmjfCpJe4oWX6l2u+Ivo0YVvmB8n?=
 =?us-ascii?Q?Zg0ZzWHwTvZtdOowbgJhLv5GeuUDTsNhzi8eXJxG2ZMuFILtIUCSFiDJUg9+?=
 =?us-ascii?Q?wvVFZfaG/tyzHalpeRqHY1Jjmho5ZP+MAmCXJ1esDPxNKXayj7EBIVJA5Yqq?=
 =?us-ascii?Q?AA63eRsAF/9wHuWzV3mcjo0Pqs1wrdhe7ahBJg//A/0XgwxZI9uFu5ICVD2X?=
 =?us-ascii?Q?HHmkD63YNjHW6XLITAKaDHKnEbXnAdu/l2irEwWqt6LepjVpZbaFuur7IXum?=
 =?us-ascii?Q?di0m3A=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a43b187-09be-4987-75f5-08d9ea4f190b
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 15:32:49.4070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLPnxnVA+IzUPSrQHfcOxwABzlmP+aV8ZWq7Mhuz6JFoT5HC40o5XuOyx8AjHQUv0TwXzA/eZYR5yZ0GQ57WtpaqgcUm1d+vGx6iUh+2Bg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0720
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 alsa-devel@alsa-project.org, Max Krummenacher <max.krummenacher@toradex.com>
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

From: Max Krummenacher <max.krummenacher@toradex.com>

This control inverts the signal fed to the right amplifier.
This allows to connect one loudspeaker to the two speaker amplifiers
in a bridge-tied load configuration getting higher output power.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 sound/soc/codecs/nau8822.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 58123390c7a3..bf1155903421 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -351,6 +351,8 @@ static const struct snd_kcontrol_new nau8822_snd_controls[] = {
 		NAU8822_REG_LHP_VOLUME,
 		NAU8822_REG_RHP_VOLUME,	0, 63, 0, spk_tlv),
 
+	SOC_SINGLE("Speaker RInversion Switch",
+		NAU8822_REG_RIGHT_SPEAKER_CONTROL, 4, 1, 0),
 	SOC_DOUBLE_R("Speaker ZC Switch",
 		NAU8822_REG_LSPKOUT_VOLUME,
 		NAU8822_REG_RSPKOUT_VOLUME, 7, 1, 0),
-- 
2.25.1

