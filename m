Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A616642E8F5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 08:26:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25B3D1672;
	Fri, 15 Oct 2021 08:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25B3D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634279176;
	bh=kIAxVleYoiAYq3nJxHkUIlPjY0/Hoii14hCtS2R9XEo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i4C+umVi53Px/Yhnccc9ou/HhOSGBprjYjWdv6LE+GSS5yYnIaMHgksKtKtMUs8ec
	 DWlnFW8Vfic5gK6MgPgkiAczXcqvCMlAkj5KcVdTA6m+yQ0nRjjzoLWZ1/qOi4t03Z
	 0yyYPSRTzV+JTEkfRCODu2l6EH4Hq7VnK9nNJY48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76984F8028D;
	Fri, 15 Oct 2021 08:24:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B5B7F8028D; Fri, 15 Oct 2021 08:24:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6691FF80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 08:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6691FF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="b6Mkgg46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKhpzGDWFJ9GkeEPHR9bnRaXNluQFI1nX9f3pzxaDW9DvfMtwJYdE5kX0o5/GYD/TWWjhVoBfsa7zqW3a1DSce6owljuK2j38TKNcTBPwQzU8U2xOwEllbmJByehwLAcyb2ACExLb6YiJMfHCmVhT/bj5IB8u7QTHQiKYNoLb2K5m8EmDgx+1Vh+tR1JLWxoUdUxm7Kj12YHimIcZaqRUDWdomdrDA7ZJE8KpQ5+3l0eQWrohN5niYq486lNn7be+2f3LYeUhSRekGoVHEuWhLH9WUZfXLq0uDIfAL9DpJdgQHi/kOXAB7Z7fORYZo3mw2aCQJqk5/h/t3FOAQz4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hc7Y1YUqupuq0pARW229CukMQKDnUf9bXiuCo5CW+tg=;
 b=AXpSr4iHuHE764xCKn5SzYaj/3lRtSuhkZFvCqVOirgRUhjLTXR+4Qq8DZDNiSv4sXIioRq9Bz+O+6JR8529M4vh6ywRlvFljYi67F4uAqaAHjjHdtrhTb8NUhMtPGycanVYT7siL1gjAVRIW6+jAb6bhcZLWKKidoY0cRA2l3O2fXKp8kNqfpKsUT4Fbb61UCwjhDYTqy8jWSZTv/E76+iLLWRgAyvywKqzKouQGYHRjyIGPMCw/kYy23ykkcvfHcenc7+hYlt3UrjeYx3gNWic0t2TDB+vrB16yVBUT5uKhy6eEvcP1J3hNfpPFryBYQGD3AY6DL+r7PjQqtQyaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hc7Y1YUqupuq0pARW229CukMQKDnUf9bXiuCo5CW+tg=;
 b=b6Mkgg46Bl1oWIChjQOmVenNSQ6B/GP3xI4Uu2VJpucU7WIf0aRvJetRQNLTzXdv5IoMTzrCJQNyaf7FI8c7tynI4DL48GpSpicv0lsdu8DrVnX6yaSOzKU3B5HAschYnp5oZIH3VLLKP+wyJtFMLnLiBdb+qze12dj6RFiflO/6l8FwBnw9kv3IzrKGVDC2paaBVainyjd1c+QitiTFnghgCFpAJ2wkL1ygnt+XbP0/Hyz1x3jw4udFpfHydISA+1glrea282l+LHzk3sOK/md94CljrTbs4T4EUH6dN8sanajM0tyq+7AliF3Vcy0L2uM75MEjWgxQbrDKIMG6Dg==
