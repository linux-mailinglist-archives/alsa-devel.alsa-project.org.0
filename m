Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1B498BC2F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:36:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30C25B70;
	Tue,  1 Oct 2024 14:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30C25B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786183;
	bh=l2zntLg+PUJmVJ63whG+Kb6xbrxkBksWG/eac4rY4tg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SCKCbc8Eocc5Q3oftMOmzIvzbDPrjsorghXiY92ZLjLVovZHSxMsxmYB9E9CN80oy
	 ezlT0P8O8U8nMLvfGOuoWqWZpc/Wr17pIQNTIeIOBA6gC3s9IBEyzAnCM+iR5AOJSp
	 GtUh4Yulv9wLYjITQw7GMH3yB9E5xP4fpIWWmPqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F9E4F80623; Tue,  1 Oct 2024 14:35:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ABF8F8058C;
	Tue,  1 Oct 2024 14:35:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D308F802DB; Tue, 24 Sep 2024 06:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82BD6F80107
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 06:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82BD6F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=cjdckGcn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCP9Yut6zKsXulo4yJKHb1+JU71fJSralPky5a6EdhhnMcWVR6iJRWlZv9FtYSmR+1e0Hsaq9NUeUXzr0uaGOQV5NefBt8BMhG8IdisPjrseWSwjLWXQFCCGrC7dRWnPVqXlH+RkpelPRQ9JG5bj4WPxA2RGuHzw3RJDh+gE+C5UeUv3HYosQLfC5ft5LtY8roNIST+KhOLsj5oGjr9BElaL2s1YeziVcPIpHpjrC2e15P86bIQZ000Uo2G3XE8SRs2USJtn4vTdCXJq1cTkL5KhcDmT1P2RVRxFMHzxi1PxqI70IvW1FqsErProt7IkjL39jTJd/iLUOEvZZ6J0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSPlbPlmmyRDuthkhQzvnNNo366mmvO9ugZaq9OtXnU=;
 b=wbmtosMrycYo3Le252ZxesCvZ4iOk4e5OXEFumqYsBsbhlR+Mw9wkkGpj7oPijZ3FpbtBVWZgmh0rJ7tIuako/ilfc0F2nsqG1ztENnWsP35ZL8GC6tvWkJLfwUuNMRho9Cp1RE3is7Pp7dQhDkwij/ND5DY/7ZbtsM30JVx1j+RuOhf/AfGV6ugg+k7EuZ4M0H653HOmqKb39qAn/3VptpR5higfOjJ5rdsjSwPTZ6SzgTr10TaqpuHEQikHEBqnnZOrlOwEH+SWIQr3Juy1dnV/V0Z4VxP6K5beiBDTtiv+h09I2tob8tMzpSusox2iPWKFkYRDNvrD+bHcwA8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSPlbPlmmyRDuthkhQzvnNNo366mmvO9ugZaq9OtXnU=;
 b=cjdckGcnLWpbR8TSUckMrFnSlW6MUjsLguFKMM1FDxCaGyO0o8lrX0mC3WL8+J8XxlrqKeb2JJAcf5IHQqKtMAjkRHohb1xDLziYUaWyHwDN0bYh3553M6nfUnZc85Y8ICCCCwTNbnkKeLTvtdjAlJOJ/GFlbwdTXPoPhCa29aW2fpaKaDPvYpHjI08VO4rlxuOKjWkM9IiFZOzHBAsz19uBjQa+cvAWZf2/QtB81/O52xS3elkRiofUDj4wmC9MSWj7Bpy1TuVcp/EmBnfSbzNB2QY4JV0FL5SP8F/RIiZI+87M2mXewVvywHKtSCDYcGb0x/fI4WQetR4B3MuBXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by SEZPR06MB7228.apcprd06.prod.outlook.com (2603:1096:101:229::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 04:18:36 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 04:18:36 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christian Brauner <brauner@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Pavel Hofman <pavel.hofman@ivitera.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v2] ALSA: Fix typos in comments across various files
