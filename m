Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CC5485BE9
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 23:54:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A1B1A93;
	Wed,  5 Jan 2022 23:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A1B1A93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641423249;
	bh=Kpk9qhTYS2kOpi7at+9nYNz6Y6sM/dbrkCZfSTkKep8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ErwjZxbnko4F6G2VkDOK/4xsK3XqsGzHg/04gx821Dn5F9viprq0zlxWgIRPQKgIu
	 vskUhLv+AOusoyrEg6QPd+SKCOpNRSyCqbN5rwT5VceCOaoJ3FAQmh8b2qo8rog0Z4
	 9HTWJ0ZBEtrCZ3g4+3J0AQXL8a8JmyrKw9P5tzyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EDB8F8028B;
	Wed,  5 Jan 2022 23:52:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D9F7F804FE; Wed,  5 Jan 2022 23:52:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF8E1F80167
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 23:52:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF8E1F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="WEglp9Ld"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205D3T0L019799;
 Wed, 5 Jan 2022 17:52:20 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dc72w9gck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 17:52:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJBvR9/Y+yXz1FnDFC28KcFh2muk9hdUjOElqfR4xR9QFax+/sja9P+1/HeWcsrZ3P+X8ZLrikeX8rtximQlsoqkv9ErHv2lz2/13LHOJ6ThteiwQcY9lfZgRK05VET/iNDuM6i7VStMsAtY96vIq2Ma6hiLGSuodFwDdpgFM6+CzrXRWngDOzL4QBVmsnPkigu0db9N02c0xa8EHm6Sza/Wu+Mh1l4Zp0OAEswAxw3isYwi8zL6lfpQl8x1mjhe3XALIugo6Wbf31h7E+wZ3LWjYXyfarNeEor09YD2bcM9h4GgBvTuUa5WF74PTcNJhev7couXb9uA9IzdweNeyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU7zWpoZzdvDdKP/q77u61lEELmCpJXLbpXqzz7uFwc=;
 b=F8opmxcDAxxJ2Chfhi0cT+jkU32qXZlesBNJmrpj/vgBdf8/nro5zZD1uhAl/bO2jfalOgGSsy+tqd1+FPN0Mso0rPDxYuUl0nEfME5jtWtp0SZoDIWx2E21Pk1IkmjCACDuvNxjeQZ2g5miq0H+S2821mP5kuzZ4QwWnQwp12gIlahmHmMnvLXqZW0G4vqE8X7YxvocF1DJTZv+WOEdzmGwwqmi4MFOGFMrYHEI37NIkvcR8O+eBBbZfQoItMbtiQkxWSR/hpJcgXgkgk4tfV2d5AiJ0fwxmAG36vG6JARfNuQL9/it5Wcq+GpgvScYkB+fDBT2KKSkalSQcQW8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU7zWpoZzdvDdKP/q77u61lEELmCpJXLbpXqzz7uFwc=;
 b=WEglp9LdsoF/bZa/u6IfC4Xq7IsSAAXi0D6pVn5KxLuFRYV1coiFexAxB/Zy+ydXTpsCohqpHk1rgMa/GvAfZEPRYRsHDeECoMY8nuwjjIKBdk5a9QRrYL7MDd+sPEQlOHvuzeQiYEdd7Md01AcJFC6rL5YRYJR1Srg8JgN0kQw=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB5120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 22:52:18 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 22:52:18 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes
 multiple of period bytes
