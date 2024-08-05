Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB79472A7
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:55:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B1D4AF1;
	Mon,  5 Aug 2024 02:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B1D4AF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819183;
	bh=ikIGSsWHUrXUZKIgtKDkxZAyIvpk7G63R76DSix7veQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=anD61Rve+0TaOv50y9vvh5UG7glfXoAEXBE6kviDMrSyOlNkcyWNa7v94L0TF1f0d
	 21joyXKoCNf6c+L9TZAUjvYDtMpIiYjrRk/W3apspaJ5VwUpJlG2/jpVvaJ2G6JPoH
	 kImK7q85q+Dru2RAH2TxBcjWsmgHkTbDuIE9ZfBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB173F89A27; Mon,  5 Aug 2024 02:40:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22263F89A6E;
	Mon,  5 Aug 2024 02:40:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39D4EF8991E; Mon,  5 Aug 2024 02:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA6F4F89997
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA6F4F89997
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TyPhwEea
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGb77omZaOAdTS6e0P24Xu0ifwFpv7gAEU6sYJZ/LaN22d1FBEmKWPmm7UoGbAMS7QXm/Rtzxro6qN0VlTQWCQ125Iwqz+63z0LqSJ1nyNS0ZU6ybeyK7+k4Yx+QZPJIn9Gr0R3/1+Fd5GoD82LGcEffDFWDzKA24Y1V675RS8KFRK+YZFZLHuSmvD8DIZortli6ZrBSuDKnmfa/x5/sAy5n5wKIJbO6iuOqvNt9V6Q1lIpYNIut0nbsiUUCkfo/SEWL5PpfK6hxMs96Imtwl9OsQ+bHyRPTXRL7YHUXvMNxdWOe1LNNH1awgyWf0dIEOm81NrrWZKK3IeRN9wX02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk3WOoxMmhZvyRmuJ4vLaw+rmnTyhnPOx5ac3Ip81d0=;
 b=TYE+tr421m7/OR8O1Osfu/529I2UNtbW9bfTsazzww2nizXizv6LVvz+5x1eMFOFRjQyoC3fPreilH03r+PRQn/+puroKUyd/z8S8NVncuNtjqbxKOnc0crCSTDvWQ4Pc12IcUXHW7mhYlcZPztp16sQb9Q84++RuAslDtGKr1krycxeqCCTQ6qMycS+islrKeShuVcsoqeuBzsO/WHk3MVhq/oT/rh19xulU7F3iaB46D/SiTWLgq9u67EqRcaL7mEa72KCDUp/qlAjKlZzEYv3Rpe3/J00Lb6wWjIBxqHN/TUOefWtrIOAw2B0fSUvQzlCbtV3JWTfzk5q0rOjAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk3WOoxMmhZvyRmuJ4vLaw+rmnTyhnPOx5ac3Ip81d0=;
 b=TyPhwEeapo8ByK5FoHpwcMp1F3XrWaSKL0a+MTZgy2sy0tFb6mO9CnRnaXjd+MQ0NN41A8TPVBWBbPNSoiD1srhx+Az2s94WPI0GrUCd9jZk/hUMYsnJpiM6U8eOccsLG0uPj5a+d1G5JlAWJyDj1TOzvvjIkpHg4JwgAQ0+0tU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:42 +0000
