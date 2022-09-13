Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA33D5B654C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 03:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3242416F5;
	Tue, 13 Sep 2022 03:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3242416F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663034258;
	bh=9RKqDQ18u5dQsegb4UcYsRJkvCllr8UV2i7Eqa3yDRE=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kEH5KJAK/miU1pZTzbZGwuvXUJDJEk7ouJlzRgzxilcgoIPyBUri8lr6jwi+NuvCS
	 DCVfe3ojfiBEVc1Iv9RvZQs+CWA6uTlMe1kcM54hyp4VNhu7SNcmerQv+eQCsQIgiG
	 pcDlubHWPUkjr2IKg/13X5iLw9fFqqOBAQTUG6u4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 919B0F8025D;
	Tue, 13 Sep 2022 03:56:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31D26F80154; Tue, 13 Sep 2022 03:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B1E6F80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 03:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B1E6F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="ZBFWlJMs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6Phumi/p1KwlT2R04E+OMO9hvGPbsaZe+W6Aj+G9WBCcpCYsyEYpACa3+CWwMfArNw5gZqNBPos+4cTtXUR9QoEMulBU1CSsg4hlGjwDTkXQKqIMh3JwzQWNEOrnkP016kSg/J3I6gIV2jzFdVDkj4mRaeyYaNDfafL5L9YAkeKWv6pO8o+1lcQ+x6Hu/e9qC/nPE8j7bhW96K9S0ABRqJAORlp7p3CEVerA5PexPBQLmxcWjohS06yBhiKEcoeu/PDMWvn/+LW25b1TpAl014q8dBKeWrq+KacPN+efDMOkqRbifVwZBu7u+fNbBU5kavVUcjp1j+e0/CMKp+5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5N7h04ejXDjFl2dswaaN0HJWqbHxPDLUWv4O4HOUdw=;
 b=R2H9r4T4xIZGZ2AwBXMyQakjx28E3RWAtE+N0Bgf/+I1zaGhFxhRsHSgrJPdJWgXILX8eimCWe5Q6qpyjKEUXYfqn1HpuSgcd3zNujyBh+mOEVfMK/q6073JFUxEzVRV4ckw7T4qVKHmTxnE1zZYOBuA9zkltMQdNJtgOV2p4Zar7fGbO0VQ7vckTdpscSy5tFSuIcDIKiRH7lz689J5+eIlL31/STMZ3wLWZH1l0WRIrM+8tO9TTff+qmNRmFYxM9XB7ytjpGiMdeyqdyTuLqgLrZ39dygoW+LLbtk0CE1h9jwMZFUBCrTKfUxyTXJ0S0oPNVUM8z+hIG9hW+cdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5N7h04ejXDjFl2dswaaN0HJWqbHxPDLUWv4O4HOUdw=;
 b=ZBFWlJMsA0cJjP3t7NfBAbLLplXul/f2d8VmT+y32xmpGBQjNHSWKRNsf4T0TLZjB8vV8GRLoFz2yBRCBh9oZBmujAiKAwp8Jd8Y1TuFQR1IwrqI3NrOqQcVTfqnpHQ3gylHVZL9arFeUq6D0gM/AviC8pwl7gTCXfcNbgGHdkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8618.jpnprd01.prod.outlook.com (2603:1096:604:19c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 13 Sep
 2022 01:56:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 01:56:26 +0000
Message-ID: <87mtb4596e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo.c: use devm_kzalloc(),
 and remove .remove function
In-Reply-To: <87v8ps5gji.wl-kuninori.morimoto.gx@renesas.com>
References: <8735d1mjf3.wl-kuninori.morimoto.gx@renesas.com>
 <1jillxc5en.fsf@starbuckisacylon.baylibre.com>
 <YxtpyvC/f6of8scT@sirena.org.uk>
 <87v8ps5gji.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 13 Sep 2022 01:56:25 +0000
X-ClientProxiedBy: TY2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:404:e2::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fcf6ed7-83aa-4a19-852c-08da952b2ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54rsgzxT7zldfUJtpiQRT9BVcOzIoJ8qX4zD88kvtQFTSm7cn/VBtC68BF9Ps3mhZEAvd7Smaa2gfi5jlf1URJIPVnEx7jvf5RX5M2yQKCyU4jiJ9hBmXg9RUs4f2t6N2HF3/Sdsd2xBGZmMR/6fP7VPtoyc8+6ZuMtiLMhDwPEPZlmAoBVDRXYh73sgEwjBeD4eVd7zZtAI32VjDZp9N6czzA5p0BFmKoCmV9sUFdBM2v8w1vSMifL+KQhGXKOaRwzlYhL2oWfw3b69VCTgHwnRv3LeRu6ck8BhrmRViCwxjIsocv045+IkDf2wtp5qTGVBFi+K3hKDOw+BnyHYdmS0UXxQXGDoVTJuw/+/aLRK2iQ7/CZA/PFUYMWXqU44kOareqjypdHPrXs/r+qGDhnUbhmVf0R9vLDkgPuM12Dxtdk1Ybl4yGip3Bfr6WZOT6QdtwUhdaQXpNrOHGBekGKi0axJZzJ4VLnBo/7swaO1K+iY4qv9ooioldSbXX9x7a9IJhofDNVeGWtdOXqGU6ihkULQ2jetTT3TUXjW9XHK+Lw8wcCZBGKT5rdEQCwjKmtxQXU2+cyJL2U6BJcBg5twM2ZvZYs3VhaD2ehKGi0NX4K4n/Z0Gj33xmYA0jsIypjqOQpM7yyIiF9Gyb4hIS3JT/96a45ec/GZoWJDrWwI3KAhPf/iVhMZfe5UL2X1aKGb0mrpaIX+6A4NEqKnuWYTOv6dGl6WvrnDJX/DVUKxZE4HLhUb+hmEWX0GTiqWOnlpqMB81zFclnR9tmzfQL+ul0iI0eMZUxK3p67j8oU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199015)(2616005)(86362001)(6486002)(38100700002)(54906003)(5660300002)(66556008)(66476007)(316002)(2906002)(6916009)(478600001)(41300700001)(66946007)(36756003)(4326008)(38350700002)(8936002)(6506007)(186003)(26005)(6512007)(52116002)(8676002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pjGVuuPJJlfU/KknnqKr3GlmsGKphY+51Tu/5Fl+FyU6A9bY5zYw7G6xclIn?=
 =?us-ascii?Q?q3aDPUUzc+5gQ8Lwsj8nRC7F/5TzpGv0uAtIVB55NOhyauOsgGsgjgj9IZeU?=
 =?us-ascii?Q?Uf8dFir6TJ8ZA4lcn+Ew/zhCPm3bSS3yb8Vq9CqXNDZppXxIRfA3PFqOZKwW?=
 =?us-ascii?Q?+aPjvy3jSIgaYJPHYMId2csWri8dMzilE+9xBcfl37pBeWoRnf71MNV3GkRx?=
 =?us-ascii?Q?CxbHzTisiZKRhdDp46MxSKVM9fO+X6wVvKP7ynvYPueCYwR2hZG+vKwkiUpS?=
 =?us-ascii?Q?wjutgsvM8zlWJLrFeezpi3U9Ikn5SrcvvEjaiqr0wlxLqkXanOEGFNDGFxab?=
 =?us-ascii?Q?7ie6dw2vPonEL2Thw1jeICt+FVCgJQLugJRbXUq4nVVhXzOXHmGPU222slcq?=
 =?us-ascii?Q?f2NPxWrGjDfA41GcXFWYi7deaXDlYVvZao0TZK8Dq93ap+rgTtaQQ1IISBPn?=
 =?us-ascii?Q?m+TTOMeZHqcTdVr2oyNJP4sVoLyFn1yaeKAyGXoookwBomO1HcU7gw2qkp7T?=
 =?us-ascii?Q?yCpzbQx3qZvNgPxX/JHwewCVs/Ntkv/U3aj2jVYwF5J2bCy00HUB/ua/+hYO?=
 =?us-ascii?Q?6AGt10w3BwpeJbIIeoPFKQPdAF9jf49F/SxyTCfMWusx8a3ch3lhTHqhZ1Wj?=
 =?us-ascii?Q?3KUez91T8NG/+hW2K4cM6e80zPNvLcMP8vN0g1PoU6HHY22KKytX2JN6012q?=
 =?us-ascii?Q?1b5TpD48ih4PoRXV2pEmZXTJKalnEld1jpAU09ufeOPdobo+ra3QNk/bdidy?=
 =?us-ascii?Q?UJ0KqOwFK+MN4PhZkTrXr5KoxbBFAH7G16rsiMPE4RK5D/KaZgoxBtryR0OR?=
 =?us-ascii?Q?xDtuzlli/yAHOICsAcJcQ2ZxFwlbZw9xYkvx1n3Lu9DfaFktsMUxnnc2EtSQ?=
 =?us-ascii?Q?ycNWSBx3ylM8zhyAn89T060qGQEaEHeTfDn2u2scSR/2Ge3dCe9VhIP7qIVw?=
 =?us-ascii?Q?CC2zUS0Q5FkWQ2kY7HT98gv0wfbOdsURHpdV0rbptGBCChD7hoISxmBb9DvW?=
 =?us-ascii?Q?1jvqBcRwa4IpIIbtnRYU0j3LiKM2Me83YfETjMTTXxqvc1xPcXsaSqwPDqT4?=
 =?us-ascii?Q?VaGqQd9anzdFRnDuzuo2NqobGauyhKR4+vb+mClSSkps9KHexyzeH/HX3rmS?=
 =?us-ascii?Q?BfBPFHQNdmFZE3QNCDmf5iEf/3JQRaj21L6BdgHZawyxRn466I+od1ta8HRy?=
 =?us-ascii?Q?qpEpb8tTzhnqQfV0io+CmvMd/gHM/bRJrPJIN91UUtfPApOYfVZGOxS6mJj/?=
 =?us-ascii?Q?vF5pa19TOwAw4Kk4WA8OmYSNg0pPGd8ASnD2SfIpoeyTtkh5UGldlmGo/fjK?=
 =?us-ascii?Q?6MMP6ATzN+xqV6opSleV8M51oCv33qS9BNioTpK/FAtatfBQDC7eqvVxtQqn?=
 =?us-ascii?Q?Ewl0cGHH4bYeV3pyHTTRo8rlOg4UsYKwsXNunpQS+rrLpfyqH3dysOSBQM0/?=
 =?us-ascii?Q?0uIQKKWZWOA/XlQk0WlvVOLzJCYFZ9UxNjNisKIAVLJqqibfNm3hDF5Z6k9b?=
 =?us-ascii?Q?bAF0dz5wHVjfaWAZJ/rvvZSOJ3jBKXBKjFvkLBz2PzjkcicCnn89mNG4RXTg?=
 =?us-ascii?Q?0ccE09N+mPbINKIxXmwRbHIVazokkVzwH0BNZS76O44ZuZuYAQis63DLdDp0?=
 =?us-ascii?Q?tuptZ6iaCjtGPpJ4mmPOqnY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcf6ed7-83aa-4a19-852c-08da952b2ada
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 01:56:26.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6zzqtADLUjOqErmWkfvR2ig+hMZriqWHIcAPMiSqAfxbQjNsnUyblzOV+TwPiSFYH71DqDZQiG6yRg1jg+VAJVKoDdXwQqSH3aQEaWyx+gmt92s9JATuDRDVkfuDJql
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8618
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
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


Hi Jerome, Mark, again

> > > > Current aiu-fifo.c is using kzalloc()/kfree(), but we can replace
> > > > it by devm_kzalloc(), and remove kfree().
> > > > This patch do it.
> > 
> > > I'm not sure about this change Kuninori.
> > 
> > > This is the dai probe, not the device driver probe.
> > > If I'm not mistaken it gets called when binding the card.
> > 
> > > The components and card drivers are different here.
> > 
> > > If the card probes several times for any reason, EPROBE_DEFER for
> > > example, wouldn't this allocate the memory several times without
> > > releasing it ?
> > 
> > Yes, indeed.  You'd need to move the allocation to the device level
> > probe to convert to devm (which *would* be a good thing to do if
> > possible).
> 
> Oh, yes, indeed.
> I will fixup it in v2.

If there was EPROBE_DEFER issue, snd_soc_bind_card() will return at (A)
*before* calling probe callback on each DAIs at (B).
So, I think calling devm_kzalloc() at .probe is maybe no problem.

	static int snd_soc_bind_card(...)
	{
		...

		for_each_card_prelinks(card, i, dai_link) {
(A)			ret = snd_soc_add_pcm_runtime(card, dai_link);
			if (ret < 0)
				goto probe_end;
		}

		...

		/* probe all DAI links on this card */
(B)		ret = soc_probe_link_dais(card);
		...
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto
