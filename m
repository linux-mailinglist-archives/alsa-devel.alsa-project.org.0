Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C1E40FA81
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:41:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ED1C1783;
	Fri, 17 Sep 2021 16:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ED1C1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889684;
	bh=s8gAY7HwJZDe1gye1Io82H4m9te7Gf7hHvmui+oKtWU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TVklYgm37e0EKweL9W5xvilNgCbY6Pj+7kOzKliQDS70Cs+CQ6M4JtqM3/wnNhGn5
	 cXR7w7fMgU0M4qH0w+3CQxbED2WDyvwFYNGMeDtuqeCZWvFRCUlguoK1OJwdj4p3BK
	 g1XSwP2wK7Bpntb3n46BwvZZLh9YtAvmogzgpplo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 479B2F8051F;
	Fri, 17 Sep 2021 16:37:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7496DF80508; Fri, 17 Sep 2021 16:37:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25A78F804E2
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25A78F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="K1MktcqQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdwBKRkDM7XYn5Z8DA+BzAUYA2+gbwBY3w3h/DB7WJ9QRAu+9WHiCmpit8uJ4gJS0UXNhnBHd/tXxq4OMrND31TxCL3FBY123gNwdzriVS+JQNs1BkSjjZa8a71s4e0u6J+dFsyxCrtqkGP9eXAS/ER86C23yk+vuo3RMdyb7vLDwnEOq2kLK+FROcaEE7QJBNfmp9pghTkXMAcEc5r1NdE9gQqXpKeROAmqO0UJ29dzKb16hYbBaiBvdwVjKWW1kk01vY3uqBlyRRvE14xPUmX39e57dqfUEnrBmIV4aBc6Wjn5S5sbrKgOgjPzjUsulOufn3mBZ82iXPwCOu8+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=LWD5wI5iOs6NMlLphAnPqTADW6puHMn1kQwbgwbqxHc=;
 b=StriAxr+nDpF8jG3EyUgfLIZBJnFDFkImBVW31LUbS5/e5cdmoYTvyEopHJGMm1XWDhQ9UBod9cE7yT9icbDk+D+sz+aU2o8bASWkxCDqVnyg3kIeVmERm+bkAz75nDf0IS9In6EjmEQGn/rd1REFJ+L68E8OmMbpH2ZROQ8clFDpofkdZHlukW9PmUx3KHUtEQbONCuGn5QHBlfT1/3kzwcmKfyAnc50Q51FTtaxQm80Fpt73lVUwxhSBCbqE03ZScpEwY41ZbpOsFc3HPxaOujLa43f3nfbsK5B17MRjmwZMHE9j8rGvQm9yt6jTMPvNNCjCTFxkbkw1GWSdEV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWD5wI5iOs6NMlLphAnPqTADW6puHMn1kQwbgwbqxHc=;
 b=K1MktcqQWK8/51fIYlFVsm08tDx/k4fp7LBo7feV82wFrAPK6pcgdW+EnzA4gapUwFRWCjfvWR2yNe0aYea5L08FyhsvtKqJH/DSpD3rKeX20xszry0anyUPf8cLGiIeZE4aMeVDor9ZxoSYC0qlwgi0PC7reffFVdlr2cN0qPg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR0402MB3506.eurprd04.prod.outlook.com (2603:10a6:208:17::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 14:37:27 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:27 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 07/12] ASoC: SOF: restore kcontrols for widget during set up
