Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F12B99DAFC
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 02:57:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2C9B76;
	Tue, 15 Oct 2024 02:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2C9B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728953852;
	bh=a3QT98bomtfUSYQSEuqDI1AJXWTuVNw7SE0h9rV7scw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JE+TQhB4siBsinLAArOwNuaNhX0xpfiJ9a75/us0of9XBQ7IIKGL35hVf7Ww7wY8Y
	 oCcYLHAPddvSWw7h6e4pMkjZaVKuddH0a0nvQi6Pdbt3Omqwu8HOycl5H8CH7m+Im2
	 hHHhbh8ei/GlJ2waPKe4EtRY9byEWW6Y/LOz5+IQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DB6DF805E1; Tue, 15 Oct 2024 02:56:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 422DDF80587;
	Tue, 15 Oct 2024 02:56:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FA2CF805C0; Tue, 15 Oct 2024 02:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24B36F8032D
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24B36F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VQsOLQDg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrkP9X1WnaPIDH4wyJ52x6r7ob3jcxb9fVBva52aoSQ/aTtVHB1ey5nsndN7UgAl2Uz1AZCGdyWpCWs83USRPf3DTuQ9vCzOxWpV1VJSzAiYJ+Xg3u1CUtNAA8TyaGx+uZyutZbrTU4k50HQy22Iza1mH1IT0kp8F5XyhPatTvwcZvvhsrvWzo0hK0NwLZekvZGMXJyAkDs+lrL3T58T2UmQf5+hTz0nHywKwcehhIH/MZ612AyK6HLa1tEJXIYUHig+8FhMymX0eNJTT9Gc7xoDy+TFUHcfyC7ujstTE7h4joWSgLe4eo2PYgPfHYStI6wlzl/BMsUeoXvc7ZEJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6bixXz1S9oLZpJPC65pnQpAW6E9ApZBHhGMnOmYyBg=;
 b=JBtHj/zxYrN7kA1RfzjkY0q5Uv7GVyh68d6ayEGT9GZ7vSnbdx/L66mYO3m5DTBVja11OLRmkI8PRqMElXqgzdwBmQ7PMgTmaA0XoYQzd0sYZ5ySDPWjYqFcetiGVIUD5yVY0xWfBYFxnC307D1iSO5NvWJ7jjwJ2C5cPbf8d8wA6cDlRFCn7253vuXrcAlkPaqtPe+qDsnzSCo9Vm9flDDBhwzRtJ1U6CBcH7DfYHWgLDKYDe+Lw7MZTuSD9Rfj6eWmqo3i1GZCT+jr1bJGrIi8kB4OvVru4VCl2UjMteA3T3visb4ZD3wBSbKzJZ0BJmf4pySkewNyULq8IxJUog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6bixXz1S9oLZpJPC65pnQpAW6E9ApZBHhGMnOmYyBg=;
 b=VQsOLQDgTDAi/zkk5DOcrD60+z1GMiNQramkq+MVzT30CYr/ZDetW8/G3XVP+ZWO+2HFpnYXMxn7FN68fcULcv23iSCgH5KMk2juwwovleJbo0zo5AXuxkKn1WQs4aZBJLV+/tLVYwp8xGOrMkJ9WlOaF8lbE1GxDBjFNzYIVEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSRPR01MB11566.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 00:56:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:00 +0000
