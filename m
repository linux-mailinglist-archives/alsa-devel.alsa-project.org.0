Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E35B568648
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4BE16C3;
	Wed,  6 Jul 2022 12:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4BE16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657105102;
	bh=HLR52YO77tJzR4LG/X/YVQAYWyyQ9ba5FjEY82YHYzA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C0g6KCCKU9nwkY2w2kGOTy2e+hSb9AVnX6G4SfguyYf9GwqhvilpqvO2LlyGe6mGm
	 P483IJzJQM09qd5W31rusP8eNC3HhnkBplLsT9JsPKaAscbv3c4l0F8f8ZGRE9ubpQ
	 Riimxd5r4iUZ890GILtEkLKYQwMygIigyYpT6+/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D4AAF80104;
	Wed,  6 Jul 2022 12:57:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AC06F8023A; Wed,  6 Jul 2022 12:57:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9412F80104;
 Wed,  6 Jul 2022 12:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9412F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z+jzXubi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657105039; x=1688641039;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HLR52YO77tJzR4LG/X/YVQAYWyyQ9ba5FjEY82YHYzA=;
 b=Z+jzXubigZU75XoYxBmxk6ugvy5EkdVjyIO86nAdzggwCDCzdz6tWGIc
 b2BaIljKcH6XfmfmUeQKNi5PuYGbkvfwpNFY4E8bxVKdxmv6uZCfvJIsk
 3cVZYEqfR1jbiWWMmeKvy8OG6gekHRH4D+3Nmr9iK/h9f9ieQhthnG6vy
 zGhRv9/+63Smy+oDx7AgfRKIOGtvrKq865vFWeF1RrG4lbzBiix+BRbC4
 6XuEGx9pt3pzCrcMqtwTerBE4/aHPLz6E7WGEprI+UgIKhgcVoYNLJ0SP
 ECX7tMoGr7IBy5IRYJBdPB11zk6ubtfsJpn3v/d5zK/DCl6IMxNe94TM0 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="309263830"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="309263830"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 03:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="720096989"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 06 Jul 2022 03:57:07 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 6 Jul 2022 03:57:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 6 Jul 2022 03:57:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 6 Jul 2022 03:57:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tn6TBFCFeF048hn/8+CGKEokn+RXiDFcvhY9QdXY80wd2EwR8M0No0OvSyCws4S3BKY0tuD+Gyf/fvGSNihfXPJziUNF0zkLzYzq8yIPoXiDaAGmydNrbZSzHvPropw/nbNBX33t3YMPmYtxZAeoiZ6ZXJj7bkVLajBIqPbfWZ3iIS8M4SZV83mRdy3SE0pob5i/FvHyGXJi5TgosJPlnUnz0x05yGnyuhYMPztV0y4gELmXGEhQonHEQCjz7HD/fd/IyjsVfq8TBwJi4z4/OXyJ3xv52zX+dxuytjaMZz0Jst8M8eYcipqEGyjVSR2f/nDbJRn00oQOcDHZOgNUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0keHAdcXNyQDsfC7V1E1Tb/unwAhLjdos5ibF3C+ag=;
 b=Vx3O5Ruezvc5h7isotV00RTqfSm1gfi/eHyPHgHnoCqq2LzKdRgt2hEQ4An1uJ9TUzEt7AX96FHgqFFmSBGAaWOUecQR5WhmvrjDm5Gmg0x1dZWjFTtQSoN8v9UcpG76Puq9MTeYtlhStjATx4LICuMm+t8E31NYW8labcYgAIj5dankME4nH3NEVWrEnOWlYdkwGMI78KjD7Xc/ztqjkM4S30i4VIPCqCXBrTIsocZREfH2UQ99z54yCuW4OC37Kh32Zrkiw0hH94S9t80GJvos1fDtoDeeZBRiDCL5Jazyjd3b64FCX8LrZiIZFS4yB65ofYplicFtW0kN6Wesfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL0PR11MB3427.namprd11.prod.outlook.com (2603:10b6:208:7b::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.19; Wed, 6 Jul 2022 10:57:05 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 10:57:05 +0000
Message-ID: <b256c70d-baf8-7f3e-ca52-e7f920e4602d@intel.com>
Date: Wed, 6 Jul 2022 12:56:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] ASoC: SOF: sof-client-probes: cleanup tokenize_input()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, =?UTF-8?Q?P=c3=a9ter_Ujfalusi?=
 <peter.ujfalusi@linux.intel.com>