Date: Fri, 17 Sep 2021 17:36:54 +0300
Message-Id: <20210917143659.401102-8-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
References: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P193CA0022.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::32) To AM0PR04MB5140.eurprd04.prod.outlook.com
 (2603:10a6:208:ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:8372:c747:541d:bbc9)
 by VI1P193CA0022.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:bd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 14:37:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99efe8d7-ff42-4972-e514-08d979e8abc0
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3506:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB350698554307E2D96D8E6055B8DD9@AM0PR0402MB3506.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hrFbFoML3pBbjgMUiYvVATrH/mGH9moIRYFrn3l81m6lPNxxoiuqKZZEfzK++kuRoz+TQyfKAb2kOtxQ+echhPGL89JKxR57sLQeOLWJ3crkm11yWFBMWGb2ChK6rEOmy9Rks2WoowznJbI0pTf0CjnEWb77uV3B1M2yu5O1HW5TViiRcvuigm5lTulteAdwit561TCXxJxiF+Nj8pHxZvhwGQuqrkRcwGiBSk2ed0qDGeGo9W+elMGZivqEeDHO5v7jj9JwVq4AgbKFc1KbKm2kKZWV6vyUnYwneOaEf0mrie2UE293UB3YJHyHVXk/P4DD5tjqeIgTdj+MelWXvcGXa6d3W8zppV3s9InfSjb8endZZ42iRSWXLgSKlmA17mcfX8GZAxnW94wBxG4jNlrQJtGzHZMSLFOd3RArOvcCOQHvC8UYa7ery9DtfKRplNV6WGEqkfR68Dz8Ee/4gfrrJhaHnbA2CE+AEbFAIhX4/jr6iNQfzlSgzIhD6goLRLwE23BGxiP74W2F09WjpZhKQRUjp9wYJjMpB7aDLVPn/y/jlSGgNeh0xWBOD9SUhA6gD85hNWmDxa6SD+10e0GPfhqab6htB3OoRPETq/ewqQKE97bNpRnk3DQZDjGxR1zMU7J9mO6rsB07aD477A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(186003)(316002)(54906003)(1076003)(7416002)(66476007)(2906002)(6486002)(5660300002)(38100700002)(2616005)(86362001)(66574015)(83380400001)(44832011)(478600001)(4326008)(52116002)(6506007)(6666004)(8936002)(6512007)(66946007)(6916009)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjU5dENNQnNENDVEM3dteXRFd0pONkROOTdYZFRqcG1NWmxhY1ZST25Qclla?=
 =?utf-8?B?azBYWTN4ZGVvSW9rQ2IrQTlGMmE1ckYzTHcrTGx3bVBabVJyckF2WkFEOFlr?=
 =?utf-8?B?QlBBZkFnZXQ2UjRjaS9GUFdtVGJOUUpaWWN5WnJkcUN1ZDFaVlBnWEh0ODJj?=
 =?utf-8?B?RnBaOW8yQ2RvR1d3WHpReHE1QzdpdloydXNWclowS1ZIOUVzdzFEZ00xdzNW?=
 =?utf-8?B?QU96bW5nSTZqc2dUM25DcmYyNHJDR2prRTlpMFdTbStDdElNRTNJUkdOVU5Q?=
 =?utf-8?B?eDc5dnpxQmNOUk9uK2w2eTdZaDI4Q25RRWZBb1lPNTZ6QjhRWkNjWGdGVDI3?=
 =?utf-8?B?VVVGZExXZ2lkOW90NERZSUlOMHRwMEwxd253dnlJNHBiTHVnbE5DTGxNWDdN?=
 =?utf-8?B?OGJZRFpZUG5FYW1IM1VvcEdiYW1pTlMzc0N5c3dhMXl2QWtQYmpsMlhBYThw?=
 =?utf-8?B?K3hBV3NPdGxmY0hWVkNkR3V3WkowbEpwNVozdW1tNWV2dUNsaGZySzJkMkRP?=
 =?utf-8?B?dUV6OFBRMkM0R1dwd2R2U25JdVI5LzBSbm1TYzhOSytqd0xaNG9mRUZCL01t?=
 =?utf-8?B?Y09HaE5MZis5UWg1RVpZMVpWcW5PcVFjb3lKOUxSTEVGWWJMUjM2elNveWRH?=
 =?utf-8?B?RkFUbzhSQXFSWXYzV29ZZU1oQ0x1b3FJMEsrV0NFMVZnMnNjZWNBZTdkdWRG?=
 =?utf-8?B?ODNFcWVCYW5xVEtFQzM4Y0o1SFNQRWNVUFkxY2RTcVRqTURvYzFOTEVYanlm?=
 =?utf-8?B?bjJpWWhJRENEUUNublM5dTFjLzFmb083aVZtZlFiNDF3US9ET0NIRUwxcndO?=
 =?utf-8?B?RzlqL2s0RndIbmxmWFFhdW5IK1RybXM2bnM3d0VIZVpERUxsZUc4T3FybTRD?=
 =?utf-8?B?bmI2bDRSUW1qUGc2bkV0c01FdVVsUW0vVnZqK3VZMmpMTWtUYkg1c3NsNWJz?=
 =?utf-8?B?KzVzYnJMSXVJdWZLTlUzTEVkV2NYT0FhbUhXR3FtVWJ6SkY0MERUbU5mKzY3?=
 =?utf-8?B?Q2Frd09WYURDbUdNUjVGMXdlZ1JSY2J1YkduQzByU1FyZ1ZIU1hrendXNlFo?=
 =?utf-8?B?M1NlTWpiNHVKaFptNERmckk3Q0lYR3dSdHdneUQ4bVNTK3VjSDNCdUtYUnZw?=
 =?utf-8?B?RHB5ZFpzSzZoaEp6S253NmRmMHViY01DRkdWTXhyQktZWXE2cCtvRzRpVGlM?=
 =?utf-8?B?TWFkaHVidjhBaSs2WmRRekF2L0lUdkljWCs4UjJEWnJhbEYwLzRRUUpLRW05?=
 =?utf-8?B?L29LSDdNOUtsZlNpYWh2Y2Y1OW5ZMnorWXRGdlM4dTlyQ21sOTdiT2JxNE40?=
 =?utf-8?B?MjhGSGhPWXhtL1lwOUVRcEh1SVNES2JMWjg4M1pxQWtiTWxhbGkvT2NMM3gy?=
 =?utf-8?B?UTNzU3hQZDFucnlOYWNQOGtUQ2IwV3hjUk9OZW1US0thTCtmN2pJejRUUnVG?=
 =?utf-8?B?cmFJbVo5K1R6cnNYcjZYV3hyclNzZW5vOEdpcTJub3hCaHFtVXMydlY1aWhi?=
 =?utf-8?B?eHRKd1JKdjNUandaNDFLeVJqa1RIcTNLL0lPbEFUcTRiU3FTbWwwWHExTlE1?=
 =?utf-8?B?aE4vTUczMUVSa3ZFR2pFY1pXTndHNWtRSyt4M1NFdHgvZ3FBMmpKcXFReUZ5?=
 =?utf-8?B?NUxpYkhEWnJabVZMVVdWeDUyVCtCYWlONDltNS9RR3NGNzk5T1NNMUNmRWp4?=
 =?utf-8?B?ZFdEbWdZNk1hdTA0UHc3Mm9sVEtuU3pGQi9EUEFtQ09KZFRyZThBTFRPUmoy?=
 =?utf-8?B?VldaZW9MOTlEbXE1RlE1UDRVazg2OGV0UE1MS1l6RHpIZWw2NytFQklZVlBN?=
 =?utf-8?B?aUVCb0h3VUlKbjVVVEQ0Qy9TbmdSZy85REY5anBMcjdqSzlTRUdta3lvSGtZ?=
 =?utf-8?Q?t46/qIWrAVawU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99efe8d7-ff42-4972-e514-08d979e8abc0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:27.2014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSBqPNRWcEsodilkstbx/6I58uu3yIlbCeXjhBemLIVeNix1gI+O53LWG3bq41q1nkjksrNkOebdieZJZI/qSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3506
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Seppo Ingalsuo <seppo.ingalsuo@intel.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@intel.com>,
 ranjani.sridharan@linux.intel.com,
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

