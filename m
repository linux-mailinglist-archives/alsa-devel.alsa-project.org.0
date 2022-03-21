Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5154E2E02
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 17:30:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 784EF1752;
	Mon, 21 Mar 2022 17:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 784EF1752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647880213;
	bh=JFUogGW9Vmik4U1dYNWQlhatY3LJZjIeHTHSfY6p4gM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=viC+V+pfClzv302OrlokJq6aWHdb6Ozj00TA/7h7oNfZlXNg2/jfWH61V6OrIbknz
	 rhXuYryOSyds0jBReW2O2S/O+wOPScH97TLBhSir7P1uRM8cXFlrjiQN6P7SSZIASI
	 ZPVaT11YTSu5/kZgfAlhlKuU51QgZ5i0Co9eOxHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9217F800FD;
	Mon, 21 Mar 2022 17:29:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72E31F80227; Mon, 21 Mar 2022 17:29:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCEEFF800FD
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 17:28:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCEEFF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GOOQEP4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647880139; x=1679416139;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JFUogGW9Vmik4U1dYNWQlhatY3LJZjIeHTHSfY6p4gM=;
 b=GOOQEP4QKETIDLkG9rRtCBcwRtTJh7mSdKjTGCun7BsEPsZw9e3jZ1dH
 1S9XPtSlaS2s6dpYLDTsWRcUq1tiZLT2vWwrx7pzWQ8W3jZM/CLyyDI+B
 QAxue+cjiaWHUL1n6//mOrhlNJ/QvUVTx1wPdKnPFviFiiafHnhqqJjfd
 PvlJJhAqZUpIRLptZrwSJG0yPDr0/cj2FVoKX2bxNmr+gRlpLfxRilHQV
 T2IKcqxYziVxojFDOSK9xkYYAhvAFebhBWmN3LcHOhJeRasJmgHjnKwsu
 qYcRImA6a+PcL7JiMQjZQ3mF1XE9ec64RV9EqLsba3nuTobYUGVWJ46aU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="237534465"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="237534465"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 09:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="551769637"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga007.fm.intel.com with ESMTP; 21 Mar 2022 09:28:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 09:28:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 21 Mar 2022 09:28:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 09:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxzwCK+ywmVvWs4zcir62CyNhyMyadw35w0VBhGr6rFpyOY+ydEQcItwLTefMNScNEgNn4DrhrPx3eJMXurc0dtjTiqaY2+3iklCdvehnSoXxqyuuMcDscAPtZTMMb65jFL0aoOKl6GBwWWCDEfI6algk7kI+oHXGS3gZ+uSw1O66cTa5w6nFxQAgPxVZtb3q9q5SZmcpHdXaeCSZ396jL0B7hopdFCE6s2U7V9DgAucjEFjf2YgFzY/bQzlReU8H3FYfuM+XiG9uAY+O1EewCkFV0R3i/dLyKZPKAl5BlyNDNPVZ/qatR5sVKvgyQ7PtuxemHnMUIIx2XOHR2CQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8trTJxHfdHcN99nFM2kdZFQ5ZV9uw58mQzKx3GYfJSs=;
 b=UlWv9ax+doKxFcARJRiKj86MhT7WuUgjaGnrVgiNAHwNW4UqvEfPvp/cc5Dk6S7Hehm5cIigbXuqJcu/yAzw4awXFfhgpc8rLdKv1Ms0drlTIO62t3hLimHiWnjc6Fo3XIEBmJXUIuzMaYqznkTTsmLj+Xxaqg9drxU2cWwxQjZU86+ccp21+kx1f7oNNDJW+SQAqIXcImaMXT9Z1jA+sAqFJDN5kDbV9k7RAcMNz4/8zveXB9Q47snjHpa+0bsDyxgmlPVBtVKOSM0kBacdedhc5gQ24JxqPSAgnqLS9NjVT7vTplEioiHe2kw3CWbFuNtjmqGHpJzQOXra3qlOCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SN6PR11MB2702.namprd11.prod.outlook.com
 (2603:10b6:805:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 16:28:46 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.022; Mon, 21 Mar
 2022 16:28:46 +0000
Message-ID: <afc20d4c-cdfc-2d38-1ce6-be83474a0ee1@intel.com>
Date: Mon, 21 Mar 2022 17:28:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 07/13] ASoC: Intel: avs: Add topology loading operations
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-8-cezary.rojewski@intel.com>
 <361a3139-400a-b86f-9690-a8e06d0890b8@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <361a3139-400a-b86f-9690-a8e06d0890b8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0044.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::21) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30b28479-e8e1-44e4-2ffe-08da0b57deed
