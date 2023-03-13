Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305D6B6CE3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 01:51:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76BCC143F;
	Mon, 13 Mar 2023 01:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76BCC143F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678668692;
	bh=HMqy37WxfTqkKliIi9hhNeX5H3Vpi2aBAICvaxAgPmo=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vV2d+jOlefvsNtU9IbQkHg+eDPOSKHYH2ANlGLG68+T8rLzJJR+TnzgnZyenU0MrI
	 Y3zyfac+Y1M6lDd761X4aF0Ax8lAZARd7MfvGg+GkWpIT192lXmoh/ILydbujOd1jD
	 5QO86IJhSkLIzQfKnTI4fk8xsJEfBPgMpao9ts/U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E018F8032D;
	Mon, 13 Mar 2023 01:50:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 988E6F80482; Mon, 13 Mar 2023 01:50:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EDFDF80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 01:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EDFDF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JLVuA9+V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFk18G0+KJQockrJgvhM/xuFjeXcD8MiSC+GhYAQcfuJ22xWTAXztfajx931oHgUuYXLoyFc5yn/3+UnW83MOwXIX7EN/PCyNJPFVs0yEhWL4b4TnXgQb4cTpxOUxt8ORTU8EzTJ0ZE0lTnqC/lE++bf4rj5d4FkNrXvOcDMP/EZZ8B/RKWRJfJVAPHsBb2yOFBjlTlhAneBabcpYmmuBEdvIRtbZ+d9cswgx9A9IbBmjD5zDiXyMgjifm6rTPysGYruBwEcfpKVD4eExKKeUdoVGOsbNnx5rEhN2xDPGv+bmv/XZt/bPoHDo6A/kX+g+STFwcG43DQpSfzSWs0EOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nvoitf4TNjzW8os/z0eZWqyAcsvlpD+FZuTfpjJ3maY=;
 b=lXqRAVxhx7FM7ZkQuu0pZno6lEl77ByLdcWpVqjnkCGYNnJ6BqycWIRb6auUIvvu929A8aIcyMgQGbJyFGQFXHgsrLv0iCbhJvJLZlDB55/snjEJ/J33sB+8ykXR7aPGral6zYRWygEQ0ip8vFfeWLRJvaFJKwn6w1wR32pGU6+XyRVDSwe6O9hh11VPkxTMrxaqdFAktVZWFt9uPcXWYCSUp8e12XUrXenIHZXloHxlpU2K94fmBz7iFf6X3v2wz+nnhY/df/XFaRX3C7vBHfyeiNV5J5buFPMhfLa0W3Ep/kYKYyDcyqCyZQAuFtMBZVjgVLECafYGyx2HS2ceLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nvoitf4TNjzW8os/z0eZWqyAcsvlpD+FZuTfpjJ3maY=;
 b=JLVuA9+Vp5A7apBbaic6t+h4cwtGkU7iOkFonaHWqZt782MiUmbYzhFU7JTWczzPsmvEh0gp1F8eH6bXvxiKAwOSWFAJr/InKfGN2cE93ThXqhwfHz++JyeJZXnWQnRJMTC8JKUkHaT97k0SQGRYjhG2UJjB2BR2udx3+/BCdYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7823.jpnprd01.prod.outlook.com (2603:1096:400:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 00:50:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%8]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 00:50:28 +0000
