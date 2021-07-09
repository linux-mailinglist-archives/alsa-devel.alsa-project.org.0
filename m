Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E521E3C1EAC
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 06:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A9CD1607;
	Fri,  9 Jul 2021 06:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A9CD1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625806552;
	bh=UUC9R0T6MPArRQL5ZtTe9n4L893hNNKqZTi8CG/UWZA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCpl6oVYrOz7GSOQdUM5oYb4kyh6CKW6NA7AVLbdkW9cYtlv1OTEiN8nv5wvK/oLR
	 TUmdHckkhEmo8n+n8ks9loPd/XQ3d3J59LABqoZ5rGJvoojZEe6K0QvIUzjfvJBxWq
	 U5we1Eo0p7+E7hrvZX2Q1hdoezi58Z8bJmrOYekQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3FF1F80107;
	Fri,  9 Jul 2021 06:54:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F984F80224; Fri,  9 Jul 2021 06:54:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10455F80107
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 06:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10455F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="K/DHc93p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtImMqqQnHSlaktZ//zYQVBh6qTEeudDXnLkA6aNXRbqzrcNpSg7k58I+2SRQcrT86Oaf/OyRTdaBk/FP3H9RnGVzXskN1rQiy81OAdIaNNZiNKrDRhw9fKO77U4O69YG3rudrRLwoWfEIoqE0nubKPHZXwBUdwd11kS5GTURvbXw7aj/+c6p0rPWi2JMAo3JqkeglBTd4d+utChSdS2VqODX/YKRvvtk5314VWQqZMjkEDx0ttHyNG5d2olbhj3bzA2XbIVtw/gOkywurkC/VKRUHwzK9jA96eLnjrAPAioOMdAMbc+ZiafgAX7qUK9EPJmeYpAtjW0vikjTDtmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X88/Fpts0EQjy7ghusWIKZvpPd55r0bEwAa0ht/YtGU=;
 b=FHEDNy3V+xB9OAjTO1XQWzr31depd5g58rSuoHnGfx06nkA+MTjMZQRbMpef/xR1HWb0uqBjMce4dqoBJFYZUPnpuLnCkCq+JhxIWyOnYo8TJ3OfMcXPn5LKpioNbrN48p2/3UsDeHP2RkSSqaZkO0nC2+d0afMqCZKUei+gLpyIIgzWCI27LQLb7GYbbn7ue+Ke+JvmzKIk5B4P6FDG2Q8imXQusO8cLA0iWA06Tv61NH0qQd2A3ZTkTfEe/kgcCxkiZgo1xXO84z7RQhrf9CkcrpKzxgiLlNTUp3MTcvQGoKHCuybSexGuCLHVWL645Hpk8X8tYgw7QNtRTyXXMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X88/Fpts0EQjy7ghusWIKZvpPd55r0bEwAa0ht/YtGU=;
 b=K/DHc93pGF+WqJXu5vHbfOTx7xYXLoLYBRlY7y7Fj8ZQf8ND/2HH5VpRgpD1N7DmFjJr1Tmr+R4PLFbvYpm71NnmA5L/Pj4z7vXZI8zAunmWdwm+xXPrRLTYD0yP/w2eI99niPszt09bcSGaLriN8VGs4X5w1nzXMzgTDbnk4cU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR1201MB2558.namprd12.prod.outlook.com
 (2603:10b6:300:e5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Fri, 9 Jul
 2021 04:54:06 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 04:54:06 +0000
Subject: Re: [PATCH V3] ASoC: add a flag to reverse the stop sequence
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20210708175529.13313-1-vijendar.mukunda@amd.com>
 <BL1PR12MB51449540FAC514FC19EE115EF7199@BL1PR12MB5144.namprd12.prod.outlook.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <b59e0ce4-57e6-ec93-0095-a0ea901658cf@amd.com>
Date: Fri, 9 Jul 2021 10:41:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BL1PR12MB51449540FAC514FC19EE115EF7199@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
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
 15.20.4331.2 via Frontend Transport; Fri, 9 Jul 2021 04:54:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 261a0917-338d-4f65-6801-08d9429594ab
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2558:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB25581EC9B109FC777C57B50797189@MWHPR1201MB2558.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u6jM6iC8TVG0XbdTrxtgbGjGI/V+bRpdbD+GT3hZGyCWQqWk5fPdmErkIxpmMV42lJI4yXw4PfhnU3wD/wuqAJdPtMgyc4npXRHEY4I1aAkpfmPisaB3oaV3mixAup0+VFyga8Dxka3E1nTvcpc3xgeovve9SofOODvlgR8/4yQqE6B182tNQIOtnhHmYvZeiqpp7a2KkEvWk1fFEZTNZvYw/ZvWVBLiTyYcaljvJnaH2bHfxr4hxs3/pwl97BX1yU6ohkxRHrK4lXounhefDf3AjndOXuFmiauLuVGhgaL2pPQwV79TW9LPi8aDeY9Y7dCDDZi0J2oe0U87dvYjlOykizoRjaSXdaPwcIBwuZcmU43mi22x1GIzwKzqAnwOPq8VXqPOySyKo1S/CRi/7y8TLpsDZEmQXX5DlgBB8zB+BGM34YseTmgqybafSu/fYz6DMAjm01Euy9dL9ftuq8EQigrsaNcjDnytGQ9XjlNvPWk/bLrLFeaJCz8OUEmcOouHvuPdQ3qmdEA8guCUPJstsoKZ3waved8hu1BuN0bTqmGeW9CfQhMryqjoUQcPLJP+1HUROP8W8nguTzLsMjO54fzlRDrJHSW4bwwqnEGUQm1NkmRsg3bb4u48Df7dhWJRMxYKn7ro7DQnbNpQpKnK2ODA8KNI/XzBYqf5Bv5We6tvUCh2lMRBcakTo867Pr9l8GRjk5iPa9MEv5Zh1kULzwkiporCY0auDiH0GqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(2616005)(7416002)(2906002)(956004)(6486002)(478600001)(38100700002)(31686004)(83380400001)(110136005)(36756003)(54906003)(316002)(4326008)(186003)(8936002)(26005)(66946007)(66476007)(16576012)(8676002)(6666004)(5660300002)(66556008)(31696002)(53546011)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGwwNU5ydjF0T2JSNWxLZEh0LzNNNjdVYzcrbDl5NHYwdXhWNUluNXptckVv?=
 =?utf-8?B?S2o3RVhKTElPa0VvQXQ1TkNzS3pja3d5RjVBRHRFTkZ5cGQ4dVZDNEJmSlJ1?=
 =?utf-8?B?SFI2WXZZdVk1YVo1MjR0TVJlOThNV1FaSWdZZm4zMWZhSUxDUDJ0akRMK3FX?=
 =?utf-8?B?OXQzSkJFRWxEcTZNaTRuZEMvWDZtZzNIUlhWZmpFZENscVRaYVJaSXExaHZD?=
 =?utf-8?B?SGVoOVc0VTV4NjAxVXg5ZVlYYUp1eGcyUFZOanZXa2pKNzkyMFFtZ2hRZVZz?=
 =?utf-8?B?QWRUMXJIaCtuSnQ5QVZsOW1KYXhhMlA4MXNESnp1WkxSeHpBdVl2d3Q4N2Nt?=
 =?utf-8?B?NHozdXh4Q0VIQ2NZOWFPWHgrcGdvaHJZMlNkakE2d2JROWlhQW1tWjFVcE1Q?=
 =?utf-8?B?T0xuZFBiczdralc5RWdiYWliMS9WOEwwZnFwN3R2SFkwMWxpa2lMYWt1N2NZ?=
 =?utf-8?B?YzBSRzZ3RDZSaUI4cnN4bS90NllkTXhpaEgvbUlYVU9oanljc040SEwxcWxO?=
 =?utf-8?B?Y3JrVlRkeGQ4S2xiQ1JiK3dmSEZmalpyOE95RVg2eUJIZnZ1YWQycXAwT1Rx?=
 =?utf-8?B?VUxURkFZSWJmOXpyS0FkVG1yNmxRWHJxWnlHcHVrRHorRFZMWWdPczBocGhO?=
 =?utf-8?B?dkxidXVvS3kwckRjOWl0U3RCWWtMMDJ5cWhtVVNGTmp4MnVoaFQrVEYxQ1Av?=
 =?utf-8?B?VFNMY1dXMzVFZjRYNU9uWmZCZnM2SWFZRCttM2Vvc2dtczhXalNIN1BXbHEx?=
 =?utf-8?B?SjlEeVlTVWFRK2k4bGVHL3FxYkQ2ZUpJMmttUDRBeDQ2TTBkTndHUXh6Zk1F?=
 =?utf-8?B?VVo5cnFSZG1yRHBRYWRnUWhwSE5qMFlKYXp0QTRqL01JOEZDZ1hRL3FONTJG?=
 =?utf-8?B?Zml0akxWZk5rNC8wNnFCTWRoWXhrL3RWK1BTYUVHQXBFQmd3NVA5enpXbWJX?=
 =?utf-8?B?VHBuOFJTcDUwUTZ4bnVGeEdpbVJTWWFyeGRtTnZzZmcyaElnT05RUXEyY2pK?=
 =?utf-8?B?aGdEdStBbTRROHY4aCtiL21tNHFMTndpSUg0NzRRRVByaHh0TWlCVjZyUjVj?=
 =?utf-8?B?SWRhaCt1dlpGYk9rVVZGNDRxblh1V0hJWlBoaGxHblhkNjZ5Uk8veUR1QmhK?=
 =?utf-8?B?SWxPWHZGdGh1REI3bWVvTUhJU01HNUIvZ0FYbDNJV3Q1R2Z4UVp3dUtuWHo0?=
 =?utf-8?B?ejdFYUE1TkMvNHBRTVdFUmVuN3hUK1NDZGh0NnRwQ2RCSXRIU1V6cW8rS3B6?=
 =?utf-8?B?YUNDYW81SzV3SERpWjJMd2I0bElUWWlJcVg5c25OalNjWjE5cXRCOHRDL3hD?=
 =?utf-8?B?TTlyWGpxUkttV1ZIbkVFL3dISFluSGZBeEUvaVltK0lBNFp4UWJLRnBhTTZL?=
 =?utf-8?B?Zk8xemxINjA5ZVhkbnF4WEh0cjl4ekFuNE1IQVVjN3UvWGc0WVVSUHJmT3lY?=
 =?utf-8?B?K0dnK3c0bk5DZUJQSUZkeFovNngvWS9Ld2tkWHpwVlJDNlZRVHJRSFJyd1dR?=
 =?utf-8?B?azRkT2VzS2hTclJVTzI4ZG5ZYWpCeEoxVzdsWmhyMEJaTG1nek03Qyt1SXdx?=
 =?utf-8?B?blJmektsL1M1Zk5vV2Q2b2JUZUMwVFh4aVBkOE1PcE93b29wUDRaYWFlMWJn?=
 =?utf-8?B?YndQRTVqUG11L2tvVUhjUzB4ZFNrYmpQRExCU20zQTRlTVVUMDV3NVpjY28x?=
 =?utf-8?B?d0hUUnZzN0Q4QTNsazUzZThkb0g5TVBYTmRPYnBNcVNxdTJZeUxsekNieFhr?=
 =?utf-8?Q?fzcqkjHsg7YaUhL2Us2Td2wXstJorU2hJDMolcv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 261a0917-338d-4f65-6801-08d9429594ab
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 04:54:06.5035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6k5rd3dw3EFIaOPcZURo4Y2/uam07fGbcdzcrC47E+55KguJ7F2Vp3CpcMcCH+BFg1h5YfmZIWZTJvALU9pQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2558
Cc: "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "amistry@google.com" <amistry@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Chuhong Yuan <hslester96@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "nartemiev@google.com" <nartemiev@google.com>
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

On 7/9/21 12:21 AM, Deucher, Alexander wrote:
> [AMD Public Use]
> 
>> -----Original Message-----
>> From: Vijendar Mukunda <vijendar.mukunda@amd.com>
>> Sent: Thursday, July 8, 2021 1:55 PM
>> To: broonie@kernel.org; alsa-devel@alsa-project.org
>> Cc: amistry@google.com; nartemiev@google.com; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Hiregoudar, Basavaraj
>> <Basavaraj.Hiregoudar@amd.com>; Dommati, Sunil-kumar <Sunil-
>> kumar.Dommati@amd.com>; Mukunda, Vijendar
>> <Vijendar.Mukunda@amd.com>; Liam Girdwood <lgirdwood@gmail.com>;
>> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>;
>> Chuhong Yuan <hslester96@gmail.com>; Kuninori Morimoto
>> <kuninori.morimoto.gx@renesas.com>; open list <linux-
>> kernel@vger.kernel.org>
>> Subject: [PATCH V3] ASoC: add a flag to reverse the stop sequence
>>
>> From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>>
>> On stream stop, currently CPU DAI stop sequence invoked first followed by
>> DMA. For Few platforms, it is required to stop the DMA first before stopping
>> CPU DAI.
>>
>> For Stoneyridge platform, it is required to invoke DMA driver stop first rather
>> than invoking DWC I2S controller stop.
>> Introduced new flag in dai_link structure for reordering stop sequence.
>> Based on flag check, ASoC core will re-order the stop sequence.
>>
> 
> You should add a fixes tag as well for stable:
> Fixes: 4378f1fbe92405 ("ASoC: soc-pcm: Use different sequence for start/stop trigger")
> 
> Alex

will add fixes tag and post the new version.
> 
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>> v2 -> v3: moved "stop_dma_first" flag from card structure
>> 	  to dai_link structure and modified code to use
>>           "stop_dma_first" flag.
>> v1 -> v2: renamed flag as "stop_dma_fist"
>>           fixed build error by removing extra + symbol
>>           sound/soc/soc-pcm.c:1019:3: error: expected expression before 'struct'
>>           1019 | + struct snd_soc_card *card = rtd->card;
>>
>>  include/sound/soc.h                  |  6 ++++++
>>  sound/soc/amd/acp-da7219-max98357a.c |  5 +++++
>>  sound/soc/soc-pcm.c                  | 22 ++++++++++++++++------
>>  3 files changed, 27 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/sound/soc.h b/include/sound/soc.h index
>> 675849d07284..8e6dd8a257c5 100644
>> --- a/include/sound/soc.h
>> +++ b/include/sound/soc.h
>> @@ -712,6 +712,12 @@ struct snd_soc_dai_link {
>>  	/* Do not create a PCM for this DAI link (Backend link) */
>>  	unsigned int ignore:1;
>>
>> +	/* This flag will reorder stop sequence. By enabling this flag
>> +	 * DMA controller stop sequence will be invoked first followed by
>> +	 * CPU DAI driver stop sequence
>> +	 */
>> +	unsigned int stop_dma_first:1;
>> +
>>  #ifdef CONFIG_SND_SOC_TOPOLOGY
>>  	struct snd_soc_dobj dobj; /* For topology */  #endif diff --git
>> a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-
>> max98357a.c
>> index 84e3906abd4f..9449fb40a956 100644
>> --- a/sound/soc/amd/acp-da7219-max98357a.c
>> +++ b/sound/soc/amd/acp-da7219-max98357a.c
>> @@ -576,6 +576,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
>>  				| SND_SOC_DAIFMT_CBM_CFM,
>>  		.init = cz_rt5682_init,
>>  		.dpcm_playback = 1,
>> +		.stop_dma_first = 1,
>>  		.ops = &cz_rt5682_play_ops,
>>  		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
>>  	},
>> @@ -585,6 +586,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
>>  		.dai_fmt = SND_SOC_DAIFMT_I2S |
>> SND_SOC_DAIFMT_NB_NF
>>  				| SND_SOC_DAIFMT_CBM_CFM,
>>  		.dpcm_capture = 1,
>> +		.stop_dma_first = 1,
>>  		.ops = &cz_rt5682_cap_ops,
>>  		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
>>  	},
>> @@ -594,6 +596,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
>>  		.dai_fmt = SND_SOC_DAIFMT_I2S |
>> SND_SOC_DAIFMT_NB_NF
>>  				| SND_SOC_DAIFMT_CBM_CFM,
>>  		.dpcm_playback = 1,
>> +		.stop_dma_first = 1,
>>  		.ops = &cz_rt5682_max_play_ops,
>>  		SND_SOC_DAILINK_REG(designware3, mx, platform),
>>  	},
>> @@ -604,6 +607,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
>>  		.dai_fmt = SND_SOC_DAIFMT_I2S |
>> SND_SOC_DAIFMT_NB_NF
>>  				| SND_SOC_DAIFMT_CBM_CFM,
>>  		.dpcm_capture = 1,
>> +		.stop_dma_first = 1,
>>  		.ops = &cz_rt5682_dmic0_cap_ops,
>>  		SND_SOC_DAILINK_REG(designware3, adau, platform),
>>  	},
>> @@ -614,6 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
>>  		.dai_fmt = SND_SOC_DAIFMT_I2S |
>> SND_SOC_DAIFMT_NB_NF
>>  				| SND_SOC_DAIFMT_CBM_CFM,
>>  		.dpcm_capture = 1,
>> +		.stop_dma_first = 1,
>>  		.ops = &cz_rt5682_dmic1_cap_ops,
>>  		SND_SOC_DAILINK_REG(designware2, adau, platform),
>>  	},
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c index
>> 46513bb97904..d1c570ca21ea 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -1015,6 +1015,7 @@ static int soc_pcm_hw_params(struct
>> snd_pcm_substream *substream,
>>
>>  static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>> {
>> +	struct snd_soc_pcm_runtime *rtd =
>> asoc_substream_to_rtd(substream);
>>  	int ret = -EINVAL, _ret = 0;
>>  	int rollback = 0;
>>
>> @@ -1055,14 +1056,23 @@ static int soc_pcm_trigger(struct
>> snd_pcm_substream *substream, int cmd)
>>  	case SNDRV_PCM_TRIGGER_STOP:
>>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> -		ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
>> -		if (ret < 0)
>> -			break;
>> +		if (rtd->dai_link->stop_dma_first) {
>> +			ret = snd_soc_pcm_component_trigger(substream,
>> cmd, rollback);
>> +			if (ret < 0)
>> +				break;
>>
>> -		ret = snd_soc_pcm_component_trigger(substream, cmd,
>> rollback);
>> -		if (ret < 0)
>> -			break;
>> +			ret = snd_soc_pcm_dai_trigger(substream, cmd,
>> rollback);
>> +			if (ret < 0)
>> +				break;
>> +		} else {
>> +			ret = snd_soc_pcm_dai_trigger(substream, cmd,
>> rollback);
>> +			if (ret < 0)
>> +				break;
>>
>> +			ret = snd_soc_pcm_component_trigger(substream,
>> cmd, rollback);
>> +			if (ret < 0)
>> +				break;
>> +		}
>>  		ret = snd_soc_link_trigger(substream, cmd, rollback);
>>  		break;
>>  	}
>> --
>> 2.17.1

