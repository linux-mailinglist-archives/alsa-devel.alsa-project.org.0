Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F8D41C013
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 09:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 689931696;
	Wed, 29 Sep 2021 09:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 689931696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632901495;
	bh=FthjNE3sldnI62L+KpNbHt7RkpZjZEn8VWJbwie6K0c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PxgsqM2MTekBr02j7rKf8Hxqm1yTf1ox3CTqJygq0VGcP73ZMClnjT4cOJGlPWkb+
	 m5iZ1xe8oGiMsLYgXf1ErwsDoXL/WEFdYVbQCtVurW1pBeCuO3ES/KMmHfJy7MCZXK
	 xSTzZvN/pGidu6AWPLT5b1PbCMCtueTUh5J0ZC0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB75EF80161;
	Wed, 29 Sep 2021 09:43:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB39AF80227; Wed, 29 Sep 2021 09:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19880F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 09:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19880F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="MY5UGHaG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWspvIjuNodJ3guQKiF+r1fVuSMHDYCahBwMvRzhOwXeKqiXAXTjVcLNy1pEJK5v38tgXvfXrXHHBgJtCjuBnWWKA1lzwsr1YLMdhAvnNp2SBLsZY6xDt+skTGHk4RrOpc61MwJUwxHmSiWT7OibUuJvN/m+FBjMwKTXPcL4AANUomqP0Sa4cdMyE4G8JbbBxCi9hgble+7yPShdH90nDDR8tl074GhiQU00USKBPlyYf1sh2Ojz7J2E4eIG2X9ogNzWmr91VDoQWy/Ev8A+BrhEiFbhvs3LdABivl5t9d8mbr0nZuD/U6LCpx6Msqi+UJRQh4tGuxsTKHSmN3/KIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=JRgW6tpG1ufXex/XtDOEJsOCf3pNHD4BhIX3F6yGQFA=;
 b=b9GmkAWy5Dpi8Ka48mB+Qe7nCybVjcDkOA60p+FUgrSv8lNvh+wV/30/nFnxZElvHahjNbAuzarM5OOMSio6WzwnMjZMe1qifNDcsix2Hde8heVBlYobsxAZA209KnOBNexuCf0DVMe3SgVJzUJRtdUKtN0EzBL3OWnAL0LpSTS6Ph+H3YpBkB8PgRMfvSm52DXBLeZXGIk9lUyZ9usNBAKpIFOPr+2gBLsTgOB1Gs0n8d114cox8K6DKM/hOPnUo7hXIUix0EJKTfCyO52NeZVTscuKe6ydbj+HCa4gRIoliToezsr4AbAo4dZzjXOPkO3IyThrSi3xN5nuDK1nSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRgW6tpG1ufXex/XtDOEJsOCf3pNHD4BhIX3F6yGQFA=;
 b=MY5UGHaG02v39lxKcwjsiwFIwTlctLCs4rAYYpAraPSAuUyqS5Z3woXDm8b+rX8E62nUNslrSVYPRpC4af3TyxAJzF/Y+aR8RDsc9MAHF985OmUwmD50q+ZLNVd4vC7+TgzxWbqyE9iNJxfYY7yPqn1kJEUp8K6w9EmjU7fDF6G0TqMm1YuF2QG6WaWDbU3ZKrVEwqZOvO9VTOmvSOem/OHjl/0TsgJ5UNEfIkkMqsdBxX6jSbMTN1uSB8qLLblHm4dnQeeYLNmM3DY/rre2kE+Why2E6VYCPO/B91ZmAL1YE9mFCwrBimMD/UyyoqguqhwdCIZtpDgKFqAKbp1f4A==
