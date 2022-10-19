Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF7603732
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C457BA82E;
	Wed, 19 Oct 2022 02:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C457BA82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139976;
	bh=ts9qgAGZ+NfUp8D0yN/ZbyZ5Yspjers7nlTJh0lV7Wk=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZlJl3gLeP09d2WXQJwLGprQyRuAWn0ML0P91TDM3k/UQfFIMvHOFMRq6VJ0J8pCe
	 vqAyDO4A3Tbh3Y7AOw3lr9y7L+VUdnvpaOK8eef31kktVdVD5XEo3C/vizPIDTeMUC
	 8eDiskIb7wdqcmK3/o7QVw54OO4z1jKLvfJwm0ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B42F8057A;
	Wed, 19 Oct 2022 02:37:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AAA1F8057B; Wed, 19 Oct 2022 02:37:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 736B8F800E5
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:37:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 736B8F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="VrFEA8ke"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYHSNqd3DLIR8e+BhjGWHLc6mwnkYRlutT+aFDmlIZpnStE+5dV9GsTKWKRlw8uz2IARQlN7x5ihq1ebW4mRS8bkMSANtF5lPdBoB8+ttqqKTbtGwge1+emuAWF3ge5LurQ7YeAv8AXBJjUKgON6w4vlx2SDm9y/QaaKPSZLjPnZidqb8Wmaewc9+Q2hU002ibp3PVuPTF87fdNBVMOp/8yOXYcBdJwzWEGeEcrLkPwzOAK6M1wHU6b5InltgRCebtwyDg4e/AUmlxSkVs7Hj2iOUe2RdES7/J+ZRiy9NWoKGZvNWejUvO3jT6W55AraoJttT/LCcG5DFUJF3ak9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+uZwWuHOzVDByXqiRsc3L1cGM5dl4icoq7mH26bXiw=;
 b=WLdxDD1dHiaqwNYW8iNbGfxBEjADMMKvscHEdAMnnzgCL+AME/SSomFM53+ymslf0PkHv16rve7gaJU5B5H3ExPS9h92dJdFaAhkDOOBhzrd0wFQEUqbAUov9zmQb6soOkity2EkEmfKERwVekDE8NqXcUAhmCfkycYtl8oAAsyyyGyFwZanORtg/19KBW8UHp9PTIe03knfjXbLDrCOU3J3kMy/uTa2QaoEIqC9JNl+QVua4vOzv97Vt+jUehi7WIgvAOJbeiqQHQkx1FHbdmvmFC4s5YRQbMGSCSsuv4oFO2ryOh7BYVlOfGgBRlJXqTlWBTzmiGcT2EDZHA9ttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+uZwWuHOzVDByXqiRsc3L1cGM5dl4icoq7mH26bXiw=;
 b=VrFEA8ke5NpFqPse141Z26pXbEVCMzyM1KTDrDpVdj7BmSNVhLClZuaX2k5htVsp3QQ6JzavFP/+zwdt2HX6q/pluSt0IMX9ckJRsbs3L+0R9xGEE35WG4a2JBb8xLVlRrbfEJaZ57nUID8QF+QAR/pPj8JuelSzUjqwEP55BHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10149.jpnprd01.prod.outlook.com (2603:1096:400:1ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 00:37:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:37:13 +0000
Message-ID: <87y1tcsl6u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 09/11] ASoC: soc-dapm.h: cleanup white space
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:37:13 +0000
X-ClientProxiedBy: TYCPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10149:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ce533e-eb0f-4f4a-69c7-08dab16a110a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PH9p38MG+D7gPleaumSDtQgvdwwvwWX37yQnj995BnFXxQBbhoqODdkk7zf7gh5ZQvHVR0EL/2WW1EMFbTIe5W7UrJzkGVHzwCmhDdMOGZjxNDtE4ohkscuv4LNnOc6+MreXTqS1Avkgt7NkY5T6p74gEMi2M+gF/KJw0+5gMdzr31WsUGv8PA4fa3omfM06sK0nLkwXFxCaQKgr79bG1QbAt6mKrGzQj1rcre1HB8WwB2svP05yZUiKDfW0aFraHdQrNibxJlWLBCpiUIo06ZZHMVBAiPjxwO5f3HvQf7ZAuwLw2nVlfpyHmuB36bPKvvOEuEm7W2HsPeiXq+Q9BJw0xEO0kyzJPCkUPjPCYhI1qd4PqO+t+YG/QcrULSNN/tnBRLrzhiyZxm2j2wy51t7wUNWReZr5aJxRbjPhjSZuGwvTQVzLcCuK528vSrAvtLQSyvvBFQkEavzo+a49zM+KhvSyWejquQ+qAUFAzvDoGZyw28x2xoePKl3A1SON5kC4YnTw9v2dbVDAGA3kmaSKueJ5nNw2ig16d6aKRyr40GkF5PcWR7W3gOLpEHVRJDDJE2Y+TGHaYHluJncAi6QZbfTTgi0ibDI6nAAblbrowdYifTBSfHcoq2c8NEJFpG16R3v9pkcCYecRP/DTE3U9SMSGRCedpzEWgDOIKoUF0hBGuLNk2kLazoyQxneXDF6OudxRhKHeEhvlhCQltJ2TyHXrt2WpyoPFoX2u9r39liWp4lOFH0JADzyWG0fuB5MWZYRDoGhNKRZgWdjPyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199015)(41300700001)(316002)(66476007)(4326008)(66946007)(8676002)(66556008)(36756003)(6916009)(38100700002)(6512007)(38350700002)(26005)(52116002)(6486002)(6506007)(478600001)(86362001)(186003)(83380400001)(2616005)(30864003)(2906002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8d73dM5W7U+d5+Tmt7Y2n5qufNzD8Izc1cJvWs+VtZn7AGWd1JhPDU5d7Gld?=
 =?us-ascii?Q?4a6x0TuvFvZw0iVQGe3UF4zB/fJHjX82JW+otlPP1qJQNp7UK7ZwdxxbRiQV?=
 =?us-ascii?Q?UJvGtyPRugVyJ/YrPoRd3vf21BcOKBfenjRa00tIwcKTg62rGwbe6TBsTVx+?=
 =?us-ascii?Q?5Fr0+N8s27rltqswoYXtyRGiLbSygVcgnllzapxtK5/twrlYZNs/jGtvTRUw?=
 =?us-ascii?Q?pFozer5KTPgHOVbuCBytRC1Bwb4BjdPSBjMFSAGtYYbf4VrAbB/E1ia8XrzX?=
 =?us-ascii?Q?N2Hz87H6NdpNlJM8XmlnPnpj+tqA5LGM5vsibs2gFs8fvHLZujtUedBZ8Qnj?=
 =?us-ascii?Q?BdMfxJBmlScSG/RZRbk3m1/n+lYHyAF//Yn+jIXB4MxX8IJ3iLGSbxidx5rD?=
 =?us-ascii?Q?UUAS50w6DsQQxOBeDyctcvJpoYS0aHcXZtf0wdBUeynv+wmk30e7/m0cqv+G?=
 =?us-ascii?Q?Sux98rTozdHQTWunIuamS/qcgvRWxq/uGy9JVduROJnaZG5AoWelDxQJOfZC?=
 =?us-ascii?Q?c0X/5qMNfGe/LRzSZhkfrPfbEiGYs7qblL7JxxdRGWM9cThkdWfTaL+kudck?=
 =?us-ascii?Q?Mymc0wVzPMCRo6bge8iC6JubDsoTGWGa766GQCYmbhZpMFkwhFQjUsI+fMuS?=
 =?us-ascii?Q?wBzQ5xEOAgUWSQiTqw/9JSBxQmHHs9WCQ4ihdrwZyBUBD9UBwZT+lKq3pG7Z?=
 =?us-ascii?Q?ErS5I47Mt6zIdnP1EoBwo2t0MZXVUoPN44y3LlFvm+tIVFytjFVaiE+A4Pnq?=
 =?us-ascii?Q?REvUbEqnM9TkaP+aBVQigIZeKkAMyx0TU9dulSY9eIyjL1ZrwR/r18Iq0en+?=
 =?us-ascii?Q?3Y/IbUD/JH7SLhoeuXrEu/KRTog3n32xzImSM+TiK2y+AKIRfS9+sM8F2Gua?=
 =?us-ascii?Q?qANhYYBUcFYPQS9vMAv8WfN7Zr1q1L0Xew+oW5p8hfipKCFp2YdwW/4Yk7Xm?=
 =?us-ascii?Q?YkAhz8aJbI8iIO2UA9Qc8AY8mT1Ct73CWQc3xB+uiQIm8H7Ndh4umB+DD/Lo?=
 =?us-ascii?Q?u6rT5adu5cWpJ4PrcnLPSlNgOOsu2LUUmPMTikp4z3N8WTMOuavChfPKHPgJ?=
 =?us-ascii?Q?Vqnb+xDVCThEd7aY6BChfUs8vWgCe9X/hJ46N3Dg3P2KgfZxzVqI3BlKZvUY?=
 =?us-ascii?Q?JcWXphtpeNcEftgaG9WUgUsmugn7tkG5AzRwan3XKhhkzH626K55NGvI/gTu?=
 =?us-ascii?Q?q+KOxSZpuHudrpq4HAiJIpYF+UF8K04imzajY6ifCxS0Lopt227lv6pKJdCw?=
 =?us-ascii?Q?iapwy9+g1er6JYk8lJoB7Z9Hl8lEwxpfFSarOyp1EbVEh8OleNPiXGWm8XfY?=
 =?us-ascii?Q?HMgC0nFK+bN6yl7xQWkg0nIrpSjYqCRktT0I+ohlUtpOBoCXxofSyd4wrOkq?=
 =?us-ascii?Q?pNXYMxyGyYJm6DUReQUGlEjPQsKM7qIMoSW7X+CRXqpl1+uz3NghzAneueiP?=
 =?us-ascii?Q?sFcWOsYUEXdaomHCd2LZDZNMHYPyPVOXl4JDQ8g1gcLtjuIRxkQHryQlzwkh?=
 =?us-ascii?Q?iSMVSMVteDVuRpFMUOXo9/DDcyCbvcUGSCJo0Q8WPSJ+LKrQAzs9K1lDHvYo?=
 =?us-ascii?Q?qHXLk+0WJ9uGNtJJtojkCdzvIjAvxdYoz3NRSqQbFwQaXQ8ZjEmQU4vC2rgF?=
 =?us-ascii?Q?NRyC0fxDcV/L+v6bwg678PM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ce533e-eb0f-4f4a-69c7-08dab16a110a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:37:13.8453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiHyjE3pDG6vlZqzUEC8uJ4R2/PXagtuSJgZz1L9LTnt+YMlsOrRUBywjNljDONtKA+XHgA1YifTfKBb9RXJUh9aZFfFWILH/44ay2WK07/aqHGbGVc8OKGjyrr9GOaC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10149
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

soc-dapm.h defines many things, but it is using
randam white space and tag.
This patch do nothing, but cleanup its white space.
This patch cleanup also 100 char in 1 line.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 173 ++++++++++++++++-----------------------
 1 file changed, 71 insertions(+), 102 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 29d5700393c6..44597e63344d 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -341,31 +341,27 @@ struct soc_enum;
 #define SND_SOC_DAPM_STREAM_STOP		0x2
 #define SND_SOC_DAPM_STREAM_SUSPEND		0x4
 #define SND_SOC_DAPM_STREAM_RESUME		0x8
-#define SND_SOC_DAPM_STREAM_PAUSE_PUSH	0x10
+#define SND_SOC_DAPM_STREAM_PAUSE_PUSH		0x10
 #define SND_SOC_DAPM_STREAM_PAUSE_RELEASE	0x20
 
 /* dapm event types */
-#define SND_SOC_DAPM_PRE_PMU	0x1 	/* before widget power up */
-#define SND_SOC_DAPM_POST_PMU	0x2		/* after widget power up */
-#define SND_SOC_DAPM_PRE_PMD	0x4 	/* before widget power down */
-#define SND_SOC_DAPM_POST_PMD	0x8		/* after widget power down */
-#define SND_SOC_DAPM_PRE_REG	0x10	/* before audio path setup */
-#define SND_SOC_DAPM_POST_REG	0x20	/* after audio path setup */
-#define SND_SOC_DAPM_WILL_PMU   0x40    /* called at start of sequence */
-#define SND_SOC_DAPM_WILL_PMD   0x80    /* called at start of sequence */
-#define SND_SOC_DAPM_PRE_POST_PMD \
-				(SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD)
-#define SND_SOC_DAPM_PRE_POST_PMU \
-				(SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU)
+#define SND_SOC_DAPM_PRE_PMU		0x1	/* before widget power up */
+#define SND_SOC_DAPM_POST_PMU		0x2	/* after  widget power up */
+#define SND_SOC_DAPM_PRE_PMD		0x4	/* before widget power down */
+#define SND_SOC_DAPM_POST_PMD		0x8	/* after  widget power down */
+#define SND_SOC_DAPM_PRE_REG		0x10	/* before audio path setup */
+#define SND_SOC_DAPM_POST_REG		0x20	/* after  audio path setup */
+#define SND_SOC_DAPM_WILL_PMU		0x40	/* called at start of sequence */
+#define SND_SOC_DAPM_WILL_PMD		0x80	/* called at start of sequence */
+#define SND_SOC_DAPM_PRE_POST_PMD	(SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD)
+#define SND_SOC_DAPM_PRE_POST_PMU	(SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU)
 
 /* convenience event type detection */
-#define SND_SOC_DAPM_EVENT_ON(e)	\
-	(e & (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU))
-#define SND_SOC_DAPM_EVENT_OFF(e)	\
-	(e & (SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD))
+#define SND_SOC_DAPM_EVENT_ON(e)	(e & (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU))
+#define SND_SOC_DAPM_EVENT_OFF(e)	(e & (SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD))
 
 /* regulator widget flags */
-#define SND_SOC_DAPM_REGULATOR_BYPASS     0x1     /* bypass when disabled */
+#define SND_SOC_DAPM_REGULATOR_BYPASS	0x1	/* bypass when disabled */
 
 struct snd_soc_dapm_widget;
 enum snd_soc_dapm_type;
@@ -396,18 +392,13 @@ enum snd_soc_bias_level {
 	SND_SOC_BIAS_ON = 3,
 };
 
-int dapm_regulator_event(struct snd_soc_dapm_widget *w,
-			 struct snd_kcontrol *kcontrol, int event);
-int dapm_clock_event(struct snd_soc_dapm_widget *w,
-			 struct snd_kcontrol *kcontrol, int event);
-int dapm_pinctrl_event(struct snd_soc_dapm_widget *w,
-			 struct snd_kcontrol *kcontrol, int event);
+int dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
 
 /* dapm controls */
-int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
 int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
@@ -419,30 +410,24 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
-	const struct snd_soc_dapm_widget *widget,
-	int num);
-struct snd_soc_dapm_widget *snd_soc_dapm_new_control(
-		struct snd_soc_dapm_context *dapm,
+	const struct snd_soc_dapm_widget *widget, int num);
+struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
 		const struct snd_soc_dapm_widget *widget);
-struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(
-		struct snd_soc_dapm_context *dapm,
+struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 		const struct snd_soc_dapm_widget *widget);
-int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm,
-				 struct snd_soc_dai *dai);
+int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm, struct snd_soc_dai *dai);
 void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
 int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card);
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card);
 
 int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params,
-			    struct snd_soc_dai *dai);
+			    struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
 
 /* dapm path setup */
 int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
 void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm);
 void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
-		       struct snd_soc_card *card,
-		       struct snd_soc_component *component);
+		       struct snd_soc_card *card, struct snd_soc_component *component);
 int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
 int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
@@ -452,46 +437,34 @@ int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
 void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
 
 /* dapm events */
-void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
-	int event);
+void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event);
 void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream);
 void snd_soc_dapm_shutdown(struct snd_soc_card *card);
 
 /* external DAPM widget events */
 int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
-		struct snd_kcontrol *kcontrol, int connect,
-		struct snd_soc_dapm_update *update);
+		struct snd_kcontrol *kcontrol, int connect, struct snd_soc_dapm_update *update);
 int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 		struct snd_kcontrol *kcontrol, int mux, struct soc_enum *e,
 		struct snd_soc_dapm_update *update);
 
 /* dapm sys fs - used by the core */
 extern struct attribute *soc_dapm_dev_attrs[];