Message-ID: <87sfe9eap7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ALSA: hda/ca0132: fixup buffer overrun at tuning_ctl_set()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Mar 2023 00:50:28 +0000
X-ClientProxiedBy: TYWP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cb4354-e665-4254-be18-08db235cf0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xciEWcnqzZ27JWZbz2HEJy1ft7i7N/EUtWZhkddQwVqg25iGkdFxUUklrREDC4YRuYr7N0bHquS7gqhg6cfXWdUD8Rc1rBt5Jhk6+1n1kw7uWbi+RzBbMfdYFM1sBSFH/29zBQ4urBWs7CWgsgmAIw9Si6MILU1p7pqty+5aGL884wKuu1xMG6dL/nToz3lUsjlyHf6dIw5+KMDz5RhwzxbqBFuDWpBnWuTYejXrcABaagxcCM2RqUTi38gboow3YsZWDSHOJJdOwl0rrJTRvUoxURGfzzsMgzOLpt2NE5ucE0DPMH0ETkr4FvZxVTUaNpuHwRoMjgTjYw6ZBlsbS8vwpesLL24jM91ulMhpqiflOPaAM+kGatuOOaceZ9bUXRMo0Qi23QkH1oJXhiabxstddRLtwq07WsjWkqjNTAFB4mWL1gefRxGgWlGQWKsm3QEUO+GPO9LqhCa4O7tf8yK9JRioTEfVM22Ap2nabQjVqqJ9YoTDJ0/xlQFqA5A3zC35gp8I+vZKzC8MF5hle2MUhHNhc//HiJG6UrVJTITFkDTH2tBPPx3FKVxEbygQPiVsCpZ1GCqWeQnvFoRyIL8fbeMz4n+JhKJUB/PLlJ0MybmrPQdXTD1HBM3uw9kEKZ3sRICDDub25NV5cRheKAq8rG8XT7Dlx28dC5oLgKFoHTRgzN/6Z1Cmj5vuTiIAxhe5eJoFHm8USmK6BuuCLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199018)(2616005)(186003)(6512007)(6506007)(26005)(8936002)(83380400001)(38100700002)(6486002)(5660300002)(8676002)(66476007)(66556008)(4326008)(52116002)(38350700002)(2906002)(66946007)(41300700001)(478600001)(316002)(36756003)(86362001)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aJyssC1fZEdFQqA4ddV/372yKWx57CLuZoSiIjA6ABZSeRv4pZ6ZxG9smz/1?=
 =?us-ascii?Q?OaJN3jbWPITH3VJj2wC3Ac84UL+/jlLtMudJp6idDpeXJ+8ThZ7gKj5YTBus?=
 =?us-ascii?Q?y1rOr5LyJOZ2OmP5UPBsqAPLx/ppFlOaYWJ0TWAEUpKCbzMExDpFvvW6gVdb?=
 =?us-ascii?Q?84U7ADLKUFzSQ42hVBU0rPrb2rFCrzaECBSDRYzSFGfy6KGsvAFoY9PKLsbB?=
 =?us-ascii?Q?8+/4hWS1CPFbKcyGrGZEhao2OB11JjEaSrI9kEsAMtmjfmiHME1oPvNo2on0?=
 =?us-ascii?Q?vCOL92v93xz77SUsc0ofbj+pYIRaOiIpS1o0qWp7kWwnjFb5BKnIvqm+y40x?=
 =?us-ascii?Q?9+LtVxeSe5pyEX3cgQ6wCBC0RCbnqcBiEpGDPHrGI9r/96q8W2qbfCBPEYou?=
 =?us-ascii?Q?6og/L+aggrUrh5djh8I5RRFUZLFVLI7dFtBT9I2/Zl1JwfYtLlqyg+VC7Lh2?=
 =?us-ascii?Q?zdQ7hZvc+c6JCShzT+JXIHDje4RNBh+KV0bhXloE+uBeSrmQYmi+MsjU0HQ8?=
 =?us-ascii?Q?7IWcOsIsrEIR+NoMlEqB+mVUbAKMv0cdGXhq7eEEGEMkQRMyxpuO8MHhQqr5?=
 =?us-ascii?Q?JhGTN7rxFIm0fdLmAaVHpt/4tuhCNhIuSi7gRqfOJ9V/xrv1tHvL2n5D49F+?=
 =?us-ascii?Q?t+RK6bxd6X2leuBd5ThhrvC25u/QlfzoT5NqaJ+1oHQABjBmZgVvqe/oOuJC?=
 =?us-ascii?Q?r7u5Ry9CLeMB06gST9sbVkCNJnn3RfJZdZOVs6/x443iCCxryZvRqzUBd4S5?=
 =?us-ascii?Q?TG5EolletSkduFeZo175bmMi5K6/Wa3VoqCb7mdLOp1yKtzJPQRPJewk9QNe?=
 =?us-ascii?Q?8z4/XYPmq43NO84nwua9yFWBnYsc3DteVZYtNi5eh4EGoWt4HxwjQmKB7nZd?=
 =?us-ascii?Q?KGcpS656cLz9SiW9tf0MU6ysKlqLeuR98tPgDu12fWs8BUkARy8dG4CoAxso?=
 =?us-ascii?Q?WjtYXpK4vpXeLzLi/MbN2OA18N0/PqDHHIPMwZZ9eIO++ne+Ss7ORiF6jD/L?=
 =?us-ascii?Q?167Td0IE1AMglt+lLh29MMWhNKuTD0khOFsBqg4Ln8ET8JJJ9Qp8c9CgsQHB?=
 =?us-ascii?Q?J9tX6eRYVagRBxTE3d2y5ks3kLTl/G6f6QS/nURHdb1TJPmYt7f3e5cXjKxR?=
 =?us-ascii?Q?tCnm4j5nsVo0iWX/Wh5vQV5D+DUfhLxphCRKJZ4zsjDbJxDvQ7U1ETe5XouF?=
 =?us-ascii?Q?CstghS2E9RGwJ3Y5YPOZ/bQDxLk/92BKVsi6nVNSDBKutdh4Ztt+d0y5iXyY?=
 =?us-ascii?Q?ZpmaOMNpjNWS1nSXO8AAWLTSkc4D4P0gylPLFiQdeZTWZaQNqxohSeekRCJP?=
 =?us-ascii?Q?QioUYunNMNieHMxsqOCrKxSIXHryX4jDP/ErycmNJHNMVHPUEOQPFnw0mF53?=
 =?us-ascii?Q?9RjG3mspaU5Sc/op83s0D1NS2KbSNY1zrgHnCWhz9Ztr/9rFBGgen/DMdhBE?=
 =?us-ascii?Q?pjRJs/t54aunQm7LW/HJyz19xMGgnqtD8kI1RP3YYLApfPkdE7hnj1vedLUL?=
 =?us-ascii?Q?4wbM6eNjNaBKTvpDoRNndmNbGLL8ugHaT73qs4ApHXkMBOgIuWyZh7GwVyB9?=
 =?us-ascii?Q?Va7YeUCBhxS6BIfYZ/ysr40vCpeG5FkEzFP85rn9MPcBEX+jpq3MiUM4wx+V?=
 =?us-ascii?Q?7V4PTvX5LxmGNYPNs8JB5ZQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 05cb4354-e665-4254-be18-08db235cf0d9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 00:50:28.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ACoXymsU3lIxiwz+QfHgmBVMmjdyAN//MZmtD8wEPd6qGqgEWEdxtDSC1UOTuZ4fnkNiDULnYYiqQugveqLwTogjghNYr5FUdNAr50HSijxqq0+LQWJLRD25Mvy0XvDn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7823
