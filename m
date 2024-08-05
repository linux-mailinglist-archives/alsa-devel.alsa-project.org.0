Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7616947296
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:50:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035AB4D93;
	Mon,  5 Aug 2024 02:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035AB4D93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818965;
	bh=eQhB/6wMjwacnVwEX/cour12gs6QnRl6GHsflHPXrAo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DqZsZ1dUp8ELFWXiKx2UNrM+6TEQGGVjMnYml7pvAM9EdrxywP8h5l7kkjCchbgXs
	 ESVkhle7Qpaz92MQYYTZQex9ou53Zr5Q3UVfrB0mtRvVxhyawi5ld46j+7YrOjStD4
	 9IbPcmNxtIrYvF01cBzl+B3cUQF7Hd8eGyspCyzA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53B28F89989; Mon,  5 Aug 2024 02:39:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B81FEF899BF;
	Mon,  5 Aug 2024 02:39:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5B52F89631; Mon,  5 Aug 2024 02:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69427F806B4
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69427F806B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GoEJ84Oa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9YBAkiOH2uy/CGLPmgKyB+F8lLNf56W9vBdd7z/J8CmKSMuM0zMGQyQ0v+INqLnyAmQTrBJEqkSBiZa7lHTPg91X3Tsi37glZefTIwdlcH4CSeWOWYD1dSiTTm4yjTcKCPM1xibUiEsR/NGo6iFQasUhaLBITF56xMjCFHlNCGgdZ6zI2UYAqASe20r3hjuIJnPpWzP8q2aCv6htJq7FRuBET5sWTteJA7V3UYWsZo0g+nFwPlN5vGV2pzt30Sbo7mcXQO0mKXfI6nD2wTxcxVjkm0Zh6dxzyQ5Laq3OUxdCwmmhLppt1HTkm5VFSh3Y3+dwMARNTpOplevJalF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwcdOztjSz00QX2aKUocDnSSeb//2DkuyFlFOYnZiZk=;
 b=Ntg9WfB2ehd3n3cqGuro+AT9Peh7BURockb1GfQV4nkvU1nZTC16pEucmob2lJFAW3ELTMpqPssNMWclusVMCWikNtOgM+uC2mbpIXAZrGmMo/nU1hItOGq+Voo9AbPGE5nztePNuhhSCAjedwbZyMKUQgv7HFOM4C7ibyz05vLNn+aGflJaBYmLn7uB963M/7O2ueHoPZEKWVNHRP41QFS0Sl/uG0WoHkZ5hAQanX1bjOP69JpWeZSU3jwhoCwdOtr09fNgaZm0XU8iQlyLuduvOjw3lLTDkj5g0xezHg5poj4KgB9u9wHoCfXwPdBRvcI2CVI4XVKHYkWAQaPoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwcdOztjSz00QX2aKUocDnSSeb//2DkuyFlFOYnZiZk=;
 b=GoEJ84OaU33RqOT8/h+H1SvH311X9ox+3UfzKEe7bGP96eC3HBnX/GOdL/quVL3zsW1VhKSoCF6BFf54Oe90KexBheBdvDnLXid4zJ1Z1g4SXVXAVO9EU4cqL1+vvAo3/t5GfT1xs57dL5ZHHIN3HqZlow8bnVlZWqzH2/z28sI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:49 +0000
