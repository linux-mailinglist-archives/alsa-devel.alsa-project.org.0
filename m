Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BE16E3CFA
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 02:36:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F35B820;
	Mon, 17 Apr 2023 02:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F35B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681691801;
	bh=GEUdF9JsMfSOLFAnhalNoSjqblqXpNVqiKG9YQ2+qOs=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BLHAMl7nzrcifPh6WDK+k3aZuMcNM7VOIEtqan9v6uV3nez+y9rHPO293dh2GEHuy
	 m1726otj0nTuje4kAIzgd2pNxYzzfxFT/fL9gVAI3h1XzxFIc2sPEWV3OnL0dqywKR
	 Av88vvwDhz05diIZLiwXHDTIqEF60G2jjrMtNz50=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CFD0F8053D;
	Mon, 17 Apr 2023 02:35:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29300F80542; Mon, 17 Apr 2023 02:35:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAD18F8051F
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 02:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD18F8051F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KjE/Iqxj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1ZH7fWo7jI683i3X/Rbp8a3ejbo20LpldkhINWkRfpyY6k/r6SJ8VwDi6nX3Ct6ZJzJrihP4s8XGHUtPigmbMzOh9IwFZg8WGVhI4Mq96jSqmk0zGRYKdPbOT2PDZEhMwLZitBjowxvh/ruyjyNEPucOv9O4qm76ILJnHJ0lMg+gFeTxMIvqVKoVmIUCJEo9VeLxQ2ak6d7R0t7aD/aegaONH8usoECH7kvalGA7Fr6p1Eh7QpDGzwD1GfgRQxwPhp+v5nscKnqFZsNBlYFsZi3cN4SC8epumGWUCsT7QmcjZYzOk4K54hcqbRKmvxW3HS0/MxC/l/zyV3mvRUKbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+RsXLhX5apQtwR1gnZ0I9hKnwPXJ32PFXFN1MbLkcA=;
 b=ZjqWkD50jU/tcfbPv8YVXbwf/5lxn1vQcyMVatrwDpLt1KYnv84ZZR1EswKgiS1VnaCRTaIQcgpKwpt4IozqN5Dlrsg2HY7QdMfSRBjeGq+ArSHB5d6uBYWcrqg71a/0kFGnJy7SPOJ0cdn1tPe6AxG46xS+Ab50Cm3oF+UO+X/1ydR9wKrDOnKfAS5OggD+d+gMgeLo9D3hUJcPuEQ6skIUwChTOJ/bFopUF1Dths/1Ob9iA12cfcpCK7BC//gNpodaOZGY0dQhG0SPzPqEwAF1KGugfAuY6GUnDyQOn31S1TY3vPKViZc7HscpDNlgp3VmHrNpWI9b0WzhEnZSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+RsXLhX5apQtwR1gnZ0I9hKnwPXJ32PFXFN1MbLkcA=;
 b=KjE/IqxjXBK+vVkp2YDvAEN3FJan4AC/wZAZfO1AnsxYJgWGLXPwaQcPlkZkYLZ/z9qL5MqkZ8P5JG7Uqsw812+EDdAUqSto12iOtDs/GFmA/ZtK6oDyf4uStEMUrYOb3VSVBBXCFkqEzQTR4Cpe2A4qoHJKcbH/2GWZdd99swE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9388.jpnprd01.prod.outlook.com (2603:1096:400:1a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 00:35:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 00:35:08 +0000
Message-ID: <87ildvtkg4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 2/3] ASoC: expand snd_soc_dpcm_mutex_lock/unlock()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87leirtkh2.wl-kuninori.morimoto.gx@renesas.com>
References: <87leirtkh2.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Apr 2023 00:35:07 +0000
X-ClientProxiedBy: TYAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:404:15::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db42257-ba15-486e-552f-08db3edb9866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TPNU243O3LOQqg8CaGxrbMBYMFwi7DnPkQLZdXHhjYYaRi3BGvcLioCQWJ3W6mp9yc9iEt4A21q0aQFhsGFBFZHB7kiu+OFfbD25lJR4DknAPhWtY2xBG+LnZC48eHri/2ZdJW/cbfoTWPr1CV+Pq0VnuyC0aADAAVpnYlm4lxDXM0Qa8qBl7Raz6mA7NRrzDFaWArB2Im3q/fQaziV48CmbEI2n+SVCbvYJnC5CGQyMmwr7+LPlyAw15IU2Nh91byNmK0xI46tpEzmXXvc/qKUgPw3rTtJIUUxHbmW9JxpSg9HpDGdwIKAVQNOlwupBYJzEAzoYnZZ4zD3TXQjF0PYKqINQ4wajOQh+JROpvFhZ1/5ESiGTNDAu1iQskw9kEi/mjTtaFraIVeeCJx4fRZhH4uGFOhK6BMTmoBTTfaIemTmCGUl8Kb6aFQSF5nOe+EoMGh8lMM+jM/GrhdikVjDStcoqg8NtGDG20MJkYh7TiZcdySNKapNu8AubhpQCIj7FM835YAFv0JURuDv74IRVTM7xRP/0AJXgwKhSumRgpOWAdpq08zvzbPvymC1u91MsjQECR7IL+jhq5HrYuQ1tnMNUmJUwwuU47/5C5rMoyuSsHsDRVEJcBmPSKIhL8boQypG/iFRzToalyfG7ww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199021)(36756003)(2906002)(30864003)(5660300002)(8936002)(8676002)(41300700001)(38350700002)(38100700002)(86362001)(478600001)(2616005)(6506007)(26005)(6512007)(186003)(6486002)(52116002)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(83380400001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b3NzCd9OPKZIZCNRmW2oey6bmkXSD65rSRmGDSVTeN5s/K2QZCkeKtJVK1YN?=
 =?us-ascii?Q?PBrvQ3poIoT5T0a72+alLZvjzQRYqr0/OMxhH9B+cJcg/1m9c6WCWu4FwiQR?=
 =?us-ascii?Q?u1ki+pkPhkKcKmWXAWrgP9choBqcqRgsWn7vf1/VjPlTAEBaX8CapJ/EwLIY?=
 =?us-ascii?Q?aEShERuYOjh2MbP4ONnAFr39dr4rSLyiod28ihqFyVXOSyyl+pq9QMwguvbR?=
 =?us-ascii?Q?slhw5nPoV3KP7qcxZJiFRUYXaFaYV85jqY371iSd78zAxM4WKBK4z5pn+OHM?=
 =?us-ascii?Q?3Z5vVlZChUYSU9nYZZ2rkmYLfocGq1O+YENJY0O4/Fz5XqXNFWnVFlvXfWam?=
 =?us-ascii?Q?ZFKP4UWXswBaqdDaDd6KDhneJaUUNFC8B7zYmLYb1vPOOx0imFM2Y6Qf8Xk+?=
 =?us-ascii?Q?hGcw4yecC/WU0/1c2vrUUaX5PwdWOUs518PTeRJ6a4xaYjUVD2G98S+/Cfpy?=
 =?us-ascii?Q?mTCLWQjXS37/FP4X+Eezwg4/41op/kS+6RUwWklj57ngpDIa4pnwDQx2BPJG?=
 =?us-ascii?Q?J5vPxBx6c09oOuso5uLmtTxS3fSIyzL+OhcVONnIY1iwf7+t0TYfpV4iY4jS?=
 =?us-ascii?Q?Z5e9VhyzQhOcaUvXwId9iMZkSzuivRBiA82VWLCoyG5iUOf4u9LfvykKqODo?=
 =?us-ascii?Q?/3pzwvch50NxpPfPbKb7WFezSwhk7zA+MYHBa3+Gn1TvS+Ahch0zvwsjHRVW?=
 =?us-ascii?Q?th/OZhBx3uTOpbK9F5sXmUN70khM7zHnIh3P0qYD4U2/Arkp/PEpSrOHsagg?=
 =?us-ascii?Q?ajteSd5qnvMJ67LjGsTSVFummK6CqxdqHU/kzkznz5EUA2QB2jLt6KrhidR7?=
 =?us-ascii?Q?1PT6+8vr9e2gLfbgn8JizfGsBJ2o8rxmG1JfEuMj4imMDzZKB9R3RtCFlu8J?=
 =?us-ascii?Q?Iwucf7yz4alRMEhHq0U+Y/NUDvmWx4CIFYo9tND9OluUuV2q9CViblTIpuiY?=
 =?us-ascii?Q?jVbN4RIkcGusmCkvIsvmCp/T/2/tyEd6qTehNRFiJbZiA/vWKWhFvWcCaqFS?=
 =?us-ascii?Q?oXRWDIiRsmQy25y0vvSAQ6GdQ3BPLEeIeGiJ/eC2ZakAJEhGG/Db7EGIpuYq?=
 =?us-ascii?Q?f4+BcpXmUpQ0otS2TBpB5zv9jN3OWRNXA687Uv04+Z7wYQgpBdhMJOVwYWSV?=
 =?us-ascii?Q?xkvLXo8KnQ9yuCEJ4cOFNHz0s0Tipp5EtsJiUdv39jBpDl0Db5HcHiMGqIwL?=
 =?us-ascii?Q?x1Z0Kbd+wNLGZ4EVzUD91wXP/zE7wl5iCsNXyP/ny4NFVteUIInmeJa7dwXh?=
 =?us-ascii?Q?/SyuOWFGj6WD2SEfAfziL+gpD7DX9pBbI6AtBEdzsnIl7X/kwwU8P9M4jwuU?=
 =?us-ascii?Q?qL+fjM6/UTJo8PoPSwDGHX+O5bmUAYMbtvafF58h2THJBaZrUzxshviFYznJ?=
 =?us-ascii?Q?2BZoSguVl9jL1b2pPOo3t3zBWOv/7CZJvw4whZrX7z+rWinjSeSe2gkZlAuF?=
 =?us-ascii?Q?4Ixs3TX8BVQK47++B3b0ybhIJFP4AH8L6+MnAlCY/NQHKCtIdn69rFoqN+Wm?=
 =?us-ascii?Q?M2lvXh9GcTD+ngxPXtw3bWcrBaWKY9TFwunw3UdZELjP/zwWoxzYR34he/+W?=
 =?us-ascii?Q?r6AX8iZlJBuVorhdeEgihwsPK4ESfikauDjt6xCMIPs4J9CMsCHIVLIoMAYk?=
 =?us-ascii?Q?O2LtAY4ucCLwNPyXgkbvdbc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8db42257-ba15-486e-552f-08db3edb9866
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 00:35:07.9769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VniqVN/CXltHJWqpQdY1Qig0CZzsPRf3ojh4ymb7Ha1sqjik3KTBm9uUUWWlOWkK+e6iZiemYqL7I4BZhVH1s6Ab36ByuF8xDrp5feBShrZebvnYNiakPKraDYLDcd8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9388
Message-ID-Hash: QW66HWMGQZU7CZVS23QCOUTS333XI2SO
X-Message-ID-Hash: QW66HWMGQZU7CZVS23QCOUTS333XI2SO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QW66HWMGQZU7CZVS23QCOUTS333XI2SO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc-pcm.c has snd_soc_dpcm_mutex_lock/unlock(),
but other files can't use it because it is static function.

It requests snd_soc_pcm_runtime as parameter (A), but sometimes we
want to use it by snd_soc_card (B).

(A)	static inline void snd_soc_dpcm_mutex_lock(struct snd_soc_pcm_runtime *rtd)
	{
		mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
	}			   ^^^^^^^^^

(B)	mutex_lock_nested(&card->pcm_mutex, card->pcm_subclass);
			   ^^^^

We want to use it with both "rtd" and "card" for dapm lock/unlock.
To enable it, this patch uses _Generic macro.

This patch makes snd_soc_dpcm_mutex_{un}lock() global function, and use it on
each files.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h       | 45 +++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-component.c | 12 +++++------
 sound/soc/soc-compress.c  | 42 ++++++++++++++++++------------------
 sound/soc/soc-core.c      |  4 ++--
 sound/soc/soc-pcm.c       | 17 ++-------------
 5 files changed, 76 insertions(+), 44 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0e17e3230c7a..05004c048dd5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1425,6 +1425,51 @@ static inline void _snd_soc_dapm_mutex_assert_held_d(struct snd_soc_dapm_context
 	struct snd_soc_card * :		_snd_soc_dapm_mutex_assert_held_c, \
 	struct snd_soc_dapm_context * :	_snd_soc_dapm_mutex_assert_held_d)(x)
 
+/*
+ *	PCM helper functions
+ */
+static inline void _snd_soc_dpcm_mutex_lock_c(struct snd_soc_card *card)
+{
+	mutex_lock_nested(&card->pcm_mutex, card->pcm_subclass);
+}
+
+static inline void _snd_soc_dpcm_mutex_unlock_c(struct snd_soc_card *card)
+{
+	mutex_unlock(&card->pcm_mutex);
+}
+
+static inline void _snd_soc_dpcm_mutex_assert_held_c(struct snd_soc_card *card)
+{
+	lockdep_assert_held(&card->pcm_mutex);
+}
+
+static inline void _snd_soc_dpcm_mutex_lock_r(struct snd_soc_pcm_runtime *rtd)
+{
+	_snd_soc_dpcm_mutex_lock_c(rtd->card);
+}
+
+static inline void _snd_soc_dpcm_mutex_unlock_r(struct snd_soc_pcm_runtime *rtd)
+{
+	_snd_soc_dpcm_mutex_unlock_c(rtd->card);
+}
+
+static inline void _snd_soc_dpcm_mutex_assert_held_r(struct snd_soc_pcm_runtime *rtd)
+{
+	_snd_soc_dpcm_mutex_assert_held_c(rtd->card);
+}
+
+#define snd_soc_dpcm_mutex_lock(x) _Generic((x),			\
+	 struct snd_soc_card * :	_snd_soc_dpcm_mutex_lock_c,	\
+	 struct snd_soc_pcm_runtime * :	_snd_soc_dpcm_mutex_lock_r)(x)
+
+#define snd_soc_dpcm_mutex_unlock(x) _Generic((x),			\
+	 struct snd_soc_card * :	_snd_soc_dpcm_mutex_unlock_c,	\
+	 struct snd_soc_pcm_runtime * :	_snd_soc_dpcm_mutex_unlock_r)(x)
+
+#define snd_soc_dpcm_mutex_assert_held(x) _Generic((x),		\
+	struct snd_soc_card * :		_snd_soc_dpcm_mutex_assert_held_c, \
+	struct snd_soc_pcm_runtime * :	_snd_soc_dpcm_mutex_assert_held_r)(x)
+
 #include <sound/soc-component.h>
 #include <sound/soc-card.h>
 #include <sound/soc-jack.h>
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 3cd6952212e1..ff25718ff2e8 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -550,7 +550,7 @@ int snd_soc_component_compr_get_caps(struct snd_compr_stream *cstream,
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->compress_ops &&
@@ -561,7 +561,7 @@ int snd_soc_component_compr_get_caps(struct snd_compr_stream *cstream,
 		}
 	}
 
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 
 	return soc_component_ret(component, ret);
 }