Message-ID-Hash: 76AGHMGULZFOGXK7KON7IO5PFYIJADO7
X-Message-ID-Hash: 76AGHMGULZFOGXK7KON7IO5PFYIJADO7
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76AGHMGULZFOGXK7KON7IO5PFYIJADO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tuning_ctl_set() might have buffer overrun at (X) if it didn't break
from loop by matching (A).

	static int tuning_ctl_set(...)
	{
		for (i = 0; i < TUNING_CTLS_COUNT; i++)
(A)			if (nid == ca0132_tuning_ctls[i].nid)
				break;

		snd_hda_power_up(...);
(X)		dspio_set_param(..., ca0132_tuning_ctls[i].mid, ...);
		snd_hda_power_down(...);                ^

		return 1;
	}

We will get below error by cppcheck

	sound/pci/hda/patch_ca0132.c:4229:2: note: After for loop, i has value 12
	 for (i = 0; i < TUNING_CTLS_COUNT; i++)
	 ^
	sound/pci/hda/patch_ca0132.c:4234:43: note: Array index out of bounds
	 dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
	                                           ^
This patch cares non match case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/hda/patch_ca0132.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 0a292bf271f2..5ce4b5f62983 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4228,8 +4228,10 @@ static int tuning_ctl_set(struct hda_codec *codec, hda_nid_t nid,
 
 	for (i = 0; i < TUNING_CTLS_COUNT; i++)
 		if (nid == ca0132_tuning_ctls[i].nid)
-			break;
+			goto found;
 
+	return -EINVAL;
+found:
 	snd_hda_power_up(codec);
 	dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
 			ca0132_tuning_ctls[i].req,
-- 
2.25.1