References: <YsU4zCpaV7GBpHci@kili>
 <2d7bb9f7-a316-16d8-b290-e0cae9b28127@linux.intel.com>
 <20220706104443.GE2338@kadam>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220706104443.GE2338@kadam>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::15) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e69762b-1560-43f9-19cd-08da5f3e434e
X-MS-TrafficTypeDiagnostic: BL0PR11MB3427:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /QVt9HWSF5M+k+nHKkJl2a56mhKHIbmtXRLWIKqvutNc5TpWls12cqz36l5twIOrLF16slAXnmQVJyvRkHc/nrU0uymnXPO8xLjeAj5iv5Rjvk0bbcvZit6aZ14c1Xtqm7K4owCM1cz7IpMj++iAalyyLkFe9mr3fUJ3cB+JGWYwku5BiyK4zCLjE4ue1/2EF1qnn9cKouy6uQzeJ8G7Zwstqp3a1eDPH+XF5pvT6CARAr1aaePMnrVOBRam0IB6LJYsLTtvbj0ox4rya3I7McNePVZdVPDThhuYWRXe50HUcL/auBJV3ap6+bi0Q17c2eemVCY+CK0CPF9TAKC/uCafZ/dtDlx8wSqrfEAGHexGy1E3PK+c31Z5ml9ef9WCPEbD+uqeQ43CruEesRWJXeuqd3tvFirqgs3aXfq5dCIh5yD74HcZ6nESjzH7+zCncHhWFEqU9KZ+fcDBsc8lSZcDBfoHp7PbncYFZ8cmpaFw5lQN6QfhAl5EbOYrvd+xY/QbAgAJmDBVnIQ5shpRsvG31esPvBJvMqxEl9CCUNxjMsLHVqdgXNAUUr9cXZC/QCkdBNNY6dsMu4pqbH4oaWp2E0OlPvscleQXUmrMiV+VkbLRk2h/u/ICBQktgyYPaE444qXR2s42LFKyICLRKO5s/XVY5P0RZzGXWV3KFnLbD85l16R3ryOqASX2Po2NanU0m4pf9azGpiGqLR9V99pfVYBZrUYnqj4zj36pwLOolw/Q6heBF9nZr+bdRb+KWZ43Fb3iHmLllObBZHPtrmdnfgbao3ZXDuprwJD+QeXZEm7hPke6ts0vJvkoZvnaBkJV1o8cufgLjKl75vPzroohglKP+Tlv6RPHkUuNOlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(39860400002)(376002)(366004)(346002)(66476007)(4326008)(8676002)(66556008)(2616005)(66946007)(31686004)(186003)(82960400001)(83380400001)(2906002)(6506007)(36756003)(66574015)(38100700002)(7416002)(26005)(44832011)(6512007)(6486002)(54906003)(110136005)(478600001)(6666004)(41300700001)(31696002)(5660300002)(86362001)(53546011)(316002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnRQVDN4L2MrU1JoeW9yYnFyNHpRWS96aWFNRUZPOHQvdEI0M3pHeEE0cERt?=
 =?utf-8?B?TGVlaTFWY0ozczFBZHRoeDdLMWJBbnFqamZYVCtaMEZRODlBK1lBbU9tQnZ3?=
 =?utf-8?B?bFd0RElaSDNaZVNxemdWMzBvRnFmT3Y0RGJaQ3JIUnBOVjk1RHhWZUxySlJT?=
 =?utf-8?B?WGFWQmM1Q2ZHbm1kMmpqTS9TRGV4dmw1UnNUMTN1WHprOVlpVGFqUnc1czFv?=
 =?utf-8?B?aGp3SmJFdkxzK08wdGdPLzU5MjI4RTd4dW1VUjJpOGhkbW1McUZwa1psUGIy?=
 =?utf-8?B?ZlZaQitaZkpwRUUzdlFpL1pHVGU0T3NrdGZYZTcvblVBZ1pQanNhcUZ3WjdM?=
 =?utf-8?B?Y2RXYnl1NTU0V1RmQzAxNHpuTGtoZFhqRVRRcDQ3SmxaaDdKZjJXa2hYdC9Y?=
 =?utf-8?B?a2xxekdmS2lSSVFsNXBLQWRlcEU3b0VVM1dEQXdUUkdrU241bkttZnR0c1kw?=
 =?utf-8?B?RmtYS1prcWRHQU5KemRaTVJLODhxREdqdXp3eUhXYjV1TkdER0xwS01wc0dV?=
 =?utf-8?B?S1BpZ3RKS0FyWkJWL1hOTDlibVk2VXM5OEtyOFZKV3gzaUM0c3d6OWxLYmhL?=
 =?utf-8?B?Rk1mL0ZWUVo2MUJaWmloclVtc05wT0hBdmlxM1d1K2lmSGFNZzg3UGRRT245?=
 =?utf-8?B?UnBqSnpoTUVpR3VXS3FOWUV2UVFYc1pNZzBRcGJBSmk0bWlyUVF4TU9ITmhT?=
 =?utf-8?B?NUYzN0xFS1NzNmZ4NStpRTN3cnZua0l5ZlVlN1V2Z3dXYWswUGJ1aDIvZmdH?=
 =?utf-8?B?UGtWeWxZQ2lXL1hCdVEwVC9ReGlSUmpHTUVpN21jK3kwWm0xbkhsd3Ixc1dj?=
 =?utf-8?B?QzFEQ3RFVFp0WTQ4UExkTnMrOXdJWXR5OTlxU2VpSUlrQVhxQ0dFaUszdHps?=
 =?utf-8?B?a0Q1ZUNGZURZeHJlakZDY3I1Qzc1RVg2VHdpT3A5RVVFQzEyakg3NjlVc3gv?=
 =?utf-8?B?OGpFREZTckRDWEZ0YmtHUDF4Y0xGak5kcmhrZVZ2L1VIYjlsMUhyNmE5OTNT?=
 =?utf-8?B?TjVyUk5MZC9xUmNycS9ldmRSalN6Z0wyb1QvOFFpQ2t1NlcvdGpMbjRvdHJq?=
 =?utf-8?B?ZDcvcFczQ0Vwa1NnVkM0SjFqY3V4VEFsUTk2TnNVSzBWUkd4T1pKSWc3VEgw?=
 =?utf-8?B?NVFxV2VaeFl6R2tOaENHNHZuZ0dYNU1PdVozNVI0UzdaWEZuZ2RpUm1yYTF5?=
 =?utf-8?B?b0tyRUVHeUlTZHR3VzNnQUZsayttMjg0RkVRbDlmTzh3a1llR2EvaklvbnBZ?=
 =?utf-8?B?SEFOeGhMejJCd25Ia3Q5RmNFbmFlU0t4b0loQVdkdjFkVkxrNHVvL1FCNGsy?=
 =?utf-8?B?STF3SXJ2MUhPWDYvamV6eHFDQUplSHJBNm91LzBOdFdVaExINkFsQkFjdzFx?=
 =?utf-8?B?ZzdzS3RKNy9hWlUySm1qT0dQUWF3cFY1REh5SVJ6YUZ4dkd6VjNFRnJwNVlX?=
 =?utf-8?B?ZGVnZ0llaWk1YWtMQW9qdlJkbC82WlV0VjRHY0hjZlNqN2FobDlMa2NTd1JX?=
 =?utf-8?B?S3RYT2laRXB6RjNzVkNkajFiZmZWYkhMekNkSUI1RHBnOHBiS0lWMVRyTjIr?=
 =?utf-8?B?YSttd1dqNTFRdTlEWlVzWFhlakM2T090ekVpV0pVREJaM2QwNjVtSHJvdjFS?=
 =?utf-8?B?NnlLdjVqbzE3WEN4VlppaCtja3JNZGhEWFd4cU5TWjdGK0dqbU96SjFZQUZH?=
 =?utf-8?B?T1cxazMxRGZLTVBiWVZMcjBJTlovTUhoQ05uRlZvSlk3SCtzRXlJL083ZGZK?=
 =?utf-8?B?MVJRNVc1bThtdUFVa2JrdUMzZ3BNK05nRDJvWlVoSElvUjIycDJ3L1dNaHJJ?=
 =?utf-8?B?SXdzTnB5dEhoV0dOZHVvdERmbWtRUDYwNlBPWDJ4Kzd0UXEzaVRWaUlLSjBo?=
 =?utf-8?B?RkxtR0JyZ2k5Vm1HeFFYUzVWTG5uSEkxZDg5RzRIT2Q3OXFSZzZRWm0zNnZk?=
 =?utf-8?B?ZU1maW9WV3dJSGkrcms4ZXJ1NVEycVB1MkF0Qlo5ZkJ5b0JrejVtS3ArZmk2?=
 =?utf-8?B?aHdCYndVLzRwTUJFSG1maldtK0NBcHNXZ05iMGxMV1ZZNUZUbkJ6RVdrWTJm?=
 =?utf-8?B?N2hwajhkcE5OTUg0bVh4eS9SYjVXSTVuczJEZDZROEp6R3JLRDdzRFhJRmxF?=
 =?utf-8?B?VnZMMWtqQTdMSnJNeGM3RHUxa205UUN2WWM2S1l2TktqcDFVQVFEc1UyYXBL?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e69762b-1560-43f9-19cd-08da5f3e434e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:57:04.9086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7wrJjwka5H4yBVrGT/pvJsjqiak8P8upx9vtCcE2+B9tZGus42CpVxI/l5SZj29RBJnBwxRpRa+9hdWFd47UQkY4IM92EuZws8eKLl49ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3427
X-OriginatorOrg: intel.com
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, sound-open-firmware@alsa-project.org
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

On 2022-07-06 12:44 PM, Dan Carpenter wrote:
> On Wed, Jul 06, 2022 at 12:27:49PM +0300, Péter Ujfalusi wrote:
>>
>>
>> On 06/07/2022 10:25, Dan Carpenter wrote:
>>> The tokenize_input() function is cleaner if it uses strndup_user()
>>> instead of simple_write_to_buffer().  The way it's written now, if
>>> *ppos is non-zero then it returns -EIO but normally we would return
>>> 0 in that case.  It's easier to handle that in the callers.
>>
>> This patch breaks the probe point settings:
>>
>> # echo 52,1,0 > /sys/kernel/debug/sof/probe_points
>> -bash: echo: write error: Invalid argument
>>
>> I did not looked for the exact reason, but something is not correct.
>>
> 
> Crud...
> 
> Thanks for testing.
> 
> I used strndup_user() in a couple other patches today and I didn't
> realize how strict it was.  I've NAKed my patches which used
> strndup_user().  One of the patches was an infoleak patch so I'm going
> to resend that using memdup_user() instead but let's just drop this one.
> 
> I guess another safer option would be to just always zero the buffers
> going into simple_write_to_buffer()...
> 
> regards,
> dan carpenter
> 


Hello,

Indeed the strsplit_u32() contains some bugs - tokenize_input() needs no 
fixes if I'm not mistaken though.
It seems I did not realize the bugs were not fixed. As the avs-driver 
makes use of probes too and these are being tested there regularly the 
team did notice the problems. Below is the implementation. I'm saying 
this as the plan is to move both strsplit_u32() and tokenize_input() 
into the common code so it can be re-used by both drivers. Will send the 
patches soon :)


