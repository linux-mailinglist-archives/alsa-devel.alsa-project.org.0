Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BDB707960
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 06:58:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7500C1F7;
	Thu, 18 May 2023 06:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7500C1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684385915;
	bh=sRRM8a3KJEDzzeLCKvZr9MdZgO6OAnLYzpwe4NYBxPM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K7h0W0PcQ/5cRzbluYYln30+A4D8ES6aPYInqm0YHdYwsbcfS24mIJVfyquF6xiRt
	 NNTf9/ZmQl35IP7QmVVmzoZi6JjZXB1HB/rykiYPThGzRrK6dh/v6rMD3beiKYmWJ0
	 RRzj121OYACI4CLfi0JbA1b5HTztaIWTq/CSlIwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5A9DF80087; Thu, 18 May 2023 06:57:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C9AFF8025A;
	Thu, 18 May 2023 06:57:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0845CF80272; Thu, 18 May 2023 06:57:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6AE0F8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 06:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6AE0F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jDKKhfIz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiyA2xtjzglRtx1rIpWRstI1p1ntTEEwzw/GJ5QYCsz5ff7LdTim75vMPOE3c1oj+uBZnTbvs/QJfMY+8xWcaboJsfOTNpruB02z68Mwqdh6RVQTZityyE3pFKfx1f/HtZf210hN1JBAI3YatyjDs3T7lRK9eoJfzVI20JKz/eU7OBRAII1vdobyqoEzOvyGg58pLKoKkZ5+pYGyYAgFKsfUQDGK3NUgyffqko0UM8YDij9pAYzTgA45WKzm3i6asi15cFa1QyHWVJVPVjZiJ4fkJU7e5WJWRedPNWtTsWPLqqx4FOOc44XmFrogXkZCYyiT6Br/9hceVIth2F2AwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gw1jSngk+siULHAjHdwglEcoUWHzMPWK8o+FM/7PkgA=;
 b=U8DPdtugM1BOrEStHjvKMqS1bhqUWkIoEL2O3mNawMmqIm0xbjS7MUabOku3WBqKb7njBytDHYZkEekkJu2C1KWSkQ79UEEc2Ltq1kvY0zYVEoCmGVhWhjBPa4Wp7WY9UpqHRiQU/JEml0GsgxEYW1hGytHdL5MoEq1Ype0+i3P2coRWuT8cyejVvhG9kkrn/6Hg8aSz+vDecpFfOOImW5M3RHKQ9lEWkrJ+PcgDfveN2CBn3FvF7Ec2mwCkcKRoO9s5dPZ6ft8dhfuEeREK24gCf3eU0YoUTK0cxI3i8MefbOn2TqiqJ54jWXPVTcl6mUFEHcWg/Z81oBmCHCRduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gw1jSngk+siULHAjHdwglEcoUWHzMPWK8o+FM/7PkgA=;
 b=jDKKhfIzx5JAI93DdhjxO8LD+8qsbxUyng3U+QezoNKUFXx1eN2tK6YUa100uu5znRpVz6Mem65IzCUPpGnOXdh30w270Mjhii8RW3TwwHvueiUg7LKtIGn9r9yh+l5198k9jLkutPB4XrMqMIMd8e/8oWAa+2axkZbjrtTDkQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SN7PR12MB6790.namprd12.prod.outlook.com (2603:10b6:806:269::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 04:56:44 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::7c50:6c99:76d:f952]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::7c50:6c99:76d:f952%6]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 04:56:44 +0000