X-MS-TrafficTypeDiagnostic: SN6PR11MB2702:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB27027F5E8448E1B29A710148E3169@SN6PR11MB2702.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PapqOIwCxEqLyz0pPFLsNAfYoIL4i299p9uGnKQnQvE8sZ6/zhCaJv61flvP+E8YChXJ7p8Sb6mnn422mHEy19VIUz0F8V5kzRF8Zvlbpy8B7op1T2G5Afq/rR4ew7zqOydxdv8gqYO8e8PDxUK2+x1Tq/m7866yay3Sn1eTazPRSbB2j8MaxoDhWabyN40b4AU5+KyKvJ1DKL28Vq8w5HcgIMaQYJz8BVx1Uwvs4ZG3C3fd6SnCzG6zl15LjDBQWkGqm8+oTHLXnUzWZt01rMUwi5+79U/BB/YSASnCJFG8Hyw4HrfDrHGDBihfqQfqPhgIVCC+OnOFZiPlFsdti/KaP+eCzUkq8ibteVcIleDJ5pnawJIvDlie0A+Se/L8noq1FjZCfIj6gVU8efycSTo8jiIbdO0bTG/RO8lNmBwUsqz/YyQSuz4Gvdu+a+qFJkWnaedD8J1q6Loy27RrsguQzq1ln9gfkG0XOJ0bPrLobmYoQ+sicuWzpj2kD271lUX67Y/i/uqSIaL8tLHBIIQOSYkyZnh/a74GZE8IR6hUganQF93LqthytgcgboQiaFEhkD7T1e98jdz0q4DrLDbjWV4nB2Ykq274crcoz978T+sCQQOVDKwMNGwvKMqrvH4i+jXXFErH1aDqtEdEqAFM82LxA+BLsKecYHY8wGU26TctGkG4P7K5Qv/5yUoizAVKIL20ZPZGCXkfKf7/uvPwjkDURtF3eQk2P3XD2ro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(36756003)(186003)(6506007)(83380400001)(6486002)(53546011)(5660300002)(316002)(6512007)(31686004)(8936002)(2616005)(508600001)(6666004)(2906002)(7416002)(44832011)(31696002)(86362001)(38100700002)(4326008)(8676002)(82960400001)(66946007)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE52eEUxZnRCNUtxK3NXbnBSamw2djFoQlpIUEhSVzRwc3J6WEFSaGR2ZDdk?=
 =?utf-8?B?M2NmVE5CaVorSDJDYzFrVmowRGozUmF1eWlJMmUySkxkQjZ5WU5aaC9LeUp6?=
 =?utf-8?B?NUNpMGFmWGZRWVBCbDJQV1lWRWtlaFZtYm5mZFZxMTdRb1VEbnAyckhHL3BV?=
 =?utf-8?B?M3IxajZlZ1lBTGh4bVFoMmxBWmpvR3dWOEZVaWFNNzVaNG5vQ2g4YklkTFJY?=
 =?utf-8?B?eUJtdEsvUXBmd2wwNm5lQWIvQkM5UXdLWmNkcGlrajlpR3ZCRW1hUE83dFNV?=
 =?utf-8?B?d0l0UDQ0b1o3RWFXUkRaTXE3L2xDNGRwcDRlVWRFZVFPYmE0RDFZeGk0cVF1?=
 =?utf-8?B?dnVYdWp5VVdDdEFhdnRzL3pMOUc0K0krN3NITnFIbGh2T2V4ZVdCTTdkSjNP?=
 =?utf-8?B?cjdkVFcwMzFlcm1lY0lJYmFyZmxBMk0yNEVTUWFLcGFNY3NoYVV1U3JiRlFa?=
 =?utf-8?B?S1dzWTNvblE1QnhtNGlNN3lJempmOE5PK0RXMXV6SElSd3M4b2U4WktXNW84?=
 =?utf-8?B?eFlTaXp6SzkwY3ZxVmJsRE5xTUVoWnR0VjEyMCtOTkMyMzljQW1PMzU5RmVQ?=
 =?utf-8?B?VVFqbEdnVnBUNnh1eUREaFc3VTd0ejZDSWJ1Vmp4TUFnMkwycjVVKzdxK0cr?=
 =?utf-8?B?SFFsaFcxM2dDRFE2M1lOMXYySCtYZlJxWGdtenRGTWloaTB3ZnhOR1k0WHdh?=
 =?utf-8?B?ME1IMkVWYkxpWnIzTWhPRUFYZ3FRb3lESDFBdjYvUzdVVmlmS2VZdXF1K0ZU?=
 =?utf-8?B?NzJxSW5VZmtvZXRFQ0huTkJBUEJXREg2UWdmQ0tCK2pLSmlFMmhsZHRWK1ZE?=
 =?utf-8?B?NlJtVTMvTGJ1OFpKamFYeG9yNkE4ZWt3TkJrNFRKTU9CbGVMY3NSRlBOeVFO?=
 =?utf-8?B?T290QmJJdGsveUdtL0thbzBHREU1TEhsbXdydlEyOGFLcjNZNWlNQUJXT2pv?=
 =?utf-8?B?VlhhOVdJdzI1bnlxN0dMK0VoUmRUUWNZejdlTDluMitnN3pKNlBkNThweXRM?=
 =?utf-8?B?c1YxQ28yTDlMVFdVT2cyUFJzRlp1K1d5VFVxSmpGT0kzTjI1TlhHbEFXdWls?=
 =?utf-8?B?Tm8vUCs4NjBjYU5BRk45TW5ibzR2RHFxajZMUkJVRU13U0JBRklzQmhoL3RL?=
 =?utf-8?B?bUo5ZUhKWHZCdmhTWTlnNDY2ZytDYVNtZ3JVaHdqMVZHNkV0SEVlMUlCMTNz?=
 =?utf-8?B?KzVodFRoMllleDErd3dCaHpjZUdyUTM2TEhscEF5ZlUyQkJDT09wTGRWNDJS?=
 =?utf-8?B?bDdCcURjN3pWbzZSRjNCbXRyVjd0aDRhYkoxOGNPRzR5WUhPbUErZkZyRWly?=
 =?utf-8?B?SFpxUTdUZ2tkR25EeE9sanl6RFdZQnIzbmVTZWFYcDNEZ2pSRmYyVEFhZmZO?=
 =?utf-8?B?dUd0dW5JU28vdDc4Vi9MVTlNTCtrUEhVeFc1bnZnbzErK3NCTmRqb09pcHFF?=
 =?utf-8?B?K3doUWtiUUFsNmZEMmJLc3d3N25rOGN4UFptemo2bytETER3OXNYV0FVdEtV?=
 =?utf-8?B?bVhtTE1Od1VjZWRibThrcVlHMUdhT1F2TC9NTXlOVzZZaGZKVEJtWlVVcy9H?=
 =?utf-8?B?U1YyNlRiNWF4bmhVYmNUOHAzYlpmZWFYWXVsY3NJSnZQd0VNc2lMZlZNWnFa?=
 =?utf-8?B?ak1qNkJOUGFmaHFYL0JCU1h6RU94V1B0Ky9BWGp4MWladTI1aExQV1dDRFlM?=
 =?utf-8?B?Z202RUpGMEtGVnpyeFp2VGtDWUp4cWRiaWpwaUpHTngyR0ZBazBmN3RkSVYy?=
 =?utf-8?B?eXBMUnQ2a29WVERGREN0elBxdHA1ajBiUTdaeFZYeUZJYWVwV0RyVk43V1F3?=
 =?utf-8?B?YVc5bWE0ZU43TFpNQXBIWEJiM0ZGQkJvNXp0a1dvWE1INW5XQTBSbDlOVW9I?=
 =?utf-8?B?dDBaNmZCRy9XWDY0d1dNVWdaaWxOM2tDaEJ6YnA3aUlsWUlvVEIyL3BsREdz?=
 =?utf-8?B?ZkRkUGlKSWxMd2NrUlF0QXJNc3JvWENsOUdSV3o3VmxYYitSUTZ3S1pNcG1S?=
 =?utf-8?B?SkEycC9GSURBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b28479-e8e1-44e4-2ffe-08da0b57deed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 16:28:45.9149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tjh0GFzpkODoMOGH1wjhPieIVobHz1CSIMA8pYLWEGjEA6e/AgfOVPJPYE2UjD/6VJAQlE5VFGM+EInSHMuNLZeofuAV0q7jcg3rTBpoCoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2702
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-02-25 8:17 PM, Pierre-Louis Bossart wrote:
> On 2/7/22 07:25, Cezary Rojewski wrote:
>> AVS topology is split into two major parts: dictionaries - found within
>> ASoC topology manifest - and path templates - found within DAPM widget
>> private data.
> 
> Well, one would hope that the path templates are initially represented
> in the topology and set when parsing the topology.
> 
> If not, who defines that those 'path templates' are?
> 
> It's also unclear which 'DAPM widget' you are referring to?

