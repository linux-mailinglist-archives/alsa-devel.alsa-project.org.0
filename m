Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E732345442A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:47:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DDC1185B;
	Wed, 17 Nov 2021 10:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DDC1185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142455;
	bh=uRywt/6Kyw3A59jrRjOw0vqU/slQPz8+odzpqxuhGVY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUx8ODKkF8lc1w/1yDqULxR1BKPIMQiP0n5I0agHu/1SWXqaHrAl+uwi/6e6E7lpk
	 O8Ha3Xwoa/CkwPhUbQKsmVRrJxlY6GdtuvEHEkRPMRqHTVOU5TVaHiLzdbjmTYKW6k
	 itY9j2a/pB+e8SWV+kLALJ/5mWpaOuzdMfnKtVmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07AA8F805E8;
	Wed, 17 Nov 2021 10:39:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B563F805C5; Wed, 17 Nov 2021 10:38:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40061.outbound.protection.outlook.com [40.107.4.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1065F8055A
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1065F8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="GlNNqE/s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezVj+2ApiMp8hgbf/QZCBfHhjo6jphmEK9GEFs+hHRJ1NyUxz8je+4ikLSK9tsArB8jTUINlnELAbOPvBgNVr2CZFCkenp26KWgaVyERdayNUaseqpuQpYPBKSymvvmOdeQ37P01wtOJ3XVDS8H28GFy/GrhtJ4Ea9KS61mrij4A+t6UE6Lh9+j9fZBZCIGD49Ge29CwBdBkVfAPpO1mErTKp9llD30vjtvBUJXMjCvdJoRgudgrH3/pUhxmjamnuPiG7HEfXYfxJ7FyScI9DLi3ok9tqDZod47FHkDqTnrlyFl56vbbR8lanOmtNQWAVXt1/39ZFDcgM6PwOin7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfCMsRTQHWceFWu6tp44o22ZVYte66A8Zl2PxavSv3g=;
 b=KPLmVvZj3uK4N0dEa0dUshMljywIaJVnQ+eThDydjMcNDvu7HCw6Bb4TfEu5ekkOGE2XmdVgbhpONC2Xe23UG0B/D5/fXlCQiP3a82SwLehpkM/4sNFZrPJ34HuunjpvW5pEoOZR2oO+EN4xPjX+geixdwNreU62FKz7z/auk6qthRFEt1d9lSuMefr6FNTl2dmga0E1QYlGe6xLidN/6stmKIqrqMj+y36m+3gRdXlsM1ghepfMIxngfV7IMW/xm9vUAXQzuHtbnEAPVsMMWbJTY+0VJsAghvq4CKY2W7xQfR8obkeIuEHLYd9rvd3cE3Q9RSTvvKhIhavoenYWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfCMsRTQHWceFWu6tp44o22ZVYte66A8Zl2PxavSv3g=;
 b=GlNNqE/sqVJ8p7AkEJPm4AfnHntt/te3ioyBkunB/ghf8vglqNB4wVH7y/XSn1zBCx1wFtz2aNB3ZEUD4+VllT/Y8If08BIHHjWvunVNArLZ/BMeq2g5F460hLKQGZUlquRTm94Wfha08vsf6p5Vy1JvHLWhlvVPyycX15TZ74U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB3039.eurprd04.prod.outlook.com (2603:10a6:802:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 17 Nov
 2021 09:38:43 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:41 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 19/21] ASoC: SOF: mediatek: Add dai driver dsp ops callback
 for mt8195
Date: Wed, 17 Nov 2021 11:37:32 +0200
Message-Id: <20211117093734.17407-20-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d1bab77-b396-4347-3129-08d9a9ae09e9
X-MS-TrafficTypeDiagnostic: VI1PR04MB3039:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB30398A6720756198DA95BCBCB89A9@VI1PR04MB3039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z7z7H1V/j+B+31OX0YXy60oALEGOjxRJy123gF3QCAtd/zp/ncJvzsTUAUb+wDOSjjILgqwIKNLVw9tOak3UV6E6DP9fESSLH7eD8joh36gXGTL/W9iT8iHwCVO+TcNcwaTXdd3hFmbmBF/Zki66SQKEiWeGevlQtK0ZXUuiBUJoezKJiTGe/w/9k2dn/dpb9kfEp9ktJFR6Fli7AnpYPlxvZC9ng1XT0Pi41vAZfvCpe3wJovIqHyoQu9rOfipUwIW/+EeAdiZELBNV5EtZI6yUUni4AcP1sxGfE4TNDq+iRVhKtaskiqrIiCAa25bxVwLf/Gjxe3ZuhI4u5kuR6b6lz2lF5s8faHGv4Zc1fL/yd9VRh91d9dmt1IQNAVCiZmy2GHkZ03lwGLg0GU7y594CiTOmpAs+tfGHvZvdSvkRw9AQoMawYjl0bjtVWb8miHJnDLON2oqjlc4zUlfwLoaeQ/IhdPW/0FNSX9yqMx/MGpSOUQssqJK2AlSvENnY8W9kYh7lHnuMaTPjXSbmqqEoWL/k77czi++jkILSvrGrC6Csh1sZEwL34GQVUSfnWsmarmJQSijZYZC493nifUyeZblbqMm7Jep4I7c5PEoQ5uAoSBPtNCF054q+ccJnvDu7dke/uRT0Hx5Coyuwyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(186003)(6666004)(44832011)(52116002)(6486002)(5660300002)(66556008)(6512007)(6506007)(4326008)(7416002)(2616005)(8936002)(8676002)(1076003)(2906002)(66946007)(508600001)(86362001)(316002)(38100700002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW1sNGRSaTBweU80a2twWWZxR2pIUjRlSm9NMmtkREdVTmQ4VnQ2VEN2eEx0?=
 =?utf-8?B?aE9VMWRYbTdoRFJqeG5WRlV1R0pNelp6WU03cWFCUlpWUTROajRhOHFYVE0r?=
 =?utf-8?B?NHY2bU03N29ObThGeUJwYVh2Q2JMdklvSDc4NlZieDhGTzN3bG5FR1RPRWcw?=
 =?utf-8?B?bG0vRVNua3VFTEFLVmt1T1ZyM0pyL0RjcEVQRkxwaVB3WWlxV3JkTFY1OW85?=
 =?utf-8?B?bE4zQnB0eGVNZ290ZmlmQk1VcFBQaWU2c2VjNUVjSmFqL3kwQ2VrUlBSRmJP?=
 =?utf-8?B?T0VnNU5WYiswQTR3cjRUd3ozcFF5Z0RTV0duSkdOUERHa2NMY2FKeHIyRUpJ?=
 =?utf-8?B?dlhvUVRjNFNCYjdpVEZubm82WFRDaDVBb3lhcEMvVUFsbTlaODB0ZlVBTGdT?=
 =?utf-8?B?RWF3TEtndkw5ejRkR1VUZWVTUFJvTDQ1UUxEY1dnVVRxU3JoSEF5Zm5tNHR3?=
 =?utf-8?B?TTBncXNIS1U1STVsWEk1NlZIUFJUVlg3RkFCMVdYTEtyejdSRVpiWDZTWTRy?=
 =?utf-8?B?Z1l5NWx3WndQVHphbnRsTjlTWFhGa0UxbXVObElmMkMzZzFFV1RSZ1B5eVgw?=
 =?utf-8?B?M2QyZEN3cHdlemwrNjRraUdpTG1SbGl3M2l3aGwxQzZKTFdGbGw4eTFOazQ0?=
 =?utf-8?B?eS8wR3dhY05JU052OWxBZkYyMFlPczFxTWlUeWx4VmtrcFhUaXgrWGtnUUpG?=
 =?utf-8?B?aklhVkVGRWIwL05BOFgyU2Z4L3l3cWZ5V1dMS2dweEtVbTZjaGMyQytrWW9T?=
 =?utf-8?B?c0VoVVdJYjducy9paDJSL2hTWjZ0YzV3d1JNRkhEZzJDMHJTOHN4SE9IcG1j?=
 =?utf-8?B?dDZKMzFHRkVPRCtXUlNtYkxwVkMrSmVZRExXS2ZsQW9ib3UydmlJOERxa1dt?=
 =?utf-8?B?bWFCT0JKQ1ZJeU0wL2UxWDdZZG00N0FNMmRBSmp0MzRNRU1KR1RjMGhhR1BX?=
 =?utf-8?B?bEd1dGRXVmhPZW82Ukp4R283OGEyUHRINGVQZStuN2NMbEc2ajVLTnQzZ201?=
 =?utf-8?B?Y0FrRkFEZGN6bzBzeFVQUGZ5eGZqcTM3ZjMvNktocGRoWUVWTG0yVmpnNnZG?=
 =?utf-8?B?YTd2cjBOSE1BMllvSzJST2t5eExyWmh0Um1GeUF6ekNiM05vWWRZbnAwMS80?=
 =?utf-8?B?OEQ5TElmR0Y3eU9TY1orczdDcTlUakkweUR0ODlIOGpPRjJnQW8vSmNqT1F5?=
 =?utf-8?B?YytFOHd3OXM3RWEwQzZtdUgyYzBpc1NWaUkvdVFCS3V1bkw1dHloVENYUjNm?=
 =?utf-8?B?azc5aHpTbEpBYU53RjE2MkFXNzdLelc0eDhpM2JDcjgydXNieWZvbk5WemVT?=
 =?utf-8?B?QWwvcm9QSHFVdmtCK0pYOS9LWC82d2lFNjVTZG5hRlByZ0dsYVZ2U2d0NkFT?=
 =?utf-8?B?dlIxMDJGQWpaNmtPcy84Vm9Lc3ByU1hOUmdEalJmZTNzQmNzMzBsNDFXc1ZE?=
 =?utf-8?B?aHBUSEFOOE4xc01qcjdlTVdXQ3NRYUVlRUJEOER5VEM0UEgwcTlua3NYTmVN?=
 =?utf-8?B?S1ora3pDK3VQMnFTcll6MlJvdXl5NCtOWVRYaVdoM3phWUVQVE1Vdk9kQ01F?=
 =?utf-8?B?WjdKaUU0dURHemt5YzM3TVNqQ2dUNnlmRGNiMTZtVXhGTThuNUNER2kxaHZx?=
 =?utf-8?B?a2hOTTRycUs4K1loUElmSzR5SzF5MWg4NHVvUDl1c3V5ekNDMkhoWHNGb2ls?=
 =?utf-8?B?aFQ0aTl4SUYxL092cFl2R1AvR3Z5cUN2WmhZRmh6Y0Q4bGx6bFZDanJORUtC?=
 =?utf-8?B?ZUZpcXZCcWxqTURvcnZyWG9NWmgrOEo4eE5kSytXNm5hbU1vRWc2MWtmRjVj?=
 =?utf-8?B?NTBFOVgwditZbEhlMWlsbUt5NXNBdmdiNHhVYWNWSEdid0U5dXBuMWtjOVor?=
 =?utf-8?B?dTVKNFM2QS9WSzdjRnNEWHpqY210N3djQk56SnNBUlhnYjNHUW5vaVMvR3Ay?=
 =?utf-8?B?Q0N6WmN3dGVWcEdIVCtUTEl2RGJ3Uk9icjY3REVJNDRlaEcvb2JxeGVzV05M?=
 =?utf-8?B?S093UDIxZnBNT3kzaTJHblZRRXZzS3A2UUJZVitTWG1tRDFsQnVSb1o3aGhS?=
 =?utf-8?B?ZC9KTWRxemdQVlBrbm10bXkxLzhUVHRPY29INDEyTWRtQTZPOENoclZVNlpQ?=
 =?utf-8?B?OEpsL3ZHUlZXSm1nVU1tNk5nRVdTZHl4Nkh5ekdFK2NOVWpKSndyc0FYandH?=
 =?utf-8?B?Y0JqNjB3dUtnVnFubWI1b0hJQU9YYXpoWHRBZGZlYjhFQ3lBWkxwVFJOQlF0?=
 =?utf-8?Q?io8Jk4h+kk+OuC8vt89UasyAdFlFHlcXih3rtMgc1w=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1bab77-b396-4347-3129-08d9a9ae09e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:41.3612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wnpoTM/La2mN3Kw27ZHLRVMK7LFwHYzj0jwQ/JG/j/J5L2MG8aysdFa+NQwJCYOQB5JUzoaQ2Rie6wkdXUumA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3039
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

Add dsp ops callback to register AFE DL2/DL3/UL4/UL5 sof dai's with ALSA

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 88da6c2de070..99075598a35a 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -299,6 +299,37 @@ static int mt8195_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	return type;
 }
 
+static struct snd_soc_dai_driver mt8195_dai[] = {
+{
+	.name = "SOF_DL2",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_DL3",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_UL4",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_UL5",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+};
+
 /* mt8195 ops */
 const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* probe and remove */
@@ -329,6 +360,10 @@ const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
+	/* DAI drivers */
+	.drv = mt8195_dai,
+	.num_drv = ARRAY_SIZE(mt8195_dai),
+
 	/* ALSA HW info flags */
 	.hw_info =	SNDRV_PCM_INFO_MMAP |
 			SNDRV_PCM_INFO_MMAP_VALID |
-- 
2.27.0

