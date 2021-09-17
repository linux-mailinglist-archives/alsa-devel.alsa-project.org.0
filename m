Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCA440FA63
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C6C178E;
	Fri, 17 Sep 2021 16:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C6C178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889574;
	bh=KjqpQROH2/sDmpoFzHkWTN4ZZqUqSJ/XOO730YEKItE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EEvG7pWmvWL2F/1+dl29wCZ0zji0P2Cs/d/oG3WcPN4H1llxbL9sdZIjU/XO5/Yvp
	 pAKHzp3K0bJ+9NybLMjI029wHjrjeAQbQ14CDofPpyDoaWu/Nt0j36QuiLpRitigdG
	 JulgOrtpZf9xln3ef2Sq8WjmzFVwZh3XDmb6Vypo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED330F804F2;
	Fri, 17 Sep 2021 16:37:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E131F804F1; Fri, 17 Sep 2021 16:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140047.outbound.protection.outlook.com [40.107.14.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 600CDF8027C
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 600CDF8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="JxFX9mQF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmhfL9Hwk/2ICzdJ8HucnMQHs/GLhtea3hK79+vPrhldw5SChrqPLldKzlBSzBJiZ/3VgLogM3+E9ZglLIIQbJXv0kvn3U6qLR3JMGRMjPEcMYnpuVEiggUOzQ75EWoFliGKntBrNrcVGVIr5y7QBzgIW0bkVTZ0QMLyI2qBoID0/eJp3Fs/5syBYQAFvsJ+XWp7Y41rEG/CqAZRkpRHefenBNPrsyEHf0VTQmOLsdZZUytshnJIlFQMNfHi3BK9Dl8VbLP+2OVWrMY2vWmeeHsuCBuJuT1oTCyybDV+ZYqTPegKB8LOZgv4lraRUSYJguzGjuEJvMdApEq2fNhiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zaXfcH5jjNcDuzON9ZVvNIZqwGSnfla8DyzWvwz/VO4=;
 b=hoNyW+8GhRWaza1Vk91sPb1BEcRMeu4MRsEjNkEl1sA43/y2nZUOLJX3uK8W6W5nCQXIMG4704I7/TVTrqTjISyAd+bJtkXVhnWCGuZcK27Dje0tRLgU0sR8WZuY3vfwlkqTKFtT92nOBZs/loB/Gd32EYUhH/PoU/w58iBC3OjF/EAmOm8OZL6so/DgHaLjkf9qcbAi/Ww1bQrm/fgu48m+W6se6kAEMMoTjfNpYYHizrZv+bvjjwZBlXGqMkE5wOo5Nu3ssYmqtCLoB7HVkFsQ+epkkcCT/xGtEOynD9ouTZRfWRrn17mcCQaLcFL786zSGQrYlvFjfDkn1HAsyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaXfcH5jjNcDuzON9ZVvNIZqwGSnfla8DyzWvwz/VO4=;
 b=JxFX9mQFht0+HQRYSC4gQ5PdWgRHww+IBkJfkFpzlu7KPyajM0X0vIr8ZXejOK/LkvdUM5W2fycPcsL+ABzzxxxYdVREal6g1prX26XtEg+8QRmfrV/lDAcVJjkkZHSm1bWydvqAy0VeU1P58deHlnB++V4I3XFInjCB5I3x/Gg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM8PR04MB7409.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 14:37:20 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:20 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 01/12] ASoC: topology: change the complete op in
 snd_soc_tplg_ops to return int
Date: Fri, 17 Sep 2021 17:36:48 +0300
Message-Id: <20210917143659.401102-2-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
References: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P193CA0022.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::32) To AM0PR04MB5140.eurprd04.prod.outlook.com
 (2603:10a6:208:ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:8372:c747:541d:bbc9)
 by VI1P193CA0022.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:bd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 14:37:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d38e0384-feab-4b75-4ce7-08d979e8a7b1
