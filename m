Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB6440D854
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DD0418BC;
	Thu, 16 Sep 2021 13:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DD0418BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791196;
	bh=eTYh75Ca/iGrss1wJxEMBwswT0B7XbGQFdS1/U7zUww=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGmCORI3iRMC95Wobpe3KikqKrl0HYQ2uh7vVPKESLLu21ygukCBxoDcjeI6C3raC
	 mvx3zngzGaqD0Hsk3KHOuKVlpVmuaSrAXfvOlB74zLfEvB8B/ufyEPv1sgCjlyd0qN
	 N1cDTgHemV6hx6Us54CJWRSsbPxT+Pp3diBTMu8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBADEF804CA;
	Thu, 16 Sep 2021 13:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D94F80506; Thu, 16 Sep 2021 13:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50058.outbound.protection.outlook.com [40.107.5.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 051C4F8032B
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 051C4F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="LFsPTf+s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5GDMwWuP8JDaOCaoJ0PIGLCCMSujfVspdMzdYbCCCbi/HSummpEOFVZVMsTd2AF5n1ZWg0oN4Xa845kXpR0ekd/O8V3yOmaYn7f1sou/5T+ohHtX39luomQMbPxWq74IjRt6VXQ4BDrn1R3E2iihsNAQM2DjH6+8Fpk9DkxumCpWRkO+cLqtFQS3GoQ5TN6j9OotBTUcDM6GMX0du3MOgMJcGBH8zr+ijw+l5urfrULmPmnrisI86roIYMUtGFdkb+GJl/rkKVrAPMgE3DuMo1SmLx7J9QXmZM2DElLiXqulPOTeMbNvY1+8BojVouzS7SY6jrKCu0LQVJZmG1D/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=csW/yYh/r6kn83Zw6ySLSt1MgRqzlApyNL6RclkmXCE=;
 b=EvdclVVOMY3xxRn8zxDiIMj2ZjvzNdIH2B+BHK9kC9W8K2NxtJi8az0rCOQpVrmpZAEZjW2dA5MXhxWUsmsIir6R909wRTlEtuqqqtgTnmCZhGAzHMcoEWVWJ0jB1RE59O1pjzWOXDZ+De50wxFNo0fd6NNAgL/H2FTqwFTUwW78Zs952mmiYRWRUYHNGmurQD4PwgHRayMyxXEhXVJu4ImbaDe4vmejRcotKwE2ayM1H7NSgKvTT7GsEl5kCwi1+1/pCoNzV21WwfOCZ0C8GQ/RSRJQULVFQm17KhCuLSXmu1mpUWTmlT0N/ya740+MMr/s+h7B8//cKqU5OSbY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csW/yYh/r6kn83Zw6ySLSt1MgRqzlApyNL6RclkmXCE=;
 b=LFsPTf+sqRWhF1GYtY+A0GrcAuSpfMHwx4O1ljzxAktVnG9qoZkHPc5Q52xW0mq2gi6GeCw3iGmXDw5SAbsjEI7ai/LMjvn0eTmIjymZ4YaMNHd1wNv9oyYm1gEU4+0SVVKcxG6dj4O/key/sqUct8n4aKx+NWKMjHji1JL31+c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:07 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:07 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 02/12] ASoC: SOF: control: Add access field in struct
 snd_sof_control
