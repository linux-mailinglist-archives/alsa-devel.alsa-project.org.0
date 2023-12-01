Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5D780034B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 06:49:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 266BA11C;
	Fri,  1 Dec 2023 06:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 266BA11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701409789;
	bh=1V46bJfhNR9AoUBug8UZCaeVI13deKxEg9sdWSAZul4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kn6T8sy0VcZie+exhqSkey/3690Y0Ke/k790MFn6C5Lq+JVb0oKazav9+Xcq8GMXm
	 8VROuiW9Fs1sPTji6avi8raHio/0VaFYtm5GR2CcUU+vn1MwHT0ixewH7SccM9oAFh
	 P5lBXxpOFamDV+3bCipsXq/bL6wIZzqyFUEgG8sM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 326CAF80587; Fri,  1 Dec 2023 06:49:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B43BF802BE;
	Fri,  1 Dec 2023 06:49:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77AF3F8016E; Fri,  1 Dec 2023 06:47:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0418F800F5
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 06:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0418F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AKxrB2RH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlKmGoJTgmKGNDiQdi1iZZM9AAjf4FfbhqsroE/uePc/V3CTcNNlmPJV14qVc0QPSfFPgd85D86VjM5Nfs2Fw5frcYKrQyPTcTbXpKvOh3cgsH6VgsaNfn3Rtx1MlKCFQr6jm9I67on8KtwI9cydc2cuZs7TgIbrNKZgjcNwXzzi9Ho2X+WtHVChKGZVy7wZ+lLvS2n6VQMZoR/ajcqWtPORq14XwK4dXYwLsm5CJNvJSjiWcXDMq8kR3qyUMLeHVWBCT9r7xRfw6YGVCq0P0rICGbDYY+Vjuj3VG+y7956piVcbQGfZYPP5QWMPka2Tx9L48FepmsYTdpEjacMPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjxLUQLWPzIUWMk3mIYEpvyuE+67nKXrJ3XmVeyK5go=;
 b=JkzKJ9efAoj3rxKzsJGKMoZqEsILg/t8IVXyOI3MFuDBcID4mImYLgXKyqR7eTQYo9Ng5Hbv1vuM1hiLPh0TKTudJ/j0T9hwJD3OgCgXkBWnSco1H/cAt5ejUUQyt+U/6VQH5jZCUcHE9Ur0wJQ55HplY3mEnhTPNFi3ctYxJQVcPMt+QohZCLPAqC8V2VrMFlTrfIGaYhdY85Kr74JldeIoBbFSRzdbPmkKx0R3Oj2NLTnHO4M9zgryZ7dcUkqa4xUqm2ee+qJ8a8nIKZwf5Yqa726fkfcsksqm4tJQpoaLc6IyNlfTpxZGB0maeIeEcctBBjDenFedYwrD5drbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjxLUQLWPzIUWMk3mIYEpvyuE+67nKXrJ3XmVeyK5go=;
 b=AKxrB2RH2J/80Xbn7VnF6LZz1HsY01cmVrF0wy7uR3mONSrAu5HDKf4GJF36Kd5qN8SwsmhGSkHpklwzObVqT3G/ID6kJee33zaUpDqU1prJzGt4tsOZ54L7fvnzorZpWdsyaCgUkE54IToyPmyD1tl/5zFxklxzUYl2AJZuvx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 05:46:33 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::59d1:c9f5:2c67:1da6]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::59d1:c9f5:2c67:1da6%4]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 05:46:32 +0000
