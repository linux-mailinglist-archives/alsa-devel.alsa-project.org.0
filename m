Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D577EAFFE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 13:42:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 801E0827;
	Tue, 14 Nov 2023 13:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 801E0827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699965725;
	bh=uakSOiVTosJzrVtNbjGPGvDuw4ikIXET/s81kBst8SE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=okpWQ8bnLC/OdrcL6gchCfs4U7BO/3zqtF+rqZFXTQ0DEMwvb1QgQN2/wVfNfjwWB
	 coFKDQMrHtK94cV4qxxK16M1NMUtXPXhRSRW/Aaf/5lEQm3xOPMiXvOtnIx3POV9zs
	 GvuLODtCnW25btrac5IwFbw5RedeHcIkl2WtWn+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89113F802E8; Tue, 14 Nov 2023 13:41:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D86A3F8016E;
	Tue, 14 Nov 2023 13:41:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E0C0F801D5; Tue, 14 Nov 2023 13:41:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7738FF80152
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 13:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7738FF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bcSu4kW2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tvzju7LGrcq5MRF6UzLkojUMCpvTeCfv8LoFjmenWL3D9RkoeZX41+RFUqRm6SfH5S6eUPZVJ+j+SNuPTJ+3ubkYPgVPbYCsjL2CgBQ7NfR9D9CMHJvfMVoD2EMToK029ThZItACVxTFehEoGURyIlHam069rRB1CePCDsRD8pkcBizVVp5Zn8NGg5n01Qee0jb9/l5Gi5VBkQ1mOzAa+fU2TmPGn0uxHl+L3v48DEK3qp6AJgSvBV5rf+6bHba6mSqMjd/BQxVdrClWC1Gv+doIBP5zFRTJ+VdB+S8smZgoZpp5mL/fhtZeboM14qWjgHGe4Nb+xn2+7m7qfTIv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRyVrvmVL/mRGt3r2DgbuXrJwnZPYnziFdC+QQ/m8B8=;
 b=H+puspu/xZAwoyGBHcDx1t4LC9qg5WM81f8kOlGJl8BKwRD7wYBbzfaDf8avzueuNLmx5J4pEW2L3tPA9u6kAq/ptK7jKGt664ZsYKrOtRIVfmBxpAQC2aZkaRyQBfFmV6FksssMi0uh+YbnbkkelwDSZwE/dL5ilIWvPEX6fwzWLmzcoftY5eUuBNPnsr/Dgu0/Yh5fnbDU0445O7qy1bOavq3k5rHjcu8DXiLpUPAzGb79E4cT+gDmHg+Co6gbnjOV2r07GwSuA3ox0kYbBQIkvkb7q2399gCFM9EVmWJ86uAJHhLUM4Pdvw1EfKohsUMDtywJCualuOcQfo7FSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRyVrvmVL/mRGt3r2DgbuXrJwnZPYnziFdC+QQ/m8B8=;
 b=bcSu4kW2/Ax1/TcVZA4tgNNxQsUzNQCgiyNrYbxx9bAmx3drkDbetYNCPeGQhEipalxEoOCkGL5hZsCF+6XzYxY8V2keA4nGFbKi9autBV9PAv6cxxz09W7lJlb1WLDpUtN9HGvqDRrxKo0zGTulfeTHnXlX5zLDSGYAzBL0BGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 12:40:44 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::6d62:cc7:cf1d:86eb]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::6d62:cc7:cf1d:86eb%7]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 12:40:44 +0000
Message-ID: <70541a66-c7f4-4e0c-98d7-39d19b4e0aa6@amd.com>
Date: Tue, 14 Nov 2023 18:10:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] ASoC: amd: acp: add pm ops support for renoir
 platform
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com, richgong@amd.com,
 posteuca@mutex.one, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 open list <linux-kernel@vger.kernel.org>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
References: <20231113123345.2196504-1-Syed.SabaKareem@amd.com>
 <20231113123345.2196504-2-Syed.SabaKareem@amd.com>
 <1569460d-30bc-47f5-a224-b14618e4eaf2@linux.intel.com>
