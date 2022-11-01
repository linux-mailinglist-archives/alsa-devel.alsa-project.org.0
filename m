Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C57936143E4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 05:23:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A3B3168B;
	Tue,  1 Nov 2022 05:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A3B3168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667276615;
	bh=CF3pQikPja7g9/Eccv40FH9ywly7CLJ893Lz6Kf0Jao=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CsgUataCwz/DLBtzjVkxQvkYc2GKWin5S/L8k6EM/nadFSTc2jad5oHj+58/ZaOQw
	 9rhquoDCbkT98v54Z+AuBcGzlBJOgWEk1ymyTeSfl5GGk2sbZJp/x8pt9fuaZGrs9R
	 cCIK4l1zQw+A95zG7R1nXkunpVUCRKT2dOlvKUHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4124F80557;
	Tue,  1 Nov 2022 05:22:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C512DF80552; Tue,  1 Nov 2022 05:22:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED206F80249
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 05:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED206F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="bm3owdjh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCJqxbs0kUUTP2KO3o+JY9fjMjKT1WZ3qMF3e2lgjCWA1V1dGVt8iZ45mWwdnuPmGZrOwuoYSqKdNg6kMn0PnAZgQEdCBhdV4+7WwQtZGeenKKIsxtI2GvOslMIAimZxxijh4tQq6v/3TXRqC9Jpkf1MzVboYBO9u7kGPL65T0yljbOT++Oo08zXuoPzTA9rYV1v8+tfNL8DFe+EuJt+XUMR0ITE/p/vdmH5pfOUmPM4Ud1TzltPgt3FtH7mzGGciUkPCa+En6Ah7YgpKC3lbXvIAAkVZSi+7XpMKLYgKAgDmrrMO09IVr7hAEHAHcgsPRyetRu8HVyU9uaQ8QzYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU2SiDWupIE5Wv0abfh1d08/oNCZcmydXdPANylfXbQ=;
 b=Hx35kMnrCUoX9ik1nVZZHZKqQG8BzA6O0wf1T5B42XxcuHlRTuHLgMfDlAKFLqE2YRTHpfkljm8xz5GnPZkM5VFbj20uYn8+w9Y18mjtc5bYVWOm0IfqOJWHK0udZXDdAXR/5LxlXSRsjuemFde6S9HnacFxe3EXcldaH8pwVe5Ujkpg3C3VOT6InAd0j57Bo/bylCjcklR1ef5XkTprpqaaB0Pz1EEgC7Y5UjKL/P+06g0C+NHK3MF0y3DGufS2lSxac0ZKPv6xRyQM6EFEm6zF8bUPX1fsgf4xG39SV+LHmv1q4481pBWDSP9e+Wg+J6dP+RgDkKC1zFVlDET/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AU2SiDWupIE5Wv0abfh1d08/oNCZcmydXdPANylfXbQ=;
 b=bm3owdjhH6+PYxogjF+Z3SaRlh9rlvDq8vPpoXSpj+1+2ZqaHHywhFOk88+hmX9tBvWmgKupnfUYthUcN8gq0inHEsG6tUMKyYAUnxVOGKgyxVFOIts67HsRczZ4be1H+mt13fE+pLw4IWRKjUCeZOQ069yXjaPrkH5/QHiEkq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5783.jpnprd01.prod.outlook.com (2603:1096:604:c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 04:22:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::851d:9051:287:bac1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::851d:9051:287:bac1%6]) with mapi id 15.20.5769.018; Tue, 1 Nov 2022
 04:22:27 +0000
