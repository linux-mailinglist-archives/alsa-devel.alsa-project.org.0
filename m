Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C97435BD
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 09:27:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C15637F4;
	Fri, 30 Jun 2023 09:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C15637F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688110037;
	bh=n5D1kHeSGev5Sir5YQ6T1quCVNbSXV/X22oB8LNn21k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n/Us9yOzLXbosxznny2B3KCDK4SPADJuZtfyPC58k9Uw0Hd7t0OAf01M3AYJR+cZa
	 19Ys7hi+f/vAKXDKmiWK25ib0mJbTFRsC21IrHDmAoj8pKQ5PmD99xxDxR3qSan8iH
	 2NJrV86DSd5iRbi+1iepDf5Rtujt0DShd3UKgFvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F40AF80551; Fri, 30 Jun 2023 09:26:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF654F8027B;
	Fri, 30 Jun 2023 09:26:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C987F80431; Fri, 30 Jun 2023 09:25:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4050F8027B
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 09:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4050F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KAaWJWJe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRYCo/Q3No1p3WdgapRHhr/sZCYPba2rbeCD2Hl4z4nETs0p2m/cpet7JwZhTYuUA93xeHik/yq/YlYGgrlLIX6pCaJuY/XRaG9uzW66A2PaJVCO7H7s4hZY4Ldt5/bWDZkVOMmhKc16vq/peBK6vdgTzXqBhjKuZ435BiDIgRmgomEJuJFBzJI/WzeT3QM6BkVwwqNxazox09Qm1MxZ2cOz2IKL4AeVFo8xfM3A7rR20XpffKTJkP8PkVA9O1U5lAaagcrJlSkRYquPUPcRL99PjCB9Dsrseq0pqAdBdivYv8v55a30Xyvq8+IoNFsRpEW+GeNWM4OBsg95ye2rhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pomNd/xYrATVSgA0bJ38bCWF58wK2/otI4SeESFEsj0=;
 b=OIQweUtBTgefjYzeSn1kpCz+Na729iT3gJvZPNP6CnDLEltNvnYo0yi+3XbhlEMcH5FQk9p378BWpuVKYocWWupiopi+XaC29wuMnBUOyPjx10P2sZx7xANNQiU+GwvS4gPPLuM5Hu7MqINRrpg1VK45qBTvcOv7+2jANMzSrc3/ly633fttIHgTF11lAa1ybx05kFv+gJ4Ev1ddGjLlHpDMhzaQmv/vnAfQuQTOuoN0bS/ICCMB0HwfA7S/7EeSJ9r5pF1peCVXNYWQFy4hNUsvQ0gla8IMqCnvJsqA71g3KrbcAg9jICljZrsH5CYuSmkbylq+8pqmKGsNfUkl7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pomNd/xYrATVSgA0bJ38bCWF58wK2/otI4SeESFEsj0=;
 b=KAaWJWJeDPPNfSPnCtHN8X1J9IaI+0lzXC4WEhGNqNkHfarHAnsM/6ZgzozeF36gJmX7aY+cHDTF1tL1q9CPCdwkVHWsxSNGYV7l438kMmmZWMW0TSqwDCrq3qHsTMtdeFQlrkf/rRQa2zRHKVGw0LF3+2MzBGdl/VChY7USjiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by BL3PR12MB6427.namprd12.prod.outlook.com (2603:10b6:208:3b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 07:25:47 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::20fa:956e:f43e:7817]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::20fa:956e:f43e:7817%3]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 07:25:47 +0000
Message-ID: <81e58f55-4c3d-140a-b34b-af4dfa06a363@amd.com>
Date: Fri, 30 Jun 2023 12:55:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/10] ASoC: amd: acp: add pm ops support for acp pci
 driver
To: Claudiu.Beznea@microchip.com, Syed.SabaKareem@amd.com,
 broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yangyingliang@huawei.com, venkataprasad.potturu@amd.com,
 ye.xingchen@zte.com.cn, Vsujithkumar.Reddy@amd.com,
 linux-kernel@vger.kernel.org
References: <20230626135515.1252063-1-Syed.SabaKareem@amd.com>
 <20230626135515.1252063-6-Syed.SabaKareem@amd.com>
 <d7f6c2e7-8c22-c33f-b354-30da6519c4d1@microchip.com>
