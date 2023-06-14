Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C57672F0E1
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 02:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C8673E8;
	Wed, 14 Jun 2023 02:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C8673E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686701970;
	bh=NCjS/YPRnuHoKO1aTYBZWs1EcVZVTAvrAsok5jRz960=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qf3hefmW1oYRr5cnEersAYjBMbdKT4fAHLxkO/DSyGPPDGRNY33Q9Ch5heXchDnn0
	 IdPaOb/E+31s0mfF+h/KnYphHxuGkHAFxkIkGeRp6In9dHsBofBTPBvhIoLB/43WEz
	 jnd71SrRhRoZRigTJlWzNsl+REtT4Mnyl3fE6na8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 394F9F80155; Wed, 14 Jun 2023 02:18:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2CA9F80544;
	Wed, 14 Jun 2023 02:18:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D55A1F80549; Wed, 14 Jun 2023 02:18:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A547CF80544
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 02:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A547CF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dz8li03j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zn3DtT1qxL41EItohb3ScxORKr8D0sbwWasMWt33te0uThxi1pLo8BUOYCkcUXBqoeis0CXgvf5T69hU4Kl+5NMnOcvsI/zbDawUaIGKJGoWFj93yf8FetmmOldGRJvl2TE3xNWaLBK+6m9VE6AAlzwYYiRRMC2GEvPu/IfNisotm2LFkc+sZMFDfTiBLDvhSw4lGhU2Dce9V9fpa20GC7915b7aqrPRtjsQ3kAzavhqte9dIxIOFT4SxouAz4lZ6OKTiYDjM41n5eJBxdzJ5bRxm6D2/Y1+n2bnO1NFwqOopoDrlnQYOw72VyuHbvzTTSV0l7re/7FI0BT+/G0Tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAlbCYgCeCbGe3efzHql2xZxCvCdP1T+YxOFYXxA+1E=;
 b=EuLftFw7CmCTA6UBKS0TUSZKQKyQm10uxBmVvA08SfusKsLnxwoCJbH5u8aI/a//5IWlIMPzCfD+Qy6X3rZK2TXi/J0ih1YLyoH2K3lCU5/A1m44tq6bZ1nPtV6zmeE1R/FITrGU/HV3oHacV5VsvtPQrbT6QnVKpPZPNJ2FHeGTgnGS5WM0XKiVMs8uXKjzTAcqT22KkE4llJWmjPsWaDKvQxUClx1p+DgUbPhuZW1UqUBAOPNdQKiM1k4wtPYP8Bx+bue2eZrwV/FHX/Lt4+pzCKcqZEupfus/tq+p+W0R6YKopoorR23ap9qezO4fzwrH2adatv4ott2a0ivV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAlbCYgCeCbGe3efzHql2xZxCvCdP1T+YxOFYXxA+1E=;
 b=dz8li03jqdVEoNMlqsYOPaKjMawfS+23rYq/1kwrXRQeqUe/BiNlI9izGWJtXkUgXkqrGCLO+V3ZjTXhhbQho8zCqDS7g6aQ37FlyHJ9vm0Zr4uKkAzLiwYE3Chq37SDZC4nPmUUAczEw6mJP/bK+B+YeLUjKUUxl+XZOjbLTro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by OS3PR01MB6276.jpnprd01.prod.outlook.com (2603:1096:604:f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 00:18:21 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 00:18:20 +0000
Message-ID: <87legmhp6b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 1/8] ASoC: soc-core.c: add snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Jun 2023 00:18:20 +0000
X-ClientProxiedBy: TY2PR0101CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::13) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|OS3PR01MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: f87e51db-3e77-4530-2f10-08db6c6cdc24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EO3aEmokSE0i1oQMQQlRJaYGtKWu8HD/IZULwTGMgh8oWdAt3la/DYtbX1qhAqfJSA30ph6N3q9mnlWR3bBmT8nRsW/HR6MWYmUJS93WWe1aWd6FID2JpEhe5rkP4RC4dsKbLb/syTUgwn0ZFweZKUw4RTJeAmOM4jdRz2ci0HakqQ8Q/HprLs5d8yaCR2ZAs9e3dTnua3fn4/CDmbYkuFABFHcL3zWhRx8WaEc8vTRiOEtRzol9Pj9fJwBD+qaMytylMOKDPzhPAr9jRZT9BNmHYa29x5XIiHr0LuPXtaOLwku8nvCELcSiWotMOskrm0IgNILjlssh5N0apunAUArKMqGnSavsZw3NIGa78OUhCgFkeG1OFLRZ9L1Y4IXK59AB0XoA+wOkPhitXHpLerUMe11I/iKGACI0NwlDSDYIHenv0OGQxf7nt+Ky+zRKfcUDg6YWKdY6dcJ0Yn1vHBiV4Fs20d7WtD4p6Cg2xSi7f6NMOvgIaKJl2qsfzem8a6vCLeJGuoxM1s62I2rpMUlugdZtb9H0cNtXwlh+GNpmZHjXSWNzConc5fiWMR1WTg4RHPwHxtU2963ksvqQuVudPPkifmyzPw6baBWuxdMSaE91m1UG1fuCcUkCwPST
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(83380400001)(66476007)(4326008)(36756003)(66946007)(66556008)(38350700002)(38100700002)(316002)(41300700001)(6512007)(26005)(6486002)(6506007)(52116002)(478600001)(86362001)(5660300002)(8936002)(2906002)(8676002)(2616005)(186003)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vvz8aryCFCiVK3pe+OOh+aHTDUK3seGe5hKQqniVbarAS9LlsE0IxHvHz2gZ?=
 =?us-ascii?Q?BoaJQYKInsfk/46X3vGtVnItWbZLiZwD0N6Q8JktzfZMqL9f6AHvWPuze/Gv?=
 =?us-ascii?Q?U3nAEmMMHjx9KlDGlfN4DhOCkCKyPGsaw1z+Hg+T5vk+nBo/hYwBqhhWe6nD?=
 =?us-ascii?Q?cCc+1nsoO8Zv/s2VmsnZBO9+6rcYP+5sE1qdaXzypmnOGw5Bq4tCWJdnRxUU?=
 =?us-ascii?Q?Va40aknC38crMXTKggy3952MSo/qFwePpcRKj0hT6X8hkSNqSpyFqeSy2NyB?=
 =?us-ascii?Q?s36jsmfL6LHkRVXMEfEsYbeRW60wTmUbCSV/N6kBkLSOzgvSinsXcX19OBaO?=
 =?us-ascii?Q?6t47Ts8aOPJ+09xFAS/p4/0QePkyXQvVTrldIsPRpwOBZRe/pAg5Du2GbyNI?=
 =?us-ascii?Q?4jJdXx5m4+/H3rVGYeqrKa5P41UIJ+Bzs1YPzth3b9LfE/Iw7b5kz8H6+EF6?=
 =?us-ascii?Q?R976YYPHMDr84GJl9QdYEwu6ERb2A9YV0nUPT2Bjo+CTLJ9Y35//wEc7Mbc8?=
 =?us-ascii?Q?4tzFu6YIOgcVtFnQMAE4QSkvKBBmSglWmFrTuFtcYUrtM2IcRk8s7e+YndYR?=
 =?us-ascii?Q?h8P8ms0hcxL55f5m4Yn0Wz8zW9mHeNcrTfzwnjJ+LbXY/5C1Zu6sddoWag0o?=
 =?us-ascii?Q?O5D9Xyv/GobV6YEO72iDMf9eMd0qa+Lf5athWSW2t0V3ohWprkab2q0akSpJ?=
 =?us-ascii?Q?C3oNJmdlNS7lCWqEGK7i71kSFKG1qWFTNE/VArgR107pGDEujF/71S6uvtuk?=
 =?us-ascii?Q?9cWRlwAL3LPE7sSZq4X9Pb5UNCNoXvJubNDazKkov7shzuwlIEppNrO52G9T?=
 =?us-ascii?Q?R+u1sQ7Sn/9pXGRIfNnnuT3CjIF/25anuXiTid3FKSJ6IOtfww+JkcFCByCV?=
 =?us-ascii?Q?kIibPU++Ma068iJiOJtKHTyFUKUInRJt0EwJWyI6IYQOWU80dS6l9mgCkP3/?=
 =?us-ascii?Q?r0iplQvX2YnzkzHFX45m/7YCS1kH9faRwErOQ2X78V2CHN3ug/ClEdIvtX62?=
 =?us-ascii?Q?/TX+R/8OhFeHktdt8scvWkDy4ooQkMyTYDEzg/gLgqasOBupArLmlsieGAsP?=
 =?us-ascii?Q?AyKl5pEW8VANYjWNbbfjvI5u1HZDRMGZyj9EW1ZeiQYjpjpRM1V3TsbGn/kU?=
 =?us-ascii?Q?3Plb1ENEyn7W3hCc76OihUGqkgk53NKbBPdsLUoVLxtHPAR3nI+5bu+ozjSc?=
 =?us-ascii?Q?q6f14F8dU35pVYqienF59DoU4g0GkOAsgR0BE/EtDGo/F9j4cTi72lWksUCv?=
 =?us-ascii?Q?LMKppdf9QAPhWwswKpsJh2zpfvqD5LPXNJ15WjZ0mH7Wi7vZnMrycrZh8/Dl?=
 =?us-ascii?Q?0Wg99W0rhtzA0AtYgdFURR6A+1gO97y1Cu42pFhogZhe/mkpGsSL67nN4cZS?=
 =?us-ascii?Q?mIqZFxIJSYcxWB2sDMdOMkrXuU/rPJwusBTKeav5SGmSQx74eLtoD9XZVHR/?=
 =?us-ascii?Q?DC/zGvkGXoO6aP4zD2XfrhqJI+OHM1RQEl0RXs3oZa3kRadbiIPfSN9jPOht?=
 =?us-ascii?Q?XQSP1p2zGrOBj8wSN2ZBoJMQ3H5AmcGKOoTCMuxfdyBHyHRufq+H7GBuI1xG?=
 =?us-ascii?Q?y4pqemI+a6599yVdBYmWlSim0OkNyHWfX6cpRbNx755hJODtLVZxW8zG7WlW?=
 =?us-ascii?Q?GaJzb8qWyClR2t3gDTJS8Kk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f87e51db-3e77-4530-2f10-08db6c6cdc24
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:18:20.9576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 liPfE3tYpDMVl0BxKq/2xbQDjs4bWjA2SAQ1mwOJ1wwMw5cVq4X6ALCE5aemS2ZwsqByj2BmgwNQN3jsIYuwL+2QrLh4OgDFsZmRugKaxR5GD5XS35qG6lFLmv/gcJH7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6276
Message-ID-Hash: I6Q27S6HUMRM4UKCBCJ7VWLDHWNPYIRE
X-Message-ID-Hash: I6Q27S6HUMRM4UKCBCJ7VWLDHWNPYIRE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I6Q27S6HUMRM4UKCBCJ7VWLDHWNPYIRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current soc-core.c has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component). It gets .dai_name, but we need
.of_node too. Therefor user need to arrange.

