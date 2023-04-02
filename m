Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C416D3AE6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 01:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B937F1ED;
	Mon,  3 Apr 2023 01:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B937F1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680477028;
	bh=4acIE22/WWWPJ/AD6dQXrj4kyH4ZqyLsUPoCHcFkjIc=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uLoXhw4nD8gIwOIWJBLJGEscY+nDhqNcDViNmSGpVxlOL7VRqHM8k1PUgxnxtru1i
	 +aUBnbPsSKllltckSgywUOsPcJs7O9ktNr45p3x7iijx4ftbKThiAtJ/9VB2a2KVA6
	 /hP2FXuxE85gdJ7r84Wjr0KK2y4RdEiI2vNC8oW4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1C65F80249;
	Mon,  3 Apr 2023 01:09:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C823F80249; Mon,  3 Apr 2023 01:09:24 +0200 (CEST)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87591F8028B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 00:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87591F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fIVbH4x6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgih5UFmQu0Qbr/PC4v0/8YdsgFuZ0SHtVnO7ANHFXZUVTdWbS3i878nlCHJ+AWPCe1E6xpyUPh2ptDL7mPO9x1lrVyd561YnMHzTcqYlY/WxWJyYQnjErcW796QefV89+VJWqbxyca8rDXk042efj/7nT2YLepCnvauEtQNWohwBOVhuq6g8L7xx4mdb+XPSmffilFOkALgnr9LMbFYv6rEQLaM6peq8Na04nmgUcFdvsTVx5O3Lh5oqIutE3+dIsoXVMacfKEYZ6O05/5g9QID0rUh32Dd2HmvVzCAfCc2S/hBQV7RSv7mtMs6Y+VVyGZo/rQKJE17EvhyYCWn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/TorVoqgmMgcow69ZuMt/68uBK2pwf0Ab9Ko0+esyg=;
 b=f4s2vdbpxDI0K8jTUydvQAT9djTmL7W//W0MvlO6d/482JObmOBEIOzX/S0K7Dc5HdhyT7IomwKnZFdfMw73kAIhPEIX6aG8sz0eMYenVm0lzIbsiPEJn4sgebN8O+GVlVd9ubQaXV/mfYy0QR8uFE/CEQ0o8v3rMTS44cU29iIqoDwLDcZcUusrVGB2qWjsa918t/oTKFwI6fSJl0ufEFl7IGKZ4kW8RIjs1U/S+w8z1sOfRl2SVjFdOiiGRaEumhal7kUqVRdoJu+axnFsi+VmCvZSIEb+yc/BSX+bv/i5Xe1etRvb2IH72YWAJDZLDabKlou4Fd5nnh92YoodSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/TorVoqgmMgcow69ZuMt/68uBK2pwf0Ab9Ko0+esyg=;
 b=fIVbH4x60Hmn562UVZpW6K07EvESCMuO10nsKy1wFsvHiVymexebH49Dqm8yAtlJD4ntLyyOjY2oAZ5xDwqSZGgcBn4eCTR1TS2q6wAaacQ5Mi2DBx7iT3jyrOSZ+kZjfa/rHlnqNRS4kK/vCdEB4E4sZpvqlosbPNNKCEZuzJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSYPR01MB5304.jpnprd01.prod.outlook.com (2603:1096:604:80::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:59:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:59:13 +0000
Message-ID: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 0/5] ASoC: clarify Codec2Codec params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:59:13 +0000
X-ClientProxiedBy: TYBP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSYPR01MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: d94e7092-ff93-4626-9df3-08db33cde09c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a1OcykoX2Txnna/GMtEilq1AHxEeaCCttQ8Hy6QE/g1mzbSTeFj8gW7uCYWOU9AponSZs302oPWVHxHtPYzJATYMF6H4yfPRrDGMOKS3QlB7VOj+OgOJ9q4xkR+mCHkZsFwJdiF5kiw66UAUfN7xYwRXApgRnesXNvsWfT/T0pXbJNxFlbiSxyq4jFQe5wAeUGm2HFaBksj2b4iiDuv4f4QElfSthgdq5uCr0wLm5IO9AfcjQFpAj39DsGIjs3D4CjU9aLybZOtmFHEEViBDTYq4YIZzNXp5ePdwgb5c4dKwX715AsP5R3rP85iLlkeZyMlsLOpRmX6JFZEpkbWNBp7VAOmjabjOVNgtULJ6/ccx283q5U4MAl9zsnGff+JaS0uD5brAcr+irZ906JjgqVwLQNC0dnwmXCT/P/JHKVrpgmSRnvkF6A2gxTv9tQucFRCn1MQQsEvIwAN1Ktla9Ol0sSHJ45XTLuNoqpO9limuvd2Qg75oYIwecwZtgvynS2LOb43y1SsdqWxF6glQPYS2DnqqolwaZ1ZCWNkMdJlz1g/GECs8iaiLGIU9ciz7tEAxUUkoe2IzW7i65AaCi6rInmyp2OyL/FIR9hTkl4c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(4326008)(6916009)(8676002)(66556008)(66946007)(66476007)(478600001)(316002)(8936002)(5660300002)(41300700001)(38100700002)(38350700002)(186003)(83380400001)(2616005)(52116002)(966005)(6486002)(6512007)(6506007)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PMPeXQM2b9xuq1omXE0EZicfeySTWg4zIk0Ynst13uN2b373K57o/N796WZ1?=
 =?us-ascii?Q?7WWYwDFmf/M8Vh72R/73Oaxg/9J4AuyqXqill4XRq0RLK30iUtk1Ta0AT11k?=
 =?us-ascii?Q?ZEenrxI0K72RjZU6FPP/JsHoKQZzWQnQf7abhpMlp2nd0I0C6091F3EJqebU?=
 =?us-ascii?Q?qEvVCb0/FbectNGM+6x7fxLDzB/TvXZFvFHzYFFuqd7Qwuv9ObYIieDDkIQq?=
 =?us-ascii?Q?EK7bfTn8FYNz3iZvwLVx/3Qe+iV20HuKW1284hmcCxXk5glnmxXCGwuq92nd?=
 =?us-ascii?Q?/se3+qXqiJ2Xuks5uodhBMjvTFu0S+ekwRUNcIoPjZ1QbrdmHED1uBqiN1Ll?=
 =?us-ascii?Q?XgUbYBP9FmVOLUQHvcwZpAvrgL4UoV4SNNCpoINEU76GPzIm8F9F8a/Ar0g7?=
 =?us-ascii?Q?AFlIvMpGiYI43q0+Xd9T2x1w4TS5Dpn92+zmZO2neKJPEdJaHqrIC0998RMB?=
 =?us-ascii?Q?xUibVX6N0ap6fZcgE3ggE00cp48AhQqesPBDMo6FD7+JqwFB02oeU+CKpCwo?=
 =?us-ascii?Q?JFMKz+aH88r4s3n+yqH+PfigC49cGe63VIK1Ud+LBsRwNNbga7qcVjjAFYCX?=
 =?us-ascii?Q?/0vwcW6mwXwxULPO2BepfVib2Qe+jkGa4rnTYJXhiZ2x51pseMPaJXMkQMPu?=
 =?us-ascii?Q?g/01ECQnI/oiWbhJvP7r+7o97hvAZzbENrVGKmITz+scoTZcItNeb9/7kxPM?=
 =?us-ascii?Q?ypSbuCuyJeUuVfTWNQ27uxzNKE3sSseQ+vxQ3bxpDI1xFU7epLOetRNEAPGk?=
 =?us-ascii?Q?vg47LRMVAFXAzsrK7+86wa9SC5SvuIJ4s6W2AbWnO3jUxUe887n8f16reS/R?=
 =?us-ascii?Q?4L4kGxhZKFSbznFYYzZ+D1+eTPNMnGMwYwNud8xk4Y5ziHYmK85yKnoFubil?=
 =?us-ascii?Q?8yQ2mQAz5skoWJmJtn9lmNKguX347IKeyoyqHWDiOS8+ufxqf1FXXsEBPoeb?=
 =?us-ascii?Q?GO7w4+/Xd+PrAud/XErG3dYVF+Z3kk2bVnascq2h8IhGQMhuUX+aXPkJ3w/b?=
 =?us-ascii?Q?JYl3Uv5n/IEV9FUbDkOV2mIrD66LY89NNWxBguZop3rDXC8tjW2zqOhJEYQt?=
 =?us-ascii?Q?tzpsdmEYSybZYRr8Ngp4Mjj2nq46L0LraUpkDfw5KTtBj7K3zyUXUDP2MArF?=
 =?us-ascii?Q?n0OG8rX0E2onBiiqUiB4BYnjfE2PYUv1vnmIKAC6OTh06qV48Cw8XrGLZX5z?=
 =?us-ascii?Q?OX/rCYrP5LK54iTVZKmkpfbrldxeQMd+gxIbcAyzXbzqywB90n7iubblVNzI?=
 =?us-ascii?Q?lWCrXWgij8aPK5YqRwOa1LpgWSjxTkIraubWt68Dnigzoz+WjE/KAdTS9xD8?=
 =?us-ascii?Q?/DXdGHnLMx6uYTnZYCvP8MLE5soZFtIy9FVeQptkWuu7k0ENO/y5jnz9B2oS?=
 =?us-ascii?Q?TiUef8wAEPaOAY86dRJGpuqyyr30seLPxoZ4VIG5wliL/XJODCzN9PifhcBT?=
 =?us-ascii?Q?FfwhNWdsiVqxHjnuKVnv8hfO5piNe6VM+cZxJ3V94Z3whgwsr+7Uhz9hsRp9?=
 =?us-ascii?Q?zdsTkeoqqddw+eURLcvhPJftOZOR09Fvt3EWGaJOPFKMvuwcf+l5oidHAHRc?=
 =?us-ascii?Q?Gp2EocnCizQJJkLrMsdE0ynfiyFnrVYOWEOch8ynNoBZzRQZf49ypPszxY72?=
 =?us-ascii?Q?2gHkq0MKQ5g7+zlsllVIGvQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d94e7092-ff93-4626-9df3-08db33cde09c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:59:13.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 T4cPHOCGMVuoNHAYgPfwb+HoF7OE/+5+NXI2/3Y9xPFaNThRzOIFa3oQJ/Tzm1y2BJBRDhxApn1QEhLk2tAbCfl+CENumbelE9Kah34LRxApcnxf2TRgrDUR1Z+TwKak
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5304
Message-ID-Hash: E7LM5HICBUTY5WQFVACQA7UC455NKVEJ
X-Message-ID-Hash: E7LM5HICBUTY5WQFVACQA7UC455NKVEJ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7LM5HICBUTY5WQFVACQA7UC455NKVEJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

