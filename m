Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F01C9693C16
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 03:13:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58ABF207;
	Mon, 13 Feb 2023 03:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58ABF207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676254438;
	bh=+g/Jq1yzEKUCSrdP+RM8qCJxgp/O9+YxmIrX320rcMU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=okEF/NmcSYDOS63R2TDzE3vAV4ezNbE57XHJ6FJH2qZSCFeiv10uEkthYFHIMby83
	 1KArbHfXe+RfwVnDGXf1cnH9CNPwGsPaP7cYEcLtKQIgBkhHRvOkVGh1sWVh4h7NXx
	 EWMX5YC9LlvuXaVfhyAYzsIfnthL3USPhMPOMqME=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 711D1F8012A;
	Mon, 13 Feb 2023 03:13:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85812F804B0; Mon, 13 Feb 2023 03:13:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.9 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF24AF800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 03:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF24AF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OprMf0VA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JM9z7QU2/nWXwrQiY4/Jk+eIlOsUEqozOUgNiuCeaVsbz0lEVRE3Wy2ywE2qJ6qAZpVqtvqEPtewHY2VQF1mOm7XdsssbhlqZsDZesBgOHDzCVSe0DPYiBe14HuT/36d3yFdcZMUnRVEjSxykDxQ8JAHZYyq7oiLuBgMvzN+SdcB1BTGpEmmgBna9A0z5lJYilxENFZo/LbMhUBQ7uo5KrRbZfw5wt7uvmvRZw9B9Z7yNnzH7rAzuSm+e6Q2UFSPAZBiqS7584nCdrGolpD42lNn5cSt1TKhwSCFeyM464FNtwwViwbwUewytF/j/dY2mwKGcFcsEsml21Z1aemE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBUCLIkcXQe3WgpxWocIaZRXSMhSuh3Wh1EmOxLzMAw=;
 b=dnCTh0hebt7yGuORj4DaLrWUGXlwzS9srVJ+wx+WfOZ/afvADyy5I7Qidu/5lZsQxokdwrmlm5aKm8GdkNqPSS2LAGAQCyjfq1UZlsJpHXxFaKKWU/v18xh3REACVNDKwkPTu4hnISkYweXor49jstFT12NXKZFyeRn1hp/0uOPLS2jTlq/AsOHPqSGSDeET4U5CS+5NM6vJq8IdF0EDIUOFm0IVVeCJmwBCm5kogMPZGA1K0im1eOV0uGxqQavP7LCTaGD+AzQAlzfybpoLDuE9T2ORQYVt67r4oVREZowJh9bwVLrTEqQt/d4GnR04enYuqzT0OGjs9eSsime2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBUCLIkcXQe3WgpxWocIaZRXSMhSuh3Wh1EmOxLzMAw=;
 b=OprMf0VAjn/vDw08tG4mYnf/4Wg+h4uCQUFJri9BEfcVce90i3cyC8177R6+l3NJLAxVdrsvYLPjPLLC7lEcs4O4hqN4iRA389p0AYpCpQpYIkUi4m+wtBkHqQwLmidmeuRZRgDmRTefklczhdtzGAeyw4YnFOdPLq8c+JtnnXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5370.jpnprd01.prod.outlook.com (2603:1096:404:8038::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 02:12:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%2]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 02:12:42 +0000
Message-ID: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car Gen4
 support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Feb 2023 02:12:41 +0000
