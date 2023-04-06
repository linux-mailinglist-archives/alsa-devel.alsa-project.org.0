Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC36D8B91
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 02:17:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DFA7207;
	Thu,  6 Apr 2023 02:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DFA7207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680740223;
	bh=+a7xq7iJPVLoWDcmmRXsUim5Mp++u52XLu5ufYRvHns=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hLCI1zXQVHXJ5IzsdLYFKBb6i8An5lnC744yjl22WFkifGHllNz/q1aBQAWbT/6Iv
	 m/8+LDQk8lWyK04DT9+lyhMOfK0Y7I+sN9cDBj0Ba1ecgDFFOVwwW/oC3kYjkgCSxt
	 lAmruSiVFEGAjoqGJuxNUPy1zWFQDHadZjmljSrc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 086B5F80171;
	Thu,  6 Apr 2023 02:16:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F38A1F80249; Thu,  6 Apr 2023 02:16:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0C65F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 02:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C65F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Goy945w1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+30941FuHabsS8EwsNQEjChovkC2kgr4K5Gz3A2Bf/bw37yyo6N8gqic9zVoRisWK8Rujid0FXUpq7yUent58A8eHI9erW9SVoSV2iysbZ5wRr1fwpiHoy8ACDLUp3PyqrjYJfH1r6jakir2JGG2r4ZDT4IcThMXVGXhsBWi/ma1X9FrEdgequFeBWnGnPiCYJusr+A7CEicyaVRb6hpCxPpCfTB6+0+9YUrAOod1PMDG2zlkK1HHaiFCbrdSjVjoVblWqkr/oC1rey/DWnUw39LIG7yR9jCBb8CVAAzYOJ7yeql9u7cVYiJoeJAOi+xdNYLxUseH6K64RVVugBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGRpMTZYh26PHAM6a/6qiKOkJR5WKm2V+d4xrqzHoMY=;
 b=enanBS+YIesKMwdau6qNju8Wh2JT5zei8g8BH2L0hAGKvMsSP9RvUGlinPvY/cqizSGVmACSZ/lMKY8axQYFaVoVmubuFjiiOJWEWpHbMd1QSq4xITns98ODAqO3BOR1ri9iyoSat0mboAseheB8eBuItwh+ZiMcOe5Emr6E6R3ZCEybm4S99eaMtXtHubhWWjxVgY8i5oizWg3HqfCEI6/ByF0wXJnDncdaobcfwsY5UGhvQc9w3tuWwZvnwDRVeR/DKUP5HRcsLlrQSS8nR9QzueyGRHi3E8F3KC4q2bek/CrOi+heG27I0r2htdw2oW1EFnLGCOdEmUuA9u7d/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGRpMTZYh26PHAM6a/6qiKOkJR5WKm2V+d4xrqzHoMY=;
 b=Goy945w1oXyi3VGjj708TQLAHGepyq7pntfwfoTDavZRXmQjgeXsAJWt0OfX+vYRULVS9pa5v/MuVKhc81enNSZcJEJK/iXV8ng1dClXk8lvP3K64lsZQcRIekXlTO9/4fNqSWaLx1delhKL3kHg8hPXunJ3P2R8RPJ7ZxLT9ZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB10905.jpnprd01.prod.outlook.com (2603:1096:400:3b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37; Thu, 6 Apr
 2023 00:15:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 00:15:48 +0000
Message-ID: <87cz4hx3v0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87edoxx3wq.wl-kuninori.morimoto.gx@renesas.com>
References: <87edoxx3wq.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: expand snd_soc_dapm_mutex_lock/unlock()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 6 Apr 2023 00:15:48 +0000
X-ClientProxiedBy: TYBP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB10905:EE_
X-MS-Office365-Filtering-Correlation-Id: 086dfc7d-dcfc-44cb-bddf-08db363412af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eoNKaz/yUpJOXT4a0LRXH6aaYbtdnpT6rKe2O6kn5VocVJYnXhuHRxFVWL2W75N2ikS+YpJvWNuTg5QFujHMo17J+i98doy1bbG/eRZyMcNc9TqB+54r4AzrIRnFkyyZKHR/oLaBZDW/GzBwuI91X2AEbqi/5IdXgFTOVIuRnzTGJ8E2ePIOmDJyoDAa1ebfJkFgjZTQSDHjEzJClsE+3UBAHLmQufySBHvn36SEIult8mknVGDBx2vjauw/J8rUJCjtBNzR+CcCNibwlY8a3M+7tKIaklNRHCNT02Js4+vdN9XaPVUVljChsCTj8xypHmgYv1JwMKwd62EsNOx0/OMe/bgydxKddvW0iR4JLd+V6AwMeqEw3wwIfQMzV6fcB1xnN6bJTUx+OuwS9chxr9rF8zClyrAphn1WV08ae7x2EpYMSaRnCOZ3MgCeeZV+sEzS/f8hJmWO9qkvwRuRxzA7M8vAMhd/bsVXk9RN6YDbgnWymahZu5uVhMuqpkEcqsEXXPCTuQXJln8cA8Pgf28Ndb0x089EJIe4hGZ4ksbSrbFRo2PAdP67oedwNUJphKlnIERHIVMFnoGczNAcA1pkMcXtWMmLFNklaxF69GKc1MKLHRZ5GDgWWj3rseoYLghljggYIRhIQjEe5IWufg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(38350700002)(38100700002)(36756003)(5660300002)(2906002)(30864003)(8936002)(66476007)(66556008)(66946007)(8676002)(4326008)(6916009)(41300700001)(86362001)(6486002)(2616005)(83380400001)(186003)(6512007)(6506007)(26005)(478600001)(316002)(52116002)(309714004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2fEc2B/WKxJo3CH3w71sQy7Rz63u4AoiTvSdO3X0ssorCiG33MiKqCCXLW8q?=
 =?us-ascii?Q?6SiR6yzQYeY3Scm+3g0vMwHO5378PJ9Jq3cPk/v4TuhpDKu1eRTTToSPcvBr?=
 =?us-ascii?Q?79HDyjLcv7RKRYxC7XmKy2Zvhu4eSYdZxmy6WwO3h1Im/ZVd8unb7wPGuzjZ?=
 =?us-ascii?Q?ODYp+94NHSJ/wGL+y96WLv5KXCrCyZzZ2xDc2UobdovbT0rIOE/i0zlFaPXw?=
 =?us-ascii?Q?6aRcIOOM/Uel932bIjGHi2TeFoEe+44qeXsL1Yd+AHS9tMoo+Rl/3wAMg+yD?=
 =?us-ascii?Q?oOkL4CDrC9GL585M4sALq/L8vAVUxJ3WOvbrCo5mCdnEatiMLL2feniAbexS?=
 =?us-ascii?Q?s292eAf/yKp8/KpeS2DnF3taAmA1u7UIiUYfv/zAvZsZrypdysYNWMB+XYRz?=
 =?us-ascii?Q?vAkGAGcvuHZTvaJk/2+E1BVWdPppyWerUsOJo9w3KoDJncFjgX43n4Idba7c?=
 =?us-ascii?Q?8jJ+O0bOn8oDwPt9GrcBc5BbjgGr50vXI+coAz+0u7CjkD8O7vYWR8cwowRA?=
 =?us-ascii?Q?i/BCv0gINGwgPxxJQCzAo8oMeIupSt3sL1eaD1pXwCqDd/RqKYZdbNj4DjO/?=
 =?us-ascii?Q?1zXzyhyvxFTpcBU7BPvrB9632K6oOsPqPWRmMShcmIHWZNzCv4PqFFb5ucc4?=
 =?us-ascii?Q?rHSHH0DfuoE6s7GF0VemDWUdZzA/eWppbkg79i+6q4ZqATExBNeiouZggwZO?=
 =?us-ascii?Q?KpgGOc0qODFpO9T7PccJWJ8hOa7JwcPi9xIV+qEO/8ZPM7lGMe7jhVctXKdy?=
 =?us-ascii?Q?QZAT2C9NyxM7V8pmteE9qIwbFwCtBlopX+rxwRXdPMALTReL1r3YMX2rawFk?=
 =?us-ascii?Q?KrR2z4Qq1zp3bYxZ1H6E9gnX5ECH0xzd2m+I+l4FwGjvNfTvEcN05garWULw?=
 =?us-ascii?Q?3vQNji3DY2s0T1zWyRk++QLs/ZO/ko16FCfRfr3mcZ8yLBTmhM9PhlypbTgD?=
 =?us-ascii?Q?UCQmn5R5C/T5jucwKlUyq5+ScjLC29LLVCCBo2wHriTx0Ln/kg62uUq7u12r?=
 =?us-ascii?Q?WAv85GkC6keccIsXdbxOGaG8TyTS5hc8v2xkqOF/luytUSNS2Frc4crDsKqR?=
 =?us-ascii?Q?XsBN5K3JBEO6djzWI4OFNMqQurhNzjT2GQxf2CT8IFJSxp6SAze3l1oDDgjK?=
 =?us-ascii?Q?cUQ7yGTvc59Wmba0uBXBNdBckE/BLIrUf0F5iaoQL2POZ7ykzRiejZLzW0TO?=
 =?us-ascii?Q?/dGSml9DYh7vjhX9ENQ9MLyjC++x4qvvwfALt2NzS6Tghr0Tk4LJlKrP2HYZ?=
 =?us-ascii?Q?cd7AhcM35aRQpXP5LLEiBXdcsx/D2ZAIaxsYZ4OSOQTTaTiCMpc13nKvVUJ/?=
 =?us-ascii?Q?1/NXjNpDFCaAX5vzGcRPO7/HPJggoV4ZWnrVOghW3W4IC2de+ElbtL1/36my?=
 =?us-ascii?Q?djlGTNm0xWrN2Bbv+/O/iHuWVWi0u7SSRRHUn2Vgf+SuCF0nGSPc4mq5UMDO?=
 =?us-ascii?Q?Yf28YWeQP38KVwxv1+s68w2fo8sjtuHNvc5/zMjiMARdwPmFongwXCsgIWTI?=
 =?us-ascii?Q?lw6Sl2SISaVcqMpSEYRs9AuUBE4sZROkYdTOOE+tns5My2YUeOI6i4jNivpQ?=
 =?us-ascii?Q?4hrayUWRrJJw5qyhn47P0oWlHbwGFEylxdFau+YFcoxjIpZsKgypMMlRKXdV?=
 =?us-ascii?Q?jDU0tjHbWo+aWOz3N7z9cOw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 086dfc7d-dcfc-44cb-bddf-08db363412af
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 00:15:48.5167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Lm79TqFRXH9FqjRk8zMVbK6HJeUrurTFuc77P1zwNwVoffPI7rFaoWnNCQ4YgTxO2ZYHO/zjWrGM9YUqe3TTvn0Y4LCf71vzt1qR2qSc9RhVon3HZD2flHWcMCem+r4R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10905
Message-ID-Hash: 6WITCELJ2BYXDNUKQFHGIR5Z7H5BEHL6
X-Message-ID-Hash: 6WITCELJ2BYXDNUKQFHGIR5Z7H5BEHL6
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WITCELJ2BYXDNUKQFHGIR5Z7H5BEHL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc.h has snd_soc_dapm_mutex_lock/unlock() definition and
many drivers are using it, but soc-dapm.c is not.

1st reason is snd_soc_dapm_mutex_lock/unlock() requests
snd_soc_dapm_context pointer as parameter (A), but sometimes soc-dapm.c
needs to use snd_soc_card (B).

(A)	static inline void snd_soc_dapm_mutex_lock(struct snd_soc_dapm_context *dapm)
	{
		mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
	}			   ^^^^^^^^^^

(B)	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
			   ^^^^

2nd reason is it want to use SND_SOC_DAPM_CLASS_INIT for mutex_lock_nested(),
but helper is using _RUNTIME (A).

The conclusion is we want to use "dapm vs card" and "_RUNTIME vs _INIT"
for dapm lock/unlock. To enable this selfish request, this patch uses
_Generic macro. We can use snd_soc_dapm_mutex_lock/unlock() for both
dapm and card case.

	snd_soc_dapm_mutex_lock(dapm);	snd_soc_dapm_mutex_unlock(dapm);
	snd_soc_dapm_mutex_lock(card);	snd_soc_dapm_mutex_unlock(card);

Current soc-dapm.c is using both mutex_lock() and mutex_lock_nested().
This patch handles mutex_lock() as mutex_lock_nested(..., 0),
in other words, handles below as same.

	mutex_lock(&card->dapm_mutex);
	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_INIT);

Because people might misunderstand that _init() is mutex initialization,
this patch renames _INIT to _ROOT and adds new
snd_soc_dapm_mutex_lock_root() for it.

This patch also moves snd_soc_dapm_subclass definition from soc-dapm.h
to soc.h to keep related code together.

Because very complex soc.h vs soc-dapm.h relationship,
it is difficult/impossible to define these helper into soc-dapm.h.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h |   5 --
 include/sound/soc.h      |  60 ++++++++++++++++++--
 sound/soc/soc-dapm.c     | 119 +++++++++++++++++++--------------------
 3 files changed, 113 insertions(+), 71 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 64915ebd641e..87f8e1793af1 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -527,11 +527,6 @@ enum snd_soc_dapm_type {
 	SND_SOC_DAPM_TYPE_COUNT
 };
 
-enum snd_soc_dapm_subclass {
-	SND_SOC_DAPM_CLASS_INIT		= 0,
-	SND_SOC_DAPM_CLASS_RUNTIME	= 1,
-};
-
 /*
  * DAPM audio route definition.
  *
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 3833184c187f..0e17e3230c7a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1364,17 +1364,67 @@ extern struct dentry *snd_soc_debugfs_root;
 
 extern const struct dev_pm_ops snd_soc_pm_ops;
 
-/* Helper functions */
-static inline void snd_soc_dapm_mutex_lock(struct snd_soc_dapm_context *dapm)
+/*
+ *	DAPM helper functions
+ */
+enum snd_soc_dapm_subclass {
+	SND_SOC_DAPM_CLASS_ROOT		= 0,
+	SND_SOC_DAPM_CLASS_RUNTIME	= 1,
+};
+
+static inline void _snd_soc_dapm_mutex_lock_root_c(struct snd_soc_card *card)
+{
+	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_ROOT);
+}
+
+static inline void _snd_soc_dapm_mutex_lock_c(struct snd_soc_card *card)
+{
+	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+}
+
+static inline void _snd_soc_dapm_mutex_unlock_c(struct snd_soc_card *card)
 {
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	mutex_unlock(&card->dapm_mutex);
 }
 