Received: from CO1PR15CA0085.namprd15.prod.outlook.com (2603:10b6:101:20::29)
 by DM8PR12MB5399.namprd12.prod.outlook.com (2603:10b6:8:34::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14; Wed, 29 Sep 2021 07:43:28 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::8c) by CO1PR15CA0085.outlook.office365.com
 (2603:10b6:101:20::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Wed, 29 Sep 2021 07:43:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 07:43:27 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 29 Sep
 2021 07:43:27 +0000
Received: from [10.25.99.231] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 29 Sep
 2021 07:43:22 +0000
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
 <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
Date: Wed, 29 Sep 2021 13:13:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd6ae3ec-5093-4aad-9366-08d9831cd36a
X-MS-TrafficTypeDiagnostic: DM8PR12MB5399:
X-Microsoft-Antispam-PRVS: <DM8PR12MB5399E291591ACC1320354493A7A99@DM8PR12MB5399.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELPoJionqhUIrWNjEfQ2Jyjsel5Apr2qE492pZUguaxqw72ObFXln5rjJR7Xqtyxy8OI4bkLOX4ux6ZdjTvAX8Q2fVIcV9Ek0+tLJ6r2+Za4uD23oUXuupvjWnLg1S63i8vHB7oNBFdh4DzL+iGKLd4ssTPDfUF5kUBSiM4YP/dPJiOXiP/vsAhjk20RELI03M6aJIzorTRNWc0ED/tNEYv2VhIVbfvzhLB3eOo9j+MTPZq6WUsDUxLFyeu+jQC2KhhLlRNtpE3WSndtlGmHj8D+w5wCTGMhitEzhYA+JM7uwb0ffpkbKDSHPt3yPnRT0361mC9aZDEukN3P1FsPA/RtasRx+ta0l97KxQjZzdSQ28mMaNCxAZfan/fz6BQyWocLWIskZkOkfm7HxqM7zPwiRqB78YBINgLiskUtQumX1APJBGpvPtaMdmma17gEOYg77+JiPB5iCAMbakBb6JkkBKSDHGftmU4IVXT+oESMPgE/7qmxMWVvcQfLDlmOElH/i1b7lI9Hsf31PD0WQsBIYXXK8UzG4FCmP96EZvRG8ajOSZdvS3kXJDLrVpwMCdlIr+hAzgrsoeESbEUopaixDMv0TTkmOyIWMZCxTWgLOXKDvoZuzmMj9ucFOwO4c4Qqvabr1RXQ9J/2M5RtM6E3KKclx4xn9uwHKeyskT8UfTVXZlpQAJ+FQNBkje+PpzQeWMtMVeaiA0eKsGSSUri/e1u++ltjPUUy9GQKuxwhn0UHHQ5TVRqw7YqQsuEO
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(5660300002)(83380400001)(426003)(36860700001)(31696002)(70586007)(70206006)(47076005)(6666004)(31686004)(86362001)(8936002)(54906003)(186003)(508600001)(8676002)(16526019)(36756003)(2616005)(4326008)(7416002)(336012)(26005)(921005)(316002)(53546011)(16576012)(110136005)(82310400003)(356005)(2906002)(7636003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:43:27.7778 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6ae3ec-5093-4aad-9366-08d9831cd36a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5399
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sharadg@nvidia.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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



On 9/29/2021 2:55 AM, Pierre-Louis Bossart wrote:
> On 8/27/21 4:33 AM, Sameer Pujar wrote:

[...]

> But in addition we'd need to agree on what an 'active BE' is. Why can't
> we connect a second stream while the first one is already in HW_PARAMS
> or PAUSED or STOP? It's perfectly legal in ALSA/ASoC to have multiple
> HW_PARAMS calls, and when we reach STOP we have to do a prepare again.
>
> And more fundamentally, the ability to add a second FE on a 'active' BE
> in START state is a basic requirement for a mixer, e.g. to play a
> notification on one FE while listening to music on another. What needs
> to happen is only to make sure that the FE and BE are compatible in
> terms of HW_PARAMS and not sending a second TRIGGER_STOP, only checking
> the BE NEW or CLOSE state is way too restrictive.

Sorry for the trouble to your system.

Idea was to avoid reconfiguration of the same BE DAI again, but not to 
stop the provision to add a subsequent FE. In fact I had tested mixing 
of streams coming from 10 different FEs.

In your case, because of this patch, looks like the subsequent FE is not 
finding a BE DAI since it is already active due to a prior FE. The 
reason it works at my end is because the mixer input and output DAIs are 
separated. Any new FE would just configure the mixer input DAI to which 
it is attached and skip already running/configured output DAI. I am just 
curious to know, if originally you were reconfiguring the BE DAI again 
with same parameters (for a second FE) or some additional configuration 
is done?


> I can send a revert with the explanations in the commit message if there
> is a consensus that this patch needs to be revisited.

May be this can be revisited since it appears to be a critical problem 
for your system. But I hope this discussion can be alive on following 
points for a better fix.

1. The original issue at my end was not just a configuration redundancy. 
I realize now that with more stream addition following error print is seen.
    "ASoC: too many users playback at open 4"

    This is because the max DPCM users is capped at 8. Increasing this 
may help (need to see what number is better), but does not address the 
redundancy problem.

2. If reconfiguration of the same BE is not necessary for a subsequent 
FE run, shouldn't we avoid the reconfig itself and somehow avoid FE failure?