Restore kcontrols for each widget after it has been set up
successfully.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/sof-audio.c | 59 ++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b52a453ae9d7..b27760208a4b 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -64,6 +64,25 @@ static int sof_dai_config_setup(struct snd_sof_dev *sdev, struct snd_sof_dai *da
 	return ret;
 }
 
+static int sof_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	struct snd_sof_control *scontrol;
+	int ret;
+
+	/* set up all controls for the widget */
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
+		if (scontrol->comp_id == swidget->comp_id) {
+			ret = sof_kcontrol_setup(sdev, scontrol);
+			if (ret < 0) {
+				dev_err(sdev->dev, "error: fail to set up kcontrols for widget %s\n",
+					swidget->widget->name);
+				return ret;
+			}
+		}
+
+	return 0;
+}
+
 static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct sof_ipc_pipe_new *pipeline;
@@ -113,10 +132,20 @@ static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swi
 					 &r, sizeof(r));
 		break;
 	}
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to load widget %s\n", swidget->widget->name);
-	else
-		dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
+		return ret;
+	}
+
+	/* restore kcontrols for widget */
+	ret = sof_widget_kcontrol_setup(sdev, swidget);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to restore kcontrols for widget %s\n",
+			swidget->widget->name);
+		return ret;
+	}
+
+	dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
 
 	return ret;
 }
@@ -203,22 +232,6 @@ int sof_set_hw_params_upon_resume(struct device *dev)
 	return snd_sof_dsp_hw_params_upon_resume(sdev);
 }
 
-static int sof_restore_kcontrols(struct device *dev)
-{
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	struct snd_sof_control *scontrol;
-	int ret = 0;
-
-	/* restore kcontrol values */
-	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-		ret = sof_kcontrol_setup(sdev, scontrol);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
 						     int pipeline_id)
 {
@@ -309,13 +322,7 @@ int sof_restore_pipelines(struct device *dev)
 		}
 	}
 
-	/* restore pipeline kcontrols */
-	ret = sof_restore_kcontrols(dev);
-	if (ret < 0)
-		dev_err(dev,
-			"error: restoring kcontrols after resume\n");
-
-	return ret;
+	return 0;
 }
 
 /* This function doesn't free widgets. It only resets the set up status for all routes */
-- 
2.27.0