-static inline void snd_soc_dapm_mutex_unlock(struct snd_soc_dapm_context *dapm)
+static inline void _snd_soc_dapm_mutex_assert_held_c(struct snd_soc_card *card)
 {
-	mutex_unlock(&dapm->card->dapm_mutex);
+	lockdep_assert_held(&card->dapm_mutex);
 }
 
+static inline void _snd_soc_dapm_mutex_lock_root_d(struct snd_soc_dapm_context *dapm)
+{
+	_snd_soc_dapm_mutex_lock_root_c(dapm->card);
+}
+
+static inline void _snd_soc_dapm_mutex_lock_d(struct snd_soc_dapm_context *dapm)
+{
+	_snd_soc_dapm_mutex_lock_c(dapm->card);
+}
+
+static inline void _snd_soc_dapm_mutex_unlock_d(struct snd_soc_dapm_context *dapm)
+{
+	_snd_soc_dapm_mutex_unlock_c(dapm->card);
+}
+
+static inline void _snd_soc_dapm_mutex_assert_held_d(struct snd_soc_dapm_context *dapm)
+{
+	_snd_soc_dapm_mutex_assert_held_c(dapm->card);
+}
+
+#define snd_soc_dapm_mutex_lock_root(x) _Generic((x),			\
+	struct snd_soc_card * :		_snd_soc_dapm_mutex_lock_root_c, \
+	struct snd_soc_dapm_context * :	_snd_soc_dapm_mutex_lock_root_d)(x)
+#define snd_soc_dapm_mutex_lock(x) _Generic((x),			\
+	struct snd_soc_card * :		_snd_soc_dapm_mutex_lock_c,	\
+	struct snd_soc_dapm_context * :	_snd_soc_dapm_mutex_lock_d)(x)
+#define snd_soc_dapm_mutex_unlock(x) _Generic((x),			\
+	struct snd_soc_card * :		_snd_soc_dapm_mutex_unlock_c,	\
+	struct snd_soc_dapm_context * :	_snd_soc_dapm_mutex_unlock_d)(x)
+#define snd_soc_dapm_mutex_assert_held(x) _Generic((x),			\
+	struct snd_soc_card * :		_snd_soc_dapm_mutex_assert_held_c, \
+	struct snd_soc_dapm_context * :	_snd_soc_dapm_mutex_assert_held_d)(x)
+
 #include <sound/soc-component.h>
 #include <sound/soc-card.h>
 #include <sound/soc-jack.h>
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 36e6f261bcf7..f2f04ce693a1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -150,7 +150,7 @@ static int dapm_down_seq[] = {
 static void dapm_assert_locked(struct snd_soc_dapm_context *dapm)
 {
 	if (snd_soc_card_is_instantiated(dapm->card))
-		lockdep_assert_held(&dapm->card->dapm_mutex);
+		snd_soc_dapm_mutex_assert_held(dapm);
 }
 
 static void pop_wait(u32 pop_time)
@@ -302,7 +302,7 @@ void dapm_mark_endpoints_dirty(struct snd_soc_card *card)
 {
 	struct snd_soc_dapm_widget *w;
 
-	mutex_lock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_lock_root(card);
 
 	for_each_card_widgets(card, w) {
 		if (w->is_ep) {
@@ -314,7 +314,7 @@ void dapm_mark_endpoints_dirty(struct snd_soc_card *card)
 		}
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 }
 EXPORT_SYMBOL_GPL(dapm_mark_endpoints_dirty);
 
@@ -604,7 +604,7 @@ static void dapm_reset(struct snd_soc_card *card)
 {
 	struct snd_soc_dapm_widget *w;
 
-	lockdep_assert_held(&card->dapm_mutex);
+	snd_soc_dapm_mutex_assert_held(card);
 
 	memset(&card->dapm_stats, 0, sizeof(card->dapm_stats));
 
@@ -1302,7 +1302,7 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	int paths;
 	int ret;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_OUT);
@@ -1322,7 +1322,7 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 		paths = ret;
 
 	trace_snd_soc_dapm_connected(paths, stream);
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 
 	return paths;
 }
@@ -1952,7 +1952,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 	enum snd_soc_bias_level bias;
 	int ret;
 
-	lockdep_assert_held(&card->dapm_mutex);
+	snd_soc_dapm_mutex_assert_held(card);
 
 	trace_snd_soc_dapm_start(card);
 
@@ -2090,7 +2090,6 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 					   size_t count, loff_t *ppos)
 {
 	struct snd_soc_dapm_widget *w = file->private_data;
-	struct snd_soc_card *card = w->dapm->card;
 	enum snd_soc_dapm_direction dir, rdir;
 	char *buf;
 	int in, out;
@@ -2101,7 +2100,7 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 	if (!buf)
 		return -ENOMEM;
 
-	mutex_lock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_lock_root(w->dapm);
 
 	/* Supply widgets are not handled by is_connected_{input,output}_ep() */
 	if (w->is_supply) {
@@ -2145,7 +2144,7 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 		}
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(w->dapm);
 
 	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
 
@@ -2266,7 +2265,7 @@ static int soc_dapm_mux_update_power(struct snd_soc_card *card,
 	int found = 0;
 	bool connect;
 
-	lockdep_assert_held(&card->dapm_mutex);
+	snd_soc_dapm_mutex_assert_held(card);
 
 	/* find dapm widget path assoc with kcontrol */
 	dapm_kcontrol_for_each_path(path, kcontrol) {
@@ -2293,11 +2292,11 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 	struct snd_soc_card *card = dapm->card;
 	int ret;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 	card->update = update;
 	ret = soc_dapm_mux_update_power(card, kcontrol, mux, e);
 	card->update = NULL;
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
 	return ret;
@@ -2312,7 +2311,7 @@ static int soc_dapm_mixer_update_power(struct snd_soc_card *card,
 	struct snd_soc_dapm_path *path;
 	int found = 0;
 
-	lockdep_assert_held(&card->dapm_mutex);
+	snd_soc_dapm_mutex_assert_held(card);
 
 	/* find dapm widget path assoc with kcontrol */
 	dapm_kcontrol_for_each_path(path, kcontrol) {
@@ -2358,11 +2357,11 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 	struct snd_soc_card *card = dapm->card;
 	int ret;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 	card->update = update;
 	ret = soc_dapm_mixer_update_power(card, kcontrol, connect, -1);
 	card->update = NULL;
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
 	return ret;
@@ -2441,7 +2440,7 @@ static ssize_t dapm_widget_show(struct device *dev,
 	struct snd_soc_dai *codec_dai;
 	int i, count = 0;
 
-	mutex_lock(&rtd->card->dapm_mutex);
+	snd_soc_dapm_mutex_lock_root(rtd->card);
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		struct snd_soc_component *cmpnt = codec_dai->component;
@@ -2449,7 +2448,7 @@ static ssize_t dapm_widget_show(struct device *dev,
 		count = dapm_widget_show_component(cmpnt, buf, count);
 	}
 
-	mutex_unlock(&rtd->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(rtd->card);
 
 	return count;
 }
@@ -2632,9 +2631,9 @@ int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm)
 {
 	int ret;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	ret = snd_soc_dapm_sync_unlocked(dapm);
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_sync);
@@ -2703,9 +2702,9 @@ int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	int ret;
 
-	mutex_lock_nested(&rtd->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(rtd->card);
 	ret = dapm_update_dai_unlocked(substream, params, dai);
-	mutex_unlock(&rtd->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(rtd->card);
 
 	return ret;
 }
@@ -3090,14 +3089,14 @@ int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 {
 	int i, ret = 0;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	for (i = 0; i < num; i++) {
 		int r = snd_soc_dapm_add_route(dapm, route);
 		if (r < 0)
 			ret = r;
 		route++;
 	}
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -3116,12 +3115,12 @@ int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
 {
 	int i;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	for (i = 0; i < num; i++) {
 		snd_soc_dapm_del_route(dapm, route);
 		route++;
 	}
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return 0;
 }
@@ -3194,14 +3193,14 @@ int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
 	int i;
 	int ret = 0;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_INIT);
+	snd_soc_dapm_mutex_lock_root(dapm);
 	for (i = 0; i < num; i++) {
 		int err = snd_soc_dapm_weak_route(dapm, route);
 		if (err)
 			ret = err;
 		route++;
 	}
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -3220,7 +3219,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 	struct snd_soc_dapm_widget *w;
 	unsigned int val;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_INIT);
+	snd_soc_dapm_mutex_lock_root(card);
 
 	for_each_card_widgets(card, w)
 	{
@@ -3232,7 +3231,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 						sizeof(struct snd_kcontrol *),
 						GFP_KERNEL);
 			if (!w->kcontrols) {
-				mutex_unlock(&card->dapm_mutex);
+				snd_soc_dapm_mutex_unlock(card);
 				return -ENOMEM;
 			}
 		}
@@ -3275,7 +3274,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 	}
 
 	dapm_power_widgets(card, SND_SOC_DAPM_STREAM_NOP);
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_new_widgets);
@@ -3293,7 +3292,6 @@ int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct snd_soc_card *card = dapm->card;
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	int reg = mc->reg;
@@ -3304,7 +3302,7 @@ int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int invert = mc->invert;
 	unsigned int reg_val, val, rval = 0;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	if (dapm_kcontrol_is_powered(kcontrol) && reg != SND_SOC_NOPM) {
 		reg_val = soc_dapm_read(dapm, reg);
 		val = (reg_val >> shift) & mask;
@@ -3321,7 +3319,7 @@ int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 		if (snd_soc_volsw_is_stereo(mc))
 			rval = (reg_val >> width) & mask;
 	}
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	if (invert)
 		ucontrol->value.integer.value[0] = max - val;
@@ -3379,7 +3377,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 			rval = max - rval;
 	}
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 
 	/* This assumes field width < (bits in unsigned int / 2) */
 	if (width > sizeof(unsigned int) * 8 / 2)
@@ -3421,7 +3419,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 		card->update = NULL;
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
@@ -3443,17 +3441,16 @@ int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct snd_soc_card *card = dapm->card;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int reg_val, val;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	if (e->reg != SND_SOC_NOPM && dapm_kcontrol_is_powered(kcontrol)) {
 		reg_val = soc_dapm_read(dapm, e->reg);
 	} else {
 		reg_val = dapm_kcontrol_get_value(kcontrol);
 	}
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	val = (reg_val >> e->shift_l) & e->mask;
 	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(e, val);
@@ -3500,7 +3497,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 		mask |= e->mask << e->shift_r;
 	}
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 
 	change = dapm_kcontrol_set_value(kcontrol, val);
 