Message-ID: <87wmkvyf8y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 055/113] ASoC: sof: intel: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:42 +0000
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf56b5f-c843-4b2a-3b2b-08dcb4e71877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ksPoa5Q+37OUgq751yPsNFl0czYHU9LURGPX/fwDqSwvdmIRvCJUe0x/Vm6c?=
 =?us-ascii?Q?joP49d3T9HddRAcc8fgpaxA4flj+towb1G2a6scNPj6azHTf1RVwY8QxR6tp?=
 =?us-ascii?Q?3HRzRzqYX4YDoK0tYPPi3lL5fTVn6JqHO4WGAExQ3J66KoDQ7JtVP/V8l5LF?=
 =?us-ascii?Q?RinQK9Lj0LVuL4zWByNWz5pnGDihLGu4jJVdETkDBXqkYlAjN+QyMDKiV991?=
 =?us-ascii?Q?68qFcoTYF+29NleIAfoX7BZEFYPGHaLWbU9I9ZgptzLna+Ub7SnlAsKyrPnD?=
 =?us-ascii?Q?ZXpkwNY0m9cmWwLRg7fH6A9yaKverTfsM38LIonCTbF+B+6PyuLfR8DKQo/M?=
 =?us-ascii?Q?1gx6QAU/+fKYZt8OWdjMjFwP6p5uLqgs7lcDnWOqrcrw3y93eoBPTw2bi5LC?=
 =?us-ascii?Q?Bswe+mXiJYwKQQhZiXZNpNfsnJZBU3Buhr3DzcZRB/eoTld5+cIwOoU0sg2Q?=
 =?us-ascii?Q?hQZ8G/lYkzHQFb5nrLGVz/PMYPkzGgH5ALIjvbllVPI2Cv5fwZ3hkx9YV8x3?=
 =?us-ascii?Q?95jM+X03ftM5fK5acDd0LwCjfh7oSgD3C0kpNIAsBBcfLAY3Wc4AnrsJw7Eg?=
 =?us-ascii?Q?NjqGzd+RaLHk1Oo7oHmjpCvDJDYlWwZE+Q/Muw52ZqmJ0iM2aEI9N/TMWmbL?=
 =?us-ascii?Q?6SfeHR8/EMAAMwc6R8KHv0D3h5Cfla6AMi5M9YA42PNQaKje2M+qbrFPz+X6?=
 =?us-ascii?Q?wbpAK3ZdRkglZL/SgKCqxkBZjNwImQly4LTw/eUmZTZk3NSa7xh5qEq/W0Fg?=
 =?us-ascii?Q?cBBT4X/iajAfiTrawl0Uym5iwK42WsksaAGSxxmKAUZ3w63YQibMUk/Mj/6H?=
 =?us-ascii?Q?ugtVEsTCpwvmEWX4J7VcPeO0pwAZI/j7YxWXJQRUwJPWIpDZP5Z3udDxax2o?=
 =?us-ascii?Q?W+WxbVeKOyl8Y4V/X3EDSi0RTNvrKbbZQBNzEUoSN+xC5DAS2jMCII1mcRK3?=
 =?us-ascii?Q?Phb7RK4e/0vzw7YXQMua1VH6EXb4Zyc+LyRf4tItNS0/kafJkkK0FThYGHEu?=
 =?us-ascii?Q?uI3DkBQoGRpzXmz5KsJq2eaXKEHE8EVEqRiBiDhfHW15J46F3OrPqK22kfAf?=
 =?us-ascii?Q?Dcr4L4WdzjTke01wC+Lxx54ZKfJwOfiGV53NsZSGnSDXpmaEXgFbS2HB5JQY?=
 =?us-ascii?Q?Y0+lVRVdC2wZOdERdj2yfX2zo/tUboUe29tRaNfB4BPR9TQ2WSG6joduaLPi?=
 =?us-ascii?Q?65wDM+YIHHnQMxSdFbpStlEYRlQjLuVBAVRcHsMUm7y2DQiJSMkEEVggNyn1?=
 =?us-ascii?Q?+FXcy0xYZdLQAolpmRR0gJ9wz7xMYy4bsgk4ivlaa+MrYxCJJDgY7IcxIuLw?=
 =?us-ascii?Q?GbMf4C7f5amywNvjh5AIHElJWkHqisy3JBbEj2LbbjlTlwS4fOVCeST51CsK?=
 =?us-ascii?Q?VRW2ZJ9tNGfie9l3JAjR5u9KjeN+sWJwkM5l8Nf1vhm852XwEw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NmA7arPcgsSON0Po1fBpzkTBxdELEGX+3SQM2fJSl0VG5CMXnrZ7mtqeBr8y?=
 =?us-ascii?Q?+zOlOVXqzETT8DncBiOhDceMXcnavVSz1wfTfmbaNKNrqAnZndlrfBR5NK7h?=
 =?us-ascii?Q?m8ScR1ltH1Y4bJnqWs36o02n+FPSjD5DDLvnkgjVbEgBpwidnZL2sPvp/P0q?=
 =?us-ascii?Q?6cONLg9Xu7kHEOM2IzMqvf5rojI1lNd4DKG4AJtsdigeJFCZbWHP0VWJtmL1?=
 =?us-ascii?Q?ZwfvaUX3KD43wqCUozwotxJ7vcT44LSrFyTKMueYFE1YbYoygKP/Q7tJxVtO?=
 =?us-ascii?Q?8EXaVYyn/UtMc75HLEjqmfNE21adS0MeMFtjTSrQMM4f3qTp/jqDzFjoSmhM?=
 =?us-ascii?Q?rzaq+GsJPzdIEkhYU13gFYb4iGPrdZcTSLkrylOcbAzcuB3RA0oiE88V/igF?=
 =?us-ascii?Q?sNFSzjoMkqSAdHNBa0BT8U68EPg1sK3wqVa7jPh04BUuWfWZRC8SBSJQ52Ed?=
 =?us-ascii?Q?tV7AEsbVGRViYqL9NFw+sQLzYX1o1yiTJbY3d97n38HoOPve1ionpMrR+VYk?=
 =?us-ascii?Q?SGIKd43Owe4ZKfb+8Ki3VSkvUv2ANZzpP1D3l1BZy9P1sAN7HGwKEMuxs4AK?=
 =?us-ascii?Q?TChYTXlapL1IcYLRZLDp6SHRFTzcqOKbsXWzCWITMO72S+KEgvm/3VHy0b3N?=
 =?us-ascii?Q?lbSNonkG8IV3a8pbs7ap++9fNu7dX7+jCowqk4Nf3wJHU9CsjjN6hEl2NaJl?=
 =?us-ascii?Q?gCCLhvUmTcblFQLLC3QZcCfOtB3LSIzFiXxWjldsOBJwM5Zvu9hbXsbFTXNy?=
 =?us-ascii?Q?VT7HULasHuVHlYpxkw+UweJYxB/QcpMaFu3Tsh/UEloVOc+9P6+VIeI7RwYY?=
 =?us-ascii?Q?M+LE3+0BJ3qZUyOoprSlFESgO5vROMIn7O0sFW73jhvt5RY2xFqyQ/e/6aOv?=
 =?us-ascii?Q?VsLLpP5Pho19L/bS/4SxLSWSATN/k+UINKYo82ZZyTR5bYASG3MPFaQY9GZm?=
 =?us-ascii?Q?WW8XjkDaTY6hY4jyC4REy/I/doD5PL/il3/avbAZogFgKnxblWXnSD5JbzEV?=
 =?us-ascii?Q?O7VA5M/VvGjKMPweYxA52f6x2hG471E5tScOLHnyxT0XzPRqBSutOEjnnDFb?=
 =?us-ascii?Q?7XXR3p0HRQhqh/CCXmwvPtUdpa8FSOTlN2cMh4yUWwgsc2yT3XlwhYrWWrxA?=
 =?us-ascii?Q?jDi7TlwzGzms/hraRzZ71At1d+FBGyEuSlAQ0kFNklQi1qcPG/q9H4uK7blK?=
 =?us-ascii?Q?fkPVu00v3WP4Ao6De7O1KYa1ESqjuIANOiD4qGiNXy2+L7s7sosVZRtDTQQ3?=
 =?us-ascii?Q?YluRVmBIoCrtXhf2l9rQBdc/itMBpYZhpAC6Kn0RQLOwqa1Nbvs/H/xiMatX?=
 =?us-ascii?Q?VfKGYev3wal3ILOoxvdP1fEpsXvRs1S0UNJJ0b7cgHr5Ebu79HknsUzQQOo+?=
 =?us-ascii?Q?tKEIE8CL3oNgBbTUY/jmIK+qMuPFxRpBclABl9Kjms64raqJ7HciguDoEAxu?=
 =?us-ascii?Q?MCKHG1TdJi2nQphkbW5bkTRL1NqxCfmOhwQee/rB1QfeeP3dSQ6CwpvPcDFl?=
 =?us-ascii?Q?wet6d0u2R53Llm9utGeBIfzbENa/5OyW+Yz3lr89/WkiDI8ul/ClW8A4tm14?=
 =?us-ascii?Q?X/30EX83xmQcMrf0cj+K3CkqjT0z1KbHPDQNYBmbIXxXZzr8vUCjlV5yviur?=
 =?us-ascii?Q?acWw5V/t5cC1W76wLeyK8MU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7bf56b5f-c843-4b2a-3b2b-08dcb4e71877
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:42.1564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /ggq3RH9u9vsqUx5EpIud7yuJ0+fb84/68MUGxwiBhPgasUioj+yHhD1YMFflqj+JusmZ2WXjVlKx2sNuEugk+AC7zJ1WpGHyItu+HYmXypfQtLqIk1fIBcn29qrjZV6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: PRKLTNGRYFRZTOREHRW4UVSYCOV5BTBE
X-Message-ID-Hash: PRKLTNGRYFRZTOREHRW4UVSYCOV5BTBE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PRKLTNGRYFRZTOREHRW4UVSYCOV5BTBE/>
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
 sound/soc/sof/intel/hda-dai-ops.c | 2 +-
 sound/soc/sof/intel/hda-dai.c     | 4 ++--
 sound/soc/sof/intel/hda-dsp.c     | 2 +-
 sound/soc/sof/intel/hda-loader.c  | 2 +-
 sound/soc/sof/intel/hda-pcm.c     | 4 ++--
 sound/soc/sof/intel/hda-stream.c  | 6 +++---
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 484c761478853..c00fc981f8059 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -198,7 +198,7 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 	unsigned int format_val;
 	unsigned int bits;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		link_bps = codec_dai->driver->playback.sig_bits;
 	else
 		link_bps = codec_dai->driver->capture.sig_bits;
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 1c823f9eea570..0b5d3c5693ab0 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -123,7 +123,7 @@ int hda_link_dma_cleanup(struct snd_pcm_substream *substream, struct hdac_ext_st
 	if (!hlink)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		stream_tag = hdac_stream(hext_stream)->stream_tag;
 		snd_hdac_ext_bus_link_clear_stream_id(hlink, stream_tag);
 	}
