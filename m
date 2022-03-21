Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E34E2F6A
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 18:54:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927CE1750;
	Mon, 21 Mar 2022 18:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927CE1750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647885292;
	bh=tm6GzVaS+vOw/2VZstW5AtkZj9LjTbkCllIOBDIuRdA=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/ryyh+VS04X5yNYM1HOZbB4YQ5zJparR+QK2AsVz+h7QuSbzWSFSwZcr1Iz8orlp
	 Kp1JPd8VZq5qHtB9k4O/uw2vIfCa9QaOHB5tTXcC/uxN2lwMXy5HJRyAQI6Wvklb1k
	 Eq/HPuUEJO69mGzTWKy42yXHRikkgIDdQUXwqzWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31200F80238;
	Mon, 21 Mar 2022 18:53:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F559F80227; Mon, 21 Mar 2022 18:53:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 985E6F80116
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 18:53:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 985E6F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="M9knQy8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647885221; x=1679421221;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tm6GzVaS+vOw/2VZstW5AtkZj9LjTbkCllIOBDIuRdA=;
 b=M9knQy8gai2BoxV0aaaZJy3L2EO6YLZLCbk+cYy1plsUmjZLo4Bc9nlc
 7vyaJaOldks0BdotdMucokj/6IMBWl4lch82WbtL+hW3jaC8xEWlrYTjS
 f8uhJLpX892kWFc3BecP77fV0rxn4oUNUazjMstlirpPMJxa5gKTQdPYo
 dI82ABvYtnGIZ4H1Zr+lDd1Htxx1p4EynENd3vc7Rpt6VjRmSbqnVuq3a
 bnRkIsKzBA3X5OFpgzsxhx+idtHVrfcudu1e5oAcgPc4hMD9/JQgoNtYd
 vcQXXEpsAB8L2ktVqfh/8WJT8FJnkQYPypYg94gv6JU2fYduKVshx8RGh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="320818273"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="320818273"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 10:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="648654346"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 21 Mar 2022 10:53:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 21 Mar 2022 10:53:34 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 10:53:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 10:53:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 10:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXEBLYBQsPwZWTC1tPrNrKDJQGxgqI7jccAymIYZCdy31axdrwfPDZVKsemoiCq6IPlL/Gu9vbWUwPbBwiih0vk/AMkvQCeJTZ9yaXjxhLO5kbRBvqbo82POS/ooelJFsq/kHauTtHrEEbSG2mbM58Ut5Hew6CK2Xxa+Sop3VztNsy/wJNmFqYWC0wDzKB5wY38Vd5Q6883/+8hsYpKA2qEKDvETHmY78l7OL916Vmt1YzCGo4OJc1H8pQTKfkItWHdhcKnq1PujOZnvKdHU7aST//4PtXaZB0mgLRJtPh/pTfNi1UrMcEyLi0icD2Q0t8nHNxq/X2zYRpoEQViXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8liRYRuR31xfkSvaKrc/L6D5Kxfgav7XRj9atxQXSw=;
 b=OeIbtSn5YMm6PB+nOnhwUIuZfWxsUJYBCtfUmeAE+n7KBBetRcad97G8XaCzehL3fgxu5JGbNqzfqFAuYE9wTxv1AkdJ2ZwsNzodrCVJkINcouwXzHAv5C+wWSOB5M8XatLle8RjXnHZlS9B/4Dzk4g1yA4HP4IemOZfm+wH91aC3L5bD3NyzBjGAUNK4wqS8T9lIHTMeYhkgFpu7a9lpP4bBnPwjQrAg47mnNWWcwtdBq65a5UDYTSZtoYE50rcVvdU+YtpnatO7x2MdYxPoqQGyObuBhg/LwgJlaLxZuM2SM300hcT6KKjvdxzd6tDRG6JiVyOYliXTLsSRxjOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN7PR11MB2739.namprd11.prod.outlook.com
 (2603:10b6:406:a9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 17:53:32 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.022; Mon, 21 Mar
 2022 17:53:32 +0000
Message-ID: <a5185c3d-f672-672a-296f-58c6f7d667e2@intel.com>
Date: Mon, 21 Mar 2022 18:53:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 09/13] ASoC: Intel: avs: Path creation and freeing
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-10-cezary.rojewski@intel.com>
 <2b6bc0f7-1e04-77b3-95d2-ff561b006ccb@linux.intel.com>
 <29745cc1-5824-6eb4-4806-1ae134f14b01@intel.com>
