Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F43454409
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:43:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11EEB17F6;
	Wed, 17 Nov 2021 10:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11EEB17F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142206;
	bh=6x0MIXznXTUuu2irGTVZ/uJvmt2cm0kwHzmU+5eGar4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tsb3r7RGiuXdHfVyB74DMBDPPwaiXywufDrmQmqmNWPaTyRi4sDHM1ORmHjyozbKH
	 c9TTWoHLXZ+pQ+zF5j0WbcPhV+ucYuMatrddQpCiobQVxwhj84fGT3ykJR8TbE8J7W
	 FFbDosYIb5JuWDuBnWCS+C0moBCHaqHRhb8L0dow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC699F80549;
	Wed, 17 Nov 2021 10:38:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1815EF80507; Wed, 17 Nov 2021 10:38:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7672F8027D
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7672F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="a2XVBiUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNjKRxYEWOOQNV6fnLVBeIxsd8fky/8WjWM67zaSk6LWLMh6tFZr+Nb3gie7UB4xeSeAUt8dcfTvRZAyb9dtvHCprsh5wMVqEhcCLbxNCxoJSoBCxKyo8PCU8F+gYsM3CGKsosDVyVaFHgBLK9wEah+XXC3/my2Nh30r7clnvktP0z2KIkTbplKbDyLpkaG9ohsEq07CsbsQIzGlRIisDNcqC/P/67YA6K7ldBY2S9BpWZPni4NOkGR3jhYcYMcaesm5UAv1Y53hHfBQZuze2txOOkYbntGQ7bCQaDGI20qpIBZgnSA2d+KsXwP8tV+agq2ky3euVQJ+Fk8CbxHAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LqjUUO5qv84gjPhhIR8SitLrMEkMICo5WShMvZ18tY=;
 b=QpD/0sWOR0QWbRxxQg650XULi4RYVDDxqXNceHZjCuC7jqVJtqN9mKX3XB5c2LwdelXcb9WPueKrDhZGW4uCjMYb3e0Rk872bsdwHOhy7I32KxYieNVHBYIgKeP6Skp3+jQsgr2kOL5k+RA4rp+AS/94nNpD0QOV/KjasHoHLMIRAJlwfmWo1YA4ifphGcjcCFJ3kX99Bnwknz+DiOCMqVZr1ZeqbXIcryDvMyOmg3W9WBTzNhkD/DRRuZWyKim4K1BFnQ2Ip+3bb1m38t+n/xwiA+cINCSlgiI5ixpgXbxys+heb2dSiibZGsglUS0xA1hjiUoFE7m2Rqdg+pey3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LqjUUO5qv84gjPhhIR8SitLrMEkMICo5WShMvZ18tY=;
 b=a2XVBiUyHxPCdiV2dH4fs24SlivRhgNRVc8v9QQEv9nj44myXB+ODM8o1FB0o1u/VNtwPx9ghD05Uoenqc01yGdR0NquWignOzteNy/nHQlgcqsm4t9GeWiRPsshBgyvybBwo25XKIzCPeii6Ey4SjmW1YDAorfxUxKBxVehF/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 09:38:21 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:20 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 09/21] ASoC: SOF: amd: Add Renoir PCI driver interface
