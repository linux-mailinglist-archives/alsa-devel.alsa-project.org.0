Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B818687221
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 01:00:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C2CE1D9;
	Thu,  2 Feb 2023 00:59:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C2CE1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675296033;
	bh=VS8RmHSb7+dv+XA5HAIteS6s4wRu3CDfziFzJVICuiI=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mRfpeNI4eQAsp8o5+gYw6OHLW+0sbziwEC3y85PChVrwJ/pj8NzOmUWGbzhYlNfqu
	 6w3Nl6/CMnx2CwKl2BEujfhMRWrGDNAkM0ajhhcXQ06cD5O89iEOAdj/RnADdZfh3A
	 XXv4e10adHO52RjRsvSKl7JnIDJxCakoP5ameZuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F4B6F80169;
	Thu,  2 Feb 2023 00:59:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ECFEF80423; Thu,  2 Feb 2023 00:59:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40062F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 00:59:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40062F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HqOnfiw+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFQ4k6VbSRfwUA388PEjlWYF2wVJig+6R2jwWt638y6fuUbUJj8wOVj//LxlaTe6B5CTLt5ZpoZv3x6DKbsT/EakGGe33trW9UISiWACgO/OV/lvQxEikoEYc1pR1w4caO50qcYcW6ZjEEOJlw8QTGUBkvuQYXjyoOa4yraONQddNtFGVklMVBEOXPQxGxS0OprX+0htvu6EzNHy0vWBw6rWHHUbMRpraKyiVS2hxbOzVHNeJxJukz59MjdA99pfjmak/np4hFrqm8TeqO52hXX8oTEBXwy+0jtILA2R3pqxWKrnTC887YNPPYB0W8DYP+3H8q+mzEnGBFPXzdX8AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OMIH87/0KYhN8FlAev4ab59UnrMhygOqDWAutNp66Q=;
 b=Xpd+ODLyfwUpHzXN3Yz8FC3+OuZmh8/ydoA1jr2YFfD9iRolrBKsohM1fDAJrP7gEmhrcU8eLYW4tnV4Zu+frEnu6aPxcks1qvkruKilNLHHcem3j2rg/gCeCdmpUw3m6soiiR/HdbqARqtkRaB0Qk95/LyYf81fKlJjwINs3Hy58gRAdLTNEOYAPfKRDqIxmsKvC5aGdLNuetVgx75wWgHeEsxJYY5MGB9P2IHlHfUreh4kT4K+AVug5NoEFCpNjD+NV9HFfSpJAK0Yz8vVfaXgqYPW99dbBMi/A7AFIqQAUv3YdlMYOSdlcIVPIhzKf1iNv+dXhc/rS11JscpyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OMIH87/0KYhN8FlAev4ab59UnrMhygOqDWAutNp66Q=;
 b=HqOnfiw+Am3VZJlSyaclSxMtHvodt88zymQpZcycrKAcprKRAGZSswvdQcJi5C2Y2v7KtD/a6WFZZbpveWIbjsifq66P5mfJ/0sUBIc2SZy46uaYuCenr7kQwIVJL0CFXhx85VU0lkq7NmLjsFteERASWNPrHS8HvR0M6/C9/do=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB8120.jpnprd01.prod.outlook.com (2603:1096:400:fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 23:59:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 23:59:13 +0000
Message-ID: <87h6w59bu7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: topology: Add missed "else" in
 sof_connect_dai_widget
In-Reply-To: <20230201112846.27707-2-peter.ujfalusi@linux.intel.com>
References: <20230201112846.27707-1-peter.ujfalusi@linux.intel.com>
 <20230201112846.27707-2-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 23:59:13 +0000
X-ClientProxiedBy: TYCP286CA0102.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 99af7a33-70ad-4732-d19f-08db04b051b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GY9jSZ3r2HJJf8nJisP4A+s37hiQ7D0G4DcgDOZJA4X2uJyiLojvBbUI44SpqHwIZHzjfpDZuGD+sJHv/ZTx8M7b/gl+Cfcb56VEq40f6IFJBQ0360dW/X2d1d+t6Y79iOeU6RAvuTDnPMHhXyhhQ5p3IUlQYYPnYy8qMqhP5i+mLtjDGlo39b7RJEfbTwir+A1QNeuMRsuLpuYmCY2aEz+bFdsYNcrcnnoTRnT5Tq1IQiOy/7acVfsqP/EnNflFIij9L8YropXrc3U1xf1I/ZrdvUDmOot2wj5xLEkTwyOqp/7qeQsu8EZaiXJ6sQHfTo25ej6TiYaDz2QfxZc8ykJxYz6aBx45xSTNbkmJN67YOM50JDKSmEnKvMl/QqI1nTN1AcdrAY5EDAkBauX4bEovMpKh0/xUrxht9owLKjSJKh0EF+8IXGcCLeMKkd1kEgsbt5ZZmMU2xo7QpmpqqbcNomCoOW0M96wFTbVt/C09yUNCP/0REa7n+SzrCMwohbwPq0GtWMZURRFQKKg0YsOrm8wJsbVlOJ0//X9YAJR1u2VkmJhntPSELE+Aex6x2/7I35UjOzgYm6yae0mc9Qqfofgyh4cVHJeuYTEtmM0sWs1BTKjU0IO2dFNyoRxYlyxKqodOozezxrrv314WIbalSmVKn3TmTpjfxwDHiAVQFZoCExrNAihlocPet5+SsBpoYcKMSAbtXoL1njIDlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199018)(26005)(186003)(6512007)(36756003)(6506007)(52116002)(6486002)(478600001)(38100700002)(2616005)(38350700002)(316002)(5660300002)(83380400001)(7416002)(8936002)(86362001)(4744005)(41300700001)(2906002)(66476007)(66556008)(6916009)(8676002)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0O05gmYNy3IJ1ul2ZE3MJypepDiKuIqfsqXay3mO+WKSn7U+LUeXqHJtpf8j?=
 =?us-ascii?Q?TmhLDhuke8wewIzuVmKl4lqYnmTLloCTcVxpSwbco9/w5QxjZbeR8eLuE3Ja?=
 =?us-ascii?Q?6dKhfL9a4zKVxFWQ6YT0BtkczvNjXBLaJwbbomXvFqN3vlkMG5R7vqxKGMXJ?=
 =?us-ascii?Q?s4NbctpqRyAXCwJKTLryYee+Tjp6TGZSGNCfnX4CAtjzshS9tizphO+SARBx?=
 =?us-ascii?Q?QqZeNlXgvU83Nllf3yeOBmqF4Ydvu3g3c+/wWk11WeIeEENoEWxqAT5/ud/n?=
 =?us-ascii?Q?9n9h0h9SziwvRgsNPC9PSqTaFQiGpdV5Iyu8sszEPvSeDxh0OcSs1dX6ZYsB?=
 =?us-ascii?Q?c0paAoskWeHJTwBRXelmnEIP1pnk4iBtEuwNNfbaXWLNf0VcSnE9YzMVMMeP?=
 =?us-ascii?Q?2Eps7dPJ89Xk1/8VtL+n43F+r6roZ3vCt5+PdGj3z5VCkwPLR+fkR3il0fa/?=
 =?us-ascii?Q?e4C9vHHrygQ7G1kSJioif7gzus34nd9PhQFu77UiuRC3cv2XMuiWNaBcfgkl?=
 =?us-ascii?Q?H77SJN4BV9wX9TwtugqWwJUK3zOogaksmuwodApcUheTSDT/dRwrHKzAmQ0A?=
 =?us-ascii?Q?zbLe7NVbre6+gSfy4uVyA1gmTnpZY0QdGHsHEekAfD7Xrz420hrmeWsr1+cN?=
 =?us-ascii?Q?1xq9Iirx68h5fkPGjk3Qr8AHcWLMYpF8X/mHYe49cI6N28gkKo2cQDReCB3J?=
 =?us-ascii?Q?kh+CWLfe1iUVC4hK28oYiJ4c3QsdVr1qRNwPb6p/tziVHt4JBP8ePcKzYrwZ?=
 =?us-ascii?Q?XeB1/ZYQ/h229xrJ9rINfcGqH1rLBq2y1SONvpL3sNAf81C5y3V1u9ya6QOp?=
 =?us-ascii?Q?8cOi7K+sA39lds1fasvfwOZCQ045A9wZ4Smr8MkVmHrqvM7+ot2LpfVlQjJb?=
 =?us-ascii?Q?2en5LHB3zu4DfbLAklTDthYgtysR4K30n9DsEtmMLSQV7Em9VrSSuiv6dxGL?=
 =?us-ascii?Q?cYPeUKXipPIVn6ugMcn6Yh1qKCVttL7iw2bN4uAuNDtgxZkmyGZQFI5Gw6N3?=
 =?us-ascii?Q?A6l4z9y5a0jIgtb3cmv4i6wpvWNTHPs+/ihBTA/MaZtObAzNwgObzIgfp0wL?=
 =?us-ascii?Q?GzVmCpWOEeuRdVZsXP6aIesA7g/XWTIamuCmHMNsym5c+scHJi1BccFcUbmg?=
 =?us-ascii?Q?YkVL9o2p8fTn4MSqxXQbd0A8b5dzornbOGJo5JDCYlBghnEX+car0g2cAru3?=
 =?us-ascii?Q?EggitcnDIpr5ig3aH2Y5nGRtPnFyDgac5P6NKFzxeZVh7a6kgPXmHVO7Zu7X?=
 =?us-ascii?Q?byHDlP7DPnLbdYaFOlpJQ4md1CLnNUreqdyLzkod5vBZaqHy+XXR1PpmOXKy?=
 =?us-ascii?Q?n7CBJwV1FQTnXDslIPNZFIh2zQ6MSJ9YxK2tGDmSL8FJ5rRNO4UGmIw1iVQl?=
 =?us-ascii?Q?M020CwoUnAVAYDiFZuHiqXS/NErZSYTeb0bqTZqYylb5eW/O6UvRIhIkagKR?=
 =?us-ascii?Q?IDGucRM8pl8SOXHAEwbKf7Om+YACjXTKtWzTcYKEVEHaNIJh6alQPoOKCA6Y?=
 =?us-ascii?Q?0HX5POvFjYXULmXzMBvxxRlNlRu4/c5NFU3+YMGV2+gaP5lbzfKAZngmCtQ+?=
 =?us-ascii?Q?ELhcrlHSM+39Lv9RDG75bTn/nJ17UCpPt1uE3XLxrKWn3xvB/eiFpUxSJQct?=
 =?us-ascii?Q?Z3h52r3sBPbPeJ+apc4Y4cA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99af7a33-70ad-4732-d19f-08db04b051b0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 23:59:13.5604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1kUWo9aeiC8kdur4m5AMQ1J6+cMVoyucvXMKFb5gNIGGpwUH6TxMR2uCkwfeEv8rtgRy+j3K6StCdegzZseXjf+it/TAu5Kgv9uPKRxqVpJpXp7hgJwDzqbwFMM90/5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8120
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, cezary.rojewski@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Peter

> The conversion to use generic helpers missed the else for the dai
> direction check which leads to failure when loading playback widgets
> 
> Fixes: 323f09a61d43 ("ASoC: sof: use helper function")
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
