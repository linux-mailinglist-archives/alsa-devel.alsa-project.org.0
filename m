Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CCD454415
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:45:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45A541867;
	Wed, 17 Nov 2021 10:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45A541867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142336;
	bh=s27WKQAzY76Gi67Cd9Uo7yOykv1oZbEFy7cbeF4S8B8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ajAOLqkYgUghOTQSYsm7luk7K+dgc9acjmAGHPBWD4/IdgeZP7Jyjt7WfLOzoh+/h
	 uPvWw/ENXi/9JVcNMvJAGgzIB13mwD6jQAOyS9r3eH82vWCeH6ukSdwT/iCWqXtFL2
	 n8n93IZ0GrgArxe1dOgHVYDs+f6TEG2DvJFPbjGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EDA3F805AE;
	Wed, 17 Nov 2021 10:38:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 871EBF8050F; Wed, 17 Nov 2021 10:38:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50CF1F8050F
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50CF1F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="VnUk10km"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIYpnabFTKUcR9MhHt0uUUSjw0TQEwf7/S2qEoLmefcMH2ENNcO5cbMVNIGh/eP30IpC69NUaSJ62dOdMM5mQZ5UVH7ZNKprD42j4D0v5+0fcKAWXkNvJVXPGfUoV8xocAh2sJ0s49N7Zj3hWE+aHaqIb8/vqMg61h3yqusCapXnXcW0QFWZOq9tPc0c/5VOsLyZzaMkHs2SMUQKrzGwAVk4cOzXEhDHA5zZs8bvCYlXDvFRkACrq+Fes8I25Rt/iA0QHSi9kByBVo+9gVWxzoAqgH5rTQ0NlF7p7y+P8tA9EmQz2SjDCAbYP3NlcFu3im4M96etIvzohjBol+7Jwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcbOQalXySIAbgXzXcklFelsLSCQ8XryxySoOXJvAdo=;
 b=JQQH7+Cly9fuqqAJWy6LtW0Mx+ehF1QdAVB9Y0+gYx0MCvCqMsulc1U7jZgd/MI7PPd507kvkxDXQhUg3r0veoyooXiPIJOMBeC1cAdQOpeUAPNJwe+8OYQxarBW6ClZXFrT8TpDoI7SwCkFqvMxsQr7PhZFctXfZy0tLMFr++Bb/cAAUxuBYNf/9EWLRa5uxuNP3Pf7fpBPOWlN+knQrx72Qja6lswacyFa4qfLyyg1CJw13Dk4BcvbBVCLXkHmpADTusHxvT+krjc9gKVGSUfRrOIEN+2GBXOs+5YLBis61+3FStT3hB6+3vNlccmBeILrM+dbr2ltHhQK72ANhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcbOQalXySIAbgXzXcklFelsLSCQ8XryxySoOXJvAdo=;
 b=VnUk10kmBw26d4QlC+fghob3DEysts7Nyo0QshHsFQVLYuXVAXVf+wu13yPUqVmcceXo1rg7Naxuat/yLE2tl1dubgwqcw/pQzZ33WcJ574S46eoCMukmDUVh+VbqZ/+jbO7tgBGuGwUuXR0jzyJQZc5/9idEvzZsFvsjEGnn04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 09:38:34 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:34 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 16/21] ASoC: SOF: topology: Add support for Mediatek AFE DAI