@@ -3521,7 +3518,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 		card->update = NULL;
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
@@ -3562,12 +3559,12 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
 	const char *pin = (const char *)kcontrol->private_value;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 
 	ucontrol->value.integer.value[0] =
 		snd_soc_dapm_get_pin_status(&card->dapm, pin);
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 
 	return 0;
 }
@@ -3586,10 +3583,10 @@ int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	const char *pin = (const char *)kcontrol->private_value;
 	int ret;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 	ret = __snd_soc_dapm_set_pin(&card->dapm, pin,
 				     !!ucontrol->value.integer.value[0]);
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 
 	snd_soc_dapm_sync(&card->dapm);
 	return ret;
@@ -3762,9 +3759,9 @@ snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
 {
 	struct snd_soc_dapm_widget *w;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	w = snd_soc_dapm_new_control_unlocked(dapm, widget);
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return w;
 }
@@ -3787,7 +3784,7 @@ int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 	int i;
 	int ret = 0;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_INIT);
+	snd_soc_dapm_mutex_lock_root(dapm);
 	for (i = 0; i < num; i++) {
 		struct snd_soc_dapm_widget *w = snd_soc_dapm_new_control_unlocked(dapm, widget);
 		if (IS_ERR(w)) {
@@ -3796,7 +3793,7 @@ int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 		}
 		widget++;
 	}
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_new_controls);
@@ -4499,9 +4496,9 @@ void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 {
 	struct snd_soc_card *card = rtd->card;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 	soc_dapm_stream_event(rtd, stream, event);
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 }
 
 void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream)