Message-ID: <87msj6qj4v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 01/13] ASoC: amd: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:00 +0000
X-ClientProxiedBy: TYCP286CA0075.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSRPR01MB11566:EE_
X-MS-Office365-Filtering-Correlation-Id: d94f315b-be56-4c1b-6496-08dcecb4231c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q/XTOqFK/OLW6t0BJdC15W7pqPGDMAfRGqyE/u4R2UKrXEp7tn9Nkhqn4kdg?=
 =?us-ascii?Q?0lHSnbVKYF0mJGJLsabEmrMf0Asa1/ecIqUbSt7lJbaXhyi6aOJfh2xiyqCu?=
 =?us-ascii?Q?SsVZeuVuWhOZiVLMLh7b9mYZ7PpNDt2E06pm1wEOOKvZLqGlqSz0eYnaU+FC?=
 =?us-ascii?Q?IBam/FJU9P+o9+z9NZBQEY48gQHrV8gGVUnoozDnMLhOZPoitu4T1o6pvcaI?=
 =?us-ascii?Q?+HS/jl57kpi2HclGzFsNYU/h1oGNv5EwtBEjSyIoPE5++3sIK2qwul/pJc3t?=
 =?us-ascii?Q?viMgmv2Ppyij858YHsefG0jzA8wNqeVYk5nceopsvKrKbFSpF+JzyDJALLfn?=
 =?us-ascii?Q?axofkv6oJrybj2VxvL6gYSCqfmR5Wx5i0Tbtp6r2PlyKOwQJig7sN0NcUqEB?=
 =?us-ascii?Q?PaKmknX3PAQRScpJTP/om8klc+Gt2W1wszsD0yBZuRD7xDNK5OlkUW59WMr/?=
 =?us-ascii?Q?gs+fAdszW0LJmiPibgZrzknB1yX1A5YzmDOmNfm+AwSAb5tFOpZkdeXZb52f?=
 =?us-ascii?Q?Epu35PGLvrWWgcWSEhKm43UWNZR82HVFd6u4ZQkkAM1Xqpil3qNDhMrIRDyI?=
 =?us-ascii?Q?XzCHDXDCiVGXC320YfusKViLFRCDavqkELgHEkq6PT2uE/utiHtN4OCEV5Fv?=
 =?us-ascii?Q?ZJvSaFbGxwO6EUH4QeyUnzU3XqP0OREQQXdU6DEvtniNlouaNjVs+cftrC76?=
 =?us-ascii?Q?sm1/eEgqxZeFpHTG2uIeomzVt7PVLrrS7qDJBmDBDDeg1L6u3OB9e+TA2IZW?=
 =?us-ascii?Q?GyjpXj1QE++q8p/0YJG0iielCbyL19t9NEmxdZ1n6xmjQ1+yPuAWZosnwFi0?=
 =?us-ascii?Q?H2+HnS9XYjFdwycrQ03yxOR/oYXRp4eLqSbtDdPdXQsOE9askYUPvPEpLveU?=
 =?us-ascii?Q?W+xkDpXCNSEeV5QPyjTbJpHFkVyqCZIPIGfKjfhqquMKtp9FK9vle6L1vd1u?=
 =?us-ascii?Q?XMWAndhvpAv76ipGrWDNmDXQuUzdHiTvODxDO9rH+WRe2JTU1+o7IV+h8/5X?=
 =?us-ascii?Q?+yiGIQxZIbbjihmjIzg9Kn6+mmh2xPjaciaafOq4zf/JvvGlIHTKI21mKx1C?=
 =?us-ascii?Q?AoZRPhomVYX7Ps/PlGDneKQAcm1NR4wqbveIJeBO99ciPjYZpYIj+A6kxlnh?=
 =?us-ascii?Q?VU6CR5gR3aFsSdPGIatBYKF8vW1qX8k09CaxLmJmdXKpMaYTh+TtvJQ2UK24?=
 =?us-ascii?Q?WSKt2buGQ06dJYU/vxWexHW/dpLPSsi175pOWNjYVBkvADeMnTIhwxquUo7k?=
 =?us-ascii?Q?3ckfESxSqX7Xbh51FdbKgpL0/xWxWVQZmzZIAabdmP3WBAHI0QZA9uf1X6a7?=
 =?us-ascii?Q?nj7qJk59g4AvhDqCVYPjHseBEBupsEq14UItmEW6PqG/Vw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mMW+fdpjIGZt1lSQjigv9uT9AOdC4317tmrvn21VH9rRcvQuKR/jvJWMsGXh?=
 =?us-ascii?Q?1hYzjVgDteQm8EWVwSDnabcTOSY9ZfSjb7C6m6jCi7GEfWSosAQJK8tNluyL?=
 =?us-ascii?Q?tQd95yz1Wb6u1at9y5ERQfRo2rJJuYsK/SXaHfCJnIIoT3aWX+AUJjf1E1l5?=
 =?us-ascii?Q?e6gCsBGXQ6A0V7K3BpevYjPrIVZ9LATU0n/OLNCMKpNDAdmU/Zm9fLpLMLmm?=
 =?us-ascii?Q?hNThlAZ2Icyn85iCJPbZaks3AO5QxDdccdV3ZzT/erRVwwlFYc1m8OJvQS+t?=
 =?us-ascii?Q?k3jyRkrmrSRUsYUtL8PzLDgke4lNMMi9bcbzLBeMVESlycitXwoyzPTpMsMb?=
 =?us-ascii?Q?J7+gU3ohCxHc7mGHEkXgvByQRwoFYyFjXfQOpdkOVbBSqlxHJ0HixJfdfHlV?=
 =?us-ascii?Q?jLzmDXXj9HlfMAEl3c+enqkfRMkceWYL6TPnfdNZfVkaVAVsLQaBHcD3aaDQ?=
 =?us-ascii?Q?feERr5r5pakfxY61MI/UhXQVmfCIqOSNoxUnRyKqzBEMtS6QWhLFJ/K7lJ80?=
 =?us-ascii?Q?1y5qJ8hit6KBq3RK3KdU8xWOOHAX4iGJftGpKwdfW1ClMGTwpWwvJMiUZcYW?=
 =?us-ascii?Q?3HHXipt6ECi3BXiStNqlAdCfHwa1vUvqwqARr7IFPeASqBG8lcFituiRpRvX?=
 =?us-ascii?Q?JWhkKE+GtXaQvTAml3AQIgL6gf0QBS6prHSKH93W48zReZb72UMyguRdpYzY?=
 =?us-ascii?Q?ZhzG8G+RD7LjmI4GajfW8P47nm+KGK8uK+cHRQabLhLWNPp1J14P1G/mI2Lt?=
 =?us-ascii?Q?qv5pchHGn71oXw09AAl9XwFQWqekThIuPRDwNpnLW1iaW+HSfegbMSwHNumQ?=
 =?us-ascii?Q?Scr9GE17dl4NhpmTgdau2lLFUAv+/Mbsi7V33JiOmx/lUcVLhBV6I6mYubxc?=
 =?us-ascii?Q?jr0f1B8S2kLyJenB/NYQRaB7MaW4FoLPoKgIYNr5cFt01EAdbIJIAaokmYdu?=
 =?us-ascii?Q?Soxq6qmDg61FwXwy757kAWpOrEtPDTxJCPPd+V2gYuugePylHX8Z3jyzVY2t?=
 =?us-ascii?Q?CA8hAK1jfbDpivOPJWkWrxINknAalvqnD253EmVL3vKs7QnbXSMFOyKvb+Ap?=
 =?us-ascii?Q?OkARhO+TkstH7yYgPlLAAfB6dnfito+ya3fzfkzFJIYd2ywNc75wysEG08/O?=
 =?us-ascii?Q?ocmGucRYud15iVwyTKTx4ohRl090Wnw6hwI1kOR1/nl/uyr/+0mV+4BXh2N8?=
 =?us-ascii?Q?pbDt7Dp8lrhC4KBBujmPU01uW+Ok4uWLVNBU7LFHjA30Ty0V8c64WznyL+i9?=
 =?us-ascii?Q?d7yWjRIBBJOqXI0k2RCzDL1Ikvq0ZWS9pV3AM0uvCbqudtrXVh8z4kl2fWkB?=
 =?us-ascii?Q?KzP0w4ZjM7taBcqzG6/xftILAqK7R2voHPYx0tS6TtYQdKwiqangcm8Y52A1?=
 =?us-ascii?Q?RSmpHsoGp6WwkWGEUh2j/N6i6BDJKOOLZOa3klrttllIn8Glfc0SURyG4i0C?=
 =?us-ascii?Q?hnTEyKuYi2ccdtdLGEDpIMfei1+ePiUePWYNSmxJd0+/kn/gU7XD5Hxq/b5e?=
 =?us-ascii?Q?PIakIqvHQ6UYUlcWCbyBW+qZakp6MazOOCBM9SdK2Yf7nZpjxOQAeTEu8IfR?=
 =?us-ascii?Q?6iG1hGRrjn4XKIN7OsTIHQAoKH7T8bUm/LPyK9fLkKMNm2wjiL6T5eMWhFBc?=
 =?us-ascii?Q?SavRyHSfrkZBmUvg3tM+vmM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d94f315b-be56-4c1b-6496-08dcecb4231c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:00.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CQYnXnt2BgQrRnGXmF6NHXYzfb9kinpSpwXjpLp4hHC9LJOG0HtlncwYk2QG27EJyPLKnADPgLJ+twaOhN0+PMV2jqFTVHOHIEC/7aivKlkBt28pM1p32sC/vWE3YRvx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11566
