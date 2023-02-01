Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D21685CED
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:00:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C5991F0;
	Wed,  1 Feb 2023 02:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C5991F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675216844;
	bh=S0RLUiLzLPZTU/81EuHdDVOS5BffPVnpYpW0WuPf/TA=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BF2Vqk5o3f0KTEzQSmJu6IC31atsTsA7BOCdTlO53MDO2pjHlnLOMjgi6BIy953uZ
	 lHt7hKpHuRnVjkkVUp/22xJBs5PWiVjMZrka7HxiMHvxugemvFDdNhM5F55Ua7ooSU
	 KZql7LGjqTiUtRg51KhNl7zcLW5ixTnmmJlZpnEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C929DF80245;
	Wed,  1 Feb 2023 02:59:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89035F804DF; Wed,  1 Feb 2023 02:59:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2117.outbound.protection.outlook.com [40.107.215.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D0D3F80245
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 02:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D0D3F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HzbEvcB2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImbTLmdBC4tHKi6nlwctn+wvnJTqLJdOMdK+DDbyAFFXgc3lsXBwXl90MF5nuyQTTe6AX1nBLSKuo6Fwnn1cIQB7zC3Dv0cSBCCz0xytMWfbX1TBa2tPYfcUefwXRDXeCLVIcpjr4JY+RAyfAMBootYNmfKwNlfy6VDGf7CrrmDWqu04SSoVPdRv4nJbB5bOay6ZFuW+xqgvjV2j1Bgr+nJsw0KfiM92tc+Fc0RQ/SIpX9dA0uxAUqDDtcX9cA+6lv9KfgELsN4P+9Pk+LWgmTLu3G9Y5pM+jTPgU5iwcPIj/5AbbJnGcxNMg4xot9LjlONDzwT8T3Ijxi1rXccFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NH8IKR7APdrZC0Cio8Qt8L3x8rPFaX9AWrX27//vDQ=;
 b=YqGTuXDcBWPrfoJeCP4+hTtFpgmt20jc3/xi20mGUIZBaqmJGNsvvVnFCB1FUqkuYBl98i/+0Kq8c1lSagfWAHWJwaYzt9MPm1c/qmUHDS2tOB8ffEq1gdwHmzc3Gt9hNxTE5N9px7p1ggD63fslIa3VPVszTaW3etL3NzE9vQJIgZNC4yWuiJHuHwqBdxMmNom5CQuPRQXY4DlxyR/pQJgOh64MKxXFeHW62chm7+Oz+Laqy3FVQ9ZOpc7XMDy+dyMgPUlzxN5ENwQQt4dSKjv4me9rRztnU7eWHZzaf20fdGXpUp84dyqAJTA4/J+wHkRAg3+2IUSGLEAL7zWxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NH8IKR7APdrZC0Cio8Qt8L3x8rPFaX9AWrX27//vDQ=;
 b=HzbEvcB2tb6i5LufW1Yjo7wLJUGSthMueWQzixX+rvztM1M0jC/FEkOaI3lgISlhbtG1b3/9UVINjinuU7D7T8kED4IAN3X+jxLdYhefszOuhsV71VMS9RqnvhRKaYHV+D0yGgYH84XJHbP6fDiuAIVSaliyP8aqhCUqI/00iAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB10956.jpnprd01.prod.outlook.com (2603:1096:400:3b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 01:59:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 01:59:30 +0000
Message-ID: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/15] ASoC: rsnd: cleanup add R-Car Gen4 Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 01:59:29 +0000
X-ClientProxiedBy: TYCP286CA0096.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB10956:EE_
X-MS-Office365-Filtering-Correlation-Id: a858b4c9-5247-4a7d-769e-08db03f7f4ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4CsGzAqMLPvqD5TXQo7yD4Kv8GMmzQi3YBFuNteRBWqQGzzVtGhkPvp0ljKoqGM10naTi/RwaSrUrs/RXlEqbqDj6y0b8A6f/bacETmebKstHgCZBEQQXm4tdRdWNU1ZpDRW4cZ2rhAkmHVQn/99FhlnvohP1fkDlsHFC7b6ULXMSutEbRXMYI5yAchr3OVS5E6JmZE1clZix0tBcXa6StDMCyxfe3HdU+eHDCUcNMsxrG7Hh0f81BC4Vn2MAhkXYlZEjuSqcDFf67IvzT3nUd3lYyItNI7molBd5fvSBCNNGlim9qggFJZBdbPj4qTFTPpd8S+5tFxyPsWRkqMsl7fJiljDgyjgFzQCTZT9+GE5uGtwmj7bBZoj+j7EYgCWVuDttuPIgwbBQgzOkbeQvOYnk+QboL+j0GHCsnlCsLqQFO2diXZpy8o0TsdxnCVE/TXl5KjDtB8Ifn4zJr/In+c37bfxtAnWRAB4NgATScPFAcAsFjzDl1SoMVmNrB+w6QpjObyL4lzbo0d8x1B48vSaY+UuStBoZv0JvjGHhT8BBCm+LXsxm2OeILQE+uZVYaeFGRu4gZYna9jMWGHV2kDFFDLeRLQ7+Q8GY2cXigfF3MTgR1uTHT6B8jMNbXQSTeNSlh8+d9RR0O/F8vsCiV2XZn0TDo5o9NUHG7cOnmeTmrgK+hLRat1a5cvZeEVipp0W8/4ZJut6TJpYB/dpyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199018)(86362001)(478600001)(36756003)(6512007)(186003)(26005)(8936002)(6486002)(2906002)(52116002)(2616005)(6506007)(5660300002)(316002)(83380400001)(38100700002)(66946007)(6916009)(8676002)(66476007)(66556008)(4326008)(38350700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2aS6WZapu4r4jMDZk1KjcTTsy37GqRUTni10aMEIkcv+lbNLxpWEVmsRD7z0?=
 =?us-ascii?Q?H7DmHQx5QPlagOZlSR414izLFvfkNAY9Yv6oCnLfRTtzLAsdINMNTpLZAqh4?=
 =?us-ascii?Q?AkbmPb0etuA/htcsqVQ4t71kfbaSzj8DEEtCSxDFQsBBLbqq/w6WbfULClvG?=
 =?us-ascii?Q?/xUwYy7ORiaLwKjsdJ+9mersRLWu5BopsYKpC7msgdDA8gbBxA5vUTnXM+YH?=
 =?us-ascii?Q?L5G2uooKDvUA/qpSTK+ZR6ZPL++zyfAdCmNNx1Tc5Rf6yrwIHnsSj7Xh1L0X?=
 =?us-ascii?Q?HyPZELmqFCZm/zRtMbcY8sfMInYZlhl7cqU69TCWpJ+mJTY3NIDrC1u6JHxp?=
 =?us-ascii?Q?10G2WvASpDPp36K1QwBmENUi+QgZDwxWrkAjocUN5qKgcn8rbrauhlSmrUZm?=
 =?us-ascii?Q?b7mZbqy6hc5EuQqf6SN7a4y9xFDLx4/d9Ttgrj+8sOXXyo/H6c36VfZt6c3A?=
 =?us-ascii?Q?d1STmuNyW7ibyl3bEB442YhvZ1YG++3Q+7spnRXS3wMSFDwUN8L0mSp4ShDd?=
 =?us-ascii?Q?HHFZTNKIKKG3sjpzx3nlYySdZUi04VcXK4+m+9LzGZ+fdW1co40Lfrl3scWu?=
 =?us-ascii?Q?GaLqGU4LDDQQUUIk2iQtqzylYPDJtkrB2LSVk85EKfI+ch8JN6aqoLHg9q9Z?=
 =?us-ascii?Q?p6aLAKRG+tdl7gM25ORlzovqQr3xCCXIHTZwKCQI9oyb+Ibd2DkujKWkM9M7?=
 =?us-ascii?Q?qmzI8wzTIRQTCqH+F4fyh42jSbN/dss5hYgEYpLotrfjbXFvOoJKDI32TWcQ?=
 =?us-ascii?Q?e2O6PH9sqoOTY6dLnMM10NsRbrn7grp8GmTzc99nYSyY/7sFaeCcWIH4phEX?=
 =?us-ascii?Q?+TGzPwfY/u0sV14ZVujV2gtVDUEfkuKXWtJPPjRyTOom2lPIaepHOT5ktaSu?=
 =?us-ascii?Q?DYeHekA4QFfygSBjrPLtRM8McXzPRTgpNHJJ96YcR5Gk0e8gPHJhFurzqAki?=
 =?us-ascii?Q?CJbkT69U3pj+CIswOI4dwPPHvZlEQe9fjXxjM9ju6DlBwdQB8cyf1tSxDqw0?=
 =?us-ascii?Q?NuHU9qZBU5zj3aijNYRnRGl/4Kc8Z1vkufrTGlNCwz/R6Ld0/xubMX/pdPj1?=
 =?us-ascii?Q?6uNasQYLNbn8DcHh3CX5+z/ER83S6FZS+07NP4wsp1h1hM80YvGHuc4TFBQh?=
 =?us-ascii?Q?S+eQk61QI6m5XXoaas8AhvcRcSf1eYbZ6C2gXtv1ZxkStYFMwBIpBFJflIqk?=
 =?us-ascii?Q?qr12Az6rLeOOEGuW6QdlemNoOOuO7dHLMw37yGFFLnBBW+L2/c7veAoVIjeH?=
 =?us-ascii?Q?HRF4jj+nNNAmFJzGU2etN1I4WWLF2tMlfDqZdhk/MDNdZ1j7Xs4SJAWhi7PH?=
 =?us-ascii?Q?UIcWXo+ox8dkK3lBiGZNqnpbahrKwRIF0Xq1LMBpnz1mO+DcTuaXL981nRdB?=
 =?us-ascii?Q?9V0bWA6lNYoA90ymqArG+MYukmgtAiyy3zQ5AqPI3C64wKVUS/gUOn0TiZBC?=
 =?us-ascii?Q?FBTzNgD5pkUJKmelwartMwfRxtNsnfNt6O7CAd0YheRC/eNnRSUMjzMc8Xix?=
 =?us-ascii?Q?2Z430Md0KKik2VxIgHE3QLhV9g91hSQDezk+cbx9Ct9cEaDYSxTP8qN85yLh?=
 =?us-ascii?Q?OP4+fxukmIHvzMw5QIO4bP7h7hZILIh2Te1hK1Ykq5CKl5QFVuGkJvrizqh/?=
 =?us-ascii?Q?1rN8U1fU1etnA8iyZewPacA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a858b4c9-5247-4a7d-769e-08db03f7f4ad
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 01:59:30.1433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dkwbibbWyd5uMEG+hcorA595/QELLpVPCvkvsngDkNf/kSdVWDXXbkbZswSyPR74ZmYUSQmFSummz86y1bbde6GGaTZQNTuHpfsuCgq079KES8xVPjM0mDpOgwHd0aE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10956
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Mark

This patch-set adds R-Car Gen4 support on Renesas sound driver.
To add it, it needs some cleanups / prepares which makes
easy to review the patch.


Kuninori Morimoto (15):
  ASoC: rsnd: check whether playback/capture property exists
  ASoC: rsnd: fixup #endif position
  ASoC: rsnd: Remove unnecessary rsnd_dbg_dai_call()
  ASoC: rsnd: indicate necessary error when clock start failed
  ASoC: rsnd: indicate warning once if it can't handle requested rule
  ASoC: rsnd: use same debug message format on clkout
  ASoC: rsnd: remove unnecessary ADG flags
  ASoC: rsnd: rename clk to clkin
  ASoC: rsnd: moves clkout_name to top of the file
  ASoC: rsnd: use clkin/out_size
  ASoC: rsnd: use array for 44.1kHz/48kHz rate handling
  ASoC: rsnd: tidyup rsnd_dma_addr()
  ASoC: rsnd: dma.c: tidyup rsnd_dma_probe()
  ASoC: dt-bindings: renesas: add R8A779G0 V4H
  ASoC: rsnd: add R-Car Gen4 Sound support

 .../bindings/sound/renesas,rsnd.yaml          |   4 +
 sound/soc/sh/rcar/adg.c                       | 169 ++++++++++--------
 sound/soc/sh/rcar/core.c                      |  66 ++++---
 sound/soc/sh/rcar/dma.c                       |  57 +++++-
 sound/soc/sh/rcar/gen.c                       |  70 ++++++++
 sound/soc/sh/rcar/rsnd.h                      |  23 ++-
 sound/soc/sh/rcar/ssi.c                       |  13 +-
 sound/soc/sh/rcar/ssiu.c                      |  15 +-
 8 files changed, 289 insertions(+), 128 deletions(-)

-- 
2.25.1

