Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4140E66DD85
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:27:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92AD6741;
	Tue, 17 Jan 2023 13:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92AD6741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673958421;
	bh=Q37YQUh70fPTXwYj/REy1QVs2/1zL86vCEvRzEFF71w=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LcP49Dw8S8pkMoCDLsX6ogGbSm6BnYMXZ1QboSkMVoy0fdlp1ye3m2laV7AcU/hVd
	 METi93yxGhQrCTXExoMEnQCguv4nkTFAasFd9m+CAF80IJ+0U91jaK9dNDcX2syQLe
	 6daNNRz/K8v+BaYABoDVXNMwwv9lnUcjdPWwZmpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30EA8F804E6;
	Tue, 17 Jan 2023 13:26:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 355C5F804DE; Tue, 17 Jan 2023 13:26:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9212F8022D
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9212F8022D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=Ji3gzDik
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDKyEiSzhPAoS8RIonvkjS7T0JGXzmpkLv1wiYNFtME5I43ntJgDVAMnHYsUhoIfXnuy8phWxR1gY/TBKvtXD2TxDN6shSCycUZbbPBBczYP5pLUSCdDsXhB6fyDw/JwS3k9qHGsh5CjErh7siKh+dq/U1rbCbdIykcLXjE6UOv5TTGM3swIUdG9DKDBGqW5MHnQWI/XLXH4DjgDJ0mzV4RHWaRzoxdE196OMFr5uSm9mfZ0nK8HyFyy/ZqsZ7kDZkjCtuM84GqszT/ivUzZ2IUxlRrOWI5jDrdFm+JyzCc6kMku6ey8giIuDBCt6aclGfMm5ktbHIt/dQ0/m1l16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPuFn+rjg5ydnU7lUlliZ2tz/DuS+J1AXrYylXXW0Qk=;
 b=Vs48VGdZtzYjIgMuzH8NGy4R+A7veHQhdUktTEhZ6NTou9S5a7UbSj7PPxKuICnpewmH5z/RfolisvNTk0Vy8OfzUnrP6OZ45SJOVYbbNuH0ICP68p5R9f1Yc2c3PkRz6+mjf0UR6/m4vcMgkyEOk4tQb8kQ20y0bn/5m8e/FbGFBodeSEcPGr4+3FB3zbIFndQDLKaACctOwoHnrGMYwuy9VGU8fbNCbcdFilYbO8eqpTOBXNVFaq8vtqAYYshXyn67mR2ejO6zCmWoZiHz3vs00JciymZ0iPO4VGGURRF/PNNgeyt/J2bG7JG4AOJFXyYY08KYGxD0U824blQRxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPuFn+rjg5ydnU7lUlliZ2tz/DuS+J1AXrYylXXW0Qk=;
 b=Ji3gzDikrMaicQLfWalM0+Dh47rLsGi2gVf+5DeVa2glYwx0GjuG2gFQ/WWj4L7NvzV8SwcQvh6JLQq7plk+zCmcUmyDFxnWbc6jls9AmBiGPbSdqbcJ7TYOobw71+sJEIPYyavYp5yKBVwNi5/thbjJs10vn5oZ2bozccyM958=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PAXPR04MB9595.eurprd04.prod.outlook.com (2603:10a6:102:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:25:54 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 12:25:54 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 0/4 v2] Add support to compress API to ipc_msg_data /
 set_stream_data_offset
