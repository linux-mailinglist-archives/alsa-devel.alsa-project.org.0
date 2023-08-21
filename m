Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D5786866
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:34:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AA83A4A;
	Thu, 24 Aug 2023 09:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AA83A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692862489;
	bh=vJ0GlihLR2iXaBp0DJIRovRXwjuluKGtNGiaPc6693o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rh5ligReyvJGVRYAB36qv6z1B1DbLCuVN/XxfpffUb6ElJPalimJgx+mEglN4Z5K0
	 he5EdeF6bV7fY4b5m6dnAT3sw4OTt28fJzPfJwJM0l1HoObqp/GcyYYU+GAwm5LVTq
	 nK2gpJm/+qFoCJvKGUVtkIv29puJyxbSJK+EtkTM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE159F805AB; Thu, 24 Aug 2023 09:32:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0B3BF80589;
	Thu, 24 Aug 2023 09:32:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4737DF80199; Mon, 21 Aug 2023 16:40:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3ED87F800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 16:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ED87F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=FHvQ9kpc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqR6XiXmV3BY+EpAHE8FCJlP0IzPGUnzEgI3sRlDQ48JlHkLFIIidlwWGtRQqQe86U3g7bZ39mdRoNoFx6FXx/0vL7lW8/Um9hIcB2wXycbjV1M7BM5/kKhcSKXu4U/jqXwUO8TKP3eZnKEThhhhHyftAQkAOiY9arTCkV+qMPFbnHREuNvcL7PVEAJSnZswJB8yFHCN9ccn6XsR9RgLbdrvWwHlinh70Kt2rL/EbC9m1iyTU9o5diZKIqURLGu48dWdXV5R6zV8gM5yD9QVBlHM8YJ5HV7BeHig5zRvQEHzqHpeFOBB9aa7f+QK6JfZ5IcTDZc4iy4HapBghUYKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzIiINzI5HMFB8guwkBjReqCogCcqivAGWLLHsp41XI=;
 b=V7+uhSO4S/tgaOdBpRlR8QaCVW6Q/vGFdLzGxswSh7Zj0peAsB9S2R955RgD20AhfEYsyOriE/KrHmwLQvjdgwXmSy6yaxqJ4KqFm3vPRyHbNzr9iR7NOZPROnl4ltZDQs35WBQaY14xLa1PuvNMKwdQgdT6YLkngb5TvZW1RlVoFwGRtOMs9VvaLOKwUnor2WBpInmzmwAmwLBK70mf6ZGxr7e3usflS7/hruaKaXxIhxTiN7wcgeGrimSaKd8ZoYdK/k1mxEBAs6gYiB8VvYzBC6kFKHOgAD4E36Rz25I+SE5LMUP+4FEfQAgVFP1ceki6YFb7M5DssjJLX6hFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzIiINzI5HMFB8guwkBjReqCogCcqivAGWLLHsp41XI=;
 b=FHvQ9kpc8vEvW2BvvKhfwntoMIxoNLb8zILA/7hJEdAID1mYcT6+fHovqN53MTYTldpPW4vwmTRjIWLHN7iifH2qj939AJuMoyFNk48e4X4RCo+zL3uOLDzWxI96iUpPqlthaPB22XMYHm0P5n9Hke56jt+QuVk8DVwCzBX6HwdQHwbfzgmJpKHgVj0B5DGnwQqwBSz+eV1xbkDwpNAwHZ+MgzlOmCDhSZckVGZ0ixw6KiE6btbyGWRfNdJdRsDBEdE6uxeICZXumh/IjXkFgrWZo7I13+zTXx21ukOOjV9U2IRlucAIcSbt+ZdFmsNyvgmOn6jgowM+R46vucF8Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 14:40:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 14:40:14 +0000
Date: Mon, 21 Aug 2023 11:40:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Andy Gross <agross@kernel.org>,
	David Airlie <airlied@gmail.com>, alsa-devel@alsa-project.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
	etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Frank Rowand <frowand.list@gmail.com>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kalle Valo <kvalo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-wireless@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Maxime Ripard <mripard@kernel.org>, Sinan Kaya <okaya@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Sean Paul <sean@poorly.run>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>,
	Kevin Tian <kevin.tian@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] iommu: Remove the device_lock_assert() from
 __iommu_probe_device()
