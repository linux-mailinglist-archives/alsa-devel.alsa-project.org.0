Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291740D848
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5369E1891;
	Thu, 16 Sep 2021 13:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5369E1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791136;
	bh=x6276OcAilao5zmcu2v3C8YCyELle0sGhB7npKVTCq0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fjaG7cW5MqQ7JqIz31IKqZPOLEXLHdXI7Dqr/xa60lqq6kRux7BIDHab7AyKnN7yl
	 NbN4wV4T2OrYF5FMw/9NZXN9HF/QHKDS4OJd/wgHsv2r7lVeUQhwYjSMTszCVwYySF
	 ctLLzMVo1PLCPY1nFvPCz2vk8dmzgTrPUtCwub1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC474F804E7;
	Thu, 16 Sep 2021 13:17:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41476F804E4; Thu, 16 Sep 2021 13:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50050.outbound.protection.outlook.com [40.107.5.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05C76F80271
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05C76F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="hd6PB/zN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hC9KUFnu9wlFgRH7gfYXOv8ypg6z/oLtFGFavaX94Seb5I4tffGmoZjNy9dVSevYoSeJlFoGZbmTraAUFI/d2ToYOs+iqEFQVC493sPyH2EjTBZWttWNtKYBRunRt9j6rzeCTC1/Se+M/4gg4DM6jdtpCoRyo/xwy0RN1E734JhojWTWRUt1YpLrRBD0VMWmyjudhUucgEf0SGvTFvWNdfGRrzEpqAtQaOsqtmHP0RTHvXIpb0rw7jq6HRQMDJvFk3x3afrFU7NYujofatryCfZA6dMKX720qWWRC5b5PpdtkZ77A1EeQFh62R1vM0twgHCvdMRB1A2nkiZRjhfSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=sONQX65mjIEZ+QiPOFwwnnYmBdbhC1Ic1kXlU3cxiWM=;
 b=CahXxO1978DZOSfZWMbGS2c+SRESFg2xUY3JRMkleM8sMafcp7Zs3wuP7IUJEJjsBhE+J48sQYOh3IaZWAZW4PX/WxVwulHHy54RJ5zBq/YkgXt1hn7TGFE4Tzz52b1j/FJSjrwivKKon7sOHBE5QFz9sAUWMdn7TVzG+TbXCKqA6G2T6/8J7tHNV2hvhow2i4KnBkINg2jj+YSQoQgVeBGeyJDw2CLSneM9fBQEcfhAMo7UyDHgRWSkD7vBuBKVwQ4gmu+LCkE8ZCKCN5rNxf1oJ4P9LYBoMhEF5VyzlIgVQBPxJmM6SiHQKK3Y6sQw0cdnrLW7gtOpsp+vHuX4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sONQX65mjIEZ+QiPOFwwnnYmBdbhC1Ic1kXlU3cxiWM=;
 b=hd6PB/zNyXUA2c9lJp8xA1u+P9X/4FXeEvtCSsXtBWUtJJLJSMc8hRpYN2tQsyOagm+11EuAGC6heuxn4n0X+xf3mT14L/MZQCnZ8CTTJ4emuwsNLELGABCUUJAIqlRXDFBFeD3dAzxtmAYLHmHGO3dK0/VyCbldAOcghX9Py00=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:06 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:05 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 01/12] ASoC: topology: change the complete op in
 snd_soc_tplg_ops to return int