Message-ID-Hash: X54WPF3VMTGYFY5YUROLDSCSE7Z7CPEM
X-Message-ID-Hash: X54WPF3VMTGYFY5YUROLDSCSE7Z7CPEM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X54WPF3VMTGYFY5YUROLDSCSE7Z7CPEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 20 ++++++++++----------
 sound/soc/amd/acp-es8336.c           |  2 --
 sound/soc/amd/acp/acp-mach-common.c  | 24 +++++++-----------------
 sound/soc/amd/acp3x-rt5682-max9836.c |  6 ++----
 sound/soc/amd/vangogh/acp5x-mach.c   |  6 ------
 5 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 77cf72082e73d..02b04f355ca66 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -542,7 +542,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
@@ -552,7 +552,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
@@ -562,7 +562,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -573,7 +573,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -584,7 +584,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
@@ -598,7 +598,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
@@ -608,7 +608,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
@@ -618,7 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -629,7 +629,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -640,7 +640,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 3756b8bef17bc..0193b3eae7a66 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -150,8 +150,6 @@ static struct snd_soc_dai_link st_dai_es8336[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.init = st_es8336_init,
 		.ops = &st_es8336_ops,
 		SND_SOC_DAILINK_REG(designware1, codec, platform),
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 2394aa061265f..dc18301843f22 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1407,8 +1407,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1444,8 +1442,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1480,7 +1476,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		}
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1512,7 +1508,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1527,7 +1523,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_maxim_init;
 		}
 		if (drv_data->amp_codec_id == MAX98388) {
-			links[i].dpcm_capture = 1;
+			links[i].playback_only = 0;
 			links[i].codecs = max98388;
 			links[i].num_codecs = ARRAY_SIZE(max98388);
 			links[i].ops = &acp_max98388_ops;
@@ -1553,8 +1549,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_bt);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->bt_codec_id) {
@@ -1574,7 +1568,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_dmic);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 	}
@@ -1613,8 +1607,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1662,8 +1654,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			break;
 		}
 
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1691,7 +1681,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1734,7 +1724,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			break;
 		}
 
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1790,7 +1780,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			break;
 		}
 		links[i].ops = &acp_card_dmic_ops;
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 357dfd016bafd..4ca1978020a96 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -317,8 +317,6 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = acp3x_5682_init,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp3x_5682_ops,
 		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
 	},
@@ -327,7 +325,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &acp3x_max_play_ops,
 		.cpus = acp3x_bt,
 		.num_cpus = ARRAY_SIZE(acp3x_bt),
@@ -339,7 +337,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 7878e061ecb98..2ca904db82abe 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -276,8 +276,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -288,7 +286,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_cs35l41_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
@@ -375,8 +372,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -387,7 +382,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_max98388_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, max98388, platform),
-- 
2.43.0

