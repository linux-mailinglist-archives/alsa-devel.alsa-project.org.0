Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C738433D8B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 19:34:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FFA16A3;
	Tue, 19 Oct 2021 19:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FFA16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634664873;
	bh=xXoULVu7qmFSb/4UhLzgPgZrvgJwPH6TFGGrrwzsYXo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NhqZHM+pyJ/h2vVK+bmkXXNbSkmOb5BWvOWVRYEu3qAiiG0ZMty9lJl0uInZ+MeuC
	 /5eNfjWylsnbqsvxmSQvZ1SMbEwQfzhqnFVnw1uksMei9QN4WaP0+n5JQngHfVRds0
	 4JZ139IMQ5MiFs2MkAe7LVqNRa4XK8L8V0uc5bAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF453F80111;
	Tue, 19 Oct 2021 19:33:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6573F80240; Tue, 19 Oct 2021 19:33:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEF09F80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 19:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEF09F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="V0vRNEqW"
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228854521"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="228854521"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 10:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="574402035"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2021 10:33:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 19 Oct 2021 10:33:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 19 Oct 2021 10:33:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 19 Oct 2021 10:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bm65wnHNyF+rwypIvpebLX4kOYF4LJSgRIqAvp0SPev+DKjvCkSRdEaL4Eag08QiavzkzceSkBiZzZQWzNt9CVRJLtGwPTXmD9epfmX53MdDR9ilkt1kTkhjJth8JsQ5FW46+eRz7ru99VoQD2x9WU9W6zcvQ0IMlsHKONdyFh2+VDc1AzgfDmWvHyEfZM3gKfCyNPDCp0xTyYSWHN2z1b0atXiaRQJXBSoAAKl9atvqLublrgxSOoB2tBLkXr2krNHjggTDwHinelNkK7YMqEYs2/OmfIxLlq3bQHTUxwTorUjoKHBD9b0BdUK5Y+84gWb19DrqFlIV6oY0LHBsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbVEqIiEWUu9TR6L9idbsi1VkLFbLlV0MT9NyCsnNRY=;
 b=DEMa5Gt1XuX1/Y8cA44gJukaLvnd+cuqYqBFxgVbzs+KLyLPFq8aIcvsI7OZXL6zXWXWmoIWSVO+YsfGj/a3J9hLPNYpb95AS9wFaFcvgyTy41YDBUqGqcrn34QFg/7KsVXDVVAt6zNk4IiIM6i/bsYGKsL6IVSjsGazzNVYytDN6T2VwxOyxpVTIUXu4GMCaZci6sItt7OCHzXU99b5GWqyMAAhZ95y80ve757xqsjlHfS5qTJ/Dnx9ittxkyi8glskehJ4KOIIlvraXBT1LDHT7TX74dL7xGnHZPpVF7tE34WlDLAbNWmx+B8cZajPphQSuN0K3q7MoCPyrs5rsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbVEqIiEWUu9TR6L9idbsi1VkLFbLlV0MT9NyCsnNRY=;
 b=V0vRNEqWjZIoY3o5HNE3gy14GROlOFKYZo5DeIve5MG96Hdli6gf8tbjReaIWs6gPdSXBjMPjg26LBhauwnxnV1hiLZD0ZDdEXRuMS1T5aerMnRdVa+HJmNqi/CU66Nv6Il6phzpMgChT+bCxNTn9U6fPKbwJGpcSXaCYmOn4YI=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN7PR11MB2721.namprd11.prod.outlook.com (2603:10b6:406:ba::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 17:33:01 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 17:33:01 +0000
Subject: Re: [PATCH] ASoC: Intel: Unify HDAudio-ext bus initialization
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>
References: <20211018192134.353931-1-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2110191203390.3554566@eliteleevi.tm.intel.com>
 <4bf04607-0779-fe47-61b1-1780ab1a3d20@intel.com>
 <25811f8f-c7bc-89c2-f616-4102293a2deb@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <d8b90004-6c64-8cef-266a-17b2a4a480d7@intel.com>
Date: Tue, 19 Oct 2021 19:32:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <25811f8f-c7bc-89c2-f616-4102293a2deb@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0244.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::9) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.110.142) by
 DU2PR04CA0244.eurprd04.prod.outlook.com (2603:10a6:10:28e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Tue, 19 Oct 2021 17:32:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e19e449-c53e-46c4-c778-08d993267fa6
X-MS-TrafficTypeDiagnostic: BN7PR11MB2721:
X-Microsoft-Antispam-PRVS: <BN7PR11MB2721939DE50DC8334597B9B4E3BD9@BN7PR11MB2721.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xIEGdXQ6crrlS/eRmorU7v1qnOtyIl3iXn62DZDsPmy8yV36X+TrT8bNQQkTkCUUvfFLS+SOVX+mbiSPEgS08ETtKkdjNgEW1gsuQjzr+pv6weOkLJPNHNT5iieAQo+B9bNW8LkOk+m5RFvPR+KguH6/KT3uu1uByNktAjv20LVWpxQIvCqzbDpym/8a8MLC9UNetO2YVRMCeA5E63oy47jQNauevHKAICtLEGSAtHEsEevNVWNnFUHvHNlD/OcfqRmJjAHcqOy2335Q7t+It3kjKzbImCrVHWjkGRt3eqwzet7SxrheD5gthwxd2Oeg9XTHmbzKJuE7X03mIMj+1qPSgcefX2RkiAmGIiAWUlDZZfVw1/1nyBjOozfswDdWbVyXmFc/xSU7JaA2aYosnS27mbUmudkmFK6zlJTbAtiTMQDyakOLXdR4CsYFgydNGHxopEkReaxs7MgFYPWz2gPTh3SfUBwacrWCZTDq1bo1pn7abv25RYhWh7O1XjsxiYz0YuvaTzJI1jbogg2yyuZwqKaTs35a0cWSGDEDNsIexiNxF+G8LnWvDrkbRonf103MNzgHs91CzRUY4C2Ovg453UJ3wdvfiX7NfpnN+qQG1rXZMbGK89GaZBU+tzTJWBt34rdysniJ1F6kDPYnk3gSRcIFW45ZNZv9BN31NAc9O9sODDn/t/IV/CNfYcIlBJX9u+7HL8BuERvoXJMqQT+deJ+AQRdMUxw8mYw1mXh53vK5wKtZJ1qPvL60BCuC/aBaRdizrwNmaQEvcst0xRvBUczjaUMt5wkILtnJMeANW5nBABRkrzFkeOL03OkKktFTA7Qz42jF2kGJOvlX6/2FgUrJ4TSWUJfajqAX1kj5CCYM3nGg10/KvjGs+OOo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(186003)(8936002)(26005)(4326008)(82960400001)(53546011)(66946007)(2616005)(66556008)(44832011)(4001150100001)(956004)(5660300002)(66476007)(508600001)(316002)(966005)(6486002)(2906002)(110136005)(16576012)(38100700002)(31696002)(31686004)(83380400001)(36756003)(86362001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlQvd1Z1SnEvUmwveVJ0Tm5SKzBYTzVDb21PL2JoRzlIOWoyRXBMQVVQV2k2?=
 =?utf-8?B?WklVV20wbTdxNWRuS1liUDR5NmZmdU42QktBR1dhTnhHN2Q4NWF1b2VoUENT?=
 =?utf-8?B?cFNQTTZ0ajh3OTB6QmhsQy8vVVVKWlRZVnhhYzNFM3Z3TkN0cGlqUTc2WnI4?=
 =?utf-8?B?dHR4S3dnMWxSTkd0VTVRaDF0Y3JzR2J4eHFQMTlnNjA5Z3BRZy9VdDlTN2xP?=
 =?utf-8?B?bC9CTVBMdTVpd0tXY2pUa1crYVBVQ21GYVF0UkY4OVJVQm4yaGpmVFg2Tys2?=
 =?utf-8?B?eFI4cENwN2FuOXlPMnRVWDUrYm5rM0ExMmFXTjQzU1l1aktOM2h6Yktpa29z?=
 =?utf-8?B?bEFTamRoekdnNU9lZmNsaUNZRmFmSWZvMFhsUXJOT24yakc4Smp1ZVRFWXgx?=
 =?utf-8?B?NGx5c1lKS3paS0tURUp1OWlLMW9TWjQ5REdROGdvN1ZhZE9tNDIvVEpqbUlh?=
 =?utf-8?B?R0RRYS80UW43M0xjZWhReW9zT1VsUXppalZkMkRNSm1jc2FMR0ZyNlE4REtF?=
 =?utf-8?B?NVRlV2hwK3lJSzFWelpTNncvc1dJem52Si9UUjR3anN1d2dPb3FBRkRFeTJi?=
 =?utf-8?B?TDIyd25rMlkyenFOeCt2NjRVT0c1MVdYaWZKdldDbXUra0hJVTR2YWpuN000?=
 =?utf-8?B?TW1MWkVlb3J6YkJTRUVlN2pmdlpqbmR0YkdOVjhISzBNMnhSNWlaNlM4UGwy?=
 =?utf-8?B?eERCOFArbiswZFlhd04xbW5xdnVqRU95aUJCQStpekw5UzIxeE9DaE8vRVIw?=
 =?utf-8?B?NFRHbkNyelBqazJ0NjFCNEVqUFVueWtlbnk3eEhReU1qbEc1Ujk3MnZpbmlD?=
 =?utf-8?B?Z1B0d2FXaEdLV2hZbzF4OEZlWHVRS1g5VzdBanI5QTFBcVU4NlNzOEVveHdZ?=
 =?utf-8?B?SmNzZFNEcWFFWTNjYlpEK0ZzclNRb0ZXT3RPOHVUZWJDSENxUEV0N3lvSUNk?=
 =?utf-8?B?eVdaZWtLa05GclJ3UlgwWWtqcnpFU1lqUkYrTmdlK2U3UEIvMmV1eWJtSmEw?=
 =?utf-8?B?S2pzUHVGZFEwTitycXViWGRPUWg5dW5LUU9jd1BXbGdlNjBsRFoyT3YrSTFF?=
 =?utf-8?B?T01vK0tMOGY0MjV3SFc0MWIxOHZnTG5VVkg3VGFFWW1kN0tQc3BXL2doYVNL?=
 =?utf-8?B?RHc0a2lGbjNKZDNER0o3U2ExRkJ6R25CbWFoTDgxSyswcE04N2dpQWZqMlZl?=
 =?utf-8?B?OWtXeGJLN01XNjlKdlNmamQxK1AzSDBxMHp5SDJKdVNoVUYyU0puWms4aDJ1?=
 =?utf-8?B?MnI3V1BES1gxMTZaZDRuU1ZTcGdNUThOMVNpdFZrOGpzUW9PeEpWMEZrSEda?=
 =?utf-8?B?WXIwMmJEVWZZZk8zOFJQZWMvYkM3Wm9zb0l6eE5QSkVWd2xoWUE4emdDTEMx?=
 =?utf-8?B?dC9OcVVBN2kzbTFwdm1ka1UwZDYyNm5RZWo0K3JENG5LS3BKMnJkSjlPTEFZ?=
 =?utf-8?B?dHY2a3RhZzVpSWdIbmwxT2ZOWjlDdGJ1QnU0VXJBVWdPek54YkxlT2ZkQnlH?=
 =?utf-8?B?c0V3WEwydEVXUXFDUlIrajFyemdWd1NmSWpQMklrTndhUGszYTVrdUxsVXJD?=
 =?utf-8?B?K0pVU3VoQ2MzVmxUT2xVM0U3NVYzc0t3L1UrYURoUy9rbklxVDc0ajhkS2xF?=
 =?utf-8?B?UTU3bWRjMmlwam9rdDZNcktuVEpQN09ibUpDdktkeWpuQ2I5Q2ZPa0pxZXdC?=
 =?utf-8?B?R0c3RkxHZXJ2WmNxdmZvR09yMzRmclRJWmRpQW42aGRHbW84elBEcTViZG04?=
 =?utf-8?B?bVg4MXNHZ1NkWWIzeWFVWndjZjRBSHBPbWk2c1dxUVNjV0lBbEJKSm1RbnlL?=
 =?utf-8?B?ZWFwazBuaW1MNnVrVHhDd0FCcEFRMzhEbEduYW0rL2NMV2FsZlgrY0JhazdC?=
 =?utf-8?B?OWQ4RVhKUnMwWnZScmg4Qjg2RDhEQys3RUQ3amRzN2pQOTljMFQ2WHZiM2ho?=
 =?utf-8?B?KzBQNmlsaWZCTENLVmt5T1RHRWdUQjVPbzVUVHlpdCt0RThTeisxMzlSSW5s?=
 =?utf-8?B?c2svdUViYjU4T2lKOUhSSlB0cE9SMzBlNUFvM29LUDYxcFp3TlpsR3kxTW42?=
 =?utf-8?B?UlpZZlY4eWp3RjdyTzYzQU1rdjkzdFhnb2x2OHU1NzQ5dDdBSFlJNUt0ZnU2?=
 =?utf-8?B?QTRkVDFST3hpWENvckQ3YW5ZeFloOVJRbzZVZjdJVnl1eU9mai9NSFlEMmJp?=
 =?utf-8?B?QXVJZFRnTlB0b0U4OGQrSnpDbkVnQktYdnVJVGtmSFBZK1I1ZXFBdkNnNHg5?=
 =?utf-8?Q?/AF6E9B/gA+9K5IDLDxWWDM1CTlQlYhvuEE53fwerQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e19e449-c53e-46c4-c778-08d993267fa6
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 17:33:01.0541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QouBFXhgSXicg8AplUc/fHhjiP1WjZFptp+gDbM1mXcxGOLQ2Tu/ihhS0ctqloKiYW/ik6NMBcGDcajgnd9V8vaoJ9lFqBqoTpGz3AExmK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2721
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com
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

On 2021-10-19 6:58 PM, Pierre-Louis Bossart wrote:
>>> hmm. It's not clear whether we should initialize the regular hdac_bus
>>> fields in the ext_bus_init(). For plain HDA, these are also initialized
>>> in the caller. E.g. in sound/pci/hda/hda_controller.c.
>>>
>>> So if we start cleaning up, should we go further put this in
>>> snd_hdac_bus_init()?
>>>
>>> Then another is what is the right place for settings like "sync_write =
>>> 1". While this settings applies to all current users of the extended
>>> bus, this is really hw specific setting and not really a property of
>>> the extended bus, so this feels a bit out-of-place.
>>
>> I'm rather in favor of bigger cleanups. We can definitely move further
>> in the future : )
> 
> I am not opposed to updates in this hdaudio-ext part, but I am in favor
> of less ambitious step-by-step changes.
> 
> a) This is legacy code where the initial authors have moved on, and it's
> very hard to figure out what the intent was. It's quite common to have
> discussion on feature v. bug, see e.g. the discussion we had on this in
> https://github.com/thesofproject/linux/pull/3175#pullrequestreview-772674119
> 
> b) In addition, this code is shared between two teams with separate
> testing/CI capabilities and limited number of commercial/shipping
> devices. There is a very large risk of introducing bugs even with the
> best intentions.
> 
> Before we do any changes in functionality, there are already basic steps
> that can be done, e.g. using consistent naming between variables, the
> existing code is just confusing as can be:
> 
> struct hdac_stream *stream;
> struct hdac_ext_stream *stream;
> struct hdac_stream *hstream;
> struct hdac_ext_stream *hstream;
> 
> I started basic cleanups here:
> https://github.com/thesofproject/linux/pull/3158, I haven't had time to
> complete this because of more important locking issues, but I intend to
> send those clarifications for the next cycle.
> 
> Again before we do large changes let's think of smaller steps and how we
> are going to validate those changes.

Agree, step-by-step is the way to go.

Isn't this patch a 'step' though? This isn't remotely a refactor, just 
gathering of common parts of ext-bus initialization. We could start with 
this so legacy users are unaffected, then have snd_hdac_bus_init() 
updated so snd_hdac_ext_bus_init() is devoid of 'core' fields 
assignments as suggested by Kai.


Regards,
Czarek