Date: Wed, 17 Nov 2021 11:37:29 +0200
Message-Id: <20211117093734.17407-17-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a94991d6-2914-4e33-f9a3-08d9a9ae0639
X-MS-TrafficTypeDiagnostic: VE1PR04MB6623:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB662338565234ABF55A64727AB89A9@VE1PR04MB6623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: urFpllXah3h1Eb8RGYU7Ua9uMDRPOiE5WEr/Jw1DwOSPhF0qvDZrSQol+ImrhlofAe+PHNeVedOao338+2MQlrWqXPBU38NSOzZ2e8F+rX/D7DWx5ciD8T05g2h4v56ebLxDlSJiPPiD/VNHl5/CO6T87XSXfXz9DDJNKO6FSQNpNjVBNFGYhtslugr4e/a94t87TCC9KSNFjrHUh+t6UjZ4+6IF60ZnGknc/M55vi0AbgoIcwNJv9OcxufunvF1XS+J5S/JCYJjaTUTkipbB467DlopUnCMvzFmh//3ncOHSJ4Yjoa59aare6Srh1MfJDIPhVOoVUaRP99PV+Q5cX13LsZufvmyOIpS4+RsQx8MeCuiGc/OlraqrAy51NpGUKTouA8ECi5+ne/BLW5UX1PCDHHRwAyehzIhElvpm8udbAZ6NJwDa0tM/gK2KfEHQmNb3oEjfY1i7/xGDY4WKo8WmgqTbf53si6Ftrg220OeGEQ7vT+XB4zDybGCDLG+GuUb3FPKpTc3VUlhTDJTunvU5oL4opsMkHV3qMeU4UCMHh1+UwbtIfyEVl8LnOZIdgWZtTGJlUrdRY9XwllZ/P2IP4veE6YecE7bnUdO6wo/yBTeuiXHIXhe+Qi6H6wkv9sv4z9QIkVPoeweEHNhZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(1076003)(52116002)(6506007)(5660300002)(54906003)(8676002)(508600001)(186003)(86362001)(6666004)(2616005)(6512007)(7416002)(44832011)(66556008)(66476007)(4326008)(66946007)(316002)(38100700002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1YrY2tlSU5kOUVKQkY4aVlQVkQyVU5TT2VGckhZMG5oWFhFTzlrZ2puT3ZI?=
 =?utf-8?B?Nm5GU3hlT0dnNnNMWmRqZnhJb3l6SGpDVTBqUnNGZGJzZHBaTGJLTzJmck5n?=
 =?utf-8?B?NWVDZjg5b3dOdG5UMUdTdTVIRnZHUkJBRGRPSFpUVlJiV25hcERqOWtIZUlC?=
 =?utf-8?B?NlZRZ1RXOEFmMGtvSVpRUDlmb0psT0tXNlVyQkRZQ0ZTYnErL3ZmdE91bnAw?=
 =?utf-8?B?NDRJK1Y0N3ltZ3ZoRVZDd0RudHNDdzRHTy8yakhRcWw5c2dtVytJZ0Iremxp?=
 =?utf-8?B?aXNBRHdMV2k1dng3cE54OE9kVFZNbkdjU0FDSHhZa2NRMGZDK0l5UHJuQ1FF?=
 =?utf-8?B?dFovV00wb0lhWit4Y2dxVmUwYzZ3ZGRlK2pwMitrMktsTUovbEUxUnJOVW55?=
 =?utf-8?B?RUdrSE12UG5RTEFRZ2N6dE9ZREJHMnFqQ0lBUFkyVk1RMDBpK08zZnNGekIz?=
 =?utf-8?B?Sm0rM05JTFVHK3d1Z1crSWdEbHB2RjYvcS9kazY0N1ljb0lQSjJhMm9EUmd3?=
 =?utf-8?B?UjVOZjk2QlQxY2E0VTJTYkJmb0c2UitMVkk4VVUxcHdLNHdGUFV5WUp3dVls?=
 =?utf-8?B?Y1NvMFprKzlETjBQL2Y2czVQaDdYdnBlb0xTYStsRyt6Vmd0cHdXRytjY2RO?=
 =?utf-8?B?MnBucno3UEJOMVNOQlVJUW0zRzcyREJIeDREeStBRFJCdlM3bnhEemNmcWpU?=
 =?utf-8?B?RHF2dUhxNFhUZFh0dXg0UTJZK1ZLcmlVaHNVcGpXYncwRjhLMkp0ZXJaWlFL?=
 =?utf-8?B?RjQ3SnRhaFppZmN3bEpDOThzVnZZdTM4V01NU0QzQ1NpTUJCOTVwQkpMZGgx?=
 =?utf-8?B?SDZ1R2x3cmJ2MzM0R01Fdlh4WUV1aWZMeEgxL0p4QmpYWXI4TytEeWhzQ0pR?=
 =?utf-8?B?SEVSRURja0lOYnVjWHE2S0ZGblpBb0tKbmlBUEtzZFhKaGp2aThVaytsUUgv?=
 =?utf-8?B?L090TVFRZGtueFNtT2pYNkJ6UCtEV2l6M0gwVVFhNktYbkhSYXRZU2tZSVZO?=
 =?utf-8?B?YVhuN0UzWnYzM09kczFlUllEdmtxUWY5WVpZaDI0clovTmFKNkJhM0xsWTRU?=
 =?utf-8?B?K2pJbEh3ek93MFRXb0FrcDN5YkN3ejEwV3RXNWYzUytSQm9SMWF2eENROE9h?=
 =?utf-8?B?VG9kb1lvaExsRHpXc2RaQzBFTWJ0YUppaXVaZENRV1ozY3krN3BLdnhJVXVW?=
 =?utf-8?B?ZW10Y01JN0ZxUU9PRTMreU5XR1NnNHpvcTZWNitnQkYxMXI2VVhJTFAxNkhh?=
 =?utf-8?B?TGorT3FHSFVOcHF5dmZFdEtvSElicXYrYWFrNzZrUFZXeldDK2NCUUtZQ1FC?=
 =?utf-8?B?aHJQcWE4M1k1YmtyY1hhRTczNXBQRkZ4TUZJY1RLcUdmWTd4RkpNWFB6MDl4?=
 =?utf-8?B?b0l2T1p4Y0xoSlJiUXFEUTFqRTZVdTBJOEE2dnhlRXdLQ201d3BEU202dWI2?=
 =?utf-8?B?WW1nZElZRkRXL3FQUnJzbHdhNDk0eiswN2dJbGg2V1hpR0lYWDdXMGE2U3Z1?=
 =?utf-8?B?VURseU14a0JvcG4xRmFPeGdPRE9naDNQUURzaTkrVzM1ZGg0SDZvVkNyMG8x?=
 =?utf-8?B?OGVzb3lPYzFsMkIvOXpoZmZpbHhEYVIwdk02MzhmdkV4K2VxY2dMeG1aV2tF?=
 =?utf-8?B?T3dHc2w4TkVFNDRQaUxTdXVLYUtZT1VxS3YwdU5zb25zS1Z0M0IxMVlYUDcv?=
 =?utf-8?B?U053a1Q5cHZrY3JNQVo2WkwxcEh4YU9yaWdlZlVtWjhnUWFpZFRwZWNJVzZQ?=
 =?utf-8?B?YzVTVTVmTXBvWGVxRGw1MU5mRkxVYkxCUFQzTC9CVVFGNytOQ1A2UlNVM29n?=
 =?utf-8?B?UEMxYm8zM1FneXptVEx2UGdqbFMzTW1zZzE1M2VNTUlkZ2czTk94UlNyemhp?=
 =?utf-8?B?NHc1Y2lDVEIxUmZZSjJGbXhPYWhzMm9zeUFsZVJKWGY4a1UxTklsTi9ZblFE?=
 =?utf-8?B?eWQrUVE1TFBxY1BGSFkySkxvM0dxSlRiQkw5QjJ6VE1jdnRHaEQyT1hmOG9N?=
 =?utf-8?B?ZGdOaEsvMWU0ZU84VkdTSytoVHBBZVJkaUNzd212bHJyelNOTUJtRFp1NUpZ?=
 =?utf-8?B?K0VkdWp2dlcxWE1RRU11QUJzc1c0U3cwMHpCVHlqa1lBY3hSN1FIQXlGdmMy?=
 =?utf-8?B?UUdaa3NWd2ppOUVUbDJBZDA1dWdVcGxNcWxMVTlBSFJlc3BpaVZqaDNGbUo3?=
 =?utf-8?B?VGhYSXB2TjV2NGhtaUlIS0czTTF3NmQ4SnpWZW9oRU5JVTQvZy9CZk45a3Nr?=
 =?utf-8?Q?A6D7BBAS6eNahaA4f1IrjEZcOuG87N9OC+I77oJw5s=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a94991d6-2914-4e33-f9a3-08d9a9ae0639
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:34.4741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQx2jjLKHBIVmYXe/MO/vxF+VIYzhyh7eQ6tfFxtUcajLhtT/mxdENogKjcnO6mjRwIJ9/iTQ5QpPNIRB9wyng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com
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

