Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D8424003
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 16:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A0F01669;
	Wed,  6 Oct 2021 16:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A0F01669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633530246;
	bh=obrWKH5y/Pp7MJGBzkoZeAEotknQTNJLnHZtAlN7hy0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8jgTarSj0/HgQsx3dpR7Be7ObAkWjeiuTPB/ib3bFFw0uETK+VrQyqvQxrSb6GAS
	 5AP1cipGCIh9Qgnj+Pjz0+DfWO/gRrZc++hqB+JyT0uu62Z8lIiJraSDyAHj/iuyR8
	 iKKefCvzc0rRRgMYiVsaSgcCdillOfogxofKBhWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BF76F8010B;
	Wed,  6 Oct 2021 16:23:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FABDF802D2; Wed,  6 Oct 2021 16:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6599DF8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 16:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6599DF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="DQOksQuz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvA4Oe/t67MYdkq364HC6r2MZfS3UxU5qTOXEG5P7wl7k1+qJng2yKCcTSEQEXdmWs3sHt1ZmfTwm0j1/BrTMQyA7zLoa26mY06niWAcUJ4ywIkywZ/oDzx9vxZyTQ/E3JThrm4Ap3hVcaXUx187TMvAZYm/NiT9M1ENL/QCFebvdAAAyOW6dfOE1yvKSPsKOLgZ9NVmPYXTxS3p+V21sVezxymxJWfOQkqeZrke4OLUCt2tTTUjxzGfI5vkZCYJyW41mEGaZTLz2cXKWEAVyHJCeOWPY73VYOImsrxPEu1jQYyVgDNsDI3dF3VOYQGzDGoo89fTzS7ehecYDZYTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoPQ1C9y825CEY+52HG+a5KMBmkiDomtAAPFDXNuVJk=;
 b=hV0pDYfm7Yew++ti1ro6L7LrKbaCL3yMAcXGNzngX31V5UINP98VXyahGiYIKNVaoGfAFjxZlLxSRfh2ZOWItmVNIPsi2gu56pLwnZo6kEP1nfskBqZoOh8F8WUPMFQj+uwIH8tTEOKFnHXIJLiawxbMbVU3ahiEEqdIO2OyIZVIOlicjRggTttmY0DhewoHxNdOP30ChUqAfQJNyA50Hi9kmE8ziqI17QdA4iSGan1G+UagPUghNMG9mS9TwLZ+HjoCd8Ug35wMWyOuWDfWa8/6wp/oRCw/leUzaBdqrqI8FaHAM7MhnV+dyNZ60Mkz0hlDVE0sz1Ipf/NNhw2W3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=renesas.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoPQ1C9y825CEY+52HG+a5KMBmkiDomtAAPFDXNuVJk=;
 b=DQOksQuziybhE1/U0mRmLbkedgYRPZ4LTFVxTGvL3P5DmWM1bxBFoMs9LWsvO25700EMHWN65yXelaVmh/0DUs1uUumrr6MVLBS4c4Wsr80YidfXfLQpj95b+ntOMUiIOIcf1QKHfBDvVAVdpdUNPEbW6o2YkoQaBhXBjQXOKGNFUJVeW9d0sl4xzia3nbImPL7DLAOv8vDJh4G9clU8QupOMHljBYrp00JcNQvxoqy50jDyDtZ9LIx9Q4aRIPk0j5ds0TjAZajOXjL52uOAPpRlROiQAPp1pk8elOh47+z3/nR+gbLNOFojF6dCxmBhq9tgZF+qbNcnOVruKfOT5Q==