Date: Wed, 17 Nov 2021 11:37:22 +0200
Message-Id: <20211117093734.17407-10-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5740da27-42fc-4690-f730-08d9a9adfe1f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6623:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB662325CDDF06833DA08F7FD6B89A9@VE1PR04MB6623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kl+2yyslrH3UUP08RbverIm7V1sDX7HPf1mgjdKZHSEJ8+JuEtuLzf6JgTp8Kg1v5oAyGgXwrLwm9qNNvPuEKJtX0MIKXt2WBesQ3i7gQHhyIi0j0oAsp83DHBjSHp2JISKReuDJRgpDaYW9xVBD+0MRxOLsgovZINQil0s4FikeVom5vjkAGLIXLmubBnc+SSmc8asTfo4CfVx00hipBj1wXt8Lw3DXB56R6Aa2yRN9iVKPkAhHMgd7hBwP2U85gyfBcFoUwW9qYMTAk1r7vux6d6g3u1MSI1mU3kQD8uCrKrVaA6jD9O6t/7Xne+3Sn3Jp9bctIJbINA/WjoBBzlx0wVN2LL+OHvel5Xl6zWcEZYAaSkVA3WMO7kKaJYB/nDl9+b25ahFdqhU+lTTVIR+ff/ZA2x1MLoXFtNHgmbilhozer/0aS959LOBCvzi8d1BRkzeEx9SmNd4zrU3TrPqgfk8shHDwFiY43/Lo5BhJ4rBEvJGBEAZffQa2tAwXPst1mQo4WV/LTCW9/Pz+d57lJUuTMWDm96Y5MtJSmyHDoo2u7je85JSkpyoXe9ls+EBdY1nA8Q0E8yYsmCillO6JFdd51zkgTbb2hhUQutLBnzbV/kdLXKrZHlZ2opX+mDp1dZOevfC5b1GkzoBvRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(1076003)(52116002)(6506007)(5660300002)(54906003)(8676002)(508600001)(186003)(86362001)(6666004)(2616005)(6512007)(7416002)(83380400001)(44832011)(66556008)(66476007)(4326008)(66946007)(316002)(38100700002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7mae2ih/ny87wuzM9tGD1YOFKdcxjsCWXbOhuCSiyZlI8zj/UbgiK3Gy0U0Z?=
 =?us-ascii?Q?lsl0BRSdCIyeICVKizgQ+gs4HAV5HpFZq18SssGDcsbcFSysbR3cm4pCxZt0?=
 =?us-ascii?Q?0oei5ISs77PewV3YkRGsIxo8HP1BVpm7f87D8ijw21Fr7K62IMfOX3ufjf6r?=
 =?us-ascii?Q?nHK6aIcfs+TsI4oQ+ARTGOo7zbaSF0HGp/PWMR3IQryCSwBd6BjJNRQWNvF5?=
 =?us-ascii?Q?ujISycODGAhPFqb7YS8L5AmtGWV3dw+yZsk49hdmzz3DUvMTens5dnn3SuDG?=
 =?us-ascii?Q?amYbBIwSoRtPEWGATs/4E46Y8G+FTFn3qgyk1zueCw/f04g9y0d7iu2ERuXc?=
 =?us-ascii?Q?CHJQtOHejsMSrZftAq539IT7AcaNvEnhJY3fFXMj0f3x6Iw7nNoabub64rzc?=
 =?us-ascii?Q?dLFriWXiIan6SWNkY0sEEIkFgkwYe9kEqflL9kAODr02McGXWla34ae+KbMV?=
 =?us-ascii?Q?Mr5VV9HAzvZGnfSmz2YgZvfKSyPOtacu8HnfY6iq5+8g7WahXr/wGOPpZ3uW?=
 =?us-ascii?Q?3bLsDvbKuDSCjs5KxV7XOLJiPTMRRP1217DXs93KHbwqySFwTNT9RxlsYRIt?=
 =?us-ascii?Q?AzUAZQQebiVYF0Hi9WzLBnMXw/pI9N5tskk+olLbZOpY6We8agwwUuWknU8S?=
 =?us-ascii?Q?2CJLMZ3CYINxCqvLOPRMfYrHLC+D+Nbb6STaz1J2gIF9R2uvnYj1Wj/EVHnG?=
 =?us-ascii?Q?CoeXTHpwq5Ed9batKng3QI3S8dQVtMolj25Qrcz8sCJozCHXLtVjuGyV4/PA?=
 =?us-ascii?Q?qZx1v1GOaVfgYWnroHooJIcmI532y9rwDiFLE5SJZbPOfQterg7+jU7Qgd4S?=
 =?us-ascii?Q?lelE2eGk2YZfzy6P0Wje5m1WhE6ifFY8nJkFjyTQRIwnjsy5x45YOAegwTnj?=
 =?us-ascii?Q?WFqJ1YA+7xFoMWhz950nAby5ltCWSo2zUUZ5Zp8SYHUfW9ppLp/vw5lSCYT8?=
 =?us-ascii?Q?5qyDgzXoNioP1GMJYwBlFzYDnUpyATGjLmPgxFF2LNJ/2c3EpC5Nu19OO4P3?=
 =?us-ascii?Q?IPHJcQOU1mY/G8LMHu1umD5LTisx101lkDX075xCVeLvghasjpFp4E07deYx?=
 =?us-ascii?Q?BxhM2NS7ouO2R0xEQ7ABTnFc2LcSkccRAFJ2EyNmZ+5lZ5cyn7M3NgtbBAF0?=
 =?us-ascii?Q?TR1H2TVcZFP2Pj3nAzi1S6XPiFszqFSRgD83kiigqUbj4k3r55Tz6vnFxSE7?=
 =?us-ascii?Q?W665AHngkS0IsGqHfWfxVFqygucTV06rehpe0UF2Tr5Xz7BOo3eFM83ezlXy?=
 =?us-ascii?Q?csEcbGtYQOgKy/OG0bs07xGCPRlEKImJAdfGTE012oIy4vzKI5Lkoanm0MOZ?=
 =?us-ascii?Q?8X2q4sGoMdoAWTm0GwRoqT36/Mgh+xdZrhIPsSlWRwYLlSn6OYAWIPSAY8Bi?=
 =?us-ascii?Q?IJeGxWMkm7JvxiV3dAWYd3mdlh4DvhvLTbgnE5/JApQ55QNFm1Gf/C6Ivs1h?=
 =?us-ascii?Q?fSJC9ydP4MHLbdMsQk3sGhA7E1lLdZdrpZ8KayXMwnsDCzNMzfv3fZjL5C+R?=
 =?us-ascii?Q?BFQGRoFtFagUx6eC0YA7CX0gU4ELcuadJ6/RE3lcRj/gBjY0+O7vVDw/CzE6?=
 =?us-ascii?Q?+lUmBIejao1pGsr927tSqtfagrLHdxrGy3ojktuxNwYqaTUUV8f3nWazuly5?=
 =?us-ascii?Q?+wQ3EpTs3C2POt0StFCdN9HXyVL3WNbLLrldfRPxNj8LSrgN6fGftbgmD7VT?=
 =?us-ascii?Q?ieSe+4qO5fZlO7Qv+/qr7kyyJ4Q=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5740da27-42fc-4690-f730-08d9a9adfe1f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:20.9159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3IBgQebVRe8xYTZTwNRmN+U17NedR8QJFzzK2Cdr3vc/CI43H9hAS3xL7jauZ8nC5R2N5YSN5P6oVj5+GqG1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
Cc: daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

Add PCI driver module to enable sof pci device support for Renoir.
If machine flag set to FLAG_SOF_ONLY_DMIC this pci driver register
platform device for non dsp based I2S platform device. If machine
flag is not enabled for SOF pci probe will return without invoking
sof device probe and registration

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/Kconfig  |   5 +-
 sound/soc/sof/amd/Makefile |   2 +-
 sound/soc/sof/amd/acp.h    |   3 +
 sound/soc/sof/amd/pci-rn.c | 160 +++++++++++++++++++++++++++++++++++++
 4 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/amd/pci-rn.c

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 400dd5a24ae6..085232e04582 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -17,14 +17,17 @@ if SND_SOC_SOF_AMD_TOPLEVEL
 config SND_SOC_SOF_AMD_COMMON
 	tristate
 	select SND_SOC_SOF
+	select SND_SOC_SOF_PCI_DEV
+	select SND_AMD_ACP_CONFIG
+	select SND_SOC_ACPI if ACPI
 	help
 	  This option is not user-selectable but automatically handled by
 	  'select' statements at a higher level
 
 config SND_SOC_SOF_AMD_RENOIR
 	tristate "SOF support for RENOIR"
+	depends on SND_SOC_SOF_PCI
 	select SND_SOC_SOF_AMD_COMMON
 	help
 	  Select this option for SOF support on AMD Renoir platform
-
 endif
diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
index 7b88db9c5fb7..b27ce50014b8 100644
--- a/sound/soc/sof/amd/Makefile
+++ b/sound/soc/sof/amd/Makefile
@@ -5,7 +5,7 @@
 # Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
 
 snd-sof-amd-acp-objs := acp.o acp-loader.o acp-ipc.o acp-pcm.o acp-stream.o
-snd-sof-amd-renoir-objs := renoir.o
+snd-sof-amd-renoir-objs := pci-rn.o renoir.o
 
 obj-$(CONFIG_SND_SOC_SOF_AMD_COMMON) += snd-sof-amd-acp.o
 obj-$(CONFIG_SND_SOC_SOF_AMD_RENOIR) +=snd-sof-amd-renoir.o
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 36d000c3f792..5f6e9eff116a 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -194,4 +194,7 @@ int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substr
 		      struct snd_pcm_hw_params *params, struct sof_ipc_stream_params *ipc_params);
 
 extern const struct snd_sof_dsp_ops sof_renoir_ops;
