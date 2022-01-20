Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D597495064
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 15:39:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DA092EF2;
	Thu, 20 Jan 2022 15:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DA092EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642689581;
	bh=yP7tXJBVa0rwC0JMFSAQMSL7zlcXlvQkKfEcr5S1Jw0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fXrhGJLqx9kzPt6O0qbOHpLZuB35shgCg2CjbR0CW1dKhRH75JWebGS0XS3CKJPG1
	 tzHUbdQDXHEdDs+xyOTAirKN8AWoxGXp9mQadT7F+IPv/vNT1J4o5SBMcFmayV/4L9
	 5XcNIz4SezuCrOFszhDh0IHmep60EnUz7TYdITbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4369FF804AA;
	Thu, 20 Jan 2022 15:38:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2D7BF800F2; Thu, 20 Jan 2022 15:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::60b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8698AF800F2
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 15:38:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8698AF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="kHPFFKV9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlnNjWtks9otblEAX9hnfd8M4sDdokpDVm5JZ4UtiuqgfS7OufkkSYP83G1KVf+Cqssb2Rkbt+56yEyryXnu3mactzG5EFf5m0QOoJ6dTW5PDL3RwA4owFYIGZ32UMuDDq/xdOVtf4MTorFQdt1TUy+5Hl+UojXxlk9aV6YAZT76sEIte2oT+EeuGii8z9IF7e+QBkyI69Uehyp//rNhl7LlabXJTHCRdwWzXPE5bkq7pnZ/fChtauON4BWaVFOLMUOGlDKcim2VjUm5nJTBjBL21lZUtmJVm2Zhz13ALyLHMxahFtMCItZM05smK+RGKsE2LHHetfLL1baY5t1O7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQaPSJdDi/c7ikxWVSunY8RlwC/j4O7iaF/624+FKSM=;
 b=GckOevw4moPGDddDjYi05UWI/ixCFpTgtLa4ag97OBnKotvfy/5DQex8nW/SgKNQnkuEoYDRdHeoebpnBr7zBpxq83Muy2yl7taqUMJpcx/8EyzAljeT7EevNHpBTe5yYJcr4+PDPY63xLC5JVNNnzgJE4y7FogazIyc6InR2hgVIqkzFXxxr7UmlBjF97SOe0oEprxP6eWoyjFofVQKZnZniKB9blKRdEUiwXHkfOm2kc1kDRQL5st/1wY61MABwDlSwAlHW/Ok79PPYgFnFXqY3lxQJ9NbsTT9wPm3oWJ+W0B6EXeCA31tlYKJneSpf7Dx/5b1ex0079soojUHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQaPSJdDi/c7ikxWVSunY8RlwC/j4O7iaF/624+FKSM=;
 b=kHPFFKV92jvL2tewGYnjz2HGXmYday8zAriWp+KrWrhOT5INBMDTMXxvWUA94jq2YLu5RsAk9kC0oZnmjRVMHni3ed3JgkLsxF1mu+6aFfzzIiuj5bhvgfE48sjNjxpuf1mzgjusYc4vQ3w4vAzNwpKuYnttjgtxQUL39E5DHK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by AM6PR04MB4167.eurprd04.prod.outlook.com (2603:10a6:209:4e::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 14:37:55 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::3de6:806c:e71:2a2f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::3de6:806c:e71:2a2f%5]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 14:37:55 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH v3] ASoC: SOF: compr: Add compress ops implementation
Date: Thu, 20 Jan 2022 16:37:41 +0200
Message-Id: <20220120143741.492634-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0031.eurprd03.prod.outlook.com
 (2603:10a6:208:14::44) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8c5a2f6-42fd-4a05-8dca-08d9dc2271fc