X-ClientProxiedBy: TYWPR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc7f5aa-e675-4451-7a82-08db0d67c9a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XnTlgWxzOsrQcQGbsbGzffzyxzyh8XWOoJpJEfx8oH5sPgDuH98Wx7ovMd0n7P893cgFJ+h/3ECiTdGuKv75XSFDFLo+9ZoQNKWrH4NxEv1BepHJMq05u1gOEV9f6Q5eJQcmpnHuPl/e4FQmtvgujQqLLHchSMu4/BHZl+dYO5bGYPTfWzY8cng8TrTQaLKboLBJ954Kqaq4xfTM3Tan6EbyG8gRMd/0TvjvKYHexw1xp6vz3e9NNT2donVM+k+dytHLigKsx6l+KyVAWQRaDh6gw26ICziMmgCrEII8UfEspItbp+zoLp5MxCR3V/iRZ/i3IPX0OeYSlkTEkm8MZ5lHk7xYWqrBS/UcgIoOESEWP8CDguxV5fk3Gm+NZHC16x5hJUbX6MAWovBHJhwDR04WEpZpxYYah03xKjxW9UwgnRnOsWSstlcr2AzetAMBS2V2nCpNabbGTEzVNVK6QtmPY4Rh2Zln0VrSWCzONSuPU/zDSGly5RkEjvRJDqWLCPNu7lTTSu7gNmETfh6TuNIv5f97TKFyZ0OVUKFfBCqS36g0tgJHFtxSxH+PEnj8Vd5VPollhDzPRi7etvEYtoYP2EyzHaI5sp6g7qafUBz5T4cvAOiDNzoSkN02S89wEWB0MzNYxxNxlMN25LRw4KDrjUKlxp8vdIeJL1CwRiwpZT3B3YOd2arVNO/ABW6h/S96qTVtmlk8rJftmEqW0coNN7qGk+fYVMkU4Eo7pi/g+qOXAsOpwbHKzaZ3bJoXAeV42l6Nu9OuUwPvI2XoRw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199018)(2906002)(36756003)(6506007)(52116002)(966005)(83380400001)(6486002)(26005)(186003)(6512007)(2616005)(478600001)(38350700002)(66556008)(66946007)(4326008)(8676002)(66476007)(86362001)(316002)(41300700001)(5660300002)(8936002)(38100700002)(54906003)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vjI+8p99EmSNZ/4WIxtJjvrdILZnH02OuZBUxy198f6rfc7aV1HpTfasWRIE?=
 =?us-ascii?Q?hCAYxpFMsG24ufjTlYU7BNJxOPPnqOJc6ryZ2t+3NzsUIHPbmrnP81hFc1mx?=
 =?us-ascii?Q?D/+SYJVR2cYkXrEbXbaf8RosHshg3JuYLN1irWe+DogcvKCwMzOA2q8Z25n6?=
 =?us-ascii?Q?FRhLGNrh9bjsbU5ngfurjP7kBfF8QAyNmfF+4X2fTifN16PtpG5tyDWraAfc?=
 =?us-ascii?Q?xs8roB5hdKCRnhbfIVyxnvJwbhoWZW2GwHNxiRmOqpuj2KP7y7bAjwPysY7Q?=
 =?us-ascii?Q?RjahTglZvsJ+wIjcrksHL2DXASCKgIS+inCSsH3mzboMU1ba4AOv+oAK9JFo?=
 =?us-ascii?Q?Z/YVoHISg2olr+JDie64LBxhIjKCIyeMn+m7mJfFKwrOc+Brq72ewhQKK/DP?=
 =?us-ascii?Q?TGlIBYUojQPIKWjkRLvcCO3pQ44ilDsSyndizDXBF7JT3tea3EqdwMCBf4NK?=
 =?us-ascii?Q?BFWxtBoeJqJgSKxVDtkBZ6dynUua7lv/J+zcvTYWDjIWOpF+WILgCav6QzGs?=
 =?us-ascii?Q?UrdY/2jk7vxykWN+5wKPhHHaJky3eAVAjYVqA9h8ZaRE9obDTjEtOfndsulx?=
 =?us-ascii?Q?TD0dUF4VrVQKyIsRXhzsAfGHT5lfxVzbgH6+ng0FYA0uMiUclvjeorhTPkR7?=
 =?us-ascii?Q?C8AbvAcY7Sgot0Ll6cz4D15H5RCj+LR8qMUPwA0x9Laja+frfrWGia4Gtwrg?=
 =?us-ascii?Q?Etqxk7YZbpDE/mqjhCzC+/rj+dNK40yxJc3u3AMBO73Ck7DOX3J84DhVeaZC?=
 =?us-ascii?Q?yWVjk2ctAczbNLQzuA45wuEsG8q8icmXAYZuJ+ph8o6P0kvO1Av6sdzANqIg?=
 =?us-ascii?Q?+V7jESzj1MF7n+BVe0Cv2eiWs7sEX29fonnKZ9OH0r1QOWFVhQOk+tUhEY9Y?=
 =?us-ascii?Q?FOfBRQqNbOnYerdR5dZnvF40r8vX4wCbdqlGIV39STuGoewUli0m1C2AKF7b?=
 =?us-ascii?Q?IVH6Dan9GYWSmdAvTudLF+ephUHef2kx2RNsbZJ3dM2HaBahpX5U77QdWWtM?=
 =?us-ascii?Q?gsYB/Gi6XQekqYu2/rQ1Wo4nOLSFrpO8ZHjh1dPScm2gLmRfixVP7Pxvi/9s?=
 =?us-ascii?Q?uIs1b/AmBjaakF/ZFocOsMQnk+KFMDmRehRvmoMEJbNvUe8ED6Py7GAp6dZr?=
 =?us-ascii?Q?L/3cvgErZ8zBkQDIAKFsBgkJq2bhKBzaWPdMr1M6w+TouiUr0MUBLRZmPyYT?=
 =?us-ascii?Q?2h3Rw3EiRCwUGwL78XXUDJ+VQt1SaFQpOmnh7g0EH17r3eUES+m58r00B2Vh?=
 =?us-ascii?Q?DdXORagl5AJcyZbUssImYBIrDato5HXH7S5JzoY0PQdnXn10ev78G7dgVMgO?=
 =?us-ascii?Q?IlGavN9UQTCyORbTM3vueriTVJkQpPv9dHB61igskjPX2pja2RdGQtAds84z?=
 =?us-ascii?Q?srpISwsTng6z8nke5QbN3NtZigNfF1iVZRXxYdj175sMkQWJZmNRsDqKKsXT?=
 =?us-ascii?Q?3md2evqjt1HoIlcfjYzcnkjGX3hVlAsuBzitf2oStuulYHPkLOgZ02YaOKjK?=
 =?us-ascii?Q?Kqnd3cFq0wg/WSWGPa7kIB2VkrLc3qX3AqEZv7bDoiL3TSBIFN7NwfX+OQzI?=
 =?us-ascii?Q?zv1DvgyHdh5tt0tLk2PpVsfR5qW+e5EVNyUiSP+04aLu2AGNETC53SZ+FsI9?=
 =?us-ascii?Q?N9xg5W6VU/O3BnDEwzV/Y0Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7bc7f5aa-e675-4451-7a82-08db0d67c9a2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 02:12:41.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hbtOa/xiunNE2puzQHDY4bBRsJP0vyA4jUooTb6zOSVPLMdLxSgDxIbaBIXYj6t2nF+MgFZHIQunv5pZT/p68JHvpIlyajTTxEloxlEVZ4WX/aF+hyCx2AsshltUsqMu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5370
Message-ID-Hash: CCJ7FT6IQ2WZ6N3HICHBOEWIS3DDVVKX
X-Message-ID-Hash: CCJ7FT6IQ2WZ6N3HICHBOEWIS3DDVVKX
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCJ7FT6IQ2WZ6N3HICHBOEWIS3DDVVKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

These are v3 of R-Car Gen4 support for Renesas sound driver.

I have posted these patches as [RFC], because the schemas
doesn't work correctly for me under certain conditions.
"required: dmas/dma-names" always hits to "if-then" and
never hits to "else" for some reasons. I'm still not sure why...

But to be very strict, actually, this schemas is not mandatory,
because SSI has PIO transfer mode which doesn't need to have
DMA settings.

This patch-set drops "dmas/dma-names" from SSI for now,
and ignore the issue, but it is *not* a wrong schemas.

v2 -> v2
	- keep clock-name description on top
	- tidyup git-log

v1 -> v2
	- tidyup Subject
	- separate patches (drop "dmas/dma-names", add Gen4 support)
	- minItems -> maxItems
	- more git-logs.

Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com/#r


-- 
2.25.1

