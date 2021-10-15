Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C9142E8F9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 08:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C253D1670;
	Fri, 15 Oct 2021 08:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C253D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634279217;
	bh=ie4Z3gh/C6mgAhEAm71FlOxSEXucYYIDrA+aJHzUxV4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ENReAFYMMbPos594DtSIQNsDvVv9v4L4D7yU+h2Fjpv5ICsoK47d2oG4pxpdNzJpb
	 +xXQHIZ+LTWU+Ksi+ZtWtyFJUe+HqqJHlCQGqqZO4x+JDUtSzr6Lo1VtRJlrOkfdSv
	 eTDsbeNZFGUOaOoz/dalKUWQLZyVL9frRkWlsKg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23058F80269;
	Fri, 15 Oct 2021 08:25:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5AA9F804E4; Fri, 15 Oct 2021 08:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BA28F80269
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 08:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA28F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="T+tWzLMw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HO1xdC+9VRRguIgvm+tRcIQlQdSpsscRHilyJikkobvebloh9ZURPoaKJj/VaZUaF0V1NOwlpegU3JVESLi7Gw9rucdDeQk0PsFmji/kBmtR2bQahw1yfB3ZyCl1nxmEPh7QBsNjJeLPGyQDy0RalDLIrugdaonCpengRP8sNvPV1ToQc0pk0Q2vgnr1H8xqitSzzV3MlURK6OMzx4Bxu7Vu9rh0rmh4/2pNkiTF813t6EVnVTYEJBHyDm/LoYWVUeG5VsjituAWW1CaAzm8o+AhrPW38shkDnqWjXn5Yhcj0pTjeknxqLK6a6IO+1szVHCY1g5MiVwK4dKnxapang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHoVy7z0QmVaeH5FYco1cdZ5hbfKsAtMhnZhmgUt3hc=;
 b=R5s0IdYpC9qJT4iAVpLQvTqY8OHJsPCJ+3aOcheYbBzSpe7W0KYMFqajqEN8qm8d080H1d31fqsnnNAm7LcFffsZYRg07VaMkC8s5bSwiYD3LhSn5pdYpKlYIIwVSMp/oPuF/St/UhgmiKvrf/+Jh+xLahxDanpKweo4rSwjCzGXPmiJCfdbtd3sEefPC0qCwcQs7NhxtRggS8LNfNdBtsMmPXJxTGRP1EggOdR9j2po/eQQQNF5vb6ACG+JLlbinc2/N+5PUX6uQzEcSMNSh3/BkzQN1/BFtMm/bn0j7Mc8fT9sUhaI7v0Z1hH0EFISg1zsQI11vz3bIwDzlWFX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHoVy7z0QmVaeH5FYco1cdZ5hbfKsAtMhnZhmgUt3hc=;
 b=T+tWzLMwIwIg4cXB4gtHFxiuaNX4LO0oLn92TquoDX9JsmiZhLt4qLPH73lHgk3ytGp91rcI/DSThi+UDGSrmkzOoyCKnC6nUOyGAVuufKXlqxLe0ixTlsabAg7H0u0yaef7wr0jWJatCvoseDYd9UL9lsvT0SVzyWFBW06RxwKvYJXwBuS9mZH78qsJRC1XuMlB3K1yAeJU+jELtzmph5wVvfbbe99RwKf++w2LbmLqkjUafs+KWkLx1iq92Jx65MsrskCCXf8+DysUTKTv5zGpCKF3cO9SOZNUMhhSNPUGWTyw9v9Do6nf42wLoYG4oWUC5zwJG3ByfV69RJJ93A==
Received: from DS7PR03CA0019.namprd03.prod.outlook.com (2603:10b6:5:3b8::24)
 by DM5PR1201MB0124.namprd12.prod.outlook.com (2603:10b6:4:58::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 15 Oct
 2021 06:24:55 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::60) by DS7PR03CA0019.outlook.office365.com
 (2603:10b6:5:3b8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 06:24:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 06:24:55 +0000
Received: from [10.25.97.183] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct
 2021 06:24:50 +0000
Subject: Re: [RFC PATCH v3 07/13] ASoC: soc-pcm: protect for_each_dpcm_be()
 loops
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
 <20211013143050.244444-8-pierre-louis.bossart@linux.intel.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <e101dee9-42cb-60f4-529b-2a9abb7740df@nvidia.com>
Date: Fri, 15 Oct 2021 11:54:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211013143050.244444-8-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e27879ac-0158-4c6b-bcd2-08d98fa48124
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0124:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB012411BC986BE3DB86453131A7B99@DM5PR1201MB0124.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GJZy+r8FA/msNrRkM6cWbbvU92AeM+ehx97SdX/XPIirV+glj1Yf/QiXasZBchHnLz7cUYl2/1gRBEWXh2VAiAvJq1GkA6ugCMpX6BWH0RTlEvIKKFx7Sc7ZkCPe7kYFplhfhRF+DtBaSxI5uGoptq1o9IiXe4GzIXhrR6aUaazO36df9/OEb704aFN0DyzQe5hdoQVSDuIcnODD/vAaRpOJBhQfMUIl5HF5gGOMYFITZEMcE/LhHEJbbJLs/mRsWz+9K32YyPr6eqeF2eBOfu9/4FN6Bs2MQRSSqMhxGU1GSjwtJ5OiG6KOFhoJttyq4F6IGRmUO/4XW0Fiwf3c80P6/RjXk0sQBjBVtMI9N3jZCOZl96S7UMUKsDafO4CopDrrR4wI8ARphf4B+kz/XuAUvujKVKCx0zJTz28wKzyvcf7FqYUdB48GYe17XOQCMZpzQDsylOByNpDrJAMdULm88xyKbRQOJhqoFP3NPNq5XqvHHfF+jNx70X+jIEHmu9LrvrKZg1OstjSR6vSgVraiWHme3cMq8Lm0cg1vZstjnWauuuGOrbKqPfAPk24Y3zxwiwt2FHirYy9qFDMD8vHDNCNacMV11h0sPfaNH+XWEFVC2dv2Jzc12k0nwuWok973TWoTFe8voLOwFSz8p4SKLvPNE7ptiDPp8VAUenZDJHe/dwYonvXdGwyBVMHxjXZDB6Klq8W2HqCf0+q7LEuC7WXNGi/Id7uBBGSszgU=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(508600001)(7636003)(426003)(36860700001)(6666004)(70586007)(86362001)(83380400001)(2616005)(336012)(31686004)(186003)(36756003)(16526019)(70206006)(54906003)(47076005)(16576012)(53546011)(7416002)(8936002)(4326008)(2906002)(26005)(110136005)(316002)(8676002)(82310400003)(31696002)(5660300002)(356005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:24:55.2589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e27879ac-0158-4c6b-bcd2-08d98fa48124
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0124
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, vkoul@kernel.org, broonie@kernel.org,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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



On 10/13/2021 8:00 PM, Pierre-Louis Bossart wrote:
> The D in DPCM stands for 'dynamic', which means that connections
> between FE and BE can evolve.
>
> Commit a97648697790 ("ASoC: dpcm: prevent snd_soc_dpcm use after
> free") started to protect some of the for_each_dpcm_be() loops, but
> there are still many cases that were not modified.
>
> This patch adds protection for all the remaining loops, with the
> notable exception of the dpcm_be_dai_trigger(), where the lock is
> already taken at a higher level, e.g. in snd_pcm_period_elapsed().
>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/soc-pcm.c | 86 ++++++++++++++++++++-------------------------
>   1 file changed, 39 insertions(+), 47 deletions(-)

After this, once I load sound card there are warning prints and failure:

[   71.224324] WARNING: CPU: 3 PID: 574 at 
drivers/firmware/tegra/bpmp.c:362 tegra_bpmp_transfer+0x2d0/0x328
[   71.238032] ---[ end trace 88d978f78a82134f ]---
[   71.243033] WARNING: CPU: 3 PID: 574 at 
drivers/firmware/tegra/bpmp.c:362 tegra_bpmp_transfer+0x2d0/0x328
[   71.257022] ---[ end trace 88d978f78a821350 ]---
[   71.261965] tegra-audio-graph-card sound: Can't set plla rate for 
270950400, err: -22
...


This happens because, now the atomicity is propagated to BE callbacks 
where the clock settings are done in hw_param(). On Tegra, the clock 
APIs are served by BPMP and warning is seen because of below.

   int tegra_bpmp_transfer()
   {

=>      if (WARN_ON(irqs_disabled()))
             return -EPERM;

         ...

   }


This results in hw_param() failure and all tests fail at my end.
