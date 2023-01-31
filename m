Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 079126821E1
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:06:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87A6DEEE;
	Tue, 31 Jan 2023 03:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87A6DEEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130770;
	bh=7mZWjQ4fp1dg5JNlK8wz9IjlABbmDB4KQ1ag6hWRokQ=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gOioijNh4DG8XxO9kZt2lJrm9tCk/zInp0wjKTDXM+TXLNdCVtsKVf2xPx5XcqM7b
	 je3B2BcHaPm7vnj2+qIX2gX1LKtk8osk7pBaZkv373VPJeL5PnBhXlHSBgAhndCv4W
	 sflcDOjp5DjUk7T0D/2K+eJrluFV484UXEvRJ4cU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F4DF80544;
	Tue, 31 Jan 2023 03:01:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B694AF80544; Tue, 31 Jan 2023 03:01:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B12DF80544
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B12DF80544
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JUevQMQ/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSXkMGc+5HiniOeWVSEM43ky4CNEAsBQUN35Vr7PRvWBiQVqNLGYi+xuoSQb1GSTXvBBlp0YYIVlz7eaoQQ8RImqfYvP4VS56QflThycMe4Yu6cv5GfgtW9hSiofyzr0sza0FHWXHRv8vAoj1GHWK0N7MC3ex5bI093g2Se22snNEnRH1sHwQOBY1VrR1PabpBvel66J3HyxdOwv74sLsma1S8KMLkSCpZuIGXZMXJ6fgiZXr2wXGsw8WkhKHGVhxOu2tPlkJIFkDObJAM7f23T79+PVt4V0Ti23NbDTrazTiEl1hUHMsnv8AiPqYIRAjPk54YLdlx9PV2E6aC288Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfkKzFD7/s4hHgO4XxNiQf2/pTQBB5WEJ8gLM3dsFSw=;
 b=F494xxSiN+fktMgMq0Qhg3ibXepw50VN/UlmpLJXfCmD6tb5aEJXHNCUSOxGMDoIz38PO3zAgBElNtjXMwdwSm3ZB4/glNHiAXRw2r2FTtFVKiBMWL3FLGgGIDlYbCLexa6F/lvo9DV/IhDwJuPelTrqyZzz+7wirWkzMpySC3d0/jn8ZGmlFAzFMDexlNZdTVKj8JkbrW7WTCvWXHIKcv8DSs3EoEBaoMzG7RiAolEx1+mK1NYYSjX4qBB43yGvHq4y07p/KjW/YlthzZyFiVFoQ+DmhaGYGiwwvKPyj23tCF77TlNSSv/QZ2DqV6EUE3184qTuxitahnsrSWSvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfkKzFD7/s4hHgO4XxNiQf2/pTQBB5WEJ8gLM3dsFSw=;
 b=JUevQMQ/50bvJxIyDg+n0AfZFxbG8CJv8w3rxFkRh2o/rrFbEKWO+FILSH4aL0ckjKgcBn+CB8AyqvVw1vxGwvKdjl1n+Rv5xXP7SNWODtIh+WME/1e7vm/8v8Bd8Dfvsrqz8dQFzAQyV+CFO+vuxTByZkQUCn+HyKV4+MbtCfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8592.jpnprd01.prod.outlook.com (2603:1096:400:179::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 02:01:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:01:50 +0000
Message-ID: <87h6w7ea2a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 22/25] ASoC: soc-dai.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:01:49 +0000
X-ClientProxiedBy: TYAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:404:15::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f42af00-3bd8-40bb-08c2-08db032f1dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vivi91yUa17YRPafezfcjjIol8p0wxVO7pK3WqObvTvlynezIL1qzSAuyf4Gva8AIsYSkTyKQNicSq4m6/+405Vo0dxYLzD299Q0dmcGZ/TRWK3FaiYrh+f4z1zDknJhyx9kXdtM/YcGtS1PNslurMPDCqsX0uC/jnm8CZtWB715Wp3BAgdUowXZEqPuT5lwz8pYUSNYwm36fEhB/IsDicYRKcQUhLHrDFmaQ9CLpdAZSvdmdJShFNXQ8KNKqodHP+HWGb4aQim8BWcch827W7A+Rbu9HZPNUSiVOVtIXaThgyPq48YGqgYhzOjAzbrIRyMavrR33l4GEXrcTTJpIXXK/8JBuE3B5LOO48zpIUoGmr9MDb98uNL2n8beXQxJgXFgGkvTaPRKDz9SRdFdgcgvHpetyzSrMYPmecJvdpzU2tPiQ+ESQdzUgnHMRXbpbf4eytyQ/2ScMI91D8HKwWPj3teNSXsHXLvC3sz6vsE9+X/Zb0DRtFrEdzkWwGmmGqOkYN7YUQ0s36tyLNtt7flQACFYqT6RMQRUvkNvvf4keakzu0BdF6f6XJPNXRZKMvEeH6CTUm3hZmO1DFAEPem8Sxq5ccO5G47lDqQO026v9rBDcaV+qbqpma0KbQh+NhaPpwomXVLPgJiLleA7O6kKPZ1M4b/9S/Lgf89UWlnqAaSqbB7H6q2Xf7+BxA948aw9K5rkrBdsaM7mX4QGGWxyFtPULUMnjv6jtPHZzy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199018)(52116002)(6916009)(66556008)(8676002)(66476007)(4326008)(41300700001)(66946007)(8936002)(83380400001)(86362001)(478600001)(316002)(2906002)(38100700002)(6486002)(38350700002)(26005)(6506007)(5660300002)(186003)(6512007)(966005)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LRq8fOuxrlvSvEpGbnIoUMyrjthQgYC/Dq4qcJzzy7idx6JevTIBaTBAseDU?=
 =?us-ascii?Q?lzp7AIwsos9BPPXiluccff/Q2jTWA1Pk3m99H502V5Noa9vb01z8I1d2CQ4U?=
 =?us-ascii?Q?q129lDeXqnUwYsSkLB2cKLbg4Vf9yR4VJurrS/ix+TmWTdqN7Gr3HhkNu9e4?=
 =?us-ascii?Q?nAkIUUcaTzQzunP1ndaIoUlOi9QxLhdHqQXF/iML+1L1n0onFNk7O26OU1P0?=
 =?us-ascii?Q?TXd++ly/PGEt6GrIaPaMiqeOsVbuNiXhmEBgcaa53/vbVmsT1oJZwdy4EnQW?=
 =?us-ascii?Q?6hbPIHOvTg1xLUX/XvpYTytLc8pR79vmASH3i2wejUrj+Ar1o/GqRPvhsC8E?=
 =?us-ascii?Q?DY3QMo2JY0sjfBUWaOaiCu64yxBrXPrb4ewhcw8/6DszY0zFV8LEglH3RQ5O?=
 =?us-ascii?Q?YnSEgAg9+s11TqoT8sThDHmWAt18Vmw7FDHbF0IJaLA4vEFK9fpSCAHkaXqc?=
 =?us-ascii?Q?5FFGY8LG3QeXQf60/xjBDwAoSKGmWGvYM6j0oqN2qDVD8rOBqATrq+4lRym7?=
 =?us-ascii?Q?6o5LF1j1ZWwB4I9XsB7vv7obBKHN3Ftiicli8WenpXPRccXBm0E0USxYdja5?=
 =?us-ascii?Q?zVCYvWtKyplgyiQeZyf3K0jwrziG7HcZNe791nYGmmFHoTBGJplzoi+0h0Bv?=
 =?us-ascii?Q?8BMowJKdcqP75mXJShPvKjAsPKezuUILebWpbheKnRNPol3AMfjaMb6MEDZa?=
 =?us-ascii?Q?YE+/Vc23R5/qkenKzKOCpN8H3XfQZml+SuiMkulPmOmoBpY03YyD2rbx5x4f?=
 =?us-ascii?Q?JUzh6oUuB4jVmu2HROruRPQaKdgjrLGAhQozC7HsryOzpgRyo1RkMGUX83/y?=
 =?us-ascii?Q?06FguMQcjFtDVej3I0mrczvHOmvGi1phPcoNb1mTjW6axAvgHYc8tGwszkyg?=
 =?us-ascii?Q?CKnQ082habSufyQmCJUckyMH+NoGPHWEmOqRflEN0xqTf5omiDd3RjJs25I8?=
 =?us-ascii?Q?I6reweAXUjQ5ckLQlrt8VEJ5rK1dm24J2DAEDWJZrlZFrNzT3cptYUuFe3cq?=
 =?us-ascii?Q?kIoPsCHYP9EBMghofzlRnq6zz5+eqhxZoZgsG0NphLyaACL2vnmDdQk6Wi7A?=
 =?us-ascii?Q?tjcc5Fzw1wZuZ5gY/5pWsxK055iaAjRquWVnunCanxsJ9wKA9niBZVfccp0s?=
 =?us-ascii?Q?i/we+mZcJqdb/TWLIn6OwWr+eP1R6UKOaNxYwWvQkhirePO2/LuxveeGqy+Y?=
 =?us-ascii?Q?mWl5y2Bz4K/6hUD329UJk+KQCxF8K2LE1y7mXeGBC/AlGyzs86sA+bSONxCj?=
 =?us-ascii?Q?wReQ4WQbh9JNtohKA0R+6nhmKZGagcY61gFlQ00rvyk2Jh9BC0RC5vRZtub+?=
 =?us-ascii?Q?oBxp7tJnpiMHnKOQCMAOhIi0LZ9v02PCmeu5D9B7Pwc6JcF0sQ3VUgPdqrTq?=
 =?us-ascii?Q?1oiVXpbqLc14Kfu2nO2MS90DfDVD5UyhIuL6G0yZ8r8HBbCRAh9I/qxnrpq0?=
 =?us-ascii?Q?ud1OZYAlOrbUQs4Jy3WOMlr2tSMyJD6vXSioPl6OUEFj/q0BPuKq8Wziwytx?=
 =?us-ascii?Q?KAOsKsc0v0dFHHOCBULByWFFQHh4qzfwCuvsEXbfiv7ulBJ6B21iB2nxzUCZ?=
 =?us-ascii?Q?fHVtz1cUcQOofKQr3HcweSBY6vAxktY2JcGUNAhnmKjrjWvr0VXtgW9hqPlU?=
 =?us-ascii?Q?IpmqkF/DCi41uWhe5bMKX1w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f42af00-3bd8-40bb-08c2-08db032f1dac
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:01:50.0623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usOV7+J3FCQpPybthE4KNkWhPTCc/7s5JBoUU7uIzdRe5HCRqzg3fc3wyAkkBNDq1tOxYFCmcaeg/Vgg7L0z+Q/JNGxoe8a1EfbCj+QvE4vPbIPjNAaOkVTyGNprNuwd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8592
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Link: https://lore.kernel.org/all/6f047ec5-4055-761d-c1ea-c2d0b606e53a@linux.intel.com/
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 29a75fdf90e0..69f534f0d4bf 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -267,6 +267,11 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 			     int slots, int slot_width)
 {
 	int ret = -ENOTSUPP;
+	int stream;
+	unsigned int *tdm_mask[] = {
+		&tx_mask,
+		&rx_mask,
+	};
 
 	if (dai->driver->ops &&
 	    dai->driver->ops->xlate_tdm_slot_mask)
@@ -275,8 +280,8 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	else
 		snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
 
-	dai->tx_mask = tx_mask;
-	dai->rx_mask = rx_mask;
+	for_each_pcm_streams(stream)
+		snd_soc_dai_tdm_mask_set(dai, stream, *tdm_mask[stream]);
 
 	if (dai->driver->ops &&
 	    dai->driver->ops->set_tdm_slot)
-- 
2.25.1