Message-ID: <30e6b8d3-6369-4c23-a4fa-f70cc01acd7e@amd.com>
Date: Fri, 1 Dec 2023 11:16:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: amd: drop bus freq calculation and set
 'max_clk_freq'
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org
References: <20231129130449.9892-1-vkoul@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20231129130449.9892-1-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::24) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a2f112-8204-4822-3bff-08dbf230dee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cWDNhErxRTPd01aqU2gzKalyLxZWIkcFln4XBgn21LoMqs2cWFqFgpwmf3nITlpp5hGnMjheeca90d/LNcD/NN5Dn4vYN6CdCZ3t6hRpbisxs2vPwo8H7YoVAlK7xeNA1bqqPa17Qnpq89ZMfuTTFQTQ2aQEnJioB8S8zDLMuqobnKZbonUaFeUitreOs/OqcGc8/N8rZ5iRvLiODJvkW6eC6TyBC3dx1VFWrgaKL24Qx5mpNxiTgngdeJZtpjm3UfAJb+krfLlX5irptZC9Uhdz38AjBHEaKFRbCmaeR+ZQY/1LTFAE6Sjx+rL8bcXmkODsd5BsqUihwZZFe1PBkJ0GSKpWKGN6E2ZKQxSg14N5nOEXfd6Lz/1kdDXz5+YCBfTYH5663/wuTZRqOSHYmUFaBPuNavGoEEdOxSyO/1Tr0/2uuA8MJry7VQiNR9Sw/0ldnUw9kgZBz+ZHTTi7yO/7lVH8sDaejl6tUmQM35qZhu3jjAB9FBHSGPrAJHfZPbmGZMZOGagHfnLPOhhDaCoJoHHqI8xEzl+YvIXRnf8It97U9D2ngc5YRWGT6fhIVojQFcv5cEszUfcmgW77Nz7WhSDLL64leTP6+OA6r9cS+L1nnWs4nIQwqP7ZOZ2SZXapICnVz4P6rk/dne9Q4g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(5660300002)(38100700002)(2906002)(36756003)(41300700001)(86362001)(31696002)(8676002)(8936002)(4326008)(478600001)(6512007)(26005)(2616005)(54906003)(6486002)(316002)(83380400001)(66946007)(31686004)(6916009)(66476007)(66556008)(6506007)(53546011)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c3JGVzdMUlRmSkEzOG10Vi9TdkwxVmxUUzZtczFCaUx4bFI4a1RSQU11bVNa?=
 =?utf-8?B?VW8xdVQ3QnJSQjRKOER6eGh2NkVVdVd5R2pSa1NhaWF2THRDUVduWmhPZ0Iv?=
 =?utf-8?B?SW1vNDRDWGdudGlPWFI1WVhmMXJsb2ZiU1Y0SkFqbkptbFBldXk2d0Q0UG5y?=
 =?utf-8?B?R2hIcmlkK2ZqTDFiVXlMQmNTRWhTNVBxeVl2My83aEFSbTJUYm85aDJ0U0o4?=
 =?utf-8?B?SzYxOGp5SzRYOFhjeE5EN0lOYzVySGVuallXTWZsWUdXY3pJejVlK0VnNHJ0?=
 =?utf-8?B?RnEzSHo2ZnBTZUlDNlY4YlVCVWhvQnRNQzZlUVpHZzRZek5MTzd0cTdQUTBy?=
 =?utf-8?B?a25EeUdNelF3cHZkTDN2RCszQWNjRXNjT2o2dUQyT2ptTmRZUDd3L1Zhdy9o?=
 =?utf-8?B?YTlya3lhdDVtY1IrRnpZZm9GckVsOWkzdmN4Nk9Na1M2VTgveHQwNHhzcmVN?=
 =?utf-8?B?czhSQXpkRmc5VUdMMFpkaDI5UFdEcGhIUnZKUEFmeWN4YzBIWFJDWkNHbzk4?=
 =?utf-8?B?WWJ3VzVaQXdidEllbHJyQS9rTGNpajl4S1NlVGRLL0Q5M3pUMzA4SkZTZVJj?=
 =?utf-8?B?cHh2U2lvaXpQZWpwYTZTTVpCNDVtZHBUK1JIWDUxVEF4aHpDWk4vSGQ1b2d3?=
 =?utf-8?B?cllxTFE1MXp0UVRKb1VPS2hYQ3JQdyt5YlFqY1dxNEZNYzJhampPZlZ6bVpo?=
 =?utf-8?B?dE1kOSt2ZW1aaE1pYmFmYUNJQkl1VVJFWVdZbUljYVlCOURiblFtTEt5OVhu?=
 =?utf-8?B?Z0tMTUcrMGFJYmJkbWpwVVJmcGR6RGdJdW9mRzNMd0xCNmxWY3dWS09nRnQ1?=
 =?utf-8?B?dFZVT3JXaUlMZkxXTmdTVWFSZkxPaTZmdUhiK3RNUUloSGlBUzl4YzF4Yk1J?=
 =?utf-8?B?K0lxY29HM0JrODM4N3NMK25pUUllSVY3enpmU2xCK2diUEZFaG5xUnBaZFJX?=
 =?utf-8?B?QmVrQi9kNG1oK1A4ZkVoT1VzZDVaZzBybVJTR3NGaUc5RUhQUUNMVkZHTmQr?=
 =?utf-8?B?di9TcEpFclE4VG1OY0tvOWRCTG0zOU93dHA4dzBCbDR5cWZpSHVNdlpjZWtD?=
 =?utf-8?B?QVpCQklRb1JoUzN0aGxiZ0gxek5RSVZsejI3Vm83ckZVR1BVNzVsTldITHJX?=
 =?utf-8?B?REZuYjIvQ0RHcXArT25YR3czdWxJN21tbUJjN1V3anNFVHl4cXBnOGptY0Vi?=
 =?utf-8?B?ZzM1eXN0TGxsMGU0RmhEbTNPc0Rka0szNlNINGdMSDlUWFVralV3dGl3WEZa?=
 =?utf-8?B?aUdPWEIwNmFFUitrR01QL1RGQmFuc3lVcUlnOUppam5sRVhPdkxQQUlqeXJo?=
 =?utf-8?B?YXhIOVI5eFBlZlpmTjdsOFFyZFI1Q045WDNOYkUweVhwSTRoMnBBV2VIQktL?=
 =?utf-8?B?WkNYaDQ5aFVENUNOektTZ1JBK0hnYXR1UHJObkI4ZWtMSkw3VGd4eGpBcmVL?=
 =?utf-8?B?T2NBeVJpYlltQ2Jja3lDSU1yOVFpL3pVbXF0OWtyR0dzOG5ycDJCcmtMSmNR?=
 =?utf-8?B?SWZldHozYWpnWWovZzUrbHlaUHhsMHZDVEFWZTRCdHRSdWt2bDZFOUNwN2k3?=
 =?utf-8?B?T3RTMDNza3Vrdmw2QnBvTDJXR0hLbGYvdHBleEVGckF1Z1lseE9GbEwwTVZw?=
 =?utf-8?B?QVZkQVg2QzdRVi9qTWM0MVNqQnZSeHQ4SUJqOUZjSlMzODNDYlZ3dkNOcTZR?=
 =?utf-8?B?djlML2xsVEN0akhDd2h6OWt6NUh5bmtOYm1ycEZmdlUxNWRUQjNaNkFRTGNX?=
 =?utf-8?B?Rk04bGNPZ0pMSk1GY2UwUjFoaUNBd3JwV04xellpSjJ5bWZUR0FKcG05R0V1?=
 =?utf-8?B?WHpMVG9kdGp5c3BMUnFmWUErNXlzM3BYTG9yeW9WclJrYmowSjNRNWFKRFNk?=
 =?utf-8?B?Tm51NlRlZ212ZEliMWg2ODE0eUVlRmd3aW5VdjFzdTN4MFBwOFBIeXVnQity?=
 =?utf-8?B?MUZxUlUrTWVkMGZ3djhkWFA5Y2pWVThnb1ZxazJHU0VZRDBJMktkWWZhRm1H?=
 =?utf-8?B?RXRuU0pTMERWSUNBVUN3S3NwNXFISDNBVUVpeWc3VDR0dXY5RWxvN0swekd3?=
 =?utf-8?B?ZDhmRkt4aDMzUWFvYU1MWndvVit2YXVkM1VaRldYWXl4WTdIWmp3T3ViQ3B3?=
 =?utf-8?Q?wyWRrr5HoTq41Wb3owmpt+OWp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0a2f112-8204-4822-3bff-08dbf230dee1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 05:46:31.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PfM8nYaDqo38fJ3384D/KWmtOWvUyvTkUnjsbZby5uyY6lzd6gUBBPgoDpzGszpl/DXFcyLbojJixgnKr+MjnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899
