Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2797A9472A2
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 599A750C5;
	Mon,  5 Aug 2024 02:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 599A750C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819093;
	bh=jXgaZdZKOl7qnpPkbnaRcKfMOOayye5uwYZuglSBSJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XiV+xZqQtc620ONYPcR304p1KSr+AzC1qaZNJiZCTqSgtbiSGbbPyAadfA7WJzYWz
	 k6JuRYvFR10flWF3HiTjdLb2GVDuZZ2CN+ISWPU2Kpwe9RIgnT/nyTKyOLFYQT0mQe
	 6xhOWlhunUxWfQCi7ABLfPc3Su+n+2+uStYGqKp4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10E71F898F4; Mon,  5 Aug 2024 02:39:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B0FF89960;
	Mon,  5 Aug 2024 02:39:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC23CF800B0; Mon,  5 Aug 2024 02:38:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DD6AF800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DD6AF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nDzjTtjE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjkH8aq9i/wWh9nf5H8DIt80xsLlLHkPK6qCuDsNAbNJymnHyt34hMC3qARBC8w2uuSleiWw1fN9dfyKnIB1SpFZR6KC4QZNIDg5C9FHmPrvLDGvs8H5ECnmFbmk7IslkTMN7vKzLZIRBbVMEfaa272HMaiMOOYFBBRbI9t7F6kRdYVwOXAyv1li61Wt1JCd3T7R898Y9dbZGg3zeCO8nO1QdQGG/3qAAbaJp9wPlFST7A1HGRurTSlFVTrBBWj3+eBmKfhzBeZoL2XBfwVZrIo9qTHGCo7lm+Bi3w4YeQjgG/Ic8QmLDR06tTw/VHWvzKKssCP/HX0apnyEXc4b8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12hFgdz9hQo/9MZP/E11BDxFAIYz5mHJ0vBTVsFlMrM=;
 b=A5b3FKp2ZDrdnZCN1SW5NR4/BYgE7SzWSCJncwava31aBWyNkjRRP7fZQkVteUfOw8pp8d7/WcOZ1pF3bEHN542RD00aRtKX8gQ4TktnioRIofmsuu2u6LuX2USgzgNmJCMHg5ZifEBUaqK7Lhdpwz120qO5u356WwOIdt6WgUHv+AN3ZBcJmQp5v/8CPrj+KTY4EpXBwKafdEpBxgu8qdtHrIGQ/MZ8EQCdpEV4SHrcNIxGfmvpfotNQXJHDvemBFYtrJpzO41YJmcNg2LIhEVbEDuyL4VxnLFXigIlaPSuyDCHb702qOwumu/MTUVjQTE4GmW8eegPp4oRDjGmlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12hFgdz9hQo/9MZP/E11BDxFAIYz5mHJ0vBTVsFlMrM=;
 b=nDzjTtjEbqav7M4QPHVy/UbJgOlVOInSBPVbY4Hq7W7eUSmIQfRto40Xt7+ia9nx69AbgD8MU57yj7lECXMXe+koKyY/LXn9OZnkgEJJTESDbR1fCvk5yJS1zrALYYko7Gsnl7nmzLFmCimREWo/A9S4BjLqc+Sq5N546upVJBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:37 +0000
Message-ID: <87frrjztv7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 042/113] ALSA: firewire: fireworks: use
 snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:38:36 +0000