Date: Tue, 17 Jan 2023 14:25:29 +0200
Message-Id: <20230117122533.201708-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0133.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::30) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|PAXPR04MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d43645-283c-47cb-f727-08daf885fa92
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50853VTLrR4yO4VRZxLNsVPrv0HEJqPvvblIw0J0Le9bu5QbqUU9PiKDGeQ5Z2uuznODMUjJBLKRXkPz1kFjNVKDnJMMeOZ1Wd51bUxxjDps2tEzwQUDZuoo85VXhXvQZjoMD4cn/cjV/10/jpTAx8aoQ67S+spoEtuSJB5pCbvdvQIz4y2kUEA9UqibOa5qqJs9Vd9RPAIy7kRsDG4bfPJhZI6AgbE4+LAQ+dPSeACJX1bSC7Q+pZHTWBjiMJFTPEpnGj/D9JfWhJiR8RtfA9O7aKN63s3wZ4m8L+D5XwIClJ3kyN22RyMoOBqpSZuF1DBzbmfMtY8KQYMT6Bnlo4HcpfWypG8LxFLaIHeMgYsw2LmW5anEipOj/h2FVWbh2t5qz4R43hJdrU1Hi6dm78uqa5nELrb/Q2w3xuTGcIc0Tck3cRud2IoNKLYcK80Rolvmv1DDhcxdYYeEvMQf+bOsIscY4+renx6tH5Wh9tP20Al4Bx9rYelycztBk1qh0PCEPgr6t67iDeW4/k+/SXOMdZ337B8CDR36I1+Nto+gp0/fACaOyfOIvTxgpYoGUoF0yFY9LJ38SMmn1YZEJWqAHGu1dsJLO1ud7Tpymfi+HHOu5SCCs7SSqYsx8jSTN+QxZ2UJDkVwyZtSw2BTBhR7W+gmOHRTyDtha3vNpAh225Ac3JenYgi87z1nJsS8Ds2RaH24RKmOQyh0F3JNvZLMEi0TaSI2XZp+Eku1MYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(66476007)(66946007)(66556008)(41300700001)(2616005)(8676002)(6512007)(26005)(6916009)(186003)(4326008)(86362001)(5660300002)(83380400001)(38350700002)(8936002)(6666004)(478600001)(38100700002)(52116002)(316002)(1076003)(6506007)(2906002)(7416002)(6486002)(966005)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dKXpRyzFLjm08mdf1kFe5ajTqQYCmdGHuqCDV25AiMR4flbQABniemdyaAC1?=
 =?us-ascii?Q?x/kPJoeKu7QtAxkUZ93RniZHRvn/5h8xvKVOgZ7jMJE7oEyjoqkQslWoUXby?=
 =?us-ascii?Q?5I63OamGhk4lN19xpuHXhXLm0rbW41N8Ald1wTJRhiaAEGceV6eMaAetfmb+?=
 =?us-ascii?Q?YEz3PZKer+PUd+MGDlfclKtl6Vg4zwaFZDPSiFiOLKbPzcXASvrfgFY5pfdn?=
 =?us-ascii?Q?0pfnerKsB1IZx6nIlPDEPYmZv2/TGTBRjrMVs9aNWE4TFpDGumH4CQwqW3WX?=
 =?us-ascii?Q?VSH7qED9hh3UvdrcwQJ0sK8IzhcYEwfVp1EUaJrFZHUJMdvLpxxN6060p8aE?=
 =?us-ascii?Q?JehcCrNGwrT27KNsA9Mn5U012XGmnwLd4jBh2P2X3UC1MxPSNI4Pod6PUHTD?=
 =?us-ascii?Q?s1rKjLAoeG112BmxS4rHbFm8CPehep53T2jFRt4BkZEhLKTVy0yruZwAD2Qf?=
 =?us-ascii?Q?IwH+JAzhqInkJmswf91hkl6rvSeV58Lgs/NaM0nzW1pDlL8C+CiwpGgrKrvd?=
 =?us-ascii?Q?Hh8ffjhIVbvROgteRVapAW+lJCnc1NuDBwbkoq+TeTYo4Var5i8Wd6/QtKjC?=
 =?us-ascii?Q?TozEZN3544Z4XtNkBqCD3ED0BTGduLhRpUBSWEjEVMDGCsFVSQ8lCL+rASn9?=
 =?us-ascii?Q?9ZLox9kwCBVzCTKVGsHZXtpCTuy4cueomJJL3BWLbGZROn49JGzoTdE1Eb+q?=
 =?us-ascii?Q?tJIC1mmoVUfLipnCTh7DYBNLPSv8NpN/HRcGA5GQvdbM4ovPlPb9YxdhfwmC?=
 =?us-ascii?Q?Xq8CIVZB1/k4Re+IDrTqCrhBL5Wjl2w/B61ileL2VfW3KAABmLR9rzLJ5+BL?=
 =?us-ascii?Q?NxBFQTFUQ+ZWlOCxV/PO/t6UW7c98EToV6vUbmVPvDSE4fTs/d/BkkgDIz2M?=
 =?us-ascii?Q?EcVnxrTL0EiHtQtC6EuaC1zrYocXMJjg83JcJAqoMtVQ6703q3oCEko0cpXS?=
 =?us-ascii?Q?3GZcl2xkX6v2YyMdUcLnlpibxA/lshnSWUAGN5pFbcd9lszpZty/rcyeaj2Q?=
 =?us-ascii?Q?VGZq11WW+RSfdknD4XNyuoimMzEnXKGrABsx90yvtAIA33oH3Zn0milGYubc?=
 =?us-ascii?Q?lBlddBel2mmtzgPy+3QOf9+zmz1x9dW+Z6keWEWwiwaubM1Y++A/qPz4eaLo?=
 =?us-ascii?Q?bWQxkSviR/mi48MprbnJXCQ+1wXUgOqoKrH8sVHU7H+KBGa22MypBDKCIYUy?=
 =?us-ascii?Q?dgHjb4x9KerXQh6kKa1MWAmSYQ/tIuTQCkZ9EEADCLPFJmo7vUFfd8+WtRPE?=
 =?us-ascii?Q?8oOmBPCePufAADGvZ4Tnshp/CT76UQZ3MShIAcYmX0BEkpzmRzxfhRcJPE/4?=
 =?us-ascii?Q?FCOkisTii6ty5z915xhygfyN4YqGh+kK0iXAHTAV73kLhtfAw2fhUXNC6ijN?=
 =?us-ascii?Q?eaBBPYPZkr51M00+0OxLqfU38UlmHmc3oMJSWuEjOBvkBiFoXm0AyHjvwk2k?=
 =?us-ascii?Q?HDJKTf01yp/Hha4nhubK/tcs+vxPqiYzmcohIYDYBNr2euJjLJOg7JxNR3NX?=
 =?us-ascii?Q?z49d+Yl+DUvhIbFreN79GokMnTVKQ3lSQScDdcBG2D/iUCRI4KvT5PM/N3CI?=
 =?us-ascii?Q?8aiqZoF66oYhQHcrIvo166X7yKGt92iz9HcolvnO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d43645-283c-47cb-f727-08daf885fa92
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:25:54.7589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roae8bjRke/xvEuQeBJwfVV5IuF8+ql9lXcK66CHMf+jV0whE+l9msT3Uyj1nPXqmrRfmNuXjWfdjNuee535aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9595
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
Cc: kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org,
 Allen-KH.Cheng@mediatek.com, AjitKumar.Pandey@amd.com, lgirdwood@gmail.come,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-imx@nxp.com, yc.hung@mediatek.com, Vsujithkumar.Reddy@amd.com,
 peter.ujfalusi@linux.intel.com, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This patch series adds compress API support to ipc_msg_data /
