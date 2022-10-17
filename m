Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 016E3601DA8
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:37:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CDEE8E39;
	Tue, 18 Oct 2022 01:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CDEE8E39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666049829;
	bh=4FQR+qkUsuFITpc6QmO6TsXpsuI988e08Z4sxcGSa2w=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hxx6YvIPMUU7mbpXH9o/J33t0cfBabErR6yZLnIX7hathancULkv41ARqTfPpJ3VF
	 ZZasE7PmStTJlyerqXAT78GqbT6LQHXlXBYXB98ieMgvus4/5joTHusYxxJEJTpTZL
	 oyF2z5y7bFilC8KPdOhd0dXxvo4k628Wq63pNbFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EC89F804AD;
	Tue, 18 Oct 2022 01:36:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE5DAF8025E; Tue, 18 Oct 2022 01:36:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2117.outbound.protection.outlook.com [40.107.113.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDE67F80149
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDE67F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="IgLdtjS3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEQ5n2J8NX96dQJjoXNszBqYl1qLjC7ykUuZZ4MWW/vzI68G3+0dyd7R5FalPhgMnt4kd+M3aar95QxoNR11WS3v6T7gZyee/gfoUcpxRu5PD1VvfCZ+SdRAVONKEDL8XoKn6utzow+oXSt8CarGXvu3MS6SUKT8IPW2twIesgFihiwOmf8alFWt4KUZOUnj6FYRZQsHdSZP5AzeWdzp9bDDsWsbrt5o0i3Eq42qqTs1fx1/ocSdkRBi0+T7WwqhBtj14LzFFL/MHC+kfvOZmLzVbwbD2wuhrqCR7vlQ0JuNd9CZVjkCQZqgPnGRvKlv+6Q0cCr/lpCFAvK8vImLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRPOZ7ruJkLj3Y56AUGP0Zh0GYJppOIrhyh8Rlm3jkA=;
 b=J3JlR6oIy2FIY4VC8s3hN6JX2e78wqOHLc/SgAZmbC8jsW8AASJoSjJItNLoS8kqs9OwrVk2sxCdVdGUFJhRopkHQBWh0sKB73oi3bfRSpCv4CFZi8iVAPP+dmlKV6zTEN8HbNlCfWSirgV+x9Dqsbhtkkx1gEGx5WsCIAvl24Q38t174FH4W8ZfShWvNMINOWnbGF12CU/5rdQcfl/lv/4nNffJuXgq2OjZyC8NkeXdZ+0RdcGXUsm3vpmyQrfTXp6fghg3wwyuiBX5YdJegyjHC6SfveZkXljpADYf5JUHHglp2IlDmWxFb4pEPMOarrAuk1tCEZtOrQKfhRvhpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRPOZ7ruJkLj3Y56AUGP0Zh0GYJppOIrhyh8Rlm3jkA=;
 b=IgLdtjS3kbI0chQwM6oDXPmcS4l/Dob3wjnyUrR09RLxH9g1KS3Gapbzb5L+lBc4ZWruEEy8k7rBsK4wsx5F/d0ltRncDV92/3cQYZbOiZDFUZess5xt995M54DSzhvpgfykaqMc6BdQYpRl3egZMEaDsksnKbFLADEbptxp250=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10199.jpnprd01.prod.outlook.com (2603:1096:400:1ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Mon, 17 Oct
 2022 23:36:05 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:36:05 +0000
Message-ID: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/11] ASoC: soc-dapm.c random cleanups
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:36:04 +0000
X-ClientProxiedBy: TY2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:404:56::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: 794e33c0-fb78-4aa2-47dc-08dab0985bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 69qd3VAf4s81Uj849YvxwLOk8tHpyPJekGCx3Xb6iqsFbP7ZxPMJy9x7KrSos2svB3ogzooeaxFT6kYbAZvAt1BDHMgRrwZhXTowqTsfOIAlWnWd5FrkqJKuzOsoT0JO5JekzCkNRl0mm/1XtO9nnx5nf2otWgz3MKeuNMkzjn5fOmYfWNBMKWY3YpbuiWqlPRgsUBmjXcY45ruXyROLLjRfRZta5Zfqw+nAU5OgJJnT+17tuVKfgMEqQGY43pPA0hN1r/mgb46sAtPe/kkfPaY6tyKNmgeuUuo/lseD50rx2fyHXpWShjKtPpotoTbUPMdYP1slitY4E7SfwG1R+9Z+TpXj9Ixb+pPr45xJ43xyVyITqBZdm8pF1EPEB6Sw9fMuMtnpumrrJuU+Emlfl7G6q4sY9rS2BJQTGTGiHvqeBIt7nKyJvgioTlSGc5wcfWKzbuxRlthOtxw5dfTFjywXhPDj5tEJouXvLVySIQEf2uh97RxIWKUuxka/X9N4F7ovs4PC1Uf1njCxmHhl4EPChHdQy6i35Ar4gDEV0vSA4DJqoaXfXUtNpsJzsFVhJV4oByyo8QqsC2mBOPcGl+C88fu3xwhEiwgyU1j23I7buFMdpcvpMWUrIV6/eFXjeDVRFSjvm0+IdULH+rsLD9G0qUfty/lIMzDzjPF3dC8rRV2mCsHuPvL/vlXrj2qtg/dmCQgXWOtSF8gMybyfjGgUqW1880LLC6pH6eazrdkEF7VoZe3znKuxf9Bq7wkMtmT8PWhiKDpXm3HdQEH9+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199015)(41300700001)(5660300002)(2906002)(8936002)(316002)(6916009)(36756003)(6506007)(52116002)(478600001)(6486002)(66476007)(66556008)(66946007)(4326008)(8676002)(83380400001)(86362001)(26005)(6512007)(38100700002)(38350700002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qoPTnq0MFleDkefLZHTpX/TdGr2Gr4VdXBE/sU/QSOojZs91mBhtOTUvk2/0?=
 =?us-ascii?Q?Ts4a4K9yHA/7BfJezNwYKNjR0H8kWl4ugv5lCZfqPBX4UDb9qU8cZDVwT/vF?=
 =?us-ascii?Q?6lYQtP/ol8UcispxtpAbE7fRdQVlNy/DIWcT/iGQpz8aaQOVrllYBpjtADdl?=
 =?us-ascii?Q?yUuuqmHMmRDqH64EvmRcKz7E7yBvpsz68AEhhRVOACeSpQjMyf0pQtRmEFw9?=
 =?us-ascii?Q?8JHAar9I0X5bGx0qQMqaWXg6NyZ8yEHii8ptC2PNSKeWBUy6EcRJrCCZ2CaJ?=
 =?us-ascii?Q?N+ogbTIFkLEA9Lhm1NyNZXbwiqPDuiHbCjeIRZJvu/v/dyB4Sv12AQumXpHX?=
 =?us-ascii?Q?2NOcMyAdBlU7mCrz5FjhI30gFh1+nlWBObNghBavkVMML6wSOjWu4n6Qy7Lz?=
 =?us-ascii?Q?uylRWHM+9iOV+3A4bK58dfddumUgqnf3ddVAzCxPBaoi9JWfMI41Al8hCBDR?=
 =?us-ascii?Q?QGqPdTB6rBiE2Y/uKCoZC+Spa2rymrGte79jtcq3S8Q5uQf0Y7csgvKnXhgy?=
 =?us-ascii?Q?UQc+KYLqR/UHNqAheqPQH5m/PFTzoxcQnXfStokKn9cQxB4DILCg+ni9E/1J?=
 =?us-ascii?Q?yNd03hkKikkC34inB7l+IGaXjfqwUMQtGa4VcxfNj4TbrzdMMWh30jaru5lb?=
 =?us-ascii?Q?5ndExGIKxuFJ1NJ5PiD5/peBhWu/AUZgMPLjMnLYwCN/YQiMXsKbzsn+yWLq?=
 =?us-ascii?Q?q8dnDgjW+fl2X6bjl8kru3xHQoVLQKN6rtc22EL1tUWl6MZlHiSU6mdxgGcK?=
 =?us-ascii?Q?64bh6oGszjCNdSWRDWAVf7vM4SUEJvTz9FkZAs1Eks7FlaMPJ5ByzbIvDQg9?=
 =?us-ascii?Q?AyYs1ArgAVip+m2FvfQnJRx3tfC1U9pm7KIyOarP5Y7idAvaujDxW530Dfvd?=
 =?us-ascii?Q?Jla4Djc1dOnCpCMTxsrsc+nVeAWCXEcOUVtb2yymO8tvA6Xr0VGP7FjNeDhC?=
 =?us-ascii?Q?So64iWDSuBkc5MUgqulObI26XiWWtm3t/cUL/R2FpWnufVoEUH7LTv3k7+/p?=
 =?us-ascii?Q?SCjZh73JdyeRYzM7v+eZKMc/C20XLFti3Udjm4n22R69BOWCgduFkMZYzus8?=
 =?us-ascii?Q?1K58wj1Q/O+AZpew3PYJ4WNWXDAi8ivTFvzg0ZoosSzynPuUW33KqZ8xUvh2?=
 =?us-ascii?Q?ruR1HSN1kDq6m10Or9xM/UjXo0SnO6ANF0N9mmAkr2KjPh5jzZpSI4XMTrcx?=
 =?us-ascii?Q?EnOSL/V4IbOfAQqjioa6HkTFe+gpUjItfxmxIrSxipsp6tjQLL+LR+SS3Hgy?=
 =?us-ascii?Q?1CcoRTUWdebT/J4G27C8/9R9oBUQ7uue7hRkvgF49pyK1vNCK83MyYFZ8Vu9?=
 =?us-ascii?Q?3F/gJ2zUHB/nZWGQsgT6/hwtcM4+VgD8n4OpUfPbuuaBSkKJ8V7Q0AQ/Fz4H?=
 =?us-ascii?Q?5lMV9+3DZH2OE6Xn20uECO4aFIotoxKiVNP4GAnsmqCTTXWZ3kjIVX5mHRiK?=
 =?us-ascii?Q?Sr0KXj1xDZnhfhqfoYDVWJomfEHQ3RJ09YIj/bZqWUEVbrxRWQ0pRL3RmVtp?=
 =?us-ascii?Q?6ebEVezK/sl9YBruKrR1W/PWbqxHLB0F+ymQKuvTQSrL+Z1yGiZL1vYgTNiM?=
 =?us-ascii?Q?WJHQ4d6UwG/d9slCfZrrWl3E+ck1Pxf7lAdj2uawQCTtyhyiMbI1qse5wbuz?=
 =?us-ascii?Q?Xcl0tc5wGpAuYn4nfemhaCo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794e33c0-fb78-4aa2-47dc-08dab0985bdd
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:36:05.0029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRa8uMJykiUuvx6oPDPqxoi5d/w2Wmap2/Rja1eKlUbmPUcWsz9Lk2Loxme1jIdsGvwfV0NCrM42lgk169Kd5mj15N54sSenmN5w6jU+Zb5gn0EM/Ke+qXflW+6Ao9ef
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10199
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


Hi Mark

These are random cleanup for soc-dpam.c/h.
Basically, these are just cleanup, nothing changed.

Kuninori Morimoto (11):
  ASoC: soc-dapm.c: replace snd_soc_dapm_wcache to snd_soc_dapm_widget
  ASoC: soc-dapm.c: tidyup error handling on snd_soc_dapm_add_route()
  ASoC: soc-dapm.c: remove no meaning variable from snd_soc_dapm_add_path()
  ASoC: soc-dapm.c: ignore parameter NULL at snd_soc_dapm_free_widget()
  ASoC: soc-dapm.c: cleanup dapm_widget_set_power()
  ASoC: soc-dapm.c: merge dapm_power_one_widget() and dapm_widget_set_power()
  ASoC: soc-dapm.c: cleanup snd_soc_dapm_new_dai()
  ASoC: soc-dapm.c: numerical order for dapm_up_seq
  ASoC: soc-dapm.h: cleanup white space
  ASoC: soc-dapm.h: fixup comment for snd_soc_dapm_widget_for_each_path()
  ASoC: soc-dpcm.h: remove snd_soc_dpcm::hw_param

 include/sound/soc-dapm.h  | 188 +++++++++++++++----------------------
 include/sound/soc-dpcm.h  |   2 -
 sound/soc/codecs/hda.c    |   6 +-
 sound/soc/intel/avs/pcm.c |   6 +-
 sound/soc/sh/rcar/core.c  |   3 +-
 sound/soc/soc-dapm.c      | 189 ++++++++++++++++----------------------
 sound/soc/soc-pcm.c       |  12 ++-
 7 files changed, 170 insertions(+), 236 deletions(-)

-- 
2.25.1





Thank you for your help !!

Best regards
---
Kuninori Morimoto
