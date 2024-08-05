Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD6894728B
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:47:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0EF44D08;
	Mon,  5 Aug 2024 02:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0EF44D08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818765;
	bh=Vfl2XXpBnoEHmjsFNmwbqI5hkL1jb1VrisnAdZcKyRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kCX2Ol2pd+ijVZLMLI23aSIEthiGo1VuDjW8VLPXbOfPgtBZelVlOGZM+hYPJiLsQ
	 pxG39raihx1JaQ2K0TLysDnsUsEVycsEUA8P+k4FdlfHZZoXEXCQ/L0EW+1ZVdJ2Ou
	 AR2rXCdEkaku1LckFFYNfZ8uitUUMTDU9AFgSISs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95BFEF898E5; Mon,  5 Aug 2024 02:39:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10AB1F89887;
	Mon,  5 Aug 2024 02:39:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D85BF802DB; Mon,  5 Aug 2024 02:37:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A24F6F800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A24F6F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=I74AZUSE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsdu6dVfjo7PH05mFR/IHGnJRHRETxgBx/43xVxVx+y/kY1iTVv84Kzi1MLKCNbrI1tt78Fl/9MxYLUlAPVc7inrwptCZwv4StaDKOjU4pDEzHIILJsUxKum27pUtEsXxGkTUEpJo+jUP0fbqosTMD6M59IO8kgbasXO9ulX+qjvH4sYep8R+uzNWkbTfroRdJOYewSNiDa0uRA9R7d8K+R9vez6Q6rKp618NvbIueoTAhx6T5vTjmvKJ39DuWh+Fkf7ez4a8j5nX7C/a28sKQJ8MOrrv0RiEQfzGgFzxDk+4uKCxyKa8DrOwJRs+4PPf/rck6GpFTwMIZ8eXH2YeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1Sc9YszcvEF6fexWzWsYE33pDn8Fx1LiXX+I3bls9I=;
 b=uXvz1jqBDw9WEMaNZ9Q2eUjknmUyZFOHj6MIXo9E+HVVgKSpwb3a/DuyoyHjH5vVirzGve5ajDJG+lZiSKMH81qD8gIgsjuNIEwn5eZJtgKSnQBmETNfEIAt1Gte2valnT1bKVa7PCrHRdBV3I3y4RGBHoF0wDCyKZeS77IViXLxTHOjl680q7LMREtCGyyqQvmKwasLK64pRB9vLs0Vmgchx/hHzMYIxA4ba3SmWLMVjZdikrCJ2gymXvBXQhSchgLGRLAOq7GOwR+YzjWtZlMEfy+Nk5LjCbjyGd/6gKGI7VcSF0nXzoa3prLZfdjSxCz1vlwzV41ty5q9B+8dCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1Sc9YszcvEF6fexWzWsYE33pDn8Fx1LiXX+I3bls9I=;
 b=I74AZUSERahQ0ZM8xeUgCoUb1hHmX3oiMS/EtVJ6MuKSAsJZ87EXLTegevQuFupqz1N3CcVxaUDEUXhMqpU/w57VzweTIvW5WmWTfcq+ZLxJ2xNZNKEhH1k4i9CUMaS+DkRbKoC4S/m7GXedRKt4uLFloovATNEVFFi4Scu1iSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:37:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:37:45 +0000