Regards,
Czarek


static int
strsplit_u32(const char *str, const char *delim, u32 **tkns, size_t 
*num_tkns)
{
         size_t max_count = 32;
         size_t count = 0;
         char *s, **p;
         u32 *buf, *tmp;
         int ret = 0;

         p = (char **)&str;
         *tkns = NULL;
         *num_tkns = 0;

         buf = kcalloc(max_count, sizeof(*buf), GFP_KERNEL);
         if (!buf)
                 return -ENOMEM;

         while ((s = strsep(p, delim)) != NULL) {
                 ret = kstrtouint(s, 0, buf + count);
                 if (ret)
                         goto free_buf;

                 if (++count > max_count) {
                         max_count *= 2;
                         tmp = krealloc(buf, max_count * sizeof(*buf), 
GFP_KERNEL);
                         if (!tmp) {
                                 ret = -ENOMEM;
                                 goto free_buf;
                         }
                         buf = tmp;
                 }
         }

         if (!count)
                 goto free_buf;
         *tkns = kmemdup(buf, count * sizeof(*buf), GFP_KERNEL);
         if (*tkns == NULL) {
                 ret = -ENOMEM;
                 goto free_buf;
         }
         *num_tkns = count;

free_buf:
         kfree(buf);
         return ret;
}
