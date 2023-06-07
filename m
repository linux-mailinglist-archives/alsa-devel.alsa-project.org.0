Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9472734A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 01:46:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A743851;
	Thu,  8 Jun 2023 01:45:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A743851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686181563;
	bh=JedLMgsuGpKvPbjClm2qG1ONH+8KFgsXrg1AGmJDWRY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZZYxnpgpIPcfQqLqyiZiENL2UXmJnsDYly4x/E0mTeN+ZFjWZIxlGeBhwYEN7vLfS
	 jlv60Cgg716tXvMPJznPZBQnm+JKD8nuWew08bxtTyDTbLFMpIRi3yY+CidkQtMS6b
	 M3ZCh5eyBC8f3hP/OEElx1OpVBPQoHtkfUTLPqZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 596FFF8057E; Thu,  8 Jun 2023 01:44:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6413FF80578;
	Thu,  8 Jun 2023 01:44:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9D1FF80563; Thu,  8 Jun 2023 01:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5E14F80549
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 01:44:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5E14F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BlgW4oM8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9wfHH17RqMJ8RsnbbYnf6EBJ42noolEYqhQtlh0LiyQ0ILlSUiz7d/DmMbHfvQ4QF14i/lADBIlZxZK74TIJYh6PBpna1T1vGw6qu8qpm+UZs3I9+FjJW6vghn2TQ/N4TtgW5LHlF15idesFHVfXAlFrZMOisWgwDdfmKkFIsq7U1Q/HA0vNuUs4+Kn9JJiv/colLmfu2MBPlDXfdCfaoNClpLCbZygxzmYlJSMu9GqrNnW8uwepWIPO+jvKgf3jTKjYIPYb+UFUjhXfbzcC6ZBechvhyklm7SI5kbG30iYaQX1NoqJYlX3epoF+skkEiPZNUEH2u3D+eMhFgCyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fLC9GCw6jiHc6GwdV2jQ+7O1ASraTYwwsIlAvCeFTA=;
 b=T3nmN0OcfvL3waTVb+HvRtLWaAeVcc2cMmqcbCEgeMCQvmYjFHwZP/PtNdNuwk/hBo5eTSIVeWf0uZazbWgcjWDwdYThtO4wkZhhWdP3JPJTCzQ8Nt25EsiqIvxyRx4T/Qm6BqRk+z/ELi9jzaZCzOkkuZPsbTukAq4YATSN/U5cFomDSzyhh/Cd5Z/wHu0UMxjWyYBEo9/zZQnUZ8Qg4CcC7yfQov+gI7sJPykOPm9X92HBbAGBY5SXF1jxXPy+8rLVnbEtrqAMOcuc5THUTQvf3IL6QdFZkTKQFCLaaj+22GX+y3/3TsliiX3bq3mw/yFc5brm51+tGQC1OsgUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fLC9GCw6jiHc6GwdV2jQ+7O1ASraTYwwsIlAvCeFTA=;
 b=BlgW4oM8sZdCShPzEr2VyBlMvvjqEuG1t32m4YuFElQqPbdAcgleYLV4cMiVZUbnCotUy/W7RPC7W3AJJuuAPp9QRd6SiudthyPfcT9enrDitoxkCqkyDw8E0cG5ghywPD8ijUKb01uOsXTXJy4UYc3PndemS3I8C87hSIwHOio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11782.jpnprd01.prod.outlook.com (2603:1096:400:3fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 23:44:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 23:44:09 +0000
Message-ID: <87zg5ag7ne.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: atmel: use use new trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
References: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 Jun 2023 23:44:09 +0000
X-ClientProxiedBy: TY2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:404:a6::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11782:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b88aa5f-9c82-4a9d-2b90-08db67b116c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w1Ezsy3BhjPT0boqI+W5FSsWBdRklv63B+zDeUDeS+KfIz/OcNk/87J5CmjaCdw4IQukrDcvb/hJ5ghX6Gow3Qe0KdOfcl+bye++M+X4ciLTJV74m/y1VAswFfOQfjSYycV3blEHVZPKDucRk3ywxde+6ioJ7c9bwIaF+/kyCMvNZ+K/e/NPBfwtAaCYY8nEQ2hVzAMCoEXjlgRoXyEZ6zRU7V7qZAIi4nlOo6s4H8nKoBf3WXKQh59wqDkxdqa1NNZlC3QoSATfVsS2sTG3Wdsc2wg7DDJwkfnaYa024Ico0HhVuVZ8dspgUVYa2nIzAebtAZYZdE5R1FtUvYae0EFHQAfSIJ5KdV+QJg0p3FE3UDt1p//28MK5vGTUiK1IRBkzdmLD+b96pJg6JKKru46AKOD1Y6o6CDvJ2IQYPzKSwxxAVqWP5WbOg90Fjoro/a6qOAyAvAJkc9fQ1eBXwoDttnAGQ3YBRONURZIikvcWK0QAKYolVrxoxMrzbV01Q0cAGSJyM0eDgI6MPl540tuuXmEDrgyGBVZkw+s0AWAfd683yN3l50bIIwmc4sjXsCvCxNTWDJrGGvjAHmmSCX/66JmpYmqdaxS4Y3p4gsQPY8vDBQCMllIhN9b6mQpl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(4326008)(66556008)(66476007)(5660300002)(66946007)(316002)(41300700001)(110136005)(2906002)(478600001)(4744005)(186003)(38100700002)(6512007)(26005)(6506007)(86362001)(38350700002)(52116002)(36756003)(6486002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dcfF0ZeeQmje0F1zt4Wjex/Wmki0TAlRYP9Nq8GQjy8fevE6WbODCQ82eFVJ?=
 =?us-ascii?Q?Vpn2DN2JVsuc2ju+3FhTTfZfj71GKR6mh4lksf20qXVQ6KTK7kjNXDMERVLg?=
 =?us-ascii?Q?wGhpO4SEgNsvr00um+wel9KwLTI953UCs1Zajo322fHotaJUQ0dNnX+xMZ6r?=
 =?us-ascii?Q?rROUHjrfqj0ryV0HXrGHe7Koubclw6f/KFMSBMXejBYrTcb6oNvFyapK/+nu?=
 =?us-ascii?Q?5ojVBGc8NdCDebW/HVoGVMob5KzECKlyNKy4MRfYiOHaidtjiUYRvEk+KCdT?=
 =?us-ascii?Q?OfwzSE0RZ8b2AgPjaUVvavDAszhOXTKbCmHhonnRyhuD6em2tGBOJmugCYCp?=
 =?us-ascii?Q?jBCRX4S1XZXhcueIIytSKm6lrUdFGX8qnkDaoNjCiZquK4jy/P9GcIj0oHq+?=
 =?us-ascii?Q?FOFTBwDTHpUJ4ChIVjJHh83VQ1o5cydAedU+3l6VpkHo9Iy0COjLSLtdfIPs?=
 =?us-ascii?Q?/+zSzGIYmK8y7PBNk8YsA43JGWVg0m3mVhKTAlqxZCZtQpywqB/cQ53OeZ0v?=
 =?us-ascii?Q?4tmq8+OPTwI0kl8UcnkCVOvMPXkNU5Vo00o+1v8n+1BC5Qxj4E8GuW+4cUzv?=
 =?us-ascii?Q?msPUtSIMwe/0tU4gtoefrLxF1fBGt9ptgQ/F+iW/qduOIE6shh06Q4orw67H?=
 =?us-ascii?Q?FKJC1VZ5X6IGmpDq7Va15PkeRV8CGPpOdYHUP0HPtcQ9xZlFnDmBAP1Jz9Fh?=
 =?us-ascii?Q?dcVOARo/N61ooIxmMai4BJxvTDhGizFyoiqC7nBFaHUe3A9Tzivqwn23qz6z?=
 =?us-ascii?Q?3azdc2dFLkiTrLRTqUKdV8jhb4HMe7q8u4owy0nQf29b8ik5TmS/ku+2kzxp?=
 =?us-ascii?Q?dmgNES7XGlz2wpdMPbN2VNCxg+qnrofQr1K6EmDTG8ciEE59JPlGVkJjBJ+9?=
 =?us-ascii?Q?/WvBG8dT2NMXYwS7mgpQnF/4SBzqd3M4Eh1jHnkebpwb2HAK18sPL6Ud05N/?=
 =?us-ascii?Q?wPee/jmT/ApvoP4PdPZ/A+jzcFZUugohgiRpoXfpHP4R2FU4iQLZaSpf6gxh?=
 =?us-ascii?Q?xK7yuv4q+TNBmGRmDb/xe5r4njjHrXLeQiMQxb39eiDyc+fn8qtT+RXCZ2Rb?=
 =?us-ascii?Q?QmfKDFtXJb6Ogw7m01xSReaIQl7TFSA5Fq78Eo2h3bSSUMNHPb2CYh55E/pW?=
 =?us-ascii?Q?dMHGAIZOOaPqT5TVRuCDD3Pp58eHH0hhkngUqgoZ31MiMGw23Q/GrRbdKZ+a?=
 =?us-ascii?Q?lUc4YKQ7Y4twn6TbJ/8GG9lAbHJFaJnNu0+G9ppX6pQOeIAT4f4w76SXBy7s?=
 =?us-ascii?Q?rt9HvRT6HsUOBCFpVqpZRwOJa62EKxvHUYzRFe1vWSo2dpZLuJ9pAB87jh0D?=
 =?us-ascii?Q?HELmv3Z9es3+LAeOFiS/q9Vi2Qt8yTWvSDYU4Lg4hRWQtk9X8wy/S9pabM4t?=
 =?us-ascii?Q?K5SeyqTZrCa33I04Hso9R1yUESN3DBGcjAYIUfHRB9jCIJwAYGGCo1hg60rk?=
 =?us-ascii?Q?8qNaO8H5xqxKRc0COo9GXpaHLoymYIR4ozIeVkLQh9rekyIdIm4od7A9zmT1?=
 =?us-ascii?Q?XtKeBQXmmwXHswA8xg5DLmh9mAKBtkcuvX7wtKUFkoLj00kBHjEhs753ZlIY?=
 =?us-ascii?Q?et7gCB3fjtDVJKFryaowEselAAaHZDCmxOlCKAIXE+BJVHQ3c1L+fqD8C+bo?=
 =?us-ascii?Q?h932yXOFpvIizeTb1aCK70A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9b88aa5f-9c82-4a9d-2b90-08db67b116c3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 23:44:09.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UTVECfE4RrRMVCg3fBvNs0/hEKiX2hkPJdlv2VmgCjtnmfOz2VMsQHciqW583YvAIPL9Ed1/c6tYk+XbsCy1Ncv0MYd7S3fsZHCxQ6HqWuJIwqx2H8XcJo5FM2JKMu96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11782
Message-ID-Hash: U65GBMSUUJLO3CJJBN2V4SPK6HSXS7XQ
X-Message-ID-Hash: U65GBMSUUJLO3CJJBN2V4SPK6HSXS7XQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U65GBMSUUJLO3CJJBN2V4SPK6HSXS7XQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now supporting generic trigger ordering method.
This patch switch to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/mchp-pdmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index da23855a0e40..c79c73e6791e 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -423,7 +423,7 @@ static const struct snd_soc_component_driver mchp_pdmc_dai_component = {
 	.open = &mchp_pdmc_open,
 	.close = &mchp_pdmc_close,
 	.legacy_dai_naming = 1,
-	.start_dma_last = 1,
+	.trigger_start = SND_SOC_TRIGGER_ORDER_LDC,
 };
 
 static const unsigned int mchp_pdmc_1mic[] = {1};
-- 
2.25.1

