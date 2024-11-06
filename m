Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2919BFA25
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2024 00:32:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28258E82;
	Thu,  7 Nov 2024 00:32:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28258E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730935970;
	bh=XWRbryqSgfMo81szwgk91HGUrrb+ZPB0GxVRluyDt3o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gtE6H2kyqvisuNH78h0W0RbBsfipjIIZ1lfprzKDDptz52KeiU7EnsRssgkO8l2Pb
	 iVIvbUtLpWikluGF3ZxXhHJ37jsx3w1nvEwReGHR/RdFzIfFoGk8JAi4P4lSXLAKmn
	 sg+GTOxrzCD8IagSk+59fCeT/VRmmzyvPg93fVHk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC6E6F805B4; Thu,  7 Nov 2024 00:32:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17025F8013D;
	Thu,  7 Nov 2024 00:32:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C87DF8013D; Thu,  7 Nov 2024 00:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from SLXP216CU001.outbound.protection.outlook.com
 (mail-koreacentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F842F800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2024 00:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F842F800D2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/6v00LzAVJ90sGi8cQ3uhFrvxFD4SgFz8rWPJNLjkfbUXqiLXPFowbhtajLdqznXC48HX65j4TK7h6Dg3Cwt1FQY5R3zTBkaXPQHhhkN8erovDp6BYa6afP43Rr/m4xXZNvN85W7Z12fkMrFMa/RNkqR/wdNN8UNxN1Z82GiE0MJeLAFOWjvqipkjxuh2gzNZorIHRqQpw6syj914decycfmNTtYhkcS1/tZO6BQJbtP787HAhwRSHZBR6vICoJ0B1HpxacmAimT28OmUnbAavv8La6ZMQNQxDIuBoyXuA+AgQVwAy2q1m3eV6jjjRPviIVTOfnxqipj88M+T3WYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYEwDQfDeqxNQsw9TYrhNPFt6WUhugmsNScw2SaSfEI=;
 b=dPgvb+UoCGR2nsFnJGo6/aBrBH6dLzMzfFkA7BrlVszjwB1UXDDq8I8jAUKUHYqEXyOQDZTS5KYEPin2smpHUP0+Ol6BRsx7SJWHi90aBYI7T1qzSA9B+gwBGu9s7Anvoy8uVoxsfG/2bSXaH9S8GS+7xItPXjUPpKqgd9qvdA6bKbLY1Iq6ELGSE5oxGJ6T8WfB8VjHxbd8CJkmcZ8aioMyEk9dFOOAsNNpgjUX6Xu37wkwkgYBW+1ZUdIfLY5Os6ryM6AiRXRxSRVZVYZMzCN+AHA9pYjE7ZSGtyoc77a9gZ+V3wARptaRbjila83QdglhutGolcbhgOdjnhkVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by PS2P216MB1362.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 23:31:57 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%4]) with mapi id 15.20.8137.019; Wed, 6 Nov 2024
 23:31:57 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kiseok Jo <kiseok.jo@irondevice.com>