Date: Tue, 24 Sep 2024 12:17:45 +0800
Message-Id: <20240924041749.3125507-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|SEZPR06MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: ac585089-aa0d-4f07-5223-08dcdc4ff598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6nHZwstgIEs5+6mNaeJTdgOQvG7NvfZZio7E+LXMfxOVJ2jpdvylobsRdoHB?=
 =?us-ascii?Q?XwFFFaGi6ZUV5Ezf8zJ+CWM+jn+p9fqKaN0ujyoA5oPYW7N+A8EZM6yJQGBF?=
 =?us-ascii?Q?1JY+OOM8A+jdDIykBM5mb8TVMY+LJ+Cze+vy2OWmRjeecYlR3l3BcUrtaA7m?=
 =?us-ascii?Q?2Xl77U972j72dCH89BLXoybYTIDUqAVT5KHj3IOMFn+Fh3Ut9DGRHNSLQEzR?=
 =?us-ascii?Q?HKTm5qjCsIinobVb70czUp5+cnSP7NlrJHZGXZSrbL+L8Z7dBdK9++6NQgeH?=
 =?us-ascii?Q?FJBKg0z8PVfQuIkvkQfHAM86maBEV++FgLmsAGbwhvZABVsQGsNCpGfbajB9?=
 =?us-ascii?Q?65JmiwQQ6bnlDGcj6rLekPjC6iFghb2O/PZggmeXXLGc8MVnwG9TZPb4tyJy?=
 =?us-ascii?Q?SzMSNMByoNRF75rlNAF9me+XCCSvQGCK/zQvwx+0B4CeXsdD+SgU7DQH0K8X?=
 =?us-ascii?Q?4M/tfYfbfguBzVerB1UgxqHQ50+Qv9r0v6trvL8OfXki2VKjvmclJohiLuZH?=
 =?us-ascii?Q?/TQFSEhHfqt7nuMzPdUeyJ7U4ySQpUxRSaFOxl/l8nUdDgN7G11QSBrpgLHB?=
 =?us-ascii?Q?bF6y/JgpC8vdj/9yAaHRgXt+STCdqeUZWS38vEENYd1TyU3jQ5T6+TkRv+1K?=
 =?us-ascii?Q?1XVL6OOrsKp5a7eUl3Wbenig9Tak7CfoTyF9zVEeFWgXuzLTW4DUmTRdVsqy?=
 =?us-ascii?Q?1NfFDwyTCqhpfmSrFuPIaAd1nQZHujTEWpjmjLpXnxb9QmC7qqt9CMObA/W4?=
 =?us-ascii?Q?OlWcqeMi1KLzcqsSTLXL6Vpik2vCudDkLjjSbDh4mSAjYj8YSUxNDwlM6fjs?=
 =?us-ascii?Q?WVx1wRjTzt7J4et7KNz9X9ZXZXwjU9iJHdlkZW9VpbJGvF2f6pr+4zwrxfTN?=
 =?us-ascii?Q?7zDBMAMyEZAwcY3cgeTVB/8B/CMG6m4ddj12oRxxDMhGQUs6kavGQfv2jI7A?=
 =?us-ascii?Q?zLp8NMThQzD8eYME1bx4CJGouem0z1kSh0ZTyUGlBgEIeDlGt80DMm/Xx07K?=
 =?us-ascii?Q?utJBLN0K300AEM8DeNaxi36oXZqt80vYgVi9fOnMy+wglxtpXGE2WygtxpL/?=
 =?us-ascii?Q?41hu1Mn9d+6QYVoNpczcdizA1Vbdb+ZW9NckAVvpND4Gpb5tvO9XaUmhf6F9?=
 =?us-ascii?Q?Ain+QIbWvGLQC09R0kJ43RvUHqijijOcolLkMfYjQ5J6MxnuLDbCdc5u1cXb?=
 =?us-ascii?Q?ZRFuUPBY/7atzJS9LiOSvR1e57AWahKPBnj5p/CirfPniVrIof5rORAlKgjE?=
 =?us-ascii?Q?7tnYMVS0Pz5igEugY4HJ6zo13H2erm3rzPLaIc9GUdaV0AWUEnQu3J+2njj0?=
 =?us-ascii?Q?3Y2aRXqE25E7zpGbKz72C80miZQnID23zmBzOxUaCOtF6mjC5youQATEeZu+?=
 =?us-ascii?Q?BeOkQEU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SHS0IhxAbO6hdnhSJd5N/G0hkIliaPbBdBg3v7zdB7lKIMxDTOVGK9Pk1+9s?=
 =?us-ascii?Q?X0IFns2hn8SfbFMkUQXjYLagaH86diuXS/ssnrvkAYfu3UXV/PSIsJty4HjG?=
 =?us-ascii?Q?9sr5UiebWkOZ2HzJRnmdg+ZT7cujP8GBdEHnpX6xFsoUjRivXnocp5g0QcgV?=
 =?us-ascii?Q?d2h7AGP7zaNmbXh6UtgnR3hRYx+iy/Bx3WizPQGevxmq3eZBPB1MsqYZRbBq?=
 =?us-ascii?Q?tTl2KvHZetNQVOjXZG0NAesSsHDMsyAmdRLJ7nczrk4dGeUkGvpkPg6TdvR7?=
 =?us-ascii?Q?4hQKmTpLG+/hUaImkAma2CBO/AopGRijc2aHpK1uXQhzB80cplvqklSSK7yr?=
 =?us-ascii?Q?yr+1WEvgRWC7wd6gpjNH68yunuZErgvFgn9uklMDd2bF+w39l8DrvvpHy65G?=
 =?us-ascii?Q?K49EFzt0aNKMKKBLvRaoHgbKa80PGbAAMyJgQFK5mZZz8qSejHX+r48gHB3c?=
 =?us-ascii?Q?b63uFFOBbafITh4fAe0PQwqypMSgn/rZQsJaxw9CVc/RpR1S9pzUuBQjgnnP?=
 =?us-ascii?Q?HB7O1RubkjSYFn+VanFZ06WCicCKuSwxRwsD31mjlaCVe+58AlGs17GvmqRW?=
 =?us-ascii?Q?9OissxV3jjwDUkP/fgjcFFkyIAiepcM3cQrMAovIh96/TgsbcVBE1u7+Vz9j?=
 =?us-ascii?Q?/RyMXqkFy7BOTpK1e/Fm/xGGsAeBjcKhO+/epzMH6itdtr5Bior7oHwrVE8P?=
 =?us-ascii?Q?lyWCDQBxKEmcOzrKYuK4nFN/D5/HvPm0IT5t0/aYEwzrnjOEcRCf2zU713GB?=
 =?us-ascii?Q?Fto0vED7iJGkcceIGC4dxh5tdjeBALPN1QozOBogPgRuJsV79ugtvJPPdLdZ?=
 =?us-ascii?Q?3u8/VHQzQZSdrkKJJEHhq1T5pV78aH+WpwhQAACmYIH5EXHucCqJDb7Cd2iB?=
 =?us-ascii?Q?5UG6EV+DdeDtM4Vxt4K7DmKXe437Q/RallTfp0L1YEZ9DDCmQaMNZ3eUk9Eq?=
 =?us-ascii?Q?v3kP7Ak7g2i/UMvAhUUy9oOk9dxBG0f73oWJHVc+Ta7ql5nbfw+jAwgvPT+l?=
 =?us-ascii?Q?jd2W5v98n69v6p015qQ3Li49uAHsfcF1tpa/5df47VbhhFRFxLZUsxnJn6H0?=
 =?us-ascii?Q?b8xu7F6PCXoPbuNKcj0IFOggp8udIumw1uLOVQwog46DGrWYtq5HHn+jTG3X?=
 =?us-ascii?Q?yVNOnfIVSBiM1OnmXoygj1FGc2UJ89P96v6fJM9J6Z6EEQ3pCrZcf3J7SSUo?=
 =?us-ascii?Q?U+mXzIV7PDDQUJX2b2a8reSQt857SZbWgfrEFWWFLTBy2G70UXgLvnLUDD4o?=
 =?us-ascii?Q?AVp46vCHeNbyK9g82bgJyf5WdlYi26KaClxClaCp2nQKSJl7sIxAtEPM9ww+?=
 =?us-ascii?Q?HgxV7kIDbAj/VJPvS3stESamt2WxbzVst2/7tudoRoBn5uQ0v+JU8frJqX9o?=
 =?us-ascii?Q?mvLEdZinWNMUlnanFh4KXlgCeywtX+i+P3FyYafhjE/It9BOqWEYuAkddRQ4?=
 =?us-ascii?Q?xtQbfmhV7zATsLzpuy1UYFuArQmOTDG/tPxb7AdgmwRMsN53riBhxZD0pTo2?=
 =?us-ascii?Q?AMspF0iZ0e2vEAf5c+4uTgl9UN7ULezHwCsyyynIAZSpA3Xo93q5qgiIjADz?=
 =?us-ascii?Q?DSl0F5fpijKnDlJxunZ3TBw7hydYupHrh3rYIXJb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac585089-aa0d-4f07-5223-08dcdc4ff598
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 04:18:36.2089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 duYl9BUm7BJQEQnFTavPACCHa9mDBX4a/HMv5YDx+cfpvE4HkjnaUMO0/awmvapvz1xXcxRj6hb4DycE6CR3RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7228
X-MailFrom: yujiaoliang@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FT4WS4P73PNNJJVQLK3M5QI5B772UTRU
X-Message-ID-Hash: FT4WS4P73PNNJJVQLK3M5QI5B772UTRU
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:34:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FT4WS4P73PNNJJVQLK3M5QI5B772UTRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch fixes typos in comments within the ALSA subsystem.
These changes improve code readability without affecting
functionality.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
v2: Update commit message.
---
 sound/core/compress_offload.c | 2 +-
 sound/core/oss/rate.c         | 2 +-
 sound/core/pcm_native.c       | 2 +-
 sound/core/sound.c            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index b8c0d6edbdd1..bdf1d78de833 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -288,7 +288,7 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 
 	stream = &data->stream;
 	guard(mutex)(&stream->device->lock);