-void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm,
-				struct dentry *parent);
+void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm, struct dentry *parent);
 
 /* dapm audio pin control and status */
-int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm,
-			    const char *pin);
-int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm,
-				     const char *pin);
-int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm,
-			     const char *pin);
-int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm,
-				      const char *pin);
+int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_nc_pin(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_nc_pin_unlocked(struct snd_soc_dapm_context *dapm,
-				 const char *pin);
-int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm,
-				const char *pin);
+int snd_soc_dapm_nc_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm);
 int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm);
-int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm,
-				  const char *pin);
-int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm,
-					   const char *pin);
-int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm,
-				const char *pin);
+int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
 unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
 
 /* Mostly internal - should not normally be used */
@@ -500,40 +473,35 @@ void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
 /* dapm path query */
 int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	struct snd_soc_dapm_widget_list **list,
-	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *,
-				      enum snd_soc_dapm_direction));
+	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *, enum snd_soc_dapm_direction));
 void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
 
-struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(
-	struct snd_kcontrol *kcontrol);
+struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(struct snd_kcontrol *kcontrol);
+struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(struct snd_kcontrol *kcontrol);
 
-struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(
-		struct snd_kcontrol *kcontrol);
-
-int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm,
-	enum snd_soc_bias_level level);
+int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
 
 /* dapm widget types */
 enum snd_soc_dapm_type {
 	snd_soc_dapm_input = 0,		/* input pin */
 	snd_soc_dapm_output,		/* output pin */
-	snd_soc_dapm_mux,			/* selects 1 analog signal from many inputs */
-	snd_soc_dapm_demux,			/* connects the input to one of multiple outputs */
-	snd_soc_dapm_mixer,			/* mixes several analog signals together */
-	snd_soc_dapm_mixer_named_ctl,		/* mixer with named controls */
-	snd_soc_dapm_pga,			/* programmable gain/attenuation (volume) */
-	snd_soc_dapm_out_drv,			/* output driver */
-	snd_soc_dapm_adc,			/* analog to digital converter */
-	snd_soc_dapm_dac,			/* digital to analog converter */
+	snd_soc_dapm_mux,		/* selects 1 analog signal from many inputs */
+	snd_soc_dapm_demux,		/* connects the input to one of multiple outputs */
+	snd_soc_dapm_mixer,		/* mixes several analog signals together */
+	snd_soc_dapm_mixer_named_ctl,	/* mixer with named controls */
+	snd_soc_dapm_pga,		/* programmable gain/attenuation (volume) */
+	snd_soc_dapm_out_drv,		/* output driver */
+	snd_soc_dapm_adc,		/* analog to digital converter */
+	snd_soc_dapm_dac,		/* digital to analog converter */
 	snd_soc_dapm_micbias,		/* microphone bias (power) - DEPRECATED: use snd_soc_dapm_supply */
-	snd_soc_dapm_mic,			/* microphone */
-	snd_soc_dapm_hp,			/* headphones */
-	snd_soc_dapm_spk,			/* speaker */
-	snd_soc_dapm_line,			/* line input/output */
+	snd_soc_dapm_mic,		/* microphone */
+	snd_soc_dapm_hp,		/* headphones */
+	snd_soc_dapm_spk,		/* speaker */
+	snd_soc_dapm_line,		/* line input/output */
 	snd_soc_dapm_switch,		/* analog switch */
-	snd_soc_dapm_vmid,			/* codec bias/vmid - to minimise pops */
-	snd_soc_dapm_pre,			/* machine specific pre widget - exec first */
-	snd_soc_dapm_post,			/* machine specific post widget - exec last */
+	snd_soc_dapm_vmid,		/* codec bias/vmid - to minimise pops */
+	snd_soc_dapm_pre,		/* machine specific pre widget - exec first */
+	snd_soc_dapm_post,		/* machine specific post widget - exec last */
 	snd_soc_dapm_supply,		/* power/clock supply */
 	snd_soc_dapm_pinctrl,		/* pinctrl */
 	snd_soc_dapm_regulator_supply,	/* external regulator */
@@ -599,9 +567,9 @@ struct snd_soc_dapm_path {
 	};
 
 	/* status */
-	u32 connect:1;	/* source and sink widgets are connected */
-	u32 walking:1;  /* path is in the process of being walked */
-	u32 weak:1;	/* path ignored for power management */
+	u32 connect:1;		/* source and sink widgets are connected */
+	u32 walking:1;		/* path is in the process of being walked */
+	u32 weak:1;		/* path ignored for power management */
 	u32 is_supply:1;	/* At least one of the connected widgets is a supply */
 
 	int (*connected)(struct snd_soc_dapm_widget *source,
@@ -615,8 +583,8 @@ struct snd_soc_dapm_path {
 /* dapm widget */
 struct snd_soc_dapm_widget {
 	enum snd_soc_dapm_type id;
-	const char *name;		/* widget name */
-	const char *sname;	/* stream name */
+	const char *name;			/* widget name */
+	const char *sname;			/* stream name */
 	struct list_head list;
 	struct snd_soc_dapm_context *dapm;
 
@@ -635,7 +603,7 @@ struct snd_soc_dapm_widget {
 	unsigned char connected:1;		/* connected codec pin */
 	unsigned char new:1;			/* cnew complete */
 	unsigned char force:1;			/* force state */
-	unsigned char ignore_suspend:1;         /* kept enabled over suspend */
+	unsigned char ignore_suspend:1;		/* kept enabled over suspend */
 	unsigned char new_power:1;		/* power from this run */
 	unsigned char power_checked:1;		/* power checked this run */
 	unsigned char is_supply:1;		/* Widget is a supply type widget */
@@ -682,13 +650,14 @@ struct snd_soc_dapm_update {
 /* DAPM context */
 struct snd_soc_dapm_context {
 	enum snd_soc_bias_level bias_level;
-	unsigned int idle_bias_off:1; /* Use BIAS_OFF instead of STANDBY */
-	/* Go to BIAS_OFF in suspend if the DAPM context is idle */
-	unsigned int suspend_bias_off:1;
 
-	struct device *dev; /* from parent - for debug */
-	struct snd_soc_component *component; /* parent component */
-	struct snd_soc_card *card; /* parent card */
+	/* bit field */
+	unsigned int idle_bias_off:1;		/* Use BIAS_OFF instead of STANDBY */
+	unsigned int suspend_bias_off:1;	/* Use BIAS_OFF in suspend if the DAPM is idle */
+
+	struct device *dev;			/* from parent - for debug */
+	struct snd_soc_component *component;	/* parent component */
+	struct snd_soc_card *card;		/* parent card */
 
 	/* used during DAPM updates */
 	enum snd_soc_bias_level target_bias_level;
@@ -762,8 +731,8 @@ enum snd_soc_dapm_direction {
 
 #define SND_SOC_DAPM_DIR_TO_EP(x) BIT(x)
 
-#define SND_SOC_DAPM_EP_SOURCE SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
-#define SND_SOC_DAPM_EP_SINK SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
+#define SND_SOC_DAPM_EP_SOURCE	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
+#define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
 
 /**
  * snd_soc_dapm_widget_for_each_sink_path - Iterates over all paths in the
-- 
2.25.1