Message-ID: <871qqn8fst.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: audio-graph-card2: check also dpcm node for
 convert-xxx
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <875yfz8fuq.wl-kuninori.morimoto.gx@renesas.com>
References: <875yfz8fuq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Nov 2022 04:22:27 +0000
X-ClientProxiedBy: TYCPR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b6193b-0e27-4a6e-2161-08dabbc0af19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8P819hDNQrnEovx9wboFReELFk63pZ429zxuzhex4nZkO4K0uZJOi4J5m18vyCGt+3nrRXSwM4c1dKf1E6t3mp4b1/8DVLl/qh0d0QSR32pOmlLVTjuZSXkNho9jvhlNJX0NEaDPfKWe/pxYb6lpuWNRLLlCiCCCy3nGW23NYQiO3bws+k85K9QFCuoJHnf1G8UjMjGNPz9keon/p9lpvJyqIohuPtIAtcNUkY4EabMQTfF0IrKfR8FDFwUOMF1/+bByayCgRAzuZMBWodHWiEppju99tTiRMnj9VMc5MFNmhphaCx5mRqiV0z3UijHK24xhJmj5dofJ3INRlWbLtizMuTFOKULjnoPMMYlV8F4qe3T619g4ZDiPp49rmN07eqhZx+JCsfLyXV/Fij0DrYlj/lVs5gS8hk/dA1jQHPdUiH1VocicbVTq17FjzIjWo/OJhsjV5nLB7tsHf1hQBDgjxLLPjOOgt3Ugo1kfF/yZePHVrKtJ4rBqrtYS4MuAuTVfky1cmvtTYmpu+1aLClbz1IjP/Lzor28vmUHtiHRwSTrd2/Bg5HFV4NZrSn//o5UCnOQw5Lu2t2EmP//PJRRw2Ai1Ti3Ntw4p5w2PyinKoPOUwKts9t/yzptYt3H0N1oUP8OQ+OEOqHG1yaw3KFfYT+lq98wfg7mEXJool2ufaA/2iFT5cgHMUJXq8XTyAaOlOm3EkysCx8n/MMDqnj8By6WkySF090WsKtdMtIsmbrmUbhBTQ5hfmuQlli24Ve3wWQnEmHI4VqLGROP7pcllTmHL8HTEBsJ8mVyiX/4bkEFadEccN5sIPGD86yTF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199015)(36756003)(86362001)(2906002)(83380400001)(8676002)(6486002)(5660300002)(4326008)(41300700001)(8936002)(66946007)(66556008)(66476007)(6916009)(316002)(2616005)(6506007)(478600001)(26005)(186003)(52116002)(38100700002)(38350700002)(6512007)(13513002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U1ESBpmOlEdBYnD1yRmyhd1jlec0bePcC56mLp9v1GgIBaPo27+p+dXdywnV?=
 =?us-ascii?Q?rs1HLesEOsouLDcA8dTUk1TUJBe2HGbCZQhE5FmWjMnxDoLtkh5W/BakrA7F?=
 =?us-ascii?Q?Vi1tiQZCE4OKcoS+1upAy53jPWKoK8cz5c9jRrEGX9B/j4i0/v6xbsuFNiUw?=
 =?us-ascii?Q?XiC3jhwOyMyUqYuY2/b5JAqF+W2GIwsxPeufAPE1GT5Rhlu2OX0HD2B2fsNd?=
 =?us-ascii?Q?XwC6lT/dxtZ8TVKO2d6MbrDYeav7+TT8nelD8hbe05fYL16uT0nek5Pac5Nl?=
 =?us-ascii?Q?NoSEnxNKKr+BWEhF9OssxB3RxSsAH8wiOM7Q0avBI0Ci7ikS3ix5g6nGBeZQ?=
 =?us-ascii?Q?s8aqKrDc+hKbwQo15zmQFqSoTSap4arCqplLM/aJUByYZdaYJ3RtB0R2UGN5?=
 =?us-ascii?Q?5Sa6yvM9GPwJXsiseJrKVBwtEFvZaKsCwS1ypweHcxCEhL43C8G6M+Vwyqgr?=
 =?us-ascii?Q?Oyy0fbDI8NC4pA3m2CikF0TlSeb6xX6UTkC71CLu3dwWw7MkCDm5teBDJYNU?=
 =?us-ascii?Q?pNVprIMYGXi3aLHfV6CLq9Z1u7Jvg1VzeUEIOlu/BxLxnfkEF2IXlpdVS7vG?=
 =?us-ascii?Q?VQYUzs3B97eZ+65GW6a+RHvbIMCOzkxAEu9XJ1Qa38dGnRyJseBeQ4ZI8uot?=
 =?us-ascii?Q?Dec7z+W/G72RJzTVzW5efzSStKObEy6Oz4xE4DFdMHu+TS4r2ax0FoQsBacg?=
 =?us-ascii?Q?PDgs3H5Snl04kwkttxHD/zdKpS4uWWMJmGnkYjHYdzxuzFezVe18tXtSh3nf?=
 =?us-ascii?Q?bHHhf1eBYytVSK1vZ5Z4hlQoARfEWhrd5+QW0Dqq7XkK4cxzYoAD4DwI1/ae?=
 =?us-ascii?Q?QWlHwg8dWMLsTqfhT73ncShPgyquXQ+5lB3n2SXH7epj0J0J1+QJ+foWUo61?=
 =?us-ascii?Q?EglAApljCTQI0yhkBVbnqTLcwTmA/Zett6HdKfWqPRrMlpB6B3AHuD8xKNbr?=
 =?us-ascii?Q?/ZR3DBQzdJ/HETJ06zVfxUvv+pmxOtWYgjRxTqM+LpBe/okhKnF5UmMhXOoV?=
 =?us-ascii?Q?eKJsnStaqEo/xCgh2Dti4Tl7xpt2Cd9reN5ZCuxB/O5SlXg6x4FA0wbD6NdM?=
 =?us-ascii?Q?55bbtSDLkSLicdy9zUVpHjb8VQyHB/69XQfDiwdLRuLJcA3MKlc9wvf12vVN?=
 =?us-ascii?Q?IhIWEezEs9n4xBcjV/s7RTGO4m47Q5j/lYJ3VIMmTS1PjEOaEeiOnbGMNfFx?=
 =?us-ascii?Q?x1gyFPvz8xfxzTce4l9vbtetPlAzEJUVHcRurDoFYJJ4alkVP8BRmR1UxvBz?=
 =?us-ascii?Q?bQys2rRPP2MlyNagjOgsCXRPdzSWgD5GtBHpMhdc+CZYQClx8yolGDl8fDyY?=
 =?us-ascii?Q?7w4NCvLCdZEOWDOqvDgOnRH/dU5eZii9Do4J16XTLXOa3MSvbmmwhYea83Hb?=
 =?us-ascii?Q?x2siOkRYJyihXx9Dg6Qu4yYT4YRhsnECNulMhh8AdUr4wQzvUqhnrly1DJi8?=
 =?us-ascii?Q?xbfyd0AFZc0N8A7h3VKPoXGwmB2hFTqygBmFG97YEUYpucCOXqWYNyaxOyuI?=
 =?us-ascii?Q?Mq0yy7xfbfLrgdUkGyxMrnRNatvrPhp9G2AwzxRzIZUweHQAMy6aA1PCuIYX?=
 =?us-ascii?Q?PDS/WZyfkpqKhTU9jAjhohxGoDqf05WzYaEMketUeIjTytIS6iGP+wMRM2fy?=
 =?us-ascii?Q?479Bn6yVykbNHUHMCV96LPE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b6193b-0e27-4a6e-2161-08dabbc0af19
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 04:22:27.3058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKTZ+gs3ea87qL+QGrm9iHYlRiCbMl969MMOFpNqWtKw9HPyr2AzfV8RMPpHRrZmiMDKwOYjG3MMFJOlwtzqBMWkaPQHgX832dLGQ14WUkrOuMOfK+OEGmLRwslkZIcR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5783
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