From: syed saba kareem <ssabakar@amd.com>
In-Reply-To: <1569460d-30bc-47f5-a224-b14618e4eaf2@linux.intel.com>
X-ClientProxiedBy: BMXPR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::25) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da9e63a-02a4-4e15-ccc2-08dbe50eeadd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dU2Asx3DjVwttseOKhggxH1lb37MjcCdBilkldy6MX2KF4fXS3yP+fLJ2NrhdrJ17jElAomOKb8vg0L3nP0APji2pw4VzomiGJgy73vXHnNegvpv8yIxU2uiEBStNSI+9XvRj9EB6eRGoF9ClIZxFO+2jx1vnWC/J1jhXPrkXVfEhlYl8Xwc0nfbieK9M+7P5Ns++8/lLnj1sFOU3uWr/wL3gQG5D3haXYPPLsBZzHvCb5cSixPjJ5iVDCjWV3RMKYI96TbXQRCe7LAxkISGmJ97rMEwEd7SSfKcC3Jj6Ks3sP+H5J0+1PFf29WCyS9bI62/F4wfjt2g9uqhNlQ6PdZkn1oOItYd15ySKeZu2ivsg91JtJ0M6UOX+7yAwa+mBRVsnxTRs/fjgxuEM+HNbloQiiQYl5dRWPdFJ3QRkPH1cFjygnF8sGkSXcPjjSBSTFJySd7HhCey/0UOEPNu5cvSIPac+PSrdUqxk+wJpcCPsC1qfyDTvvjl+R5DEjP9rRF/A8P34ayaVenCJBBz479tLcw7FYYGkLamAM95S1R6g8IoU2rXE5nrMu2ufg9EwEdzlQhy9exfLIgNW+cjj2/CuX/jl1PaUNejITtnWy2G1JHUyL2j8exWyp0Nbz3LFEz+zliF5D+cHs2AIK1UyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3661.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(7416002)(478600001)(5660300002)(33964004)(31686004)(6666004)(53546011)(6486002)(6512007)(6506007)(83380400001)(8676002)(8936002)(4326008)(2906002)(110136005)(66476007)(26005)(54906003)(66946007)(316002)(66556008)(31696002)(38100700002)(166002)(41300700001)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MHR1bGJ5QTRndWgxcXkzUlo2Qlp3MHl3QXJURjljU1FRcW1yRkhrcWFLOWJm?=
 =?utf-8?B?UmoybXArK1lqR0RJZ055UXJjb0dyLytDa3dNY1QvL3dib0xpRzkwTFhGa292?=
 =?utf-8?B?bzhRTWVZdUJYOXBoUndqbndLelVFMmkyWXh4Mm91M1dRc3I0NFU4bXI5RzBL?=
 =?utf-8?B?cFR1a0RTVEtwYzF0dENpV2UxVEVPQkI5U0RpRHIyM2RsKzUyRUFXNUN3RUVs?=
 =?utf-8?B?dXU4Z2JKN0ljSVE2L2JPQmhtK3NaaCsyUndOdS9oVHVXZ2k4cDNsbE1KK2dz?=
 =?utf-8?B?dDVKdVVxOTllZFhZUGpndzZiK256bnlrZzRTY3dING5FS0J0S3ltTmRCN0d6?=
 =?utf-8?B?d0xZeFZuRnp5dk1DSldGVzhLZGVWZU0xUjg2eXZpNVNUK2x3Wnp1a2NvTjBQ?=
 =?utf-8?B?cHJWZVkybnU4ak0zUTNITDFmQ2JzcjRiOTZlWUFtZGp5eHZCdmQzMzBKU2x1?=
 =?utf-8?B?V1hXOWI1UTcxNnBGMEZrSzBLZlU1QnJiY0RDT0lkdTdSbXFmMWREWmswNmVH?=
 =?utf-8?B?WDluSnFLcFdQZXBiK1J1Nmw1OFVIZ1FLTzJzZldJVGVDM1Z5ckNBMmlhdzE1?=
 =?utf-8?B?YTNRSEVndUlpV1YxUkFxMG9mMzNBTVk3T0NXVnE5dVZpNk1lM3FybjlSZ1R3?=
 =?utf-8?B?UzV6K1RIelVrc2FtUjVVcSsvWTFEaHNrZzJJTzIxY2pGcGd5VmVBeDZJV0pU?=
 =?utf-8?B?V1M3aURWYTMrVm56S3VjT0N5eXBPU0ZwTHhqdkRIUURFeXYwYW82cWVQL2xY?=
 =?utf-8?B?NW0ybno4T21uOU1vVVltNjlRQ0VYWHFPT0JOVDJRV0Q3Y094SU5PMTdPUTRa?=
 =?utf-8?B?YkxFYlBsVm9ZU2gxc09LRFo5RUd1c0tTM2c3ZFI3OWtJWHJKbzhZRThsZUsv?=
 =?utf-8?B?VWFHdi9iYWZJUnBGL1A3MmhsUTNZVStjVVVSbGpBR1lITlFVNGNnRXFSSlkw?=
 =?utf-8?B?UEJoVXF6OTJkMlU4WGI0SHMvcnpDK1NraDZRZE0vay85QkZZRFVDNzZlMHVi?=
 =?utf-8?B?MGIxRUx0eWJReHo0Z2dxMy9UR2p2Z1ByeVF0bHNlVTVxWjRCUmt2YVpJbC9W?=
 =?utf-8?B?ajJRVlJiYmd4NGMwdmRPK2JhUkpkRTZab1hpdThkZ2VKOXhjTks1dFJPak5P?=
 =?utf-8?B?L0JIZzZsOTA1NnBnMWd0bjczTkc5SVhNTmVISVdXMWtBM1gyWFdGbEI5V3l5?=
 =?utf-8?B?ejZJQ0MwWHlRbDJOZm9icFQ3dWIyVEVUSjZrcVVqNFpvdXNNU2hKaWtzTU1D?=
 =?utf-8?B?YU9GR3lXeVZORTBRZDNGUFBMUzEzWmNZbzN5S282eHBNdXVQWldrRWFwSFdG?=
 =?utf-8?B?R0pBMytXOUUza1lleU41SDE5bDBGMkd1bDBrSzQ5di9QSEFHaFNFNWFmOXVw?=
 =?utf-8?B?cS9KWmRQL2YrSGNsRFlYbmhZRDVVQzZWWjByeEVURW1ERHRBSlZZajN4d0dS?=
 =?utf-8?B?OHphbnl2WW9Yc1BZQzIvcWRtRnRlVllGM2FZdFNNZjhIYStNV09IelpKcmhi?=
 =?utf-8?B?TWY4RTZha201TzRkTkdrTHI5Y0IrdDE0TTFCSXk1Mi9PQmhhUG11V2lDL2VT?=
 =?utf-8?B?c2h1K3FlRlVSaFhLYWVrSmRyMzRxa0pTbnFlcy9BQkdFS2tjQjc2dnhGbFZC?=
 =?utf-8?B?cVd5aDlmTG5hTXlOYVdBZXZKTkhxd1ZrcnkwRHJNbUkvWFVWYUsrZXZXMHJk?=
 =?utf-8?B?STFBWWs0NmlxeHRRWU5MYk9xeWlySStDc09sRkRvQ29vbEMwY1ZwMGdFMEta?=
 =?utf-8?B?NWtOeTdCNmkrTkNoaFI5eDhJbjBPbVg4d1FXaUQrbHJXdUFyUGxaSGhmQ1A3?=
 =?utf-8?B?MDBzU3JSdm5nYnFyUjFQOW5kcVpGVm82bHJSR1JVN2FEZTVZQ082SjZuSTdj?=
 =?utf-8?B?NUV0clUxV2hVVUIwd2dWMFAyVGR5NkwvTGc5QlRHbW9OSXl4TVFvSW5NOGFx?=
 =?utf-8?B?Q3kyWVNFTVE5bTJUbWJzdWJwbzhWb0pmcXdnYVdxbXJIZWFuVFNuK1F3amJY?=
 =?utf-8?B?eHMvTWxhZnVlNjY1MVUzd3dBZW85QW9pb1JKT1JwMFc4VDBpM0gvR0N0UTdN?=
 =?utf-8?B?Tk5rZ21OcWJRbDdPMEhMQnA4Qm9TNGdRVXBOa2FTc0tpOXZ6M0lWUmtnUkdx?=
 =?utf-8?Q?4hEpaU3/YaFOwmxDLyFX6LnkT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3da9e63a-02a4-4e15-ccc2-08dbe50eeadd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 12:40:43.9473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tWfdjUXPxrhNIaCuO10vb5RncYRCG4Pu2MibNo4JJJOndD2ZPAm9MqfcLg8LqNFFeLlltcrgsWHCbNN4JIjJ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
