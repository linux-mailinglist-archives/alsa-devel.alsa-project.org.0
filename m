Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7D242056E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 06:39:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9321A168C;
	Mon,  4 Oct 2021 06:38:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9321A168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633322382;
	bh=TuGhmACH+xuPMvqQPtrTADuuSwouW6kl0TuH51756GE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pPQK/Sno2dapQFppVgZ1Z5lU7E2lmPpF56mpJc7cIc3yspDa6q/oXjzLPDtGsZfGo
	 kqj2VG9in6dbg6OVrbOyS10vqEJH6ADn1NT6XgC5wxcdE6KVo0VAYPGA8DTw9NxJ5R
	 UQJ6JQfaLTuhLBFfqLNXIHfBko+SCbCpHBEQaLiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D84F80229;
	Mon,  4 Oct 2021 06:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6967F80229; Mon,  4 Oct 2021 06:38:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ECEEF800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 06:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ECEEF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="UOzFCfu3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iD8B7JY1A3bZ+20t9hlVLTku7LNZFGVp32Y3i8RXiEL1JRM3/P97S3VlOr8fl8DtNpkv5UoZA0m/0Fqhlyosfhf6rxF8sNtnEZylUgPih4Tvfeh9feqVXSw5YAg4rrv/as2Q8FLJYnUn3mD8UOVh+Y2cMbUbHlGHZ65c2bZB6nAM+iGi9VTS9dQQvUgG3K0HjBqH3yk8ApeEwZBjyvicehEBnHBTZZp1IQ/w/tfQTpFIBGeWZYZs+exNzOpGFFo0oLeggQzUPYtafmXtLGl9+qXNr5oJtqkX+cyg9HPHHc94WpxhBF4ZHVMbdH4ig4M555tuU04xKjdIUDDQdjdEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o00UeLM5clt/TA+X3EzsH8aAFezHinbMI4D7UWXkz3A=;
 b=aTBK6LfdlD5yQcebCD9xgvmf4KDeAcL9IX3zvLbR5O+vFtriNDDPapE1IFvJO7ExiH1dfQpAAoTEIIINphSTy8GwIqdTrfY1lFoiOOmAPvz6g20vF4gFHfcvIVi2uS06Y0DkSt3UQ1sAQ5/yvHwy1d2Fe/Jx4KCYENO4dtZN0BWoRpKE1Vc/u2AfeIMaZh7wMxSgR9pSe0yfsNal/HySRz06ThDbQ3auNRYKAzSldCwP4p/iWpTkysQoGXHNPWmNe1sQ1/0Wswv2upwPWMEKcwjiZUQO9Z5RLmqWVTFQ5i80zMekOKAoXERc6cQnmM5xennrKI84Wo6joLZQ3scMtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o00UeLM5clt/TA+X3EzsH8aAFezHinbMI4D7UWXkz3A=;
 b=UOzFCfu3KecqMElpIoH8obsedfQ0Y/nvYuiHms84Oc+5j3vY3RrfPnN7xlXIDUh0H+VWymu7Q1+gKUmsDE8iW1HFFqcYXIvCS5AMZ6e9rrYpBfKGvaLsEkii0Dhzv1K067cVhya0YBWccMCknmPCzCmYDWJ0vPiVpokBXEmiqlHQUrx9nDp9n4VDL2c3c2Z1CQlNC4VgPgImWJRoPlEHhS9MCtRvkd97qbS7z1eTWQptRtMm/aD2Ijz0+pS9SWUFNnJ9Ys917dHQBDHOxM9phHYD9wRyhVs8Lz64Hg5dvS8CaFbrhQFxiQxNpuPpqkfU8TzTx1D4W7kFvq7M/xPaPQ==
