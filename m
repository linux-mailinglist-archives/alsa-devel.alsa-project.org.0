Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C0F4BD8B1
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 10:52:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3C2614C;
	Mon, 21 Feb 2022 10:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3C2614C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645437172;
	bh=CR6QYN9TkzNf816vLzv27qt0cEA1rlvzLO2C2zRspcg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=US/WkyPVlEP6A2LkpRQSbFUdVvndSdmGj5HE5lgjnV1pE1e8S8/S7FBI/ZuS0FpSN
	 9MLelb7ISdyz7KrnQgzdWRwtdqmOUpkc05x+A8vDcKQSQxZrsrT3A4dndZ4SHWZzjG
	 z8ksKPbfFsn/dWgA6ksFIHbEBKKFLboxedIYMi0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0F38F80149;
	Mon, 21 Feb 2022 10:51:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90CC2F8013D; Mon, 21 Feb 2022 10:51:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9F9BF80118
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 10:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F9BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gOWCxcgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645437102; x=1676973102;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CR6QYN9TkzNf816vLzv27qt0cEA1rlvzLO2C2zRspcg=;
 b=gOWCxcgOsoG/3UYiwAp0yVZ+AITwKn6gHwmnxpZO67GGlSn8dCnsuvhn
 whcgMuB3myafsKUqykVtpCmHyDldycVOk3vV5zCnHv5jA8YUfipX9lP+t
 NGC0TR6ox0E9DPtbQ8oIFUTlbBf3GeQFjy42gYKP4yR9UoIp21Unp/vsC
 ADubCLtaGzmhFnFUv/+zsgolNxbVkDfJZNUqRGVGapmhv8+JlSMvi+qEk
 oCEtzvTCQPtBQ1N1HXQDrWHdsDx7BW0KsK5XCI1A4Cew8Pn/DL45PO0QP
 AJb55TZax3LsfbOazYrwXX7uLEy66Fjd8Fj/LB8kIrycSWX9IdYqnFQ0o w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="276068736"
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="276068736"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 01:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="636608579"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2022 01:51:37 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 21 Feb 2022 01:51:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 21 Feb 2022 01:51:36 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 21 Feb 2022 01:51:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9e20rovxmHxybVsJPbjMYPliR4ZAPWB4yCy/ZcpBlI+S2N1i/7mff3xq9SUv/yy9+BCm68HQG8i+OWg5YoNNfwViVpBRVuDm0zI1LveOAmGSjwL9y2Q4C3QEaCv3p0ObfdTS0GcDluDVbdKVcA5qnI66XmvsviBFOBg/2NHZnpZDpAB426x/xnL72G/Jtum8JjsZR0zES7hPMAuu4Bzhpqr2dkNhog1NXsD1dfJvY7PxosgHrpW2Ak5jfqpDBRw3s6+XjhGkDD5CnQFhDXX0XhWw/maaX/iRRtUqZgAfAdcp6suxd3VqHHxLd9hxGvgNxX1GTv0gl15os/s2r/QKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKU5DCpGH+y8BFqWnHqLmUAo4M4fIU6cGonk8NzlX+I=;
 b=XWwnWI/Wgop75ECGCInA8Uc19eZehhV0wJkv4pu51aMpLp8rRJCyK8S1hSSId7Sa5EosDWPJGwKmo5q2mk8SVNZGAIQT7VLDimnAjYvxw3eRU27GqPNdQ23wHePgaeH+KWYNAo65rCU/i+xagi2s54gHdbFsNTRQBYEphuua9r52qxN+lA5j39iJtlvAEFTdvyleCttL3z44UEaNZ5dFfRIAJcB3/sbXR/wolb7HlSCvCRBDqvvdr8SUAtlbIFtt0dbI5yyVsh/mR2vpFpB6GftNjf5t71lspdfjyz/eMdviBtpr7hgqSCFqtpX2Bvhw5vQP0wwnzxcete9dvfzj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BYAPR11MB2950.namprd11.prod.outlook.com
 (2603:10b6:a03:8f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Mon, 21 Feb
 2022 09:51:33 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 09:51:33 +0000
Message-ID: <daf5b3ae-18fb-2ab8-dd50-fc598c297b5b@intel.com>
Date: Mon, 21 Feb 2022 10:51:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/4] ALSA: hda: Expose codec organization functions
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>
References: <20220214101404.4074026-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220214101404.4074026-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0006.eurprd04.prod.outlook.com
 (2603:10a6:203:90::16) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 505a10c9-87e5-41af-2e60-08d9f51fbe2a
