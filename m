Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD6251064D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A469C18A5;
	Tue, 26 Apr 2022 20:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A469C18A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650996526;
	bh=+6eDRZEo90w0e0rNOI5sZXJ/T86sdB56oWHSAMR/H6U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gkp9JuTlsrx+slXNnXYC4KK5K5EDAxrnu3XWwC85N18bhMSE/Au0cV8rHv7U8IHL5
	 NRFuvnsGr9eJLHNdfZywtOOeENlX1SmicHkkcj7yG10GlryOgUfFAX8tU1RsZZKaS9
	 nHmAw45tsCNr1RdJRYJKta0V9sAfOnd6dRl8QZ7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DDBFF800AE;
	Tue, 26 Apr 2022 20:07:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A2F5F80152; Tue, 26 Apr 2022 20:07:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FE29F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FE29F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D7EUSSB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650996464; x=1682532464;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+6eDRZEo90w0e0rNOI5sZXJ/T86sdB56oWHSAMR/H6U=;
 b=D7EUSSB70ERTdX+zsv/rpxIODAwpU4mvEv35y2Mt5zYKNTpB4CzMJ/YJ
 KVSsHnY2XdYXIBuKscVqUHws1xoSR9as9C5jaRGIxk15IRwxGWlRv1eW7
 RFLOeCO225MhmPuUXfib4D60rIt0nxWPnQtbXZeFvoS13zOVyLtE2yF3r
 AWq0ho/cRzykP0YjpqbsTeYWeFoCYMxXl+Clnc3U4ANMaBcrvOVptSAWi
 3Jiii5XqzcZbX+0fkJqLW+NBNRb9fJX7vx+NeGdiRK+UFKZdrBgEKXWZG
 MMWudLT096+JKoFnTiWB4RjZs03c9ISr/zG7hf9x3MLQ8KWsnWCVjbcFp g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326166562"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326166562"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="617122428"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2022 11:07:33 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 11:07:33 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 11:07:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 11:07:32 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 11:07:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COdIFUlf3PBOC1IKlfwHWNoJsNJzkC4UusT7rJdR6drtN4vNgP34C8Wc2/XzPbvTGwM8QIly3J0JApPxV4w9DgQFq2VJOl2CJ9qZ69TbVa0Ri/MJUrtTxxMDA2RmvyHeIfbQeZBow5MKvnOp94e9LVDVyXWMTlmeIBPfp1vcLu6FKjTz0IP+Z2NpVABj1Te3gRClm45ccLky0HtWIJbgNoMgFN6hzADmTnW7IU+cVDoQUKMmmZkGdc74zCg8MdUWllGGH+Rln/zSjYLDEgtATuHIdeWSt7VWaspEqa+J88mctPqDtws/e1lnKFeu6DPx/5Om7uCaTUnd7PDyMh072w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWM5gbWZf67T2ceb3U/hmuS2ijXut9VkhDx1Hsw6dMA=;
 b=T1VhTCZPNDsl6UC2aVXX2ruHxFTra91rMtvHHt8JOmO493Yso0BbhY+b+8BxYFv3+oWgwyil3GN33VCYIwsp3mYpvdVLqwifAFJbMBpBLQ00ihC8xUNmXunvymwdwNDZDiUfZjoB6fZXUHdjFOgkyI9C04EwdWFO/BVlkaL26D9ZRBzbEQm8A5lc78LHJqUSzlqrYs+d0RR4O8GLvciHipaZoejsMwYlLLj1D6r09We3utevM2LBGp0JXCzjjvyEQJ3/jZHLN8AaGZ8ppMq5jXBuamuNWNfTSasL8Vr0SpHiqhPhaWeJu/ljc5zNfL8WdA/lbP5fZqFfhuzqcDXQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SA2PR11MB4827.namprd11.prod.outlook.com
 (2603:10b6:806:11f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 18:07:31 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.021; Tue, 26 Apr
 2022 18:07:31 +0000
Message-ID: <726c58e5-241d-053f-8b4c-d56a5a228f0f@intel.com>
Date: Tue, 26 Apr 2022 20:07:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: Intel: avs: Depend on CONFIG_ACPI
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
References: <20220426115454.685787-1-amadeuszx.slawinski@linux.intel.com>
 <eab567f0-73a4-bf23-76bf-8d576fa942f0@linux.intel.com>
 <YmgnE/HKNmI+agNs@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YmgnE/HKNmI+agNs@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0343.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::19) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28782ae7-04aa-4435-66b1-08da27afa191