+
+/* Machine configuration */
+int snd_amd_acp_find_config(struct pci_dev *pci);
 #endif
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
new file mode 100644
index 000000000000..3c379a5ef231
--- /dev/null
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+//
+// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+
+/*
+ * PCI interface for Renoir ACP device
+ */
+
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <sound/sof.h>
+#include <sound/soc-acpi.h>
+
+#include "../ops.h"
+#include "../sof-pci-dev.h"
+#include "../../amd/mach-config.h"
+#include "acp.h"
+
+#define ACP3x_REG_START		0x1240000
+#define ACP3x_REG_END		0x125C000
+
+static struct platform_device *dmic_dev;
+static struct platform_device *pdev;
+
+static const struct resource renoir_res[] = {
+	{
+		.start = 0,
+		.end = ACP3x_REG_END - ACP3x_REG_START,
+		.name = "acp_mem",
+		.flags = IORESOURCE_MEM,
+	},
+	{
+		.start = 0,
+		.end = 0,
+		.name = "acp_dai_irq",
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
+static const struct sof_dev_desc renoir_desc = {
+	.machines		= snd_soc_acpi_amd_sof_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.irqindex_host_ipc	= -1,
+	.default_fw_path	= "amd/sof",
+	.default_tplg_path	= "amd/sof-tplg",
+	.default_fw_filename	= "sof-rn.ri",
+	.nocodec_tplg_filename	= "sof-acp.tplg",
+	.ops			= &sof_renoir_ops,
+};
+
+static int acp_pci_rn_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+{
+	struct platform_device_info pdevinfo;
+	struct device *dev = &pci->dev;
+	const struct resource *res_i2s;
+	struct resource *res;
+	unsigned int flag, i, addr;
+	int ret;
+
+	flag = snd_amd_acp_find_config(pci);
+	if (flag != FLAG_AMD_SOF && flag != FLAG_AMD_SOF_ONLY_DMIC)
+		return -ENODEV;
+
+	ret = sof_pci_probe(pci, pci_id);
+	if (ret != 0)
+		return ret;
+
+	dmic_dev = platform_device_register_data(dev, "dmic-codec", PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(dmic_dev)) {
+		dev_err(dev, "failed to create DMIC device\n");
+		sof_pci_remove(pci);
+		return PTR_ERR(dmic_dev);
+	}
+
+	/* Register platform device only if flag set to FLAG_AMD_SOF_ONLY_DMIC */
+	if (flag != FLAG_AMD_SOF_ONLY_DMIC)
+		return 0;
+
+	addr = pci_resource_start(pci, 0);
+	res = devm_kzalloc(&pci->dev, sizeof(struct resource) * ARRAY_SIZE(renoir_res), GFP_KERNEL);
+	if (!res) {
+		sof_pci_remove(pci);
+		return -ENOMEM;
+	}
+
+	res_i2s = renoir_res;
+	for (i = 0; i < ARRAY_SIZE(renoir_res); i++, res_i2s++) {
+		res[i].name = res_i2s->name;
+		res[i].flags = res_i2s->flags;
+		res[i].start = addr + res_i2s->start;
+		res[i].end = addr + res_i2s->end;
+		if (res_i2s->flags == IORESOURCE_IRQ) {
+			res[i].start = pci->irq;
+			res[i].end = res[i].start;
+		}
+	}
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+
+	/*
+	 * We have common PCI driver probe for ACP device but we have to support I2S without SOF
+	 * for some distributions. Register platform device that will be used to support non dsp
+	 * ACP's audio ends points on some machines.
+	 */
+
+	pdevinfo.name = "acp_asoc_renoir";
+	pdevinfo.id = 0;
+	pdevinfo.parent = &pci->dev;
+	pdevinfo.num_res = ARRAY_SIZE(renoir_res);
+	pdevinfo.res = &res[0];
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		dev_err(&pci->dev, "cannot register %s device\n", pdevinfo.name);
+		sof_pci_remove(pci);
+		platform_device_unregister(dmic_dev);
+		ret = PTR_ERR(pdev);
+	}
+
+	return ret;
+};
+
+static void acp_pci_rn_remove(struct pci_dev *pci)
+{
+	if (dmic_dev)
+		platform_device_unregister(dmic_dev);
+	if (pdev)
+		platform_device_unregister(pdev);
+
+	return sof_pci_remove(pci);
+}
+
+/* PCI IDs */
+static const struct pci_device_id rn_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_PCI_DEV_ID),
+	.driver_data = (unsigned long)&renoir_desc},
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, rn_pci_ids);
+
+/* pci_driver definition */
+static struct pci_driver snd_sof_pci_amd_rn_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = rn_pci_ids,
+	.probe = acp_pci_rn_probe,
+	.remove = acp_pci_rn_remove,
+};
+module_pci_driver(snd_sof_pci_amd_rn_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
+MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
-- 
2.27.0

