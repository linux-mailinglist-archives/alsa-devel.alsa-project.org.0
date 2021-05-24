Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 846A638F34E
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 20:52:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D7001614;
	Mon, 24 May 2021 20:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D7001614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621882324;
	bh=+8SaguF7qGhYym8qHgP/8PhUo/RlIjnEGuoOvEd27G0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BpBJzQ0TMWSuB5BQAZX33p/Inlrx1mWfKrwHkFLs34feBYrZoYciZaqsNYrn6Y5+b
	 pRqdz1wKxMudyxe7cL7FSrJgi40z+16e2mDZmQ0MyFGqVLtpW7n63iHQ7Izy13mYBw
	 p/Iig2ptCwn1ENLGpPOT9OeqI3e5QAlQ2WOuRTiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7183CF8022D;
	Mon, 24 May 2021 20:50:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2768BF8022B; Mon, 24 May 2021 20:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D94FBF80149
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 20:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D94FBF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="jTocPNvw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbnCPROkwxRy052ADbjICfmXCioGKerC2llzfrD5Z+yE00CiNwVz+g/MAM6g5xCR/7K5/L8gxMe8JRXRrqcrWvuYEDc04VPvGnUW+sfxpwb7ugstz8cgahS0fY/c/4kRvmYe1NvPhC1oPSf+tk7gGt45KhAQantYXYC7rRsaUmyXPR/38BVobO27kYbMCu9fDk5zu6KoWezdLBi2Rc2QAoC/zMBYpvMNOYaRXiiHHTGJj4zHvUysGA18F96762Nf7igk5zrwdDgCeXhMYdDlFt40+RmKMFxU0DJANlqb7rWsVWuqQgyiRcFikMLYegQQu7U6RM0YLlwbjupbYInjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2vvZ9jE5uZ4fFHVbr41tZIbCOJJa/tlhC9oyQg3BVI=;
 b=NTuXqyYWqtDfzXI94ST9cFLYRu7WYILIbnctdz/QtwYP9M/xuEasjPd3q0lJ3+U2UeE0fOJDBncDMnidbKlY+Z5kFNyzJ/kn0zC7E7eCKL3yc6+S5X20DNamXiqvz/JGr9epFE8gBL9R52jnbOMPkom4sNUMpfA8+x5dZRSdRNNAnDPX6+syW5F9rwruHSHMw2qvCPax1MyGl+BHGfzPed2DBXOGSCkCm9niLha7eSZSEZdsEZFl+cXNerIaO4gACowsc4Rtj76GNqg6996rt63XnkaWP9+8r1n9K+MECHgM/qPUj3MgMpZko/dGDzr8yg6wyBtMhEkjUjXNAxECFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2vvZ9jE5uZ4fFHVbr41tZIbCOJJa/tlhC9oyQg3BVI=;
 b=jTocPNvwbI6KgAC7tkBbNgmTxl+V8Mlwdw4CbQLOLZDpik47RIyQNjwjUxysCg87C/rg/xwfEA81NtlLwxA/SQ1V+PzuUyLordjbiPul/EeMFS7LxyWnc1v3JPdb5uTPr+NZRlz4KAqvh8/RCqn5Bjm1H7F0fi+kNxp4gqdL/426jJxQhg+rIvzlLKJetdr+lfsGVZLELri8q+2s4DDaRCx6ZSB6CR4YdsACgu50UqDwW4/9qUWHK8mGyVYIm1gqYNrA/1ffvuXLqhs6/G0/a/RHj40ejVvtPw7cPYnKVTQpCkJ2q00j5UrvZyrU63HR9KMQH9SOgx1lMwPB11ew3A==
