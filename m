Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A09A1B7A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2024 09:16:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C528850;
	Thu, 17 Oct 2024 09:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C528850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729149376;
	bh=KUsCoUYyDybkNPGMPDQVDsU7fBDAkbrj9PG+lpN7EvY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Bzj3K1QsNBBu0zTTHF3wV/6LS1Ne476aUK/uWUl7MQsPdRvoK8zLL69m7nxhe3k4X
	 AmZLasiEMquODpU3S2sC91VQVmFd1w7QFKlqHO5xQQ9sRZoggalB3vnpm1yTcPGqqx
	 Ve4z9T76aE/RcQdXlzOuTp7mOy6sGV8Z51JrSN+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE823F80587; Thu, 17 Oct 2024 09:15:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A5AF805B1;
	Thu, 17 Oct 2024 09:15:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A11E8F80448; Thu, 17 Oct 2024 09:15:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDF0AF800ED
	for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2024 09:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDF0AF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=R9Tw8Uk4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BG2mURpfPn3nbFS3ZirK7HcXd87VMKkFUgbQNbq5fORfutwNV4k7l/Qw1HxFO16Pok/S5Kkm5zzVgSf7BEVcryWdu3OBTcKhjM9ABKRuMiFFRK1OBWfchstPT1qKodMPFx/4xWof9M0ZqrEslz8yjsRjxT9r8dR1L/XVV3mp+Wq4FzGHwOzT+7L2UvzZ2zLgt5beUVNezo0/fiEr9rcCgXy+N6uLV4GP07ptaxhfvXD1HW/Ygbq4sW4yw8h0ny+eswOfjL29dYXP59dt4Xo+Rw5jqre59dHc0o0yX3g760Ej7EzWSh01+RrXzp1kLJsQ4jqV6cX2HYbQHcHqDvyOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7D5uQvaJFgBhREp0ee0pjS08ILe8OOGgHY9pc6BLlB4=;
 b=R/LBHTGSOfWPFPWz+YY9o67eUuxMkZ8SPxqDJ840gCng0E8c4uLtHA887/YuJmAO8qK/4vGUQRl8p3CSC9tzNlpLCAjwPFB+eMawPRhgAJ0MHHkkHLVNHw729JmPQLrxJ8JO48b3Gvw17QB9hiUzQIATJRZGxIpF/NDZjRfpNU5VTs18oL/QvCq5gEuPZZaz5a1/zKgL2v9EPxN/jKO546QZvUD+3D1xM4C3jKMBpj6UyQ+iJHxs3QBEwmbuPWGOk4wowX4H/iTVMxTkyqKrswH/bMhfbb5/r0aHJDFuNMj5Hq4UuGvTLQHNID6AsXCzyS6pKzMEUWrcA0pXq0QVTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7D5uQvaJFgBhREp0ee0pjS08ILe8OOGgHY9pc6BLlB4=;
 b=R9Tw8Uk4N3TAVGch2Oz6XQaBsg/ciqqhtKsUgl/eZQH6f36aY04v0MnSsDkob3pk36u+lnSddX9j0FSwz/7iPsMwvGu02ONqLTd2vUdgLSq/xaaIoPcdsk/zX7wiiPR++JfpIqLfD1p9WgoMJubXMqr61Q94NXuNqk43bj9T5/FZBaIWduzVCl8SJTNcbqvz/jgIAOoiaHN1Ac0pjop2M3X7sE1wJGv+W1Ub5S9mgtIndjVBkOmJr2tJtXtAxSojy3L9WC9xJVT4nk+e4t8bSIk1QNeKrP3Ty5z3T1bPv1DEQs2y5Wz/f8SBWpaLlcRQ0MnazZFR4yxRxX+Ho5wiZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by PA4PR04MB7631.eurprd04.prod.outlook.com (2603:10a6:102:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 07:15:32 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%3]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 07:15:32 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH] ASoC: fsl_micfil: Add a flag to distinguish with different
 volume control types