-	/* write is allowed when stream is running or has been steup */
+	/* write is allowed when stream is running or has been setup */
 	switch (stream->runtime->state) {
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
diff --git a/sound/core/oss/rate.c b/sound/core/oss/rate.c
index 98269119347f..b56eeda5e30e 100644
--- a/sound/core/oss/rate.c
+++ b/sound/core/oss/rate.c
@@ -294,7 +294,7 @@ static int rate_action(struct snd_pcm_plugin *plugin,
 	default:
 		break;
 	}
-	return 0;	/* silenty ignore other actions */
+	return 0;	/* silently ignore other actions */
 }
 
 int snd_pcm_plugin_build_rate(struct snd_pcm_substream *plug,
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 99e39b5359cc..b49bc89c0758 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3115,7 +3115,7 @@ struct snd_pcm_sync_ptr32 {
 	} c;
 } __packed;
 
-/* recalcuate the boundary within 32bit */
+/* recalculate the boundary within 32bit */
 static snd_pcm_uframes_t recalculate_boundary(struct snd_pcm_runtime *runtime)
 {
 	snd_pcm_uframes_t boundary;
diff --git a/sound/core/sound.c b/sound/core/sound.c
index b9db9aa0bfcb..6531a67f13b3 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -133,7 +133,7 @@ static struct snd_minor *autoload_device(unsigned int minor)
 		/* /dev/aloadSEQ */
 		snd_request_other(minor);
 	}
-	mutex_lock(&sound_mutex); /* reacuire lock */
+	mutex_lock(&sound_mutex); /* reacquire lock */
 	return snd_minors[minor];
 }
 #else /* !CONFIG_MODULES */
-- 
2.34.1