In-Reply-To: <29745cc1-5824-6eb4-4806-1ae134f14b01@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4258b799-c650-4d6b-dbfc-08da0b63b6e8
X-MS-TrafficTypeDiagnostic: BN7PR11MB2739:EE_
X-Microsoft-Antispam-PRVS: <BN7PR11MB2739FA999D36FDE324804F9CE3169@BN7PR11MB2739.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZQo0sHjnLie3ONB9IcHElV//wK/slBzpROQcK93OfYPJfsWUZODQrJNAz3hgDElD95rI8LloiKTKqZR8qJbCgy7x1MvIp438r6Mkdo/Qzcw/cbIFiAeeauxZW0uw0calgfnDNdoDWJa4hUNM0t82wS0rR/xPNFpsDoahzPXYp2FsdxG0GUyWw89Pd1KPfo5oD8SRcVMFTdneUlL0RdjH12cARg/TkC+UHACKQw09PXmz6hApRg5TAYnvVvu5eSspiJ2j9igqEZrOYVnQZBGHGEy2jpOavxiCKV0YGLyAM7D9yIFW0+NzJH6EPtokKwMfVCGqj48760NOOYAiB3ApYHclXsDdpkhquOliFns4Jv/QVDjUnUSw7FQWSLBmDo4QmyTviLLWLYHopp/dPf+niMdKgZLwlDdNMAi3YB25kJC2jxHGQdGH1x4vEym1CH3mZ4O+WtBgYx6jEx6p0xV6wRIjarBMFtaWFo8dwRKWHLNBMiEKzYdWeVqKVvdxNfVXeySxvHEFNbY4wJvdCzOJ4Pk18P+YDrCP1C6Knm4y/W6ZjJyIMSlr+dOtWKRpV3Oxv+VULo8W1tJ6P5xR0QfEqupoAs1JswfFlwJjqbGPnxWPxOI/gn+rvvXfPta7Ed9CXnmG2X3xpWPRUoR68vH1Dz/nga4J3rpJYMgNXvyYKK4n3DmddYT1klAvfghHKLE8yz2rdMgc+ZoVJhuz0mVqIfoys3JOE7jTi8rTnLkV2PGwdqaGjd8Up2kJrY5yWcb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(2616005)(26005)(186003)(6512007)(38100700002)(83380400001)(31686004)(7416002)(5660300002)(36756003)(53546011)(44832011)(4744005)(31696002)(86362001)(2906002)(508600001)(6486002)(6666004)(6506007)(4326008)(8676002)(66476007)(66556008)(66946007)(316002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THd5UDRLRERMemsxd29WNmdkbmJYOHVDR2w3SVAxY01wMlJ6MjZxMTBZU3VN?=
 =?utf-8?B?MFRZTWQ3Z2FkL2RSYVlxYjFSK1hMaWdveERuelpta0hscGk4dVZxZGtUVXRo?=
 =?utf-8?B?by9Dd2N0WmdnRGdyNml4bzJLOUxGU1UxMTJyTjFRZTIzNWVhTFZFOXI5d3Q1?=
 =?utf-8?B?NzZ4VlN2L2ZYdlF3MXNrQWhPWXpVUUJXd0xWQmNTN0lxT2VGdXBUQXJTcEhF?=
 =?utf-8?B?dncxbm1UdU15TWRFSnJ1T0RZUUtoZFlNMWpYYWJoSTNEcWdhcTlDeDI2QVV6?=
 =?utf-8?B?VDVUK2ZRbzg1aW9GNi95Z2lINUo1SEhTcVdZd1poSkl5Tld3K1BQWjJ4ODFk?=
 =?utf-8?B?S2JKdWNxTzBrK0VYcy8zbGVvLzJpTXdJUXZaTDdQNzhCR1Rrc25yNUZqakxF?=
 =?utf-8?B?a05GSzJlZmR6TUdLRXVvSlVHS3VQNDZ1NmpaSnVSN1dRb3VISHo1U0ZoNkJT?=
 =?utf-8?B?ZGJPeEtZZ0xoU1Fka3EyQjVhQURMbDRiSWhLUUhHOEo2U1I1VnRhdGpDUGhj?=
 =?utf-8?B?MFpCT1N3SmlNV1NLNWdkU21xYVJsSmZabzkrY2I2bUVKVG95U0hVMjJyNENj?=
 =?utf-8?B?Q0FtcjZwY2RsODVRMUYzbW5xMElhL3NoNzY1ajRraFJKR1ByMlFPbS9rTFRu?=
 =?utf-8?B?Q1VUY0FoT0dXd1UvSDl4cHVQSGFSS2IrM1Jxa2haRlp5VDZnMW45LzBja0ov?=
 =?utf-8?B?aW4raDgzWVdIcWFvdGlwTDZiTDlMbnJwMWJoTjRwWXdDNWNNWFlnU2I2MEov?=
 =?utf-8?B?U2tsbmE4WXlkMG1KSEJnNlhDTnE2bmJlUU9RUndaamxaRGIyTCtQSU9ZYXhn?=
 =?utf-8?B?aGtURkpHQUZWZE1Yck5zRVNibUtXaitKRFgrRFBHYlYxbDVhdEpWNHQ5V1BT?=
 =?utf-8?B?VjJCZXF0UkZxL2ZuV3dlOFAwWW9IM29RTm9ROUJXZkpUczlwQ1huZFZsKy9y?=
 =?utf-8?B?VHJVd0s3YnpVMEpqR2R0SW16YklRd0NFRmJENG1sTVF2MnV1MzEvU2VRUDlu?=
 =?utf-8?B?WStNUnZnb2lMeWRUM1g4Qjlkb3NoeXgrQ2tEbjRDV0Z1M1dyZEhUL3R4WVBP?=
 =?utf-8?B?ZEhjVmxzSFZtWC9wR2I3bzBpYVlsVFZkYjVHektFRFllSW52aU4rNWVydkJp?=
 =?utf-8?B?dVltelp0UXV4NWlFNUhxaVhXT1dXa3NqMHpOb2VlSkRNeUV4QzNwaW5qeW1H?=
 =?utf-8?B?RUVwZlVvb0orVFNMZGhIck84MTBlK0lPcXBocEhRYWFMcnhnd2FDMGw5OGNM?=
 =?utf-8?B?b0xGU2g1c3JIdjhrVkhZQ2c2S2d6dEZRa1pFRC8zZXN1cXVCUHEvV1Jpb2VT?=
 =?utf-8?B?Y2RJeU5qMFdUeng3SXVXUGYxVDFWUGZkV0s1eWJIWHIyUTc2Nlh4RXB5VnA5?=
 =?utf-8?B?ajZCYklOQ2pab2JQY0RqMURWOXh1c0V3clFScEZsRU1EUXA4VWl4cm53TFQ4?=
 =?utf-8?B?TGlzUWdEb3Z0aEVQcE42SmUybjcydkIrZUU2Z2dxcGIrUzhsY3owRVlJbEpQ?=
 =?utf-8?B?UThULzRVRy8zRE1ya1RWY0I0c0MwMSs2UEloZDZnakRGRnV0MkVCbVB4Szk2?=
 =?utf-8?B?RzU5VUZtUW45WlVXVS91ZEVkWGF4NmxUbWRTOG10ZkhvbVFSTEhSZWIzMm1B?=
 =?utf-8?B?QUdVZTZMRENXYXVmYkZPSExsUGZXZ1JRUTRMMFdrc0xFWnVTdkVYeTRJcWxx?=
 =?utf-8?B?ZXhIRXdDeXhqdHk0NnN6WlJ4MlFjM09OT25JMDlUQnBiWnU5TDdBUk9wMHM3?=
 =?utf-8?B?WE02TVFOK3dFMndYYjdvdUZmdHRsUllVdFBlMmM5YkZiQWVtNEVxSGJZaGZa?=
 =?utf-8?B?OTk0VlgzSFB6c1BCU0VKQ1paMEVGWmNqaXNLdG5wdGRZUkNOU3M2ZStXSm1E?=
 =?utf-8?B?eldYZFpCcXBJcXkzU3FMb2NCU05RdVFOVjFaRU45ellFcnRiME9vKy9heHdO?=
 =?utf-8?B?TU1SOTRaeGV6aXcxV2RiaUszNGNZdldac09sNzZjeENDSTB3aGJERUV0SElP?=
 =?utf-8?B?MDR3VCtFMitRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4258b799-c650-4d6b-dbfc-08da0b63b6e8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 17:53:32.7696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCwV0/04RJU0P42JfSDqpAMXukDgn7DyiYR8KpKwUtoRQbKtH6bNPlQY/DykhM0ECibcpnhq+slhTitEDzX9B2fvqjOV/ugtVR9hCMZyH1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2739
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

On 2022-03-21 6:19 PM, Cezary Rojewski wrote:
> We need to take into account what's set on the codec side too, can't 
> just ignore it. Topology is written for concrete configuration, so we 
> can crease a file that supports all possible configurations exposed by 
> given codec.

By "Topology is written for concrete configuration" I meant 
platform-level configuration e.g.: Skylake with single rt286 codec in 
I2S mode.


Regards,
Czarek