Date: Thu, 17 Oct 2024 16:15:07 +0900
Message-ID: <20241017071507.2577786-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.46.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|PA4PR04MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c8298d-bbd0-42ba-cd7c-08dcee7b7ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GEKE2pW+6VSrnumyVsh87D4QUS+Vl8d121qHpCxKqn1jyKvRTfQi1HYYJD5c?=
 =?us-ascii?Q?20AFSx/bYecdMI6a/UVTYHRMDvZ+zjc5bRAzL81f/IKx6mHS1Lz2B/hLw/Jl?=
 =?us-ascii?Q?Knzk/Ji095F/4tB4YdI18T+yyoQeHVblnUSltri1nrZkS2E+sjwjrDyrivyD?=
 =?us-ascii?Q?l72hq9KVO73wsWlt88X7fLHYC8dbOho6bNbfv53hsN2qvfjw0jYOwodXQ6eG?=
 =?us-ascii?Q?TeS9XlGOKEoaT6DaWVKN1m12kWHIvC+uL0HILnxBFzcVZiy0OjxYBwEC2B3b?=
 =?us-ascii?Q?+r9uwMOqR/CPMovSAabWEHtLl/x1/1ehkTEgDD8az8Z9+yvWyQZuRKvQF2SE?=
 =?us-ascii?Q?h/FFLv78I1FnCzTCD1wjn4reMe31TkyQ1g8DG78Uew2wq/2qE1cpJECK2Uz1?=
 =?us-ascii?Q?hSIga+/mYMsyeMzcjAf+oUpY1V0oNa9cUGLwRrei1Z2OjAqEcbrYrGQM6qR5?=
 =?us-ascii?Q?U9KqI3qxelG3YjOiJRCn7WWZOQi0a9nqWYhBBKXIxA1JglgJM1rUy1/aiHfl?=
 =?us-ascii?Q?h0K+FizkY+LEs0XY3p+Gd1YH5MyDnCsBuA+zRlUDENVXRg6+ZgFuzBR082so?=
 =?us-ascii?Q?r5R1tuncfq2nI1wHgkPeWwjUh9gE6v16BrucmPq8qZIgfjVqw3v8HdVNghob?=
 =?us-ascii?Q?bZ6n5bDkNzXRu7q3vw3oGHyl1iXSld1o1trIH78zu2P4ojwKhoG57gqyP9ew?=
 =?us-ascii?Q?2jOftqggjt8p9+mguI+C9YHsazvyxEC30tqhtFlgq3tZmIMpnOLGFEj36JHs?=
 =?us-ascii?Q?xrm30V7s6NqvCBj+B9qXCo1C9X6icu59adJI948O0t7m+4gfFBJkEpq0KIBf?=
 =?us-ascii?Q?Z90mIZAJ9Kdr5S2sV3j3WFcT6hTtUhBLfApTW2fROQ4GeLs3fRuZDACSXYon?=
 =?us-ascii?Q?na+8yC2oTHU2q3TvZPdzaO8NQZO0SWPuoBdEagKi9QWTID8Hg5du+lXF+Mop?=
 =?us-ascii?Q?Rab/LDRGPKTy2vFfsffh9jK8zKQh/epDWX4WkFf8djv9sNRz7d2kkg8J0xDy?=
 =?us-ascii?Q?sRRN/vUoWePrbWygf9GqaW7e+6DHP2wkj57Uexe5zsTwEDEOUesjQkB1r1TQ?=
 =?us-ascii?Q?fmax/E+u4vnAC2RRi3wSug79SISQ89lqqH5MeZbW6IfUhEi/TUGi9e4MEtJg?=
 =?us-ascii?Q?zf5Mn3PpVF8mLV8K95IkO2vSFq26E5AMvHLPUkr5vQuH4PP/ID81x5365YiT?=
 =?us-ascii?Q?3wG/L3dYqWQ1BQCjj+kbRsgIAyy80jZd64+W5QpZRC9yQ+0xcrcn5QhZeoqI?=
 =?us-ascii?Q?RK5gVRXLtVqLOY1ATy+zPs+eaC3Nf+pepjl2Cs/CY64JpG+946E9RmZkwhK8?=
 =?us-ascii?Q?9CVSpGOAesnFZKXkOu4KWKlIwBvfMPzAC3jBndOqb+eFqg/yNyYU2KnCv1sq?=
 =?us-ascii?Q?D26Jp3h7i0GysIjs48ARuEyfB3ly?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZTGfk+ehJ28pbYSaONghFQa+fj9jHfGRc3KnA6Kw/OfFLoccZLSq0WAptvc8?=
 =?us-ascii?Q?6qR6R44pxfI5aqe/gUfB1qnr5kNrPhG8rQoCkK1yCFi/T/e3ZDY6oevJDtCm?=
 =?us-ascii?Q?/23skzAEdLkI6x/zbGOKrWxsaGnQjmEq8aArbxO2JZPG0yaZxTf2ba2WIehQ?=
 =?us-ascii?Q?6G8RuSPcMsM098f7e/U6dqeNk2gG56jVdjXMLbvWTpUehzrceleKrl+P73jI?=
 =?us-ascii?Q?fHpn1j7FvSdPkCk7A1Z5emzafUtKZdS2Y/7kw+jsg0wSqLrJCvFkB7J/mOC8?=
 =?us-ascii?Q?++x7lnuOVtqBd5FisAqFRZJxyLsUaou5eCsbkr6TuXXeazWbOveZ40H1iB82?=
 =?us-ascii?Q?8QlBQJfmZCyPtHTJC8DvhAO7Es8OXlPS48ZSxNuvrd5QQ1Px/sbucpyApc2q?=
 =?us-ascii?Q?1PtYZufti+LQDC5QDA/jsA1myANSiK3q8KwTAQ6M4MOv3YhBqAC63NgJQvOd?=
 =?us-ascii?Q?Zv4wL56zvBvWAUJPEaKJ2+bC0m3Ac5aQadd7miKhIir5BLJiMPAt8GXFV4b/?=
 =?us-ascii?Q?4A9dDoAoSArWLgwSlHgTOlHvfmXeuJcl5VrEmMCSFwOkrIpOKv9GWJurzT9O?=
 =?us-ascii?Q?ob+t+dKQjMVveqhF4N+RPsIh72aX7nJpehiap+Ozf+y1kn17pu/kDFEow/jx?=
 =?us-ascii?Q?VOSWWS7pRqHxv5R4DdWzKFfQ1fdXU+nCjRcik+RnHOOFA7ukm8z/vrxH5OVk?=
 =?us-ascii?Q?2TtFTv3CCLyu22fC4S9tiCq7aFJB64lP1gs0wuqnWELfcoBjSopoAvZLvNcU?=
 =?us-ascii?Q?HxQbrgmEjk335Hy34KAnYsrTAl+P84GQKz9m/Td0NXghwywwiO+TAR6VYyvg?=
 =?us-ascii?Q?2BiLWG69WdKGysOzsFD9UbMNqPxqBOO7RCRbuS2+AGHcfmcpioQT1M7uW7Q1?=
 =?us-ascii?Q?0rZQEOCtjgQ5uVGOnD28d+0buSlbr+YzfgOZS1uc+M4+A7Ozpjl/NP84g3Ni?=
 =?us-ascii?Q?RQ36OKKtlWT8eH2hq+q2XjrCbiqMsy742dQ9qa0jrLz7LKVWJ4grf3LPmQ7I?=
 =?us-ascii?Q?dNQP7rVqDiP+kDBcATeqeVtbRezE+P1FameP5oS8xa0pvyeyHSIlBdvXNaIf?=
 =?us-ascii?Q?Uz6/Q/TTJgsQ5/txAx3brmOQ2+I0Tm0yOB2UfsL0eISZJF7wRTXXV1peWN3T?=
 =?us-ascii?Q?olur6DNOSlZ0u81PEnclGMlAZav+gNp+fdfgG+MymTknFPhFSF8PoVWbC5NP?=
 =?us-ascii?Q?78r22xSVx5RZ0mAvj9pJiXXLQGAB0QjWqwSoxFJRzQsl8PFH8zMioWFKaOwK?=
 =?us-ascii?Q?tbFVUHGnt0JOtpuE4uTFPrUIIQ2XL3QigeLjwv5N0UxSmQa8noR+kF73Y9o1?=
 =?us-ascii?Q?TwMcS4fQfT4buGtBAtaHBevvNSErN/e/5gYgCTwLm3NXnKSm23zLazFBrpqj?=
 =?us-ascii?Q?HPQEOuQtIxTKtdniuAV6eNBLd9T2+YSEQ1/CwYX9Sz4CXX+rGcq1896Z+ZEn?=
 =?us-ascii?Q?+/3viPTKciVkfMvW1QO9hoVbPAhVKjw60rb+1zFQpWCjmesyab1H33AU29+u?=
 =?us-ascii?Q?icsr4PMQjJk8HqhDlz22Wj5yMANDGWSPxmH5kxIxyZHBVxPcCsi478p8edbg?=
 =?us-ascii?Q?CEPmdMTZsehUPykekhB3jUuOwqVAIYEORrqIjbRY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 28c8298d-bbd0-42ba-cd7c-08dcee7b7ce4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 07:15:32.5354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xHg/2uJmOyCLRKFBMwuTCk3t6DaGY2bepshMrVVfrRjLRd7Z5ASpHi7GelhLj0DqPxt0U1t8xJsqlxqUUocfTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7631
