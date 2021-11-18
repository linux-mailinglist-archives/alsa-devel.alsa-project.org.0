Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B17214558AB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 11:10:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E12718AD;
	Thu, 18 Nov 2021 11:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E12718AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637230231;
	bh=n46SpkoqjGTyC9qvu/jXeUwAMeZ+dak52xc6LV7soec=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yfa+fA/Eo12YE0EZv0Ew9XrZgVXnm8d2XnMaOdizIDHH7RIVO8+wP9e3W7v6zbXz/
	 rI7Ar8ZQbjOoHx3E4cn44tlZeWVA+6ChcePXX44aZg6mcebaVAqnxiixmSoCoMeyMU
	 xx/y90j470/zFX0/nSQQos3+yQcZtzNXrrHyjnNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E73CDF804D6;
	Thu, 18 Nov 2021 11:08:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B45EF804FF; Thu, 18 Nov 2021 11:08:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AECCF8026D
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 11:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AECCF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="hJryKLPe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+cEOq8DznssYAFhioeGDWDr/AzR0C8ja+iqOY0NS6mj9U+BrOY0da6Fa5leaYgHSAlWtOsYxlBPaMHMT+eocRrl0XDEarCJv9tJjtEw+VR7lVvGZ1IVFeJVO5xcd88T3/3vD4opRhWLyG9HOiV8f4Ldom0sh1J1aGcM3l+1Qm8Z2iDXXPfK9QmHU7OOqqIMHp7/Hb4baO3cEA2bJlg7qbpYSbrPsywHTg/qNJXPLtT1urIBgyne3aYeEkj60rYMP/Asvu4UIokd/V0/5ayuPLza/sxO/2V3vjw23aEBCqOMyC0lwDJZZFuR5Jv2Dlgk/hCFUbiRTClilZmpubCO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/TcaXutvCfzOqQoZbUtGznDhLVWnllTNgKTJn+BGJg=;
 b=b6hgKOcg97CtyqlN57HtBkESq3iFCH8QQ4cjDB+E9XY/fONuqmNm+xrTt5iAnn0zrsKJ/hZ+Vzecjs+wKqW9ktoN/f9ICK9dwIPH8ww6lZ83wlz1pNfMK4AGzxZXf8n7PSbdrnNbKUHss0C5MJlv6I2ElPF8KocMRqMOsbMmei/8ZyLh2is5TqA2Dev2H02s8Uf/2BZARJMaeKyEkyp6LQrEDQb0EEMglMbjmOYLbE1YNjsbkiBQWUYK+qi7dhV6jLz+OFRwq2uvD1M+ipbWFWx7Mx4ZJxk+vinYVJGN1VLaeV4uTAI2FDpLH3FlARj/vMkjFrYe7OFKmdPQDSXrqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/TcaXutvCfzOqQoZbUtGznDhLVWnllTNgKTJn+BGJg=;
 b=hJryKLPeBm2/vvtqCvXYyPJ5GRf/4i0dBJE1RlZPQl5vhn8Dhi0xvUD10S+JdC8Sg8x/KsCz/bph6U+pj6Zy1hCqVhLc86k9m95bVQRq5NVVEfJj0dryYRZXGcAO0Td17/G9kn8jf3SswDKTNHLlD6U3JJOjS1FMM71ki8c7UGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2429.eurprd04.prod.outlook.com (2603:10a6:800:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 10:08:11 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:11 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 2/8] ASoC: SOF: tokens: add token for Mediatek AFE