Date: Thu, 16 Sep 2021 14:16:36 +0300
Message-Id: <20210916111646.367133-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916111646.367133-1-daniel.baluta@oss.nxp.com>
References: <20210916111646.367133-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:208:1::14) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:b29c:ccfa:a961:8ebd)
 by AM0PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:208:1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 11:17:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9462247e-ba0a-4cb8-56af-08d9790384c4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB49268FB1185DC07D216B0CD0B8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: USDaUA/ZcLB8Bw0EflkB+SPywQm5LnuOsHsk2bciom03p5P1aUImMGdh7RKTQnwmwcPR5Iqz3txi+MjUD0ZvAyP1KNiC+uQzhHW19KWO/7icIEtPiId6o7bKsRW/0Sao8H4VDv2fdC7Fqs5Xh6B9fQKcYXSd4I0soxwcwmDfxth+5Msk+EEjGdThcPivLZ75TenZLnXNSKAjXXZN7Kveo5OiSQ42Qwm+NOJCoUO3WcgdZvzKLjEu4L4FFVGQrAcMdpQCfsBqRykuj/cb6+mEFdGo7buz+RW5Mcstv3AsYPqz1SHd17zuswwVkrCaGLytpXBElaB5wIk7qvBIp7O6EvgG6X0fKqyMgfDjKdayMfSbIzYKoRI8k2TXovi3CflPFnUATxcw6r4j0jdyjpH/+1SJeFq7VsBtZXUvAvtbRjileqLc/FY3J00j7LManqYIQ21Ii4yYfwXOorDhfaYSNy3d2bvgartP3XhCBzejPyRkC/PSvY6R41SPSJtL5d7tAcNOlVBqbp0vDgHBH3urxRlWihx+cE1Rkaemt1tzPoUhCa/fgrsvZ0v4j5YIKAqXA1HehcPakIkXsjeSouBr1o4fk7y/zlkeG6fnK+NV9IQ/Qt/o0whOXRmHlwijt/ViuMMXdNqAP1TZGTf74UtkGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1J5CV7Up3IDIjLP36QAZlgaE37P5wyxkb49aZQiIojde/F+9UptPiuO+iUgX?=
 =?us-ascii?Q?lv0hzqHUfpkxRhzmXWleodckrX9stroTd/IHRU9iqpqW36zShE3YWvFNdwvl?=
 =?us-ascii?Q?9RHrpm2b2GTstuenNw74I+2dsunC9Pjnyy25W9rpZKLL9xJkP4XqwoTSoCdb?=
 =?us-ascii?Q?kimRS5afzgJCed4U/jbYaY6cz6HvJeANfUXrYXoHRf2j90/T2/hhHOCygjNE?=
 =?us-ascii?Q?Vk9kBC2rWKBY/ZJSgl1Yh2gn/t9tVZ3xK0cFMFF5qY0og40M8Nbo2SCCx07n?=
 =?us-ascii?Q?pWwRbaRV5VLkMosO7Z1prtIUUXLlTAjX9CXSyvGFPI+RH6uuwsJAwAHSEq8W?=
 =?us-ascii?Q?o6CMqY4IDypFHO+YyDPs86x8bD5K+n0t02xLXoUPf/3Mahecob2qQeZQk0s0?=
 =?us-ascii?Q?MiX2z1Rq/DHuwf/c9C9PDCtjeLQJuocIFistkrO5CRRMH5/x7YEp4sHsfYqK?=
 =?us-ascii?Q?BbFmB/TrV3c7PFktPtyV38IoPuMafyjeNBXiEAGUrz4kHShq0HlqB4dCjCOM?=
 =?us-ascii?Q?s4S7aebezEEKrioiySwQqOKty2+fH053CJFeVfYVgYxDIlujazl8nWQC388N?=
 =?us-ascii?Q?RjGH8LJ/gDJDebFIC25PEJ1F6tRf3ld7v5WClXVUrQPwBNlqLQdCBH8cffvg?=
 =?us-ascii?Q?+zeI0CzouGZ2Kug3UKrskon7Lwkg/OBBWcnah+TMQKQqztkua5Zppu+uFeUY?=
 =?us-ascii?Q?NkKvAW+vUFaOqcfV9WImoXDPK4sKXwJ1PZp/3XrnOaSxxKX1y0CNRdhbaI6v?=
 =?us-ascii?Q?q5a9sH49zB6Shes8rf2C5Lr5mdBm6/LaEFH2cM5Jrh64K0oNxl/2yaUpZS4j?=
 =?us-ascii?Q?oUYiXxrFMcUubUNgNEq1D/p80QcSmsHuaQxlaUDZWQISA6Xa/KJW3ZqrRpf7?=
 =?us-ascii?Q?9sSYX8QXhYuHDtqNzM8JoEen6/QWHeJdzVF+yjyAtjsaRj6NqHIOg7/doZGk?=
 =?us-ascii?Q?CsSnELf1iUp4Lfbv2Syq1vgkfPW7EYpw7dNkd9nzUO2yJWmvO+wO5upACTsS?=
 =?us-ascii?Q?RTTUVVJABsnyDQr7k5lMSp16RVagj+Wh5DxWChK1WaKtnvWxTnNKfCUlSTw7?=
 =?us-ascii?Q?N/FzNvjsFAeBOfBBjd/m3UjAc7eEy76YEW90PcA3ttC6vsFh0eVyMoie4Ayo?=
 =?us-ascii?Q?fGpItTtpizkFMTJ/Wn6JFtkmcuxWHRwBbT3mffvc2dc4uhNOdPceIGW5PQ2U?=
 =?us-ascii?Q?bDGfZeK1eIimJ8Pp6KZfkdw75b6DrPMQLDHk2fz0ZWxbgwuTiLJnljNC/iRb?=
 =?us-ascii?Q?GtIqnGiiwqB8qLVGZtQF8u0vf1biaglgA2Ptn75hcghbThvNKH4mMyMy59t6?=
 =?us-ascii?Q?6uKVa9ZFK6TBnHi6b5DGGXwsJJ9FIGqib9X3X4IBsIjWFdD1LMBbybdLx0c5?=
 =?us-ascii?Q?V5rR8JKmTBLN6o1IO24QWXF6BZrN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9462247e-ba0a-4cb8-56af-08d9790384c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:07.1067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uysVH6W3g5QWlN9if3xBuTQg1I5Qlto3vDgBgW/YJwEnsrpXf6+TIeA4l+u8OKjZYvb8BW61SnnaMXBcHBZqtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4926
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 peter.ujfalusi@linux.intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a new field to save the access setting for all controls
in struct snd_sof_control. This will be used to ensure that
only widgets belonging to static pipelines have volatile
controls.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-audio.h | 1 +
 sound/soc/sof/topology.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 9a8d005e75a0..78a4a0c90a29 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -66,6 +66,7 @@ struct snd_sof_control {
 	int min_volume_step; /* min volume step for volume_table */
 	int max_volume_step; /* max volume step for volume_table */
 	int num_channels;
+	unsigned int access;
 	u32 readback_offset; /* offset to mmapped data if used */
 	struct sof_ipc_ctrl_data *control_data;
 	u32 size;	/* cdata size */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 96b8791f7cc1..d8f7b1edefc3 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1250,6 +1250,7 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 		return -ENOMEM;
 
 	scontrol->scomp = scomp;
+	scontrol->access = kc->access;
 
 	switch (le32_to_cpu(hdr->ops.info)) {
 	case SND_SOC_TPLG_CTL_VOLSW:
-- 
2.27.0