X-ClientProxiedBy: TY2PR06CA0022.apcprd06.prod.outlook.com
 (2603:1096:404:42::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: a3464bb0-00d2-49c0-d7de-08dcb4e6f1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CaXDUwVyGFumdXwx6uLVaC6xZfd5HQIZ1qLQ2LkbhSlfbxOMrDnNyfJMPtty?=
 =?us-ascii?Q?GsHPHUMrTTTkuALZGtSQR8gcSJbv3lSdg7ZCf57iBcmGS/OpeDvF+G6Z5tJU?=
 =?us-ascii?Q?TA2iuosQfYVYwqSQbKFxR+C0o2igbb+dBRoGghfzhGtNDM4zjC3scYzM2YTt?=
 =?us-ascii?Q?hxeBKfCxzh8UWEs77XdWvmSE1Jrf8TmiOAMjVRC77AgRe1RiFRZhpWjtMpJp?=
 =?us-ascii?Q?bVPUmwZB4VFQloQ8y+ondvy9zhaWa5MD2mnlcgS6J9hYUYgCbkqCcLgr2bP5?=
 =?us-ascii?Q?zgIT+vnMi91Av7t35ZbWa9VDYRADjNSzDKsDF/Pqp/H3cmxrpWvMw/2MVEuA?=
 =?us-ascii?Q?H+u67ot/4wXCAALwD+0d3w6rqE+m+fKQp2QHqyWeaLXz95tWYQG8LSSg3eL5?=
 =?us-ascii?Q?gszPhfriFO38VEUnx1naYzGZeFyTS+VVXbXuMb09EHC0w6W1iIXFZfhRtCzg?=
 =?us-ascii?Q?Q3wiZ7bnmAcWbCzE5c+u3YdNMeF5PUqrdy9DsvCi9TVhzr0S/6JR19HxTcmZ?=
 =?us-ascii?Q?mhmUsVcdSvUeGpH0314sAMhhw7iElB5Zy89M8kTUaKRAZ/tcHa0a4Zc1tLlI?=
 =?us-ascii?Q?a5wXurlfLTWFa6cvKKxDqi4wmnxBSKBNeUA7ZZOnAbhkGrgwIahXP00+J2Lq?=
 =?us-ascii?Q?bMlrO1rFZzsTlHsBtegHeeg6TFIqpK4qIbjzZtRbf9vtVulzrb+cuYpD6Lpp?=
 =?us-ascii?Q?0sOMMvZFQeEHKqAPM2xc9+fMFbxrdy6pNWif2iCXYyhMwgFgxlgO7sr6N/zo?=
 =?us-ascii?Q?ZUsbK2YSmjiGG9yP8b75mH7TPZ4XMEpYX16w+cAmWQYPVo5OjBbLL9fF2Xcv?=
 =?us-ascii?Q?YKtUavJsku2hlj2sOm8SkvwMR5F06lafUSCqXESQo3VzOify82T9Md9FPWYq?=
 =?us-ascii?Q?h9spWvLdZV8EJJ83pq1YRFCvfLHwJkbUBdKcarh4l2O/OJDMRVI2Z2cad9tC?=
 =?us-ascii?Q?W2r12y9ovNL2FLlBuiLSLjqUMChK4DTQ7boZJwVereB5FnyzMMc1uQupLnzw?=
 =?us-ascii?Q?7PlCNWMt9Ho22WSvadDGpaxH/8AVSydDfBxenOlrljXxnuLltimH3babq41r?=
 =?us-ascii?Q?tPr/4232tJmuOyyQuE6a0AxtnXC92zhS0WIYbNXyvtuQJBF0xhpOe2aoj71F?=
 =?us-ascii?Q?yeH96ayp2+NBA4WbRNoZqUFYdVr8yiO3K4cotKkrvwwo2BPGjVafUgJ87UJe?=
 =?us-ascii?Q?abPXTKTZPBokAYpCyBmUvk1/f7F88zXb6iG1dT1J3xmRgq8bCO/5VJeQGTyI?=
 =?us-ascii?Q?hEEMi3AlEwL3zRniLro5eoBPIVI8KU0dc7GNq2UhRAsj+Qn223qCHwSNqJ9s?=
 =?us-ascii?Q?tHiXsosrQiZceXyNmB0mnfe308Pbu0N8w2oZ7DhgslvfCkS4Is7S1b4+wmbs?=
 =?us-ascii?Q?hDV2gD6QkVEXD6V2+X8FA6HEzOPWAOfIqtYAbDjGccgYMmBc+w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kdQFXZlq9rC/v9Lu2zeQuY5P01W93r1CgN2a5YKS+5m7nBMUrQTU+1r9z7kF?=
 =?us-ascii?Q?UXOMxGdKogm1XHLvGXTqKF1+yYEcbLCi6qIKZeOPJwM5eDN/ZzOnWLuRQhDl?=
 =?us-ascii?Q?HVXS/FIbpRG5wgHtBqlN+4+9d+895G7+wW5HSpFZxdTLO0EYJWsMzLsJpHV3?=
 =?us-ascii?Q?0rxzmqaOxslkdOw5DcOb/IecD8G1p/aAzNoWEo8J3KNaajdfcwa22byre+LO?=
 =?us-ascii?Q?YIulxwQNinf67ruTwVyhgSMWK8ii1+Bpaqz2TFJ9Gat8ahtuO/bkyaV46RFh?=
 =?us-ascii?Q?/3IVFG9p+u253VV26lr93hVdBDapdbziWl4DcuXU9CLNg3vlNrOWcS7P81FG?=
 =?us-ascii?Q?l0Qufut+DsJ4I1fbodWdfWgqzKZflWGQxj6lIVSghLE0aG8pg/TZiCwb3Uy/?=
 =?us-ascii?Q?DrVluvUyqcaiCI9cKNpB1H4AkPA58Dp49ms7ziBqeNVL7YlkMHxAzhXlXUgv?=
 =?us-ascii?Q?qkzD4RWCM1YYOhb6vaj2OAFkRt8uMm2nuhnkjqKangSItRhYx46awzXcZtXI?=
 =?us-ascii?Q?rx4zsaw0/5sHkp75uMrdAgFeiolCIIPmDGaeFuZo8WfXAVfZuF9nCfOfrH7Y?=
 =?us-ascii?Q?TEp6wYW9YmpUYM5dU5z3Zp0NZtuqyye0c9ndQduCBmsA0sjQFGVuq450diWx?=
 =?us-ascii?Q?jXmyajg8LGzaIhW1rLv7LuvDc/S61/u0pfMxU17EzXKq97EBr1rA71+ZeUQn?=
 =?us-ascii?Q?fq+rWpxIHjeZVm/ECTcBJz4V0jzbTRZ5z2ZpYJMpUETlhlNQmli6B3t2PgTx?=
 =?us-ascii?Q?jHoR7jr3ZGZSHj3GXCya1jAcnY/tUVHpwXCHpTDx/Lz0OKQ3mi4NI+3abl9/?=
 =?us-ascii?Q?5IcuMpSApZDfbIc3ESwkELM1/wKQSE77POPr4W7tmhchZBXaP8hxas4e/fYs?=
 =?us-ascii?Q?k4Yteh+XinRQ8LoAs9q7Q72fq2AKqlTqz3re/0sOc2XU+01zFkUMKgC5d3+c?=
 =?us-ascii?Q?/WMAIDjY9o7g3UBifrUpR1HSYCZL99H0siAjUB2VG3ez13TwVEDPm7s+72Kq?=
 =?us-ascii?Q?gOxd3r8gwKbFZw3r5WAfUo3sMM2+9apE0DOH8wARdUbALhZ5RVjUUdMbtvXL?=
 =?us-ascii?Q?75pHuupdyAzhrxebnIwZKdkCBo+BSesBHWDTYfkMcul4mBOT6n/CP8blScQd?=
 =?us-ascii?Q?YSHZPM6bAQoIBuO2qw2nzdJam50A7aBHwrsQd0OLOfIs7uCWawyCE+qVGK2M?=
 =?us-ascii?Q?ibgKN9bkminDVSt4WfCSlCvNy921AkRhw9qJmO0acyMafRVPzt7uH/LqU6sI?=
 =?us-ascii?Q?w9C6uW/AQy5/+V/pNHibdcK5E0TDIR5WHTSvOys+DM5RCosgrj1Hbf52cLTA?=
 =?us-ascii?Q?7yhNYh4rmiI+P5sIzV2EcY393gjGrkhp3y0kETYuJ8+crES9R6yp4V/JOKel?=
 =?us-ascii?Q?rGCqMmBNhlApgw56NbJP0EkyiSzp85sMGuSOSrxoUr6vEOkZBNdE0wgXdwv5?=
 =?us-ascii?Q?JmJuEG4RFShdvJaj6aqd4U07R/3t3c6IbVSwJ2s8Ieoc1HSwnXICjo38YpjU?=
 =?us-ascii?Q?SeYLaRJKCZJ71IE6nc43kY9NKU0QEZCvNyL1p4HvlT9cka/rWTBddkF29mCO?=
 =?us-ascii?Q?kc9eHeFDXjGa4l57qCDI0fpdgQnMOpOUdmCHK9xmxXyyRyunEqlyPD8Pq09m?=
 =?us-ascii?Q?g6stkdwaRf+J664a2+J7x9A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a3464bb0-00d2-49c0-d7de-08dcb4e6f1b3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:37.1073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 h8TZArFHHtV2khCRq6OqUEGqDiEg/pwSpljCQ4paFjAZVP/bP2EDNuNOs+Idt2+DDqfnTOcZFD1/HWkS8M4ga9GbhuErXPhLNMfCX642JlEWkimBT7vhnJu+EpH9Q588
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: B6EWIOGI2SOEUKN652XHFDIPVJCXNZZV
X-Message-ID-Hash: B6EWIOGI2SOEUKN652XHFDIPVJCXNZZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6EWIOGI2SOEUKN652XHFDIPVJCXNZZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/firewire/fireworks/fireworks_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index c3c21860b245b..7ab42a6903e40 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -137,7 +137,7 @@ pcm_init_hw_params(struct snd_efw *efw,
 	unsigned int *pcm_channels;
 	int err;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		runtime->hw.formats = AM824_IN_PCM_FORMAT_BITS;
 		s = &efw->tx_stream;
 		pcm_channels = efw->pcm_capture_channels;
-- 
2.43.0