Message-ID: <87bk27ztuu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 045/113] ASoC: adi: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:38:49 +0000
X-ClientProxiedBy: TYCP286CA0242.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 3484fce0-ddfb-4035-72b5-08dcb4e6f950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dlbtg7tntTFhO2ag3CFKD1Tei6GkTpwXXATKnAo1GD1g2hUmx9hChy5+hO/i?=
 =?us-ascii?Q?MmnihnnQKzXjSW+W0tX8A4DxtA/r3xPwAbIbBhsufUTGALQztMYDyzVVfEDo?=
 =?us-ascii?Q?pFz7kDe4OGrCNgjZml63mm9HTR4xOGpxDT7XQ2JCSiBBsJx5JpzSu8tkB6bD?=
 =?us-ascii?Q?MYZHa8wSsC6vcblGwljdWoskklQfy3We+8NSb9aMb77bO0obNuUF7eArM67C?=
 =?us-ascii?Q?+BFHnFIeU5a/zEDON4TUDiXMkbCFJ8Kx5kL4LveeiwbC+bEe/x3qtm2ro65m?=
 =?us-ascii?Q?jLD5m7/39KXgpKiNBXXdqfI3B2UpatjWrgo3LiPgqaT4k8bWVH7EiIeixtkV?=
 =?us-ascii?Q?bCX+1qgaRkiFeYX08O93eOr40gSeQqsmSgmMg88nVrZSbRCX9WTkQgZNUQhd?=
 =?us-ascii?Q?JN8rfvfrGfhOS/2C9YgowxG4UAQEx/+vXNH88rMB+YKWUttzMfDcEO/dYw3a?=
 =?us-ascii?Q?UpZUEA6J22ceYaQm7/qcfx220PSH6VJT5CPCdGU/UtVRRJORBUDZZ7o9r3Og?=
 =?us-ascii?Q?AaCZ8PGQwO4kUNwXPxoRstkVO5c83l19nTXA7CD39K4jVw6Lxg05zh+XrxMq?=
 =?us-ascii?Q?COODvB6OvQuNnkBVgAPD19mN7pPIjqeInyVuSb7+HGxW2Y8EtQFDcov0QDGM?=
 =?us-ascii?Q?6MrvnSKlyazE8/eXLAaTqRdzD1xXAsnxpkYpVDyGGZGfXbNrS0t1WUnhZVA8?=
 =?us-ascii?Q?vjzkfp0GNoTo6a5NW9GsfLwvTcq5/3bR3C8yzisnJyediXTltm7YQl17I++T?=
 =?us-ascii?Q?06C7qMXo6jtskCi13ULr3u385A6oz2ZnbGwden4ecwK+D3xiQkEvqYaSK9NT?=
 =?us-ascii?Q?a33WE7V4YReaULxQ3ia7K1nfpZ0HRfcmjrm3UqR4YqMoqCRQ340RRvgdF+g2?=
 =?us-ascii?Q?nqDlU+aFKbzv0wpbda9UolZGtbOfHFDHNVVo6lREN/zZ9WgBaXGMg4D6/flS?=
 =?us-ascii?Q?asfLqNRKEzpABeoXez2ve2KDylYAq3+l3Ns6zTPSXYhrQG9cUR7vlI8KuOVX?=
 =?us-ascii?Q?iRIo0x51jHDf9+4106oaOKnVbcdQGs66BzmiLGXtX801CJpIn69y1aaWj/BC?=
 =?us-ascii?Q?+19Wns7kRpA2K+aLCiBhrrOpe4QiSqGhk66ZueKl7ZoWR/sIxAvWrQtdUzfb?=
 =?us-ascii?Q?JfBA9SPuWp/GRUIojP72fUGElEiQVMZ0O477ppef721oLyHKyh2QTMfacfZ7?=
 =?us-ascii?Q?rlNw3I5PIJnhRo2dpDd8GdWB2a9R9Rh/z0yagjUQUxP/11L7/ycFZwYe058R?=
 =?us-ascii?Q?xyPkiSu1kQBDABxoHJkTF7N5k4H1MvoFgXA3UTyRfrIDmYMHt2IwOhxEr3vi?=
 =?us-ascii?Q?uU/1lKw38dECD3KWO5BovmpbnzDIeZ6ou1c87gTTXtF4DQjJfRlHMLoe6Lit?=
 =?us-ascii?Q?M5cZzn3ETCKs0RIeqtWZLI51Ed5e2Ay0f84EkJKeE21cejfaCQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TEeizDqI6UTkgvCWDUp0IoBdDxK0/wzIQexoy+WDklZp8rZqWkwEYNvIfgce?=
 =?us-ascii?Q?T4pl0E0ysC0RgRJ6oWmPzMJJnYGLyIe/ClK18Yo/jtn1MsEGFMMhrRQVeZh8?=
 =?us-ascii?Q?VBjt3RAMqjuWOXXcsB5zyw+Ey9X2wZ1zb4XGS/SNsIkmgBqSOwm53YDWwE5t?=
 =?us-ascii?Q?MtRdUiMiJqn/wEYtGyxwkVhnxIv37cRHzSvkXrthID8IUyde5Z059MN/txF+?=
 =?us-ascii?Q?V/YoROx5f75HZEns2Ebx7TvW4KiuxVmtC/ccjvk0f9jyuV6dvqMqOfgmsCcq?=
 =?us-ascii?Q?nXxwq4nGx60C6t8nS9HGCtykfJpI8LH5L2WuTtU9JUNFSFY5oN8GAqQW+FWk?=
 =?us-ascii?Q?SRP6VJMgbyOd29LbcWQwPbdK8RwqIzlh30hTLuXOtubhY214Ub5kubqLY1J6?=
 =?us-ascii?Q?r0xJMPXpPtq0SozvRjRwMFk/mG1YMVGgf+WsPxh4damdKozq9N+7q8tqMHsF?=
 =?us-ascii?Q?fxLSzwIvFEKrnxI3YhJn0srKGA0I2zWYj1vG40s6FLVTvtUvsMKvhhYmRFl+?=
 =?us-ascii?Q?G1BNk+EouDfl0lQPWlFt1BVmkOmLfjIJEUe8S3EJhQ+LZ2WjPc+nMMqpNEUV?=
 =?us-ascii?Q?+tWGeI4wq0FLslI1FhpAptrNz3ipbpv7mb3Iqg1WJFK474R0mJve7gbu/BtX?=
 =?us-ascii?Q?bg0SInliv/he8I24x8S38eFyVwlalNW/mPDD5aPJHVQupdRqPpJEvdLPl7Lx?=
 =?us-ascii?Q?ADF8+MZY1bC53ooriS/sPNlabSmA4UxW6IYXGgGC6t/8NJJYOr8XtRmooCHO?=
 =?us-ascii?Q?j4K0Nvomu/LtznGkQYs6oIbOMfb8O/9UoTEnWcwriGfKP7TnR0cBh19yKyif?=
 =?us-ascii?Q?Vh6ssxsp5wnAwL/YILhbcKRrhJE3pdA71m27ghRJ57YdY1gZVANt7jzkcvna?=
 =?us-ascii?Q?Nlxx9U++WQT3asCPSQj87G0TY9h71XTpGw3c9tclQMganFGu+MSURdtycDvi?=
 =?us-ascii?Q?YDIzdiyntD4H4M2MQ3zFFy2hihDZTpsRGzF5kk1qXdoARUhyQOf39QsjoaxR?=
 =?us-ascii?Q?yZN3+RZ5P7cohr+ASg6sQhFRAuZrG/ImG6SM7Uzf/5aauG48N9xTVXsDBM8c?=
 =?us-ascii?Q?lZZf4hs3X0Iik93ZzVquLtgHrJEiZ0gmP0RiGvJO5DweXU4NbI0asuPEeabT?=
 =?us-ascii?Q?1lhW3cuP/92Hx191z1xCETimXtKHkDh+Kv02rvxHTLRrWxOlnWHvJ7Lww/ua?=
 =?us-ascii?Q?TDP0DXhlai+XSJ+uAOYnonrTDfpGSPx8p8+968fa2XMaWWL86nL2rcCDS/0j?=
 =?us-ascii?Q?vOdHsSJrDYw6FvTm/AufUX5TyWrgnH8pa1531zjIAv7rctPBJBX/oN4X0H1H?=
 =?us-ascii?Q?9gSXqSEs3prLpXhY3iepT/LfZmfTQJBQzHSGkEMFl08RV3R4Kj50mDJ3+2Zz?=
 =?us-ascii?Q?axi9T2VRuqlDmCBINQQYtWa1c47jzSODgKg7ExoVvfYK8nfRPnEp81QP4iOb?=
 =?us-ascii?Q?NI5C+EIodTjwaGlaaxRkF5uZb9zJ28Y6rAHihNjY0kqnSK5qorzJw70bU/2V?=
 =?us-ascii?Q?VwtVNxieazt2CBSWiCHZNshn8tOsuzNGEQaSdZcoWJm2hfFjzIIXpWYFOOH8?=
 =?us-ascii?Q?Ea2V1cEHB1BAcx1kmBgExgrHone+CX2mONGl8cX5hgLf9rVrODrrl1cUeo0V?=
 =?us-ascii?Q?9ArR+QoIiqQNeSpOjQaybCg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3484fce0-ddfb-4035-72b5-08dcb4e6f950
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:49.8912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZlHNmintQtfmFCJDXhwMTpvF1hAmB8ehMH5hCuu7Eg4yeL5kO6Mpd7454Erx/OxyYWupF5QPDNnT+FF5RhVVjV5HWKNdwnNOLxhMjJN5tQUfKhQUxi/rRWb1OUNvbiCL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: TEA25SN5DJUX6OCDJHV4VW66V5DUCPQW
X-Message-ID-Hash: TEA25SN5DJUX6OCDJHV4VW66V5DUCPQW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TEA25SN5DJUX6OCDJHV4VW66V5DUCPQW/>
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
 sound/soc/adi/axi-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/adi/axi-i2s.c b/sound/soc/adi/axi-i2s.c
index 7b25630757436..7c950a7b71eec 100644
--- a/sound/soc/adi/axi-i2s.c
+++ b/sound/soc/adi/axi-i2s.c
@@ -60,7 +60,7 @@ static int axi_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct axi_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		mask = AXI_I2S_CTRL_RX_EN;
 	else
 		mask = AXI_I2S_CTRL_TX_EN;
@@ -110,7 +110,7 @@ static int axi_i2s_startup(struct snd_pcm_substream *substream,
 	uint32_t mask;
 	int ret;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		mask = AXI_I2S_RESET_RX_FIFO;
 	else
 		mask = AXI_I2S_RESET_TX_FIFO;
-- 
2.43.0