Message-ID: <87sevjztwn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 033/113] ALSA: include: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:37:45 +0000
X-ClientProxiedBy: TY2PR06CA0042.apcprd06.prod.outlook.com
 (2603:1096:404:2e::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d42f780-964c-464e-d554-08dcb4e6d2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IUhojVQGPm4gbtnHeFF1q3AzNl+kcCHEp2UFOWWzKLoqSat1EXEpXtfC5lL3?=
 =?us-ascii?Q?ABA50M7gh4d84hX8PKeluGC+JoztjhSzY+CL3tMdEsKOL5lYe7MupFNrPtnY?=
 =?us-ascii?Q?Eu7JYEvcVTj1hhaiK5VSRolN4A5xJEgJbdsohvtI7WKPmhHvenpiMmOQBBWr?=
 =?us-ascii?Q?2QLpIiiYnxYfJHYshxl3GxtJ8INNKTpevBIkyQ3fjbxa3pqxnNBfi1DL2u2D?=
 =?us-ascii?Q?h9vuGAbNCY9IWMHlda2U/A3hloO7n5rEVAPUNzVp+dZSA4DwnoAdifNdk1T4?=
 =?us-ascii?Q?rKTpZnHLYAcSVVywCt9biWmmb1rRHpg+fyFF/yVyec+nKt5JbG1Da4OSh7Dg?=
 =?us-ascii?Q?dmuyQx0qVpAKnVuZNZ5Ely9vh8OtN7dsbRezx+KryaSSAkoxm6TWmUKt/r4c?=
 =?us-ascii?Q?Wzi3Q93Lj9tGevvq1Kaa397fzQSCPVywYarxq035xk3fdRBOqxtLqhxVhmaQ?=
 =?us-ascii?Q?KXbnPd0X+MUiyQWS/hDsmEgisni0u5GvNNcTS8aj/t2TY2LEM+/a1h/wz0pa?=
 =?us-ascii?Q?h0qqEvlb02CoUYGvB7Bmo1TelccTflwhAtSzzG9bgvnlDq8SmmEHEh4P4hzm?=
 =?us-ascii?Q?ntFzFCLohKNHRZB2VAZ/JgXAHct8stPHW0xg+u686wgCttGKOqp565yPFaEc?=
 =?us-ascii?Q?stYFF+oIr/IKS9YZCEILzxwtkQUCArECTyivegDHOtPAwb7+6maUI7t95Cr1?=
 =?us-ascii?Q?d3BhL4vVBn3L0i4OjR/zIhqnpuuaYY0ih1bZpTim5LnfTMBq6HjO4cK/Z7KG?=
 =?us-ascii?Q?cZwSQXXbuAaKBlYE9RQm8ammD0Hl5TO8Dl87hKXpNMV3DOLidVpCv2eZ+Zep?=
 =?us-ascii?Q?tdv8dlW5tYSQa4jQihhZE5hd1ynsUEiudAZtshEdfy2KMvJBxS5+2RDCPvid?=
 =?us-ascii?Q?OUef6CmrOuFVSrr32B45oMMTHJFQY4sabq3q2ce458yuoiIk00UjoXd+sHB0?=
 =?us-ascii?Q?c6lUw8maS+hfDFlK8O8EtHZd6vtu4/2Knr6/PD8V7VEFuLPZ/4f4Jgt6/zI3?=
 =?us-ascii?Q?WM/deD6eNz3QMCFIs0rElntwi4fD1Ize/pBw+dTeLWQ4xVaOeYIdRamOa6GB?=
 =?us-ascii?Q?SUYKdU7VXINkY5H8xpYLf/cMg+W/zqN6XnfCk9sHpAiCp5IqWztFqFJvIXIg?=
 =?us-ascii?Q?rHXin3oAUpn6JLJj7XmYaRyaDH076UMne9Yzwoo+330381OqS8QZAJgYN1UC?=
 =?us-ascii?Q?yBy9UrfQp3eyv/BoFs8WH5UMi7oait45KYQ7qY+LJVsqojuN1uk3npUGq/Ym?=
 =?us-ascii?Q?hitF+QpBqOt5J9DUIh3yPzYdtRKjWQG/eFT4TxMglXPbaHJbBbh2x5i5YuLD?=
 =?us-ascii?Q?MgmVoTbs6SvbVwxmGyQD0NtlYCxdqHi/K4OHktumQALdu9LmpunTD6TlDPVp?=
 =?us-ascii?Q?tfC0bdF/PC5rttaaG7iJ9+MFqdStX+nnpPiuEeS5WbCvFOHyNQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nPAjpZ7z0MyYQvYwnk/zgX+Ng0FBsHLfYcVUGM0sQgF2rNFSeIOTVDLC9beB?=
 =?us-ascii?Q?dBHhFl17p+3luvxWBUKMcZ47ZXakU59QTUMSaZN8LFv0NVgl3H+cB0liekyd?=
 =?us-ascii?Q?Ty3Nmjt78n1qZ0P3RqJ9toJybNiBHzmL/KPbDy5kG8AzWf3FqAAqKL12rDGz?=
 =?us-ascii?Q?KIMCuiUjC+pAVcu2lrHOUxb421HTeNqQmaw5R4MPSp3Wd+R76aSYlz6uuOYi?=
 =?us-ascii?Q?Ywvi7dRIy37rBniEaQC3zDKdWGMnTyd2ZDUGyFfk0RUTedrwrvot++D2G+Zs?=
 =?us-ascii?Q?dUptXBjJYsVeDCrA1dBv7tA/XCcz3DVHF+PrKhOc26VEnO1wiJnkDH0UhOs0?=
 =?us-ascii?Q?HUVjeqBqewUi/bAiAliY/r+hR8a12GNrJqqrC3mdK9Mtej2TEx59KBwWwyyg?=
 =?us-ascii?Q?98oKnQlj3+6EeX1tUuF86ESeKRYXhlT7Ltmt56aUXUbVpOSH8s8MwiuVKXK/?=
 =?us-ascii?Q?NkWsAUIUyo+4LS6RfRqaY7l1c2wY5SEje+OBDYPbH/1W+AzkGxBO9ekZWZS3?=
 =?us-ascii?Q?tYtBYaO/iQwGzthfaIyJHDKup8YNOSDC8i3H/U3PMm+x70Ry8tOEdZE5H2jQ?=
 =?us-ascii?Q?yj7R8ihVBritgs44Gm80im4E7fB35hXK8klRMwChAahMhrVmg6D7WNjbrepW?=
 =?us-ascii?Q?0LiLI1gSh+g8tKeJbr3mqFdAtYshWm06qAVtLHQ+9OuJyBOsxp8xNQTKaG1l?=
 =?us-ascii?Q?e34lGQl0W70yeluG6UK+QmazGYdRYs3JhVUy08iWE7t4QClBiJieyf/yII9H?=
 =?us-ascii?Q?Ato1tAcjPeQkse1Mjpeo4k+7uKs2NH8096F/deFN/fMKL0nfx4JVroGcJscQ?=
 =?us-ascii?Q?1VqLlPho1fFY0sMTE+vz2F7WXFkQQ6zxvwtWYp0GICnXO+pPOiJc+1vaE7+Q?=
 =?us-ascii?Q?GRrRWorR1t/fJvM4QMINo1ewWOU/TBBAF7BYO3iOarpl0KESniI80fPRFMQY?=
 =?us-ascii?Q?QE+UWixsOka1Z9abjhDnRm+/PCAC7eddgG00vJ62tUf50Xddw0Lynqn1Ht2g?=
 =?us-ascii?Q?3Kerb63x97rTxMLusko6N+4wO9pux0XU3r0AOQjVoUYlcMQWeDj4+FjESkvP?=
 =?us-ascii?Q?M7rMn72kaaqxWWSoky5M5bSu7lJk5KLYMtS5BMebyz4WoKzNXg/zLiKIFzqJ?=
 =?us-ascii?Q?GybRSJgYGWA4bWmeKI2T6u8igc2Lfp2CSsqsbOTBHmxlx4xJ7J4tb2z80/vA?=
 =?us-ascii?Q?NqpF4wTZTNsi9JAjBND1JWi1dU7sc1j59tzmI//nTiVuZSShZPDJN0DfA0Ap?=
 =?us-ascii?Q?4/izn4wIm3gNHyxViSWRbh6p91YjVJS6eoz1ezWacTvGLoYk75WJgjFau/sF?=
 =?us-ascii?Q?TLiYexZjKAY5BUH0s6GOTA7+vgeSeQuBMpUozEKrzHfDoxLU5ff1AwPqyCoJ?=
 =?us-ascii?Q?5kVuoYyaPKdSK8fgcu867XZbi/oyzyy6CUyKC1wOLcRJbXqOUMWPawWI+p4Q?=
 =?us-ascii?Q?pzYkVzYi7btT7mwkK5tqqAwxzoTOVZYAjs5F70sICpGhw/HKC4/ulGQMcFZe?=
 =?us-ascii?Q?mdBaZxcNKENO2PocEOfMzj4PTXrTV+sBZSrWmDlvcGI+BN8oEZLGY6gYdV+G?=
 =?us-ascii?Q?yCuCzdYWoYh02R3kX6elqpDSO/U3o0ACtZ+37hSDyjuQx9J/4xONfjM9rgX8?=
 =?us-ascii?Q?Gd4Ykzg2uPXDYEscwAIO2qc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6d42f780-964c-464e-d554-08dcb4e6d2cd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:37:45.2564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Hc1iaU/QyOtWULfVXc2aVqUiVhnT8iMYtaaedaUhy4t59O60EhPBRSbCsFuOdsQ0sEqM/IdE8Tmt0A3TnARq8SfAnfqWyvW8kr/S8LzSS23ZkvRCx4Lp9ON02lmTsQ3A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318
Message-ID-Hash: Y76K77RSZCTPZGAEX4ZA3FNMYXXA5TNC
X-Message-ID-Hash: Y76K77RSZCTPZGAEX4ZA3FNMYXXA5TNC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y76K77RSZCTPZGAEX4ZA3FNMYXXA5TNC/>
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
 include/sound/dmaengine_pcm.h | 2 +-
 include/sound/pcm.h           | 4 ++--
 include/sound/sdw.h           | 2 +-
 include/sound/soc-dai.h       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index f6baa9a018681..3b2e31922f0f1 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -21,7 +21,7 @@
 static inline enum dma_transfer_direction
 snd_pcm_substream_to_dma_direction(const struct snd_pcm_substream *substream)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return DMA_MEM_TO_DEV;
 	else
 		return DMA_DEV_TO_MEM;
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 69e535aeb8e82..00603c0e568e1 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -734,7 +734,7 @@ static inline int snd_pcm_running(struct snd_pcm_substream *substream)
 {
 	return (substream->runtime->state == SNDRV_PCM_STATE_RUNNING ||
 		(substream->runtime->state == SNDRV_PCM_STATE_DRAINING &&
-		 substream->stream == SNDRV_PCM_STREAM_PLAYBACK));
+		 snd_pcm_is_playback(substream)));
 }
 
 /**
@@ -1521,7 +1521,7 @@ const char *snd_pcm_format_name(snd_pcm_format_t format);
  */
 static inline const char *snd_pcm_direction_name(int direction)
 {
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(direction))
 		return "Playback";
 	else
 		return "Capture";
diff --git a/include/sound/sdw.h b/include/sound/sdw.h
index 6dcdb3228dba6..ab752dadea3bc 100644
--- a/include/sound/sdw.h
+++ b/include/sound/sdw.h
@@ -38,7 +38,7 @@ static inline void snd_sdw_params_to_config(struct snd_pcm_substream *substream,
 	stream_config->ch_count = params_channels(params);
 	stream_config->bps = snd_pcm_format_width(params_format(params));
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		stream_config->direction = SDW_DATA_DIR_RX;
 	else
 		stream_config->direction = SDW_DATA_DIR_TX;
diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index bbb72ad4c9518..577bbaede90af 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -476,7 +476,7 @@ struct snd_soc_dai {
 static inline const struct snd_soc_pcm_stream *
 snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 {
-	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	return (snd_pcm_is_playback(stream)) ?
 		&dai->driver->playback : &dai->driver->capture;
 }
 
-- 
2.43.0

