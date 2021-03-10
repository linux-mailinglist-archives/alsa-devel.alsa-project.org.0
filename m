Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9893347CB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 20:19:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 357B616D4;
	Wed, 10 Mar 2021 20:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 357B616D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615403941;
	bh=Ro89p7CCiFm2t4RczKzxuEdXUruiFuCtlhxAbFak7W0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XtJghIWf3gRHZbEitd1WOlCP8CFTjBPZN1StNhFQtFtvCqs374DxSgpJpZuIh9FDj
	 pkUIF9Bw3LE0dFsc3WxEKEKi7uQOFE0D/mMMOGt5RxtfmRTxHVrwDjo6MGIEsVtIj3
	 pbed0hldZ03htNs0PtqywfMzeIgBBGOiwbtbYsZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D5D3F8010D;
	Wed, 10 Mar 2021 20:17:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50EF9F801D8; Wed, 10 Mar 2021 20:17:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23AEDF8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 20:17:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23AEDF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=Nvidia.com header.i=@Nvidia.com header.b="YwPm+JjS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0AQop/xgd3NLWaLZwxmIlEEVHZAAWSmeroSeRzJV4dAtAgcEg7R5XHwMOKKuXDSNecWp3dRv2bz/kAd02zx9aeOx1oLs6ziYsmISlxGtpuxkOp6iEBRotHe8gATSE3vbmVKLV5YAxuZVz1KaDBTLnRkBfINra47xCsBMvNCkXZCmvtrAF8OiXPFVWZTc3TbTRRWuxHvyudJQogRWMNmOv0JhZtT+1666jhoK4Zgr8tQNJYPSMRdOzZnalw2xp5e/PuHwyEQeAf2r5RDHA5Vt26DhiYcz9Cn32ouWek8ZPyyJ5Br8PiNPALN7U80sxiENzinTIPKS+WvBacbpmxy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e06trEjxm3VBYonZIs6YUYGfSXJLgHsv5EYk3X6ITr0=;
 b=mzPcl4rMm9uOahGv4anUsv1P32qnJKzpU9QnZ9CcYx3Jn6D+9JBkTp+OFBISyQFARJFApew8SQMsvTD4ORCXsQ3+9INgANsaegHSnb8Hb0zGUcLk7c6C2HjwFdw+G+aZA6UBj1+a60Y4y/Pfk32cnyeSKJvgHaLNaj8e+t+4WxVygt6dyUr4UfYuEuYM99+LmhjkJgAt6k0GDDWJq6M3iWJnTWh/TB65yu2OhS6c/Li0Lvhqzq1pnyTOMMYPUyHG/MPYuSeAVPr7dYmq3Zc/E9TPlXCtFuukaYuJaLB1eRxDtc0r21LhAf2kocW5imei5xeJ7v/EHlOzTnMIP7y1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e06trEjxm3VBYonZIs6YUYGfSXJLgHsv5EYk3X6ITr0=;
 b=YwPm+JjS3RZK4uFh2PBlTfPMVB1+zFo4azy4UXi4Kna8Nhyi0My4Y685txIrKbpvkQHSgc6RwaW+BA8rqixMcHcthMiFT5yfmogJ+Z0AMjw+Hbsr7qI89ePW9Ta88SsAPOPueUSPrSPjxf7NWIys/AxEA/+tlfy4m5z8hU6JO9J6/6tgFHKNqDazjWEOA9WZiEs29QRFEXnhG4bPooNm0kGeJ9PEyCDfvaxhvkKbYsIjQHi2KLBhtD4VAQx0XmETrJUpNkCOzQpeOdnx3aVlmICEW9qgc78eIcMoiuEXYzlWf5/1vXw+aYVgyN2Zmz2LbHsk2RRGjQsDfhjNx1rZHg==