@@ -574,7 +574,7 @@ int snd_soc_component_compr_get_codec_caps(struct snd_compr_stream *cstream,
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->compress_ops &&
@@ -585,7 +585,7 @@ int snd_soc_component_compr_get_codec_caps(struct snd_compr_stream *cstream,
 		}
 	}
 
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 
 	return soc_component_ret(component, ret);
 }
@@ -638,7 +638,7 @@ int snd_soc_component_compr_copy(struct snd_compr_stream *cstream,
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->compress_ops &&
@@ -649,7 +649,7 @@ int snd_soc_component_compr_copy(struct snd_compr_stream *cstream,
 		}
 	}
 
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 
 	return soc_component_ret(component, ret);
 }
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 6e74a6c48986..661e9d70994f 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -62,7 +62,7 @@ static int soc_compr_clean(struct snd_compr_stream *cstream, int rollback)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	if (!rollback)
 		snd_soc_runtime_deactivate(rtd, stream);
@@ -84,7 +84,7 @@ static int soc_compr_clean(struct snd_compr_stream *cstream, int rollback)
 	if (!rollback)
 		snd_soc_dapm_stream_stop(rtd, stream);
 
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 
 	snd_soc_pcm_component_pm_runtime_put(rtd, cstream, rollback);
 
@@ -107,7 +107,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 	if (ret < 0)
 		goto err_no_lock;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	ret = snd_soc_dai_compr_startup(cpu_dai, cstream);
 	if (ret < 0)
