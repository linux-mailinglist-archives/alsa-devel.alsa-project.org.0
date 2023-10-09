Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3696C7BEF42
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 01:41:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C629EE8;
	Tue, 10 Oct 2023 01:40:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C629EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696894860;
	bh=TfC+SaGVOK6Q47KA/c1i91+Xe7A9yV8GzDQUX5K2TPM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=G+AAzpzPYcKt/PmKoKgnhagzZJt/01R6tGci+jufiarrMdGk+EXp309hsy35JKxsG
	 IG2TFY4hqP1P+VO/+hljZLDirwIVCrDgyTHzyCa6DnS27jQvZvmW+XKrmWHkl5swGB
	 IF/gjG19utbGMmgcO7AF/iwtmI0NViP984CNlZF8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7083FF80553; Tue, 10 Oct 2023 01:40:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA8DCF8027B;
	Tue, 10 Oct 2023 01:40:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 703E8F802BE; Tue, 10 Oct 2023 01:40:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22452F80130
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 01:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22452F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Ss2XxJ3a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMtyhiIua8FlXta+6N/qS0h+r6SKG53oXPGYD0Jmdn1d7dUEUwQltUUT58h6StjGHxzcqcFT+rVDUIRvUF9l+ZJ2KbPu+K7L5j/M3iVpq3os2U7iLo1AykyqhSFI6tRDUAeK4+aDHTX4m5PguuE0YYlMBSV/sitoOAX6jMfWjznX0CGy1Ab5voBxA/CkoFffdJ2v4nRGu6NOfsa6AYGSOPeMxzPo70+56+6+dlzwSDQSP5ueucMLi4RM/ZZcOxK1ijwBzFq5HtJJbmstflRtIt4Av9PH0VsBhLa/oEN//9UD77ohy4k9Txim/5p4vA9ADUXvxTT0P0DsvvgCJdp8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw+wEX1lxZWxGrlaNUHtzHy9gCiv85r8EvAjal0+NwM=;
 b=dsYtP7oIKZiuTFTeB0cKMLbiCHWCQ4K3+Y59ReeBT7k/3lE2vNYEhmYZ3gSxwf4Mk6aYNOb8uctBTG3trURmkxOVt34DArwvNCzYQ8I53kfvnTi3BBi0r/U8VvZYFwjaYsURmWuGYnhN88NkhhcsTZ4A/kRm4/Oj0du83FKhUwuN+Xy3Nipu1E7S4DST32L/c21JmiHTqv1iiVIQOrNGt8tkdXunmAJzJyLhwD2wwlMYixuiu6oVS4ZHSYmw0pbiJFVd13MNABdBpcneOknRODApsEZ3/wHCp3CKR8Vu4Z3Pc3OiFGqk5i981bNyEj5wh8HfBkvEtGvujZ8fmJheyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw+wEX1lxZWxGrlaNUHtzHy9gCiv85r8EvAjal0+NwM=;
 b=Ss2XxJ3a6wZrsxiy+AwJc9jze7qjcri6y6T9+dqw58DU62LobOcn2AcFS3OC3tE4ydnjvqnthtrk5Gbf7MgcFkBRxwl2zLuljgmxm6BpNhG4sPv7CRmXxrANv9Yzy5rvMKa6ty3VOFFAUFlANqVYPsLXOLSkFoEdjfCc5Lw4AcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8553.jpnprd01.prod.outlook.com (2603:1096:604:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 23:39:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 23:39:43 +0000
Message-ID: <87il7fcqm8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl: mpc5200_dma.c: Fix warning of Function parameter
 or member not described
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Oct 2023 23:39:43 +0000
X-ClientProxiedBy: TYCP301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef2ca3c-492c-4497-0302-08dbc92103d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7EgpjV0BU8NbmPiURXMuTbQX2e7nZUGv1xRCyrZ/v+EK2N4QzF5Vsn5kdJSA6nfHIazGzquUR6RwwxAqLk1IIV13a3okLqKI7YKBooPAchg556BFtxox2OL8feGW9fn9NASzkYM/mNeVl+6A5LYza14UyAwCUFnOJgnoaaWiXVvOniwbMHLZtd7LBkAKbpGmyCJdMh9rO3WpZl4hBAdPsqSh/qGJvIrR3cVIg2nP/M982PFpkblwXAZ3f0zm9fJ9wNkfUom0T0P4oQ6oe2FjOmEG/SdSjDh5loGX2nnrnHEGYmJFBfT8VwtKBG6t86jIDrXrPytEhKxBcv2Dzuaib4ovKaWAvXHZAWK1n428KFuIIR5qAazOgcoxyEpcMDP4mb270Tld5n0JWqr71XKp9xqE8CZUGa5d9LYxCsC99BU5OXm+CkQ25og0QPP2SlC+NoxEUT7GvusZiMhJeq2xwX2Q8ugPPS2AN1g5iJTPKUL5xt2ZKxy3sZviKe6574u0GJSfqAlvWy3keE56mLV0AcWDHxQ72pi9wQPh6eluXyuMTLTAGSspxCHRK53wXiPgjtVYR+Ocdo+FRqNDGKzMr7cfAogzhMbjs5M2KUYJnlSj/ae3A+7ls630FPtJIDYg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(41300700001)(2906002)(38350700002)(52116002)(2616005)(26005)(86362001)(6506007)(478600001)(36756003)(38100700002)(6512007)(83380400001)(966005)(6486002)(316002)(66556008)(66946007)(66476007)(110136005)(5660300002)(4326008)(8676002)(8936002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3dbpWzBfXb/N6FupwGIshSiJMGhl6S5nwsyZQWtpTxILQrAUdbBIyAWUzCu+?=
 =?us-ascii?Q?2zcHeW0a0RJ29lkNQQJ6VYqrNonIPQLIw05OcLqp4HbJus1+Kz34aCvcj6x4?=
 =?us-ascii?Q?bfsOZh0JKocNy5bA9QQIhfxZah15Ej3nJ88e1ZEPM8M/adjzNJB81cmsR9Ow?=
 =?us-ascii?Q?AKe81iJTjUmdT6jTd4WvjQ/pW4tO/noIAsFAurB8nHEEBRWVs6Wli7+krjdR?=
 =?us-ascii?Q?duKSQ55jPJ6mi8ab56qJKi63iHiXOj6NK24SYhzswsAqHarH5UzSktSfp77N?=
 =?us-ascii?Q?laqBnngKQH1p0gfXd/exArqCkl9wy7oTGYapeiecWJnRgHSgFdDByHtBInEH?=
 =?us-ascii?Q?ncHDCbGhxNMnyIwb1C51NqewaGu/rlpaj/Z6pqczxCvR99cjma/s9bxn5XmV?=
 =?us-ascii?Q?VRWEe95TT18I9WaIwQaCTY0TIQwrPGITk75zGK7jizkmOYoAXXFm0GO2qnx8?=
 =?us-ascii?Q?7cldMn5+sc7MRogGjLDpCH+Wh6Xh6hq9IYYaafHJDVCMMgsWFzdQ1pOu6zXA?=
 =?us-ascii?Q?yms7o8pYKRrGBtpJDAsXS0Hi/Bdr6LXtSdWjRSqJ6tdUWR9i/eC3zxVPn7Bu?=
 =?us-ascii?Q?fl+svV7e3cjjM59Dd/LPHwE/deETqAKXMoBG0ChgIiDCTCKfJPtBKe6x0ctf?=
 =?us-ascii?Q?ltsLTw238xFkJ0XlN17VlOJN27sav3gEnhZa/sElrDqQS+2DNMArGhTYebNR?=
 =?us-ascii?Q?W2dAIYhTm7X4uwK9R4PokO9aQ02RzsHDjXKqoKzaRrFGl58kTwPZ0G9BJCUk?=
 =?us-ascii?Q?lpmeZhr/sRxSAvSj6OTAz+qIhOWcGCp+uwmSSUhjeBrhlxLhWLLDadEMddjn?=
 =?us-ascii?Q?0yRe9s/60bnwkKxTaR40f48PQF+payk4gkoB0xLueQysfufLmNspGq6W1e9Y?=
 =?us-ascii?Q?VMGorNMFSJDX2e9IlQOReabAcKC78tKImcsaWsO8WHLLyaBi6xyuS6q99uyY?=
 =?us-ascii?Q?ZjTtZrnT5LuAFh1jM8lpATSAWu105u7RdfJyRuXla4FGfReS6/FfAi/qCb74?=
 =?us-ascii?Q?VmqpmU0jOBsqOMqSshoksdHO22q+eM4ji0yb6Hdt/c89ZLQDddkE/xreP9hq?=
 =?us-ascii?Q?ElqeRDB4A70sax2OexrZMf4NEZ2eo6pyXBasG1JYXADVqw1i12dM6VNdWExe?=
 =?us-ascii?Q?60wWZB961geCvhK7S5IazW2Hi2GiN8rd8h4espg43fepjdI8aYB30It/tWXM?=
 =?us-ascii?Q?K+8HbMp2ZIkGTC71MTx75p5h61bNJzUdnYpApUB6tL1F3JOgZyDvzVYzwtBr?=
 =?us-ascii?Q?K1daL1jwufCDiwbG1I82/0uo10KjFaYti+fPhwhpRISod7XCCppQq4jjoX1f?=
 =?us-ascii?Q?Vd7ANTVpmw+Pr7RkSShD6/1NGUW7b9fKwGqNDdPxtBWOchPfLCQfqg1iG1rQ?=
 =?us-ascii?Q?kCGOubi/N1Dzdx8hm1aPlaNPAY9oAzpMdxZcIiWkNnVj7i97hRfE3rdiGSud?=
 =?us-ascii?Q?j0WVzxKcYpI11HL2ih63D/qjo72OGrWWKiBHogQ4T89ohbVw/rr7QGSx9Bgh?=
 =?us-ascii?Q?g8rrHtgg7gSzbdw60ER01TR15T9b7NcNCPLaIPxyrFrvim5FuJag0gFBIrSR?=
 =?us-ascii?Q?jVoCytUm+UVIzUIImE9vO1MeQRYXxm8RZZlsup5L/iVUdYowWeon1fJrTesf?=
 =?us-ascii?Q?V0SkCXWq/ryXSGX9LRvEuWQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5ef2ca3c-492c-4497-0302-08dbc92103d6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 23:39:43.9594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lZUZIRrOdomQopO6VIsSdpo83deeYMalr6OFnnKVsABhX5HJN7xEp9/1tZuDL0LcaKCJpm9ad+lw5kSFYLylVMtj2IunVscd74x0cxeLQs62ZUx9RTu32HKUNICDrzhk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8553
Message-ID-Hash: HQOF5ZVRQMDNR543KV43ZTOCAFFGWFT5
X-Message-ID-Hash: HQOF5ZVRQMDNR543KV43ZTOCAFFGWFT5
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQOF5ZVRQMDNR543KV43ZTOCAFFGWFT5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch fixes the warnings of "Function parameter or member 'xxx'
not described".

>> sound/soc/fsl/mpc5200_dma.c:116: warning: Function parameter or member 'component' not described in 'psc_dma_trigger'
   sound/soc/fsl/mpc5200_dma.c:116: warning: Function parameter or member 'substream' not described in 'psc_dma_trigger'
   sound/soc/fsl/mpc5200_dma.c:116: warning: Function parameter or member 'cmd' not described in 'psc_dma_trigger'

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310061914.jJuekdHs-lkp@intel.com/
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/mpc5200_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 9014978100207..3f7ccae3f6b1a 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -100,6 +100,9 @@ static irqreturn_t psc_dma_bcom_irq(int irq, void *_psc_dma_stream)
 
 /**
  * psc_dma_trigger: start and stop the DMA transfer.
+ * @component: triggered component
+ * @substream: triggered substream
+ * @cmd: triggered command
  *
  * This function is called by ALSA to start, stop, pause, and resume the DMA
  * transfer of data.
-- 
2.25.1