Message-ID-Hash: LVNRC6TDA5VYWQENEGJTPHEXYSNPSUQC
X-Message-ID-Hash: LVNRC6TDA5VYWQENEGJTPHEXYSNPSUQC
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVNRC6TDA5VYWQENEGJTPHEXYSNPSUQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiAxMS8xMy8yMyAyMDoxNSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQpUaGFua3Mg
Zm9yIHlvdXIgdGltZS4NCj4+IEBAIC0xOTUsNyArMTk2LDExIEBAIHN0YXRpYyBpbnQgcmVub2ly
X2F1ZGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiAgIAlkZXZfc2V0
X2RydmRhdGEoZGV2LCBhZGF0YSk7DQo+PiAgIAlhY3BfZW5hYmxlX2ludGVycnVwdHMoYWRhdGEp
Ow0KPj4gICAJYWNwX3BsYXRmb3JtX3JlZ2lzdGVyKGRldik7DQo+PiAtDQo+PiArCXBtX3J1bnRp
bWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KCZwZGV2LT5kZXYsIEFDUF9TVVNQRU5EX0RFTEFZX01T
KTsNCj4+ICsJcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoJnBkZXYtPmRldik7DQo+PiArCXBt
X3J1bnRpbWVfbWFya19sYXN0X2J1c3koJnBkZXYtPmRldik7DQo+PiArCXBtX3J1bnRpbWVfc2V0
X2FjdGl2ZSgmcGRldi0+ZGV2KTsNCj4+ICsJcG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7
DQo+PiAgIAlyZXR1cm4gMDsNCj4+ICAgfQ0KPj4gICANCj4+IEBAIC0yMDgsMTEgKzIxMyw0MiBA
QCBzdGF0aWMgdm9pZCByZW5vaXJfYXVkaW9fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+PiAgIAlhY3BfcGxhdGZvcm1fdW5yZWdpc3RlcihkZXYpOw0KPj4gICB9DQo+PiAg
IA0KPj4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgcm5fcGNtX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+PiArew0KPj4gKwlzdHJ1Y3QgYWNwX2Rldl9kYXRhICphZGF0YSA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOw0KPj4gKwlzdHJ1Y3QgYWNwX3N0cmVhbSAqc3RyZWFtOw0KPj4gKwlz
dHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbTsNCj4+ICsJc25kX3BjbV91ZnJhbWVz
X3QgYnVmX2luX2ZyYW1lczsNCj4+ICsJdTY0IGJ1Zl9zaXplOw0KPj4gKw0KPj4gKwlzcGluX2xv
Y2soJmFkYXRhLT5hY3BfbG9jayk7DQo+PiArCWxpc3RfZm9yX2VhY2hfZW50cnkoc3RyZWFtLCAm
YWRhdGEtPnN0cmVhbV9saXN0LCBsaXN0KSB7DQo+PiArCQlzdWJzdHJlYW0gPSBzdHJlYW0tPnN1
YnN0cmVhbTsNCj4+ICsJCWlmIChzdWJzdHJlYW0gJiYgc3Vic3RyZWFtLT5ydW50aW1lKSB7DQo+
PiArCQkJYnVmX2luX2ZyYW1lcyA9IChzdWJzdHJlYW0tPnJ1bnRpbWUtPmJ1ZmZlcl9zaXplKTsN
Cj4+ICsJCQlidWZfc2l6ZSA9IGZyYW1lc190b19ieXRlcyhzdWJzdHJlYW0tPnJ1bnRpbWUsIGJ1
Zl9pbl9mcmFtZXMpOw0KPj4gKwkJCWNvbmZpZ19wdGVfZm9yX3N0cmVhbShhZGF0YSwgc3RyZWFt
KTsNCj4+ICsJCQljb25maWdfYWNwX2RtYShhZGF0YSwgc3RyZWFtLCBidWZfc2l6ZSk7DQo+PiAr
CQkJaWYgKHN0cmVhbS0+ZGFpX2lkKQ0KPj4gKwkJCQlyZXN0b3JlX2FjcF9pMnNfcGFyYW1zKHN1
YnN0cmVhbSwgYWRhdGEsIHN0cmVhbSk7DQo+PiArCQkJZWxzZQ0KPj4gKwkJCQlyZXN0b3JlX2Fj
cF9wZG1fcGFyYW1zKHN1YnN0cmVhbSwgYWRhdGEpOw0KPiB3aGVuIGFyZSB0aG9zZSBwYXJhbWV0
ZXJzIHNhdmVkLi4uDQoNCldlIGFyZSBzYXZpbmcgYWRhdGEgaW4gYWNwX2kyc19od3BhcmFtcyAN
CjxodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni43LXJjMS9DL2lkZW50L2FjcF9p
MnNfaHdwYXJhbXM+IGFuZCANCmFjcF9pMnNfc2V0X3RkbV9zbG90LA0KDQpUaGVzZSBhcmUgdGhl
IHBhcmFtZXRlcnMgc2F2aW5nIGluIGFkYXRhIHN0cnVjdCB0ZG1fdHhfZm10LCB0ZG1fcnhfZm10
LA0KbHJjbGtfZGl2IGFuZCBiY2xrX2Rpdi4NCg0KPj4gKwkJfQ0KPj4gKwl9DQo+PiArCXNwaW5f
dW5sb2NrKCZhZGF0YS0+YWNwX2xvY2spOw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHJuX2RtYV9wbV9vcHMgPSB7PiArCVNF
VF9TWVNURU1fU0xFRVBfUE1fT1BTKE5VTEwsIHJuX3BjbV9yZXN1bWUpDQo+IC4uLiBzaW5jZSB0
aGVyZSdzIG5vdGhpbmcgZG9uZSBvbiBzdXNwZW5kPw0KPg0KPiBBbHNvIHRoZXJlJ3Mgc29tZXRo
aW5nIHdlaXJkIGhlcmUgc2luY2UgdGhlIHBhdGNoIGVuYWJsZXMgcG1fcnVudGltZSBidXQNCj4g
dGhlcmUncyBub3RoaW5nIHJlbGF0ZWQgdG8gcG1fcnVudGltZSBoZXJlLCBpLmUuIFNFVF9SVU5U
SU1FX1BNX09QUygpDQo+IGlzIG1pc3NpbmcuDQpydW50aW1lIHBtIG9wcyBhcmUgbm90IHJlcXVp
cmVkIGFzIHRoaXMgaXMgYSBkbWEgZHJpdmVyLg0KPj4gK307DQo+PiArDQo+PiAgIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJlbm9pcl9kcml2ZXIgPSB7DQo+PiAgIAkucHJvYmUgPSBy
ZW5vaXJfYXVkaW9fcHJvYmUsDQo+PiAgIAkucmVtb3ZlX25ldyA9IHJlbm9pcl9hdWRpb19yZW1v
dmUsDQo+PiAgIAkuZHJpdmVyID0gew0KPj4gICAJCS5uYW1lID0gImFjcF9hc29jX3Jlbm9pciIs
DQo+PiArCQkucG0gPSAmcm5fZG1hX3BtX29wcywNCj4+ICAgCX0sDQo+PiAgIH07DQo+PiAgIA==