X-MS-TrafficTypeDiagnostic: BYAPR11MB2950:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB2950670B7E81C95A2039EAD3E33A9@BYAPR11MB2950.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pWurBEXu7CeJKIaeZ97ljDWeRKtqFwGRHTuc2pdyOr0mxsxlbY81xztDZxAtY300d5CCkGa8qiZIOIIM5kVFwhKrdua26nhi2gxQtdcAN3YubCF2QTayfiezxM8o/2zzjKe2o2/ahSNJWsFDetjvVWUffPkl+qdl56ul4yS601hZDjG6KzZHDBdGqW5QrKzTz8pEBzE0l0+ovVuElbEmC2qQyrbPIMV64t1NXaKtCijh34SLhaTnkJf++Lx5I3PDKV+5+bfl3Fy86+ZLcxDwrCs14zW9LTaTcWUWSEWLJOatl50qE51AJxTmjJtmeyMZwSB3rNHCL68gvL10CssZUivNzY9HPiEE90VDgTrAi66W3NQiXACHD8lxKcWGGZs8zx50bfr60p7PbrGOk3EZtuVSKO2cU1WCFltznsaHsMPHVTFipcOEqybuOseeUk0bRmsbckwoxvtf7eFyuW8a+6qUDEbwXMJ5wpwSbw2IovGI9Y4nXDLW1ZZdMzIpCngTtoohRR0MK2Jr5RtUUSs3mX8Rd4W87UGDIfYt5/kMXuRtpBJdsyPPAuCOdac4VoA+n2TJ+/2CD++HMb+2hBdKWxdPuA0qGHtR1S95S92T7Xx643pdeVjxtjRFYebRAlXHIl8fdhVhihnB7pDzaPVSjLvducYTz88msYoCvGHIU38rGVkzyurUZSzFLSMGQeNnaDLHM94oRj1o3oc0CC4j32fJ99olURv3YHEEPVLxCQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(82960400001)(38100700002)(31696002)(86362001)(53546011)(508600001)(66476007)(66946007)(2616005)(26005)(316002)(6486002)(6506007)(6666004)(6916009)(5660300002)(4326008)(66556008)(6512007)(8676002)(44832011)(8936002)(7416002)(83380400001)(186003)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qjl5bldWTXV4ZHdEM0lVclpRRVJvbDI5MXgvQU5OdUY0SVJjV0EzenN5ZDI3?=
 =?utf-8?B?RUpjTmZoSDNJZE4wR3VVQzhjSyt2ZU1PQnQyS083cFlxcy9ObCtEZ2FEZUxT?=
 =?utf-8?B?VUpiL0FKTFVhL3ZTY2Z0dmhtbkkwRGJoV3gvRFR0UXdOcjl3Qi9CQ3hsR2NH?=
 =?utf-8?B?TjQwV0N0NmlURkNlVEVrTEFGZVRkdGhOZjhJSGI3M3pBWTg1NCtiZ2dxTzNu?=
 =?utf-8?B?Ti9FK0xYeFQ2ZUVIRTgzVVdCWWxHOGw5V2QrS2ZvUWY0bFp6SWNRcDlwdkxV?=
 =?utf-8?B?TGlrby9tSmNwOXh1elJDbkc5UUZ5YlovdW1aZzFQTElMOUZJcDNOeWM2b1Rw?=
 =?utf-8?B?ejZ1eGlrdkZzUytkc2lTdU1oVnJtc0hOMm5MR3RLamo0Z0pDQW9JaXpFUC9S?=
 =?utf-8?B?ajROMnBPMEdINHJURXQxRFVMdjUyUFA4aEN2b3o4VWt2ZURWdG5uaS8ySUps?=
 =?utf-8?B?MVgyZW9wK3RBQWZSMHFnWnExN25GTDdwblAxR0l1ZE1pZ0NkcXZCK1ZPaWdz?=
 =?utf-8?B?dHROblg5RHlNckM1VWl6K3VKanJzVlNKck9ORWY3SDJhRGRQT25qeVN6a0ph?=
 =?utf-8?B?cjBPZXMzQWc3WVhMbUVoZXRpanRhaThzR3FXbXlOVjNoa3BNSWVIYnhYUEdU?=
 =?utf-8?B?WkFROS85OEFpUFJ1NkhaNGo4dE55SE1mUFlNOFI1MUU0Qml0czU5aHNUUi95?=
 =?utf-8?B?NHJLMFUvdTFtNVpwL0RRYWZBdGRIYzZJNis5d2JkcDljbEJKUGZsNFZiSU55?=
 =?utf-8?B?YzhBcVZxalZrOXNYV3k5bXhYeUdKeTVrd3Q1OGM5T0lZaGN4T2FaTkN6OVQ2?=
 =?utf-8?B?SEJ2Z2NmdWE0MGo5WVFiRlMvV21VODVqRXBlZFlKWFlDeTJ6eCsvUDZGWVBT?=
 =?utf-8?B?ZW9pa0hmVGhzTzFlL2ZkZWFUR3krb0lnYzUyNVdOSFV3bFNVSjF6RCt2dkRo?=
 =?utf-8?B?MjZBdzJFYWNuT05sY1JIOVpkcnR1T28zNTNjRStiMFd2WFNkV2dpRnJMRURU?=
 =?utf-8?B?azh6M1dveEhyaGF3ZXZwVHJ6cWlFbWU4bDFXdzFvT0NsbjlKblJFZlcrN3hK?=
 =?utf-8?B?QTVKYWl3TFgzYmtUd0g0dHhQa29sWkp0Tzcwc3dOb0J0VHJvVlltM1NQd3M5?=
 =?utf-8?B?RWw2NzR3Z2h0Q3NvNzVMYnlPS2wwV1hySFdzdXljWHFmSkpudG00NjMvRUVU?=
 =?utf-8?B?OXRVWlc3cmhmU3FPYU9PSjN4RHNZSjNnVDNLUnZWaXdSbzRQOTlWOE1rREhD?=
 =?utf-8?B?TVFCSXhqMCs1MGNNbVQvcGwzZktRMnZRYnVmTitMbXVPOFRnU3lENWxFYXBO?=
 =?utf-8?B?L1dwTG9RdENmcnlFTjE1Y0FRcHEzcG5zZGNZQ3VHc1ZXQ0w2OC9ESldnWkNI?=
 =?utf-8?B?aXFnMGNwcnlCb3pPR01LT3licExzTTU1Rk5ZRktyWXFuTlhxR3k3THhNL1Q2?=
 =?utf-8?B?a0ErUVlQcWM5Z1RUNmhoOUdYUXhBV1JsRXUwNmlhZDhlWGw2dHc3cExQcy9m?=
 =?utf-8?B?UVE3cnZVWE43R3g5SW1FMVpCNjhwWlo0TG5teUVhMnZBTVFjb3RWTUpyRDZR?=
 =?utf-8?B?RjBoL3Z2OUxJdlVBRVNRVEJIVGlza3MyY2Y1eGlxT0JZdlFadUdyYzRtNnA5?=
 =?utf-8?B?MThENU0raXRvTGs0bUl4dGd5cituaXVYVGFGK3FJMVFZZUdIREEwdk95c3E5?=
 =?utf-8?B?UzZpZ2pEQWVDNjhNNGlxMTFHRTNUVXUzOGN6WEFSNUxmK0dEblRaQVo2bXJE?=
 =?utf-8?B?T0FVbVFBYmNWL3FMaS9GaGsyTkhhc00wLytGYVRISVh2VkdpNHlvcHBSNVho?=
 =?utf-8?B?dVRPeEhnZ0ZvWjVRb1BldUlZWEhJNnVUOG5kYytLRGJMU1NqWEJNd284WC9m?=
 =?utf-8?B?TW5tR2VwMzdMYnhiUG1kWW4yb2QyaGljMU43VjRxZG5RNFVrRkZubEhmUEty?=
 =?utf-8?B?K0FnNEdQa3E5QTlRWDcvcmN6Z2NBSGdzTkN2SkhkaVpzYVY0SVZ0eGUzRUQ5?=
 =?utf-8?B?T1hDRXVsYWtyYWdXQjJXalB4ZU5DYXpmV2dXMURHY0hYbm0rRnZCOFRjYWZX?=
 =?utf-8?B?SWEvcnV3a0RJcTgxQ2lwREdCRnBhTnZ0SHhWSlhlbDNTdEhzNUxaOUVRcWVr?=
 =?utf-8?B?SVdCNW5lMmN3ejJ2ZEYyQTM3MXRhempCK2RBZ0x5VTFaMFptQVpPODdUYnps?=
 =?utf-8?B?eVFFdXVvYnUvaTdaVEpuelRoMCtPMHdncVFyS3M0bVJyc01jMXEvV3BLZXV2?=
 =?utf-8?B?djBtS05uOXZQZ2ZKQXp4a01wbGRRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 505a10c9-87e5-41af-2e60-08d9f51fbe2a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 09:51:33.5518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TDiKO2/oHqz032aEr6eQqwLbBzgpiINdue7S0k2NnJg+2Ay39mIbmLY8VjT9DQ3MucidCYo5izLnnHIrCmLKmATenvx2ZEWGK/D7vks2yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2950
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
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

On 2022-02-14 11:14 AM, Cezary Rojewski wrote:
> Changes expose several function that are currently unavailable for
> HDA-DSP drivers for use. Those functions are:
> 
> snd_hda_codec_cleanup_for_unbind()
> snd_hda_codec_set_power_save()
> snd_hda_codec_register()
> snd_hda_codec_unregister()
> snd_hda_codec_device_init()
> 
> This allows upcoming AVS driver [1] to re-use even mode of HDA related
> code that is currently available in sound/pci/hda and sound/hda and
> prevent any code duplication within avs-driver that would otherwise had
> to happen.
> 
> Last patch in the series provides snd_hdac_ext_bus_link_at() - a helper
> function which allows for retrieval of HDA segment (link) based on codec
> address directly. This is simpler than parsing codec-name first to
> extract the address what is the case for snd_hdac_ext_bus_get_link().
> The latter function is updated to re-use newly added one so core logic
> is not duplicated after the addition.
> 
> 
> Changes v1 -> v2:
> - snd_hda_codec_new() now calls snd_hda_codec_device_new() with
>    'snddev_managed' param set to 'true', reported by Kai

Hello Takashi,

Is there anything else I could help with or explain to help get this 
series merged?


Regards,
Czarek