set_stream_data_offset callbacks.

Changes since v1:
	- fixed reviewed-by list (+Peter, -Pierre). Since github had
	  some glitches I added the reviews received manually in the
          commits.
	- Github PR link: https://github.com/thesofproject/linux/pull/4133

Daniel Baluta (4):
  ASoC: SOF: Prepare ipc_msg_data to be used with compress API
  ASoC: SOF: Prepare set_stream_data_offset for compress API
  ASoC: SOF: Add support for compress API for stream data/offset
  ASoC: SOF: compress: Set compress data offset

 sound/soc/sof/amd/acp-ipc.c            |  8 ++--
 sound/soc/sof/amd/acp.h                |  5 ++-
 sound/soc/sof/compress.c               |  9 +++++
 sound/soc/sof/intel/hda-ipc.c          |  8 ++--
 sound/soc/sof/intel/hda.h              |  4 +-
 sound/soc/sof/ipc3-pcm.c               |  3 +-
 sound/soc/sof/ipc3.c                   |  4 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c |  2 +-
 sound/soc/sof/ops.h                    |  8 ++--
 sound/soc/sof/sof-priv.h               | 11 ++++--
 sound/soc/sof/stream-ipc.c             | 53 +++++++++++++++++++-------
 12 files changed, 81 insertions(+), 36 deletions(-)

-- 
2.25.1

