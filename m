Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14296718FA8
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 02:45:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABFD474C;
	Thu,  1 Jun 2023 02:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABFD474C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685580294;
	bh=3OFDy4kbJO5ZqodtAP1lR9ghGo/EPqyrAezIgbD0uds=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gm8rualt7OIYeMNfbxF63Igrgr2otzjPSEL8AZiXxJuPsZ2+xZtmwbCUrXkB7pjys
	 HcHcdzpkLep+0H2kFF0y1pNw8XO+Zmk0jrHX4x4FDaf49VtMCR5IOtjYnDcuxfHJQA
	 mAew8myjVzrWdMXLk2rtvHFqe8GwpidvFJ3tGcrQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC45EF800ED; Thu,  1 Jun 2023 02:43:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A40ABF800ED;
	Thu,  1 Jun 2023 02:43:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A3A9F80149; Thu,  1 Jun 2023 02:43:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DB1BF80132
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 02:43:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB1BF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FzqPKxIg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwWxAz87rVZ34rE5q74MRPPk8RiHnRQSC/ih+gSIZX1+8KubXsTeXJxIIBrj4lwK6i8PIznRituehUM40JNq7ylQ430PZD6a4kWputM1n+J1ZLqsind9vk1x2ssmV4ByuszVMmEBMecZ4qjt7xs/WNfTcyxhdN8RzF+RDAL6ZKBci+c4YMQZTC7AgPloE/x90zwzl461Ko385asTszYhLGTlTi3izearcjnSDMS9aZYUDsiahtmuVPxuaZ/F2au47r/flXVQrtmOZdbo/wKOdYdmCORA57uQ/3fanx/jNVxndDmghrZG5pbw3MGf/lfFvabrqHAF6tFB/lAOa87eNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnxzJb6VSIUMWrb3EnJCKv+T2ZzXZ3tHakgfosuff1A=;
 b=kcTjAruGvt5u+xhb2uPv8BoetFfCYbVrWb4FKGU+iG4dfsfdj7Vk5C+HhS/EKDYUV16FIN1RPKHwZaAIF4Y1iWErZ3X3Lt8Pd2OpuWHWwSjjTkx9tHo2uYKfuh+burHM8C3pc81Dx29rC/aMyazO/4rzu0xi8KKwVux6QwNAJaLrQo+JZmqfdPI1zp5KtU0ajA4HkosydsNuoH1ZHlB6sx+FjNV9Rt0O/oRQc7KjQ1nJUHbtHRGM7FSLkkmaCqc9+a+zTg9XNekh4jtbJMydf679rs/N9BCRCw4vihZa1KYSF1rZ9RTm6TbaKGQ5akuLgVk3x+0rhJ9PgDa8E7+4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnxzJb6VSIUMWrb3EnJCKv+T2ZzXZ3tHakgfosuff1A=;
 b=FzqPKxIgw7BGTUHsJPOd6RKtgFFVBYtmKltjq1mZEu+H+XoTPSF1uxwNPTidpH6XdcTnfexg63TG5ZmBnh2cjJ9bbkMOb+3tfuJ7dRXZ8ykNBoM3iYA+3/Me6k4hSfDy8Bp4YD4hWgf4gSI/0xcdqz3YZoXYE1t3LBneZGqIyQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB8737.jpnprd01.prod.outlook.com (2603:1096:400:10f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 00:43:03 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 00:43:03 +0000
Message-ID: <87edmwj9m1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc.h: remove snd_soc_compr_ops :: trigger
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 1 Jun 2023 00:43:02 +0000
X-ClientProxiedBy: TYBP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::25) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: cde12ea7-566a-457f-dd90-08db62392824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M7HO3qYWd9UMIQZn+fMNAebex4DmOgMzMMUQ34zAECWyoQXRxXE4HIAGGNmInR2tCe3WFPedrDDqayUhJTBdlRkCpEhDidtqpDuYk72DMMwZkg7DN76p2fEitmLB3ldw4O40f/yQLhrv1UrDBMw7KeUPYnOi5x4xi/mLdmULmhkbKhq+8ghX5PpMinDL9C2G+rEmcxI8Kat2nPN8D2TDQ8je9lqbwsPxptAQ6KRfjWHKE/deJQXFlwIN5uL5ohIT3TmIw7psU3MivI85Y5FkpXdvzA9vOw0D3QgEXSjI+yBL/5VTRKaz2nvuJHwfn3+bxepmZDBfmRFIn7szENWJoqpdkVGDUcmz10ZocqpsIP3XOqWCsdhdrYpTsmt/Sg2RmtxzEbAwEAvU9oiIwGs9xrZDOOcue57GdiKZBCRO3kWh5fxZy52KiGyCPzi0RjPb2/A8b2tXVB5GRjdEAKqO0EPdgmohI5JMIskhDxqO0tfNnv8X1v4zZRq4J+WB3JpJ0Cv82/+LasEwc71TehBiZTY2OT37Yir7LMOF7ZzsLRtxXr/kS5RnVZUgAaQQ4orM5J8/58G1gjAH3w2FwesUvkb7aTC+nzKwYikjkmNV+6r+Oho0RRyWr1PHCy3ds4vD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(478600001)(52116002)(6486002)(5660300002)(2616005)(41300700001)(38100700002)(38350700002)(8936002)(4744005)(2906002)(8676002)(83380400001)(86362001)(26005)(6506007)(66946007)(4326008)(6916009)(66556008)(66476007)(36756003)(6512007)(186003)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OgENGqc4Y4paZL2j88FW8UpWr7bSFTOssGAEepyz0mZQ+UP9Nv0SBWzylmS8?=
 =?us-ascii?Q?ojKKFcnFJpPYBt5qY8+6mkzzFYIfcG4YG2VgadLYI8564IxW7iOPUeiAgcw7?=
 =?us-ascii?Q?8uLwkdUm6Ppvpr/fjyigu1YLTNTxDC3LEw1M5U802bMqq5vHtCpWPcjSKmal?=
 =?us-ascii?Q?ym21l3zeMiVnswTZwhiQKhuJeAXn+hoeNFd6zez+AEC5ZRFVcdK0nciPfpNK?=
 =?us-ascii?Q?P44i0R5PUxfqYXeZ/6uZk17q6/tjWmImzSMiIZyaYJsjligDnf87vG84hJBS?=
 =?us-ascii?Q?C/2wPuve/gZTypS7kagbwmCN/2RGj5zWSj9PLC7US9qQthTeLIJwq9fIYMLx?=
 =?us-ascii?Q?CnQX//UIi2WrOfXoYOt8ubvBqg/jxMTvwFPCMGi93blOl2FwPNrB0hHNVnLm?=
 =?us-ascii?Q?eHVQVPCHj5PfAYyDW9rdg4zWuw3gikpcIA+1GN5lN7ZduoRRQUcEn+RCKqhe?=
 =?us-ascii?Q?Q/BypLa/CzAVNrHFa6jFxsa1YpYL6Bb40JbISqiFLYReqGhuLM+nVPP4AjAW?=
 =?us-ascii?Q?h96WqWlvghHCbUX5+Xra/ahqCLGKtK89HSchB+n4ZdV/Cfcmgm/EHNdj0QlB?=
 =?us-ascii?Q?TXHYaHcrsP+jD/GcH+P5eiSUXjVwtMNi7PVHhEL2xod59Y9JPDrpWHeKi86+?=
 =?us-ascii?Q?Lei9RAGjqpVJSrrOeETQh7qD+Eehv+9LkD0o7mhTx9/YYm171/sgrcDHRyIa?=
 =?us-ascii?Q?gwMZ2UUj8xlrCs6Jb58kgo8ZqB+G/Fut24X961+MZCc0974qDrUmERqotjTO?=
 =?us-ascii?Q?cU39+uC9UTIxgQ/4p0EWh3j9IDH+IzNeylyUy1g9qYeLr7L9BaAxt/l28rSp?=
 =?us-ascii?Q?rpnEOXKuQ8n2dmNQxqJ7NsAw9RJLGar4MFKiqb7nSXyBUyQ9pfGfPVAIxR2D?=
 =?us-ascii?Q?2FoF/3UC8mktztrf2oRaZlEzCLIS44uQT+2tE8CO9/N5epb4rQ2T8i0Ff7DY?=
 =?us-ascii?Q?v7DqPh99zvcYSd8SVmA/OO5Eaoo7OP4vJQJ6LHrxe2GxXomGpVp10zAufvs5?=
 =?us-ascii?Q?EGdUimRIihslmFgxW5XvHAmZvjxmqYKTWmzoHgOlfz6uSOwqnqKBH6ca40Kc?=
 =?us-ascii?Q?x/2DPteMWuaC3Zb/+bTLAL/eoz4tzy4Wckfq8H7lIi3wDrie7T1ytY1pKTR1?=
 =?us-ascii?Q?08uEqXfTc0DXxIUXMOvfqzDBsp9r6JIRlXZgYImW2wzH4VBf71ryqu+uUE1X?=
 =?us-ascii?Q?A5Dil5lgduq4KM8vYlegH8MK9MK4BUHM1gMHYSmvfwxQIF2rBrA93xQyETa2?=
 =?us-ascii?Q?d/rQ4q1CavixK2L9aaUnF4t0PPuXnWKwabqMwJwLwvdxdx82noP5T9lChweI?=
 =?us-ascii?Q?7Gt5TM9KwRo+5FDycuoLL4xMK89ku7qnVEkR+GN2vkqzuJPtRDVlv4R66T9Y?=
 =?us-ascii?Q?SNJf87rECBBoYWvlSmDWoKURFWPkhij4Nyhp53OmRr7cG33olz9Lxcd0pGNR?=
 =?us-ascii?Q?5DqSDTzCj9ANcb0TSG/96WzosfefXirz4zt0rJ+WR8KvPUEmxExQ/yo30RCz?=
 =?us-ascii?Q?5zuffmA8Bq12Agrt2K6xJEI697lE5mRvc2gL6h5ALruyb9TRtJFPzhobIEik?=
 =?us-ascii?Q?j2yvAqgjddVY70+HhjXS0y+pTgx/sBGxai0/Vwyc99seWSWND6ct5axPDzCd?=
 =?us-ascii?Q?m79TP9oUe8IoLM+khZwSWA8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cde12ea7-566a-457f-dd90-08db62392824
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 00:43:02.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UYCzy/wEmQ77gtq5kMmQ6Sc7JXIvyEO5F/7KvZvG8y5lC4qH9MCdlaebwJM9yPbvwiiBDh3drbP9mHqyjU+pjfVZ3knnJzoj/iOFTDV0UYtJ4zOYyBsSjjsGw/RlCfmH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8737
Message-ID-Hash: H6KS2ODD5RNH3MXLVHJQ4PHUBZNXDXFT
X-Message-ID-Hash: H6KS2ODD5RNH3MXLVHJQ4PHUBZNXDXFT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6KS2ODD5RNH3MXLVHJQ4PHUBZNXDXFT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC framework is not using trigger call-back for snd_soc_compr_ops.
This patch remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index ed79b27b0392..10e4ea0664af 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -633,7 +633,6 @@ struct snd_soc_compr_ops {
 	int (*startup)(struct snd_compr_stream *);
 	void (*shutdown)(struct snd_compr_stream *);
 	int (*set_params)(struct snd_compr_stream *);
-	int (*trigger)(struct snd_compr_stream *);
 };
 
 struct snd_soc_component*
-- 
2.25.1

