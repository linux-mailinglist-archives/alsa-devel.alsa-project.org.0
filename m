Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B9F4A46FF
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jan 2022 13:27:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF8D91686;
	Mon, 31 Jan 2022 13:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF8D91686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643632027;
	bh=rcxm77teXv/crBa2GD9A/m5IKUpEV70d0vzPrH6cW5c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HkfMw/agMjWbz6EaO6C3kZsCQk6UYmM2Rmae4bxN3Olj5yxl63t0WtuLA8rGE/jxS
	 VDvilvrPLpuKlxIxy8bJVtQyJ0GiEQ/vWf8ZwReSMXbRSRFODXP6f+efwsoR5oRBri
	 lnwSLxilW1ZQf+n5Xpc7dO4kWU3RWeaRJfpz5cVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FA8AF80095;
	Mon, 31 Jan 2022 13:26:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22EBFF8028B; Mon, 31 Jan 2022 13:25:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2052.outbound.protection.outlook.com [40.107.96.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B58BF80095
 for <alsa-devel@alsa-project.org>; Mon, 31 Jan 2022 13:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B58BF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="45PWSZsc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYRXPQy7hjzMN3dE/L3hQ09Bfp+RW+/vn5uloiKFnw5t1SDBK0uAH36mUBXqY4fovXzaDiPBGuqXdrOKlTLkHXnpEuqVk8MlmG8numsgZPCH5ozxDNucT+HDHec0V6W3wVs1DXz3G+tzHAhFyBJ5y2ogRtKC5VL+jy7dII9WvQjiJLw3J2jZ/tZX9KS03p/IfVHrBG3ljxQWlP1a6rw0kSmJG3X0RHJUgbFFRp/gNRy5tAKEuLNyQsFn4U2EVnFMY8rWM84hTMU/EQCrgAjoBW9kwHynD/VjvmMR+fFDglhJBRP3wZ3ZEIDdJSr0DSEjK9M8H1a8lC2ZZTYPhndAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iHPn4hIVHHbexuomPFvHEsG9MyeUCpNyuKa55um8I8=;
 b=naBjURZ1+RuQjdpGJUHl7O3Cjokm1gwjG3Zz5AOaQMOx9M9qHc+QrKe9xKws21RM/XVKBL416c2ySG7hDle1Ut2s0jtUEeksUQdW8f7n+UMQQUq8Y4l20UgaYtOzQDOR+QyRyu1aqkW3D17GvvgqHaKYkisYlPmybrtBBfcF8f5VvTTLwCV3diM7+LdQK9bxvknZvo1bQPt29mM/3Ij4+27dErxqwubhyJ/YnCPeBy1LplduhA83Ujy/ZYaDfklT3DQpd4iVpWYI2IGW+0z050oY8smcpSOhZQtuKy8++dCCzG9B6+Tzmbu4oCAOVidI2kFafJcvB8UqzimkY35REw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iHPn4hIVHHbexuomPFvHEsG9MyeUCpNyuKa55um8I8=;
 b=45PWSZsc0HFv1hBmoDSHDJr8o+DXzHRGPMX3Yi43MuXmZhixivq9cSYSeZAk4N3acG7NbAqC0EiLoVQpD392uI7tzx5TKySEWN0duJYIXFooB6pNSZvLA0b4Vs1QsILKn6uKwiYEGJgPP4Yce4CPpgJ5zK9m8/KOVbKkbjYx/XA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3627.namprd12.prod.outlook.com (2603:10b6:5:3e::18) by
 BYAPR12MB3221.namprd12.prod.outlook.com (2603:10b6:a03:135::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 12:25:44 +0000
Received: from DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::544d:f62f:40b8:b32d]) by DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::544d:f62f:40b8:b32d%4]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 12:25:44 +0000
Message-ID: <a8ffb740-9f03-340f-a7ba-5e0f1a074b22@amd.com>
Date: Mon, 31 Jan 2022 17:55:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] Revert "ASoC: amd: acp: Power on/off the speaker enable
 gpio pin based on DAPM callback."
