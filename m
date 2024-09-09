Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 769819725A4
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 01:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B9FC1DF;
	Tue, 10 Sep 2024 01:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B9FC1DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725923673;
	bh=Rn3DTMM+fYGxlyDABpaCYpfDDqrOBXyii/vImC05rAY=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FHjn/y/HMOcF1jSF5uKw5/d0FSQYCXdPFpl6N8ZYLomH+gNuiKA10Opd48exwWTDF
	 qJdgMGy6JFCj4FhC1re5XfkmXm+MlXei7QRnP4+sosx2b8pmliGSk6j9NPU/5ejGYP
	 SpHU/Zc0ig/3jG8ceTMbBtTAhKT4sFUkbo2q7sH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39379F805B2; Tue, 10 Sep 2024 01:14:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E6CFF80527;
	Tue, 10 Sep 2024 01:14:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D30E6F801F5; Tue, 10 Sep 2024 01:13:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF4D3F80027
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 01:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF4D3F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bQgbqxF+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeabFoPsxrk5XLDshf8+og6cHcm6uEfSCcdYAvCk61VxCYSkkqL6qbf+9cXGksImMr4+mbwIsqjZ8zD9yu3AK7jnocBmtsO3COuNiXrVvvRQw2qM7bkAy0GCCXc3dyAFPQrSp+CGrSunIlrswC44dCG552TuzBFTc62unWTFPwLeZjE04DprU2TPw4+9WICCQ1BcFtZYBe2sHUYNaJ6daLKcLRsMUNN9NMDvs1572oOhUkUCH92H3fsUoGWXFmBOXZkV7D+1TDFqELymcWRR9na85cRBLlRZ4HeW6+PnVtJsGP7e0iJRFjX5OpgRi5YcsY+Hqn7G3h6eWwUbFRRcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZUDaLj7j58bb6kqotbtwotXk2QqyGpeWOkg4t7qoTM=;
 b=jKXl+cNRjVH+K8WGOk09WxL9QOXfj+ncMXpl3GcsQM8FjIrULQFyT47gM2GY27QT/M105fksZMvqWov3aaeJo56A3NP4vyj2cx1IItYQ8IKo0aMC66xX7RA9dVs8JJowri7pSldwx4H87YAo018OXgRwgWIQbPEmrYbhmhz6ij4fxtMJoj8Djwwo8z79vyM6bW1AmYoMDM9sLr9fd3/TkewHUOq6Em2ZdX7ATZe7klKvoe8CpUP/woM4FhWhqgTQ7hQPmryzuXroQav5a3COInVuEua7Ez3fok2VEJ1BO4kRQT9T6HrBhjPUPDUpKLsdwx9sY6vkXlSSlxqfP5o0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZUDaLj7j58bb6kqotbtwotXk2QqyGpeWOkg4t7qoTM=;
 b=bQgbqxF+Lqs7M3WtPUcxQAD3dkoJlSwPN+0mnVPwjC/b4wUw35LptzD82PeanwJNDAnIjd+ElUZj7s+/HE066TUzqS3+8vHq7BKEcadAkGI/twNa4f/81Y13rISLrYrQNPNf0XiJl0EPAoKh510ZwhXGN5HzQfx8YW6OHrQpNxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11009.jpnprd01.prod.outlook.com
 (2603:1096:400:3a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 9 Sep
 2024 23:13:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 23:13:48 +0000
Message-ID: <87wmjkifob.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3] ASoC: dt-bindings: renesas,rsnd: add post-init-providers
 property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Sep 2024 23:13:47 +0000
