Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 372112176B1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 20:28:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6EE615F2;
	Tue,  7 Jul 2020 20:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6EE615F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594146486;
	bh=D5kAoMimfYRSszzCjW6QFY1+HiXv+uXnafc8RtyovDs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MNIgBxcBLnOvPQOWmYEjSmIU/EQrWVUm5A+tXs+wz9qN4KGZUCkCTBwotDhRtE3qZ
	 DGt/k2EXmAcoblo/tXQ2r32GrQ8p+IiYV8hQiPxtpS5z2cb/A/30/yWKztkwXEiQeS
	 Vbz8vTzIYbg+381xTTp8GEpivLlkpoYv1Q15HxPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF87CF8011F;
	Tue,  7 Jul 2020 20:26:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E122F80216; Tue,  7 Jul 2020 20:26:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 899B9F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 20:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 899B9F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="U4YNtjQy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVHQ+YhtnR8eoC+7l9fMBpqnc1ixMGR/ULlRQCB5JwNpC/USRBKPsNUHOUfvBf2iiOJX2ndV0wxLwnaSdFPg+lJ088nT4bgqLVN4eOCUvwl6HCRrO6qLBKoKKsfbaM/CdApKw6Skq5DVaViXq3p/uICRhgae/IIOC7a5dVPsfulGUrAcf0IGDZ7oucEfgS5oPGH1c6uO57KcyFBpaEIEhHgdx7AtSmRMCSpIyPNmiLbEjMzAZvPvAriemfR7HHo5PSPJ5TJhh9pB6xJky6ZsRlazQxSfU/UbSmbKWKvQnjpsHcwrakYwTVQAF5X+PMPgjPyf/o0xJ0tCalSpg2M+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooyBceck8uAbPM6TfvBq8YPgeDbgF7vw63JwFdeUChE=;
 b=dsWnXGbCM0fBPBfzZsoq4uZ1vQ1Pb3sfJt33pgiC5chy4HsBkqfo/VgSAWPImXMFuSdwn5pQ0aC3JpAsoMUN4b/ARFC1WPKrZarognifM/XpHV9SKnzMd4LgedTud9VZIt9HzXeFTQdVw+q355fJw8c9txr1w1yzVPkBUrdsNhmrw19uZC2SLpd/kzFeVqKN0UFD2QbMWHTFGWB7g0dGHp9a4WhgLz0+oBUv7KOZlnoZTuTOKiO9y+Qrm4rkDPl6uAjNixjCuy5g65XgqGmQ4zozNfTTS7+MammASp0yc3ItiCtvhyr+hxTDM7VZHHDnZXZIGPheWLp6vAlYKXr5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooyBceck8uAbPM6TfvBq8YPgeDbgF7vw63JwFdeUChE=;
 b=U4YNtjQyglbfTHyE9KZksx2Htq6gBalF+RohsyVJHEvsj60HFZdseyyz17JFNNOHcKTQSZIDP6RFXaPJ8LDE+QjRved8/6GhZo71vQKT8gB+cAtQuoe5f1gkC1uq8j6oKQ9h8EMthTjdGkr62zJUxzWbFfl9I8tmcu5QuQzFEoY=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (2603:10b6:4:55::20)
 by DM6PR12MB2873.namprd12.prod.outlook.com (2603:10b6:5:18a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 18:26:14 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::1477:12b0:571:5000]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::1477:12b0:571:5000%10]) with mapi id 15.20.3174.021; Tue, 7 Jul 2020
 18:26:14 +0000
Subject: Re: [PATCH] ASoC: amd: add ACPI dependency check
To: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
References: <1594118813-18689-1-git-send-email-Vijendar.Mukunda@amd.com>
 <159413142467.34737.8485886141400585716.b4-ty@kernel.org>
 <755e1c02-21d5-db66-0b52-42ad65888647@infradead.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <b85397e1-531a-00bc-b672-bfbd2d9ada6e@amd.com>
