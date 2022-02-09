Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8D04AEF6F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 11:39:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A4B7186E;
	Wed,  9 Feb 2022 11:39:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A4B7186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644403195;
	bh=LlRAxFngmdSqQEvU8ybYgHsAW8UZe6m5Tw0wb25sJE8=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tyhajjr0MWOhNz7LmhcPiJG59xbh+/UxqpLr6PT4nfSvSgkzav+bx0RjUnsJp7LUv
	 MWCDiKNZ+9QfWRegY60YFnn0wxdOzlusfauc4St50J7K6ZHd++CU5hLxIobbitkWTG
	 tLF0d0y0v/OMBWizQAspstgNpg3ZVaND3kNJJXms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92B5DF8016B;
	Wed,  9 Feb 2022 11:38:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB171F8016A; Wed,  9 Feb 2022 11:38:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96C0DF800A7
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 11:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C0DF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TAqQGusS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644403123; x=1675939123;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LlRAxFngmdSqQEvU8ybYgHsAW8UZe6m5Tw0wb25sJE8=;
 b=TAqQGusSbNbU4CXu3wDuJ5veSg/mDjciQwmcPX3mW+A4FU+17C9lMhuJ
 RK56IeQwazuon/x1ThsMibPlUUQY9esntkHDMVd0LL8k3aMa36UE09ZO9
 w3XaK/vK0I/z5nZmDb+eqcQgvIia7jsgvCMe3qlKA1hsdUYiybNv3xtlc
 uvWpu9taFDehrKhZpEArHgYioxbV7q7fGao0g1M3NQTcVk6eN7WfSDVWq
 5llKgJrxNC3SgbNOg2c+AYG6PNpNwUBTknhbdBBLmW6ZEBoWw3v14UZQr
 BDBqp3DzMJ1+ZDKkhwWH+ygN9MsrVVlEwgQYxEG67bVDVF7OJAmkd/keT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="335578686"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="335578686"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 02:38:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="771304988"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 09 Feb 2022 02:38:38 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 02:38:37 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 02:38:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 9 Feb 2022 02:38:37 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 9 Feb 2022 02:38:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5KJY7yWvyyiVRuHBKhUw1p9AqQRmO7E4UWGhOqfjKpiZvI9xVDLi8DKiGwzRYuMMhmUqC67RaZUvDeE76BXiyQ3hkDlJIqJEvXsLBwFqY75sZVZV4XP3yM0+tS7X1jHCAaVOwG9Iyjzt4QiAS8jkZYupWX/okyCX3m42a3KkmxZZTPYkqozDCfHwja5/zLAfJzEBAoJqaqgEX9a+E/5s57gz2CsnpZhU8SX0c5kngZjwLkPai8nVdIsfJK6FSj7lR2oX+geD5g0Oj+udDrd1yuxeInF5Udx8yxYJCL4b6p1cT8TpB0AwIFuqEcdkbzgmDDqiGj1D+whzZMa//5gow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPsWZzbkn5h/cpOAhnARvELji+08SBwl+VtmiC7rNwg=;
 b=PDDwetCvcE11K18icf/cpm913VLtKNreA8RHs9PSHVqtAOeHCq76GobBPUAahLRsnQKMnJBFC9qB984bv8B6bSV+ucgIcSUD3IQV9xPqJNiHy76xXw4ezttE2vsgvbP7WomumeALjNGUAiWYqDqJ58yBYMfdIJEw6Cd+Wjr7WNOYGWrV7PwXkIwe80kL1l4lVsycWkOPhWsgOHG7hFvlKlpyQEAw2BaQPVZyoy8WkooqdW9YNIZMm88wj2mnmWVLPqDv9qrm9aoxxHoxTkE3GPmRn2H8iSZseopZmL3rSmUutX9t7Q6xhqzpLYzXs3MBKuNjRmQbrpfXfjMOgyJWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MWHPR11MB0014.namprd11.prod.outlook.com
 (2603:10b6:301:64::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 10:38:30 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 10:38:30 +0000
Message-ID: <397ec3b5-c54c-5b7b-22b1-e34e3afc0943@intel.com>
Date: Wed, 9 Feb 2022 11:38:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Takashi Iwai <tiwai@suse.de>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <20220207114906.3759800-4-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
 <c144c67d-e6a8-1baa-82e8-37065c053919@intel.com>
 <s5hiltpqo0n.wl-tiwai@suse.de>
 <14d6492c-ad72-772c-55ed-2e5d51f3cbdc@intel.com>
In-Reply-To: <14d6492c-ad72-772c-55ed-2e5d51f3cbdc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::21) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcaac893-d439-4f81-ca5b-08d9ebb85067
X-MS-TrafficTypeDiagnostic: MWHPR11MB0014:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB0014FE29AD529B65A5093F3AE32E9@MWHPR11MB0014.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZczQ2OLJMDrw440UnO5R9MXpffPGpy5vqWj4eLrhsBtN2QNWQJMwogO6G588QMwF+Unr9jaMOpj1dbpAk5TfhOvo3sVjgZ+2MwDW9viD9UnPqg2xmo9kwUMnf1Nh09XSJRTbFOquZpANNb2nCBpq05NnHsA9ZFZHOSWj6HtneVj84p3BW/UB9Zol7yzhkP3SNSiZEJeJYVQQq+5wq2DbmdIxAA9Zs5bZPCRm4hp4AWpD4tf5sQMXtaLhMkV7Z2P9ecgrI3L3x1xNR4EuJaYyJMTMBLwbh+VJh6s0+RLZPJI0Wg25uHqZDX6qdM7G9l+glojWePSq5e4ICxTewrXXIYzC//GjjyKJQowFKUvT+7a64cVwk9BFFXmdQ5F4SP1hU6gkmN2ROjeAOJvXTDE0/FRSzuPrKBsKUNv4Ea8Xo3ldLQ/LP3WJunMRhrn7HO0Dky/4OoAemaZ2CTu2iH/K06fZub9x6ek4mB6m47hDQypU8vvp7DmV94zNx+abR+lvQhU2X/u3zJITmdrIf5hZ1Z3JB2utfSZfzmoPP1GrAIZjQTsk4docWroFSxFswWOkDKvo/rEDc20s6E3PL+iAlbXn6RIoGhUumY7SYL8WAoPfksQdltgVGPbtYHNuVTqX4+ENM1g0eRQ2EsIVQUCxI4RABwmEli8YUXqAZZia06I/uFspA2fMSyqoISYP5q3FU3Xeq50g5G2yCupOsEqJe04PsyLfprq9ra+ED+FcRo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(86362001)(53546011)(6506007)(4326008)(82960400001)(316002)(31696002)(15650500001)(8676002)(44832011)(5660300002)(38100700002)(2906002)(36756003)(83380400001)(66946007)(66476007)(66556008)(6916009)(31686004)(26005)(7416002)(2616005)(6666004)(508600001)(6486002)(4744005)(186003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEFrcGF4cFE4dmJldkhiR1RYOUtrOUpuZjZRVC9vSzZYeUVIMXdGbmUzbkM0?=
 =?utf-8?B?RWN0WGJoOHJsU0g2RTIxV3lINFlOQ05sZFVjQ3IwblBudDE4c1NQejgwQnhS?=
 =?utf-8?B?RWlNMVF2QU0za0hZemVLa3BPa29BWXpoRHNWSGxQYk4zUmtUOVpUbEx6Qkg5?=
 =?utf-8?B?L1NnMGUzS2IrSS9ZeVNHT3hKaG1PeGs5L3puTXFVbXlCTGFnUzdZTFVhUkVI?=
 =?utf-8?B?ZTdmQjhiNFNCeXRxOW1rbWYvaThBcmpNWkZQR3RoWGQxZGh5MklReGpkM3FL?=
 =?utf-8?B?SndLQXRzQzhjQlJGUWtna1NPY1YzYmdwclR1aHVOUDBXbGkvM1FvS0JrU0lT?=
 =?utf-8?B?MGRkL3ZjNWxrRFFXK1oyYndVUTBIVEJpVE5aS3l4OGVEditZRW1FUnNnN1JQ?=
 =?utf-8?B?OVdrN1JVeW02R3Z5S243TjFhUHV5bWVkcWlmNHF2YkNINWM2Z2dzWG1PVDBj?=
 =?utf-8?B?b3NsTDZkRzJ6L0xDUnhCazhiYmdRZWxoWndPWUp6L0ZMMXBwcEdXSU1TZld2?=
 =?utf-8?B?aXB0L3RVTVNEKzFSUkF6aEVxNWpyNTA0TGZXM0Q3UitsUTJGMWJaYUVHQ1dS?=
 =?utf-8?B?SnNDYXY2N0pmNkx1aXNYVXoxL3BwUlFZWnNSYXpnYlRwOU9oN0ZWTjE1MVQ1?=
 =?utf-8?B?V1pRN0t6RVhwemFxS2JHdzMwOUc4VDlUNXJNVi94QU04N0xpNWVPWjVOSG4y?=
 =?utf-8?B?TVBuSVVidWVYS2c0cmZMYzJsSnFIUnl4bHJOZlNkWkdhb29rcktyNjRVWVNv?=
 =?utf-8?B?VWRMUkV2bW5QRkp1NHBWSkJqSkJ5ZFFlNFVKc3ZWVHdLWkg3Sk9TNmZvSWdC?=
 =?utf-8?B?ZWxkMzVwdXY4TzExK1p1d3V3aVpPZUIwaUtsWFVvWUdWMUJjdkhFWllYNVJl?=
 =?utf-8?B?ZjY5ZWd5VVBrbk8vRHZ2RXBub2RKYTl4ZmFwblBmNXArTjF1SStodXdudE41?=
 =?utf-8?B?czRzaUpkaXJUN05DZ1RLOW1YL25VcmRjNXIyWjl2Rkdhd25CZjZOQ1VUWDRm?=
 =?utf-8?B?MGxwRzJBRktucVgzNEV1M0xnS0pKRUJPQ0hrOG5wOW5VK0VUS0xta0ZJTVpi?=
 =?utf-8?B?bDR2TzJvZ1pVUGtVVGExSWdzUXVRMlJ5eDc3RVQ4UE1qbU1pQWQvbUd1NUxF?=
 =?utf-8?B?QVd5dmc4OXYzd1NWLzYzZGFXbVhUUWNyYmVUaGdJR1ZkNFNHeEdnWVc4TTc0?=
 =?utf-8?B?S01EMjY3QzkweHk5ZGl0aElzdERPMEpwV2pXQmhQMGx1L3lGS3M2bWZkU3lU?=
 =?utf-8?B?Z29sdnErOUFpbFZ2ZDNKRGpsNHB2QU52QXkzWjN4bEpnK3VNYXdycFpVKzFK?=
 =?utf-8?B?NWQ0eXRGTmd2cDRoakRBMjZjdHFObmVHenh2THJmWFVEaDJERGpaN2lvSmp1?=
 =?utf-8?B?R0syV1ZCNW9ocVBSQ2g4V0pNOW1sYUQyYVlsVVVpOHFNVzJHeGcrRWVvQUJ4?=
 =?utf-8?B?K0pWVzVrV0NJYXFaVlI0bEtMdmEzYmpmNXVXRkM2ZUFReVFMS0E1bURnZzlp?=
 =?utf-8?B?SEZ4Zy91L2FPdzFTOUMxQnNtaVVHRmQ1VVVFcytPbG43TE9UYXNuZlpIQXd0?=
 =?utf-8?B?VjM1UFRFN2R5Y0ViV1VIcVp3VWNxamJYUWFGSEpuQ3hjUysvUUNMQVZSZWt6?=
 =?utf-8?B?WTdublAzVUNSMVRMRXRYdW9RN29XdnBJNksxcXpCRVJ1bjVjNlBUdkhxZ1Vi?=
 =?utf-8?B?YnM0eXh5bEhDS2JpMUZ4N0pvbzdCYTJHc2x1OGFrZjlER3VqUUZGK0xiNXkw?=
 =?utf-8?B?eTNubVhPQzhDZzJHZWw0czlYMTUrbE9SUi8xU2RNWW1nV1plSG03Sjd1bmtW?=
 =?utf-8?B?Q2R0ZXFNWlZ3bjZDbW9DZlJpVWdYT2tiVDBMVlQzb2NEenhTZ00rMDdUYzB2?=
 =?utf-8?B?d0hNVndKN2UwaUltcGRZOEJ0bzNkd3JvTDlOaW9CTEVLaEtCUTN0bUNHNmIr?=
 =?utf-8?B?amNEeEd4alk2UW5KdnJxRWxGakY4K0U0Q3dta0NsdGE3OEUwSWNlOVNuSGFw?=
 =?utf-8?B?RTBHVmsyWGxiZDFrZ2szTmExZjdkdDJaUXFWdytNWkVSTUlSQjY0SnEzZjFY?=
 =?utf-8?B?ZlZDL3dsU2NvckZ0Yi9jTCtWSFV1bkMrWW9rRE52ak5EcGxUREhPN2syL0lW?=
 =?utf-8?B?d0I0NWU1b0hNR2VlSWlHbnpqUVNBc1VEWWRqY1JFRzVFZDNqeldHczU5SHpI?=
 =?utf-8?B?M1QxYXRGUThDaE1xNndXeWhBazVPemh2b0NFKzAydVlEYXc5YzFsTnNZWmdO?=
 =?utf-8?Q?LVsBdETOGjqyFL4AJ81PZz5gfmDYphfOVDPXhwQDzE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcaac893-d439-4f81-ca5b-08d9ebb85067
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 10:38:30.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fR5svUNB6IPZ4dC8pArj6YPh5ZQob1IWbOcN6kWM9H92JUb2qj+8IpjrTZ1d6jLzc73llvWh7dXOiPjwT2rVCM4ENl+UPUX0Fu9Mp/TpAIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0014
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, harshapriya.n@intel.com,
 rad@semihalf.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org, cujomalainey@chromium.org,
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

On 2022-02-09 11:21 AM, Cezary Rojewski wrote:
> snd_soc_bind_card() invokes snd_card_register() which in consequence 
> leads to snd_device_register_all() and that to automatic ->dev_register 
> call. That call involves PM operations, and at that moment, codec is not 
> ready for it.
By that I mean: bus driver (here, avs-driver) has some saying on the PM 
matter too e.g.: sets their (codecs) status to suspended via 
pm_runtime_set_suspended() so the bus runtime suspend is not blocked by 
codecs that could possibly never complete their probing.


Regards,
Czarek