Date: Thu, 16 Sep 2021 14:16:35 +0300
Message-Id: <20210916111646.367133-2-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 16 Sep 2021 11:17:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c19b68e-7be5-4698-bf66-08d979038401
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB49267D8DAEDFCC07EFD0EB87B8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mAywM+ltEo91jmwa+PjliRW9hviLZCuiwiUZvPgGgSE0GMuOwqBKwxU+w9MlkY+P2v0XLAU7jtC6xsC8vHyIrv3qHr+rOxs1FHOgriw+lIwvJzJ7FjoCEeS6egtDUokaBP/OctUlVaXb9hVeYXOSuRafm0BFnhT4UlBsUcT4aUk6HjcRpbCcsWLlyznKI9rrWMq5xSnEjUYEXtIJHsYxDEF4+Jl8134R4OGZ9AJp3jdSMk+gC9vuW19tIKdDfB8A6RzNi2NjyI1PgT47lS/tSK8aIOdrfOQrl1SHwpKmrjCOdVmbuAEjoFd6oIc2YWBSaTJvn0w8Hj8aRyvJDEua0Uzb/kUZ5UoKMhGreALCH2ZkhX21Px81FHkRbjvKH4ThSHVaG1qWi+mErD4ulOHh61+bzU0tX6ZxobUUIxHOfwvJcHzB8f0ZV5THNDssfhnolVMLyuc9BGY52lXicVWCYAs26KSgsLsXyJx7JE8iVytkRyoAnTEoOWUBioVa4QiDedk1PHepgoDSh1SizY/yLkp5IxuGycrqKGWHjtG8oKqNiBqq/gscZS45AeQ0Fm1R6ET+19XwEnBFKIniD0Qh1Ykj+if19ZlmEpb0ptMVBVJREwelQ8k/oJZIEumwHa0JGZ11zyN9erSqM+uymD8n+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SjRm2Ds/9QEMOjaAVQt7ik2yfXzHMkmLmOhBcV5kqMvllh6O6/8t6wXXPbEz?=
 =?us-ascii?Q?cy2/yOOyMgoI2BcgS+8QxXLHKdSgYJ5sCfanhGQr6hIfZVozsKo1PoQH/Isk?=
 =?us-ascii?Q?4BEwuHm0VKbMGzWG0ihf+UtE7u7tUrga2D6y2JQxcZeZrnqJtUmVYaOekt4p?=
 =?us-ascii?Q?Z1JFbiZcoBg9cwwnLZr3SgkxNAg5RDEPu5KVBfAb6TJ4XR46xpWwfFTUd8Bd?=
 =?us-ascii?Q?d0ET7O10s/wBgRCVQWCcoKlIcvtPaVKIsJ9CTFRCQIeYTmLwJ97XHo3shyza?=
 =?us-ascii?Q?vREAVOvC1FxcJrn7ZXZB+17Ym91B4RlaO7yWYJ6plS2WKTE0UgyfK3h+UMJ8?=
 =?us-ascii?Q?MVl3EPoHqonG6vZGHmnF57GYg7mi30/4732toRck6tNhggR5oFehZOzgCikL?=
 =?us-ascii?Q?M2YLH9s1XDGmvliA6Rmdl5JzS9Lll+rcG95f4Vb8RnHq31m8OZpTLCkbkgb6?=
 =?us-ascii?Q?pclxSRawvL2vAG+jSKuu0hfAAQuv6z+hOWGt65sKCSeWiVB/G8sr2++K+HxO?=
 =?us-ascii?Q?dn2kJ73SkUmfcNXrM0FL59yIazrxwTxLhBz+/3yW2ZESP4vOkJTReOuS9khY?=
 =?us-ascii?Q?a8/yOjDWH4ve7tl6AArwcN1Bz6J4OMypM5Wruac6m5AkkerPxQJZVADSW8XW?=
 =?us-ascii?Q?lhQ5jn/E9/ocQ72oaU7+gWu37rC5X/nAvoiF9CZVSHFY9AyGTgeN7gPb6pKw?=
 =?us-ascii?Q?R1f0eWA2t4OGKeYHJRSqyTXNihMRDP5zlO+NqokRE41ir/hJ2zFqe2PbeS4r?=
 =?us-ascii?Q?VSs0u3fmPOv5yhfyKbHG+sovK/3VjVzPPM32wDfarMCwZeDNEa/0vXzoec/u?=
 =?us-ascii?Q?9qqIwDig6YZUGgHiXThQ0lq1+PpIRklioT4bpSbBnfZ+AaBWXDSFaa67dZlF?=
 =?us-ascii?Q?+JTYJyRDpDLiYTb62O4i6Ehvbtbm76NHTvHDzAo9Ux4iXg8IirkbMN10TNvN?=
 =?us-ascii?Q?qb6q2RCbHJH7ih6NQdmBV5To0qhPb4V0YXNXM01OeLwtkV0zkEXFJKsthuC7?=
 =?us-ascii?Q?kI8QF8vm0ZCizu+UZ94JfANmUy1YM95afUIU/RzZ6T6w5NmYIF7VpVnOqbHF?=
 =?us-ascii?Q?95nOzIugdLciBCq7KdjtxGkJz1IAQXn6n3tgqX7YzkDlIe5J/nB6POv3OAyW?=
 =?us-ascii?Q?+ewCkPluOjd7f3AqGmYJDRgLgfkd3qhq+KsRgrc3khryvwP3xh5xshdpeqgQ?=
 =?us-ascii?Q?POuIchGBPWlSDWNIpWzL20EjKP145qogef7le/HyIPplmLGWx6PpFTkKONe0?=
 =?us-ascii?Q?WWLltjetkki5XUniUmXojtItYvbFqUU9ksxioFHrgpDIF4QPxVpmaCvXKIHL?=
 =?us-ascii?Q?B87JPxUR61SrvoL+CQzf6kXema9bfGFvX7lm7ol21XQSgnPwodFB7Elggezx?=
 =?us-ascii?Q?VKQy457GxoHuR2+DOLqK0wJ2nIyj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c19b68e-7be5-4698-bf66-08d979038401
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:05.7924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baU2tlfjI8B2QgXZRakwdgj7C7VrsxgKBvyr1rsU01LG1PChtuk67FwjdtK6H8aOhwq+fxV9eafHZqaSDm19KQ==
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