Just like skylake-driver, avs-driver has several dictionaries which 
provide a list of primitive elements each (e.g. module configs) so the 
more 'advanced' structures such as struct avs_tplg_path_template can 
refer to them later.

Yes, path templates are represented in the topology file and are set to 
instance of struct avs_tplg_path_template each when the file is being 
parsed.

DAPM widget - widget which represents either FE or BE path.

>> +static int avs_route_load(struct snd_soc_component *comp, int index,
>> +			  struct snd_soc_dapm_route *route)
> 
> I have to ask: what is the difference between stream, path, path
> template, route?

That's a ->route_load() topology operation. So, the route in known 
upfront from ASoC topology documentation.

All others were already explained earlier in the series as it's not the 
first time question is being asked. Trying to keep the number of 
'threads' in check so it's easier to follow.

>> +{
>> +	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
>> +	size_t len = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
>> +	char buf[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
>> +	u32 port;
>> +
>> +	/* See parse_link_formatted_string() for dynamic naming when(s). */
>> +	if (hweight_long(mach->link_mask) == 1) {
>> +		port = __ffs(mach->link_mask);
>> +
>> +		snprintf(buf, len, route->source, port);
>> +		strncpy((char *)route->source, buf, len);
>> +		snprintf(buf, len, route->sink, port);
>> +		strncpy((char *)route->sink, buf, len);
>> +		if (route->control) {
>> +			snprintf(buf, len, route->control, port);
>> +			strncpy((char *)route->control, buf, len);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int avs_widget_load(struct snd_soc_component *comp, int index,
>> +			   struct snd_soc_dapm_widget *w,
>> +			   struct snd_soc_tplg_dapm_widget *dw)
>> +{
>> +	struct snd_soc_acpi_mach *mach;
>> +	struct avs_tplg_path_template *template;
>> +	struct avs_soc_component *acomp = to_avs_soc_component(comp);
>> +	struct avs_tplg *tplg;
>> +
>> +	if (!le32_to_cpu(dw->priv.size))
>> +		return 0;
>> +
>> +	tplg = acomp->tplg;
>> +	mach = dev_get_platdata(comp->card->dev);
>> +
>> +	/* See parse_link_formatted_string() for dynamic naming when(s). */
>> +	if (hweight_long(mach->link_mask) == 1) {
>> +		kfree(w->name);
>> +		/* ->name is freed later by soc_tplg_dapm_widget_create() */
> 
> ->name? missing something here
> w->name?

Ack, thanks!

>> +		w->name = kasprintf(GFP_KERNEL, dw->name, __ffs(mach->link_mask));
>> +		if (!w->name)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	template = avs_tplg_path_template_create(comp, tplg, dw->priv.array,
>> +						 le32_to_cpu(dw->priv.size));
>> +	if (IS_ERR(template)) {
>> +		dev_err(comp->dev, "widget %s load failed: %ld\n", dw->name,
>> +			PTR_ERR(template));
>> +		return PTR_ERR(template);
>> +	}
>> +
>> +	w->priv = template; /* link path information to widget */
>> +	list_add_tail(&template->node, &tplg->path_tmpl_list);
>> +	return 0;
>> +}
>> +
>> +static int avs_dai_load(struct snd_soc_component *comp, int index,
>> +			struct snd_soc_dai_driver *dai_drv, struct snd_soc_tplg_pcm *pcm,
>> +			struct snd_soc_dai *dai)
>> +{
>> +	if (pcm)
>> +		dai_drv->ops = &avs_dai_fe_ops;
>> +	return 0;
>> +}
>> +
>> +static int avs_link_load(struct snd_soc_component *comp, int index, struct snd_soc_dai_link *link,
>> +			 struct snd_soc_tplg_link_config *cfg)
>> +{
>> +	/* Stream control handled by IPCs. */
>> +	link->nonatomic = true;
> 
> if this routine also takes care of BE dailinks, then it's not quite
> correct to set nonatomic here.
> 
> Should this be set only within the test below?

Hmm.. You're right, there are just FE links being loaded here. Guess 
this one should be moved into the if-statement below.

>> +
>> +	if (!link->no_pcm) {
>> +		/* Open LINK (BE) pipes last and close them first to prevent xruns. */
>> +		link->trigger[0] = SND_SOC_DPCM_TRIGGER_PRE;
>> +		link->trigger[1] = SND_SOC_DPCM_TRIGGER_PRE;
>> +	}
>> +
>> +	return 0;
>> +}
> 