@@ -174,7 +174,7 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	hstream = &hext_stream->hstream;
 	stream_tag = hstream->stream_tag;
 
-	if (hext_stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(hext_stream->hstream.direction))
 		snd_hdac_ext_bus_link_set_stream_id(hlink, stream_tag);
 
 	/* set the hdac_stream in the codec dai */
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 4c88522d40484..f5be61a6f4ba5 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -542,7 +542,7 @@ static bool hda_dsp_d0i3_streaming_applicable(struct snd_sof_dev *sdev)
 			if (!spcm->stream[dir].d0i3_compatible)
 				return false;
 
-			if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+			if (snd_pcm_is_playback(dir))
 				playback_active = true;
 		}
 	}
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 75f6240cf3e1d..ec46529974a5e 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -262,7 +262,7 @@ int hda_cl_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	int ret = 0;
 
-	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(hstream->direction))
 		ret = hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
 	else
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index f6e24edd7adbe..d5a630da5a218 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -237,11 +237,11 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 	 * All playback streams are DMI L1 capable, capture streams need
 	 * pause push/release to be disabled
 	 */
-	if (hda_always_enable_dmi_l1 && direction == SNDRV_PCM_STREAM_CAPTURE)
+	if (hda_always_enable_dmi_l1 && snd_pcm_is_capture(direction))
 		runtime->hw.info &= ~SNDRV_PCM_INFO_PAUSE;
 
 	if (hda_always_enable_dmi_l1 ||
-	    direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	    snd_pcm_is_playback(direction) ||
 	    spcm->stream[substream->stream].d0i3_compatible)
 		flags |= SOF_HDA_STREAM_DMI_L1_COMPATIBLE;
 
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 3ac63ce67ab1c..c83b260c35f92 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -33,7 +33,7 @@ EXPORT_SYMBOL_NS(sof_hda_position_quirk, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 static inline const char *hda_hstream_direction_str(struct hdac_stream *hstream)
 {
-	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(hstream->direction))
 		return "Playback";
 	else
 		return "Capture";
@@ -667,7 +667,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 				SOF_HDA_CL_DMA_SD_INT_MASK);
 
 	/* read FIFO size */
-	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(hstream->direction)) {
 		hstream->fifo_size =
 			snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
 					 sd_offset +
@@ -1030,7 +1030,7 @@ snd_pcm_uframes_t hda_dsp_stream_get_position(struct hdac_stream *hstream,
 		 * is not accurate enough, its update may be completed
 		 * earlier than the data written to DDR.
 		 */
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(direction)) {
 			pos = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
 					       AZX_REG_VS_SDXDPIB_XBASE +
 					       (AZX_REG_VS_SDXDPIB_XINTERVAL *
-- 
2.43.0