From: YC Hung <yc.hung@mediatek.com>

Add new sof dai and config to pass topology file configuration
to SOF firmware running on Mediatek platform DSP core.
Add mediatek audio front end(AFE) to the list of supported sof_dais

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/sound/sof/dai-mediatek.h | 23 +++++++++++++
 include/sound/sof/dai.h          |  3 ++
 sound/soc/sof/pcm.c              | 12 +++++++
 sound/soc/sof/topology.c         | 59 ++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 include/sound/sof/dai-mediatek.h

diff --git a/include/sound/sof/dai-mediatek.h b/include/sound/sof/dai-mediatek.h
new file mode 100644
index 000000000000..62dd4720558d
--- /dev/null
+++ b/include/sound/sof/dai-mediatek.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * Copyright(c) 2021 Mediatek Corporation. All rights reserved.
+ *
+ * Author: Bo Pan <bo.pan@mediatek.com>
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_DAI_MEDIATEK_H__
+#define __INCLUDE_SOUND_SOF_DAI_MEDIATEK_H__
+
+#include <sound/sof/header.h>
+
+struct sof_ipc_dai_mtk_afe_params {
+	struct sof_ipc_hdr hdr;
+	u32 channels;
+	u32 rate;
+	u32 format;
+	u32 stream_id;
+	u32 reserved[4]; /* reserve for future */
+} __packed;
+
+#endif
+
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 3782127a7095..5132bc60f54b 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -13,6 +13,7 @@
 #include <sound/sof/dai-intel.h>
 #include <sound/sof/dai-imx.h>
 #include <sound/sof/dai-amd.h>