@@ -123,7 +123,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 
 	snd_soc_runtime_activate(rtd, stream);
 err:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 err_no_lock:
 	if (ret < 0)
 		soc_compr_clean(cstream, 1);
@@ -146,7 +146,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	if (ret < 0)
 		goto be_err;
 
-	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(fe);
 
 	/* calculate valid and active FE <-> BE dpcms */
 	dpcm_process_paths(fe, stream, &list, 1);
@@ -182,7 +182,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
 
 	snd_soc_runtime_activate(fe, stream);
-	mutex_unlock(&fe->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(fe);
 
 	mutex_unlock(&fe->card->mutex);
 
@@ -209,7 +209,7 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
 
-	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(fe);
 	snd_soc_runtime_deactivate(fe, stream);
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
@@ -229,7 +229,7 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	dpcm_be_disconnect(fe, stream);
 
-	mutex_unlock(&fe->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(fe);
 
 	snd_soc_link_compr_shutdown(cstream, 0);
 
@@ -249,7 +249,7 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	ret = snd_soc_component_compr_trigger(cstream, cmd);
 	if (ret < 0)
@@ -269,7 +269,7 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 	}
 
 out:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
 
@@ -327,7 +327,7 @@ static int soc_compr_set_params(struct snd_compr_stream *cstream,
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	/*
 	 * First we call set_params for the CPU DAI, then the component
@@ -352,14 +352,14 @@ static int soc_compr_set_params(struct snd_compr_stream *cstream,
 
 	/* cancel any delayed stream shutdown that is pending */
 	rtd->pop_wait = 0;
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 
 	cancel_delayed_work_sync(&rtd->delayed_work);
 
 	return 0;
 
 err:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
 
@@ -404,9 +404,9 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 	ret = snd_soc_link_compr_set_params(cstream);
 	if (ret < 0)
 		goto out;
-	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(fe);
 	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_START);
-	mutex_unlock(&fe->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(fe);
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;
 
 out:
@@ -422,7 +422,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret = 0;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	ret = snd_soc_dai_compr_get_params(cpu_dai, cstream, params);
 	if (ret < 0)
@@ -430,7 +430,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 
 	ret = snd_soc_component_compr_get_params(cstream, params);
 err:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
 
@@ -440,7 +440,7 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	ret = snd_soc_dai_compr_ack(cpu_dai, cstream, bytes);
 	if (ret < 0)
@@ -448,7 +448,7 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 
 	ret = snd_soc_component_compr_ack(cstream, bytes);
 err:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
 
@@ -459,7 +459,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 	int ret;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	ret = snd_soc_dai_compr_pointer(cpu_dai, cstream, tstamp);
 	if (ret < 0)
@@ -467,7 +467,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 
 	ret = snd_soc_component_compr_pointer(cstream, tstamp);
 out:
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9bbcff492c1e..4594505cdae2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -348,7 +348,7 @@ void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int playback = SNDRV_PCM_STREAM_PLAYBACK;
 
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(rtd);
 
 	dev_dbg(rtd->dev,
 		"ASoC: pop wq checking: %s status: %s waiting: %s\n",
@@ -364,7 +364,7 @@ void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 					  SND_SOC_DAPM_STREAM_STOP);
 	}
 
-	mutex_unlock(&rtd->card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(rtd);
 }
 EXPORT_SYMBOL_GPL(snd_soc_close_delayed_work);
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 1d0c3d57f66d..7247f44faa1c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -49,19 +49,6 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
-static inline void snd_soc_dpcm_mutex_lock(struct snd_soc_pcm_runtime *rtd)
-{
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
-}
-
-static inline void snd_soc_dpcm_mutex_unlock(struct snd_soc_pcm_runtime *rtd)
-{
-	mutex_unlock(&rtd->card->pcm_mutex);
-}
-
-#define snd_soc_dpcm_mutex_assert_held(rtd) \
-	lockdep_assert_held(&(rtd)->card->pcm_mutex)
-
 static inline void snd_soc_dpcm_stream_lock_irq(struct snd_soc_pcm_runtime *rtd,
 						int stream)
 {
@@ -2664,7 +2651,7 @@ int snd_soc_dpcm_runtime_update(struct snd_soc_card *card)
 	struct snd_soc_pcm_runtime *fe;
 	int ret = 0;
 
-	mutex_lock_nested(&card->pcm_mutex, card->pcm_subclass);
+	snd_soc_dpcm_mutex_lock(card);
 	/* shutdown all old paths first */
 	for_each_card_rtds(card, fe) {
 		ret = soc_dpcm_fe_runtime_update(fe, 0);
@@ -2680,7 +2667,7 @@ int snd_soc_dpcm_runtime_update(struct snd_soc_card *card)
 	}
 
 out:
-	mutex_unlock(&card->pcm_mutex);
+	snd_soc_dpcm_mutex_unlock(card);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
-- 
2.25.1