Message-ID: <ZON3TNmYXqdfovRm@nvidia.com>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
 <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
 <ZONdwclGOBaxxqtq@nvidia.com>
 <ZON2gRogBhjmpNIl@8bytes.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZON2gRogBhjmpNIl@8bytes.org>
X-ClientProxiedBy: MN2PR15CA0063.namprd15.prod.outlook.com
 (2603:10b6:208:237::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2e8db9-ab10-42f4-6559-08dba2548788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HgyALB5deKd/E/UO6KXUDvzjKRMQlrG78YiPcGWRQIR0zeK/GP01IumM+XAWhoGsqAiHJKfXjx2YLxCf85VKcu8mszZQ4H00gNIKZQv5JDnCy7P2Xe/gLdK9r4M+3br2cCvFXE8zTJiuHZ0fEeGfg7i1oAJozpSDzHeUjipuMJInQIVgcs6RkUy52jp6fFiFaPVT1emrSkEPrdYlfhnAlQ0MgrmbDMouk1P7cMRg81pxkrb1udes+/IpSNrVp88Tk/qeU1sok1oxLuD456tBpYB3v/S982HUJJs1VQ7uk9H7AwI8NQ0RFzs6YfGj/OskXXE4MtKd3RNxXmxh/1wiWt9ubxxSFOByqzzM6CB5EZxFsNPqrQCbk/fbXdiD58sRANf7D2JW402N2135nVA3RJaSlCJw+OV1oGJtsZE77rZkvORS49F35ZciUeX75EUUNAu9MvE5ZN+oNUJsCW2IYlvkJKAOyN7OzLRmTzsVaOFDHAsukIlgEtlo9jFGDreLcAeW0oSnsVCL2B+0U5yThPFq6skAmw2J7o+2huVOj1Ycku+4V2JTT+BxR+qEcE8a
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(4744005)(7416002)(7366002)(7406005)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(54906003)(6916009)(66556008)(66476007)(478600001)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0VcySalc7lJMstEA0d6FSbcTBLowbQm6euasl/pSclCA7m6WS0/F5E1n2+Mq?=
 =?us-ascii?Q?QAVmIAZMcaEmARZsKz9Y2fhB0WMaHf0IuQd+FGvfchH0s0kZrlIqSrx+EURX?=
 =?us-ascii?Q?yDs+mGIQ0Cm3TQtTXLTu1rZ4DuJkssC23wiwFRIjLuxvddyaV6Ri74Nj7jjL?=
 =?us-ascii?Q?EVWJo/g1aP2zRsz/259c60JeRQ3S/kFvc2sKJW2zO2W63fVxGXk3E7IexJ+3?=
 =?us-ascii?Q?dFCsMXFJrBTeXSi+12KbOu9vb5YiR7Sp4ff5PnY3ynVEAU6/nCddVpSoTu0a?=
 =?us-ascii?Q?SHbujYSHFwFGNJ7f2iAhQsDnMFK+M9xUjD7C+k2apiSffpmIi2Sa3CZKl1kb?=
 =?us-ascii?Q?w7whXrvkFCxrC3UxhdY8MRRbw+rwIOOlBgArC0bBxmWvFAF/UF3qh+CaatkK?=
 =?us-ascii?Q?eglMlygQqM6Rg4FXJPioEFYZzsNpSRZXG/F/oO28Du6JphlKrDZNTeLQv3n0?=
 =?us-ascii?Q?6h6nu2LgrPPyXkxYP/FMm6NoLLhabk4vmH/ZABQLd5OOaQ4IkVIS64mcXKmO?=
 =?us-ascii?Q?PB8KOGbnYa294AtpyvaIRAJUQzSXfJt2PXVHrXKaCwRA0Lzar631GDO1TJx3?=
 =?us-ascii?Q?m+6JJXU910a2eBg2ZZu+Rikw66TkSGGcRenR36aOf0w19xe4ueAcUFM6jDPH?=
 =?us-ascii?Q?qBwr/UbNuN0fehBhdOTI0XHHzeIbS4Gwh6vE6gTnknYgbWzZZ2+LMau5gmc/?=
 =?us-ascii?Q?GZdW/Gm0id/Z4gKl+eXPyPzCDGABzQGgJWj4twLpxSI3qKJeT6kaLGXwVRPs?=
 =?us-ascii?Q?Hn3NqI1yfHxk9JBaC6qNZoJppTfYU7tkohfvzojL1Xpxs3Kxms48useG19DV?=
 =?us-ascii?Q?HQNDqMzI8p63usrTNwo01J5z5LiyRypJ+dCIQg/T/ttxVNvkKpJa/g+CjFUu?=
 =?us-ascii?Q?7vlXB0SR9lP3nOuNQyDRElPoi1ROZBGcO0TZ/CVZsjoB72EFKlaQc7JqndvF?=
 =?us-ascii?Q?fuaPbrVUUsBKfVUXZ7KHHA2Xr4Dxdt7KaAcrJXWtG4ydTcR5GymtASVVh/BY?=
 =?us-ascii?Q?NzpyLJzCKPAXq3fTOEzM+pgwJHBChArLmwzvZ2/yTlQX+/jMmCFHfSTZg0W7?=
 =?us-ascii?Q?DHAOtfzWv9vUsp2D8NP3aKEhcD+txaTNu76Fr/w/jkTqBwc4Lz7PAIAVVX+u?=
 =?us-ascii?Q?NRVpFF/0z/NYnTAB4tJq07r9EnoHy7kVsh+HJmLPxXITZ0y71ti8f17GzrsO?=
 =?us-ascii?Q?qAjMT90xSKfi7ZzJ3cGkjwVINppqjsJqAgzzPduVLvBQp9ADXr6m0vqKcFnY?=
 =?us-ascii?Q?oCd6elPqK5A8YE98gLuqHg70asPvKu/yWmrWVP3pq59r4fbwN14coD9F8h7n?=
 =?us-ascii?Q?sV+XuLhePprbsv0Cudx0HXp5TtK3hHp2hO1BZQkhdGkYjiYr35p7tdsMcVm6?=
 =?us-ascii?Q?/vmb7fQyexrcUKLCwsqlkpRIu3Gtop8pgdbVo41nLwRUSYZPlgxVWN/VIS60?=
 =?us-ascii?Q?7L3cfHHFfIvlV3rPERQnuYJRJ9GHerFkreGENWXuBasq0Mtmc3GB4A5GtRz+?=
 =?us-ascii?Q?CoX0jgNLpeq+j0Az0gQUJ7kr9ZrUyyNSIEm0sT6lS44fc41KRCWRkycKAo8+?=
 =?us-ascii?Q?tuo7itCAqshuDIpL/f43Z+ysvRvU3hSSFC6QTop+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8b2e8db9-ab10-42f4-6559-08dba2548788
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:40:14.1021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SeRmv+15vdiFqIY3c/XgLKw7ymAk1g5vcsz0l6Q6HutXT7nd1PNbo9kmUtsI6u8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081
X-MailFrom: jgg@nvidia.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: NCZ7RFH2HONGJEWRSIOAG3WYZNIA7PEP
X-Message-ID-Hash: NCZ7RFH2HONGJEWRSIOAG3WYZNIA7PEP
X-Mailman-Approved-At: Thu, 24 Aug 2023 07:30:03 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCZ7RFH2HONGJEWRSIOAG3WYZNIA7PEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 21, 2023 at 04:36:49PM +0200, Joerg Roedel wrote:
> On Mon, Aug 21, 2023 at 09:51:13AM -0300, Jason Gunthorpe wrote:
> > So now that Joerg has dropped it - what is your big idea to make the
> > locking actually work right?
> 
> I am not opposed to the general idea.

Well, I think Robin is opposed to the device_lock, and I don't know
what his view of the alternative is.

> When putting it into the tree I wasn't aware how many users still
> need to be adapted to properly work with this.

It is surprising to me too!

> We can do another try once the issues have been sorted out and you have
> agreed with Robin on a workable way forward.

I will repost just the group part of that series after rc1, as they've
been in -next for a while now they should be still good. It is a nice
cleanup that doesn't leak out.

Thanks,
Jason