Received: from MW4PR04CA0277.namprd04.prod.outlook.com (2603:10b6:303:89::12)
 by CY4PR12MB1509.namprd12.prod.outlook.com (2603:10b6:910:8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 04:38:12 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::ec) by MW4PR04CA0277.outlook.office365.com
 (2603:10b6:303:89::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Mon, 4 Oct 2021 04:38:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Mon, 4 Oct 2021 04:38:11 +0000
Received: from [10.25.99.17] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 4 Oct
 2021 04:38:05 +0000
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
 <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
 <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
 <40f098c8-b9e3-8da6-849a-eb9a39fefdb0@linux.intel.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <ce796f36-11df-7f9c-55aa-9c0833f28b93@nvidia.com>
Date: Mon, 4 Oct 2021 10:08:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <40f098c8-b9e3-8da6-849a-eb9a39fefdb0@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a99df673-8960-4e8c-a829-08d986f0c5c7
X-MS-TrafficTypeDiagnostic: CY4PR12MB1509:
X-Microsoft-Antispam-PRVS: <CY4PR12MB15097C2A48B44099FBB8FF7DA7AE9@CY4PR12MB1509.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOq7SyReVsxVRDBFt9kpcm0evdEUGuxL3AwOnYfHPqMgDVSBMgraMRykKPQqrhJozrDFP7ffMHZ9hBIGIWKZf3y2KBcrKQeW+CBvl6gbIonMW6RqIRaU98uIPEUxfR5d71VMRRRvkGOtJ/94cKrK1bOlpRjSXNQJ+pqQSFWOzxtB+0H0+Dv+quFxtozjrHg4OkDG8h0IXKmYSaUDxLRe47EPeZnQa8+8PqGykk0rw1u+X3BUNIIrzR0Jk9wXYPURWrDz0jbpuLxG9etPsm700tzi+airxVAeZNxiMyH566BcKYoutha+G9XS/+nH0gOe7nABtgjjJeRZHEGVWHieBcFEVVqhM8PzMNy96Y14xcp4iK3sGcVzyS0AMd1x9khkFe6+SAOBXp1aQlfjAYg2/MUhyJ60xtQtPrGXjXulCKhd9yNLOgPvpfy1pX7f4MEQvyoCftKDDNNWUk2utl9AZbR0abgEwAyRKljP1zTMzoSwmTuBsGan00J0Af41HOSMLreNpBz0ncfombRMJKunYkFeHca3NuyweJFkhvNIIYoxXilR519DwadKdFdL3+3lqG2VyYKK7rnjyDQiwNjps8A+UK8jPSP7Z+uWZbA851rdpcn1ks1bNV6vCMiTqR3VI4HGa6Xm6durAMm1FasO9TC9+w6Vx6EoP06LE+8U2+4/w/WoZk3bzHpps1zzH/M78QkGLLuGXS7e9N8AvCimEkAMXpnFHJR4AraIe0t+wZQgny4YxDSN1v/lwJI7J1OI
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(31696002)(8936002)(426003)(2616005)(16576012)(336012)(186003)(86362001)(26005)(83380400001)(54906003)(2906002)(5660300002)(6666004)(8676002)(316002)(4326008)(110136005)(356005)(7636003)(16526019)(36756003)(53546011)(82310400003)(36860700001)(921005)(70206006)(7416002)(70586007)(47076005)(508600001)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 04:38:11.7077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a99df673-8960-4e8c-a829-08d986f0c5c7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1509
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, sharadg@nvidia.com,
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



On 10/1/2021 12:30 AM, Pierre-Louis Bossart wrote:
>> 1. The original issue at my end was not just a configuration redundancy.
>> I realize now that with more stream addition following error print is seen.
>>     "ASoC: too many users playback at open 4"
>>
>>     This is because the max DPCM users is capped at 8. Increasing this
>> may help (need to see what number is better), but does not address the
>> redundancy problem.
> Going back to this DPCM_MAX_BE_USERS definition, it seems rather
> arbitrary and not so useful indeed.

>          /* first time the dpcm is open ? */
>          if (be->dpcm[stream].users == DPCM_MAX_BE_USERS) {
>                  dev_err(be->dev, "ASoC: too many users %s at open %d\n",
>                          stream ? "capture" : "playback",
>                          be->dpcm[stream].state);
>                  continue;
>          }
>
> The comment is no longer aligned with the code, wondering if this is a
> feature or a bug.

Looks like the comment is misplaced and the intention might have been to 
place it like below?

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e30cb5a..5cb5019 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1508,7 +1508,6 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime 
*fe, int stream)
                 if (!snd_soc_dpcm_be_can_update(fe, be, stream))
                         continue;

-               /* first time the dpcm is open ? */
                 if (be->dpcm[stream].users == DPCM_MAX_BE_USERS) {
                         dev_err(be->dev, "ASoC: too many users %s at 
open %d\n",
                                 stream ? "capture" : "playback",
@@ -1516,6 +1515,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime 
*fe, int stream)
                         continue;
                 }

+               /* first time the dpcm is open ? */
                 if (be->dpcm[stream].users++ != 0)
                         continue;

>   There's no reason to arbitrarily restrict the number
> of users of a BE, or the check would need to use platform-specific
> information such as the number of inputs/outputs supported by a mixer/demux.
>
> Maybe Morimoto-san can comment since this was added in:
>
> 1db19c151819 ('ASoC: soc-pcm: fixup dpcm_be_dai_startup() user count')
>
> We're not done with soc-pcm.c cleanups :-)