DPCM connection on Card2, its DT looks like below.
Current Card2 is checking (a)/(b) part only for convert-xxx settings.
But it is not useful. This patch enables its settings at (A)/(B) part
too. (A)/(B) settings will be overwritten (a)/(b) settings if it has.

<Image>		      (A)	(a)
	Card2 <--+--> FE <---> CPU
		 |
		 +--> BE <---> Codec
		      (B)	(b)

<DT>
	card2-sound {
		...
		links = <fe, be>; /* (A) (B) */
	};

	dpcm {
		/* FE */
		ports@0 {
			/* (A) */
			fe: port { fe_ep: endpoint { remote-endpoint = <&cpu_ep>; } };
		};
		/* BE */
		ports@1 {
			/* (B) */
			be: port {
				convert-rate = <44100>; /* This patch enables this */
				be_ep: endpoint { remote-endpoint = <&codec_ep>; }
			};
		};
	};

	cpu {
		/* CPU (a) */
		port { cpu_ep: endpoint { remote-endpoint = <&fe_ep>; } };
	};

	codec {
		/* Codec (b) */
		port {
			convert-rate = <48000>; /* (B) settings will be over written here */
			codec_ep: endpoint { remote-endpoint = <&be_ep>; }
		};
	};

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 8ac6df645ee6..e34c3433d354 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -849,7 +849,8 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
 			goto err;
 	}
 
-	graph_parse_convert(rep, dai_props);
+	graph_parse_convert(ep,  dai_props); /* at node of <dpcm> */
+	graph_parse_convert(rep, dai_props); /* at node of <CPU/Codec> */
 
 	snd_soc_dai_link_set_capabilities(dai_link);
 
-- 
2.25.1