Message-ID-Hash: BTSDTOFSGBZO2CWK3TJL4DRYESZDNC3U
X-Message-ID-Hash: BTSDTOFSGBZO2CWK3TJL4DRYESZDNC3U
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BTSDTOFSGBZO2CWK3TJL4DRYESZDNC3U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/11/23 18:34, Vinod Koul wrote:
> max_dr_freq and curr_dr_freq is calculated and set in
> sdw_bus_master_add(). Setting in the driver is reduanant, so drop that.
> Set max_clk_freq instead.
LGTM
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/soundwire/amd_manager.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index a3b1f4e6f0f9..f54bb4dd2d10 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -950,13 +950,13 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>  
>  	amd_manager->reg_mask = &sdw_manager_reg_mask_array[amd_manager->instance];
>  	params = &amd_manager->bus.params;
> -	params->max_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
> -	params->curr_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
> +
>  	params->col = AMD_SDW_DEFAULT_COLUMNS;
>  	params->row = AMD_SDW_DEFAULT_ROWS;
>  	prop = &amd_manager->bus.prop;
>  	prop->clk_freq = &amd_sdw_freq_tbl[0];
>  	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
> +	prop->max_clk_freq = AMD_SDW_DEFAULT_CLK_FREQ;
>  
>  	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
>  	if (ret) {