X-MS-TrafficTypeDiagnostic: AM6PR04MB4167:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4167C985D9936B1375440532B85A9@AM6PR04MB4167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:374;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dtbfnbcRF579ueWq0hfYm9jP2fyNHEZBRS0lRnD0y0ryFy6cy52k6UmPeOzvYEJ7YNMoR6jlq2/paX7655NfPAHaCq+V2dj1nZ7se/YmVNoulBJgiBI48fv4PHlHoIZu7rwVSJwovTmC91buOgiUiB0odtPWJmUcFo2oKr6EO5GFvjj6vUAWthyPbNR02GPGh9TqLBjVN9s+Osc0nLCIUmZwGJB3ryCNywU9re0yg1aPsm90yccpb4rtrO33kH0vN3dQGkXAfVMV/naBb+9zxpr/fYY+LHdwB3yNuHZnUYP9oAkDyNku8+l45fmiigdHIeOy1wpyBDsuKlbH/qy2WeAXDzgVVeoEVG1PT0ZgkH+j3GAuWNGqCNjEJZV5an3lwlrvBCXjoyyOSxRjnd/5857P7QxNQ4jt33IeKDdne7m8CzHRcdAAWu1xXazHHVc/3cutvtt2hqK0QprkkEhF2khPcd8gypNM3SncVDGCaXA0t4WxjC0Ns23ENobAstuBSIM6E+FDmSHjY/i0bZnPxjBb/JpUegl2J3UOOFpc1vO61D34e8dr7yvZ5bypx7diRnpgdsZ+t1ljuP+Z/ZwxYA4h7Hgwd1vGLU1LeqYsOvZVdak6ByFThIqdwkFpeFPixtSke3MTGN3+q/RxitI2qckdwFLlOCuGD8fOKnjaJhjcX+R5i5ooanQhWE5eE+58TTpmmZKMkjTm4b2TBF6hbn4p6zjJx0wfkf4mhsX7Njc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(2906002)(8936002)(6512007)(86362001)(6506007)(30864003)(38100700002)(1076003)(4326008)(508600001)(186003)(52116002)(6486002)(66476007)(44832011)(2616005)(66946007)(316002)(5660300002)(6666004)(83380400001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXBhVE5kNjI5eXJoaDZsV2FFNng2eCtEUUpGc1FOUTY5MEFKZmVXNmp1VmYz?=
 =?utf-8?B?T0JjOHRBOHNKNE56Rm12b2NOeHVmQ0JvRnBEOFNhaVU2a0NtSkUxM3NBMm5r?=
 =?utf-8?B?ekNDQ1FwRzU4UEtJN05iWUVMRUJQYTFtOW4vN0hhMktoRVZCcFBCUEtWZG4y?=
 =?utf-8?B?OXkxUGtPd2xQSnNmakREbis3ZWl6YkRYd3Z2VTY5UEd5enoyQnN1ZWJJemhM?=
 =?utf-8?B?YVh2TWU4RGh0WmpwVVEwVnFMYUxZam8wV2ZnZVNaQXJXK3FrZHVpQnRSVFBH?=
 =?utf-8?B?dUcyemVxYXg4TmlZWU1FQ05iNUU4OXl1ajVRb3RsR3M1V0xYbk9YR2doN0Vp?=
 =?utf-8?B?TC9wK01sK2JmeEtCajZEU0M4QmJDd05jcmpIMnAzdlJuVFhSYXFrQjdkUkFn?=
 =?utf-8?B?TTdWUzVreldYbVBHK0Z1STZvZjIzV2N5dHFmV3dUSjhEMlBhT0lydTJySlZJ?=
 =?utf-8?B?OTE4NDlYQ1U2aUtIdlJROFpTUmFONjNCcVp4TmthTlJlZDAvc2d0Slh3Q0VX?=
 =?utf-8?B?bXRFN1VLU0tpbksvNVN1UUZOS0NXaXdjKytnRGY0WThlSGdtT1RMd2daaWQz?=
 =?utf-8?B?bnhZUFBRWkFwd1JsSnN4M2xMV0hqQTZvbHlDMTVRNjJuQXNJSktGV2UwM2dD?=
 =?utf-8?B?MWw4aHZad1dBNDluV2lpcFFibW5GZGV6MGtuRDZnM3ZHV2NHMmZTbVZ2KzFw?=
 =?utf-8?B?MDBYQ1R3MXpWa1hYZUNCZElzNzR5d3dnRHQ2MHpnTkY2QlVyQ2hVZHRibTJ4?=
 =?utf-8?B?WStNSXBHS0x3a285ZmRMLyt2OEoxVm9SSlZvWnFVSmZaYjZZd01YbGlaTUFp?=
 =?utf-8?B?WVZ0Zlh4QlJieFg1RFJQZy92YzRHNUI2dVdmRU84WERkWGhhVldGbW5qSDZm?=
 =?utf-8?B?WnNFSHkzYVJzTkhXbHZMS0o2MGp0MmxZU1BvT01nNmxMWWR1Z21keThoSURk?=
 =?utf-8?B?SlZmVzZQOWdnTWUvSHpyb0dTaWdCWHZucUROQjJndlo2Z3BWNHdtbmczazdj?=
 =?utf-8?B?YlJkaERwaEFIOW85V2RZbDkrSUsyNCtRaXhEQXdScUlMbGprTjB4QkMvM2lQ?=
 =?utf-8?B?c0ZOYkJyTjk3dE5lY1lXSUdCa3Jsdzc4NVhTbFdFNzJCR3RVWmhxTDhWZktE?=
 =?utf-8?B?bk5OZXhzNytxWkRGa0FUekt1UXVKY3FHYUhJc1g0WnY0Y0h4a3B3S3hIQTd2?=
 =?utf-8?B?M3hzd3JMZ2xiUU9yZmptYjl2M25abzIzWTNUd01BSitrb2xZWDFVNk14NlU2?=
 =?utf-8?B?VUV6S3BKNUZmTVhiS1I2RUdrM3krVEVDUEhUYkU3NXlwTCtwQlk1SmhCRDQ1?=
 =?utf-8?B?cmdPNGY5WXpHZEZwNitJVHdVckIwU1liYkE5Y01PaFE4S0gwbVV6aUdJS21D?=
 =?utf-8?B?OFlLck9OclVWU2owNXF1Mko2bzF6UlY1K0xIekVqOUJyeVVYakFnRGZDR2Zl?=
 =?utf-8?B?dEw4eExXbSt3K21WQmVZMjF3MjVyQWJVcXRQSUVTM3R6WkduK0U1MkwvWENk?=
 =?utf-8?B?MEYreFNuYjViMnFhRkxDZmROSGIxK0dIV2Jpc3dQOXVDS3V5N2dBUFQ0NTZG?=
 =?utf-8?B?dEhNUWNmaExHSHl3ZDRLME5nd3hpckF3R3NFVFFPM1BxYnJ1M3RIYWdNV254?=
 =?utf-8?B?SzVBME9KcFh5SWJDS05HTS85MFZ5aFk4N215K29LSmF1ZVgxUDZmS1pxY1Rj?=
 =?utf-8?B?NzFtQ09oSDg1WCtuVnorZzRoY1ozYXNMVzQyaUdGOXpjeldIOFBYVHFoMWhP?=
 =?utf-8?B?M2gvc21PTWFwbXRiVjhOT25ZVG5qTzRDN1pPd29TUzluRW1pYVdWYjR6RUp4?=
 =?utf-8?B?Mk9DZjNTVERnNTRLUDdJZGdMcEh6NzU4RFEzeGlNNjJYTm9kSWxNWWljQlhS?=
 =?utf-8?B?cVZkMUdFQjdBZU1ydDlTRnArU3J0ako2ak9ZT291VDVDWnFKeVl3bXI0V3F5?=
 =?utf-8?B?TVdrK3lZZk1qVFdINy84L3U5QVQ0Z2hBdlNGK0dVV0w2bi9NUjh6UkVKQi9M?=
 =?utf-8?B?NHVlb1BBSkNYWmlqN2tlZGdaK3FOMkJiYllUZGFma3YxRTYrMXQzR0JCeW4x?=
 =?utf-8?B?ZFpTT3ZhVTN0Ujd3VVYybEJFR0xqSit2NWtPbDl1WmFwZjl3MVJENEVaOUtr?=
 =?utf-8?B?UExPcG1WbHFVbUxyTjBKY05yNUxjZmJqZURxVVorWnVQTE1SOGZ6ODkrV3J6?=
 =?utf-8?B?bGtWNEYyYWRyQzF5RVM1UGZnSXVOMllzTHdHZW1EUmJESS9JTDNxcW14TEtM?=
 =?utf-8?Q?1oW5ayqr7TOKR4aB6OMAHvQFrVLdpfgXgdYPfOwkJg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c5a2f6-42fd-4a05-8dca-08d9dc2271fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:37:55.2419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8joJXq4tkIhbOkOMlNqAwJVgIhfq5DPU3vOhYZk3fy/zQ4324AJzAtQqxLVfrzAw2rsbtRf9B9dZX4DJNV6mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4167
Cc: paul.olaru@nxp.com, cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@nxp.com, linux-kernel@vger.kernel.org
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

From: Daniel Baluta <daniel.baluta@nxp.com>

Implement snd_compress_ops. There are a lot of similarities with
PCM implementation.

For now we use sof_ipc_pcm_params to transfer compress parameters to SOF
firmware.

This will be changed in the future once we either add new compress
parameters to SOF or enhance existing sof_ipc_pcm_params structure
to support all native compress params.

Note that get_caps and get_codec_caps are missing and will be added
later. This is because we need to find a way to advertise DSP
capabilities depending on supported platforms.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v2:
- dropped patch 2/2 because deciding on how to support get_caps and get_codec_caps needs
some rework.
- annotated commit message for 1/2 to mention about get_caps and get_codec_caps

Changes since v1:
(https://lore.kernel.org/lkml/20220113161341.371345-1-daniel.baluta@oss.nxp.com/T/)

- Addressed review from Cezary and Pierre
- fixed layout of declaration blocks to be more consistent
- avoid using rtd and runtime simultaneously inside a function (always
  used rtd and crtd)
- check return code for create_page_table
- completely remove sof_compr_stream and use snd_compr_tstmap instead to
  keep compress stream related info.·
- add get_caps and get_codec_caps implementations (in patch 2)·

 sound/soc/sof/compress.c | 273 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 271 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 01ca85f0b87f..91a9c95929cd 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -10,6 +10,22 @@
 #include "sof-audio.h"
 #include "sof-priv.h"
 
+static void sof_set_transferred_bytes(struct snd_compr_tstamp *tstamp,
+				      u64 host_pos, u64 buffer_size)
+{
+	u64 prev_pos;
+	unsigned int copied;
+
+	div64_u64_rem(tstamp->copied_total, buffer_size, &prev_pos);
+
+	if (host_pos < prev_pos)
+		copied = (buffer_size - prev_pos) + host_pos;
+	else
+		copied = host_pos - prev_pos;
+
+	tstamp->copied_total += copied;
+}
+
 static void snd_sof_compr_fragment_elapsed_work(struct work_struct *work)
 {
 	struct snd_sof_pcm_stream *sps =
@@ -29,14 +45,16 @@ void snd_sof_compr_init_elapsed_work(struct work_struct *work)
  */
 void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
 {
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_compr_runtime *crtd = cstream->runtime;
 	struct snd_soc_component *component;
-	struct snd_soc_pcm_runtime *rtd;
+	struct snd_compr_tstamp *tstamp;
 	struct snd_sof_pcm *spcm;
 
 	if (!cstream)
 		return;
 
-	rtd = cstream->private_data;
+	tstamp = crtd->private_data;
 	component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 
 	spcm = snd_sof_find_spcm_dai(component, rtd);
@@ -46,6 +64,257 @@ void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
 		return;
 	}
 
+	sof_set_transferred_bytes(tstamp, spcm->stream[cstream->direction].posn.host_posn,
+				  crtd->buffer_size);
+
 	/* use the same workqueue-based solution as for PCM, cf. snd_sof_pcm_elapsed */
 	schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
 }
+
+static int create_page_table(struct snd_soc_component *component,
+			     struct snd_compr_stream *cstream,
+			     unsigned char *dma_area, size_t size)
+{
+	struct snd_dma_buffer *dmab = cstream->runtime->dma_buffer_p;
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	int dir = cstream->direction;
+	struct snd_sof_pcm *spcm;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	return snd_sof_create_page_table(component->dev, dmab,
+					 spcm->stream[dir].page_table.area, size);
+}
+
+int sof_compr_open(struct snd_soc_component *component,
+		   struct snd_compr_stream *cstream)
+{
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_compr_runtime *crtd = cstream->runtime;
+	struct snd_compr_tstamp *tstamp;
+	struct snd_sof_pcm *spcm;
+	int dir;
+
+	tstamp = kzalloc(sizeof(*tstamp), GFP_KERNEL);
+	if (!tstamp)
+		return -ENOMEM;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm) {
+		kfree(tstamp);
+		return -EINVAL;
+	}
+
+	dir = cstream->direction;
+
+	if (spcm->stream[dir].cstream) {
+		kfree(tstamp);
+		return -EBUSY;
+	}
+
+	spcm->stream[dir].cstream = cstream;
+	spcm->stream[dir].posn.host_posn = 0;
+	spcm->stream[dir].posn.dai_posn = 0;
+	spcm->prepared[dir] = false;
+
+	crtd->private_data = tstamp;
+
+	return 0;
+}
+
+int sof_compr_free(struct snd_soc_component *component,
+		   struct snd_compr_stream *cstream)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_compr_tstamp *tstamp = cstream->runtime->private_data;
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct sof_ipc_stream stream;
+	struct sof_ipc_reply reply;
+	struct snd_sof_pcm *spcm;
+	int ret = 0;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	stream.hdr.size = sizeof(stream);
+	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
+	stream.comp_id = spcm->stream[cstream->direction].comp_id;
+
+	if (spcm->prepared[cstream->direction]) {
+		ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd,
+					 &stream, sizeof(stream),
+					 &reply, sizeof(reply));
+		if (!ret)
+			spcm->prepared[cstream->direction] = false;
+	}
+
+	cancel_work_sync(&spcm->stream[cstream->direction].period_elapsed_work);
+	spcm->stream[cstream->direction].cstream = NULL;
+	kfree(tstamp);
+
+	return ret;
+}
+
+int sof_compr_set_params(struct snd_soc_component *component,
+			 struct snd_compr_stream *cstream, struct snd_compr_params *params)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_compr_runtime *crtd = cstream->runtime;
+	struct sof_ipc_pcm_params_reply ipc_params_reply;
+	struct snd_compr_tstamp *tstamp;
+	struct sof_ipc_pcm_params pcm;
+	struct snd_sof_pcm *spcm;
+	int ret;
+
+	tstamp = crtd->private_data;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+
+	if (!spcm)
+		return -EINVAL;
+
+	cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
+	cstream->dma_buffer.dev.dev = sdev->dev;
+	ret = snd_compr_malloc_pages(cstream, crtd->buffer_size);
+	if (ret < 0)
+		return ret;
+
+	ret = create_page_table(component, cstream, crtd->dma_area, crtd->dma_bytes);
+	if (ret < 0)
+		return ret;
+
+	memset(&pcm, 0, sizeof(pcm));
+
+	pcm.params.buffer.pages = PFN_UP(crtd->dma_bytes);
+	pcm.hdr.size = sizeof(pcm);
+	pcm.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_PARAMS;
+
+	pcm.comp_id = spcm->stream[cstream->direction].comp_id;
+	pcm.params.hdr.size = sizeof(pcm.params);
+	pcm.params.buffer.phy_addr = spcm->stream[cstream->direction].page_table.addr;
+	pcm.params.buffer.size = crtd->dma_bytes;
+	pcm.params.direction = cstream->direction;
+	pcm.params.channels = params->codec.ch_out;
+	pcm.params.rate = params->codec.sample_rate;
+	pcm.params.buffer_fmt = SOF_IPC_BUFFER_INTERLEAVED;
+	pcm.params.frame_fmt = SOF_IPC_FRAME_S32_LE;
+	pcm.params.sample_container_bytes =
+		snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S32) >> 3;
+	pcm.params.host_period_bytes = params->buffer.fragment_size;
+
+	ret = sof_ipc_tx_message(sdev->ipc, pcm.hdr.cmd, &pcm, sizeof(pcm),
+				 &ipc_params_reply, sizeof(ipc_params_reply));
+	if (ret < 0) {
+		dev_err(component->dev, "error ipc failed\n");
+		return ret;
+	}
+
+	tstamp->byte_offset = sdev->stream_box.offset + ipc_params_reply.posn_offset;
+	tstamp->sampling_rate = params->codec.sample_rate;
+
+	spcm->prepared[cstream->direction] = true;
+
+	return 0;
+}
+
+int sof_compr_get_params(struct snd_soc_component *component,
+			 struct snd_compr_stream *cstream, struct snd_codec *params)
+{
+	/* TODO: we don't query the supported codecs for now, if the
+	 * application asks for an unsupported codec the set_params() will fail.
+	 */
+	return 0;
+}
+
+int sof_compr_trigger(struct snd_soc_component *component,
+		      struct snd_compr_stream *cstream, int cmd)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct sof_ipc_stream stream;
+	struct sof_ipc_reply reply;
+	struct snd_sof_pcm *spcm;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	stream.hdr.size = sizeof(stream);
+	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG;
+	stream.comp_id = spcm->stream[cstream->direction].comp_id;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_START;
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_PAUSE;
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_RELEASE;
+		break;
+	default:
+		dev_err(component->dev, "error: unhandled trigger cmd %d\n", cmd);
+		break;
+	}
+
+	return sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd,
+				  &stream, sizeof(stream),
+				  &reply, sizeof(reply));
+}
+
+int sof_compr_copy(struct snd_soc_component *component,
+		   struct snd_compr_stream *cstream,
+		   char __user *buf, size_t count)
+{
+	struct snd_compr_runtime *rtd = cstream->runtime;
+	unsigned int offset, n;
+	void *ptr;
+	int ret;
+
+	if (count > rtd->buffer_size)
+		count = rtd->buffer_size;
+
+	div_u64_rem(rtd->total_bytes_available, rtd->buffer_size, &offset);
+	ptr = rtd->dma_area + offset;
+	n = rtd->buffer_size - offset;
+
+	if (count < n) {
+		ret = copy_from_user(ptr, buf, count);
+	} else {
+		ret = copy_from_user(ptr, buf, n);
+		ret += copy_from_user(rtd->dma_area, buf + n, count - n);
+	}
+
+	return count - ret;
+}
+
+static int sof_compr_pointer(struct snd_soc_component *component,
+			     struct snd_compr_stream *cstream,
+			     struct snd_compr_tstamp *tstamp)
+{
+	struct snd_compr_tstamp *pstamp = cstream->runtime->private_data;
+
+	tstamp->sampling_rate = pstamp->sampling_rate;
+	tstamp->copied_total = pstamp->copied_total;
+
+	return 0;
+}
+
+struct snd_compress_ops sof_compressed_ops = {
+	.open		= sof_compr_open,
+	.free		= sof_compr_free,
+	.set_params	= sof_compr_set_params,
+	.get_params	= sof_compr_get_params,
+	.trigger	= sof_compr_trigger,
+	.pointer	= sof_compr_pointer,
+	.copy		= sof_compr_copy,
+};
+EXPORT_SYMBOL(sof_compressed_ops);
-- 
2.27.0

