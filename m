Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC589BDA88
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 01:47:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCFF1FAA;
	Wed,  6 Nov 2024 01:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCFF1FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730854066;
	bh=VX5/aDeI7RpUAsW4oz4ojBTpEb7t8bglxYe/odG/bHw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Zh7HHhGlekp81GxlnL9XwlGb0PTtgtj+GCajwLYXW/AaJnVVhMqxUdteUuRGdw4iG
	 KKJbXWQWFzDifhBEO5y88cnTO3FVGKFLnMmNfNVDIYegPQmAB2yPt8DdlmWueWkPXR
	 A+RJkmKsU8OUp6sA4ThTmvmV5zFRxJ6QNYbQ41UY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FEF6F805BF; Wed,  6 Nov 2024 01:47:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C851F805B1;
	Wed,  6 Nov 2024 01:47:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AD8AF8013D; Wed,  6 Nov 2024 01:47:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B469F800C8
	for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2024 01:47:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B469F800C8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oovu8pSSIcgt2KfnSx3j024w6YoXbbf2exxvbz8kn8lpk7z6SHtmJ4raCIlanOk4PzKUg+0mOPZvG4bJ27HdjD2JsWPhqhyMiVxKNZCLkjcXduZIZh87ymI9c3h9HNe4OtmXu7wkX8QNXyKIbY/Mz0Y1/FXwNCA61a9lot17uhwGN/7yZWAKJ2owCyoL9ldywXIZDDYUVe56149sH18cvlK/aVFpzSRkFP0Dh14EKwTupE3r7wXLqXuLc9N1blRYGJeYlBbcAR84HOOBV9y5vIGBKNF48CxT82S1TRUizIKv0NTcaI7Dtgw/Vj37Tk7ose9/c63qJq5+jULYE1EseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV23W4nzMmhzR73WOHB8KPtMdTl7SMTa2Ion33EXmyY=;
 b=mo5fwhfkmGpYtNLqnH2d5cfNh4QE+9N64WQkpUE7tgdIb3wHD4nxAzlhR1tDAYFmo1XIlCOkEsbNqczUhEF9B24PbE3LUjWpesGRNyHhnDRI1ZUqRJAlYphIvTBYesYJaylwlOp7gXVkrQhNELPvUfPlYsQSeISkH/AoFHks3tuqugN+CG+52geo9xHTlDId23rL806Bqu8wCWZK2nnAK6Kf5ceShylXr/9sIz0RRAkvGtbzkhwbsI96tZvDiYZkhsSlvHhTs7II8F031BcmvxbJO/JpfDzUn58ySeO88J7qEvigKuvpPJ/A06BGcLZqeQH+KOhf3Q8BKOUE2sScyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE2P216MB1932.KORP216.PROD.OUTLOOK.COM (2603:1096:101:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 00:46:54 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%4]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 00:46:54 +0000
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
Subject: [PATCH v4 0/2] Add a driver for the Iron Device SMA1307 Amp
Date: Wed,  6 Nov 2024 09:46:19 +0900
Message-Id: <20241106004621.7069-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0139.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::18) To SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:14c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2337:EE_|SE2P216MB1932:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ec6746-f61f-4bd0-c48b-08dcfdfc8283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lhvTP5qJRsdcaa53ILjamtYGwT53NC4gPhdKyr+AUyL13SYEVAMMKhRqh3wr?=
 =?us-ascii?Q?nMbFac8BHpeLMXuK1NavW65S5doGxFGRSt771RllhLFTRdsSbK3PN3qLWWnF?=
 =?us-ascii?Q?qQs1FySHQML+79wZMIU3PsQ1gATz13y0j0Q28OQHSIUE+TM7JMJs8oP2rK38?=
 =?us-ascii?Q?gey005o6ijModcJ69OK/IMy90C91b9Xu5/kTCyAGsxO+InAUs7moUCqjijxc?=
 =?us-ascii?Q?UC0WRy8aGk8KgcK0MEeiAR70iuyuWDCJufw7P7TLxr9/0Hx7UW0XeXUXqdIc?=
 =?us-ascii?Q?X7yxeuIKy+qi5hzu3Q3BdDMb7qRwwD9Z99fkmdHypgTGKdw6ZFlSA3Py0kNR?=
 =?us-ascii?Q?QgpchsGrgOOd6UhJSi06zTDlGQti5rQabIiKbx/JBA+itpiWD5CCt7sUtpbS?=
 =?us-ascii?Q?E9oBgsyUfuvmHDyTvXPQdgZKuLxB4qPAmHoDFDWLJC8ZDiagvH2HLoRffvTV?=
 =?us-ascii?Q?dy20X1QMvBDhm7v1fRvwtDCwxPqpALrzyk1rS1uDGocHuQgTQ+I7rZOWIb2s?=
 =?us-ascii?Q?Sw8YHN31MIax0XlULsu2ZnyQdmzczvmgG4JCkk8OM4g+8cyQUGDlxU8c0Vaq?=
 =?us-ascii?Q?sGOHkWbbm9ZplZRBQxcSbfnL+wgX8fDiuA1rA+7dCZ0z1tCaQbqZx6Bq8XuR?=
 =?us-ascii?Q?KUOoJqMEryfTQm5pUTpThAyreK4yNroFiIf6aYOPwG74Qw5w/AuvfgignBZ6?=
 =?us-ascii?Q?8IRykH2eWkTAJJuXDBAWRtBU1GLzg3zUZPtaHvXYwYhplsKXLv02m5wMQIvv?=
 =?us-ascii?Q?H5hbzxZvUqzbc0FhJ3WumV0Ht5FSzKIxCvkjnjl4cbHzFJBq5DKS/2gWOqjh?=
 =?us-ascii?Q?X7AiWBAQ6iWnG9Ymr6yFvKMFojzPjQRHJ6J2GLLPT8KQmnYWGZymBsvJkpk0?=
 =?us-ascii?Q?C9x41TnHGbkLyWdiao3LZXp5FPUkxz5URGSUnDheTDzkF7h911KtlbFXPTj3?=
 =?us-ascii?Q?3oIjR0q919cALRFrd3acLiwDgF3JdTKpuTAiBYvYGqDoz4ZQPfRORrfYQ52f?=
 =?us-ascii?Q?q4NwWD8KRVR/fq/bIHgs1JgSR/8PEokkCXzvs+sUNVI/gIi/STTplGoLLQFL?=
 =?us-ascii?Q?ygj/4lEpvhoXEHXZIky3BNFFXq442n5FhCHVe5ATHHimeTyVrMG007Spn69G?=
 =?us-ascii?Q?3erCb1U5gr7j3b8jAW4A7gx7QxdQogSbKMONF23MRZAgf37ln/TgkvptUrUT?=
 =?us-ascii?Q?qmJnrWLI6ZYbSHYkjSUKRsfngbyJvB7OnFJZfMfi04juvthtBXhKVEEE+3Ni?=
 =?us-ascii?Q?TkNUQyFN8WvS3hj4QVPM+pnkzfMqvjPVHZ4/Rc5Nw3FYJtcIyVEp6bNT9z8T?=
 =?us-ascii?Q?bM8bKPBgacpJ9pcmyj+tWe0eiURbL19lt/QqSk/W+GgTUpgo1guvuzvzWg0n?=
 =?us-ascii?Q?elRp8i8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+7Vnzu/rX22up17LdjinZNgvpTsijhAQ0SB1Pyiz0swKzCak/VlKsNLON3z2?=
 =?us-ascii?Q?uOBue8Eun9UExqhz73q9zA/7qV1EpD5c4VSCYfpO1rAhAB+Euut8Vz8GgGse?=
 =?us-ascii?Q?w1X4dGF1wRaWSr4O0qeVGfQ5ziroWnU9NogfndKcg6WlgMExI6+PbYapdt5p?=
 =?us-ascii?Q?hhLaLpL/MsCOLmy/pm2eJs++WH57cgdJVecJ1lNlfQqjzRRUCqLgcuO1ZDvg?=
 =?us-ascii?Q?yWCG+1RV0rRKgf20c/JPLlDUdcWoD4lk6lxTNk19kTD06Wpow5YvGv370u0K?=
 =?us-ascii?Q?zDbxHgk3Cjb72v7uyhZlSSZXzFKs4SPlVxquH5VHwHWdyOyuWyQaJSeUltkO?=
 =?us-ascii?Q?ghNaPrPfj1B1xqp+KZUWPmGzQDLmTefWBTMfDbTIq8rP+aNPVIUFXK9pMwuf?=
 =?us-ascii?Q?nibzcejTemyHq0CqOedY0vvWQEau4uYsnBDS040HuIhKBqouf1krmK05rex2?=
 =?us-ascii?Q?JeWQgADWCr7aQUruDs18VqEPX4QcruIzRYUNR71/nyt9hWzuE0ap/N+3Nk60?=
 =?us-ascii?Q?jhhm6eDm0zMfw8Oic0x+ZzFZ+NyLZ1lQgZyxPRtTXP9IXk3oDlOtohaUOzvH?=
 =?us-ascii?Q?D0/lCMTBUMFYLltyaRZ8e1AGrJDbRnOB4r5yuVzA2vWe5QPAxpisiqShtXIG?=
 =?us-ascii?Q?jyRcjML9ErI91yPRA8e56Odq//LJJ5G/XFtoQ6iz4kt1oYscvQql4nsVxbaK?=
 =?us-ascii?Q?qvGHiso74fgC3jdOHz2Ecrs9AWnJ5Wg4htGEl1CtxMyVakeVF89n4Tqpkxqz?=
 =?us-ascii?Q?NDWV2IlYKfw2t7omwa/vSU8TOvTmfEsnLBp0esHxDY6Y0OXpZdRvmuCKjLv0?=
 =?us-ascii?Q?xdeNlplNHe+jtN/zT/qlt/ctwXSlAUXH2twrmshJtZ7FjyeTnoovkWvVqmVd?=
 =?us-ascii?Q?MfPX8T+oCRFadJ3Mzo38E7WCjeekq3wzhwSlFLWsnt5hlE6RHLaMvkWhKESH?=
 =?us-ascii?Q?yEBsEkReTDyqZMvSgcXaN4FWx+EWDIOUMishkPV7XD1g3iLiGSUhJcX4j6lA?=
 =?us-ascii?Q?EcwIC/jD7DPmhwkfJCnqraI3nQr1QkV6H5voPXJwtXRhN5/axRFBikpwh/GT?=
 =?us-ascii?Q?Apfnv6wMm7i35M5H93IE45Z7avUo2/E7MS033Ng6m9JKrwBPdPsqm8ijQJS7?=
 =?us-ascii?Q?+H/Jll5XKcGehXNpGtVr50Adsdfc/PLvhOg3C2seN3YCuST68aP0jDPv0SqO?=
 =?us-ascii?Q?GFOcFBpcT+m0OTUHO+6HEHGO/5eMv83wO/Mt7eGRADw9KYavuHyOuBO5UudV?=
 =?us-ascii?Q?e0tqc+1ZVH/eIjBevz05pzaiCfF6Kqe7A9L70ChWAiLzFHscgKf4GNxt/Cwv?=
 =?us-ascii?Q?RnlPwZnB/2TI0hVnaVc+DSZtzkDbidm3kNtwCyQYxHB7CgZ/G0QwDcPq1VQk?=
 =?us-ascii?Q?cKx7UTvxPS89ViU8PjTWASRAn0YZxcAzoBeCISOHXmTwTbkFb22nr5i/Q3pA?=
 =?us-ascii?Q?K4VSqqeS/h61oOF7ZuIFy3Z12km+kNezkoL8TvMk3oCeVesJMVQTyS66toNi?=
 =?us-ascii?Q?SZD2L9ehX9CTfGfQV5jHAZJo+ajf3/HVpFuXausP6uOXvJjMBF8SDQ5OKzSA?=
 =?us-ascii?Q?XZbgZsjDWUrPOFDrFgxW+pzBiV5Y7GvSN+HZjQxr?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87ec6746-f61f-4bd0-c48b-08dcfdfc8283
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 00:46:54.4571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CpOBh3RMuXCUlScHkE+rka8uiB+mCy/egmXuXql9p8F+VE37N0l/heVNZ7B1P3Q2IohWcKdip0T0pOC/LHKNX1EnPloKYhjYcm9YEvr/csQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1932
Message-ID-Hash: KWKFV7B4QEMHJV4DWVA5EHAKEXLGGYVU
X-Message-ID-Hash: KWKFV7B4QEMHJV4DWVA5EHAKEXLGGYVU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KWKFV7B4QEMHJV4DWVA5EHAKEXLGGYVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds basic audio support for the Iron Device SMA1307 amplifier

Kiseok Jo (2):
  This adds the schema binding for the Iron Device SMA1307 Amp
  The Iron Device SMA1307 is a boosted digital speaker amplifier

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