It will be more useful if it gets both .dai_name and .of_node.
This patch adds snd_soc_{of_}get_dlc() for it, and convert to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  6 +++++
 sound/soc/soc-core.c | 53 +++++++++++++++++++++++++++++++++-----------
 2 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index a7ae8b26737e..943f0a1b2d27 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1309,6 +1309,12 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 		snd_soc_daifmt_parse_clock_provider_as_bitmap(np, prefix))
 
 int snd_soc_get_stream_cpu(struct snd_soc_dai_link *dai_link, int stream);
+int snd_soc_get_dlc(const struct of_phandle_args *args,
+		    struct snd_soc_dai_link_component *dlc);
+int snd_soc_of_get_dlc(struct device_node *of_node,
+		       struct of_phandle_args *args,
+		       struct snd_soc_dai_link_component *dlc,
+		       int index);
 int snd_soc_get_dai_id(struct device_node *ep);
 int snd_soc_get_dai_name(const struct of_phandle_args *args,
 			 const char **dai_name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e8308926bd98..8dba5bb26ffe 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3257,8 +3257,7 @@ int snd_soc_get_dai_id(struct device_node *ep)
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_dai_id);
 
-int snd_soc_get_dai_name(const struct of_phandle_args *args,
-				const char **dai_name)
+int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_component *dlc)
 {
 	struct snd_soc_component *pos;
 	int ret = -EPROBE_DEFER;
@@ -3270,7 +3269,7 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 		if (component_of_node != args->np || !pos->num_dai)
 			continue;
 
-		ret = snd_soc_component_of_xlate_dai_name(pos, args, dai_name);
+		ret = snd_soc_component_of_xlate_dai_name(pos, args, &dlc->dai_name);
 		if (ret == -ENOTSUPP) {
 			struct snd_soc_dai *dai;
 			int id = -1;
@@ -3301,9 +3300,10 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 				id--;
 			}
 
-			*dai_name = dai->driver->name;
-			if (!*dai_name)
-				*dai_name = pos->name;
+			dlc->of_node	= args->np;
+			dlc->dai_name	= dai->driver->name;
+			if (!dlc->dai_name)
+				dlc->dai_name = pos->name;
 		} else if (ret) {
 			/*
 			 * if another error than ENOTSUPP is returned go on and
@@ -3319,22 +3319,49 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 	mutex_unlock(&client_mutex);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_get_dai_name);
+EXPORT_SYMBOL_GPL(snd_soc_get_dlc);
 
-int snd_soc_of_get_dai_name(struct device_node *of_node,
-			    const char **dai_name)
+int snd_soc_of_get_dlc(struct device_node *of_node,
+		       struct of_phandle_args *args,
+		       struct snd_soc_dai_link_component *dlc,
+		       int index)
 {
-	struct of_phandle_args args;
+	struct of_phandle_args __args;
 	int ret;
 
+	if (!args)
+		args = &__args;
+
 	ret = of_parse_phandle_with_args(of_node, "sound-dai",
-					 "#sound-dai-cells", 0, &args);
+					 "#sound-dai-cells", index, args);
 	if (ret)
 		return ret;
 
-	ret = snd_soc_get_dai_name(&args, dai_name);
+	return snd_soc_get_dlc(args, dlc);
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_get_dlc);
+
+int snd_soc_get_dai_name(const struct of_phandle_args *args,
+			 const char **dai_name)
+{
+	struct snd_soc_dai_link_component dlc;
+	int ret = snd_soc_get_dlc(args, &dlc);
 
-	of_node_put(args.np);
+	if (ret == 0)
+		*dai_name = dlc.dai_name;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_get_dai_name);
+
+int snd_soc_of_get_dai_name(struct device_node *of_node,
+			    const char **dai_name)
+{
+	struct snd_soc_dai_link_component dlc;
+	int ret = snd_soc_of_get_dlc(of_node, NULL, &dlc, 0);
+
+	if (ret == 0)
+		*dai_name = dlc.dai_name;
 
 	return ret;
 }
-- 
2.25.1