Received: from DM6PR04CA0001.namprd04.prod.outlook.com (2603:10b6:5:334::6) by
 BYAPR12MB4981.namprd12.prod.outlook.com (2603:10b6:a03:10d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 06:24:43 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::bc) by DM6PR04CA0001.outlook.office365.com
 (2603:10b6:5:334::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 06:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 06:24:42 +0000
Received: from [10.25.97.183] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct
 2021 06:24:37 +0000
Subject: Re: [RFC PATCH v3 04/13] ASoC: soc-pcm: introduce
 snd_soc_dpcm_fe_lock_irq/unlock_irq()
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
 <20211013143050.244444-5-pierre-louis.bossart@linux.intel.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <a98ea2c6-e617-0fb7-8b24-99b8edc8868a@nvidia.com>
Date: Fri, 15 Oct 2021 11:54:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211013143050.244444-5-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc0807cb-c554-45b5-6880-08d98fa47981
X-MS-TrafficTypeDiagnostic: BYAPR12MB4981:
X-Microsoft-Antispam-PRVS: <BYAPR12MB498103A45260BB27AE4FD5B4A7B99@BYAPR12MB4981.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HZGnOrCLJgHhKUfrwapwzgwRE3FwdVJRKGdvUPS9cGHbosVAomheHaT7X+Dq/TKOiq8VIRzxGvWDmuyI8zgrlY+zxBYPU712fG+48QxSAU6Xai5ZBIpXwo+X/zEqlvuT9vRYseRAqFz+uRRC54FCxE5Tvl7Zdc/yiaUKXLG6gNVYNKEc9LPOKU7Ur1dJmqtBmkoi8TS/B0b2bDKNq2YxNOslmlvrrlUV2N8Fx7XmKb10wl0iXE2J03C1wnEEluLlHEFTV+NtK7LPP2G6GIn5xFhCGVNfKOUfNwcR36bkq53Islc8lGrSdLF4FL4xyyNJpoEpkDRIkim/VZ6dWWHVhh5wGrlPEhiYfyDA/41uKJwBetW50PDn6wHHTHRgDwVZmlpqQXV02NFJG3t4QgyY+Zo2eYa7agaBb+buO7SxNMbYQX3uJQmPlnd/S2ktDuy+deRNG5O1YTLibrP0LMIhJCOxt2BpaQwJU4mPxAK36JWLqO92Dx1Moem/gbaxmKwXP1UM3kJOtjfTWBE1QbmGvDpfrc9tyOEODtqDgT/zcTpj/9DtDtMR1p6DdxZyhahGMFYXU0btqCdkSG7dmOhOrrVXom+5RQESNQl+7hjCfMXbQqGel0ndik6gkqtQ68lpxxc+bppvh017Rd+sMMr2wpq6la2KZ29StK7RskwWIqrHjpbx1s1lv8bkHKwY4+zwf7Vd2Gc1ZXPlap+1cGouNR2wLL5+9cdhiPNnubyG6U=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(31696002)(70586007)(7636003)(5660300002)(31686004)(336012)(16576012)(7416002)(54906003)(316002)(36860700001)(508600001)(82310400003)(6666004)(83380400001)(2616005)(70206006)(8936002)(86362001)(4326008)(53546011)(36756003)(426003)(47076005)(16526019)(356005)(8676002)(186003)(2906002)(110136005)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:24:42.4598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0807cb-c554-45b5-6880-08d98fa47981
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4981
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
> In preparation for more changes, add two new helpers to gradually
> modify the DPCM locks.
>
> Since DPCM functions are not used from interrupt handlers, we can only
> use the lock_irq case.
>
> While most of the uses of DPCM are internal to soc-pcm.c, some drivers
> in soc/fsl and soc/sh do make use of DPCM-related loops that will
> require protection, adding EXPORT_SYMBOL_GPL() is needed for those
> drivers.
>
> The stream argument is unused in this patch but will be enabled in
> follow-up patches.
>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   include/sound/soc-dpcm.h |  3 +++
>   sound/soc/soc-pcm.c      | 42 +++++++++++++++++++++++-----------------
>   2 files changed, 27 insertions(+), 18 deletions(-)

1. Till this patch and with DEBUG_LOCKDEP config enabled, I see 
following warning:
    "WARNING: CPU: 0 PID: 0 at kernel/locking/irqflag-debug.c:10 
warn_bogus_irq_restore+0x30/0x40"

    However test passed though. Interestingly it was seen only for the 
first time I ran a 2x1 mixer test.

2. Also after I load sound modules and card gets registered, I see some 
hw_param() calls for FE and BE. This seems harmless at this point, but 
is getting problematic with subsequent patches. This was not happening 
earier.
