Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B4421298
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 17:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A05D169D;
	Mon,  4 Oct 2021 17:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A05D169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633361025;
	bh=HrSpXIMg1zrtkcplDFAnu/bRIkdBjyavgE3pYQr/f5A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jrXLFs7Dyhm+Y9CqLgEdlHiHbUsl8XyEp7dvqc8R39neYLR2GQUiYsEG+l4ywsKvm
	 OYukMc4eUkeli9Wq0fM3hjVDfbZtSrQJvc0VCMq/G309cEAKTedChT+rmU/DoeD9fn
	 ioljnqZ2/FJi4RGKf3L2UdM1Im63/bkTIKgiW8Eo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63406F802D2;
	Mon,  4 Oct 2021 17:22:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5708F802D2; Mon,  4 Oct 2021 17:22:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D4A2F80171;
 Mon,  4 Oct 2021 17:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4A2F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="kxSm4A2U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/RqsfTbJjzJhDP/B1g3/q5w4a6GhMCY36DZTEi799LPlBB2yb0P4y+lAv7lmLKz4Zu694HmKnhRU6Ic+NxP/Em92+Lxivy/urRVK7PksWMamhvsEHf2Fh6R/FNa1AFPxtWXlMW31WfkN9TiKtyp96wNETxqYBSkeJrIRdCY8skgirKlzRFyZMueQ+JH+CVS/D58VETYZC2YQSj/RMfajPrq4HrTxd68fH4phqNyC0dD8RTxhObaRqYmellta+y+XEk/8uzGBAZbTItj+F3WY070ZSi1eOgYmOYNWX/3/ZXSLuGbc6tnVcr8S0y4MG8Ny0HKT2yqUWkRJXFe0zuGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyMqsA2CRLnSQom/YMzvv8G27U++lUgWebq/SHACYX0=;
 b=OJPLi/inAaUCucIiuqOBvaA1CSPHp1XyOl5EnZFDTZus7L4OdQnQd6NXtWAqpOiXSRFtxz8oI4vSbwT+ToUwQ2z5ldm3IiDC1GmZd8wMA7w4PCFl2RhTusl4SoDIGT7susrdi/L9NYJdNXZO3F7XjwilUWlIwhfrJuQRrg4Jskbc7u4sSBHtZFeD5GBR3c0vmju3VBR0AUbFsuC2MD5GwWv0k42JPtxQ03qxmdbZ7tSn8OO17MUkoUhX3SHWwRaqGdvO0W7wI5rGu/hUxBNtJ9d9zREMikS6Z4PAyME7wK76/JIXl0JrwdJgU46EhSpILxJbLJ71sBUIO1YA4i36mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyMqsA2CRLnSQom/YMzvv8G27U++lUgWebq/SHACYX0=;
 b=kxSm4A2UTdG2tD8U3IJFZR+zo4C0BzUhOpkNYgrJpWDckVeDsDnZmtKtGGONLr7hDssMxopDa+/OXGtKD/bbDC/6SKIuem/6JVfbMomCILDlvfiVWfauKrDQZCCmcE7JTN5+NMNqMI7AOLD+6sPpX6mpG7Vf4Pc0lyysxAimrKM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB7069.eurprd04.prod.outlook.com (2603:10a6:800:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 15:22:14 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::9968:6eca:45c5:8af4]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::9968:6eca:45c5:8af4%7]) with mapi id 15.20.4544.026; Mon, 4 Oct 2021
 15:22:14 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 0/4] Introduce new SOF helpers