X-MS-TrafficTypeDiagnostic: SA2PR11MB4827:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SA2PR11MB4827108A5D4D8DDF7E8158B6E3FB9@SA2PR11MB4827.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /QaADkGDWPQmYb+m5nuBLNUFozt4128O759iBGRj+6ahVFM4wBS4CEobXTD9Xr30I3JVArSMqyQXQOPrr8qdtJ5TzvF+DUK5ghpQSf5rr4MlEKF+JMqLsGoTB8QW9SAixq/4+GBXFoTh5UueLBGwqWhbV4AQ8PqWQ4JP6up3JK3/ncI7HWAkHHoTqCryVTfFFGp01Odi40kxH/387A42chD1jK5n9EZieWjzdpwwUttGK3eVsEhlIoA17OjefL3c0e8YCLOjvRYRIqZRARJMtbzCbBz6M4eYgmGps9GgxYdJDPHaZVI7WOBqOktFzyk3AyqI3/i3II0kAUQ8yuCtuR/L1BHaoHW1te5LFthEWvQEHcTqFsoICG6Rfw81nPXpZo0ruPrpEu1zpSZwu7BEYziODNljVRH1x9qy8thtkL0nlpGoYL6Rd/hDVMRs3xhGh6pYm4WzZPCHXKS7jQ8RCUO5YBQg6Tbwm+KfRT68IE9EjSX8oI48vayk/VS/amdPDSzgGPuNvgmO6DW2G92Ss7oeRrHckEXpwe2B8NexkCdTA9PXAEP5rdGr9P9i0Jj7E3AG5z1LND16F6Ay7pyiOjMtba+9cgZBPXrYTeMoLEh54rDk3MvFHoDS0k5JItcWYDOgOC3lpAVQ6Jnbqo/P0bBMbdqEmLb/jMiCF0iB0o2HRFN5YXNNTx0S6zxbEzL6jmjPx1bdFzI0L0/ZVBFBaLgVTCndze60+KXONQ9WLNUAVQN5FLbS7Yklh+72Gc5D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(2906002)(44832011)(508600001)(5660300002)(53546011)(82960400001)(38100700002)(6486002)(8936002)(110136005)(54906003)(66476007)(4744005)(66556008)(31686004)(316002)(36756003)(2616005)(186003)(31696002)(86362001)(6666004)(6506007)(26005)(6512007)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG9TdG1OM1kySnJLTHdFT0x1ZmUzNE50NTE3SUtiSnBuVTdiUmx2alU2TGxi?=
 =?utf-8?B?NXhHblc4U0RQUC9nRWJaQXA0WFdJempYMlpxTjJMUStEZmtOMDV4NVdGbmJl?=
 =?utf-8?B?M3NuMEZPaEQ3cHp2REZzQzVOaVJJSUszWjQwUWtDeUtTeTFBMFUyRlhCSVgy?=
 =?utf-8?B?SWY2UlpJZ2hScUJkZU56VE8rckxveWpqR3B0NWFkekQyRXhIYkVZYzQxanZC?=
 =?utf-8?B?QnAwU1E4azF3dWtxUy9uQ1hRQ09ER0tjMG10OVE4RkFZWDdqalBubGU4WWln?=
 =?utf-8?B?ZTVNNUdzbkgxOG9OQi90TlNJT2lMRlFXbjRIaWFqcWcvZXhEYkdKUmo4SWJu?=
 =?utf-8?B?K1FqVWlVVWhvM3BXalZ1ZHRQdS8zQXNxWFhhN3RkcTZuL0ZkakZpd2FiM1dI?=
 =?utf-8?B?TGk5NDRRUHovM21jdFlxYWEzb2tFekZaRnhreWQxdFM0dmNHWG8vSERmOEwr?=
 =?utf-8?B?c25Bek4zZktYbUVrcTk4U1lBd21BRnZyenJ2NjdFZVo5R2gzU0JQTHNqVGhF?=
 =?utf-8?B?OXZiMDhUWm9Gcis5ZTJzMjkwWXB6QWJHK3RVbFFwbmtEVkR1U3lXbzlZWVIx?=
 =?utf-8?B?UTR0TXRvU3dhS2tyVFlBK3BwcGU1MW42eUlKaHJINUtOZFd6Wk1ab2JlRlBH?=
 =?utf-8?B?WWZjRU1pME16VURYc1hTOGl2R3ZlQ3lVVWNIS3dsVVNzSEtZQllzYTZxb2M0?=
 =?utf-8?B?aHhscnRWbGlXYXVvclVwVXJYZG05RE9KaTVzVldqa2Jmb3BCZmNwNmd0QUkx?=
 =?utf-8?B?TWMzeVNQQlQzQk5yN3M5UFFoS2NRZkZmUG9hOVJHbGxFWWU4amJTcU9NNFVp?=
 =?utf-8?B?eEdwdHBzckhUV0E0TE11SVJjNmc3OWswQmMxcTVrQkdOcWk3V1BFV25iVGhI?=
 =?utf-8?B?K2lRdEdwVndmYTRRWlYwMGdWbTRqYVBucVdvTDJGMjV0R3hjd2dMVExmNTd4?=
 =?utf-8?B?Tlp2aFdZS3NpSXRldzNFNVdkVGRxVlg5UGQyMDlQSTNJYUtWSTk2bjJGcEl2?=
 =?utf-8?B?NnFMaE9MYzJzeDZreStuVXdIeUJaU3hqUHJVdTU5dG5SRDFOVURzQXk0bXoz?=
 =?utf-8?B?RFlZWHBXQytCcW91RDlwSk5ZeDUzT3ROdXovcGJQQ3RQTmN4QU44YnAwMDk5?=
 =?utf-8?B?emoyWU4vVEtSU1JBTVBaVXZBcGQ3eXdtV2hDRGZjeEZZM0RLVXlTeXYzcFln?=
 =?utf-8?B?UEJYZDVob2RDTnlZcEZKR2NWTDJDTUpiYVpYVE11eWYxamJZaE5NK2VPRHhI?=
 =?utf-8?B?OHJlMERKQ2VtcklQL2NhZG1HVUh2bFVzY0E4c0h3U0U3MW1xajYyZ3ExTk9E?=
 =?utf-8?B?YnFhaWQ4TEJzM2MycWVyNFNYRDV6NlBJUk9Qemc0TjJmaWFQZzdBSVVtMGVK?=
 =?utf-8?B?YWxwcTNZMENMY1dGNk9ESWlUWTN0Vytua095NFVjeGJIdEZORlVDZGt4RFNT?=
 =?utf-8?B?VGY0cE1ZRXJZMEw2V0o5VFJ1bFZPbGZESFh4KzNseUFETUZKRXlKTHBqUGIy?=
 =?utf-8?B?RFI5RkRqOXoxY1M2VkxZZ3RSVDkva1FxQVhDVkhLS2Z2Wkwwb3ZUekRRbS9o?=
 =?utf-8?B?VCt2NGZYcm5lK0grTEJUeWxiNWZGWDVPM0VzUUtDaGw1elBZQjFOK0svU2kx?=
 =?utf-8?B?czJON1IrSjErVGRPU3JFMnZJdWozT1BmSUNHM3JVVkJKZUxRQXVqMW5DblNR?=
 =?utf-8?B?ZHByRjJIWFlxQUZoSzV4a2ZnMFFqalh1eE9kR1ZqZUJ1RnBZREhibkZwenk3?=
 =?utf-8?B?WTJ6UXZ0OHp3NzRLWStYYUE1MGlWaVE3VU1jb3V2ZVI0cktmYUVsQWUvK1Bz?=
 =?utf-8?B?dnh3cXdZSExUMS9DMk5IOW1jWTJMMVB2QUZsUW01WS9oNGwwMlBVaFJGVXRW?=
 =?utf-8?B?Q1V3bDA0bG9qcGtGN2VHTUt1QUtWc0d6OEk3Z2R6eTlubDA1d01xNFI3bExv?=
 =?utf-8?B?YUY3bXNkQ1J3a2VOQWE2NmcrQmxHekV3d0N3QVNXVDM0Rk8zMnNBLzZkUWdt?=
 =?utf-8?B?KzQrRWRGdk5kdENhUk5CUGhmTUtMSUVZZTVrQTh3Yk9pbDl2RFU1WW0wcCth?=
 =?utf-8?B?dWJqVWxJOGp5OGN2aXk4THFwS3ZjMStZcjBZZDNmS3BKUjl1ekk3aFRlVERI?=
 =?utf-8?B?Y0lZMXBKd3BjaVk3bmNsc2U5LzkwUVQwL09laklMWjNyRFgyOUhSTjZNQ3hm?=
 =?utf-8?B?MVF4enNYM0JhYUlXUUt2WVI1b0Z0S0M2V1Y5M0JlM0V4dDRSbHFTUlhCRzBo?=
 =?utf-8?B?SnBSN1FiY1VucW05dmNMaDhHazArL3VHQW84V3ZLZXVtWHNuTmxXYVRkdGRT?=
 =?utf-8?B?dmQ5OTFuSDRBMmgvcGUyR2RGUTVmQWlvVVVNS0hPclhVNUprNyszYkd3VXcx?=
 =?utf-8?Q?LuXWMrpalau1pMmQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28782ae7-04aa-4435-66b1-08da27afa191
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 18:07:31.2892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7ZVAhSy2IMeLGEMvnnZRFh76t1Ey6c/ONaurI+L12IGLoF8gF2F51upxCpDFpiHKDumwE5R6gxc1Nu/e+wXKGtyUGO+G8BRiXXoI20FalQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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

On 2022-04-26 7:08 PM, Mark Brown wrote:
> On Tue, Apr 26, 2022 at 08:33:57AM -0500, Pierre-Louis Bossart wrote:
>> On 4/26/22 06:54, Amadeusz Sławiński wrote:
> 
>>> -	depends on (X86 && ACPI) || COMPILE_TEST
>>> -	depends on PCI
>>> +	depends on X86 || COMPILE_TEST
>>> +	depends on PCI && ACPI
>>>   	depends on COMMON_CLK
>>>   	select SND_SOC_ACPI
> 
>> select SND_SOC_ACPI if ACPI should work, that's what we do for SOF.
> 
> That also looks sensible - it's probably good if both users do the same
> thing here so can someone send a patch for that please?  Sorry for not
> noticing that earlier Amadeusz.

Hello,

Would you like the change proposed by Pierre to be part of this patch or 
a separate one?

Also, I assume the above code does not change, just:
s/select SND_SOC_ACPI/select SND_SOC_ACPI if ACPI/

is applied on top of what's already in the patch. Is my deduction correct?

Regards,
Czarek
