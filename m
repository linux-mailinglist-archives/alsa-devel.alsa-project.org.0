Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A79B3C14AC
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 15:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6F321658;
	Thu,  8 Jul 2021 15:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6F321658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625752308;
	bh=Mf2wJqcRH1XtokegzPuDe9aN04DsyahYB92LjEY9YLs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ReX6fZvSI0wKLIYmwRDhRuKLE+JFLq4b7dnfpBYrZ1zLlLxLYbO26hl+/ZcmSsYcn
	 q2G+X8sd10Y68uX8hp9MwOoB/hvprQyUiKkr1X/K6eD6sME59b1SB2NHpgNULf2HQ9
	 eSTPNxsYAZdnTbyFqebjksdP8QRk58RNZCtXWoCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9746AF80143;
	Thu,  8 Jul 2021 15:50:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0989F80246; Thu,  8 Jul 2021 15:50:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99617F80249
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 15:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99617F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="LqiNg3tg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UY02CPeW/LPkjpzjcYzomcFa1K6R0Ezw2ys4GyZw9qHjNMbtC0L8742TRErwam6xVszPlQA+2E8A36crbkAHWM3SsbJIjJIy0jjFOzD/yvO3RASINhOg/3YlA0/BPvUYsA7CcfW2ZndAMwyMP2/GTz98LpjYsbs3EyuhpZSKpLCUfMX6hSTDef2r3CbRvol7FU6SzqhmVcjJnZ6TEzCOsHeUcxo/B1UKmi85wgLKLu7MdWLYOwA10XWSyRiQrD4Dx42y3smSznoqr0PDWDTsmr90+icVCG61E7t1Jxsplh0gclRDSies2H0XCxUs/lHs6U1mpB6qQiZXMVTFa7pAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C//KQ745grPFC0DPrWA3IoAEwbOe+pcHmYvjMfGR6Qk=;
 b=e/b1/MoaKvzXaPcw0fGAzweK2KXwclh3qQNuzY60UI0XuRv/jAdpU8VNthwoCbRH0e+w8jnNwmHQhI7zcN6qau0FIOwix5+uIZU1HAHM4KCTrEuvfarxVQlVsi9/GLOiwku81+PSeqFKVHbSPgzA2A7q4Z3JQ2ftOevDaADWiTKdRaiYl0Dw4yGa1uSKRfMv7nfXg//u3h3eW2yt6vy1NHy0KU50ZakpvpN21GyZCDpCCj34qP0XHmc4tqAdN/ruaWX9aAcjCnitHlr3uLGoQRE6zOzUL44agHxe+0qgQPtEc21nzUv/y7rcWEb/Qv+u2g9ppDDgR9eXky7QKc+skA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C//KQ745grPFC0DPrWA3IoAEwbOe+pcHmYvjMfGR6Qk=;
 b=LqiNg3tg4djMIBJFkC4lMTBzPssOYq3ZV75UcQu7D3nwuJKKcy3yYd9/UHKsjzOPhKfWZl2/sHIyty59rhygIfPfDRumHop2y/N4SDFfRfZYExb4GFmvMoQce7lwG/YN8CE1By5k1to7VqS51FODIjhMHezIG1UuPKqcH1aKUg4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB2550.namprd12.prod.outlook.com
 (2603:10b6:903:ce::13) by CY4PR12MB1703.namprd12.prod.outlook.com
 (2603:10b6:903:122::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 8 Jul
 2021 13:50:36 +0000
Received: from CY4PR1201MB2550.namprd12.prod.outlook.com
 ([fe80::d53a:8bc9:23fa:46bb]) by CY4PR1201MB2550.namprd12.prod.outlook.com
 ([fe80::d53a:8bc9:23fa:46bb%7]) with mapi id 15.20.4287.033; Thu, 8 Jul 2021
 13:50:36 +0000
Subject: Re: [PATCH 12/12] ASoC: amd: enable vangogh acp5x driver build
To: kernel test robot <lkp@intel.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210707055623.27371-13-vijendar.mukunda@amd.com>
 <202107071645.QU4m6aBS-lkp@intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <f1944f9a-6072-833c-dc83-24820842d700@amd.com>
Date: Thu, 8 Jul 2021 19:38:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <202107071645.QU4m6aBS-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::24)
 To CY4PR1201MB2550.namprd12.prod.outlook.com
 (2603:10b6:903:ce::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 13:50:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad7af81b-0a38-4bf8-4aac-08d942175d3f
X-MS-TrafficTypeDiagnostic: CY4PR12MB1703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB17032D835E46CB092A341A2C97199@CY4PR12MB1703.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eDw2QwAvNx5HBq6CiXqSS0z6EIDlaVnJskC21W8GC5u0ENZueAjJp6/XAyd/uDrbFMiFBbjK3eGSImECiM3W1X8NIek6s4zQbtu+E6aQzfug9NnFHsBZ+ZwtenrAUpcRk3YCLecvOJzz6fj5Zztecqu0R+yUPU75gT3hEloclkQQ6snJSckjtq/aehKhgcSgUJPuG9QrgHPXxhceYXP4MlZ0cZpx0vnu9Z7ZDJEHRg0pjpK1xrBNEwQHLTX/KcENixVEphmhtqNxAMCzLPqbjLN3/pVRIMsdGdJ//MTFhXGdxvHZXnYX++Yk2LABepyxlm1Oy+z2hJvJNCs6fK5oJX6MZTeMaVObzh3gNpdnbxyaf2e82UdkEfQ9Z2Nab1LYoqkUuaLADndKEANAemiCVVRiZqTx7Fy6SIUVETHnUtlE1qOilsieNPMp/CwPt2d5B4H5BjmbcsBHRrEGhsxRigF/vPGKcrBsYJQ/14ot3M5eGHg0khBI8ulPrb8aNZgIE4+PBa4ZrW7/nEntXpBsjm3nre/TaTLSCEl09LQqmmFclkx6tNO6OO2QOVVK98zfKFpE7JNOHk+dzj5sFqgAqN6/fIyUkA98m+8Kn6MgjOdgFsbHBGJ4VkAMcgLoahHAdedA/0Fdgs9MWn1NeKr4GRZjMUijlwwkStkAduVMdh+vDO1q5BDeFncICwtOrySHoXd4UJ39Tzsuf29p4u0MHIbVUgqzldRLKmwxMomysb/Q96dwTRnNe7LadXjQjXK24oo41CgcKtRG+njCEIncJJMDpL/I1BxY9RFBrSx5CekaDpyMjtzbQn3pA9XD/4X2AAbo+YBUnSWWuQt0vHY7H33OaBb7vwdJESQ4meks/lxVprJLbXyuLW17C1ATxh30clv5yvGpZTekiZMtGUdN+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB2550.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(2906002)(2616005)(45080400002)(31686004)(5660300002)(956004)(83380400001)(53546011)(8936002)(54906003)(36756003)(8676002)(316002)(16576012)(66476007)(66556008)(478600001)(31696002)(30864003)(66946007)(6486002)(26005)(966005)(186003)(4326008)(6666004)(38100700002)(86362001)(42413003)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?oUugGWpqOWs94thQ4kK5ihnCvEQWe6ZP4aMxzl5SgqsyGnWIvCyr61SK?=
 =?Windows-1252?Q?i6Xt05uhNgLNfuAtaf9RgUECHRLQQzdqYcL39/53lhU4jbof/spZl1QB?=
 =?Windows-1252?Q?RZ0ISAw17y85yCEhMjWzBkZuQ1xArQQjnSROiA0QWtV/A/Ci9mgGeHvF?=
 =?Windows-1252?Q?44MUFenboie7Fa6zOBFsQoL9EwcytTN2c4Ps3oC+jT+R1axt2joPgPlo?=
 =?Windows-1252?Q?JdEsoaPRL2fX00uMSPzGWYzQ4JgWePPm1OrpHaJcwXnVmYrmfMhk2Sc9?=
 =?Windows-1252?Q?0QT/4jRiR9MD/s9MGRv2dLMTT5HpjQEjwolqRMGXl9ZcXbIQPCgYpBjG?=
 =?Windows-1252?Q?J+3Dkl6bC1r4sCvrr6Fn3hndgllcL8S5sp7vPKwxIX7PBVWG6vBAIWcm?=
 =?Windows-1252?Q?OBXrJVcj1J5JHIorRAQCC/5G9Uc4ug2vuy+M1VlcXyBbSXzLRbhh8APY?=
 =?Windows-1252?Q?WLdcb+BzFojfMNlO0Hahm2cdh1ZdbwhN7J3GbmePooGAavgaFqPxnGpb?=
 =?Windows-1252?Q?vGpPgHA0cVleftOXkDItwL0iN7DsLXMfY5hN2AJYsoeZkZMpEJN1zLEn?=
 =?Windows-1252?Q?tcp6SlnTgoELFpZxJtN/y6k7nlYutmVJ6JMySrw7eAgUus6U8tFiQPqv?=
 =?Windows-1252?Q?d2xU83xVsBD5egqZrWYTwnsufh6qwhc2WknY9vc2OpQxa1az1NQYroL0?=
 =?Windows-1252?Q?mtWat1beKavMS6qTMfEtQY8/2aY/Xts0dUJ1EYN19hI0Lb44Q9HISJW2?=
 =?Windows-1252?Q?A8e9SiI83wpUcEdFGQRi4dB8yD6BBJnjXHAQQSNjoI5XQs3BPE6os3SC?=
 =?Windows-1252?Q?teUXfhC7pkZae6VxuDrYchjuW6e/NmiV0XS6+dyaM9QLsDW+RaZhmctF?=
 =?Windows-1252?Q?DC38u/Ozex+QRCgOfRFGZYHfqH0qNpU+OpKi1dfNNo2r0PvglROdrVYT?=
 =?Windows-1252?Q?GkR3d1nrPlFfjqZi0iYpbukLZ+d/4Aes+s1lHNPCDLomPG4A/1R+PzA8?=
 =?Windows-1252?Q?3vtJAm4fNqMRt6L5Qw8vtNC44ybMuzfxc8Z9WphJvCPzqAmwn9fzNpL2?=
 =?Windows-1252?Q?g08dvcZ8uUDuv51euqJEAi5wb0eQFVJJhVA02fifTuYjCeOIztjEv7d/?=
 =?Windows-1252?Q?RtGUm2h2Wu6+Y/O/Wo39B/EOm3bc4pb5i8j1D5ZB+fIDbXBGWz1InUau?=
 =?Windows-1252?Q?quWS/VO09D/vnbe4ZQ1RM3Ov4Ert2l6Gfrq2cihhq1Us2ChO8tOwfiQt?=
 =?Windows-1252?Q?/KMuNtvnrRAq/+BhQpZAKBouwIUDRdqBUPJMVX9bGe92BJA007dXbeY5?=
 =?Windows-1252?Q?cgaoCvJHvydc7YIsu++5Gal+QIysiRmLiCxoNZSTLCIaz7+HHBP858SY?=
 =?Windows-1252?Q?JEjnK5uua8NJNQbQbQSaw4nBps9VbfUi/aTOe5o5sPUGT47ntQLaKZ3a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7af81b-0a38-4bf8-4aac-08d942175d3f
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB2550.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 13:50:36.8294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2IWis29jSkQbUu/+M+1QAezAurFjNdatAFILraFKeUvBWYcL+K0QZtRBMJlRWY87cW7Iu898yphDXPa2bYdDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1703
Cc: Sunil-kumar.Dommati@amd.com, kbuild-all@lists.01.org,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Alexander.Deucher@amd.com
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

On 7/7/21 2:30 PM, kernel test robot wrote:
> Hi Vijendar,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on asoc/for-next]
> [also build test WARNING on v5.13 next-20210707]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7C0f22ddb561f8401f59a408d94125bee3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637612455176116855%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=9vQMvlgt%2FiOFq%2FdI5VnTCSILABq3jF2TTn51bA6ZnhI%3D&amp;reserved=0]
> 
> url:    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FVijendar-Mukunda%2FAdd-Vangogh-ACP-ASoC-driver%2F20210707-134319&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7C0f22ddb561f8401f59a408d94125bee3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637612455176116855%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Fd10EeMdOg%2B3dgLGHsZWNTe%2FoAwLr8gL4vtl1nd0BeU%3D&amp;reserved=0
> base:   https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbroonie%2Fsound.git&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7C0f22ddb561f8401f59a408d94125bee3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637612455176116855%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Siyl%2BraTkXA3xhX1IUBZjaJAopQIPdxAw4wpmUWYdxQ%3D&amp;reserved=0 for-next
> config: x86_64-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>         # https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2Fa7ec99c34f0da98bd5a9b2ccbf7ed5ec7e4f06b2&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7C0f22ddb561f8401f59a408d94125bee3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637612455176116855%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=lSqpjzxIP4OCK4Yrn4H5FsW4bR6msna%2F9Scpc8Y2310%3D&amp;reserved=0
>         git remote add linux-review https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7C0f22ddb561f8401f59a408d94125bee3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637612455176116855%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=AnV1Eu7Vd9mkjfIhSSgJiDu2%2Bcw5GlK%2B30tteeeHOPw%3D&amp;reserved=0
>         git fetch --no-tags linux-review Vijendar-Mukunda/Add-Vangogh-ACP-ASoC-driver/20210707-134319
>         git checkout a7ec99c34f0da98bd5a9b2ccbf7ed5ec7e4f06b2
>         # save the attached .config to linux build tree
>         make W=1 ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    sound/soc/amd/vangogh/acp5x-i2s.c: In function 'acp5x_i2s_hwparams':
>>> sound/soc/amd/vangogh/acp5x-i2s.c:87:26: warning: variable 'runtime' set but not used [-Wunused-but-set-variable]
>       87 |  struct snd_pcm_runtime *runtime;
>          |                          ^~~~~~~
> 
will fix it and post the new version.
> 
> vim +/runtime +87 sound/soc/amd/vangogh/acp5x-i2s.c
> 
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   81  
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   82  static int acp5x_i2s_hwparams(struct snd_pcm_substream *substream,
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   83  			      struct snd_pcm_hw_params *params,
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   84  			      struct snd_soc_dai *dai)
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   85  {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   86  	struct i2s_stream_instance *rtd;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  @87  	struct snd_pcm_runtime *runtime;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   88  	struct snd_soc_pcm_runtime *prtd;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   89  	struct snd_soc_card *card;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   90  	struct acp5x_platform_info *pinfo;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   91  	struct i2s_dev_data *adata;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   92  	union acp_i2stdm_mstrclkgen mclkgen;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   93  
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   94  	u32 val;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   95  	u32 reg_val, frmt_reg, master_reg;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   96  	u32 lrclk_div_val, bclk_div_val;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   97  
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   98  	lrclk_div_val = 0;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07   99  	bclk_div_val = 0;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  100  	runtime = substream->runtime;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  101  	prtd = asoc_substream_to_rtd(substream);
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  102  	rtd = substream->runtime->private_data;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  103  	card = prtd->card;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  104  	adata = snd_soc_dai_get_drvdata(dai);
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  105  	pinfo = snd_soc_card_get_drvdata(card);
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  106  	if (pinfo) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  107  		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  108  			rtd->i2s_instance = pinfo->play_i2s_instance;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  109  		else
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  110  			rtd->i2s_instance = pinfo->cap_i2s_instance;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  111  	}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  112  
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  113  	/* These values are as per Hardware Spec */
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  114  	switch (params_format(params)) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  115  	case SNDRV_PCM_FORMAT_U8:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  116  	case SNDRV_PCM_FORMAT_S8:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  117  		rtd->xfer_resolution = 0x0;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  118  		break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  119  	case SNDRV_PCM_FORMAT_S16_LE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  120  		rtd->xfer_resolution = 0x02;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  121  		break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  122  	case SNDRV_PCM_FORMAT_S24_LE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  123  		rtd->xfer_resolution = 0x04;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  124  		break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  125  	case SNDRV_PCM_FORMAT_S32_LE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  126  		rtd->xfer_resolution = 0x05;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  127  		break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  128  	default:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  129  		return -EINVAL;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  130  	}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  131  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  132  		switch (rtd->i2s_instance) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  133  		case I2S_HS_INSTANCE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  134  			reg_val = ACP_HSTDM_ITER;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  135  			frmt_reg = ACP_HSTDM_TXFRMT;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  136  			break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  137  		case I2S_SP_INSTANCE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  138  		default:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  139  			reg_val = ACP_I2STDM_ITER;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  140  			frmt_reg = ACP_I2STDM_TXFRMT;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  141  		}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  142  	} else {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  143  		switch (rtd->i2s_instance) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  144  		case I2S_HS_INSTANCE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  145  			reg_val = ACP_HSTDM_IRER;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  146  			frmt_reg = ACP_HSTDM_RXFRMT;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  147  			break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  148  		case I2S_SP_INSTANCE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  149  		default:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  150  			reg_val = ACP_I2STDM_IRER;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  151  			frmt_reg = ACP_I2STDM_RXFRMT;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  152  		}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  153  	}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  154  	if (adata->tdm_mode) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  155  		val = acp_readl(rtd->acp5x_base + reg_val);
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  156  		acp_writel(val | 0x2, rtd->acp5x_base + reg_val);
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  157  		acp_writel(adata->tdm_fmt, rtd->acp5x_base + frmt_reg);
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  158  	}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  159  	val = acp_readl(rtd->acp5x_base + reg_val);
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  160  	val &= ~ACP5x_ITER_IRER_SAMP_LEN_MASK;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  161  	val = val | (rtd->xfer_resolution  << 3);
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  162  	acp_writel(val, rtd->acp5x_base + reg_val);
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  163  
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  164  	if (adata->master_mode) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  165  		switch (rtd->i2s_instance) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  166  		case I2S_HS_INSTANCE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  167  			master_reg = ACP_I2STDM2_MSTRCLKGEN;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  168  			break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  169  		case I2S_SP_INSTANCE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  170  		default:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  171  			master_reg = ACP_I2STDM0_MSTRCLKGEN;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  172  			break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  173  		}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  174  		mclkgen.bits.i2stdm_master_mode = 0x1;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  175  		if (adata->tdm_mode)
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  176  			mclkgen.bits.i2stdm_format_mode = 0x01;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  177  		else
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  178  			mclkgen.bits.i2stdm_format_mode = 0x0;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  179  		switch (params_format(params)) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  180  		case SNDRV_PCM_FORMAT_S16_LE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  181  			switch (params_rate(params)) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  182  			case 8000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  183  				bclk_div_val = 768;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  184  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  185  			case 16000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  186  				bclk_div_val = 384;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  187  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  188  			case 24000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  189  				bclk_div_val = 256;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  190  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  191  			case 32000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  192  				bclk_div_val = 192;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  193  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  194  			case 44100:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  195  			case 48000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  196  				bclk_div_val = 128;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  197  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  198  			case 88200:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  199  			case 96000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  200  				bclk_div_val = 64;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  201  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  202  			case 192000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  203  				bclk_div_val = 32;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  204  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  205  			default:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  206  				return -EINVAL;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  207  			}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  208  			lrclk_div_val = 32;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  209  			break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  210  		case SNDRV_PCM_FORMAT_S32_LE:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  211  			switch (params_rate(params)) {
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  212  			case 8000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  213  				bclk_div_val = 384;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  214  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  215  			case 16000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  216  				bclk_div_val = 192;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  217  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  218  			case 24000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  219  				bclk_div_val = 128;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  220  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  221  			case 32000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  222  				bclk_div_val = 96;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  223  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  224  			case 44100:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  225  			case 48000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  226  				bclk_div_val = 64;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  227  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  228  			case 88200:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  229  			case 96000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  230  				bclk_div_val = 32;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  231  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  232  			case 192000:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  233  				bclk_div_val = 16;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  234  				break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  235  			default:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  236  				return -EINVAL;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  237  			}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  238  			lrclk_div_val = 64;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  239  			break;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  240  		default:
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  241  			return -EINVAL;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  242  		}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  243  		mclkgen.bits.i2stdm_bclk_div_val = bclk_div_val;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  244  		mclkgen.bits.i2stdm_lrclk_div_val = lrclk_div_val;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  245  		acp_writel(mclkgen.u32_all, rtd->acp5x_base + master_reg);
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  246  	}
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  247  	return 0;
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  248  }
> a404cc43cb3075 Vijendar Mukunda 2021-07-07  249  
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7C0f22ddb561f8401f59a408d94125bee3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637612455176116855%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=F99HhZqgB7vMtLXCAYaWrWDGGDJPRPLaPKMJ%2FuKoa%2Bw%3D&amp;reserved=0
> 