Message-ID: <7a06b700-8e1c-0bec-b473-23ed33ab6c57@amd.com>
Date: Thu, 18 May 2023 10:31:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/9] ASoC: amd: ps: enable SoundWire dma driver build
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230516103543.2515097-8-Vijendar.Mukunda@amd.com>
 <202305172323.ZFaMoDeB-lkp@intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202305172323.ZFaMoDeB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0096.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::11) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SN7PR12MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de7d71a-9c04-4403-f4b8-08db575c46a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7EVl7bXbRUdg6t1cmtF1a6u05wnZRlKLWTpt6K2hQU6lhrPIXAHzwZvpemrV5C7DloRVE7EzjtAt9FL9TWKvkZS4Z2ASmVMTZYYChPRbeeA8rs3GETb9kVL5yPd1906y1dwTotp8bKr8YbU4HvXKuTUpJdrUQz39gsCESvqR4NCXt53zUFLibCVy0vXMHC/z+8jDkqxMyIPjN98DUaeUGKYFQXBHe5bvSDQqlmrNUpyj/dL5TuguoY4b9olY0qFR0PRH7h62bYYXoN5Bb4zcUocvmeRaKgOfJYs3lLgRvsIQL/WbRY002F8zxGsEKBC+ArLcl32/yFnpbOkccaoCs7xfrkaF+3KpCYai1E9+nqIxDOuRQh+mDA+N1k+Fpka3ePnmeR/6zyJXsd9F4XH/9oiDUu8xwjLTnihD1HzyXe+udSqNHVsOlSWThnPRugUuo4e4CaSnGJyko2wY5hNn3dlg8VvSep2c4lSe2UgWGLUpwvucU5x84GpdSI69iabwP6n0A6onz6BkS9IMt81j4iIB+N2IDzoavqln70LhYGlEm02K7vmtqKiHlg5RNmeVg7lRj/sdNLdCyO6HSMMWt48Eksfd5ZmTzfm459k9V1TAhnEVcv79A2AHqr8zZLG8DGEjaS9G+rJ1Agu9uTSyaIvI3BzrkoVfIIipMcA71He39aKn8GnQ8NSxu0zSW6po
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199021)(26005)(6512007)(6506007)(53546011)(966005)(36756003)(2616005)(83380400001)(31696002)(86362001)(38100700002)(186003)(6486002)(54906003)(110136005)(478600001)(2906002)(316002)(31686004)(8936002)(4326008)(8676002)(41300700001)(5660300002)(66476007)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWhuR25LbUxKYXZPTGtpNGIxQTViaXNLVzltRUg0anIzdTh4MzBxTlVBdC8z?=
 =?utf-8?B?UlJSVFRuTmN5dTFoTjZYMXN3dTdjMWtqSzFSbHhUTTlIaTYrTlUvaWpTUjJ5?=
 =?utf-8?B?MkI1NkJ4eU1vRG41UkpqdDhjdHlFS3gzU3ZhSlJYb1BVRHBqZXJoVXQ0b0J3?=
 =?utf-8?B?L3l4M25sYkZuMFVMWndwaElqeENZd1AwTDFPT0VaWkJXVjhSSVU0RGdaZ0gz?=
 =?utf-8?B?ZzErd2ZDK0htQkNibXgrcGRkUFV4OEc5V2l3YW9zLzkyVnJmMkN6LzZQRFFX?=
 =?utf-8?B?LzRVZzc0ZWpNd3U3UzRzL2UxSEZiTnBQWFR6dmZZbGxtV2MzWjFxTW94dnkw?=
 =?utf-8?B?dnoxZkQ0K2xiV2pYL1NFV0taVkdOd2F1K2MrTDBDQkE0cHRsRmlNb0hEWldM?=
 =?utf-8?B?S2pnb08vMVFMNktWVHpvT1FNbTNQNTdwRDJSa0pOUUpXZTEyOEU2dkVZaWtt?=
 =?utf-8?B?MWVyeEtOcG9sQi9oRU1JUUcwZWF4SlNQenBKV2RURlk4Zm1QcmJuRllBZ3pj?=
 =?utf-8?B?a1RVa0lzU1QrVDQ2YXQ2cTVXWDRGbTNZV29WaC9Qc04yUDhJMFdiTS9JbnE4?=
 =?utf-8?B?c3RkZ21zOTFMUWJOeGMvemMvUlNiQ05vU20zeXJDVzM0bzRiNVNaMk1OeHlr?=
 =?utf-8?B?UVVKeGViZnE5ckR5ckpOdEhhaDhDTkJnVlJ0aXZmQkZiTlM5TGZqemZaTmR5?=
 =?utf-8?B?cGhKY2pYdkFpQndzU1ZFYTBKeXg5TUJKMjNKM0NDakxmcjF4QnRXL0FOQlBO?=
 =?utf-8?B?ZmNKZFdtNTRLb0NmRDQ5cVFZS1pCdGYxc1Rzak1GcHY2N3Jlb1FaWFZqOEhR?=
 =?utf-8?B?SERPTUkzV3BzSytXYmxKNGdHcnhkQkZ0aXJPZFZidjZGOVJIenhZeE9WWGRx?=
 =?utf-8?B?MDZSeENrakxYajRkclRnVkp1K2wvcDlMWVVFdkFLVDNiRHhEanRrWjJlQnMw?=
 =?utf-8?B?MHhJeUNIeExleXdhbU5FNzB4OGR5bndwWDZTUHRzRHd6bFVyRk4ydWY4Nkdx?=
 =?utf-8?B?dklXZFJGbjd4NU1JMklhTEFZR1R0TlVNM1BPcTlnekJDeTc4QUlWaGJQQ3Nr?=
 =?utf-8?B?UFdueTF4L3F3NkRFSU9vbjRPRTBWOTdhZ21UNzBDeklYQlFBcTFTUTUvcU12?=
 =?utf-8?B?ZkNVWS85eEpzSzNBWmtWMUpaWXY1dGJCNmhRN29iMVJtNy9vdDl4TDhJRGtw?=
 =?utf-8?B?WUwvaHlqclhNZXFpQVl1cTVwcTUranZEenE3MmNZQk1QaXpJVGxDakdwN2FG?=
 =?utf-8?B?QnZyZUpWejdkejA0NktuOXpNRlFyY0V3eTd5SGs0c202ejZad2o5UXV3ZkZj?=
 =?utf-8?B?VXpFbDJ3Vzd1aG9ZTnVLOW9lbzl5N1FjNWo3WXE5OGRKOEtsZVBJM2w2Vngw?=
 =?utf-8?B?SDNwNllUTUMvWnlWbGdBOTd3WXUxVFdkbElFeEtNdFV4QzkxcytkVXJRMzlR?=
 =?utf-8?B?dFJHSWRzaHlZZ2FxUzFqRzh6cE5zMk1PSUZtR0VzbG9udkJNcjBsMTB4Mkh0?=
 =?utf-8?B?TDcrNlNKTTNkNHRQVGxTV0dwcGFlSmp1VUx4eE5CeHR2T1B2Z3NKMVh4YWZj?=
 =?utf-8?B?dHpyaWNxSzFrM1NZZWxRVGQ5Mzczc2RCMk1mcVI3STdKUDZnL0I3Z2FZWVEx?=
 =?utf-8?B?SXljU28venBaYnpZZjF0NDM0dzh3elpkbDRpQ0hpZDJnMXE2YWZyblFHK1dL?=
 =?utf-8?B?YVc2dGc5c3p4bDcrWXBmQmZMNERlWHA3OU1PbDlaWU44WWFjVUZ0cEdidWw3?=
 =?utf-8?B?S2NIdXlzNG5BVWVRVHBELzUyTVNicm9sZTZuTkYvY1c4bElUOXR4cG83UEsy?=
 =?utf-8?B?VlBpZ2pyUEVNSE96RUlJRGpPOEpnOUd2dWdFUThUU25wMlZNdmJ1VXhTclJv?=
 =?utf-8?B?WDJ5UEE1RUdJRWQxZnk1L09pMno2MmpHSllGR1djUkRzSUxCclQ3QjVNVzdr?=
 =?utf-8?B?S2w0a3R6d3NjWmVINms1enJlUUVZNThyaW83bldXaE9qMTE1RkJ5T0IzbTdj?=
 =?utf-8?B?ZittVjQ0d2FKUTd0bkluTHdsc2VXWUw0UTdhaWN0TFhtWW5iTS81ZkJDZTVa?=
 =?utf-8?B?Wjg3QlNGeUVvb0dZRUtuVDQ4anE2T0J2cUFjY1VwQTJTWklNOU9tWTM4OGdI?=
 =?utf-8?Q?/DDl7HEUoyUVJQo+eVNJu6PVl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0de7d71a-9c04-4403-f4b8-08db575c46a4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 04:56:44.1835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XJzCzTLNE4k02kyxgm0KCrpLc587wEw2KIaRkgubCCUtJnAhr0pkpkrJU9ccAuRfNA0RPHOMjwfjckpsuSlxsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6790