Date: Mon,  4 Oct 2021 18:21:43 +0300
Message-Id: <20211004152147.1268978-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0801CA0068.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::12) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (5.12.247.65) by
 VI1PR0801CA0068.eurprd08.prod.outlook.com (2603:10a6:800:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Mon, 4 Oct 2021 15:22:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dbd0ecc-11bd-422b-5fea-08d9874abe80
X-MS-TrafficTypeDiagnostic: VI1PR04MB7069:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7069FDAAA81730C5E8E27200B8AE9@VI1PR04MB7069.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FsXE8c0M+3UNH6ZH3pNSoqrzYB1HAbhT7wZLyOPr24lAKbYijwIa70g5eJ/5Ze+Qj6d8ZTWvDfaYRAigWb//FKew1c8II7whyhYNzoITLRALJsNlxBo8PSS80CLJDQcJNhupeRH2Vb5xxa1KqUTljizwn0aW5CEM2isb6Hbnwr62SsxztRI1A7u8gNy59YDcNX8G6yIyFBd7mZELfIRJevtCEsrEdjZUzvBziqXBsXpYxC9Ay7+1CTG1QaZuBc2bkZC5vXXFWWp5CzYzaAT21MSNrOM5JqNcHfUM/Jhbv3OsE4QIyVrpGJoNqk+5UkaxfaP8HVoD7fHSPDWxh9mRmKIvCoL2i44VH0oRGtoaDZaGcoAgPfaEyJQ6rkVOzTILl0iYa+C3uPZZ8CbGwCK5szC9wYe3h5+a5e6jrzb9MLGYZJIcrEUcKbs0AhnS2hPaztUpqgujFtKRgt+JVadngHUCT2F5dY7JLKxxZnj+UPfu6ZCl3wefJXG7/TMTXS3muj5zTjEP7TDXP/WsS119d2DpJs4lhpjt5esOQRWDzHviNNQv/XXTWH/ZlUg/e3ZLpFaOHZTFPZFr63uEEKBAx+y40yPsPrViDvlPXjGyl0RCv8lpdxATabCmK3HmPiJZM7uCkcEPuwOj0M7drioZy5wIIRtojJWQCwv54g9740w2vEO/uuRnFHoGyGQEMM3uXDe17WM8WeFuc9Y8KH38aQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(186003)(8936002)(38350700002)(86362001)(38100700002)(5660300002)(2616005)(8676002)(956004)(2906002)(508600001)(26005)(6486002)(66476007)(52116002)(7416002)(66946007)(6512007)(6506007)(6916009)(44832011)(83380400001)(316002)(4326008)(66556008)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmZrd25zaGZwVThyQVNPeHhyakJUbUQySUZUZE9uR21oTXpjT013Vm9XbXdt?=
 =?utf-8?B?NGVXVUNOVGhEbis2eHpHUzE5ODdaQkk1S0x5YTh3QVNiUHc2MUEzRWNNeGtQ?=
 =?utf-8?B?SXVlTEVIUlhLRWcrcmV5TWdCcHJhNDBGTW5HeE13L0NTYU1zT2g2Uy81b3li?=
 =?utf-8?B?eGd5QnVqQkVJM29rUG9WTEV3ZnVkMWVNVzl6NkRjRFNrMHhtdkNSVTlIOTRM?=
 =?utf-8?B?alYwMjVsT0gvR2hlRWNDYnM0QW51RGFvL09LL0lNcW8yT2xZYzBIbGpKN3JC?=
 =?utf-8?B?a05tZnljQk1EbUZjY0Z6V3FhOUdPMkVQZzlKU1NzZU9qb2VkUFE4LzhlWnp3?=
 =?utf-8?B?clpFY21CT0dleGZaL25lV0x1TFNtRklyeFJlcG44OG9mNGN3OGcrVUFxZ1Jz?=
 =?utf-8?B?Y21tMzk0TnBMcThIRER5ZDFYVUdOVjN2V0cvcTNGTkFqUzBVVzEwOTFXVVhJ?=
 =?utf-8?B?MVE5OG9peXdvZzFQMC9pUThiNWFIS1o4KzNSSUVwZXRCWjJVYUZRSEVVSWdJ?=
 =?utf-8?B?c0ZZTDZIeHcybnk3bGE4d01WTHVUWHpidzRlcVJkOGhoVkdwMzRhSUo3c1Vx?=
 =?utf-8?B?UGRSUWpzL3NUM2V4WHFnRzVLZU5OOUxKT3lrNzJzNTVNTmlzNDcwV1JOUnZF?=
 =?utf-8?B?c0I5ODRFemt5allHOHE0Z2VwVjRHNyt3dXNDYjl1VzV6L20rekpUK3lhTTU5?=
 =?utf-8?B?dGk2NzVxSGhuc3g5MWdkalF1YVdxMnVpOEg4eUdpSE41NHRtN2Z1ZWRsSU1M?=
 =?utf-8?B?azhnL2RsY3pHK0xwS3NORUllc05wRytpbkNJbExnSy9waG1nWE5vSTdFbGVu?=
 =?utf-8?B?ckdUM1Vra0F6bVk5dy9ncS9LWXJqQ2ExSGk1Uk9heCtIaHorZVN1UWs3dGw1?=
 =?utf-8?B?MTFYay9EYzhiK2NSa0p1djVVMW1Rbzcya1RZSEN3ZHFYUzk5Sm9PSHpVRG5J?=
 =?utf-8?B?UXFjMHZGbDR0dDhnVWR4Wm1BM2xXQUdtN1lYMmJGMExLRGJGTVJNWnBObkps?=
 =?utf-8?B?aW9aVUg4Sk93SXVuM3htakNlMUpPd0pyQlhHOG5XeWNIRVpGeHNtQTNXNUdo?=
 =?utf-8?B?R2dTa3N2eWlPcUpaRTZCVXNacWFyeFZJa1plNm5jZW9oWUd4QkZPQ1d0SWZs?=
 =?utf-8?B?anRqZ2Z3QlVnbXpzVlpLa3lqQno5Rk9BcXhXeC8vWnlGZnNXemduSDZ4d05E?=
 =?utf-8?B?K0MyOXZHWlluWEdyZ1N2SjlGVGQwNUllR3BMdHZMR3psUSswd3d0anNuV0FN?=
 =?utf-8?B?MXErbXhFN3hGaWNOVzNPQjVkQ2xjWk5EdGZSTlhwZWtrYktFcEtLRUxwSnR1?=
 =?utf-8?B?QkZBY3JQaHc4V3FUcEp2NElISFNJajZ4Q2FtVllZZUo5Sm5mdWQyMHlDemc4?=
 =?utf-8?B?d3lySzZ6VVFCcXRZcWhJR1hXTDF2cFRwSlQxYTJUQi9QQmVSWUZtVnBnV0Ux?=
 =?utf-8?B?ay9KeHR4a0ZqQlBobjY2QTYzSFcxUXozaWp1R21EaktVVlhxR0J3TCtDYzAr?=
 =?utf-8?B?dHpzQ1FJS290MWtLRXdGMHc3Y25PVXA4WnVBRHdPdEI5MC9yQVZML0NkR3k2?=
 =?utf-8?B?S3YzazZzaEZ3VkJLN2pISUxUcG10ZGRUR1hRWHJuTHVjamVKaFo1SFV1dXdS?=
 =?utf-8?B?V1lNWXNiNVVWK0ZadnlZVXZISnBLdzlSV1JDZHN0bjIyaURrQWlVeEtpbXVr?=
 =?utf-8?B?b014UzFmY1NhL1dMUDk2MzNmMFgvUFA0ZHBUcUpmay9CZ25CMVk4Y2ExL0lp?=
 =?utf-8?Q?JNxRO8g0bupDaWHTrqk/acJgu7SGNLtt+R48qRJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbd0ecc-11bd-422b-5fea-08d9874abe80
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 15:22:14.4588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gr1PjQ6IP9P1zD7skrvLaEIrmzL1k1I49VeY2aJqXinHoFqvaSmZC4M3XnFDcUyxWHq4S9SeBHMik+PZ8CRDKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7069
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, budliviu@gmail.com, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

This patchseries adds new helpers in order to reduce code duplication
and prepare for compress audio support with SOF.

Bud Liviu-Alexandru (1):
  ASoC: SOF: Make Intel IPC stream ops generic

Daniel Baluta (3):
  ASoC: SOF: Introduce snd_sof_mailbox_read / snd_sof_mailbox_write
    callbacks
  ASoC: SOF: imx: Use newly introduced generic IPC stream ops
  ASoC: SOF: Introduce fragment elapsed notification API

 sound/soc/sof/Kconfig                         |  4 ++
 sound/soc/sof/Makefile                        |  3 +-
 sound/soc/sof/compress.c                      | 51 +++++++++++++++++++
 sound/soc/sof/imx/Kconfig                     |  2 +
 sound/soc/sof/imx/imx8.c                      | 39 +++++++-------
 sound/soc/sof/imx/imx8m.c                     | 26 ++++------
 sound/soc/sof/intel/Makefile                  |  3 --
 sound/soc/sof/intel/apl.c                     |  4 ++
 sound/soc/sof/intel/bdw.c                     | 12 +++--
 sound/soc/sof/intel/byt.c                     | 24 ++++++---
 sound/soc/sof/intel/cnl.c                     |  4 ++
 sound/soc/sof/intel/icl.c                     |  4 ++
 sound/soc/sof/intel/pci-tng.c                 | 12 +++--
 sound/soc/sof/intel/tgl.c                     |  4 ++
 sound/soc/sof/ipc.c                           |  6 ++-
 sound/soc/sof/ops.h                           | 15 ++++++
 sound/soc/sof/pcm.c                           |  7 ++-
 sound/soc/sof/sof-audio.h                     | 11 +++-
 sound/soc/sof/sof-priv.h                      | 28 ++++++----
 .../sof/{intel/intel-ipc.c => stream-ipc.c}   | 50 +++++++++---------
 sound/soc/sof/topology.c                      |  6 ++-
 21 files changed, 218 insertions(+), 97 deletions(-)
 create mode 100644 sound/soc/sof/compress.c
 rename sound/soc/sof/{intel/intel-ipc.c => stream-ipc.c} (58%)

-- 
2.27.0