Date: Thu, 18 Nov 2021 12:07:43 +0200
Message-Id: <20211118100749.54628-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:863d:d4f3:969f:6fa)
 by AM4PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:200:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 10:08:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd8090af-0a46-48df-afbc-08d9aa7b53c1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2429:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2429513960DE9E3A5C14FCF0B89B9@VI1PR0401MB2429.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5lX5Ki7YIKPVgjB1/Jue1MM7P+/SYl9cBDST0yD6zkxiBtI8eKV/ibzw5671k9xMnuRZGJWfUN3SyDR6CHvsILNE5+pjuXMEQqOh97BfFE/D6xERNHSmr+qBBB/XOqkuiWmXbr0xCylDPcqLNdTJPADYhixb30wM0bpFFFCGDT2+9IZN0eBcMutPKemYBXqi87BMHZHBKN/DEh6NZmhXt2raLjoLXC+/wLuraUEKNB24oo3R+zN4RgihIkG4PtoU6ZkXAE3mOYs0uYwLxw5K0ZuWCqwPoEAx9NyM3DY3vvCeVNBmXui98/fS4UxosvrrsivNk6fDowpEQFxwq7stFRnoiLdThK9Uz5qX/Am4zHXW+ZkRpCe6Qwd6ChqrNHd8/lO24/8LQBGAMoSmQ4S+VkApQGFxnC0MrioPaMJGjQ4yELU/5exG4EX9WnHiwr3koWDSdvAVZ0JdH7TgNiZQBnvhFsEmuFuHoi4X1cLfR3H0vl7XEg2rq7uX+xAl0boy01/eCmZG0Ua7GoaRa82YhI1YnYYPc0GKOcGDIl6xRwhbTmbEToAtwBDQVYbsF4+ghTxhFFacym8fyVc//B8OU4wbvT/4O3FAiodzrNIh7ooAChiw30EhKNTZSvL53xoUBq+BJKfZ8oTZjhA57d2dEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(54906003)(316002)(6666004)(7416002)(52116002)(6486002)(4326008)(1076003)(8676002)(38100700002)(2906002)(44832011)(186003)(508600001)(2616005)(66946007)(6506007)(66476007)(8936002)(6512007)(86362001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm1hOHI1MytNMFlydlJYN1c3K3Z5eVlJcmE3bmdSQXJhWXQrRnRoS3dHNlo2?=
 =?utf-8?B?d09jalF5ZitUVVdMcWVKdnMyWkU3Z0JFbFFZQ0ZHQ1VUVkRIY1YvQTlTcVNy?=
 =?utf-8?B?RW91aGhHYXBKVXUvOXJtbXdFSzUvSzZzY1R5UVVvcko0UXVHaXZWRWc3ZVFJ?=
 =?utf-8?B?MUdvZCtuVUFDa1lNcmRBNjR0TmhpTlZjSVp3SjBtbXFOWU1NSCtxbW5EZ05Z?=
 =?utf-8?B?Y2dtYjF6c0kvTVlmdE05dUkya0RqcVZIM04wRnZaSVdKcXkzaUZlMjZMNlJ6?=
 =?utf-8?B?aTZIODVYcXh3QWNBTUdvMXo1UE1TY0lMRjJSV0JIajROakhkOCtjRk10S2pE?=
 =?utf-8?B?SSt3YmVydXQ5VzZZc3A2UEZkVDBTRVRPdnZjZGp0WDdUejBnbWY3ZDkwNVlt?=
 =?utf-8?B?RjRuVThUQVhtY1FsaWVWcWN6VHNvcXcybmhSVmpFQnQxZ2ZkNitVUFF5VXJH?=
 =?utf-8?B?YmVURk9lUVRpZjVOY2JxMFdOcktCa3QxVkY1WkZ0TUNhZ1RYSjNob0hncHBk?=
 =?utf-8?B?MGZxdlJCVmIxNjlSTlloYmpPRVFNb0tHWlIvK1ZsWE01UkUweXZQWTdndWVo?=
 =?utf-8?B?aTdQT1RDNGFDWENMdEMra3NqalJDYkx5WWRkMC9uc0hGYWxnd1Z0SGs5ZlBH?=
 =?utf-8?B?K0hBbFZud0pUSVdBRE5pd1ZwQkV5aFNhOU03L0p2R3pkU2JZSEE5Y0V0cEdX?=
 =?utf-8?B?VElDMkdWOGFGM3ZKQmMwSVVLUExVNG42MG5PbnUzYTlMQmFTZHNaRFRvcy9B?=
 =?utf-8?B?aVpuUUZQcnJyNy9aVEVWVFYvRmYzOWF5dDN5Q2I4clA5cG9zanhSdHczTGJF?=
 =?utf-8?B?TFpDQ3Y3UHQzaXB1ZXRUV0I1d3ZDekNMSWMzd2VvQjR5aFFHTTBPM1RHcmN0?=
 =?utf-8?B?czBJcEh5UUx4QW51Q2FsMTBtWDJ6dlJ4NU9XbFRtcjBacVgwMVpiOVErK2l0?=
 =?utf-8?B?SGJxdWxtK1dTWHVJYVg0cng5b1cvdjF2bEZ0ZmVpUW5VMmd5OE9EVUFBcFJF?=
 =?utf-8?B?YXdKQUEwWElGRFJiakFWSVI1OGdYWnd4L1VDTUtQWWVFbGIwN2FVWU96YlFt?=
 =?utf-8?B?RVVOcHMrQ2ROMzRzRU9zV1k3NXlZQXRCTTlFblFBcGFvc01DRnlpS2Y1T0Vl?=
 =?utf-8?B?amRQMnUvUUtLQzRseWVDR0dQVWp4RXJBMGk3b3FWN0lqRGRucElXVkVoS2hS?=
 =?utf-8?B?R1FtVmkvRTV6YjlCTzdaVFRQOTgxZDRIaWZ0aGhZYjFHQllnRXY4SUIwUzdt?=
 =?utf-8?B?Vm0rU0Rnb1pNczNGL0k3ckhsZTQyb3ZEMS83dVg3QkFtVWpsV2ZsMmJnbWFC?=
 =?utf-8?B?NW8ydkg3TjNHUlJTVnkraG9SeUh1ZmdQWUVJcDFuc1lOWnBZWjlrMGpnTSti?=
 =?utf-8?B?Y29BQ2l6MUhZUTlYL0dxbjBLUHgrcW5YMmtxa0VNUlR5c1ZlWkFhcEpkenhy?=
 =?utf-8?B?UkhpampFeE1XcDVBOHc4bzlHQVB0cGRiZXZaRkZURURGYTAvc2hNTEl1c2Z1?=
 =?utf-8?B?M3hoekVYdnBzK01heW9kSXlpNVdzc2dZT1ZBK2xRY2FNR2dyMzhpUWdaSDIr?=
 =?utf-8?B?QmV6dEZ2VzZadDFlMkQ0NEF3a0k0N2MyNmNSUE1qdm9McXpXZ0pkdXJ4MWN5?=
 =?utf-8?B?RVlRRlhjMFNMRGQ3QmU0SHhMcHlXeUIxZUdOOEVOK3dvSU0vZ2J2cWJZTkhG?=
 =?utf-8?B?d3NYUldTdVRmazRkam9hSEU0Y3NlZFZLYStIdHNZOG5VRVAybVhBSXZSWGk0?=
 =?utf-8?B?cUlocG5IeTNoQjV5dnVqUktkU2xmODZIUTBYZWcxOXAxQ1VscEV2UCtkOUtq?=
 =?utf-8?B?Y3dFR0xWRDdJeFNRMzhxYVZROWtaTmgveXdLUU1XaXhyb3JsNVJPMTIyb3BN?=
 =?utf-8?B?Rk5lVEczK2JGcy8rTXN4eWZDOVFtVTNSMHlZSzN3bFFYZzhIZFowREZFY2I5?=
 =?utf-8?B?azlDM2ZEZFNSZFl1ZCtWY2VKbG5TRjRaMURrR2VsYmx5aExzT0V1SXF0TXpE?=
 =?utf-8?B?ZVR1U1hhNEphclNLTWNSOWViRjByc2U5bzlrU1NEMUZTc1dVQTB5TnArQVRh?=
 =?utf-8?B?NnpaV0lKMjlvMlUxd1JSMFV4MEhuQ2R0UDl0R0Y2T0xvdXNMNkZCSUhCTEdM?=
 =?utf-8?B?dS9iQTEyV3J3K1FFUDAyRDR1dTU2cEhFckxwZmtMNmFrVmdDRW9RMjlUNTlT?=
 =?utf-8?B?THMvMFRYV2gzRWsrcVpWTkZEOGlIQ1h4OFQ5c09IaldMWWljeXNRakl4ZjdL?=
 =?utf-8?Q?z+eyoP0K1wnPm9Zv7LlyjBhkL1TYp3o4d3849uZ7Do=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8090af-0a46-48df-afbc-08d9aa7b53c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:11.4806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46HsWQxwmIy3KFKOmcdVN+rHKKCn7D7fUIoLMcRmGjUyUQ6OrVJGWS2yFkcU7WQagMeomVsaIZhcRW0a1E4Tyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2429
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, yc.hung@mediatek.com,
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

From: YC Hung <yc.hung@mediatek.com>

Add the definition for Mediatek audio front end(AFE) tokens,include
AFE sampling rate, channels, and format.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/uapi/sound/sof/tokens.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 02b71a8deea4..b72fa385bebf 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -140,4 +140,9 @@
 #define SOF_TKN_INTEL_HDA_RATE			1500
 #define SOF_TKN_INTEL_HDA_CH			1501
 
+/* AFE */
+#define SOF_TKN_MEDIATEK_AFE_RATE		1600
+#define SOF_TKN_MEDIATEK_AFE_CH			1601
+#define SOF_TKN_MEDIATEK_AFE_FORMAT		1602
+
 #endif
-- 
2.27.0