X-ClientProxiedBy: TYCP286CA0361.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11009:EE_
X-MS-Office365-Filtering-Correlation-Id: 041b6145-84c5-4488-5263-08dcd1250f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OLR70I7hJTiQuie2YzgPlUsiEgfxCmkub+4OldihEzjKEzLe/Vgks3zE1X5Y?=
 =?us-ascii?Q?2UUrkVL476W6yDTnjPfy6L4oCNvlzntApfVRQiJxuBTTWOgKGJ240RE+USga?=
 =?us-ascii?Q?z1UFFyaalcWD9wB9GTgZw+CnOvNsZV/Cc6Btc6IPkYtAs2TWqbhQ0v85KQtL?=
 =?us-ascii?Q?Aczgofm/x97Gv7/OQCEc7Hj1WRBOsvrMzWrilu3+lV1b5wgDt1QM4rGKoK2j?=
 =?us-ascii?Q?vlriVeZ4PzfJaJfa2pziCU7lGGjk/98HomFOg3h1ft2B4pNioXohPd7CehaL?=
 =?us-ascii?Q?BWgln+8QMBl2m0fM0jUQZ/moPyNamjYALS+UHy9QZQ9T/z6DXLGJzINOR9SP?=
 =?us-ascii?Q?pv7KMa6tNCecqwKeoii6I8pYrfyJto2T+tr0Zooqh+15XrDVnahjLS4EmJa0?=
 =?us-ascii?Q?X4TghrTyXbrPGZ4bNdTaK1tUPYp850nBswqPuG7e9Uvco2OmaD76TYei6/hh?=
 =?us-ascii?Q?MbI124QZTGqkzHNGC3TSfWAaIAyG9OzEURFTqdHs29mAhuN1uDxeyN15r7b3?=
 =?us-ascii?Q?w6xENmRIYHgpqld/xWoYZUMztr+RFfMUuE6yQqWk9Mx8SDSMhL9+sZC/dIk7?=
 =?us-ascii?Q?ecAXLyBDL5yrhcU1sNka7Ej2GfVZlwBJ6OZkoDTntZrV2tPIV1V/zS4p2yFF?=
 =?us-ascii?Q?t6XT4VYlTH1APBaiV8kX0fzg4EdwWWlQ0mFqPAwtw2zwfNLejp8577O+Ix9x?=
 =?us-ascii?Q?di8GV61SmXnHRms8HTuBYyFDiaFfpcA1h3vGFm1agCbla0xVGwtSQcSV3615?=
 =?us-ascii?Q?PoEL6TO1keHJ8d+6QHoiEInN3mGYAyB8IwSlfXQ23D1eNrNorO0YmxtsG6aD?=
 =?us-ascii?Q?CS1BA8KMGmqecS4obSz4Qz4nHEWsMbc2hQIK9NYz8wl1CCeDm34Brnp/b+Cw?=
 =?us-ascii?Q?RsFnlnNi+36wJvMDWl99pIABEIBZkF+JZa4fnUwXLObpdAqiZMna6zWFxKLs?=
 =?us-ascii?Q?5TNnzJDqF1e6K+nqO6G565HCPHApl+sWiiR9B7KcxDYO2jkaS6ubc0kPoJxd?=
 =?us-ascii?Q?avZDewtEhPvsXxK2ZD0i3n/2VaARt98I4QRJ27CeI/6XKg9nDkDpxx3mXxZr?=
 =?us-ascii?Q?IzSH0sDbOyfci+iu21KX62PpVydpxHhR0yiGIUUiV+EToTKu56FsN3JhD70E?=
 =?us-ascii?Q?NYG0KeYeNl3SsBC25AGRYsDIbPRAPbyjCMQ+E9s36dhqg74CsKtzecOXHRc6?=
 =?us-ascii?Q?yNTV522K/TRxOWmzRDWwRUzMaaXKn+u7RF97/b3WrCyASfHeLCBcxBF/b1ZA?=
 =?us-ascii?Q?HsL1awGK6pu3zEiUpXnKYBqN6Sr3YW2tvlSetd05N2yKliZd42ogLZBshDr1?=
 =?us-ascii?Q?rQ1ydJb8CT8vl7iROybQ1zCtyiSZwfLchBTAvM6oCLE9KbUopTCA6lJRScF9?=
 =?us-ascii?Q?EV+AO3rurKzzCuxQY/FQVqWMgSqitsBspziLy5gWZOHUN128cw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T3wMYVabHiiQ4MwbfU/7PGUhzWaNAC8Gb3G97P0BkqPnSsHPRmtU0FlkSob6?=
 =?us-ascii?Q?J8Onm55OSu7NR8dCzcEPzEZdj07sQmITemUChHugA6lC2U70cc3YcLviY9LM?=
 =?us-ascii?Q?vcfZuoAPVuZB1GQc+qE5poqgTRUvQCmB8C6rxHOC64Gsy2U0KaK14V823555?=
 =?us-ascii?Q?1knoXi7QPPYo8TVeA3N4ItaO4EEpjxzH6CKPBAsrIzKYb1hYYIbtwe0T6aDw?=
 =?us-ascii?Q?8hBjcSnpUMA3gO3Ry1bzuAFcO0PHHwCD6lC4RrWYmmzby9yVM10D1EIO3jiN?=
 =?us-ascii?Q?mbyTvXEKuMjs073J0BRhxgz2c82Du2T8OFjo0VGzLDEeVQSvlqulu560nZqw?=
 =?us-ascii?Q?bRJVA/2rRks8Ltmop+mbhQeZbXZxHpmTMUx2uso68hEDHye1vHtGKeGsIvU/?=
 =?us-ascii?Q?xxA1RvWeCvaHtItnvbaruXMNG3HKRvvrkaE+NORLqIRVLjMcPher+vpUvpqH?=
 =?us-ascii?Q?rTFpBDdAs7083QF2AxKTZUYkOFy4KxA9vT8DsA5bBGa4uHyYeF60se9SHpHw?=
 =?us-ascii?Q?U54XsVYCFS4gD8HsQ5iid8PNI/P8ruXVUm0l2tdKid241yW7RqhFgGecpUYn?=
 =?us-ascii?Q?iD15y1V9yq/6FPICYPAYu+/8tDvJ4LordNfVVZo/7hkg/L3ka4SZB0w0ExGQ?=
 =?us-ascii?Q?3PYwhjIjMSeVxGuKVTAlkzeFBT2oe8gYX49ufRSZZ71itJvn151RY8Kjmxsj?=
 =?us-ascii?Q?oSSFeep7gAwUhb4mtzjg4G6DCvkpTweB+fUXfZygwBAya9Z9gKGs0WKX1XAb?=
 =?us-ascii?Q?M6Xf0+b2BvcOgYuy1bw73DQcSqvURdRX1se+KJXbfWofhWuYivfD39wcadaE?=
 =?us-ascii?Q?mMPCaIybQ0YMD6meplqUYxBkazHlWJg55qG17jyx5vUN66MgIojiH4+vJkQ7?=
 =?us-ascii?Q?HGLSQ4orcoCYFM2HHvI7aLiqzGtqp1/w6FgRD9GR5Hg3Airgy4rV42JCOLEL?=
 =?us-ascii?Q?Go3vZebh36lan0+ZkHtPm7wsq/tCRTG9xYPnIGs7ru5lU+KALSYQlbWKyukW?=
 =?us-ascii?Q?LfjYdlG9PGc+DzJKPvNg00DaTllsLxUPhedoZEIyMgKCBUgR+KFf6RLdy21Q?=
 =?us-ascii?Q?PqpDf8UVmxuT6f1E9R0fpMfs8OyRopggg0VC98tyjhO4EQpWN3Df7E4jti2t?=
 =?us-ascii?Q?DWilTdjT6BqBDbNVaT/+FmAjs2Ex1Sc52xsHn5F0NQkKfaTc0/0kDPAZFcT7?=
 =?us-ascii?Q?S/nvACybgByvHE1Id8OHIm+/3tbX3ivhoy913exJJIOg008fFBn1okoS8q19?=
 =?us-ascii?Q?lYXXbp2MMox+Y5TjH9wTkcZwohznlXBWmV5wXWcTLGBcWupLTYbdZ+2dK9B7?=
 =?us-ascii?Q?16fw6/lIQYRX2QtsY4S+YsHkyOY4usV/+5q181fZlEjQhc0ah15D4asQGXJn?=
 =?us-ascii?Q?x369RRe9SnIwm5+aQPbl8Yj1zCjXw3KmcmAqMQIkbHxhEO9KiW8nuUV7qQiq?=
 =?us-ascii?Q?wwtckZ1nZSD98uI3qnFuCLtOLLfPcqZMZAMeDfue33TeezZE1k0PbhpFEY+1?=
 =?us-ascii?Q?WIWCFbMwfdKLvTgoJJI+GYn9JZvINQnEogPvYqEeIw9KzEg8FNIRbvaNNXc3?=
 =?us-ascii?Q?unBL+WiSDmexz/csU+/GZGBlj6VH8gSohABqF+8/8qSuCaVWxhcHp6nx5sEI?=
 =?us-ascii?Q?o4luPRMyh/+K8c+BL3KxLVI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 041b6145-84c5-4488-5263-08dcd1250f42
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 23:13:48.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uDkqohcA6Jezy7RtSAz1MZFFCrep4o2Jy4wcz8a+OMMt6manWHyKGi3k55UbQpcY4RQSksYutAHXHszELNkJQyWMW8JnIHb5ywjU04TPEAj95ZfD93O2hbcZYBbCqTn/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11009
Message-ID-Hash: IL2PIH3JXA2S6D3XCJUCZGDAVIP4IORY
X-Message-ID-Hash: IL2PIH3JXA2S6D3XCJUCZGDAVIP4IORY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IL2PIH3JXA2S6D3XCJUCZGDAVIP4IORY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

At least if rsnd is using DPCM connection on Audio-Graph-Card2,
fw_devlink might doesn't have enough information to break the cycle
(Same problem might occur with Multi-CPU/Codec or Codec2Codec).
In such case, rsnd driver will not be probed.
Add post-init-providers support to break the link cycle.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v2 -> v3
	- remove "|" from description
	- removed common post-init-providers description
	- 100 char to 80 char for 1 line

 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 07ec6247d9def..3bc93c59535e9 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -112,6 +112,12 @@ properties:
     description: List of necessary clock names.
     # details are defined below
 
+  post-init-providers:
+    description: At least if rsnd is using DPCM connection on Audio-Graph-Card2,
+      fw_devlink might doesn't have enough information to break the cycle. rsnd
+      driver will not be probed in such case. Same problem might occur with
+      Multi-CPU/Codec or Codec2Codec.
+
   # ports is below
   port:
     $ref: audio-graph-port.yaml#/definitions/port-base
-- 
2.43.0