Received: from DM6PR21CA0020.namprd21.prod.outlook.com (2603:10b6:5:174::30)
 by BL1PR12MB5190.namprd12.prod.outlook.com (2603:10b6:208:31c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Mon, 24 May
 2021 18:50:23 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::ff) by DM6PR21CA0020.outlook.office365.com
 (2603:10b6:5:174::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.2 via Frontend
 Transport; Mon, 24 May 2021 18:50:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 18:50:22 +0000
Received: from [10.26.49.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 18:50:20 +0000
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Ion Agorria
 <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <32171079-ed4e-1147-2272-5f11bc480c6a@nvidia.com>
 <91e53907-d87d-aeeb-4644-3926d4311daa@gmail.com>
 <6bc26992-e136-ef6a-a956-382b5cae5db7@nvidia.com>
 <f9631faa-5fc8-ecdd-709b-93b58e45a1ac@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <cf2ee04e-d4cf-14ba-92d0-aa113eb7b8c8@nvidia.com>
Date: Mon, 24 May 2021 19:50:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f9631faa-5fc8-ecdd-709b-93b58e45a1ac@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaf2b72d-d116-43fe-3d22-08d91ee4c969
X-MS-TrafficTypeDiagnostic: BL1PR12MB5190:
X-Microsoft-Antispam-PRVS: <BL1PR12MB519061159D969DE8120B3DCAD9269@BL1PR12MB5190.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Sw1suuFJkgMHz2DTg6yDX2+GBjhW+HIQOzyI3DPtehVxWZOPOMTKZY9KhscF9bS2+yO6LgBTrsERbmWaSWmJ4aOzRywe9O66V7Vt/wLfaorE5njTtPIt4CVvwzvzfaEshzQqa3X5uzFVaiY1Mzz/jG2T1IeRViga65F5izDqRvCKdYkqrGVELco1/x3D9PVutCp3T6XHUpKqp+NAeeX451brus4WGbuz2Qt6FFJIphhPPfyaC1Jk34s7NQI0beMVxbGBZGKE7/RrXO29/Ogu6JaBcoCV9Zt2z6ObxzMAm816zR5MzAgcZxIc9fmWpHE/IlYWhYaEp56mKKXp06t4aURbM5knrTszcIAVDtLTHiX1tAegFtz5cPxZY5/2inUT9nCinAUH/nplW8twu5RTD51zuxTeNlPwoiFbBDdDTx3A4DaQfCadfmTx3CKSfDWO52bqrETzX8ifnebX8XFUhd4sDb2+wmcg04xapxPJn0nwqzn7NYakc5Bw4xbWeJaLZ9pWIRI0BBJfShMl9MZmXX2tXR1I7L/L0o+6u0ftcNg8sTCjwqskOuD5/mdGUNG9hyV494Fgein4Vak80ZrLLpkWGKnvEUB7fmarMO+hUmlJu3DXSe6aAEe5r/eseAORSZX5LQBcyqr8ZQH1UrnLDSaL7xsrunXP5pKRsIAkPf4AIe/LOTKPPGQXnX9Zeo0
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(82740400003)(186003)(36906005)(83380400001)(478600001)(8676002)(316002)(8936002)(4326008)(16576012)(356005)(70206006)(31686004)(26005)(70586007)(2616005)(47076005)(7636003)(36756003)(16526019)(36860700001)(31696002)(5660300002)(426003)(2906002)(82310400003)(53546011)(86362001)(336012)(54906003)(110136005)(7416002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 18:50:22.9070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf2b72d-d116-43fe-3d22-08d91ee4c969
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5190
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


On 24/05/2021 14:40, Dmitry Osipenko wrote:
> 24.05.2021 15:22, Jon Hunter пишет:
>>
>>
>> On 21/05/2021 20:05, Dmitry Osipenko wrote:
>>
>> ...
>>
>>>>> +unsigned int tegra_asoc_machine_mclk_rate(unsigned int srate)
>>>>> +{
>>>>> +	unsigned int mclk;
>>>>> +
>>>>> +	switch (srate) {
>>>>> +	case 64000:
>>>>> +	case 88200:
>>>>> +	case 96000:
>>>>> +		mclk = 128 * srate;
>>>>> +		break;
>>>>> +	default:
>>>>> +		mclk = 256 * srate;
>>>>> +		break;
>>>>> +	}
>>>>> +	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
>>>>> +	while (mclk < 6000000)
>>>>> +		mclk *= 2;
>>>>
>>>> So this appears to be specific to the wm8903 codec or at least this is
>>>> where it came from. And given that the switch statement is not complete
>>>> in terms of the sample rates (ie. only has a subset), I am wondering if
>>>> set should keep this specific to the wm8903 codec?
>>>
>>> The RT5631 codec of Asus Transformers will re-use this function.
>>
>> OK, but does it need this FIXME part? That appears to be codec specific.
> 
> Downstream RT5631 Tegra driver has exactly the same FIXME.

What downstream branch are you referring to? I still don't think that
that is a good reason to make this 'FIXME' the standard going forward
and hence I would prefer that it is kept specific the wm8903. Otherwise
people will keep using this code without understanding if this is
needed/correct.

> Although, I now see that downstream RT5631 uses 384*srate for the
> default cases.
> 
> I also see that WM8994 driver that we have in grate-kernel for Galaxy
> Tab and SGH-I927 also re-uses that mclk_rate function.
> 
>>> IIUC, the default switch-case works properly for all rates below 64KHz,
>>> at least I haven't had any problems with it. Could you please clarify
>>> why you are saying that the switch statement appears to be incomplete?
>>
>> It looks a bit weird because less than 64kHz and greater than 96kHz we
>> use 256 and for only 64kHz, 88.2kHz and 96kHz we use 128. So it is not
>> clear to me which sample rates have actually been tested with this and
>> if this is complete or not?
>>
>> Is it intended that we use 256 for sample rates greater than 96kHz?
> 
> The 128*srate gives MCLK >6MHZ for 64/88/96, 256*srate gives MCLK >6MHZ
> for rates below 64kHZ. Looks like the goal is to get MCLK >6MHZ.

The wm8903 supports 8kHz sample rates and 256*8000 is less than 6MHz.
Yes the FIXME loop corrects this, but you could also extend the case
statement to multiply by 512 for 8kHz.

>  The WM8903 datasheet says:
> 
> "The  following  operating  frequency  limits  must  be  observed  when
>  configuring  CLK_SYS.  Failure  to  observe   these   limits   will
> result   in   degraded  noise   performance   and/or   incorrect
> ADC/DAC  functionality.
> 
> If DAC_OSR = 0 then CLK_SYS  3MHz
> If DAC_OSR = 1 then CLK_SYS  6MHz"
> 
> Where DAC_OSR is DAC Oversampling Control
> 0 = Low power (normal oversample)
> 1 = High performance (double rate)
> 
> I see that DAC_OSR=0 by default, it can be switched to 1 by userspace
> ALSA control.
> 

Yes that is all fine, but again this is specific to the wm8903.

Jon

-- 
nvpublic