Message-ID-Hash: SKNNWI5LVT5T5A627E3F3WZKHUYAWSMR
X-Message-ID-Hash: SKNNWI5LVT5T5A627E3F3WZKHUYAWSMR
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKNNWI5LVT5T5A627E3F3WZKHUYAWSMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/05/23 21:47, kernel test robot wrote:
> Hi Vijendar,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on broonie-sound/for-next]
> [also build test ERROR on next-20230517]
> [cannot apply to linus/master v6.4-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-ps-create-platform-devices-based-on-acp-config/20230516-195625
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20230516103543.2515097-8-Vijendar.Mukunda%40amd.com
> patch subject: [PATCH 7/9] ASoC: amd: ps: enable SoundWire dma driver build
> config: x86_64-allyesconfig
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/9200bd753a28fb732d2b59cfe767df1f66517085
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Vijendar-Mukunda/ASoC-amd-ps-create-platform-devices-based-on-acp-config/20230516-195625
>         git checkout 9200bd753a28fb732d2b59cfe767df1f66517085
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305172323.ZFaMoDeB-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> make[6]: *** No rule to make target 'sound/soc/amd/ps/snd-ps-sdw-dma.o', needed by 'sound/soc/amd/ps/built-in.a'.
will fix it.
>    make[6]: Target 'sound/soc/amd/ps/' not remade because of errors.
>

