Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6394A93712A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 01:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47005E68;
	Fri, 19 Jul 2024 01:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47005E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721346027;
	bh=F2UskFabeu8dcoyiWll7u/q3jC72ZkeA0VLw0s4OuI8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gGUhXSpdV6O8Vnt3Joc/9zvS+3K8lfe5YZMt+ioZivLGnSkmBV9m9dtJ2NN7CE/M7
	 iPgOnmCun3EgVzPqnqXoy7TcqGJU0psKPkgKUEgzh8PfIjYqs1UXeOWV0Ln/NSBq/1
	 u1hr/9/weFFIfwaXIdDOZwZmI7rcDMnHHO/q002I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7558F805C0; Fri, 19 Jul 2024 01:40:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B737F805AE;
	Fri, 19 Jul 2024 01:40:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B08FF80568; Fri, 19 Jul 2024 01:36:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B80CF8026D
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 01:34:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B80CF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=U16Prgig
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nryiFbW+oEMlWcqS6Er3bti7Do+pLwYbP4qnweR7POA3unWLRIYANhODYPuhQFcJVg+Qfk1BuK22848EWHABT+Em6iwY/8nEz0aAreXxIc562d4QUC9KVUDIxMSQl160L4oLD70336A7sWBDmBS1vpW85SL2JMq8svydtxDo9UcsgYEyW4LH9mMVRolQ9Wcutc2Hho5U3ZL/RMhzzzTsdr8qQJ2+u//HMMeFUA9aoNp0cWJ+9aOScPMn/vFEs3qpwiKnPDDFpZqF2Mb145tp1xEyLlOr0S9L4t8YPTbEzcpY9d03JLFQeXBu4kycei5UAfAqQ40GqdrjI85B48wknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wmRbdq4Pigsdr7F7mYCn6ASMnWQF5rd1pcGSubaTQ8=;
 b=juyt6AybySia60AoEXJeOtIgueCqVV7D+73B+eOziLzmdowF56JW+Tr9Lvz7pW/3txOl3YeBs4LqMae3olWefbFDcZ1gy67+Xv1DpNDjClrp16maWazgJ5QJ1SjHYDyzleDpFwOFG5FYCjoVQ8xIWmBH8V4BC6J0mIgYHa7GFT3c60SXNrT5UCS8KMejTxGQ9dhuO4HJZ4BJY/WoLpehzJeX7yj0x1pfGq/ip9gk9mdmoS3S5F/0m4u/4bio9NyV1C1NgGxa22cCoXxZQEqi4Wtt37Hy970XQwUy2lnzqDE6EociOwgGIF/zEXW8FqLYaLVu1hxA+hu311wmciJSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wmRbdq4Pigsdr7F7mYCn6ASMnWQF5rd1pcGSubaTQ8=;
 b=U16PrgigBmFx/zmMko5oOk3vtgqYno6TYdpaCFsMjQRGwQiGd01MOQtcVBY7gkHKX1Oa1h+N6+mLmSyEesaqpbJj1YNSNAk01tXIq7fh6STynYyslt+eDLEPzcQtWUTjTtmB/fTAxLI4ow8+iIgRLY1xQNXlk9mU35xQsh4fNU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11460.jpnprd01.prod.outlook.com
 (2603:1096:400:388::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 18 Jul
 2024 23:34:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 23:34:33 +0000
Message-ID: <87y15yl1fa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 01/xx] ALSA: add snd_stream_is_playback/capture() macro
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Jul 2024 23:34:33 +0000
X-ClientProxiedBy: TY2PR06CA0041.apcprd06.prod.outlook.com
 (2603:1096:404:2e::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11460:EE_
X-MS-Office365-Filtering-Correlation-Id: d1356b69-c1b2-40d1-8f9e-08dca7822dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/9Q6YRsSDX0kurKVSLbBqoOuM4izXcSh/t8AKMaVmNKR6q24amObZxhlLZna?=
 =?us-ascii?Q?M1Zl7mSLebkdZC0eKEpg81RBkyGSi3k/USY5DdofPwNoDD0YkzSCny9UH3uo?=
 =?us-ascii?Q?heS6Lxc4MbEWzkQqvGe1VYVfFS/71IjJcqurrEdZFvWswmWj2BMhWLPDKrwm?=
 =?us-ascii?Q?Dmtq9kRlI8U6Y1uEhiDt6lqVJMSNx4k3PbusVC7L1BvwSyIF5+XLzlHdhIRD?=
 =?us-ascii?Q?qOmQMyWxA5lF390G2MlVhLoRtSnOFrJjvS+SGoysnGJkTXv/elFvJ5/t0x6M?=
 =?us-ascii?Q?QSaFn/VFmx45DAxHHQR7DPw1cfwlYIRYDQVxZ0BULF3lEdqxnlhxXEZa4GLt?=
 =?us-ascii?Q?kcyLXvqy1DNec13ufSTigwUNoMa2BdtIGdju5PIFM0BC7ZwmklbKXjFN1y6x?=
 =?us-ascii?Q?PfJMgnbGn2sQ6iv6MRGO27s+kpxvnqnwHAgJnviwK2hNR7as++GItpIn9dgK?=
 =?us-ascii?Q?+9+wzUuWGSQptjGkWPXpylOFP9L8mGFQ8JE65OxiRVMf86GxW6jGIcm25sUZ?=
 =?us-ascii?Q?9bJWz4uvpBP84CpU5rjWZ9/Hh4og4PC7auPw4HHW0PAgjKSSCFoZg2gU/63q?=
 =?us-ascii?Q?Vyuh6p5N+vlm2x7cgf7tDp86qm+TSn1hbinoU/tGKk1UX4ObDtHYrSmByyHj?=
 =?us-ascii?Q?+paycWl52381SXIlKLl2ANaJIr5hNpvWpq+wWejzqSh/zm4aGJKn6RbgOBao?=
 =?us-ascii?Q?Idf3rrU2FYuAFo9dNVPHuN93VjHdwJm5xTqZOiuPuSDZuTjooRc2msYTaPXh?=
 =?us-ascii?Q?xwMbdDOHmHAQNQR1evQvqMD/mgf4zC2BfMWtFOUVcYsfyV8LUY928Pv/XCDX?=
 =?us-ascii?Q?mkygDqUZuksBgf47ERRKlAte60NJbswTRacMbPV5GInS9Saaka27TmerL0kS?=
 =?us-ascii?Q?jJVLPEP6PnTos/8t5GTx7asdj/YjS+4fPuChgE1FujPWLy6vp+bzqtEipwAE?=
 =?us-ascii?Q?idH2KTlKAdLuIQ24VjlilkqP+DlwO77ZD3Pr8+xOqfccQ5NyQrmWagbr3PPt?=
 =?us-ascii?Q?76KSuovvEJSt/QzHuFRT2B5HvQDDgshHPnqWJLwawcqKTYqOTJFQ4zwJYQ+a?=
 =?us-ascii?Q?lbHLAONI3s3jgS+uxc82tiWvrdL/FfyeB5BsuY4QFRDRi4DoNupFgLXnl2XW?=
 =?us-ascii?Q?bgAiecG7+/fG+evmQQPrh98NETOgr+I3DCe9n06D0Efr4wBD2/R5c/3Uq92n?=
 =?us-ascii?Q?9DdOM3TMWSqo8OzlNEy+1PF+mBWP5icgjfuYXECbYzuvwdANkM50RcLPiM7j?=
 =?us-ascii?Q?V6YJt9NV/EJeB42zpINaG8C5TDUqgAENb+x5M5hViV0J9xjCX0C8eax3Hke+?=
 =?us-ascii?Q?4E27qiraqDXOpoXcL/bNYJShCK43/cOpEt8ngx5uZmDvun0GRP8yfC5y562T?=
 =?us-ascii?Q?k0CboDW0c/+vp73BttcVMVyvExROYzgS6jsUXh7bBV3fE1Ns+w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vaYvov1lk2RjOY4EPeeyeyOQlkxZKTDhQzW99xZkTU2sojvn+bdyLaDAtg5T?=
 =?us-ascii?Q?d0OcyatcDIOiWlnqtRay8EMSJxscCgbp21Z0vCBVsxFqUg+Hq/EPfcpTwKgj?=
 =?us-ascii?Q?onR/EreLhn9YEdDSnwJmO1Mxt97wupio7aE+aa8AsbWO32KjKIvtz5UdAqKX?=
 =?us-ascii?Q?CMelC+hkJHgEWNxhvojI7UVKgGHBH6e89B7wM4yrlpGhRT3wIZe+8hdZTw8n?=
 =?us-ascii?Q?Mv3y8Re7mX4i2S/X6WDH05/q271B7a9PtdT8/djNho4o+cvdJvZJzdhX8Le/?=
 =?us-ascii?Q?ugFFs/n5jDcojqgZcHDYjgZUJY/voDYumpZIg7ywm5NmO4P7fSQjYpN/eBP2?=
 =?us-ascii?Q?M7TDsz/Ts0rRQA/F0czbZzGhauZppzjAS9krDy43XNMz3nLJmU2hm3NUTcSp?=
 =?us-ascii?Q?U+xtod0ECWhqOF/qaMhJBXNAun7ecC0lDoMtjs44uJkCpC0xcNYHKIgb/Iun?=
 =?us-ascii?Q?QNS44CujQNEb0F6jaPdGQCElj7kI+P7hY66bXgKUf260h2czycVcIa555n2s?=
 =?us-ascii?Q?Ebn6efcByNBs1PdGwPVYpu7ibPPf+US/eNzWP2y4R2hSqPs4+JOhgzIfCX86?=
 =?us-ascii?Q?9YSB8fByiz4G6CxpZ1ec/p+6rZb1YjdYWIjgHuMj7HHhcKQk+xRbGM6sXR0V?=
 =?us-ascii?Q?njTnstdgZYZUQHC6qq1dz6GEqvS9si3vpsIjRk15ZD8ojQYK4kGAzcwkugpt?=
 =?us-ascii?Q?qabUd8tu2hbLN1cKhFwxk86RgBvUtpAmPQiF5sm8on3dzBaWCHdWXDzOlb+I?=
 =?us-ascii?Q?0ByciUNfZLgh0UI7q3SfGkGUXAkWALS+bjUY8SZeIN8S/foT4ELaECcXni/S?=
 =?us-ascii?Q?NZ62cD8YldTehnOdRalxhwVYhYuM6QQXi2ZqewK1osQacEHzZGeKCuta907c?=
 =?us-ascii?Q?waZRXu9OLMuAHdlkjh5pt50e9y13tBBKSHjl1Wv8CUK3C3Q31Lu6naxHL0NE?=
 =?us-ascii?Q?LwVc88hGxwvJeiHuos4Q7p5Zvd8b7ocZblng02o9TgD1+o1br+ws6lEbdHrw?=
 =?us-ascii?Q?M13VlRBFPx0j/vWK5sxkOH94ygO0pS3G3xf98rweKG5uC3fEY0d7AdiJsKUc?=
 =?us-ascii?Q?2qDHUbv1GIxSelmVwiIxPDNLxeLp4Iem3ATmXoDKXc7xWYCaIbtKo9EmLTVh?=
 =?us-ascii?Q?e4QFGmDeaLvBscfm2aJDtuvKKMJWRPmWDUHKygNbaFSQMj6tskYpeZDyWQVN?=
 =?us-ascii?Q?AMxoaCrCeSp78FXKJeF5OGq2WUVlOn+7o0v9NamSP8JODkocH+xDxCnkqUyY?=
 =?us-ascii?Q?S1TLHfaNbqQRot35Geq18nMYcXvVCl7Wrdqzspe0CcqXw/R6nAaTX/ylqBDg?=
 =?us-ascii?Q?Q80fkZx1kUACAWMpnUumIEwJFSIzmCPillsEwHFuixSF7TdwZbudkxxv9NPX?=
 =?us-ascii?Q?eWqf+KvnnjP97M9duIu4kSPIhinywoVUed07RssyUcMEi/rdxdGTm7NbaXKW?=
 =?us-ascii?Q?8ntE//5fXjmLsJNJzZDdPPiHhVQlhuQfwZwCPKaArmDjPUp2HZIqG0IFB2Hb?=
 =?us-ascii?Q?FTMcZEbQYHarQsExKS5dmAVF4CYaux/6CKT875D9Z+Ywo8ElpVb64ZtI1l76?=
 =?us-ascii?Q?RfUBE1zylNXHl6Fu8Y8ITs9o/UvpvCnFogPEuXIsf+8BkMzAuFltSmD+zUuG?=
 =?us-ascii?Q?9NE5wuj8c4bfowW551CYk5o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d1356b69-c1b2-40d1-8f9e-08dca7822dd6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 23:34:33.7075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JGxX3E1hPmXAaKb39qrFH6Cqi5qB18uZY+vJbDwnQnt1RQToQcE2MNctmRBxhvClkvdPzN3eo4Fge4FFfw+38pCE4rRm91IvPWsQEUxfuBDevZQu0LpP/267G7pJshk5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11460
Message-ID-Hash: K647ZQVPFPKOWR7LXCAXUXHEWSZ5G7SS
X-Message-ID-Hash: K647ZQVPFPKOWR7LXCAXUXHEWSZ5G7SS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K647ZQVPFPKOWR7LXCAXUXHEWSZ5G7SS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many drivers are using below code to know the direction.

	if (direction == SNDRV_PCM_STREAM_PLAYBACK)

Add snd_stream_is_playback/capture() macro to handle it.
It also adds snd_substream_is_playback/capture() to handle
snd_pcm_substream.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/pcm.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 3edd7a7346daa..024dc2b337154 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -501,6 +501,25 @@ struct snd_pcm_substream {
 
 #define SUBSTREAM_BUSY(substream) ((substream)->ref_count > 0)
 
+static inline int snd_stream_is_playback(int stream)
+{
+	return stream == SNDRV_PCM_STREAM_PLAYBACK;
+}
+
+static inline int snd_stream_is_capture(int stream)
+{
+	return stream == SNDRV_PCM_STREAM_CAPTURE;
+}
+
+static inline int snd_substream_is_playback(const struct snd_pcm_substream *substream)
+{
+	return snd_stream_is_playback(substream->stream);
+}
+
+static inline int snd_substream_is_capture(const struct snd_pcm_substream *substream)
+{
+	return snd_stream_is_capture(substream->stream);
+}
 
 struct snd_pcm_str {
 	int stream;				/* stream (direction) */
-- 
2.43.0