Content-Language: en-US
From: syed saba kareem <ssabakar@amd.com>
In-Reply-To: <d7f6c2e7-8c22-c33f-b354-30da6519c4d1@microchip.com>
X-ClientProxiedBy: PN3PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::22) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_|BL3PR12MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5c602d-ac00-4393-172d-08db793b2c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zDdyM9v3XefbptU6Bb3jrTV+3Jk/hcJgSYUNYSPREAqmJFPVPxpe1iScoLmQldeNSkcL75rqR/hS0tYv7TSUtxv+PJRSym82fdUx9xFz8+n831eUyrp8lWaYZO4adm64K9eNjz1kIblnNbx6wo+Jhf7l5NgH8/rieWG4h6atU+o336XegutcOdlYY7w0tD6JljYP+06WSQZDYy+GfPjjkDfGpxvp6hkcZceymkW2fMZ8FU4m3R91DPIhIhOzlHS+Hl4nJ5zicXiSG1Tmm50pEoHoB3zN+Kkh10wfa+eFwmFyUhc/cnXjfncnTMcW49pi+ZFCg9VuzKrXDlAWYP0NrwzIwAuIhfIuE2y1nlBGlIKaGpQBhnEfqEBXfR8jAh9UgyY4Nh7sVVmuAwULyDBxQxtGZh31pPhPDOCn1CWo29WXMxZYKEBkqB4Rojvz+p5ATgxT52yVfrXRRo36sYauJkOQgBU9lFWsXyMRfSYXAMDmYnstzy0S7wosIEh11Opbj6nLJPHi1vMwNvzVScVr4h97Nk1b0IjuQNnUyAj2QWub4hmLxnpFeYGqK/4bxA5Yj+rEs9D17lWWioY35A/eh6D7XIITxdgxcLxd9XFK+zfSj2DmtJkhSXh3NH6idZwHFO5Qh5zH96qBUe13fbELZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3661.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(31686004)(8936002)(8676002)(5660300002)(31696002)(26005)(6506007)(53546011)(6486002)(33964004)(478600001)(66946007)(66556008)(66476007)(4326008)(6512007)(41300700001)(316002)(6666004)(186003)(2616005)(2906002)(83380400001)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NEFkbDYxZ1pGVzQ1YjNuR211aWpSeGdncC9IZ3F5eEV4bXNyMGRkT3BYd3Nk?=
 =?utf-8?B?THBQazIyL3RIaEo2TzZYaXVDMytKYmlWbW55VGsxYjhCVVNZMnRTTVBQOUxB?=
 =?utf-8?B?SXVsaU1zeUxUQm5KbHoxbUc1RytHYjNTSENQYTJTbTJmdE9vRHp5RzJ1b1JV?=
 =?utf-8?B?QVRwaGFpWkg5T2N0SGJrSGlkNzVwMVVZZGdvKzljb29WY0JJZ3Z2NVBZWlh6?=
 =?utf-8?B?aHM2aVQ3VWFjbnlZNGxqZm5Yb2NkRzVIUUFWQ1VGZU9sT0dqUVNud0NXVXdj?=
 =?utf-8?B?QmZjRVJUeWZLZjBSMm9EbFgyZ2JjM3A5anRWNlp3dEh2ZGJmci9uVlNqODdt?=
 =?utf-8?B?UnRHdU5Od3pwVTRFK29uUHppcVdySUJGR0VCNGxDVzc5bkNsS0dCN1l6bVp3?=
 =?utf-8?B?RUdDSWYxUVpvVURtVXRjQ1RrS1YrVVR6ckM1UDRwaGpMWjBVWTZmRHR6MlpP?=
 =?utf-8?B?TUtyTnp0ZVZIZkJqNWFlVkxqektXT2R1Z1NGV1M2amwyM1VtaVBxY1cyL2I4?=
 =?utf-8?B?OUxiOC9LVWQ5dzFuSXBDY3dhc0dLUFlzR2wwYVh6RUE3Rm5uK3FIMThQRjFC?=
 =?utf-8?B?TUNjdXBZQ015Z0JxejJMc1lpT2lGVGdoeDMzSlE3b0FtMlRFYkZ4Skx4bnhl?=
 =?utf-8?B?ZHhBSWovN01JdmNKdWV2MStILzBOb1U1a2lDRUNqcENaZlZHUjMrNHB6SkdM?=
 =?utf-8?B?MDBTckhCTWRWQy9uMSt4VU5rRmQ0b2MzcXE5dmdrejBuaEVLdUVPV1V2Z2tJ?=
 =?utf-8?B?blZ1Q3VGWWpnSUQzMS9zS201aXV3ak1UVnp3YzZqVUVxOC9Lb3BLWncwSWJR?=
 =?utf-8?B?VWp6dVBnRjNPZkp4djZkenNkSjNDOWlkdzlOMTdoQ0Y4KzBucmlzK1FyalFL?=
 =?utf-8?B?cXpaQXI0dUxVV0J4d3hwQ0tSR0hvd1pPeHhSQ1ExUG5QM21vM29OM3d6RVhI?=
 =?utf-8?B?U0Nsd2VMNDBIa1FYUlVsTG5ZYllieEhXdDM2eXBWS1VIaTRZR0h6ZnZmZ0pL?=
 =?utf-8?B?eW1adm52TGdXUjRBNnVuam5QdytCUDdzaFArNGs3V1pXZFF2T2l4Q3FRVkND?=
 =?utf-8?B?c1lVbUFHODUvNCtQRW5CTitUL1JVcjlxcENJb0wrT2pVMFlldDYzNDRyeVp4?=
 =?utf-8?B?VXNVVEZ2a0lvS0lIUUMyWHFaa3ZqNjVLTlp4TmVyN2dPSVNxTUJwQ1hFSXJW?=
 =?utf-8?B?OGxhR1dwMzlxcENQbFRDK01rOEdMcS9FVVdldXVKUjRRaVVDVFBlTFJFeVl1?=
 =?utf-8?B?QnB2czBzRWt6SFp5NFJIa2pJd2VkSnh6YXEzL0VLeTBDL1RoNDdDM3g4cEhh?=
 =?utf-8?B?dE1RaTFwa0p6ZnNoTVBjSDVrcDJWNURKWUkwN3o3T1VPZmFFTmt6WitNOXdl?=
 =?utf-8?B?czF3Y2dLaXYxZXhabWRjYkw4ekJVa0FlYkN5S3NuVWdEZ0lvNWV5UUJRTnZE?=
 =?utf-8?B?Zm9vbm5HQ1V0T1BUQVZJS0VzK2M5bFcramNubno1RHpwT09UalhObk1zbXl6?=
 =?utf-8?B?VXJzcUFLb3dwSlRFaVBUYU93TGpkaVpLVEJQcUtReWJvV1FES3RnVUxXS2t0?=
 =?utf-8?B?QnNXNithajlNRlY4aGZiVmRFM3k3SXFldzJSS21OdE9iMzZNN01OWW91eVZP?=
 =?utf-8?B?eWZBR0M4QXk1b3M0My9KejFGNzVRQkxHcEV1eENEb1FhNWtHeUtHV1JZVlpw?=
 =?utf-8?B?VW5KVVRrdDJGRlAweDBsMnVGamRMZ0NrMFgvR3N4ZjJralF4Njl0Y2lNVWpv?=
 =?utf-8?B?MFhobUpsbEJrS2JuNGNBSUUwU0hCRXlTZU0ySVcvVTNnblI2SjlpL0VQRS92?=
 =?utf-8?B?VXByeGM4V1gwSkxkazVGUUV4SlROdkxDN20ycStJbk9tWitzUnIyaHNSc3ho?=
 =?utf-8?B?c2pSS0ZZbWxpVTJuQkFwMXUyeWFGaTBiKzlTdjF5MHJjMXpaQ01FaHNvOVdK?=
 =?utf-8?B?amV3QWdnVitoa2cvdGJLR1R2ZVRQejd1L21oTngyMWpROTdIUUJVeEtwUUhv?=
 =?utf-8?B?NFJhWkttaXNuZG1kSG5tMWRORHpMR1dDQjd2WGtqd2FCQlNnQytnMkRtVEIv?=
 =?utf-8?B?Tldjamo5YTUwbDlERHlnakJuNHV0eDdiL0NlOGJaWVJIUWxGdzhSVUdaci91?=
 =?utf-8?Q?w37bjj/hy/hehKbunYabxgpKC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe5c602d-ac00-4393-172d-08db793b2c10
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 07:25:25.5777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 d2HmnSRgjlcnVNleTBaofGwDAjlcUXP5yTwcJilVD5mmAWg2hniG4aHHr4pcEYo9IYk3QIEHVixKZ3Yi8efeJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6427
Message-ID-Hash: Y4MBL54MECBP53ZUZUQ2ACRMYG3ZB4XE
X-Message-ID-Hash: Y4MBL54MECBP53ZUZUQ2ACRMYG3ZB4XE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4MBL54MECBP53ZUZUQ2ACRMYG3ZB4XE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiA2LzI3LzIzIDEwOjIyLCBDbGF1ZGl1LkJlem5lYUBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
PiBPbiAyNi4wNi4yMDIzIDE2OjU1LCBTeWVkIFNhYmEgS2FyZWVtIHdyb3RlOg0KPj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pg0KPj4gQWRkIHBtIG9wcyBzdXBwb3J0IGZv
ciBjb21tb24gYWNwIHBjaSBkcml2ZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU3llZCBTYWJh
IEthcmVlbTxTeWVkLlNhYmFLYXJlZW1AYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICBzb3VuZC9zb2Mv
YW1kL2FjcC9hY3AtcGNpLmMgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL3NvdW5kL3NvYy9hbWQvYWNwL2FjcC1wY2kuYyBiL3NvdW5kL3NvYy9hbWQvYWNwL2Fj
cC1wY2kuYw0KPj4gaW5kZXggNGZlZGFkMWI3NDBlLi5hMzJjMTRhMTA5YjcgMTAwNjQ0DQo+PiAt
LS0gYS9zb3VuZC9zb2MvYW1kL2FjcC9hY3AtcGNpLmMNCj4+ICsrKyBiL3NvdW5kL3NvYy9hbWQv
YWNwL2FjcC1wY2kuYw0KPj4gQEAgLTE2LDYgKzE2LDcgQEANCj4+ICAgI2luY2x1ZGUgPGxpbnV4
L3BjaS5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+PiAgICNp
bmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5o
Pg0KPj4NCj4+ICAgI2luY2x1ZGUgImFtZC5oIg0KPj4gICAjaW5jbHVkZSAiLi4vbWFjaC1jb25m
aWcuaCINCj4+IEBAIC0xNDEsNiArMTQyLDExIEBAIHN0YXRpYyBpbnQgYWNwX3BjaV9wcm9iZShz
dHJ1Y3QgcGNpX2RldiAqcGNpLCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqcGNpX2lkDQo+
PiAgICAgICAgICAgICAgICAgIGdvdG8gdW5yZWdpc3Rlcl9kbWljX2RldjsNCj4+ICAgICAgICAg
IH0NCj4+ICAgICAgICAgIGNoaXAtPmNoaXBfcGRldiA9IHBkZXY7DQo+PiArICAgICAgIGRldl9z
ZXRfZHJ2ZGF0YSgmcGNpLT5kZXYsIGNoaXApOw0KPj4gKyAgICAgICBwbV9ydW50aW1lX3NldF9h
dXRvc3VzcGVuZF9kZWxheSgmcGNpLT5kZXYsIDIwMDApOw0KPj4gKyAgICAgICBwbV9ydW50aW1l
X3VzZV9hdXRvc3VzcGVuZCgmcGNpLT5kZXYpOw0KPj4gKyAgICAgICBwbV9ydW50aW1lX3B1dF9u
b2lkbGUoJnBjaS0+ZGV2KTsNCj4+ICsgICAgICAgcG1fcnVudGltZV9hbGxvdygmcGNpLT5kZXYp
Ow0KPj4gICAgICAgICAgcmV0dXJuIHJldDsNCj4+DQo+PiAgIHVucmVnaXN0ZXJfZG1pY19kZXY6
DQo+PiBAQCAtMTUzLDEyICsxNTksNDkgQEAgc3RhdGljIGludCBhY3BfcGNpX3Byb2JlKHN0cnVj
dCBwY2lfZGV2ICpwY2ksIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICpwY2lfaWQNCj4+ICAg
ICAgICAgIHJldHVybiByZXQ7DQo+PiAgIH07DQo+Pg0KPj4gK3N0YXRpYyBpbnQgX19tYXliZV91
bnVzZWQgc25kX2FjcF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gWW91IGNhbiBnZXQg
cmlkIG9mIF9fbWF5YmVfdW51c2VkIGhlcmUgaWYgKHNlZSBiZWxvdykNCj4NCj4+ICt7DQo+PiAr
ICAgICAgIHN0cnVjdCBhY3BfY2hpcF9pbmZvICpjaGlwOw0KPj4gKyAgICAgICBpbnQgcmV0Ow0K
Pj4gKw0KPj4gKyAgICAgICBjaGlwID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+PiArICAgICAg
IHJldCA9IGFjcF9kZWluaXQoY2hpcC0+YmFzZSk7DQo+PiArICAgICAgIGlmIChyZXQpDQo+PiAr
ICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJBQ1AgZGUtaW5pdCBmYWlsZWRcbiIpOw0KPj4g
KyAgICAgICByZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IF9fbWF5YmVf
dW51c2VkIHNuZF9hY3BfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gKHNhbWUgaGVyZSkN
Cj4NCj4+ICt7DQo+PiArICAgICAgIHN0cnVjdCBhY3BfY2hpcF9pbmZvICpjaGlwOw0KPj4gKyAg
ICAgICBzdHJ1Y3QgYWNwX2Rldl9kYXRhICphZGF0YTsNCj4+ICsgICAgICAgc3RydWN0IGRldmlj
ZSBjaGlsZDsNCj4+ICsgICAgICAgaW50IHJldDsNCj4+ICsNCj4+ICsgICAgICAgY2hpcCA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOw0KPj4gKyAgICAgICByZXQgPSBhY3BfaW5pdChjaGlwKTsNCj4+
ICsgICAgICAgaWYgKHJldCkNCj4+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkFDUCBp
bml0IGZhaWxlZFxuIik7DQo+PiArICAgICAgIGNoaWxkID0gY2hpcC0+Y2hpcF9wZGV2LT5kZXY7
DQo+PiArICAgICAgIGFkYXRhID0gZGV2X2dldF9kcnZkYXRhKCZjaGlsZCk7DQo+PiArICAgICAg
IGlmIChhZGF0YSkNCj4+ICsgICAgICAgICAgICAgICBhY3BfZW5hYmxlX2ludGVycnVwdHMoYWRh
dGEpOw0KPj4gKyAgICAgICByZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGRldl9wbV9vcHMgYWNwX3BtX29wcyA9IHsNCj4+ICsgICAgICAgU0VUX1JVTlRJ
TUVfUE1fT1BTKHNuZF9hY3Bfc3VzcGVuZCwgc25kX2FjcF9yZXN1bWUsIE5VTEwpDQo+IHlvdSB1
c2UgUlVOVElNRV9QTV9PUFMoKQ0KPg0KPj4gKyAgICAgICBTRVRfU1lTVEVNX1NMRUVQX1BNX09Q
UyhzbmRfYWNwX3N1c3BlbmQsIHNuZF9hY3BfcmVzdW1lKQ0KPiBhbmQgU1lTVEVNX1NMRUVQX1BN
X09QUygpDQo+DQo+PiArfTsNCj4+ICsNCj4+ICAgc3RhdGljIHZvaWQgYWNwX3BjaV9yZW1vdmUo
c3RydWN0IHBjaV9kZXYgKnBjaSkNCj4+ICAgew0KPj4gICAgICAgICAgc3RydWN0IGFjcF9jaGlw
X2luZm8gKmNoaXA7DQo+PiAgICAgICAgICBpbnQgcmV0Ow0KPj4NCj4+ICAgICAgICAgIGNoaXAg
PSBwY2lfZ2V0X2RydmRhdGEocGNpKTsNCj4+ICsgICAgICAgcG1fcnVudGltZV9mb3JiaWQoJnBj
aS0+ZGV2KTsNCj4+ICsgICAgICAgcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoJnBjaS0+ZGV2KTsN
Cj4+ICAgICAgICAgIGlmIChkbWljX2RldikNCj4+ICAgICAgICAgICAgICAgICAgcGxhdGZvcm1f
ZGV2aWNlX3VucmVnaXN0ZXIoZG1pY19kZXYpOw0KPj4gICAgICAgICAgaWYgKHBkZXYpDQo+PiBA
QCAtMTgxLDYgKzIyNCw5IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RyaXZlciBzbmRfYW1kX2FjcF9w
Y2lfZHJpdmVyID0gew0KPj4gICAgICAgICAgLmlkX3RhYmxlID0gYWNwX3BjaV9pZHMsDQo+PiAg
ICAgICAgICAucHJvYmUgPSBhY3BfcGNpX3Byb2JlLA0KPj4gICAgICAgICAgLnJlbW92ZSA9IGFj
cF9wY2lfcmVtb3ZlLA0KPj4gKyAgICAgICAuZHJpdmVyID0gew0KPj4gKyAgICAgICAgICAgICAg
IC5wbSA9ICZhY3BfcG1fb3BzLA0KPiBZb3UgY2FuIHVzZSBwbV9wdHIoKS9wbV9zbGVlcF9wdHIo
KQ0KPg0KPj4gKyAgICAgICB9LA0KPj4gICB9Ow0KPj4gICBtb2R1bGVfcGNpX2RyaXZlcihzbmRf
YW1kX2FjcF9wY2lfZHJpdmVyKTsNCj4+DQo+PiAtLQ0KPj4gMi4yNS4xDQo+Pg0KPiBDb3VsZCB5
b3UgcGxlYXNlIGhlbHAgbWUgdG8gcG9pbnQgb3V0IGlzIHRoZXJlIGFueSBpc3N1ZSB3aXRoIHRo
ZSANCj4gY3VycmVudCBpbXBsZW1lbnRhdGlvbi4=
