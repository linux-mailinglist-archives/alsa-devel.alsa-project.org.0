Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09742E8F8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 08:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6218C1689;
	Fri, 15 Oct 2021 08:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6218C1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634279200;
	bh=8yFkDk95rUIalJ55p6A3oKRVdRth0u9ACQ6L/a7xpB8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fjmye0g51+0J3Bqh5MuNhXHvQrMYCR+6cWZBClmDTcPCJoFJ98F1a2bfrzRg1J7nO
	 FQbTc3FEFs38xBG6pJ9LrXzYTQLdRNtmiFEkcl0c5OfJz7rHyd3zJXxtP2ciE9KH+6
	 ahebdbomSHDK0hFwE7L++e5IaNke5pfPyDmtgjts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4305EF80430;
	Fri, 15 Oct 2021 08:25:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 234DEF80269; Fri, 15 Oct 2021 08:24:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8F1DF8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 08:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F1DF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="JJHc9EyP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXgGaiFSYSilJojUWmWsoleHMXAPxZGFR6cWSb2knYNWdKZl1GDIn9xhUAUpERPZ/mPpOGbz4Gr48p1uY90a0Mg9le4SpGJIFpQCyVbKWo8fouJrBBQXtVAhYM/uTUPr5pdRQwFkHfCXBn31tgoLltfmgJTFxU82B+luqpKBRPSm/JdSiCAPx4OMkNHbGdvSu3+jnJeapy5qSGxGHioJQv6Niz5D0/oNcKs8Oz1kkT6ruVRyT9xDGuxSRsW+sY2zPi6V3mtH7zEJQMElJiZn9wxetBIqe+2Qe2o2aM+RFjoFVysxEVHrlhm9IR++4ijoG9E4FoEv0oOr9Sq6usxsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMHZZB7R/pUmdlCsJlrEUNVgToE1VfVqzi5PVwANNiU=;
 b=A/LKHu+b+rIflD7o+65mL8nUMyqlvCmHhGR5/TcpDQcefVG2IDQ6qJK4aGThU+36MnCFIgryg70owfSTV1ILzdiAXIjAafKfvZdQJJ5pVrXdFDSqVtDLloclrkPcsOpYkG2DnKXrwaq9YUOJ1TpiZ5Kom4OZ3Xa5fVmsbaPpAk9U8iqBboongow+XSUVg67tc7nKuIs3WML79qIrTRW6e7m31NiKzSAFnavSvV/s+b2/gl23DUNkqXSW2AP7N+jDEgzXt+XhScahupYeJK3CWYIUIYyVJhvMRj/M43JRzvcxIzkCBMkLnHXA8W67MNYVNdSvdSmOkgbO4FvXXkSVHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMHZZB7R/pUmdlCsJlrEUNVgToE1VfVqzi5PVwANNiU=;
 b=JJHc9EyPW3PMn6aZ7ZXBiZ9FF5uL+HAUVfqyIquwc6dYYhBe0qe4w6uSEaSJOaqEhfpVhWe6dw0mrHj+NjQ73LsUZzUpTpHSNQLNaYjv2k//nCHZeogCRpQZX/TziGxiozzQvABO9ig/AvylcdOrE8svee1FvLVDJKIlXFyM1Pexhg7mlRVcSwVW3deUMwtuVsuWmESAnqnJtiBc1sgUbgG/TA2wTKyZ5fnEORPXHCkvMmRNJnOIWeALbZGi1V3CeAQ9Hi5E/IHuEmgPhA+wP311MYPWd222BZAQrAvG9K5VfKAZLMSmC6T9EejV4kvBhukqoxR2GPBeoUI541/a7g==