Message-ID-Hash: H4QBLSTOGBANJTJQVFU42AM3CHJ4RMEO
X-Message-ID-Hash: H4QBLSTOGBANJTJQVFU42AM3CHJ4RMEO
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4QBLSTOGBANJTJQVFU42AM3CHJ4RMEO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On i.MX8MM the register of volume control has positive and negative
values. It is different from other platforms like i.MX8MP and i.MX93
which only have positive values. Add a volume_sx flag to use SX_TLV
volume control for this kind of platform. Use common TLV volume control
for other platforms.

Fixes: cdfa92eb90f5 ("ASoC: fsl_micfil: Correct the number of steps on SX controls")
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 43 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 4161b674745b..0679d762f08a 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -78,6 +78,7 @@ struct fsl_micfil_soc_data {
 	bool imx;
 	bool use_edma;
 	bool use_verid;
+	bool volume_sx;
 	u64  formats;
 };
 
@@ -87,6 +88,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
 	.fifo_depth = 8,
 	.dataline =  0xf,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.volume_sx = true,
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
@@ -95,6 +97,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
 	.fifo_depth = 32,
 	.dataline =  0xf,
 	.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	.volume_sx = false,
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
@@ -105,6 +108,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
 	.formats = SNDRV_PCM_FMTBIT_S32_LE,
 	.use_edma = true,
 	.use_verid = true,