Content-Language: en-US
To: Curtis Malainey <cujomalainey@gmail.com>, alsa-devel@alsa-project.org
References: <20220129000837.6207-1-cujomalainey@chromium.org>
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <20220129000837.6207-1-cujomalainey@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:202:2::15) To DM6PR12MB3627.namprd12.prod.outlook.com
 (2603:10b6:5:3e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4692dd95-5a57-43e0-068f-08d9e4b4ccc5
X-MS-TrafficTypeDiagnostic: BYAPR12MB3221:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3221357CEAC4015E18BA274082259@BYAPR12MB3221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ujst/ZBvyPW8So/0Xh+ymZVOofM11jQolAC1zNJ5n+fKTPDq5/mWToL/i8it1lDftjXsimMQGpjy5a6RHRnEalMlmyo/Oara/Yky6S5eh6X2pffZYl61RJOd5fu5ExF0NrIoYXDNTE5ih7hDjsD8MlwoCd+9i+ZzBCNzoEVYH9zXMXlhf1kUHCZmMIY+P9j0DkZBNvvPojoMiiUrAu+KdKRSSFq+duV/k9yG0askyLbreHGryhLbwQZDVqICXcQPbUHCb3bxrPR0mbFHRi0Ir46LOKVdpj/9MBI2ul/Uc+tYFZFISScVohZ7vm3vikcnBzwpQHDZsXRvxEz1Ryn7yXbQNF9mdoIKR0ZUjynF8RJH08XcvSFsCCnSGtKkytGuE2B9GOTerhrmXWxAgTOPPLTgVLfDwBIAVvQaKa0KEMTmo4w2Y2WvkxOrJEEZKoc5gjxCQ86P2wf6qhOHI9b6rX9UEZM5q3rfUco7tRmnrIoAHnwQH5TdhbeMcslGyFiLpsAhYYZVzRuGooHi0BJ+CrMrd+wCVc3e21xLF+XIunbPBH6VNj4vDzVPCyammRnBgFoJTE7lRvvKMGNJl1QVirfg6l8WXa69N8Is5H8N+hQ2jM4/tnWt6HZw9zWuoWOQrho4BtiG/awXP+SjqtFnD5SVRlwoyiIRPNNj/UfK855gKsc4A2haTNTVnOjTgIt9kh8VmAz+bU4QNjivbQ2qsBDfGEfIySnrKkP8iBcxeB0E92CT3DeONubAkj6CbPtbhuHrRTvYCqkc9I7aUIET1q8/txkq1An2UAJD1KHdCMItOchtRwsxC1N3hiscysQ1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3627.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(2906002)(4326008)(8936002)(86362001)(31696002)(83380400001)(66556008)(66946007)(38100700002)(66476007)(6506007)(6512007)(6666004)(7416002)(54906003)(53546011)(966005)(6486002)(36756003)(5660300002)(508600001)(26005)(2616005)(31686004)(186003)(316002)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2NTcE5tZ09LMjl2Qml6LzArRE13Sk5IV0QxT05CWmw3Q0s5T1YxUGpuSHhp?=
 =?utf-8?B?cDVBdzhOSHNWYUlQQXg5Zkl6Q014STlManhHZ0ZYYzFMWmw3MStValBNL2JL?=
 =?utf-8?B?cHY0d2FERTdQS1NZREJiMGY3ZDUvQXJMSW1pdHlyU2VmZUpOOThob2c5NXha?=
 =?utf-8?B?TUNpTkZLZ1JtQ2JHdEZ5WlM1c2tIUlBzSE5vVVI2ZlBtUFpXL2g0aWtycSt6?=
 =?utf-8?B?SHM1Z2hJTVBsakYvN2ZVMDI2NTdBejRvL280MkNwbmIwRDBPSDRXUlZRT0Fn?=
 =?utf-8?B?UzV4TVUrTSsvbU9HM2dLVTdNMU5TVUZ2dGdrbWU2dkRTZm9DRWdRWm12djhE?=
 =?utf-8?B?NFdVYXZDWHltd0dieUtwVzI3TEMzMnJuQ2p6WHJkVmhzc3MwQ0REU0ZrUGRY?=
 =?utf-8?B?QnJuaGxaUEpxT0t6YldYREMzTGxJR1lPMjdQeHVjZktRMithV3l3VHkrVmVr?=
 =?utf-8?B?Nkl1YW50b2M2aFNYeGh6YVNzRlhuaHNzNXgrVFVoQW5mV3F4MlB4YUVVOEpj?=
 =?utf-8?B?dW9RaTB6T0RwcU9oUGZTL2JxZ3ppWGlmMnpyL0Q4a1BCSkpvT0MwWE1BV0Ji?=
 =?utf-8?B?S1N0Mm9ieXpnVnVvc1dIZEVld3pUM3AySG92TUFIcGdoTkhTT240azA3Y3BR?=
 =?utf-8?B?b0c5WGhxa0pWRXgvbVFXUW1OZVZNMlcwQnBOVjh3U3BYYW1GQ05hdU0wUjVp?=
 =?utf-8?B?SURSTEt4aVRCUmVYZkk3YUNRTHNPS2lXRWNkd2VGKy91V2ZZcnFLNTVQTjJy?=
 =?utf-8?B?WklzOUdJVjVpUXJPWjNhK2ZSeXZXZEpWTjVVbEpqQVJkbWFmUUJwR05xalh4?=
 =?utf-8?B?WjJjQkFvWUx6ZWwvRnRtTGFKL0xGbkFaZVVUWTloUDhTbHZGaENYOG9BZGlJ?=
 =?utf-8?B?dTVwZ3lNZk4xZTRlcmRKVGtGampZbmFjV1hpUHEyODJ0OTE1R2kzdmhiQVN0?=
 =?utf-8?B?OXpHWTNzMmpXWmhadVhadHBwMzltVXYxTllRT1FWVisrREl1azkycnhHT3dG?=
 =?utf-8?B?amxYckc3dFIzbUVPUi9xQkxhNU1mVmRUcHFML1FvNTZ4bVcydGg3RlZ6YWQ0?=
 =?utf-8?B?cllzWGQrTUx2bExQd2V3b2EvRGovZ0pSeWxQekV0bGZnd2FpTEYvV2J1aEN5?=
 =?utf-8?B?WGpobWp2VERTeFRGQ3Z5MmlnQWcvQXpqbDRVVkpiVmRyelF6NUlTVFVkQjln?=
 =?utf-8?B?OWdvTVJiQzZKZnp6RTU1UGsySnhXY0dnU2Q2eGM1L0kreDYzMXd0cC9Ob0wv?=
 =?utf-8?B?WmpQbkhNTW85anBFcDZPdXlvVmlTdWRuV09qMEU3aGRlL0VJQThaQXFIK1Zr?=
 =?utf-8?B?WmQ1NU9rUEM4dXBpRkJ0WnVpTHVvSWY2ZitpR1g5b3BmdDg3VkM1bmhhYURN?=
 =?utf-8?B?NTF3c2JVL1hoQVdJcFZoVjhCMEhoMGR2WFl0WktwalloN1djUWxIR1gxN21S?=
 =?utf-8?B?OWhSN2FtRVRWb0FsaU9DTmZQRG9yUndXck5MY0l6eXJUeXFHZjZsZkZwT3Bk?=
 =?utf-8?B?eVNkMDhraDRvLy9kRUFOTzQ1OHJodFh4c01rK1BtNWhINEoxLzlwSld5Qitv?=
 =?utf-8?B?d2hXV3ZidHV6UHhibTdnVGtvbWN2MlZSSitLS241elB1NWV2dVJuVG1qRzN3?=
 =?utf-8?B?REFGRENpZWg0ZUpjRVZvdFNFYVYxSHlSQVZkTW5hOUd1ajJtd0Y2U2FsRFBU?=
 =?utf-8?B?ZWdpcWNiY1pEVWo3cTRWSnd3endxcUI3R3o2M3ZFNXZpc0U3S25wemVNTkY3?=
 =?utf-8?B?S3l5NDZVd0Q0M2ZWYUZiU3FSMzBWUHZPd2FWRk1nSXFQOHRJdm9HNGdqY1dp?=
 =?utf-8?B?WWxTbG1Fa3hFeXJMRzU1cERlVVVubndCMDQrMTltMnFVdHVhWWR4QmhTTklR?=
 =?utf-8?B?ZVFGUDBjclJTenU1UVZTdWpnMTlKNlZpWERibTQvb3VnTzZQM1puTDl4cXJv?=
 =?utf-8?B?T1NNbnYxSnJIVjNmV0FPN2hTNUEzNnJlaGM5UU4rUjE2NU4yWHRveGlmd1Bv?=
 =?utf-8?B?eTNpVExrbEYzUERDS2V3YnZocHN4NG5yTXpSYnVMYzVTZGI1L1VNa25YWFZB?=
 =?utf-8?B?NnkzVFZVSWdxL1BESW5EL2NwcUUwSVhhRXRxVEU5ckFoUGV0RnArcllrNVdu?=
 =?utf-8?B?TFBMWm8xZlRQVmhHcEtraGJWMzVmeFo1azZZbkd2c3ZxcE9HUTh6bzNFZkpo?=
 =?utf-8?Q?d937YetNtPVKtyS0zv2g6B4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4692dd95-5a57-43e0-068f-08d9e4b4ccc5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3627.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 12:25:43.9095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tegp55c4aG986bMnMd2Okg/geXiaEmQ8sPfiyRo8wJjcE9zsI0ZdzX5GT78jdpl/31O8L8qMB1uBULv+d41fHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3221
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>,
 Curtis Malainey <cujomalainey@chromium.org>, Eric Peers <epeers@google.com>,
 Rob Barnes <robbarnes@google.com>
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



On 1/29/2022 5:38 AM, Curtis Malainey wrote:
> [CAUTION: External Email]
> 
> This reverts commit 5c5f08f7fc0bee9a1bc3fbdcb7a21cfd0648ab14.
> 
> This commit hard codes GPIO for max98357a drivers at a board specific
> level in the machine driver in the kernel itself. When used with a
> board that properly defines the GPIO pins in ACPI there is a resource
> contention over the GPIO pin and the card fails to probe.
> 
> The amplifier driver has handled this pin lookup long before the
> this change landed and it the pin should continue to be owned by the
> amplifier as it is specific to that component. As a result this should
> be reverted.
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> Cc: Rob Barnes <robbarnes@google.com>
> Cc: Eric Peers <epeers@google.com>
> ---
>   sound/soc/amd/acp/Kconfig           |  6 +++---
>   sound/soc/amd/acp/acp-legacy-mach.c | 19 +++----------------
>   sound/soc/amd/acp/acp-mach-common.c | 25 -------------------------
>   sound/soc/amd/acp/acp-mach.h        | 10 +---------
>   sound/soc/amd/acp/acp-sof-mach.c    | 21 +++------------------
>   5 files changed, 10 insertions(+), 71 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
> index d5838df3064b..154be5e70821 100644
> --- a/sound/soc/amd/acp/Kconfig
> +++ b/sound/soc/amd/acp/Kconfig
> @@ -32,7 +32,7 @@ config SND_AMD_ASOC_RENOIR
> 
>   config SND_SOC_AMD_MACH_COMMON
>          tristate
> -       depends on X86 && PCI && I2C && GPIOLIB
> +       depends on X86 && PCI && I2C
>          select CLK_FIXED_FCH
>          select SND_SOC_RT5682_I2C
>          select SND_SOC_DMIC
> @@ -44,14 +44,14 @@ config SND_SOC_AMD_MACH_COMMON
> 
>   config SND_SOC_AMD_LEGACY_MACH
>          tristate "AMD Legacy Machine Driver Support"
> -       depends on X86 && PCI && I2C && GPIOLIB
> +       depends on X86 && PCI && I2C
>          select SND_SOC_AMD_MACH_COMMON
>          help
>            This option enables legacy sound card support for ACP audio.
> 
>   config SND_SOC_AMD_SOF_MACH
>          tristate "AMD SOF Machine Driver Support"
> -       depends on X86 && PCI && I2C && GPIOLIB
> +       depends on X86 && PCI && I2C
>          select SND_SOC_AMD_MACH_COMMON
>          help
>            This option enables SOF sound card support for ACP audio.
> diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
> index 0ad1cf41b308..de0f8024e2fb 100644
> --- a/sound/soc/amd/acp/acp-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-legacy-mach.c
> @@ -27,7 +27,6 @@ static struct acp_card_drvdata rt5682_rt1019_data = {
>          .hs_codec_id = RT5682,
>          .amp_codec_id = RT1019,
>          .dmic_codec_id = NONE,
> -       .gpio_spkr_en = EN_SPKR_GPIO_GB,
>   };
> 
>   static const struct snd_kcontrol_new acp_controls[] = {
> @@ -42,16 +41,15 @@ static const struct snd_kcontrol_new acp_controls[] = {
>   static const struct snd_soc_dapm_widget acp_widgets[] = {
>          SND_SOC_DAPM_HP("Headphone Jack", NULL),
>          SND_SOC_DAPM_MIC("Headset Mic", NULL),
> -       SND_SOC_DAPM_SPK("Spk", event_spkr_handler),
> -       SND_SOC_DAPM_SPK("Left Spk", event_spkr_handler),
> -       SND_SOC_DAPM_SPK("Right Spk", event_spkr_handler),
> +       SND_SOC_DAPM_SPK("Spk", NULL),
> +       SND_SOC_DAPM_SPK("Left Spk", NULL),
> +       SND_SOC_DAPM_SPK("Right Spk", NULL),
>   };
> 
>   static int acp_asoc_probe(struct platform_device *pdev)
>   {
>          struct snd_soc_card *card = NULL;
>          struct device *dev = &pdev->dev;
> -       unsigned int spkr_gpio;
>          int ret;
> 
>          if (!pdev->id_entry)
> @@ -69,20 +67,9 @@ static int acp_asoc_probe(struct platform_device *pdev)
>          card->controls = acp_controls;
>          card->num_controls = ARRAY_SIZE(acp_controls);
>          card->drvdata = (struct acp_card_drvdata *)pdev->id_entry->driver_data;
> -       spkr_gpio = ((struct acp_card_drvdata *)(card->drvdata))->gpio_spkr_en;
> 
>          acp_legacy_dai_links_create(card);
> 
> -       if (gpio_is_valid(spkr_gpio)) {
> -               ret = devm_gpio_request(dev, spkr_gpio, "spkren");
> -               if (ret) {
> -                       dev_err(dev, "(%s) gpio request failed: %d\n",
> -                               __func__, ret);
> -                       return ret;
> -               }
> -               gpio_direction_output(spkr_gpio, 0);
> -       }
> -
>          ret = devm_snd_soc_register_card(&pdev->dev, card);
>          if (ret) {
>                  dev_err(&pdev->dev,
> diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
> index c9caade5cb74..7386e5bb61b5 100644
> --- a/sound/soc/amd/acp/acp-mach-common.c
> +++ b/sound/soc/amd/acp/acp-mach-common.c
> @@ -71,31 +71,6 @@ static const struct snd_soc_dapm_route rt5682_map[] = {
>          { "IN1P", NULL, "Headset Mic" },
>   };
> 
> -int event_spkr_handler(struct snd_soc_dapm_widget *w,
> -                       struct snd_kcontrol *k, int event)
> -{
> -       struct snd_soc_dapm_context *dapm = w->dapm;
> -       struct snd_soc_card *card = dapm->card;
> -       struct acp_card_drvdata *drvdata = snd_soc_card_get_drvdata(card);
> -
> -       if (!gpio_is_valid(drvdata->gpio_spkr_en))
> -               return 0;
> -
> -       switch (event) {
> -       case SND_SOC_DAPM_POST_PMU:
> -               gpio_set_value(drvdata->gpio_spkr_en, 1);
> -               break;
> -       case SND_SOC_DAPM_PRE_PMD:
> -               gpio_set_value(drvdata->gpio_spkr_en, 0);
> -               break;
> -       default:
> -               dev_warn(card->dev, "%s invalid setting\n", __func__);
> -               break;
> -       }
> -       return 0;
> -}
> -EXPORT_SYMBOL_NS_GPL(event_spkr_handler, SND_SOC_AMD_MACH);
> -
>   /* Define card ops for RT5682 CODEC */
>   static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
>   {
> diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
> index fd6299844ebe..5dc47cfbff10 100644
> --- a/sound/soc/amd/acp/acp-mach.h
> +++ b/sound/soc/amd/acp/acp-mach.h
> @@ -17,12 +17,6 @@
>   #include <linux/input.h>
>   #include <linux/module.h>
>   #include <sound/soc.h>
> -#include <linux/gpio.h>
> -#include <linux/gpio/consumer.h>
> -
> -#define EN_SPKR_GPIO_GB                0x11F
> -#define EN_SPKR_GPIO_NK                0x146
> -#define EN_SPKR_GPIO_NONE      -EINVAL
> 
>   enum be_id {
>          HEADSET_BE_ID = 0,
> @@ -55,11 +49,9 @@ struct acp_card_drvdata {
>          unsigned int dai_fmt;
>          struct clk *wclk;
>          struct clk *bclk;
> -       unsigned int gpio_spkr_en;
>   };
> 
>   int acp_sofdsp_dai_links_create(struct snd_soc_card *card);
>   int acp_legacy_dai_links_create(struct snd_soc_card *card);
> -int event_spkr_handler(struct snd_soc_dapm_widget *w,
> -                       struct snd_kcontrol *k, int event);
> +
>   #endif
> diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
> index c1d9650fc222..dc2786cc81ef 100644
> --- a/sound/soc/amd/acp/acp-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sof-mach.c
> @@ -27,7 +27,6 @@ static struct acp_card_drvdata sof_rt5682_rt1019_data = {
>          .hs_codec_id = RT5682,
>          .amp_codec_id = RT1019,
>          .dmic_codec_id = DMIC,
> -       .gpio_spkr_en = EN_SPKR_GPIO_GB,
I guess we still need this for rt1019 codec case as rt1019 codec driver 
is i2c controlled so machine driver need to power off/on spk_en gpio.
>   };
> 
>   static struct acp_card_drvdata sof_rt5682_max_data = {
> @@ -37,7 +36,6 @@ static struct acp_card_drvdata sof_rt5682_max_data = {
>          .hs_codec_id = RT5682,
>          .amp_codec_id = MAX98360A,
>          .dmic_codec_id = DMIC,
> -       .gpio_spkr_en = EN_SPKR_GPIO_NK,
>   };
> 
>   static struct acp_card_drvdata sof_rt5682s_rt1019_data = {
> @@ -56,7 +54,6 @@ static struct acp_card_drvdata sof_rt5682s_max_data = {
>          .hs_codec_id = RT5682S,
>          .amp_codec_id = MAX98360A,
>          .dmic_codec_id = DMIC,
> -       .gpio_spkr_en = EN_SPKR_GPIO_NK,
>   };
> 
>   static const struct snd_kcontrol_new acp_controls[] = {
> @@ -70,16 +67,15 @@ static const struct snd_kcontrol_new acp_controls[] = {
>   static const struct snd_soc_dapm_widget acp_widgets[] = {
>          SND_SOC_DAPM_HP("Headphone Jack", NULL),
>          SND_SOC_DAPM_MIC("Headset Mic", NULL),
> -       SND_SOC_DAPM_SPK("Spk", event_spkr_handler),
> -       SND_SOC_DAPM_SPK("Left Spk", event_spkr_handler),
> -       SND_SOC_DAPM_SPK("Right Spk", event_spkr_handler),
> +       SND_SOC_DAPM_SPK("Spk", NULL),
> +       SND_SOC_DAPM_SPK("Left Spk", NULL),
> +       SND_SOC_DAPM_SPK("Right Spk", NULL),
>   };
> 
>   static int acp_sof_probe(struct platform_device *pdev)
>   {
>          struct snd_soc_card *card = NULL;
>          struct device *dev = &pdev->dev;
> -       unsigned int spkr_gpio;
>          int ret;
> 
>          if (!pdev->id_entry)
> @@ -97,20 +93,9 @@ static int acp_sof_probe(struct platform_device *pdev)
>          card->controls = acp_controls;
>          card->num_controls = ARRAY_SIZE(acp_controls);
>          card->drvdata = (struct acp_card_drvdata *)pdev->id_entry->driver_data;
> -       spkr_gpio = ((struct acp_card_drvdata *)(card->drvdata))->gpio_spkr_en;
> 
>          acp_sofdsp_dai_links_create(card);
> 
> -       if (gpio_is_valid(spkr_gpio)) {
> -               ret = devm_gpio_request(dev, spkr_gpio, "spkren");
> -               if (ret) {
> -                       dev_err(dev, "(%s) gpio request failed: %d\n",
> -                               __func__, ret);
> -                       return ret;
> -               }
> -               gpio_direction_output(spkr_gpio, 0);
> -       }
> -
>          ret = devm_snd_soc_register_card(&pdev->dev, card);
>          if (ret) {
>                  dev_err(&pdev->dev,
> --
> 2.32.0
> 
I feel instead of reverting this complete patch we can quickly submit a 
new patch set with "gpio_spk_en = NONE" for maxim codec case. As codec 
driver is anyhow controlling that gpio we don't need to do it from 
machine driver. We've already done that here 
https://patchwork.kernel.org/project/alsa-devel/patch/20220131203225.1418648-1-vsujithkumar.reddy@amd.com/
