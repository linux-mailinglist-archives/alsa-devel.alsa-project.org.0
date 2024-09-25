Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099779869C7
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 118B0850;
	Thu, 26 Sep 2024 01:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 118B0850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307688;
	bh=vjNpnhzqDXKnDqxEBw5ae7eG6dClwdQsA+gJ59PpyqM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rH7iJtO6TRxnX7mLn4YUmpeHF4S/8AQpjfT44Kg40HQGkT8bvFEzHpDMH43xVlnIU
	 KhMuqHFokNodwD5MIVvkt7f6RMRAygyAtoRoRMOtC8WNf4mLJWbmdQsHJZmRgZHKGZ
	 XwjaY0nlrQL+5jrbTtH0PNZj54H1N5or8jr9jxuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB557F805E7; Thu, 26 Sep 2024 01:39:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D87AF805D7;
	Thu, 26 Sep 2024 01:39:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8456F805E7; Thu, 26 Sep 2024 01:39:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EB6CF80527
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB6CF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dp/yBblG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ND2fevMVh6k5DI1UKU78nrVRbkHy1kIt7bRO1Q2tMBFHTWRHapulwWvuX2lSx5aLv9Xfx+tsfYiaX6ut5mPB01HEpbDS8astsc1a1PjAwjzngAVyUfUDkxk8H8Vd1isPQZDOzxmNPR8TLhz61y5p5IwVzl3ghNLWRI2HQjbMC3poHuji1SiItcGDffolLZ9ocTx1j37Fv/HTYPEb+vaQWufqxXJSfHeZFJJP7tzXJa1+cqd2slOGA4ZQ7ske/v+7XZDn0jfGK2affvSGWHz1QDPd6xh5F0b4UuIREFUbwahKMaGdRjk1Rm7eA1ehaf8OPBpVPSuhPz+M1tyldz+Uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qZznr1N8LMHa3LmfkvpMN3i4ohaD3VbMCuyex1GicM=;
 b=gcWhrDFZiBm4jJArP4uLMuslmRkaDTfBOjddQG15EhBpQSbVZmeocefJVGRNeiHPLABh1M0Gnj2FNijGKzOwXdCZUNvyTlxSn+Jr1cZMiIG14loTkDPB0Tyvgdp8cfL+cwGSkZwm3eiALIAbsjudTl5uha3qvK90Rs+SI3QbGCLmOV25kQczEjJFc4N3uuXHL/uuWsYKaff35cMPgqGnXcIjqi0cbG0xK/azdw5SM8XAu/IOl/ZPeUJUepc7Ws+G3Wa/LCL7qEtD65sVBl27Vq9Q6g75SAllvZIZS1Lt86kmmcN7vFjQHBS0qtRvZm49Li21NhdxO+83xfF4agRkkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qZznr1N8LMHa3LmfkvpMN3i4ohaD3VbMCuyex1GicM=;
 b=dp/yBblGlICOvJsKLrsCEKYDWXfKFkl2+JfBxfloO0vixtvpE5RLLu07yJUb88/rxx3tc797/40e/l6zWeX8/sLtIXw7I2WYJSgJiCcPv7YlmE4698pVNEcRnknNQWut8eiC5ejkGqUsYymNQIUFs6Fa2IkwsK0yeQZboMBbtck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10634.jpnprd01.prod.outlook.com
 (2603:1096:400:292::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 23:39:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:39:36 +0000
Message-ID: <87ed579ubs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/13] ASoC: soc-topology: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:39:36 +0000
X-ClientProxiedBy: TYAPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2961a1-cb4d-4ea2-e7be-08dcddbb50b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RIl8ghBG4g7cBizq1oPHeCyZbn63WuASK7ApWpJrLguVELTCQ30footlRXqD?=
 =?us-ascii?Q?YmbDhrlw4x3guGFwTgyUuAw/KbFYFuKYfrLgqSBz092CfIKbL6z8/HjvPDAH?=
 =?us-ascii?Q?Vqz9iROJBezDcIHKBA92G1HdUxmHEIYpCnKPbQLSrvYEh5QkWbdhbX2z3EsD?=
 =?us-ascii?Q?7pAI3jk6Rp9t6onTWIGvWEjxnaxZ7s2agP65c9e3K7iXK27HaP9ICa+7exeA?=
 =?us-ascii?Q?bNAfjZtIPGKDug+bOkEZRkZITWENlM3JGlM+3qGMTzizeCP45JYdgwlUFLm9?=
 =?us-ascii?Q?KHxD7p9/oz4ZVMGgxZ7NFAxdZWenoyrsVC3beML56RQQRtd3Rl+7EasgYcKf?=
 =?us-ascii?Q?4mVaEjQqGoQ+ZpO1UIY2ojbEuyPm0qQBBUPeHgtN8CBhpK339bnKQRQ0R3GN?=
 =?us-ascii?Q?5s9DyAaIkQBp3Fl6fg6foDINuyQdr7lrjN0oPntivaTbY9NlVqdXl4c1G6ad?=
 =?us-ascii?Q?spr9V3cxDcjEsqAFMfZMwKf6rs4EanNh9UtyW2/V5gjdjIUzMDraOEObRbpN?=
 =?us-ascii?Q?XihsmVFGX3a4Y01d1DujhkY7481pwra9O9ZxuOFo3QAJZdSWSI4Enwuoengw?=
 =?us-ascii?Q?7robsCStfkl/W+Kq6ovJhStsTv9xK4YrAsA5RKkCo13lSr5iyc28xRT0x+nK?=
 =?us-ascii?Q?cjMuUDpvkA1C+atcWzSzhfw0Gy/QF+x7BrQGAnD9Y5ehv3RvIbOhw/zuj0IH?=
 =?us-ascii?Q?v/wjBOGcsKCg4bEbmx4BnJNT0gJgmOYjqMtz3o1VfeOip041bd//LVf/I9/a?=
 =?us-ascii?Q?zhSUHFKUOFLX1W6yQ6ZsZX9BQj3HYKwkP7ZSLIJXRkxQZ2zY+J+1zbE0ua3m?=
 =?us-ascii?Q?GowaWdXSRlEnIXOHvkmzXS7CBMS0NALvY/sV07hFepDRqfDOO3eIbn6ZYKWG?=
 =?us-ascii?Q?sWrCBCbCksMsMKPt6RXaRjC+U/xn54E4D5Za7owq2gDU4VLuXUndPtpjPl6t?=
 =?us-ascii?Q?8NJJ0GOwac96DMkWVJJHxvjtk/Fw+tuhws5ehjcNiBxD+Yu8KaoPIpzaiVuK?=
 =?us-ascii?Q?chcHOMNXlWdxGQX70fQwg4R3jmPAuqtCQPhQ0cCQWmE12vRspx89Nq3C8IDf?=
 =?us-ascii?Q?FIrpOk7H3Zc9Em4ep8YXfb1TIWKir/TIq3uE7Q93i6MC8Ph2Nw+SgMOtMICE?=
 =?us-ascii?Q?hFbNv3gXBIln6eJIlJpfPMxPf5GxA3kWG8v6R5U/ot3aiPwxNxk7CuIobewi?=
 =?us-ascii?Q?qM5jXSd3WTPhCdpYUH3dv53k/zSmL9zc072vACaLAczLEA3QQYgpZSuZw4yx?=
 =?us-ascii?Q?GPvjG16I0O7XcykULprE7XuiTzm2k/40mSsJ59xYW41hI6Zk5RT91BMsAAYa?=
 =?us-ascii?Q?C4BGsVsa92Y2njn9QAL9Vp3TiOuxSOw7xcfLs5UavklKfg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i6G24ZZnJgofaOZWeTbkbXQMctEsxpS3kzpHTGZ0Mm20LNSDbWI1Bq5lbcHk?=
 =?us-ascii?Q?3V9pT3V5Ri78xnq+LR0hTRTgWKlpFGGy97Ivc0OtlTpWBTajWmqBHOJ39aJq?=
 =?us-ascii?Q?5tEXburJzWa7iFzNbyMfdFHDdXpFz2GQLV8Q72o8iOWVfLFwpsLg+8Z5apga?=
 =?us-ascii?Q?V2GptoJ60eeBHEVLF4lzY0sybRv0NbleIcXyx3xIzfaW7XtxKfMEc8/RqjmV?=
 =?us-ascii?Q?alFp1XTjcYt37ld087r0IiHNIeV7eoyGUeGQJB4focPED7msY16TvVIKxV8/?=
 =?us-ascii?Q?muJj+RYsLyLdcMzLfvKcQHd2+ewYRoiq4HZdJO6qr5/XcoqFGBO649VAeEzw?=
 =?us-ascii?Q?Ac3lYEKIsItBolnsikd/hIKi35614IJmD3d7UWd5p/jwd38jaeOGu2Te0ZeH?=
 =?us-ascii?Q?hZb3whlb8Y7pu0MpwOwfENrVxLqtiza/3+v0Wg+4o7LVl67ba07SKddImAqA?=
 =?us-ascii?Q?Cqv887hdyGy+FkW5yxsRnM3klE4QUIU41eLxpovLX4SoPZpl1B5zzaYYsF9b?=
 =?us-ascii?Q?RQHmjSeBd6o2f5IqV7E8JcL2T4GwdVD2hpUcx9GTDVopb3Akr72UxNjxXhVv?=
 =?us-ascii?Q?CYSLx9laoQkIthsTikS+380dwUZFOWwsWBvCWn+/8obtYl2qh/EK1IFR2C38?=
 =?us-ascii?Q?nHPnddZnXwAd2m2hOAP5LO8dPgadmzcWiycEkx2j6Jk0AXolSJGU0AHL8Aeg?=
 =?us-ascii?Q?x6lB6Sc5T8jK32VSC7aZEpR7jXwDI7AxbgBDg0jjnGC4ddcjXrRFY/f+yc76?=
 =?us-ascii?Q?tMIoI233cfL6SUpSptD6z1Sv8loPfE9wnfTGtGN8DO03cEamot+pohiXCX45?=
 =?us-ascii?Q?0mo9fTJ/d60r2cvZPl13xoyObaH5AhUoq0SgDuBIqHSehVizI24x0KeC0v9D?=
 =?us-ascii?Q?O9uBfPdO34r32rH44iNHgnD+zJmc/i3z1+jZQqmXKHN/HR5GH1VeHpo533tb?=
 =?us-ascii?Q?4zGZzC4tWLF3TLm8XnVPs4w32G2s6Hh/bufzYxC8SxidSqaPYURNeIEoiixf?=
 =?us-ascii?Q?yZEchMIJlFtssN0siSNHIvoKz8+QETU2ZxRm2wlwn2/YsQ19fIRhg+xasezg?=
 =?us-ascii?Q?a7pjjih3N68tvnLxM15CajIwJvmMYwqc9XRAbd0i2L5rLnzCSKPJ16OL+kTc?=
 =?us-ascii?Q?8CvIHVF1H3OzbIFlH1BMYZd1dHwtYqUNkmEPbadg6ZerXigWV8m8/Y6vvhZn?=
 =?us-ascii?Q?+wusbw5gHo20cRFGx71LqrwzuYzUDQGzX6fmf0VxfEYBPaXZ0Y6j6WPh1R+o?=
 =?us-ascii?Q?RleVFfGUeJAK7IrFzKuvvbL8zsPee1RF23crGh4N5Kx9VWjo3LPo5GjoBfhx?=
 =?us-ascii?Q?mc10ZrpcACdW8ILLmLPZD4j9QSPwVj3i5mk6PwW8d3v87JHjPilC7Wjl1wHF?=
 =?us-ascii?Q?cySPTexxFKvbRODyqeuebuUyYkpj+24y1487zGZrzwDWFPFclNXLWQ+FzJuR?=
 =?us-ascii?Q?N3Py2GrJHsScZJBKUEQ9EsyOtiEx0yPRxjxNXBBUuW0X/v3eYvpBHM3MeKL1?=
 =?us-ascii?Q?6K8VDDjHYgsNHU3NJG8PXMbtQN4TjM11WIhtqXjkQOE5oZkB3wLS2T9F/RuI?=
 =?us-ascii?Q?Khp8QrplqGdfgLpqFzwRynNFy99JS9IUkDjmpuObtU65AX6QYimf2ovY4WjG?=
 =?us-ascii?Q?kurigN+SQSTjgVM0CURUx/0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef2961a1-cb4d-4ea2-e7be-08dcddbb50b1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:39:36.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZpC0gJMdIM33OlR0oInQkqeSi1k5E2HKe4NPOgXdiFeI/FfdFKyk2Cqs4JDo9qQyFdtBGa4uYXTvA1aYw5Nza0/3sJh9/vQFjYesCGlH+BkdpjYq+91mBcz773mXLoSh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10634
Message-ID-Hash: JHEQRO5BM5VMLFWDC7ZW3U25W2VNMIM3
X-Message-ID-Hash: JHEQRO5BM5VMLFWDC7ZW3U25W2VNMIM3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHEQRO5BM5VMLFWDC7ZW3U25W2VNMIM3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index a2b08568f4e89..c8f2ec29e9703 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -88,8 +88,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index af3158cdc8d54..93d0ee68059a6 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1544,8 +1544,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only =  le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
+	link->capture_only  = !le32_to_cpu(pcm->playback) &&  le32_to_cpu(pcm->capture);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.43.0