Received: from BN9PR03CA0182.namprd03.prod.outlook.com (2603:10b6:408:f9::7)
 by DM6PR12MB2699.namprd12.prod.outlook.com (2603:10b6:5:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 6 Oct
 2021 14:22:47 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::70) by BN9PR03CA0182.outlook.office365.com
 (2603:10b6:408:f9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22 via Frontend
 Transport; Wed, 6 Oct 2021 14:22:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4587.18 via Frontend Transport; Wed, 6 Oct 2021 14:22:46 +0000
Received: from [10.25.98.154] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 6 Oct
 2021 14:22:43 +0000
Subject: Re: [RFC PATCH v2 0/5] ASoC: soc-pcm: fix trigger race conditions
 with shared BE
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
 <cce82420-d744-ee43-d514-b77ac4905ffa@nvidia.com>
 <1efa1c31-7342-05f8-5f73-95e2462d4179@linux.intel.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <3683cf39-632b-50df-c65d-63779c464850@nvidia.com>
Date: Wed, 6 Oct 2021 19:52:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1efa1c31-7342-05f8-5f73-95e2462d4179@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e36e23c3-b635-486a-06a3-08d988d4c4c5
X-MS-TrafficTypeDiagnostic: DM6PR12MB2699:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2699C329FCF5FDFA2D2A951AA7B09@DM6PR12MB2699.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEo/57Z3VFCShLgMNjNrlyPhN/NjVtDvdF0EnnvwdTR/OTXSDIxTpqiY/+N1xDtbNRKHAd7OScYu6fRVAW5Zw/sF5l3c0c8V84u+F7opmOjU08ULOQswMP40Q2uj2J69ISKFARtOKe09ZG0fUQFbjmI3+dniqteiLX4WHkwdWJO9WUqot3DvPR/wSb2x66nsfKNSeoEOsKPOh+uvpKf0AeP+ezR5RSCQ7WI/5dH05SkPQwOILAAcDn54reMM46k4wcdySy6fdaK3ztltOin0Gaide7zNuf/VkMKWwXC5LClI2cI1N5NMVBu/naaYJzhDQ8igsSF4UkYpt1KvxBhmkv5mMyxIyoOliLMIzBVfu4GfayjibQvuPOIPCs6t9GZWfIcb6RdoFfgg9pbH4rNsgeQpPvMiPXs52lygQAdOZWHZV8SwarsQI1hSqOEfQC6dWwp0rz/tnQqIXniMJZMrjZjSQNE4iAocO9jBmEs+6m1FmbDSo1r9dtxiqeh1L0z9Pkjps2rYN9XEtOW6XFD5LvyU1mQ2nNT1gFMEtstGu5dTyMZkkkFu2/BbPoujK8UHaHqL7o++RRAm+lMCaneBBRorADeQ1ZkpjQ0w8S9RTma6+F6UoTxAGDT1O3HTM+iBoyTybt1+FhYTbZ64MkUvtcK5/cI+hwRdDcyxVwXG/uITvaJ7EIR3nO6MI5LSjfMaRSsuLvSIoCr91SYXQMurUsBTKIGpvdHIAyV6JzwKzlo=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(47076005)(31686004)(53546011)(70586007)(8676002)(426003)(36860700001)(336012)(2906002)(16526019)(4326008)(316002)(86362001)(70206006)(8936002)(16576012)(36756003)(186003)(36906005)(508600001)(2616005)(110136005)(26005)(54906003)(82310400003)(31696002)(83380400001)(356005)(7636003)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 14:22:46.2788 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e36e23c3-b635-486a-06a3-08d988d4c4c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2699
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 vkoul@kernel.org, broonie@kernel.org, Gyeongtaek Lee <gt82.lee@samsung.com>,
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

Hi Pierre,

On 10/5/2021 6:47 PM, Pierre-Louis Bossart wrote:
>
> My patches don't change anything related to a spinlock or pcm stream
> management, so not sure what could cause this rather spectacular
> failure. That hints at a fundamental configuration difference, possibly
> caused by your component chaining?
>
> Since in your case you have a 1:1 mapping between FE and BE, would you
> mind testing by backtracking, one patch at a time to see which one of
> the three last patches could cause a problem on your board?

I tested this further. It appears that things work fine till 'patch 3/5' 
of yours. After I take 'patch 4/5', the print "BUG: scheduling while 
atomic: aplay" started showing up and I see a hang. This failure was 
seen for 2x1 mixer test itself.

The 'patch 4/5' introduces mutex_lock/unlock() in dpcm_be_dai_trigger(). 
This seems to be the problem, since trigger() runs in atomic context 
depending on the PCM 'nonatomic' flag. I am not sure if your design sets 
'nonatomic' flag by default and that is why the issue is not seen at 
your end?

With below (just for testing purpose), tests ran well. I was able to run 
2x1, 3x1 ... 10x1 mixer tests.

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e5df898..2ce30d1 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2045,7 +2045,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime 
*fe, int stream,
         struct snd_soc_dpcm *dpcm;
         int ret = 0;

-       mutex_lock(&fe->card->dpcm_mutex);
+       //mutex_lock(&fe->card->dpcm_mutex);
         for_each_dpcm_be(fe, stream, dpcm) {
                 struct snd_pcm_substream *be_substream;

@@ -2166,7 +2166,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime 
*fe, int stream,
                 }
         }
  end:
-       mutex_unlock(&fe->card->dpcm_mutex);
+       //mutex_unlock(&fe->card->dpcm_mutex);
         if (ret < 0)
                 dev_err(fe->dev, "ASoC: %s() failed at %s (%d)\n",
                         __func__, be->dai_link->name, ret);


In fact I picked up all of your patches + above test patch, it worked fine.


Thanks,
Sameer.
