Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6F685D01
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:04:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A657D1EB;
	Wed,  1 Feb 2023 03:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A657D1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675217050;
	bh=Aox8reNlue2u0G3b04Xyd7rznOhQ+iunZWi9tgITOtY=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jzEG8U12gQc3vxeL4TDjSBT8/EhBJlOd9R5LKKEYLSwFKk5ADwlPXaeC6o3N37ovF
	 V9virtYKs9Ncztmz6nv+Ab3SrYxv3m3dZTSsJXNidk1pmBmgTPKBgoBFqFoAjbQdq/
	 0cr95CjSSh1uif+GBFWXwgO4IhehfTZnslQkag50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB8D4F805BA;
	Wed,  1 Feb 2023 03:01:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E1DFF805BA; Wed,  1 Feb 2023 03:00:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2104.outbound.protection.outlook.com [40.107.255.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C15C6F8057D
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C15C6F8057D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EhmDIK3G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jrk8DbyvSUPoo+quSf5JlrcIDX7oZhP5iD3yu8nptR4b4cBm9bBD6RrDe8NVih9uNa1DBpMp2vNGaHVZFGnw4Bc6c4VMwgQTIu8O5gncjqmDUHo2H9HZB2+YZi/xXJJg7lU/8LeqcC0wVjXUgfzPT98Dpth/UjyC1UXn6J36W6ij5t+wksQ3XTgUeApYEg4y0r0f0jU4uo14p8w/HDa295agwjNLtz2lFowOjIiWhh/WfH+gBBhfbaDpXICUavEfXIuiGUrpbj6+13CWyfpyKr8JV2EcgyX2L7NaJDXbxQR+oNMqyAc32HfYS9cT2pRF4s9z+dL7nzPFVnerL/ceFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiML+pt5TM717176HVoXZ/EReNw1H4WoqVo/ARKvnwQ=;
 b=kIA3SKB+YQlISqyD1xSrPB9oZeZUELMRXMm6iW88ru+hBEZRcrwSGGo/lwMR9mYAXsuvfU3mlKzFMyY+BXoTNttDn2zidlj4J/MhHSOcOxd90BxZHmDgkNa+lrWUBwe5tRYtTIzsnecdlrJ2EbIbGEvkSFK0yeU+Y4LhmwFTFmAEfygkcjDcaKV65PzVbqzZD0wgcMXLLREeTL6OjMJiwttXPdjVaeb65teo77iYmd/ZzHHK3dUCaUMvDbyTVNigrUcISKVsTjnhjM1W0fMI2eRj8M1eKOymq6BX3GBuDYj0To++ixPL9DPGD1nHMOz8HMRMd1wKAvpVl6MA/sLT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiML+pt5TM717176HVoXZ/EReNw1H4WoqVo/ARKvnwQ=;
 b=EhmDIK3GK4eNYVOmbE5WTa8U5au4T/58nkZr4bON+Ld6duWO98BrIZIBI9eDssQJVqGXvqpH0Yy7iYAVXca/pU0jZhBrn1PkWeja1VC05uBS92kjGxG0AGYnr9Ho3t8Hz2DGoImmcx5rKB9Mr/N3WEFcFrBH90BFK6hWQsZhtpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5444.jpnprd01.prod.outlook.com (2603:1096:604:ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 02:00:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:00:43 +0000
Message-ID: <87sffq5elx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/15] ASoC: rsnd: tidyup rsnd_dma_addr()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:00:42 +0000
X-ClientProxiedBy: TYCPR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:405:3::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: aa22e203-b3b0-4980-8ce0-08db03f81ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SQRIpaK1Vktu7fRhgP90F9bwnm2YMEQ8x50lWBLE//Ci2ivQcCLJtoeajV2J98uDRZSKcnxVhH1TgXm6RICRgvMoaKRcrgO7bMiZiTrBR4BH0LHCN6MlCDe7YtZwrHwZKRDKKLTz3ie4XAgheHAfHe/N4ff6WppQwa7l1vVO0hDoHxLsAmbdiAhWctWayzgmrsV5DWV6xdHkbwCgBjDy+HsSpv9ghcNZQiUi1XVeaEjJMoeNImBXyPJpsUq3RLo9D8YWAZeWKHdGY4cQIOnQIEzi0UrOZvIf7l67cimi2NYcGtE3pdK1vErNV85AiBj0VZr1jQWIYOKouCxUE4GovKe8nvCGogkl0dRX8fuQXQ95Yjee481cMYjAkBNEQ7x2Ulhfp+jaiFhzk9wcZts6p/Sqdr28r/5E605887Ft4NIVR9E3RKQFvDPTXJntgdfQ1nWrYeXheeQRI8UR4dvwZDmHoghfEBIIXh1cVj48odFXTWl839cZzHsBd0onC+5SVgn8fJrbbz56xdYYZdMUZGI/p0rnuGvv2hYZV9FPoKChp1dwAQAJRL0I4AgQs8JJkJIJlNBZAnyFa1qTTnvvHZAAkSaGF9WtVkjOTlcBYg9jJs3YS+GsEeOxQdmvHARBUhOKRYoR9AjYC0SLrCRkpjEx0Cmhdt4uLET//5voPOijK8RhBNDdCXz5ztgvUqXfZd6vKch38p7PDDHtoO64cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(2616005)(36756003)(6506007)(4744005)(186003)(26005)(6486002)(478600001)(2906002)(86362001)(52116002)(6512007)(38100700002)(5660300002)(316002)(38350700002)(4326008)(6916009)(66556008)(66476007)(66946007)(83380400001)(8936002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2snmwnWG740giF+i9Rums8KVlrLn5pPWi+7bhYxLR0bKR2YbpbWfqVRR6tg4?=
 =?us-ascii?Q?i/KVZ1NPddHutK/X2GH5MLWSMtEiToksreZnHHifi0wCkn9YuLxihla20rdR?=
 =?us-ascii?Q?wvXCHDECKEt/oPvQWhkSV2onaFKtA9syIasaTrYQb3oq1vl7AsIdC5308JGA?=
 =?us-ascii?Q?BAJv89nf6X7kSWuCbeB78EOWY9/Vo+UjmLNSyBqRPjqBcsOoptIZpP/CtHjO?=
 =?us-ascii?Q?K2QIH3S6rMszLY7++dYca1pmaEBO6PTEEj87gMSSpQvU7xHftd3B2xVPBGNX?=
 =?us-ascii?Q?TMcMKrldm7wjgZ1T/0UjdVFYdQpXOB5yP+x94MhzDueecYweM3VT628I1WJI?=
 =?us-ascii?Q?M9Gc0eNcKX/V+D1iaCjRF+mD0HJ18toLsm5YNkfr4R+ZtUXDOt8ijGILvlyc?=
 =?us-ascii?Q?t/48Ohh9J7ONC08Eik21TRu3C8twU9v35mvV9BJZnnslQ4m/3z8VfclKhWw+?=
 =?us-ascii?Q?jTc07pizZ/mdeRcmzCAsBPTmJYAHKniyeQwDR9C8AZJ5bj6vszbasFbiU87A?=
 =?us-ascii?Q?rH5lKiMfCQ1hu1pXspUlTr9bZ6Vhhqt/dSDQSlDAkyeXDGqlso00NA29Jrs9?=
 =?us-ascii?Q?ORimyVjD9440rCaGWC0MU/Ixkr1AXNdAsR1xpcMpS7nFwv7JNbPwi/Usnh/P?=
 =?us-ascii?Q?j0IE/ANsKwLKTUWHbMaJdGylncVslVNC5VpBxF01knumc6HO9Pv0OBGUZwHt?=
 =?us-ascii?Q?xBwFa8qeaxvQOJWkKRrTRcZ6Ir0XUK4hVRZjayfEveHqDz4CrmWd40RH0h6y?=
 =?us-ascii?Q?ObspoJZQPcLfAg+4Nj3q+HYUm3vrx1vDmy5D9J0VLpGjI3XO2I8gL9F2SIh7?=
 =?us-ascii?Q?AekDE8fJwUrywEltNRl6ns7Cflvo9gpJGDAerqMuvuhweZGdlc5AhVq80tlj?=
 =?us-ascii?Q?+nK9KzqqA0/1tb7xDCSiYN/6FHW/qI3DJTohBQsLx6Dto3hOlFstD4nDi1Hx?=
 =?us-ascii?Q?hJuZZ9S+xAJaAzndeKX2wH/0Zelf4WMCJ5F4pX4D+BthyijutHoK8dljrSEG?=
 =?us-ascii?Q?pvb4g/R85W0r6QxxDzC4HXJesVD2xSlbvaqffKXECSlXX/HhBjzzPvfD6F0i?=
 =?us-ascii?Q?ja2w6JQKNKI9Z/hKs+/T/Mt95ggqAtWn1r6265dUHxVgu3TOvO2dKGLpLz81?=
 =?us-ascii?Q?7zcDf+gOH1aEMGcNKflmmnJpb2cT9cJZ1Na2EEM1lLFdpB6joDZ+2cxfVNGv?=
 =?us-ascii?Q?CgID8vXJtTjx3f0No3yC1qiFwhRa+3xqd47y5zYJA/ilxNE1ACZmDueI6FER?=
 =?us-ascii?Q?qtPsvME0kCDO8G1/DDny7Ukh1fWenWWSFS9IionbLNDIUyXTmnhBn6KrrVJr?=
 =?us-ascii?Q?E2QQHaahv+s/QT+gBozWhYJf0PnVtxMynsEV6vG7+PNtbNf2sN2boGdQJLcx?=
 =?us-ascii?Q?5rf/raosDwdiFI3+L4fkQQlu6pSg9LzpFAi2NbAHzWWduTlbGzwLpU5XzBZy?=
 =?us-ascii?Q?h/m7IgB4yflk1nphjJRnLTmBVVUL16vVid0A0IIw5iN2S0ajiuTPZywCYeTX?=
 =?us-ascii?Q?O/GtcWVXaYReX5vpSKPdJUkoqrfN8kqTWZQh0e70NpOQT2iAOfPTDzqC4wwA?=
 =?us-ascii?Q?YzpMBp7xieJyNuz0QxdqU+4DuP/aWz3YgyNRhy3L5u8aiyB0Fx5GlFSJRvtK?=
 =?us-ascii?Q?wRPWnINGnJPggbp2u0qQK2M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa22e203-b3b0-4980-8ce0-08db03f81ff2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:00:43.4880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQ45bBinutlZhedJcUC7+fgix9YOtPVC/XGS9hc4Xyw10AmfjPK4XxY1T1zkoWk9ANkjxWKhoEgfvaCXhj2AVfVGAmIsqH1vYIl1xhp5WIvUKEuOf262UI/0evg4FcQ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5444
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch tidyups rsnd_dma_addr(), but there is no effect.

This is prepare for Gen4 support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/dma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index 463ab237d7bd..b422c3bd34de 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -659,16 +659,16 @@ static dma_addr_t rsnd_dma_addr(struct rsnd_dai_stream *io,
 {
 	struct rsnd_priv *priv = rsnd_io_to_priv(io);
 
+	if (!mod)
+		return 0;
+
 	/*
 	 * gen1 uses default DMA addr
 	 */
 	if (rsnd_is_gen1(priv))
 		return 0;
-
-	if (!mod)
-		return 0;
-
-	return rsnd_gen2_dma_addr(io, mod, is_play, is_from);
+	else
+		return rsnd_gen2_dma_addr(io, mod, is_play, is_from);
 }
 
 #define MOD_MAX (RSND_MOD_MAX + 1) /* +Memory */
-- 
2.25.1

