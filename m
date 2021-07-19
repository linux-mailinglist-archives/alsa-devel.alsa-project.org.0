Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C27063CD739
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 16:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 453D21614;
	Mon, 19 Jul 2021 16:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 453D21614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626706483;
	bh=lTROpzW7wgDoE/sasDu0kHwN578mjjJ4QLYMlMScyKo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1LWyYTMe2YT3AxmdnoC6KJoQsX64+xjI3MGJ5Ur6BOQZDUXUXJxkOGGVWV2/B3BR
	 oDVbOYhkkjK0OTYmDHboD7viNzn9o6MhpgV3p/4r1pZe7/9F0Eqx11gmAd/BWIWvR7
	 959wTLuawhNBWibCNFW5tzc6FY92O4yEsLAEQK4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4C0BF80256;
	Mon, 19 Jul 2021 16:53:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0BB9F80227; Mon, 19 Jul 2021 16:53:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2086.outbound.protection.outlook.com [40.107.101.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96C29F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 16:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C29F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="hLFf1G2x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlVRHZxlsUCg78gzcgO8hLC/JpZaXtX+DghyPUl++lc10dhjjJ3FOMVhHNGKt1RSsyn8vD0vPEXAY9tnqjl/OMnHLwHWjwpDm31td58HqHiwkmOiOSmI3kUwV/1covNSv0zgGcsLlhVmZIZ9AYwAk7zRgazDDCLTsh3EVTE5fdfAPVk7Wkr7dgi1A1J+skeSgafjKyKZmjJX1ipi2Qx4+xbZi/CbvxBzImCIuLndoryqytLGyManzF7YIhKGiK5XGFeBOeXFY6qvpTfOQYdDxoh5xB6w0LK9akvF75bNaqiM/2HPuSYM/ix2mVRH/4b01vb1tM4BbNv7l/MQCESf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qizHdaoGrBkSKVsKrTcSOm+qXBV4xlKKh8n83J0P1SA=;
 b=azJCBYgJOHGKohn8igEzgisg649EU1L3zJa1oLrdQT85WDv9bR/BeGK5rnxAMOlwL4igIzAZxY5X4Ixh8s90b4xE8UbD7M4jLsoFJMH+031eaGIhHrwu/LwFCGskR3kZxJoYTGdjrZ/tCtylykb4PYwQooKeSVQBWUdMrAsvvhto9UNYBlZh6buhktjhvimCnCLLpgve84LXMpBa0dPi3+XyoRZnpo9cCV1aTmJXMFOdPr6+xAHEr4GXdgzHFU/aEryXLzwkq2Dl/7uEMbs9tZRl0sHc08nQC569oPIP4UP3sWfDEd3yFvVnt7EnkfKOAs782McnifYi9udYtdX6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qizHdaoGrBkSKVsKrTcSOm+qXBV4xlKKh8n83J0P1SA=;
 b=hLFf1G2xx4mJDyGJM4MDz2jKBx4JE3eROVgwCFgotVKvFfQ8XpacArymQ3JoBe+DPxc3tpcwZeFBczao2lO9LiP11cEVEc13gYGCGHOnfT6IWt0HTmnKCtxsOF6WiwszdUDfmMftkK3IhMuczsLt8z0159F0GMA0EXIJrEl+Jw0=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com (10.172.98.23) by
 MW3PR12MB4585.namprd12.prod.outlook.com (20.181.53.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22; Mon, 19 Jul 2021 14:53:03 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4331.033; Mon, 19 Jul
 2021 14:53:03 +0000
Subject: Re: [PATCH RESEND V2 00/12] Add Vangogh ACP ASoC driver
To: Mark Brown <broonie@kernel.org>
References: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
 <5673f620-fec1-d2a3-0b78-a1cfdda04acd@linux.intel.com>
 <ff857faa-c8c4-0f73-4ede-f8f3ded4e923@amd.com>
 <20210719115636.GA4174@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <db4646bd-38ab-0862-040b-2efc6219e198@amd.com>
Date: Mon, 19 Jul 2021 20:40:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210719115636.GA4174@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SI2P153CA0008.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.0 via Frontend Transport; Mon, 19 Jul 2021 14:53:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 479c89e8-a646-4d4a-5843-08d94ac4e8e4
X-MS-TrafficTypeDiagnostic: MW3PR12MB4585:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4585E0F0B3E1F009485B8A9397E19@MW3PR12MB4585.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4AmKdcCw4/P2gWBphay417Tdg/pjsTx53vugkK+hZZ7coX7jN8KXsiGTrouf9G6DiOFB4FL6hu3VfL95fEjlYUwm0v+LbR1n9NO4suDikZtyFg+RUyq2qmmC+O82XXxNLLZut4zEL4VS6OaN812BOj4bFYwm8U1BjjFI42vvUeDOJ3vtuMZGuYWNT2DEoBD0WosXfkWxS60Mj7dqsvoITgonEN7o77PLVhFQ77TpQZnOABUpswgZhn4gtwvCJhLfQqLTUQgjHB1L6eu/pBGexmdyUtUEIzqSkZTdAn/8fbOEn2aDQsjiFvHr8vqMTC35RqTCE93fXLdDVqVxdXVBdAjBe0TmRMKHAEB2QXZqRW3Uea0qMv/j/bmtRHSPBiLHtrdCMbUuDQfm9QKx2rm+eIqYfQSNPOilOSl4kVftZe5cnzmjR9SRV2pAIGY0sLf2ac5oVw8bLEm+S3lAQOv2+2f5mkw1UR3tpQLjbjoWsUXk7bShsLYCocBhJfhUMLmQS56pzs7BDH0do5uPmaQgC0NAWrRAS45Gp64IwBsIxhJ8l9AHanMPBDOHlmT1dywrHc2J9nmFNDhNdk9YTsF2ra6E1UmPhzzb6LotIrn1QtHuboEt9CYxbXaSyYba9Lw1sY8UDj7EUPtteoYPF9Tlywn0jsBZE58/+B7/WT7Oph4SxL/oDV0bVQem1RA7VSbxbxZfmGn0vWU1Mm3duEkb8D4Il4hjWbCkuVPZ85VM70=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(6916009)(31686004)(36756003)(2906002)(16576012)(26005)(8936002)(5660300002)(478600001)(316002)(8676002)(83380400001)(186003)(38100700002)(86362001)(53546011)(4326008)(956004)(2616005)(4744005)(66946007)(6666004)(66556008)(66476007)(31696002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?NKUym1w1igx9tbS2rsD9tHYIuWJ7s68qHEKmxUyCcn8XMHHsYFess8oF?=
 =?Windows-1252?Q?QYwDcOyqPFhgpQMQRec9/JyhqHDRojKVjlF4ET7lZlEIhdO/IPsihvkT?=
 =?Windows-1252?Q?gg6PzJvd7zfBFNWccyQ5lw3q1fc7sLwzN66IdOrHPT6DpDeV1fDGP7zt?=
 =?Windows-1252?Q?dioC+UXpx0XJZKLU8/N+EFMbFZeOndwV7gd3pY9Wb8g3dfwPU9BHB27u?=
 =?Windows-1252?Q?D/lgfm9BN9GuQVMyM2WFFrBmC2GVMlsW51U93r2hoo6SL1jbKbkykT5A?=
 =?Windows-1252?Q?VlZxTuqZz3v2YwTS/BVEQnLipWedut6jJRSvgsIS2GD/K507vOTl7+81?=
 =?Windows-1252?Q?GWP4IWDNgtGS64pLgeEnKhIosfWZ6LkaE03s46zdyNUWOo6pwGnlG2ZI?=
 =?Windows-1252?Q?3D/XfePz1hoOceSUJBd7Mn1ihWRZEDgJ4uqgSsuBxtLRvG16gIy9NLrB?=
 =?Windows-1252?Q?RJbMkWvX53C6S935xLmLjfKT3viE+HYAcj4ebzb+ZcP2dG+kUnmf6D3M?=
 =?Windows-1252?Q?hnfsUaJUWCWnOjSaUcbtkMvVXHhVB8cIR1Xb4/6HYn6Z+MwG5VYgK7S0?=
 =?Windows-1252?Q?XG8X6Vz4d4ETg50OBSafq7d24f2rGINqUCxbJqPP42FcQz6pz1f27VrU?=
 =?Windows-1252?Q?Yq1J0idk502k2AiYYjKkHl9rW6/RHSVrInriq+EilpmeZ3UChVKtx+2D?=
 =?Windows-1252?Q?elD89xmkY7Wstvu+lQOKjiOTkVX6eFtqoAQUAjPu9fVGu7hmU3Kn4cXn?=
 =?Windows-1252?Q?fjz9cmnhcH8nVRp0GCd8Sdjck9HEtOQaJ7I0dUtyBL+HDq0/MQEdyXlL?=
 =?Windows-1252?Q?sydZmmw+n1+V5vTBzNSnGjyjVWvfABOtpqUFFVqSpyG6V2NeMDDIt1C3?=
 =?Windows-1252?Q?/3Cs6S8FO5YUeT1FQbrMKRzGafJDkVEDtuNZ+dcGuTggGSfSbvcT++Zt?=
 =?Windows-1252?Q?JBHQ5prk6EfJsNKdQ3VvPbsdzP+LUf8Ld0W8QjPqTCs87ALj6hyLN5Tb?=
 =?Windows-1252?Q?ztrsBzQSQdXrRZLeOs+3pGKw+OjnQUgER+l1sMwsjBf2Bde2a5fOdS4G?=
 =?Windows-1252?Q?kx7/DGrRkNdaqA5RSq7o7UimdPf779zGQadg1iYQdl3+JeWAGr8RPWOj?=
 =?Windows-1252?Q?c46C+H8h2dcLtXsBJy9dp1qVgD4ozGPDhpYJ2jfDE2pYHRNFug8Uqj2S?=
 =?Windows-1252?Q?CdGnRLe8SmAa6WoNw06zgms8E25P1RAJvtmTrhx9yH6mGx3lZNDnlZAM?=
 =?Windows-1252?Q?tfPMjDuhe17+WvSpmmgSXUWtZup8x+AFPB4+ObgIq4Vda+2tdWPFBX01?=
 =?Windows-1252?Q?9Sbev7rRL3ZePA6RuCdKT12yRwTtAOXaqfyxptAJ/zYR54AKiCJtKm+T?=
 =?Windows-1252?Q?ZE1cudmth2pwKH73m3p5mhPeEJl5mMndqPHm7G5fCqDDRqqHTg/opMkb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479c89e8-a646-4d4a-5843-08d94ac4e8e4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 14:53:03.4918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tE/2RH0fDBTr+5CFGpyBjpt1xU9FGJgI8WSn3Os2gV37Ms8OlY3Fx78qqQ6XkGgp5Bp6dJtJZJOgHlF1WvYmWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4585
Cc: Alexander.Deucher@amd.com, alsa-devel@alsa-project.org,
 Sunil-kumar.Dommati@amd.com, krisman@collabora.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 7/19/21 5:26 PM, Mark Brown wrote:
> On Sat, Jul 17, 2021 at 10:04:15AM +0530, Mukunda,Vijendar wrote:
>> On 7/17/21 1:22 AM, Pierre-Louis Bossart wrote:
> 
>>> usually the version number is at the patchset level, here you included v1, v2 and v3 patches and all but the last one use the RESEND prefix?
>>>
>>> is this intentional?
> 
>> As We have respin the patch series, we have updated cover letter with
>> version as V2.
>> Got your point. Cover letter shouldn't have any version number.
> 
>> We have updated patches as v2 version with fixes.
> 
>> It's my bad. For last patch, We have removed extra stuff which we have
>> added earlier and marked patch version as V3.
> 
> No, you haven't got his point - his point is that everything in the
> series (including the cover letter) should have the same version.
> 
Will re-spin the patch set as v3 including cover letter and post it