Subject: [PATCH RESEND v4 0/2] Add a driver for the Iron Device SMA1307 Amp
Date: Thu,  7 Nov 2024 08:31:42 +0900
Message-Id: <20241106233144.9283-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0217.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::22) To SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:14c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2337:EE_|PS2P216MB1362:EE_
X-MS-Office365-Filtering-Correlation-Id: de063c3a-8eae-4773-d4df-08dcfebb347e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UOdO7EQ+EtfsHfPTCVGNa49HvV5cgMTTUdlrUy5w5MlZjqVKTI+1SjwZpEgZ?=
 =?us-ascii?Q?RHPOiYoe6rgYYV+N011TBGZ4zER+QrOOnGwjm0Uu/9y9LtM9uRS9X/cQRsfQ?=
 =?us-ascii?Q?MJ8aKn4z2tz5sU4dtacIlQPDvHmaul9kOZPrBzcVtHBtKANY+55J9fUy9kQu?=
 =?us-ascii?Q?7rapaBEVcVYARBinmVH5qYbgAEyUSrm2O8tHSBvXJQEWpThRcKSPND/r6NF5?=
 =?us-ascii?Q?sUrdcczpLzzOdy/KSsebvsfde9aDdDVrvCcnfcGTqreppN38aSs/jhC0gT2z?=
 =?us-ascii?Q?0drIFiICzpxmWujSt/7UO0lMbBptVXIXCi1a8f2EW66MScSIlXXHAKsqxecT?=
 =?us-ascii?Q?LkTVFE5tcQH701HI6tNLZqCygZQLsOzzJfNIlvhFh0FEooPN1tRwcUg+KS8o?=
 =?us-ascii?Q?arGEnxPDVwtd/wzpR5LqdeiUwfTEnZLSe2Mj9y3Sx6VdHvfUUqVit4tuo2jW?=
 =?us-ascii?Q?V6AUVglIW00VL8B/c9zOm4aFRpNxib0Mbmtz38G0EAocblRrhQ5o69rC6fWl?=
 =?us-ascii?Q?0JFNvUYP61hY5gtRmlexFndkRek2PAhhg9u/PLcgzK0vCmXoHxGQA6Q6xfa6?=
 =?us-ascii?Q?1GFwICNE8cFKQIGQyIM/SOwFv1bIeHzvef33Fkva7uvfbee4SDWbDI7Cw9BW?=
 =?us-ascii?Q?0K38GiBNEUs1/+HCT6tYkH2uaEEZBr7m/QlbN8wY8BDt88m2En729VNQ3dv1?=
 =?us-ascii?Q?cHcXfS49u6uAUiuEhYqK3z7L8d2gUdk7WRVbQNd0nwMu/6ZZpRiW7A5sGSPe?=
 =?us-ascii?Q?m4c9CLe8z/QGXj5e7Hf9rWdioS/xI7yb/c04K0sA/jEYUIBEQktgVfh5qN6O?=
 =?us-ascii?Q?zJtxJ2ZlNmARpX1YScg6OD8wnfvbAQZjd3kUCGmjWcvGj0w/ScnB2YPnb/LY?=
 =?us-ascii?Q?M3XB9uw+11OJ+awNs9qYuGN38RT+suNnzx2eg9ftGW+iASY71+AMuJG6KR5T?=
 =?us-ascii?Q?7putpQNGEQ4Gj2oBrD9qkfrX001fqkBgeREMO2CAQBptxa6wdSy/PT9lJKTn?=
 =?us-ascii?Q?BQ0JqDqwb85pYrYdp2pdhPHQeQ/H8mpV6xEsc4pXYezIRsniqEzDa4pm2u24?=
 =?us-ascii?Q?QJRgWRfSeOvkWJdqSHMGTVH3aUQN6MTxQ9Bh9eSFooiHJ8CwLVVOZGtmcELj?=
 =?us-ascii?Q?ZiBmlPs66xRO2mZlfG7GW87tQ6KkhMDlMGGE16U7I+TdDsgdN9jq7U6B5c0c?=
 =?us-ascii?Q?N58rBi7lQgvqHGNoCNZG/ilhZWR54KapJRABmoba5SeeXAgO6AF/lxgOtYOf?=
 =?us-ascii?Q?QY2bzh//sSYlaolblm2drtrEhe/D/oXLGN3iXffGcYKw5t9M+R9jEDE+qCPa?=
 =?us-ascii?Q?OJgoChWSEKFXiYFahPxlJ++TugjSCb0L5/3OJDYUR1P78nQK8NoCfYql3w+3?=
 =?us-ascii?Q?2RQTwCM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q26w3Z7Qj6AVeirrQTwjhDOXp5D0yH5TJgO49YjtQTtIUA05uehd2qu7P0Rb?=
 =?us-ascii?Q?gT4rwUf0N6QUdOiO8ENd1lMjp7pITqy3mSVgikH35SkztxU6cbmR+oc4bZsV?=
 =?us-ascii?Q?ms8vrm7zipB78FX61dOxtMNghFRL+1LuK/yIKHd29OAqphR5SqDKudKWQLLE?=
 =?us-ascii?Q?Qei1G9rJ3gg0xMVQpV2Iy3LVaGHzWjhswYeXyX2SvarGiYqwyFedOwYKgJfV?=
 =?us-ascii?Q?nAgAoB8JZjoJ9MZH9ctDp72hZdonve0CU484k4RzEJdisXd1xcY5poftDpE7?=
 =?us-ascii?Q?w8ust3VoMQeAQHcqQ+gDNVywJzvK12YeK6X47ekeWs+xKscK6DllqcCJ9PaZ?=
 =?us-ascii?Q?SBQq12rgWiEIXl38Yu+3d98DVxfv+zp9YxMrCXWmlUYVPPXHINbJlkNtJCXK?=
 =?us-ascii?Q?Ycd2EHZhgC0Nii5tWtawVvSJ//OBZfoW7RpI0uAD7DkVc+M8OoJCSzhy62fR?=
 =?us-ascii?Q?Hpm3U3XxyKdIGVbJgncB7RS0dOj/gIqTcN+us6YrWwB2aMjR25TwA+qYotBB?=
 =?us-ascii?Q?9cWMUDo5eDqxylu6/6QIoLUCWtAhJPlB4z9z27OCtfJlt3BCj8VfoLFsVf0n?=
 =?us-ascii?Q?cxyyBmtK27NDbI7xiCAWqMCUeRTf63Y33FmDTpq2J53F4qqjWMkXVsCIqovL?=
 =?us-ascii?Q?pOdDliyJFsZnBXB1qxtcDjA15KFGDY6CO2Td3cdfNjL//XH9lt3Ao+7CZiAs?=
 =?us-ascii?Q?CfQC4c3lxznKJ99eFOZyo9Zj6ZwR+umB1ghQAJuQ5f5qhPHjaL54uMe2LJYD?=
 =?us-ascii?Q?101+ym3NMSHGECh15oBG6yhCkNaIw2cGvOOQZkVn8jKvt5mkX0mw5lKlmFJl?=
 =?us-ascii?Q?GprwB00JkyDFgY57Xvxe2JOOiLQ1A+VOQLAA6aO4xbSqKsRtHpR1QHhjdd+y?=
 =?us-ascii?Q?9kH9Lzt4oeW11tr+L5/CGHGA2gj50/Sma8osxG/V/tgL+ZAQgYR5lYNx9eqY?=
 =?us-ascii?Q?NFbgWgHj03xu7uDTKBJthxHT2PFZk8JGbZeBybfiX1U3JyEsgi7zWvU7Mw2z?=
 =?us-ascii?Q?fC+UwU5ujCRJ05UWCz+dyVwdpxuxl7oRf7jyhhfQ8YwchOx7nFWTUwBIV8so?=
 =?us-ascii?Q?ZsOzynGTiL3cN9Ao+PgC9Zup5eC9qmMg3+pRYf9lh62BJWoX1/YPVNXMs+f+?=
 =?us-ascii?Q?x4tAp/mqUG9bujMeeHKpJdNScbc057BseIW+Cm5IrZ4tLV30YU1BkjMJFAaP?=
 =?us-ascii?Q?qilXI29c2SLEPA/raGYasoTJdRlXZ9/IDEA4gYcrgm8K7h6MpeWinthYS0zB?=
 =?us-ascii?Q?wLPw4QRsBUSRLHxFM3bUJ0WsfCfj8BdIa+UqBFxE/x7JfDFVR3ZZO8KqWMq6?=
 =?us-ascii?Q?WSxxtxp8u9QZbr/NN3jBNShfmGUZD92btXIwRShyOZUDnr3SY+JgE3pAKlvW?=
 =?us-ascii?Q?vVpNdE+0ADQwxHQusPWx7qqhIOc6OohZOSisCNqZlyIU48T3SwVEwfhajCLY?=
 =?us-ascii?Q?Y6lkf5SOGWbXG+TeiU/+jQkcHqGgfmcrghjmmzJHsxiMq2NjNEHVEPwNTBFI?=
 =?us-ascii?Q?MJS+iwk0BnH8GT92IVdCIzBw/+0i0TKaUwkeLLRBZh0kZwmYb9eoH5TMsxp9?=
 =?us-ascii?Q?duP56SEqOuHtTf21KnWQAquCB0G+bSFoKmAPAZ0c?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de063c3a-8eae-4773-d4df-08dcfebb347e
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 23:31:57.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PtghImNNz/ICqBIqVT41ExFlEOYuTkEwj92Wl/AvSmsk6fq2SGu+83uFoJwo6wV31qBcqxnQwkiYibBGYW4ESK0h1+OusNAMoI1LDJH62c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1362
Message-ID-Hash: VH562JMOY24632NS7VA74QITGPCZVSAJ
X-Message-ID-Hash: VH562JMOY24632NS7VA74QITGPCZVSAJ
X-MailFrom: kiseok.jo@irondevice.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VH562JMOY24632NS7VA74QITGPCZVSAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds basic audio support for the Iron Device SMA1307 amplifier

Kiseok Jo (2):
  ASoC: dt-bindings: irondevice,sma1307: Add initial DT
  ASoC: sma1307: Add driver for Iron Device SMA1307

 .../bindings/sound/irondevice,sma1307.yaml    |   53 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/sma1307.c                    | 2052 +++++++++++++++++
 sound/soc/codecs/sma1307.h                    |  444 ++++
 5 files changed, 2561 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
 create mode 100644 sound/soc/codecs/sma1307.c
 create mode 100644 sound/soc/codecs/sma1307.h

-- 
2.39.2

