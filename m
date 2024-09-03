Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9098796934B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 07:45:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21E811F6;
	Tue,  3 Sep 2024 07:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21E811F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725342331;
	bh=JG0CIN7HKbfX/Ly7I0J/JBHVj7lFObJRbViJUVmWrgE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LUmWcF2GjB6woikpi+NRt54iW/Weqv6wG4f9pOKHOZKMHwwYb+hTb1idckjMHTU/P
	 cDPe0faUMfyXeQYz1j1/U64I+8bKHoAjFOyGl4osoFCMUvY3iK61AUaJwCqzRJO6th
	 mdpQjY3Lpo2hJg78Pa3ZoJXV9+n7Vkb1O0Mh4pWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58876F80527; Tue,  3 Sep 2024 07:44:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A175F80527;
	Tue,  3 Sep 2024 07:44:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BFBAF80199; Tue,  3 Sep 2024 07:44:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 507C1F80107
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 07:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 507C1F80107
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1A/lFLmHrowMp6PaSpA5SCgPhXhf0T4x9t3snl5Tj8bG+ELbpmfeOQK0N3roiwY93K62QcLQD+ZIdsL9TlEP8R13rzJ3XHvydZRnvqKWxfh0PbedW1iyvKTNLVB5CllgU/M2xduznqTjqW599Pp/6WxpnVpEAnGToAqowGIiWtnecL9BkYO+bIJ1N7Rdu4u7yPSISw6YdmLco63iTpyhl6BTRA28heDsoM4XMkIY+NKB/vYqZVXCFNOsdRUja8WJG1EQQsvW8VbjTZceeHOw4GSyEFsvz8XgsKF/pf89OG+bkQSiX4xqlx3+7myJmsS9Kq3aqJscBOMerNtolcOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqnYnQChZIr4fIVThBRa0BmRuXg1/5loPBRtAOM57UA=;
 b=o5jLlC7LPShhrLI+UpJmigyIJMf+Z+BLrSMnkc5esbXvNVK3uKjBnOAQeDPGLM0l9ivxXQMUsaa3bPSdAO46+QlDfSrYQY5RdNuW0KqvolndiUdHDcuXD8My/Tl313xqrNTpea2AA5R8OGtY+uEO5CShhNvtXdu2SWspTP6V+7iIaa7yt1de15ShE3XFh57z4s3f6w+N/iGCuHn9+vRZBY0JvzXoIUTimCV1v6o6F1xu8waf1mezO7C0diZCOcv+ZaPeZFI1AQKKaz2Iv/d2D38gYO2Zdfa3aYShtJQ9Nf5LjvQ4r7LuarYJ4qn1+7ki+gYx4PnZPf4fsDNFoxTStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE1P216MB1543.KORP216.PROD.OUTLOOK.COM (2603:1096:101:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 05:44:44 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 05:44:44 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	application@irondevice.com,
	Kiseok Jo <kiseok.jo@irondevice.com>
Subject: [PATCH v2 0/3] Add a driver for the Iron Device SMA1307 Amp
Date: Tue,  3 Sep 2024 14:44:32 +0900
Message-Id: <20240903054435.2659-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0056.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::7) To SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:14c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2337:EE_|SE1P216MB1543:EE_
X-MS-Office365-Filtering-Correlation-Id: b76ebf10-fbab-4044-83e3-08dccbdb837c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4DnCVyFbCKQbdSaVvaRH1qiPRH078jdUDYyBXhRAdBJ4Gn+WK/eSG4hKEU9r?=
 =?us-ascii?Q?yyRRvPdz6VB4K5r1yZ+rKo7Sm6ghEMWu2kQYOMSl00MpTfVpoqa2hnpc9PqQ?=
 =?us-ascii?Q?HwsReAPMH5hEplWokzbMkvydQwvAaynQRyP6CfFJFbs+hmsKygAGLxsBaGbU?=
 =?us-ascii?Q?Pu/bvdjx5IF3Zh1zz+z9ubmdRWQx3IBkVBd80v2rlWHRiqmhboYIOJ2Q/ddw?=
 =?us-ascii?Q?30j+8279rWF6Kx85o5z347PwyJ2PrSm/gGkkwUf0EPfC4zMfdM3HWiFfQ3Fz?=
 =?us-ascii?Q?ttCYhnggKXct2PpPEUMYqdP1f7FY/w66K8i0Fl5A4oIosIJXdd0ctDsReQnS?=
 =?us-ascii?Q?yxfGEKvtljVcbGBWpe7UVJwbArv4nyndcew2mCsKVov1OiQ+rJ8tVP7+8Sxm?=
 =?us-ascii?Q?ImDLowDLJ8d2brO6m/+HlHiAxwo1ztmNrwYb+C6JN+iq7us6U7muN5PPE7yS?=
 =?us-ascii?Q?OuoVcZk6NHEJ4XTxmt0aOLoMQz4xE2+KhgmF0683i+pQSpQbtQ6Nf4mtlol+?=
 =?us-ascii?Q?ptVecC2jPGZ5Pmf4ERKeb9GFg3dcaliqUso4anCWusiCGudmcYtStMhLpzW3?=
 =?us-ascii?Q?miX7PBF+EDTlVbi4o2656Mu1S2hyXuZMSK5WHovF8ARRUBhynuwT5FrhEeGX?=
 =?us-ascii?Q?2ouFS3fiNCOQD4V1iX0ny3S9vh2ykgioQx2T3cC2HaJMTlum8BusB7xqM/iU?=
 =?us-ascii?Q?8MJqArYNKt9cjgtfKvVb+jrkSh4XqlPxUAUdk2RjDax3vf7fjtRFq91LOE4S?=
 =?us-ascii?Q?tpXEYwygW0fTPXljQz1q/XKzapQ8VQS2vp+qYGKVVDxnZ1MF8OxTUPHJTDmr?=
 =?us-ascii?Q?zxRg4KbIksZeGXPNzewnpcakA1HeYUkI1LtQD1FN9nsOpBCVO95TvDK+ceb5?=
 =?us-ascii?Q?OysTWygcZr1TRsvZbCQ7hMMx9fn5j57SDxJX0FI9cADYVCaFF0B6uXKhHtYF?=
 =?us-ascii?Q?Q5zeilAKF0DKuQUVgNdDf5q6MEXChZGUwr/IpeiHeTumCi2NrbD4ds/ZrQKr?=
 =?us-ascii?Q?OyDnWrMt08TKYGBNLeOkGfEw2Quw8h8KJ9zXLjTVt/uQ/T5/OHuUBQZ4yo7k?=
 =?us-ascii?Q?d3hQPdNlLDPa+tS1q/Q0tbmTKyj4w3MDz4KnRrGGpVLIsjDM6n2Y7qVRS5Oi?=
 =?us-ascii?Q?3DD4xupQbRPgR2ILbDXI0mVuVYO5QrBhTLKHVZbsSC8H/7kkWa33PCdDOBmq?=
 =?us-ascii?Q?UwAGd7go0AjluggZ3ssmr+7kxFYbSs31n5bgDp/d30hh2U6RqNsjFH4hNUEv?=
 =?us-ascii?Q?linrS3jo7ZFzsonvR7FXQKcdxHFGM+Vojncldg8KjskDuF0yWMXAiHGCF9gj?=
 =?us-ascii?Q?ukjiYT4/7JF7q00YrvGUb0Vgk8XacKL806g0F4WTAZAzlLqUldzxVBVqHfa2?=
 =?us-ascii?Q?wTBq9yw1AO1GsRras1kPUuWK5wwd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yszIpI52EmWGXLIta4Syohh5YV9pxTOV7HuV2elH/UHZeRDodTTmtN9XG0mP?=
 =?us-ascii?Q?LktZEH1QN8kqjEQ8MXu2Tqg6fi5Kognp6nN7o0FUWvaL6vmlRWiPygqNQe11?=
 =?us-ascii?Q?KTW1j31oPMLEcazWvmxQDHXTT2bSp/PzurZ635EFJX0jAl8a6q+UzUjgL8AA?=
 =?us-ascii?Q?AHQRnWLZ4Qp/plP9QOPcX1r4WXK+AdGoUxrtB/BCpFeMh8G86zEZaTZt+eUZ?=
 =?us-ascii?Q?gk5Bc1s8miZo2DAXVa0lK97+pE24Se+P4LK7tWahyrZRcYzHAn+9b/CUfUCH?=
 =?us-ascii?Q?Df1tX6oicbBbycMkqI4U5NNufFb5kh/CKjkA2Iv+64oZU/ZP2Mt60qfvG8F9?=
 =?us-ascii?Q?hfQAupiEGyA4YQgZ21NFD9WU24/hMmP/4plYpxM/oEDMgWmVBxaxqnPs1fuR?=
 =?us-ascii?Q?9otp2dYz+B7mzdwFOG4n80iM9NoLfcR8TL8BFBj+zc68TtmdSs+S6g19fqwo?=
 =?us-ascii?Q?9EMdE6QOrf/gYf2TrhwsmmqYgvonv6ANFN0uvWZV4IXRuv4G9F+QlJYRAR3+?=
 =?us-ascii?Q?U3MF7H4OFmVmO/WpWpdQ/y902TpsmwdaxwfZX5B5Y/9Cl7Atw+6yp65Ta3Cf?=
 =?us-ascii?Q?zY/J1KFcPxEp2a5Q1n1T13PJGRk8C0g5LViJrWhhJsRnRJkqkmQRK99AZaR9?=
 =?us-ascii?Q?nfy3BwVTUbv7ifdkgYQf3zFFkg+f5flL6tM9xwvWJxp55dbTc33Gq0Db1Uxl?=
 =?us-ascii?Q?Yh5hBIK8k6p4o7SwJbvOdpqSdwqkz7ru7I7WtcPDoDUCyrkGUvYj8FkAyRut?=
 =?us-ascii?Q?3j9UCkbGjiyJyZ1b0ivKp+ox+ciAQ3s4gXieU/o06ufjtdEwaen9Eqn5PtHg?=
 =?us-ascii?Q?ELZ/b0mI6XKLEvXd0TpSexxR+RRmD1RF1PfuwayVG5Bjg4MBBOxUaoRLvgw7?=
 =?us-ascii?Q?ifMxAx9nZ5Deu5fmCQAbeSzQTz1MrbqmdwXji65cLJp5Iyqvr7kwQWEEFBni?=
 =?us-ascii?Q?ovcAMtbgpQreEW/YwRtae/FMjdImzQ8/JPgEmp2xLNC8SBkIAMVc0bL/+/2o?=
 =?us-ascii?Q?hgoJRdiNwbspVNFWJrMcZEzwoNCmxrQwixV+Iy9TToBAuiBOTSFvu9YBb9aw?=
 =?us-ascii?Q?4BXHrXMb2zMunR6sK+c2hDDdNBHb0TdIHkK32Z/foGplSUiieZup8tYnmPCt?=
 =?us-ascii?Q?u2bntNa2aRiJKpGCBSppns+ow5GOsRR188shx+/eFg7kL5//o4uAkwa+VSXo?=
 =?us-ascii?Q?SohQ+vMFCuh/nX+hUj1MXU9wDWdwoUyoHqO7r1XTFxop0QROkntyp0RfliU/?=
 =?us-ascii?Q?cWLYOYgVXkWDHNRbxwkCUfIpnPOqW74ukowxW/8sNCLyZGcsr9ocKdRy33JH?=
 =?us-ascii?Q?8wNlTHZob9fFkdO6eU2B7sfUIJU9p2rCizpM4DQDC/0NLSd1EhwwMIdPYOVU?=
 =?us-ascii?Q?Ai3miQsazbQ6+K0bApSghF3wOM5U5Aesgr7+q8AEgWGWqZMcaa0s2+LpOn1B?=
 =?us-ascii?Q?zbKdyEaFWOoQif9hNS/1bCm2V+8887LAn7+zwL0+BNOEkwQzcF+aIgnfpAi6?=
 =?us-ascii?Q?ASkwyOabdSJxqTvfqejm7I9bXINHJlBWZXRZ3FW+3rYXO9Bd0LbEKINF/+LK?=
 =?us-ascii?Q?TZ77buVt2qMSgTqd77aNyVE8V06XAfPu1r6gWjON?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b76ebf10-fbab-4044-83e3-08dccbdb837c
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 05:44:44.5988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rEaLp6v9BbnHT44v+l4aZB6tuIIUZm96TmuOtBdurPy36IApT0u5Wo6IBy+F9yh5Yh1aJt4+zOPIuqh6pGQwnINNLUR404+oRH1mRikI5s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1543
Message-ID-Hash: NN5PVONTNO46P6MMTN7NB4H74VNSRSQ3
X-Message-ID-Hash: NN5PVONTNO46P6MMTN7NB4H74VNSRSQ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NN5PVONTNO46P6MMTN7NB4H74VNSRSQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds basic audio support for the Iron Device SMA1307 amplifier

Kiseok Jo (3):
  ASoC: sma1307: Add driver for Iron Device SMA1307
  ASoC: dt-bindings: irondevice,sma1307: Add initial DT binding
  doc: ABI: testing: sma1307: Add support for SMA1307

 .../ABI/testing/sysfs-bus-i2c-devices-sma1307 |   17 +
 .../bindings/sound/irondevice,sma1307.yaml    |   54 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/sma1307.c                    | 2191 +++++++++++++++++
 sound/soc/codecs/sma1307.h                    |  454 ++++
 6 files changed, 2726 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-sma1307
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
 create mode 100644 sound/soc/codecs/sma1307.c
 create mode 100644 sound/soc/codecs/sma1307.h

-- 
2.39.2