Date: Wed,  5 Jan 2022 16:51:42 -0600
Message-Id: <20220105225146.3517039-2-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105225146.3517039-1-robert.hancock@calian.com>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:610:77::34) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42d4374f-f70b-46b7-0a5c-08d9d09e06ba
X-MS-TrafficTypeDiagnostic: YT2PR01MB5120:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB51207208A84E0DEC9CBFABB2EC4B9@YT2PR01MB5120.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m48YWI8aLCr5Aszn7vyzUdLrE3HDAqmd/YbfSO+ik/5sibg1aHw54k3LEKEWENAYys1mB6Gft2YBFhMGypXLjEQEn4E3q8BcKaBw2CMh5W6qTiOyhRWtoBP4iEWy7l2SX4NOQOZvIfAKyr0eI5jVQWDmHilQ3yzaKOSzMN0p3i4HTMvcXR4E+T9CYgxqPyVKGPZDImxuvZhhxDYan9McM2vRcoes5YTKQeF1fHTnu63yxeceNS5Mw44MPGjBWYwduUkRxWTgXd3D4ws/DQkLdGUl0se3UX3GjOAeFvz/xeA5rlQaE1waq7JLIODQq9RSLoevvNY0BRwTUpKmln75Wwnx59AESs+ZTGyIASE3qds8EmubS+k2Bc0rZs6QuCNYVJjyS54w+o8ij3VwK8pFOtXoqVjC0ynwhyC8uBj+yWXvhfqZwlaLxMvQyx+QqYLfiEZtXUAVrehYjbq+/FrZooM36YiIuwaNkRZhKHJyyYnegAJcmEUdDwEdO69v8ksSHcqh4wbRKdfhhCg+2zC2QAVDrl/+Zh/CcQ91j2TmpkH8UhxvZPU0Rdn0JOvfAHkpwVFf6y2o7/Bx6gVl3ZcNpfmY+OGxI1ipNCIY0RLmc9ZjVbCnbGX9x9BZER0izvdz27k06+Q//9FjNDiwsXMN/dn0FIjyvOq61CTQD1Vj0azyaITLQeyVlVtTp8QboJBsrkt/1aX2Zns4eoKXydOLEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(508600001)(6916009)(2616005)(5660300002)(52116002)(1076003)(36756003)(83380400001)(86362001)(66946007)(66556008)(66476007)(6486002)(54906003)(6512007)(44832011)(38100700002)(38350700002)(6506007)(6666004)(186003)(26005)(316002)(8936002)(8676002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvYJDRT6MyKb89Kh7z0ymTENyHQPy3HOk1DkQg9GVSOp0sX0shquvj9yUylG?=
 =?us-ascii?Q?U49vcU1lb9hfewlM1xBj/O8umu7FaTGhkbUfDQdfFZKp+Qu5jLk+BDjeQZff?=
 =?us-ascii?Q?pLFAlgk+muRbHpxc/6etkIbbkVfwiJJCJ5iT9xPfy+borN4RIKfAIWEmhBfp?=
 =?us-ascii?Q?vJYMk8ljm4sKPh2DjDHjB9pdWvpAmOsdf5HN9p0V5J5CxlBNS4pFNUJR7/5y?=
 =?us-ascii?Q?4qwszBZWcwMMk9cbnyjelBuaRjK7Ms7X3/XsDQbtRXUM4hauJd7/wv55zXwZ?=
 =?us-ascii?Q?p8pq/phU8MOEGaG55tw+uXh6sw7upcXZmjcDBZs/GxfijTXyX7nM8xxUbxfv?=
 =?us-ascii?Q?NkyEkgEUqH8DMqu13ibkdj3CSzHWg1tnj6LbqfVvQrBblCsgoYws5SbfHdJ2?=
 =?us-ascii?Q?UZtjYNt7LFrwtAL308MHDTgKwF4ZcN/shfowNJtPE1VZ1duN24/Dxl5auS2x?=
 =?us-ascii?Q?5z4YaJbBV1jOqjPOREh9Qx/wigyex/kPBzEZRf47CuM8pxxb+OukekvYSBwo?=
 =?us-ascii?Q?xQYOwKZK/akQElJAbdXkN9NB0yT4lfpJAtSBK+TsXlB1PCMuzTBxqgymJQ9v?=
 =?us-ascii?Q?V+dV1Zc6ryq0/KmeWiUmVUUy7UCA4D0+CPViD5Y+rFoj6YgBem7fHWM8tg0y?=
 =?us-ascii?Q?UtvCTRKA97TZLem4gpbK5YZRxb9CknOWpiCOMuxPR+TlbK+mqjtl9ZBzO9yG?=
 =?us-ascii?Q?WWvYCen9O/YHebqXmXTTEU/hrJg/cGlh645glY7dh5BiMEitG3UK8AS1wvW5?=
 =?us-ascii?Q?1NhdMRjaf78Z4lDHdcypl7C/1wmA1dl6pseC6ga63XuMrYp6dQ7wAySlb6qM?=
 =?us-ascii?Q?RPDasuFhWJ9N1GexLrgazBSSyyj0e5U7fAEq9CL3bMnRA1q5lKtWelxiXDuQ?=
 =?us-ascii?Q?sIVYj4X2VJHDc8dJE+VSv0XHHlclFY+CgoemEdv+OqPO1XXnp8Lk+qmh1UIr?=
 =?us-ascii?Q?BPjLQXkZHXcwpiGViVebJaG/CcuBE5xt6GhyFgSem2UnKzq4g3uKyITENz3y?=
 =?us-ascii?Q?I28wtnv/4rBzvSrcCZAmruEm0qnM2Njyu2JVGzzgmv4pBEMgIzSlH9bBEPnt?=
 =?us-ascii?Q?vEYC/wdmHcC/Vr46utCIr3ePhY81IkJNdy/zXGroyj9Adk7nW6Ty9O5Tq1Va?=
 =?us-ascii?Q?Hcb65UU4jzKvEbxhjhwu52QyoDZo+W0OV/VShB5uafxbbmFltq5Q45jt0PGN?=
 =?us-ascii?Q?2Mnn/dUNX3TWDeDUtnkaD0CEA036AP2Uspr6pVk3LmUIsxpj4SqefX4ZQ3V8?=
 =?us-ascii?Q?0j5seS95quMz7QFE1cMlOdk/FrzCynlf8GdGI8Xfgl3a2y+p0QJgehOZ89f1?=
 =?us-ascii?Q?QRKgalPdv98yJDDEN9EFRLHn16vHfvgpGB9c94Ki/2XYW+Kac0DFIHFPkYgC?=
 =?us-ascii?Q?Ey/rN/haDI+Yt+inzHNdyJPcE4wKLgwdYtaUVhFomO1dey9aMPagnAYtrOpN?=
 =?us-ascii?Q?L4o7ZG4nnEzuqHmJThglHdJbJy6xm/Iexk9Udlifr/K1ffJpW6rSrM4yrKTZ?=
 =?us-ascii?Q?5OFhq76q2MlW+sIqtLZINCQEJtUGu8glu9sgt+03U8tf4Wz1BxVd57MmIeDB?=
 =?us-ascii?Q?ppLc3tp25suonmD2ZF4ynxOYENqYmW33nuQRE18pHKUwUuVqnZRA5Vt16tVL?=
 =?us-ascii?Q?CT0/2ShEgkXhqC9HCAjOsxurhjHY9U2gkcCH5xSg+nsTctE0kJOy1ACHWtTH?=
 =?us-ascii?Q?KuJtMk4E26ZjiQAQDRsVyvkQGIg=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d4374f-f70b-46b7-0a5c-08d9d09e06ba
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 22:52:18.7620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VH5c6t4JwxDXBWcigXswfYOI1WTrW03djSbxXKjoi0j/Cc9sgwLQpKhV+mUGM1gNbzdAsQxdmge+nLA4Er25OoJ1OgZGV44KtZctwUUeqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5120
X-Proofpoint-GUID: q1FicpGcwcmv_p-7GxLX32SkOhk5jFb_
X-Proofpoint-ORIG-GUID: q1FicpGcwcmv_p-7GxLX32SkOhk5jFb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201050144
Cc: kuninori.morimoto.gx@renesas.com,
 Devarsh Thakkar <devarsh.thakkar@xilinx.com>, michal.simek@xilinx.com,
 maruthi.srinivas.bayyavarapu@xilinx.com, tiwai@suse.com,
 Robert Hancock <robert.hancock@calian.com>, broonie@kernel.org
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