+#include <sound/sof/dai-mediatek.h>
 
 /*
  * DAI Configuration.
@@ -70,6 +71,7 @@ enum sof_ipc_dai_type {
 	SOF_DAI_AMD_BT,			/**< AMD ACP BT*/
 	SOF_DAI_AMD_SP,			/**< AMD ACP SP */
 	SOF_DAI_AMD_DMIC,		/**< AMD ACP DMIC */
+	SOF_DAI_MEDIATEK_AFE,		/**< Mediatek AFE */
 };
 
 /* general purpose DAI configuration */
@@ -97,6 +99,7 @@ struct sof_ipc_dai_config {
 		struct sof_ipc_dai_acp_params acpbt;
 		struct sof_ipc_dai_acp_params acpsp;
 		struct sof_ipc_dai_acp_params acpdmic;
+		struct sof_ipc_dai_mtk_afe_params afe;
 	};
 } __packed;
 
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 8d313c9862cb..31dd79b794f1 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -808,6 +808,18 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 		channels->min = dai->dai_config->esai.tdm_slots;
 		channels->max = dai->dai_config->esai.tdm_slots;
 
+		dev_dbg(component->dev,
+			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev,
+			"channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	case SOF_DAI_MEDIATEK_AFE:
+		rate->min = dai->dai_config->afe.rate;
+		rate->max = dai->dai_config->afe.rate;
+		channels->min = dai->dai_config->afe.channels;
+		channels->max = dai->dai_config->afe.channels;
+
 		dev_dbg(component->dev,
 			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
 		dev_dbg(component->dev,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 72e671c15a34..10caf2b1a33c 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -379,6 +379,7 @@ static const struct sof_dai_types sof_dais[] = {
 	{"ACP", SOF_DAI_AMD_BT},
 	{"ACPSP", SOF_DAI_AMD_SP},
 	{"ACPDMIC", SOF_DAI_AMD_DMIC},
+	{"AFE", SOF_DAI_MEDIATEK_AFE},
 };
 
 static enum sof_ipc_dai_type find_dai(const char *name)
@@ -806,6 +807,19 @@ static const struct sof_topology_token led_tokens[] = {
 	 get_token_u32, offsetof(struct snd_sof_led_control, direction), 0},
 };
 
+/* AFE */
+static const struct sof_topology_token afe_tokens[] = {
+	{SOF_TKN_MEDIATEK_AFE_RATE,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_mtk_afe_params, rate), 0},
+	{SOF_TKN_MEDIATEK_AFE_CH,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_mtk_afe_params, channels), 0},
+	{SOF_TKN_MEDIATEK_AFE_FORMAT,
+		SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_comp_format,
+		offsetof(struct sof_ipc_dai_mtk_afe_params, format), 0},
+};
+
 static int sof_parse_uuid_tokens(struct snd_soc_component *scomp,
 				 void *object,
 				 const struct sof_topology_token *tokens,
@@ -3091,6 +3105,48 @@ static int sof_link_acp_sp_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
+static int sof_link_afe_load(struct snd_soc_component *scomp, int index,
+			     struct snd_soc_dai_link *link,
+			     struct snd_soc_tplg_link_config *cfg,
+			     struct snd_soc_tplg_hw_config *hw_config,
+			     struct sof_ipc_dai_config *config)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_soc_tplg_private *private = &cfg->priv;
+	struct snd_soc_dai *dai;
+	u32 size = sizeof(*config);
+	int ret;
+
+	config->hdr.size = size;
+
+	/* get any bespoke DAI tokens */
+	ret = sof_parse_tokens(scomp, &config->afe, afe_tokens,
+			       ARRAY_SIZE(afe_tokens), private->array,
+			       le32_to_cpu(private->size));
+	if (ret != 0) {
+		dev_err(scomp->dev, "parse afe tokens failed %d\n",
+			le32_to_cpu(private->size));
+		return ret;
+	}
+
+	dev_dbg(scomp->dev, "AFE config rate %d channels %d format:%d\n",
+		config->afe.rate, config->afe.channels, config->afe.format);
+
+	dai = snd_soc_find_dai(link->cpus);
+	if (!dai) {
+		dev_err(scomp->dev, "%s: failed to find dai %s", __func__, link->cpus->dai_name);
+		return -EINVAL;
+	}
+
+	config->afe.stream_id = DMA_CHAN_INVALID;
+
+	ret = sof_set_dai_config(sdev, size, link, config);
+	if (ret < 0)
+		dev_err(scomp->dev, "failed to process afe dai link %s", link->name);
+
+	return ret;
+}
+
 static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 			      struct snd_soc_dai_link *link,
 			      struct snd_soc_tplg_link_config *cfg,
@@ -3386,6 +3442,9 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 		ret = sof_link_acp_dmic_load(scomp, index, link, cfg, hw_config + curr_conf,
 					     config);
 		break;
+	case SOF_DAI_MEDIATEK_AFE:
+		ret = sof_link_afe_load(scomp, index, link, cfg, hw_config + curr_conf, config);
+		break;
 	default:
 		dev_err(scomp->dev, "error: invalid DAI type %d\n", common_config.type);
 		ret = -EINVAL;
-- 
2.27.0