ASoC is supporting Codec2Codec, but its parameter name is
"params" and "num_params" which are very unclear naming.

This patch-set clarifies it by replacing to c2c_params / num_c2c_params.

Link: https://lore.kernel.org/r/87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (5):
  ASoC: soc.h: clarify Codec2Codec params
  ASoC: audio-graph-card2: switch to use c2c_params instead of params
  ASoC: meson: switch to use c2c_params instead of params
  ASoC: samsung: switch to use c2c_params instead of params
  ASoC: soc.h: remove unused params/num_params

 include/sound/soc.h                   |  9 ++++--
 sound/soc/generic/audio-graph-card2.c |  4 +--
 sound/soc/generic/simple-card-utils.c | 24 +++++++--------
 sound/soc/meson/axg-card.c            |  3 +-
 sound/soc/meson/gx-card.c             |  3 +-
 sound/soc/meson/meson-codec-glue.c    |  5 +--
 sound/soc/samsung/aries_wm8994.c      |  6 ++--
 sound/soc/samsung/bells.c             | 21 ++++++++-----
 sound/soc/samsung/littlemill.c        |  3 +-
 sound/soc/samsung/lowland.c           |  3 +-
 sound/soc/samsung/speyside.c          |  3 +-
 sound/soc/soc-dapm.c                  | 44 +++++++++++++--------------
 sound/soc/soc-pcm.c                   | 10 +++---
 13 files changed, 78 insertions(+), 60 deletions(-)

-- 
2.25.1