X-MS-TrafficTypeDiagnostic: AM8PR04MB7409:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR04MB7409355F9FCC51AA5B83B534B8DD9@AM8PR04MB7409.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3RQV+Yd/Ziw44V69kXyESPbtkavIDRRSCKFBRGzpMLOXBy+w5/7caXKjiKT7IqvxzdsxSiQJBJ85bJQlypqvR386/WKhS7iF7m3Uc/jNWr+0pfUYk/FDWHWGSu5TOOnpzEFWrbb0Omr/If9h1w+RQWX4PSJa21znzUiMqhwVBnIrT0wjkdr5f1Z3dGUaS8p1enKM6vRyDGjsu88P1G533BQ55e+HxKDVQGKG3ED6/doXtZ3CMA5PRsmnxl2s/jy3gycLCmFOCMaa3xImhBTCJGNlh5CCPyEpxWxv6d6gDn0SCYGvpyWyhU8AxsnYPP052kgUVEumD1KyF/fZ7DqMIViCOJ3cDDWUrb1IZ+BUHWGjkfEPuJ+MUEOqwRw70ruEv45saNKrqcEOKelaTV8IkEs+UKhdruCsnLQYhH9IE1apKYvsFJvFGM/DAcL5a6M+AySLLEDRBudeZ/pJwsSTYNafiz7PTaGg/XIw1gcKY/FwBzjV1KJw6p5OnoCZmh97WYO5VFrGVUNeEF2q3jOlQSbFM407c8WeO7k10OeTEON1mpV+tzfv/pCHyABAfgwYcaEok2Gvw4j6DmJIa3znBv3VX0SfxAfHZdFepx171du021MLA6k/WnUW5eE12Y4/+ISFfQPA2ZuwjsThrmxCBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(5660300002)(8676002)(2906002)(4326008)(38100700002)(8936002)(66476007)(44832011)(1076003)(6666004)(86362001)(66556008)(6512007)(186003)(478600001)(316002)(6486002)(2616005)(6506007)(52116002)(6916009)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IEKVtXLt8VGBXjODK5tsLwfR1VlnHAgFHEJZTK1kUhQBQDBoHLv+HK22zEPX?=
 =?us-ascii?Q?f/jX9P+6SBDJK0mZJQnYkKWHTerWmrq7jxuLDtGyEx5b/+c3GIMgb5gBVf6f?=
 =?us-ascii?Q?piEPd2cT5nLqyxMNvQ1ao7/CIDeMT3NVlmOAk/NCZ4dUVSyEUFgjIDdouHZ0?=
 =?us-ascii?Q?6S5z2ppz5J5JNuTuDjUBQ8Cxpzhq4oY0SR1dBi92HnBhKdioO3/Fa8NuNzXn?=
 =?us-ascii?Q?SJK+HHMk8CIr4PpTs7cgbMkrFbwJWzZW9q4SR1WSTYPVSFQz2xnQkPY7ki0W?=
 =?us-ascii?Q?l1tlj/rG9K5S/hq5HPDsxxPdRTSVWyqQGC5I1b9OJtp4C2/zYzvOHSg+gc37?=
 =?us-ascii?Q?mai/IeZURkMAyuejZZppWjv0FAev+n7UxXr5+J8PQwnEJDrLJzCP7L3rkhhe?=
 =?us-ascii?Q?qnRWoFPK0KXEvg6t2rMfQ0Y7crvCh/9c+xOiHIfGh9VS6V9zv4xbdVWfSr37?=
 =?us-ascii?Q?1hC3Ku3C0sF1y1pvQwwmeGYueoblh89aiVsEL2IGkQa91xB019TqsyDtXsMm?=
 =?us-ascii?Q?ieFG8KOHeK0/r+BGzS/lIhdHLYegGVGec0VUgfnbs81vlYtGkP1oO3Qt71x8?=
 =?us-ascii?Q?9hZZ012154jveP7SXoSrobXZIpuws2c0oJac+6tiqMc11f/+KYxdkTuC9zeF?=
 =?us-ascii?Q?fXIxTIV9bGfFZM9Ix5aNlurRkqVDbnBFmlBFhScK+v7pNxWNsxGZVhNLSxR1?=
 =?us-ascii?Q?+noC+VPLkn4bnxqRKZX+El4l76UcEiLvjM9Brl9Ix3dZTpvBRRFULVMNRPPX?=
 =?us-ascii?Q?LxD+34umAuQ8VsmN8HyQzA2Q0r/oJzViH8E2PJu18eQskaY/WxXw2k+oXVJ2?=
 =?us-ascii?Q?wj7D7MLbu3+BksjMiGwS6rU/sgkSWANwsqwywUyYbiOuPSI3kwGwtebSQtra?=
 =?us-ascii?Q?wvA2CpmUIsVUNEhAJ/W556tYqxqW5QgpZNt28sZgH2mY5UjvI7Nkr743erCq?=
 =?us-ascii?Q?VkdkTJTuIr+WQDbJ9ED+l+4YU0rVMbXX89wRh3qzhhfWyq/sf7vnnZn1BhY+?=
 =?us-ascii?Q?F+2C0nLdT3c9xyuJ6oY+zBfaHxPGXdqZhSBAOnHBvwruyGeqSkzWmCSRH9VJ?=
 =?us-ascii?Q?/9f+gzGkdHmxtxXWlAh0IE7ECQEQbllwRG9akv5Qhe/NQuh3on5/aS1+lTXS?=
 =?us-ascii?Q?a2AYHbSytzVsG9h5Fz+ZYY2j+PFCbh/oj79Rr0cWDt6NFI1SxowoeBIEe6cC?=
 =?us-ascii?Q?K/I7pqNWWCKWx8qNP7iL2lcucSIPp6sUietlVacV3B6dAq++vSzZC1UZXPXy?=
 =?us-ascii?Q?C/MWssZ/ok6Bqs2cGFIadsqT574T2TvyXE/Gwsu4z12OXB1egsxGfXHkqJ/H?=
 =?us-ascii?Q?v6HNb+/7xRWKCENElALZx6TKX3U1LPxA8soIg2g2MokBsZiEKcC9P6vgx/qV?=
 =?us-ascii?Q?3Bt+G/yHXHQWljzJmqBWU2Z602H1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d38e0384-feab-4b75-4ce7-08d979e8a7b1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:20.4243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ga0f7KMMmpbGH7+l3fnqGoLb/rlBLvc4Cp/WJJzMeVrPwrmFWyfP25Rba0dlqNeXoiDMVQb/q/yvd8O2LRI4mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7409
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@nxp.com
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
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
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