@@ -4562,11 +4559,11 @@ int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin)
 {
 	int ret;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 
 	ret = snd_soc_dapm_set_pin(dapm, pin, 1);
 
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -4630,11 +4627,11 @@ int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm,
 {
 	int ret;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 
 	ret = snd_soc_dapm_force_enable_pin_unlocked(dapm, pin);
 
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -4674,11 +4671,11 @@ int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm,
 {
 	int ret;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 
 	ret = snd_soc_dapm_set_pin(dapm, pin, 0);
 
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -4725,11 +4722,11 @@ int snd_soc_dapm_nc_pin(struct snd_soc_dapm_context *dapm, const char *pin)
 {
 	int ret;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 
 	ret = snd_soc_dapm_set_pin(dapm, pin, 0);
 
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -4826,7 +4823,7 @@ static void soc_dapm_shutdown_dapm(struct snd_soc_dapm_context *dapm)
 	LIST_HEAD(down_list);
 	int powerdown = 0;
 
-	mutex_lock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_lock_root(card);
 
 	for_each_card_widgets(dapm->card, w) {
 		if (w->dapm != dapm)
@@ -4851,7 +4848,7 @@ static void soc_dapm_shutdown_dapm(struct snd_soc_dapm_context *dapm)
 						    SND_SOC_BIAS_STANDBY);
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 }
 
 /*
-- 
2.25.1

