Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 846FF3BC2D6
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 20:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047C316BB;
	Mon,  5 Jul 2021 20:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047C316BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625510653;
	bh=Hzg+TC40/3pLsNtaZ0Wxdyk507zdRwI9DXvAdIp2NpU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nJuIuUH1TwY/+5+XanMCsgRV928/AGDyie5gbKvO/KXVUPIdAyeoaL4Vfp4o7cyE8
	 M0Z6qvzL44tPilopOaGOpnDhqA6uZq3YHQL/+b5sA7dHq4rkHcZMfcgvYztPiu1VkF
	 lOBWUe3fJ2wUuwjVbP9n8wAkxf9wG/sIxAgi4d1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38996F8025C;
	Mon,  5 Jul 2021 20:42:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08AA6F80224; Mon,  5 Jul 2021 20:42:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23D6DF80134
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 20:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23D6DF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="r94JfYCZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzRpAzmXRaOTS14cuQHyw3dTvaiQRQrVB9zv4KV1fA0XDd+CwHQCLT/nqNWuDwQABpUqoR4c4eMzPkp1pXalHNcYOr7KVUeFkTikOuUiVXaOw3w8EE8afr/KBXVVySGuYuMhYeuUtSn8Zx9gz9NgehpQ9pmWZgDRbMKZygPYii74MBpTVJZ5eXqeklbjXBksSTuFrNMfBlL25x5sZmddcEax78WV/yjhVnBCCemiZp+PeCO+1SVSBtGQ4Kmw/q8ruOl3pKm+Ptk3jsSb45QRN1kX2+6zL3f/By3oUJ+2TQnVlk3k6X+uVAwxpslT/QZysL1PBVZoBSVqpVX7uw7LAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4x4efp2EASe3YZSBENfHsKINqpJscTLCcEdV02Aqvc0=;
 b=mlaLleDDrrB4utH1pbiGdJOn5CgDlCcwAu2XfwpZ7Jx+f4ZGQEGNuv6whr927rILno5IQVdmHcofgvddzilGNsIct89BGThbD2Ul+GOdDcvDUg365nsqwQ+gg6rD1v4vElNzJd8zWkPQY4TYFj1So4f6vK48JCTDuShXy8nYxEL72CVmFbtquEegJBkWariJgWlRaT6xFhNbEt+5dWldE96TuT5pZGS7XUJN4Gp+02yfkPdpj8YD6IAFwn8xq6Q4jKOCUZdC+QKizlgpYeyRXDiJPCnB6BUPKzk8DYseppNRu9Eex0ljwi2m3d56apwzr3Ui6LQwisd6NX1GjtLkTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4x4efp2EASe3YZSBENfHsKINqpJscTLCcEdV02Aqvc0=;
 b=r94JfYCZ805djx4HsASX4lwYMt7Bfs5c2r/jF07KD1AFEc/N5OGP3twRTfu4f16XS0YBwRWXbv6zb6Wm7Ee/N+UIqozEzHy/c8U7zdxXMI2khpYCk7j4XfGBRS/ldH6IO1V+Qrnbl16muLDSue8RO/kpHpeP/MfCmWqMq97oBCo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW3PR12MB4348.namprd12.prod.outlook.com
 (2603:10b6:303:5f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 5 Jul
 2021 18:42:32 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 18:42:32 +0000
Subject: Re: [PATCH] ASoC: add dai_reoder flag to reverse the stop sequence
To: Mark Brown <broonie@kernel.org>
References: <20210705155830.24693-1-vijendar.mukunda@amd.com>
 <20210705174241.GF4574@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <7f1ad1b3-b509-24cf-00d8-f82766aae0d6@amd.com>
Date: Tue, 6 Jul 2021 00:30:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705174241.GF4574@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 18:42:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91254533-20ef-4e27-9ab6-08d93fe4a5b7
X-MS-TrafficTypeDiagnostic: MW3PR12MB4348:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4348B83C753A87E1EF17EBEE971C9@MW3PR12MB4348.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zFWyB5dIiwTkVLj5dm54H4fc+BcZ5FaEjbaEi0+9UUnKJWLKDo1axCdrVw3AAL51Nou/SQRSo2hgxDgMs9m95/gCCA5AtvJiuuXEvVG4jX/Tg36NIOFjpBEO5SZtRHExBZLx3xJHGLfuwcjtVWxkrw02QMqNLspf83XPcrQsFTVWPNkwsEm+E6Dw6cCMJt0bs5cXN0dg5hqzbqI1KAX1Wker9Ar4z19+E+AKYvvImYPBmNQQxti0zarRBgb2wxEh9vQccUWH6BAmmcWF+iikDOVyaBN9/6csO0mtPj9BP6QNt4dxRkg81DYYNkWKTWZQt9RblQOOl/uRazUjjjmJgvEcXowoVbNn2y6cdl645a38jabyAJNbirfzHrHER1+jGAlqNXjVdyEUXV74YlDCe61R0WilAQCJqEPELFK4np+uUbXkLQH/z1y7bET1z9EdP97rKYQflnm7+0DdkarsOzCRO0Xi+90w1u/aZax96HEPD96ESR7xONlELVZ8e8/D/xTQrJuP2LTn/BjHasVLkHzejdwrqJP49N4PdgrVZD4OWbCD2bI11odwt+YFpv+samXdDLeANK48ehISHEQ2ND4AC5DpRsXMHZyrsE4KEE35LPXVVwLQQ5rmwzGWPBf8p0EEbQ/EiyxLoQsMt1ZaSq8V24sBoeE2PSR5VFWysnKcIAJ+8o3W/DrBdqXZDnwcYAixBAA/E+/EbtBoS8wQD/dxvE/Fu/+ae5/Wkd1hhuIazESN7of1R6RoBaUUGPX0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(53546011)(54906003)(31696002)(8676002)(8936002)(66946007)(5660300002)(36756003)(86362001)(186003)(478600001)(66556008)(16526019)(66476007)(4744005)(6486002)(4326008)(38100700002)(6666004)(316002)(83380400001)(7416002)(2906002)(16576012)(956004)(31686004)(6916009)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?cZKWxTE7ujhjkxwyueOXMZoUf8lFpBW9fuI3eHZx3gDJZ7X9tvE0HMUM?=
 =?Windows-1252?Q?dsgWMuMlJ3OoG8jzejQTJyYEFLu8K0oj64s4vKdDqm0fyi6qH9/Sa3EP?=
 =?Windows-1252?Q?NMThWqZyoKAmx2/FnOC2qUSt3Q8KNTP9dMICRIZmdfwhZKRQOAVws9MA?=
 =?Windows-1252?Q?DFEkZBonsHU2tPpOzxvSgM9vXKEndoC81WlXzf+myIqBM6W/OmD6t1dx?=
 =?Windows-1252?Q?R2WzRbDbB3Y15Ev0MVhbrzGaabEK6BPS3ygLJqf43xnYgUIXcyphx0gx?=
 =?Windows-1252?Q?hMfsr1i4bZYmRU7IJVH6iTjO0Rlb7APDz3tZqMdYli6nFpg1meFgemjI?=
 =?Windows-1252?Q?9Y1p4yWHx1vlqgyss6pxza4VTmS3UziapKpMvdJsVXXU8NDBZYkVMFHh?=
 =?Windows-1252?Q?qSPDBwr96mSdibqlPvBJow2+8Jr8kcPl+jjsRKCZoAQKIZcPhcfij4JF?=
 =?Windows-1252?Q?ub8bnbcrl5uUFv9rABlu4Cg3ZbZAO0KV86+8TdP2OsQL+7ZgxZMfEj1Q?=
 =?Windows-1252?Q?2puSW1/aEbb+8tYUMXSu+6mfCMtMkoRQQ7lvw66sLVGYfJ2rTlfEcuDK?=
 =?Windows-1252?Q?BdkN2h9INQ7Wpx/+1wfWWs92HlPFA8UeB3zjJoOpfeKZB0L8rPXvFHoK?=
 =?Windows-1252?Q?mScBy40v2Ny+degy0CD924lkZCtcrSHT3coJ+4PoheQnoy1j9saWH0Si?=
 =?Windows-1252?Q?zaIwe8lenDvgtIELM/nYKbIVXXjps+xQpQ0TcZ8al1llIO9Hqc51Uh6k?=
 =?Windows-1252?Q?huH4mTj0GHknNZf4c8bwOEmOKib7RN1fIetJWNLzGPbyyOo7cGIjb7OC?=
 =?Windows-1252?Q?8bvHIwXz+6HXNr81LG1exY80ReXLv2ljORbsqLZ0MMxufdkvp08NL7jF?=
 =?Windows-1252?Q?2B1dql9VmW7zyr932etf74eEh297Nx9gy1mwLB4JAlbrO731mYUdyQdD?=
 =?Windows-1252?Q?BqcAXyxUigTS0GuKK+gdgU+AEKqy1rIml832k9rtbCGnSHiINT0rdPkP?=
 =?Windows-1252?Q?mERcmw5fBy2Lz2GrP3DaGKucK/NEqDpO9QuKy9FniCb9b3+T9gD+LLh7?=
 =?Windows-1252?Q?2ZFa1+/2QrRI30YI5GNDYbEV0qw8Vn2IvC1v1RCUlQMVQ+2pllyJ+f2t?=
 =?Windows-1252?Q?XH6R5+4ofhI2chdQox5TI3/x2HBBYZ/L8VfBQG20Q8zORtIJ/lv4b3Dy?=
 =?Windows-1252?Q?cyE0npqsS46kw5VfMsLnuRb2YGOcVoRcjIq/uHMNq14aUcIY5PMwcKQ0?=
 =?Windows-1252?Q?xYgMtkfZp84grug3sMGlaXOS7RCJo/wLEKyMJ0tZoQz9fhl/D6BNAQn+?=
 =?Windows-1252?Q?kAiVX2EpbNFxlisoztImaBX521Zy++MfnevRuPVeiwZ65qce+hR5IJlb?=
 =?Windows-1252?Q?M1JxQui8kfE0BExXMqVG2RZV2gP9kfVocJhXeBxPYTIda0uFanmZwOyn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91254533-20ef-4e27-9ab6-08d93fe4a5b7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 18:42:31.9089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CM+QE8kDbl7Q8lpXIlrkNOMTvS7d3+NLsRdkweN11Tso/rlXHqUL8QRi2yS77zU17z1Cn7voBPWlkX+lj5pP1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4348
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, amistry@google.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, peter.ujfalusi@ti.com,
 Alexander.Deucher@amd.com, nartemiev@google.com
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

On 7/5/21 11:12 PM, Mark Brown wrote:
> On Mon, Jul 05, 2021 at 09:28:28PM +0530, Vijendar Mukunda wrote:
> 
>> @@ -982,6 +982,7 @@ struct snd_soc_card {
>>  	unsigned int disable_route_checks:1;
>>  	unsigned int probed:1;
>>  	unsigned int component_chaining:1;
>> +	unsigned int dai_reorder:1;
> 
> This feels like it should be a per dai_link option rather than a card
> wide option - the system could have a mix of links that do and don't
> want this depending on why it's an issue.  The name probably also wants
> to be more specific to what's being reordered, something like
> stop_dma_first for example since it's only for stops and moves the DMA
> first.
> 
As per our understanding by going with card wide option is easier rather
than checking dai link name for re-ordering the stop sequence for
specific platforms.
We will rename the flag as "stop_dma_fist" and will post the new version.