Received: from DM5PR13CA0064.namprd13.prod.outlook.com (2603:10b6:3:117::26)
 by SN1PR12MB2496.namprd12.prod.outlook.com (2603:10b6:802:2f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 10 Mar
 2021 19:17:18 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:117:cafe::40) by DM5PR13CA0064.outlook.office365.com
 (2603:10b6:3:117::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.16 via Frontend
 Transport; Wed, 10 Mar 2021 19:17:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Wed, 10 Mar 2021 19:17:18 +0000
Received: from [10.26.49.11] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 10 Mar
 2021 19:17:15 +0000
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk> <s5hzgzbvube.wl-tiwai@suse.de>
 <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
 <20210310165235.GD28564@sirena.org.uk>
 <cf03ce61-1501-e0e7-6887-d921c7d1af62@linux.intel.com>
 <20210310181611.GE28564@sirena.org.uk>
 <9e1075c6-da49-d614-e7af-30242dd3d3fe@linux.intel.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9020a65c-b8b8-ac1e-d0f8-a12e507322b8@nvidia.com>
Date: Wed, 10 Mar 2021 19:17:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9e1075c6-da49-d614-e7af-30242dd3d3fe@linux.intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 260c4728-e1c8-4242-199c-08d8e3f91f6b
X-MS-TrafficTypeDiagnostic: SN1PR12MB2496:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2496916747EAE3075AB970A4D9919@SN1PR12MB2496.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: puqShxzMXjR+zZEA17f0cZV19t5wMmvyowU7zVVtJpQnKGR1wtoB1jyPeEBbeKx6rjs7UkqVbEMK5EQ4LpcFzb+6SWr7bUvqy1KkUYwhv7d3swPVle0eqbz2qvV6ITFr+qT/tJcrmIiUcgnRRpXQ5mL7axMvPfC+u65ZqyIpkDA5/KkmSEnR9F3Vd4fxRp7LwFhqM/GBHCpMUQNXBftnEzzVcn/TM7HeWcxquntff5kJDGJiMXUdYZ2HWoriDSEe/a+9PZ1TKjyfhYLieWuGzAmseGhyFT7aHWXYyirj67IzN8wpla63eDzIvRmL5DUeRi069WvwVqtGkVB8mXFvgt1CG8l01wUsRNa4ULXRFCK0q56oMTGqT8M4C3bOVTGArd4qcI9mqHttxj5uqeGGxfAn2lxq6sgHpITCYyu7TiTfNuGLQOkvuCE3jizlqkB3jhD25+JBh6w1uCBjfPaZeaDehaobnMTV/V2/Fy6yKOFG8pbOH05D9e1GEDx0NHXNyyy9mQikZPpx25NpYwCTHdGh1vSeCoMwBYxCY5pop7wZpEpmqjWEgWuA+pG9Lr5oyjJCqytjUqTUw9zIxQYu2G7ykhSLVyinV3EUcUXdRYnQGMOYdg7ft0k0pW8Am1fEZsSJFn/29NuXxoazolnuVn5vd2ZXkPmZl4sfRn6Q6tFzBXfG4EWYghFyOPuLQP8yJy9xHUBM4Mne2LSFGzojwdvsqO24sT+QHBTBOWXlRyo=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(36840700001)(46966006)(2906002)(478600001)(2616005)(8676002)(5660300002)(4326008)(36860700001)(34070700002)(53546011)(16526019)(70586007)(336012)(7416002)(86362001)(70206006)(186003)(8936002)(47076005)(356005)(83380400001)(426003)(7636003)(31696002)(110136005)(16576012)(316002)(54906003)(31686004)(36756003)(82310400003)(82740400003)(36906005)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 19:17:18.5220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 260c4728-e1c8-4242-199c-08d8e3f91f6b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2496
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-tegra@vger.kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>
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


On 10/03/2021 18:37, Pierre-Louis Bossart wrote:
> 
>>>> Build time dependencies aren't going to help anything, arm64 (and to my
>>>> understanding some future x86 systems, LynxPoint IIRC) supports both DT
>>>> and ACPI and so you have kernels built with support for both.
>>
>>> well, that's what I suggested initially:
>>>         if (is_of_node(card->dev->fwnode))
>>
>>> I used the of_node test as a proxy for 'no DMI' since I am not aware
>>> of any
>>> means to detect if DMI is enabled at run-time.
>>
>> Can we not fix the DMI code so it lets us check dmi_available either
>> directly or with an accessor?  I don't understand why all the proposals
>> are dancing around local bodges here.
> 
> something like this then (compile-tested only)?
> 
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index d51ca0428bb8..f191a1f901ac 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -166,6 +166,7 @@ static int __init dmi_checksum(const u8 *buf, u8 len)
>  static const char *dmi_ident[DMI_STRING_MAX];
>  static LIST_HEAD(dmi_devices);
>  int dmi_available;
> +EXPORT_SYMBOL_GPL(dmi_available);
> 
>  /*
>   *     Save a DMI string
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 16ba54eb8164..c7e4600b2dd4 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1574,7 +1574,7 @@ int snd_soc_set_dmi_name(struct snd_soc_card
> *card, const char *flavour)
>         if (card->long_name)
>                 return 0; /* long name already set by driver or from DMI */
> 
> -       if (!is_acpi_device_node(card->dev->fwnode))
> +       if (!dmi_available)
>                 return 0;
> 
>         /* make up dmi long name as: vendor-product-version-board */


Sounds good to me. I would have done the same if I had known that the
current solution would have caused this regression.

Cheers
Jon

-- 
nvpublic