+	.volume_sx = false,
 };
 
 static const struct of_device_id fsl_micfil_dt_ids[] = {
@@ -328,7 +332,26 @@ static int hwvad_detected(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
+static const struct snd_kcontrol_new fsl_micfil_volume_controls[] = {
+	SOC_SINGLE_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0, gain_tlv),
+	SOC_SINGLE_TLV("CH1 Volume", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0, gain_tlv),
+	SOC_SINGLE_TLV("CH2 Volume", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0, gain_tlv),
+	SOC_SINGLE_TLV("CH3 Volume", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0, gain_tlv),
+	SOC_SINGLE_TLV("CH4 Volume", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0, gain_tlv),
+	SOC_SINGLE_TLV("CH5 Volume", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0, gain_tlv),
+	SOC_SINGLE_TLV("CH6 Volume", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0, gain_tlv),
+	SOC_SINGLE_TLV("CH7 Volume", REG_MICFIL_OUT_CTRL,
+		       MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0, gain_tlv),
+};
+
+static const struct snd_kcontrol_new fsl_micfil_volume_sx_controls[] = {
 	SOC_SINGLE_SX_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
 			  MICFIL_OUTGAIN_CHX_SHIFT(0), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH1 Volume", REG_MICFIL_OUT_CTRL,
@@ -345,6 +368,9 @@ static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 			  MICFIL_OUTGAIN_CHX_SHIFT(6), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH7 Volume", REG_MICFIL_OUT_CTRL,
 			  MICFIL_OUTGAIN_CHX_SHIFT(7), 0x8, 0xF, gain_tlv),
+};
+
+static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 	SOC_ENUM_EXT("MICFIL Quality Select",
 		     fsl_micfil_quality_enum,
 		     micfil_quality_get, micfil_quality_set),
@@ -844,6 +870,20 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static int fsl_micfil_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(component);
+
+	if (micfil->soc->volume_sx)
+		snd_soc_add_component_controls(component, fsl_micfil_volume_sx_controls,
+					       ARRAY_SIZE(fsl_micfil_volume_sx_controls));
+	else
+		snd_soc_add_component_controls(component, fsl_micfil_volume_controls,
+					       ARRAY_SIZE(fsl_micfil_volume_controls));
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
 	.probe		= fsl_micfil_dai_probe,
 	.startup	= fsl_micfil_startup,
@@ -865,6 +905,7 @@ static struct snd_soc_dai_driver fsl_micfil_dai = {
 
 static const struct snd_soc_component_driver fsl_micfil_component = {
 	.name		= "fsl-micfil-dai",
+	.probe		= fsl_micfil_component_probe,
 	.controls       = fsl_micfil_snd_controls,
 	.num_controls   = ARRAY_SIZE(fsl_micfil_snd_controls),
 	.legacy_dai_naming      = 1,
-- 
2.46.2