In the SOF driver, the operations performed in the complete callback
can fail and therefore topology loading should return an error in
such cases. So, change the signature of the complete op
in struct snd_soc_tplg_ops to return an int to return the error.

Also, amend the complete callback functions in the SOF driver and
the SKL driver to conform with the new signature.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/soc-topology.h           |  2 +-
 sound/soc/intel/skylake/skl-topology.c |  6 ++++--
 sound/soc/soc-topology.c               | 10 ++++++----
 sound/soc/sof/topology.c               | 12 ++++++++----
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
index 4afd667e124c..7f33de8ffd95 100644
--- a/include/sound/soc-topology.h
+++ b/include/sound/soc-topology.h
@@ -151,7 +151,7 @@ struct snd_soc_tplg_ops {
 		struct snd_soc_tplg_hdr *);
 
 	/* completion - called at completion of firmware loading */
-	void (*complete)(struct snd_soc_component *);
+	int (*complete)(struct snd_soc_component *comp);
 
 	/* manifest - optional to inform component of manifest */
 	int (*manifest)(struct snd_soc_component *, int index,
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index b036852d6889..89e4231304dd 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3637,7 +3637,7 @@ static int skl_manifest_load(struct snd_soc_component *cmpnt, int index,
 	return 0;
 }
 
-static void skl_tplg_complete(struct snd_soc_component *component)
+static int skl_tplg_complete(struct snd_soc_component *component)
 {
 	struct snd_soc_dobj *dobj;
 	struct snd_soc_acpi_mach *mach;
@@ -3646,7 +3646,7 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 
 	val = kmalloc(sizeof(*val), GFP_KERNEL);
 	if (!val)
-		return;
+		return -ENOMEM;
 
 	mach = dev_get_platdata(component->card->dev);
 	list_for_each_entry(dobj, &component->dobj_list, list) {
@@ -3671,7 +3671,9 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 			}
 		}
 	}
+
 	kfree(val);
+	return 0;
 }
 
 static struct snd_soc_tplg_ops skl_tplg_ops  = {
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 73e1b7b48ce9..88f849b119da 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -78,7 +78,7 @@ struct soc_tplg {
 };
 
 static int soc_tplg_process_headers(struct soc_tplg *tplg);
-static void soc_tplg_complete(struct soc_tplg *tplg);
+static int soc_tplg_complete(struct soc_tplg *tplg);
 
 /* check we dont overflow the data for this control chunk */
 static int soc_tplg_check_elem_count(struct soc_tplg *tplg, size_t elem_size,
@@ -312,10 +312,12 @@ static int soc_tplg_dai_link_load(struct soc_tplg *tplg,
 }
 
 /* tell the component driver that all firmware has been loaded in this request */
-static void soc_tplg_complete(struct soc_tplg *tplg)
+static int soc_tplg_complete(struct soc_tplg *tplg)
 {
 	if (tplg->ops && tplg->ops->complete)
-		tplg->ops->complete(tplg->comp);
+		return tplg->ops->complete(tplg->comp);
+
+	return 0;
 }
 
 /* add a dynamic kcontrol */
@@ -2625,7 +2627,7 @@ static int soc_tplg_load(struct soc_tplg *tplg)
 
 	ret = soc_tplg_process_headers(tplg);
 	if (ret == 0)
-		soc_tplg_complete(tplg);
+		return soc_tplg_complete(tplg);
 
 	return ret;
 }
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index cc9585bfa4e9..96b8791f7cc1 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3567,10 +3567,11 @@ int snd_sof_complete_pipeline(struct device *dev,
 }
 
 /* completion - called at completion of firmware loading */
-static void sof_complete(struct snd_soc_component *scomp)
+static int sof_complete(struct snd_soc_component *scomp)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_sof_widget *swidget;
+	int ret;
 
 	/* some widget types require completion notificattion */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
@@ -3579,8 +3580,11 @@ static void sof_complete(struct snd_soc_component *scomp)
 
 		switch (swidget->id) {
 		case snd_soc_dapm_scheduler:
-			swidget->complete =
-				snd_sof_complete_pipeline(scomp->dev, swidget);
+			ret = snd_sof_complete_pipeline(scomp->dev, swidget);
+			if (ret < 0)
+				return ret;
+
+			swidget->complete = ret;
 			break;
 		default:
 			break;
@@ -3590,7 +3594,7 @@ static void sof_complete(struct snd_soc_component *scomp)
 	 * cache initial values of SOF kcontrols by reading DSP value over
 	 * IPC. It may be overwritten by alsa-mixer after booting up
 	 */
-	snd_sof_cache_kcontrol_val(scomp);
+	return snd_sof_cache_kcontrol_val(scomp);
 }
 
 /* manifest - optional to inform component of manifest */
-- 
2.27.0