Date: Wed, 8 Jul 2020 00:10:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <755e1c02-21d5-db66-0b52-42ad65888647@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::19) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 BM1PR01CA0079.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20 via Frontend Transport; Tue, 7 Jul 2020 18:26:11 +0000
X-Originating-IP: [165.204.159.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1e8c2ac7-8f58-42e4-eb1f-08d822a33b28
X-MS-TrafficTypeDiagnostic: DM6PR12MB2873:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB287388B30E3A4D67F273DA7297660@DM6PR12MB2873.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0PKFQ0Cy8DHt7zF9ePiB+9CmkONdh0XNljOeTt1e0oKpePmUOmLqp1KTYyhluII/7t89847x5NC70nmsQgOM/p4aWfE2WmpdHZBHjYUCwYKwYxkm0daBASjrW9Gi2kY/jQTIfWAXp4PxGKgFhyYsIZAmjk4t6aShxjG6NTvzDDZGnJPIlqqnuBfyZnvFvmt/zHymimEMcqPhVRuuUnID8NrqUC6yCNIBd0pmXZjtzNgJcDMT+ErROpuV+MizCT/JEYFfBg40LBcc8GtxzRq9nSIlvu8DXWxe4Ye9XMcrlAVJrnOwH4WaNCpFcZt5AMGMc6aZNKIZQWc3IOEYmjSUzvKhA8QRWHNsgN1Wr4o+iSZPy80ov3BLhRDfGQoQdcgyAkIuyamXL5ryoEmwIbZyVkKoMrwtv/ftqWsqXXUiWZGgm57hrMaVBLFuPEjwaI24wrztc4wtCwbbHzYOlt8aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0155.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(2906002)(66476007)(4326008)(66556008)(86362001)(186003)(83380400001)(52116002)(6486002)(5660300002)(31696002)(16526019)(2616005)(8676002)(36756003)(26005)(66946007)(8936002)(956004)(966005)(54906003)(316002)(478600001)(45080400002)(31686004)(53546011)(110136005)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ERKKBCPM5Iudd26eaoQqaClZlv1uUZw5qDHuqSx3DQXDtU56pKox7NflJlWuSNPjuJg6Y9DvtdDDo5UZcAK9UJNUg4Bp5YCYCy6XNRkseSK7vvsyWLefC2VdYgenSe83OYGXqL9F8ShnsPx+N6nyQ4lyA/NiFV/d1Wra9I3Q4GA3dxQIBbQ6rO23xQsKMkrApDhT3TG+x5NMWiSZeb6WL5caLIONhnJjgCqWcB94z7xfuAC5xEyXBIPolF7ZXvB2RTfrk0oQx97Xg0MyJM/gAFWBRnebOUY9x8/MXZ6eyWVTJwO4WI0MqmitJgWAhmrGeVUUi0R2Bwu9w7KMe15X41jqWDT0ir7cqCzvRsbIBiDKKSgltJtss+Zvy8SJwLoAq8EnRs5uyXV4eYtssZUWyGlQx3ZuAj91ZhHcLK6DzQkgUxj8Z8z6bmnSEu0/gnyIK831pMQp6r8JRi045vfXApZat61tBWtbbRqQJrXBoqddoMPmyTGKs8PDObW5u2YM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8c2ac7-8f58-42e4-eb1f-08d822a33b28
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0155.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 18:26:14.2055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGhH6O+BtsGB7wnpPDOzX7bZybSVAkcSylhQBwXEGxc43o+h74Vfhq+k5oaUzEwbZaARltGX2jfaHoGzyk1wwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2873
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, hui.wang@canonical.com,
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



On 07/07/20 9:05 pm, Randy Dunlap wrote:
> On 7/7/20 7:17 AM, Mark Brown wrote:
>> On Tue, 7 Jul 2020 16:16:41 +0530, Vijendar Mukunda wrote:
>>> Add ACPI dependency for evaluating DMIC hardware
>>> runtime.
>>
>> Applied to
>>
>>     https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbroonie%2Fsound.git&amp;data=02%7C01%7CVijendar.Mukunda%40amd.com%7C208d9cc8e38b4dce718608d8228b70af%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637297329610560875&amp;sdata=NrNkECQoF2k0BO2NEQVON%2BE%2BP0clg4nPqH285c7HHzU%3D&amp;reserved=0 for-next
>>
>> Thanks!
>>
>> [1/1] ASoC: amd: add ACPI dependency check
>>        commit: 68d1abe186d1c865923d3b97414906f4697daf58
>>
>> All being well this means that it will be integrated into the linux-next
>> tree (usually sometime in the next 24 hours) and sent to Linus during
>> the next merge window (or sooner if it is a bug fix), however if
>> problems are discovered then the patch may be dropped or reverted.
>>
>> You may get further e-mails resulting from automated or manual testing
>> and review of the tree, please engage with people reporting problems and
>> send followup patches addressing any issues that are reported if needed.
>>
>> If any updates are required or you are submitting further changes they
>> should be sent as incremental updates against current git, existing
>> patches will not be replaced.
>>
>> Please add any relevant lists and maintainers to the CCs when replying
>> to this mail.
> 
> 
> Vijendar, you should have Cc-ed me on the patch and you should have
> added this line to the patch:
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> 
Sorry Randy. I have forgot to add you in cc.
will fix the kernel warnings and upload a fresh patchset.
> Also, now
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> 
> although there are now 2 warnings:
> 
> ../sound/soc/amd/renoir/rn-pci-acp3x.c: In function ‘snd_rn_acp_probe’:
> ../sound/soc/amd/renoir/rn-pci-acp3x.c:172:15: warning: unused variable ‘dmic_status’ [-Wunused-variable]
>    acpi_integer dmic_status;
>                 ^~~~~~~~~~~
> ../sound/soc/amd/renoir/rn-pci-acp3x.c:171:14: warning: unused variable ‘handle’ [-Wunused-variable]
>    acpi_handle handle;
>                ^~~~~~
> 
> 
> 
> thanks.
> 
