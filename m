Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A86D3ADE
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 00:58:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51FD91F7;
	Mon,  3 Apr 2023 00:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51FD91F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680476321;
	bh=h49XKkK4HhW3JC1zCA/N42qwdChGkAh+dJA1kDZERsM=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n7/t4WLmIiWx6mGCS+oofyACBC30Ib44k4xnW/EGgY6UM4BfwNv8Bb8wWZNY49SlW
	 ADViT2lkCLtcYid1MLOhvDQtJDugwjvHqE3CV0+kyIh36veCobXouRn0C9tNIup7iv
	 PEjY0rd62VHtDp86kb9sach2OJ7IGJKxHQ9fn99o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76F9CF80423;
	Mon,  3 Apr 2023 00:57:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E748BF8026D; Mon,  3 Apr 2023 00:45:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CE51F80249
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 00:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CE51F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=d7IrFp6l
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEhYkXmLRsPaqlGoosFhuiGS6/c0fhkEA3AglGLrV8p25OxTLhkvB5z/4QYmWsX1VqO28leGEmg7wWWsDLXO349Lc07FtDrWciHvs9JWxLgSzlXeE7/XSKNP6wsT8Kl4sytJk0fTK/kQvoMkds0yiv6Ud3Pk9i0MIB/Yw+pLBKtFLZB9YYdmAlHN+gJygnS9XXOB7iYCYBrp8aAlj3Smyu6xcQCL4zeaw3AyhbwHBS3HRXYT1ZXQVZandAHcMeTGGzV2fGp3dwOiioApbSw3w2z4Lxis9YdG8ODd5t8qkN2MEpGYYZg47FlKLLYNU3yXzg8VwRJ9PSni8WGUmLfSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeAYrZmDv8gjQQ7vHqPD+/JLzzb+H+jA2HGrrU5tp6A=;
 b=R3XpXkiJa1tm4Go7RtxV2YZYY8aeYILeG1nYYDRky6YMoRktX2nf8u7xjYEzgN8fCbTWo36csvkykvbGQwt7gllqGWq8pcuRwTHAHAn50UZZsNwld4qiYd/g23jcQuXGY1xrZ6gZ4mEGOTI5MHzzl+iOOdDGp3vo9Q0KSZg5kfyPWj5RYMGLVxtu27hI93xCaToBtVXp2njbvW8fyXho6jr5Hp2z/wNEeFUBsXDQVyLEMGysuUTnfPB/in8dPOvr1c2w9aC/S/ChzvSiqXzScc51BKhu1cFMXXhV5RVW426gYGR9WIETfxGVGZHjclhHvdvVpC2IhYrqa2fnB69Gbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeAYrZmDv8gjQQ7vHqPD+/JLzzb+H+jA2HGrrU5tp6A=;
 b=d7IrFp6lP45Z2tHgjeo4/NI1+0gp62pVOAWWlIm1aBcLuwMb9CMepBjS3uaDVn9BqFXLP5KWDy/NwQno0lld0XrKk/xOFdDptrglIMMu69xxlHNnkZ7dpGAM+rnI2urwISr0L6125a7QbRa6cZG8ZxgSk44YDBZG+2W2P9gPxMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11431.jpnprd01.prod.outlook.com (2603:1096:400:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:42:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:42:14 +0000
Message-ID: <87ttxxc3eh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 4/5] ASoC: samsung: switch to use c2c_params instead of
 params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:42:14 +0000
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11431:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f0d0a6-9b29-483a-48a9-08db33cb8198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LtmCdwNqc/J+DA42O+E6v9NIE++RzedjT3bGqqa/sF5XUZRwFizJilrknWeLku4mKHSgpf78E7yid+QZdHHPSlPqjsxQJ/v4n7wRsDD4MSmVXnWHYrdWyDKBu/HBi0fZIEOUzcBmJnEypm6utkicTE834OpEE3F2Rn8Yy9ynqLXTHcWbyMH5pCkoK+55Rb/++axFCX9Pz2aS4wEZWYk1ajWnjHuT/vRKCsi791c6fqQdsdUmkDyy35+3coU22VBPPwU+zaTS60Frm8Oa9ljNCPNckTQ8u7IbmPx3yACgNXS47+mHe4XHCMHWF3qmp2oC6ecmWqmuMWr9Mtav12nRmWsleOzLj9oOwYS0n+rZDwEUxEea01FtWmo6N/qxnmN/bS7PH6zgbCgtNg/eLF7zV9eZu1Taz88kCDXuAnaRk/br/pnD1fhpj8yYhQG4/hUILqH3BA63xXtsiUAFjpgen9QGULaeoJA2B+j3d4rU1P+Q+Ro/5Wt5/4bul4fdqZmnmD9WixuHaDe0BoTVWKjOyUEG8VK+P1iis17BLthL/ldQ87iS/Ucl5lCWl1tY6HLEDQLzYkwZsbTJBw/t5k6k3LtM7kyzyBoydYYWkXBiLAO37M2IxE6OKd5U5IzgrYzv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(4326008)(6916009)(8676002)(66556008)(66476007)(66946007)(478600001)(316002)(8936002)(5660300002)(41300700001)(38100700002)(38350700002)(186003)(83380400001)(2616005)(52116002)(6486002)(6512007)(6506007)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lfFtz8xfEXVmCGOBsWxm2kVuOhvvR9vgxnhZeEP+iGrytHxZyrYZwpxrM5qf?=
 =?us-ascii?Q?NUDVM1Ua9uXt1qCyTDDJLbQ4iRdLSfuNDht923f7Vh6JHw4i4gJeM7Mhf32F?=
 =?us-ascii?Q?HSgCES/5f3EdO3BgV/G0s44dTZ8Pjc3baQTxa7Sut+bCa9/yx05U/1wIIN5T?=
 =?us-ascii?Q?K1VHq1I1UOyHV6gH23fx7YtSOqPA41Q2WhpWqufZKUDoG0RNrjVwYcRa8Aip?=
 =?us-ascii?Q?gsaqQ3sQMNxlRLJIv0b5jhBT2/mOibQjsvpiYmsNwne9NMjbohb8W1x/mD0X?=
 =?us-ascii?Q?ybYG1FOdq0A8HL7ZRq4uU+rF1cPo9gs/423qztz2n4fJN0n948kXd1ngZkUb?=
 =?us-ascii?Q?qnDbZXkPaRNkvpjgyaLEfIiDmmEToRFB+/53gvtmWgzkFBE2SvoNB6xH78cI?=
 =?us-ascii?Q?f27B2uW2e25XUl7UaN4797uJeYv9jeRQDexqEALtJ1C9M8Vh3gphvKD+MiQY?=
 =?us-ascii?Q?cervvLSY+r3ZSnheHHdSItSotG2q08LQczPLqG6UuY34o9ep8CNnyhQ+DIO9?=
 =?us-ascii?Q?IIWbJQcde79nE+dCs0vyQILrSnMbB3Af2EH7FbLYZkYn8QIsVv/N7QVdE/tm?=
 =?us-ascii?Q?voylIxgezvjJq4wOQFxyTR2wfrptl81B3BgH0z4tABABY/obgWo93YVBLzfH?=
 =?us-ascii?Q?XKRdfe5wFp/U4ST2v51B+ft/VNIHE607HEnhkBv6L8st0TaC9IETBkz93U+m?=
 =?us-ascii?Q?1id+c39vpmYmBx6g1qBjOZvyB2sVLPalDTi8C03fSNJ8HpkRhzusMYyiiTZK?=
 =?us-ascii?Q?i0ijs4DCBZ2Mz9AniBzYD1mSc19zWVCm9IGZ/kjq5uqV0ElmNkipFmuBhWXs?=
 =?us-ascii?Q?0xQfTpYRLt/gmSqdy6rm3Gwxfs4/cypCXKnhpQVC2qFyV0XhraW0vnHXdTrD?=
 =?us-ascii?Q?ovPwit2fEqtFMnQDEfIstXGXM5Dgv3uESfHSx8FpWplzK9FO3vr69eZZz7Yb?=
 =?us-ascii?Q?BeWfh+FXAuSAl4kvF7pyxvZaiaWlaUfWMdm5j+9Q85b+Wz4NjFxUoPXt6NQh?=
 =?us-ascii?Q?2XRnX+ATRQBrZPakF1Y0NMZ5FCEeh1EWmYsD7BNe5yPpaB/cveXNPJbkPv9b?=
 =?us-ascii?Q?+nPBtBxZRhbVuEAJEBmKbztELUpn64jMP1LbBqPKxZWX/p4y04/zMf/EAUXc?=
 =?us-ascii?Q?bv0VVWVw3sWhE52Ot/27uJW9dK5yPtAPBN4PzK6ua8+bd1D8/wbocqcNUalx?=
 =?us-ascii?Q?wQLgy4LRLc0XjcErd+6fcOvHaBpreKdySOlvM8aXCtYBqnohWEWzQdKiB4Cs?=
 =?us-ascii?Q?t83aeMvtbot1FE6G88Ck+LCa+irCxKLnzLIdkoXxqlyJrNbnhx1y2wEdo6hN?=
 =?us-ascii?Q?3Fyi2nInS4FywFB25NSXLXFcMLPyiy2ITf9bTFQ+F8y0WCz8ZcWv8+ztJ4RH?=
 =?us-ascii?Q?CCn1oP6hsluHKyZt8Nzhfx2yA9rdG9OGP6rdhE54bDYY2/zszQoSLbJNZyGE?=
 =?us-ascii?Q?1DEAwG285i/OS/hUcV6EzpGCcoes0w/g+vN84GGSICc1mRioXvahKb3Wxne6?=
 =?us-ascii?Q?dpCe9pPOL+4xqc6Qm9B9nW69YEcz52by+0DXUp4Vn7XKBEEZt42VyotGJISU?=
 =?us-ascii?Q?AIMb3XvNSVggOb9SReXsMaTeE0MP4OesHRJIvNic2vI9iyiljYlabSmOS7jS?=
 =?us-ascii?Q?iX8kXlEhQz36IV1gVtChpuM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10f0d0a6-9b29-483a-48a9-08db33cb8198
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:42:14.9368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KJHrLil5yM7NmGOmjXoJ/g2EvwBEOJAyh12GIpLT8zvdj9PlhT31OPWrJaFeiSFoOinUF37WnXfSyJMyy884E99EddjA1ks4Q76KKzisBtGdbqLQhLPEyoKKQlsYUIWD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11431
Message-ID-Hash: SIJG4AXCU534UXTEJG6UKAUBZZ2UOQLF
X-Message-ID-Hash: SIJG4AXCU534UXTEJG6UKAUBZZ2UOQLF
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIJG4AXCU534UXTEJG6UKAUBZZ2UOQLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC is now using c2c_params instead of params. This patch replace it.
num_c2c_params (was num_params) was not mandatory before,
but let's set it by this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/aries_wm8994.c |  6 ++++--
 sound/soc/samsung/bells.c        | 21 ++++++++++++++-------
 sound/soc/samsung/littlemill.c   |  3 ++-
 sound/soc/samsung/lowland.c      |  3 ++-
 sound/soc/samsung/speyside.c     |  3 ++-
 5 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 0fbbf3b02c09..7492bb41456c 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -483,14 +483,16 @@ static struct snd_soc_dai_link aries_dai[] = {
 		.name = "WM8994 AIF2",
 		.stream_name = "Baseband",
 		.init = &aries_baseband_init,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(baseband),
 	},
 	{
 		.name = "WM8994 AIF3",
 		.stream_name = "Bluetooth",
-		.params = &bluetooth_params,
+		.c2c_params = &bluetooth_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(bluetooth),
 	},
diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 76998a4a4cad..70b63d4faa99 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -264,7 +264,8 @@ static struct snd_soc_dai_link bells_dai_wm2200[] = {
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(wm2200_dsp_codec),
 	},
@@ -300,7 +301,8 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(wm5102_dsp_codec),
 	},
@@ -310,7 +312,8 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5102_baseband),
 	},
 	{
@@ -319,7 +322,8 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_suspend = 1,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5102_sub),
 	},
 };
@@ -355,7 +359,8 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(wm5110_dsp_codec),
 	},
@@ -365,7 +370,8 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5110_baseband),
 	},
 	{
@@ -374,7 +380,8 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_suspend = 1,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5110_sub),
 	},
 };
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 411e25cec591..5d8118e69359 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -167,7 +167,8 @@ static struct snd_soc_dai_link littlemill_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(baseband),
 	},
 };
diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index b44f5e92224f..106770be6fc5 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -119,7 +119,8 @@ static struct snd_soc_dai_link lowland_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.init = lowland_wm9081_init,
 		SND_SOC_DAILINK_REG(speaker),
 	},
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 69d7b0115b38..22e2ad63d64d 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -219,7 +219,8 @@ static struct snd_soc_dai_link speyside_dai[] = {
 		.init = speyside_wm8996_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &dsp_codec_params,
+		.c2c_params = &dsp_codec_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(dsp_codec),
 	},
-- 
2.25.1