Received: from DM6PR18CA0005.namprd18.prod.outlook.com (2603:10b6:5:15b::18)
 by BN7PR12MB2833.namprd12.prod.outlook.com (2603:10b6:408:27::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Fri, 15 Oct
 2021 06:24:49 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::e7) by DM6PR18CA0005.outlook.office365.com
 (2603:10b6:5:15b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 06:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 06:24:48 +0000
Received: from [10.25.97.183] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct
 2021 06:24:44 +0000
Subject: Re: [RFC PATCH v3 05/13] ASoC: soc-pcm: align BE 'atomicity' with
 that of the FE
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
 <20211013143050.244444-6-pierre-louis.bossart@linux.intel.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <2847a6d1-d97f-4161-c8b6-03672cf6645c@nvidia.com>
Date: Fri, 15 Oct 2021 11:54:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211013143050.244444-6-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18a81322-d1a8-4f2f-a9eb-08d98fa47d5a
X-MS-TrafficTypeDiagnostic: BN7PR12MB2833:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2833A0F77EA44A78141642D7A7B99@BN7PR12MB2833.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3UWadav8hJFToRpsv2thZA9G5Y5nHKNbNH34P/880zNN0l12gCQercGeRm9tpyNyoFPgUkWtqGRiiKx2c4r+HKs+0xSKzVBIAr+Ap+6jYqqqQxEpZULDIXKUCzIkcINCayDpPkx/ZunV5/c0+vSnaSEw4ZAFOykLBdH4bMj5LWDWYs2/TyLSL74YkfUUw7muQpuJJBF+x3cXN6PYE3Po0vcsnW4Ez2mFkeB7BbWyDLgh6J1jpNZgoZqAtmukryRkn/EIfiExrDs3SG9OYrFGefk5wTFkU0pHdMc9Crc05FQapLCHoGrOAH73p+/a8WnUo+nEZyZ4bbhiYq/+9WmFhinRX2EyrhMLt2gMxxdnP3uX0xNZA0n8HqdGIWmB7fXBZuBh916KFmBZhdSAdK00Qwh6OJmPhiFs+JzH2IpB1mGuCJgDGAl3+HquvRYx/Oi0E4nMx0eDU1UpmoKbNUOdo+8TiEdC3OAqBhZ1x8ZZLBkz3joxn319M+b/9+wnWNummASrf41rxJI4WFu1byFAsYmvK25T5DibLViXG7dqJnHJtEPIG9CjeMrKOLk5xmCvugrYhMRZvLWPcNq/Z3SYLPHZwYHwgRwqU3dufHuXM5wr/BhfrT/FVGrYh8UkVMqNC8xz9zZloscYYVxr9XKmQ6DG94/ukQWNyLKkhaA5XtivJZNqSLyxXAmcv/ZNuGBMQrr3jvl8WX01/P9Bsf+wHCxHx/5LE5ok1nYCW7rlDkI=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(4326008)(186003)(426003)(5660300002)(31696002)(47076005)(7416002)(86362001)(36860700001)(316002)(16526019)(6666004)(7636003)(356005)(36756003)(8936002)(53546011)(508600001)(2616005)(110136005)(2906002)(336012)(31686004)(82310400003)(54906003)(83380400001)(26005)(70206006)(16576012)(8676002)(70586007)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:24:48.8838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a81322-d1a8-4f2f-a9eb-08d98fa47d5a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2833
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
> Since the flow for DPCM is based on taking a lock for the FE first, we
> need to make sure during the connection between a BE and an FE that
> they both use the same 'atomicity', otherwise we may sleep in atomic
> context.
>
> If the FE is nonatomic, this patch forces the BE to be nonatomic as
> well. That should have no negative impact since the BE 'inherits' the
> FE properties.
>
> However, if the FE is atomic and the BE is not, then the configuration
> is flagged as invalid.

In normal PCM, atomicity seems to apply only for trigger(). Other 
callbacks like prepare, hw_params are executed in non-atomic context. So 
when 'nonatomic' flag is false, still it is possible to sleep in a 
prepare or hw_param callback and this is true for FE as well. So I am 
not sure if atomicity is applicable as a whole even for FE.

At this point it does not cause serious problems, but with subsequent 
patches (especially when patch 7/13 is picked) I see failures. Please 
refer to patch 7/13 thread for more details.


I am wondering if it is possible to only use locks internally for DPCM 
state management and decouple BE callbacks from this, like normal PCMs do?