This patch is based on one in the Xilinx kernel tree, "ASoc: xlnx: Make
buffer bytes multiple of period bytes" by Devarsh Thakkar. The same
issue exists in the mainline version of the driver. The original
patch description is as follows:

"The Xilinx Audio Formatter IP has a constraint on period
bytes to be multiple of 64. This leads to driver changing
the period size to suitable frames such that period bytes
are multiple of 64.

Now since period bytes and period size are updated but not
the buffer bytes, this may make the buffer bytes unaligned
and not multiple of period bytes.

When this happens we hear popping noise as while DMA is being
done the buffer bytes are not enough to complete DMA access
for last period of frame within the application buffer boundary.

To avoid this, align buffer bytes too as multiple of 64, and
set another constraint to always enforce number of periods as
integer. Now since, there is already a rule in alsa core
to enforce Buffer size = Number of Periods * Period Size
this automatically aligns buffer bytes as multiple of period
bytes."

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Cc: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 91afea9d5de6..db22e25cf3f8 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -37,6 +37,7 @@
 #define XLNX_AUD_XFER_COUNT	0x28
 #define XLNX_AUD_CH_STS_START	0x2C
 #define XLNX_BYTES_PER_CH	0x44
+#define XLNX_AUD_ALIGN_BYTES	64
 
 #define AUD_STS_IOC_IRQ_MASK	BIT(31)
 #define AUD_STS_CH_STS_MASK	BIT(29)
@@ -368,12 +369,30 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	snd_soc_set_runtime_hwparams(substream, &xlnx_pcm_hardware);
 	runtime->private_data = stream_data;
 
-	/* Resize the period size divisible by 64 */
+	/* Resize the period bytes as divisible by 64 */
 	err = snd_pcm_hw_constraint_step(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64);
+					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+					 XLNX_AUD_ALIGN_BYTES);
 	if (err) {
 		dev_err(component->dev,
-			"unable to set constraint on period bytes\n");
+			"Unable to set constraint on period bytes\n");
+		return err;
+	}
+	/* Resize the buffer bytes as divisible by 64 */
+	err = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 XLNX_AUD_ALIGN_BYTES);
+	if (err) {
+		dev_err(component->dev,
+			"Unable to set constraint on buffer bytes\n");
+		return err;
+	}
+	/* Set periods as integer multiple */
+	err = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0) {
+		dev_err(component->dev,
+			"Unable to set constraint on periods to be integer\n");
 		return err;
 	}
 
-- 
2.31.1

