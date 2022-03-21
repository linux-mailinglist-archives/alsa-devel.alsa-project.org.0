Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA804E2DAE
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 17:16:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8B3170A;
	Mon, 21 Mar 2022 17:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8B3170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647879399;
	bh=llC7+D95+yUw2iSvf/E7t3pJARzDjSOC6NlOR85k3ys=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BaE2SYzOEuDsKZyIU74jB9C+aZQ+wXNfYKFvt3DPNMZZb+MJshWM1OQ+srIUkfAdz
	 HlHD31igFP80K8ie0+oQN92azUJDWDEo1iNgFprrGklMvo4VcmF5nnv7+pxgkVP+tI
	 5G9PWz4iJ6CdCv8McCpz3ypfwg3vAOH1WLCcz620=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39635F80238;
	Mon, 21 Mar 2022 17:15:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6546FF80227; Mon, 21 Mar 2022 17:15:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E18EDF80109
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 17:15:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E18EDF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="luJq9HgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647879328; x=1679415328;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=llC7+D95+yUw2iSvf/E7t3pJARzDjSOC6NlOR85k3ys=;
 b=luJq9HgOxTrW4PDg+36MG5zVFQx1GOuLVYFSs+j1kYZNasHTRCReT7L0
 wFuDoAYJTdYGaFIGk+uSFW6BCx2mN1Ej0b1/sN47vtqe638ewoWZP21eY
 oxyhA8a+UHuOR9vlI0XyD9u2JwJjLIsdCUfFKQ/vCCy0xmMfpb2VryxBl
 1V1GbarRcylE9ynJNreH6GT6tRvtpdKWMzmkC3fKlNtXwdocarp4fXLvi
 zWBZoyk45e7EiYjlXI1k5eAKmlLgXv1w7SlS/FGVyrxlqpNGjZ90TgOgm
 3coy37DREO6nj0MIIihRAZ9BITvZKehEuMQrCmdaQ/RY66ccyqZo2BBD0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="318300077"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="318300077"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 09:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="500223140"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 21 Mar 2022 09:15:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 09:15:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 21 Mar 2022 09:15:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 09:15:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4dV7u/vANHwwB/7AGO9br67fNQL1MALmBgXRFpAz8Ase6U/xo9D3VACcHx+CNYM8Hs6m6UtNs2f1/5eqFsF1NcfU5B8fQe2FbF6dogXq5a8l+E0Wry9MCMzVJVk55NCR9Vjy/QGmtU60G5ht+0djPgtOTOsmUEwncZrtH2YVFmUbl/RwwYMf/9DtmBwHbHvYS5lPyNGfyWLBoAOX9uZwmVUXjFZmnUE/dwasE3HmF5tpW9e0h31+TR22pkZ6XRq5vOGAiweemSQwhyMaS+F3gMk0rOaIA1kkbkfLX3rdcAPZuq1v7yKTAERm4MEr5G3pz3f2cuKfoVJ2bLDFVGm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je/TSiuYale8MYXrEFfGnV8eWgtydNm5p4t0kbM8w0g=;
 b=C9PaLp9SaEGUIiH9/saCzBalu+Dp9R30YLXkPAB4CGEw0CYybLn2WGqKwvYhWWXNwpyXH/AJm/wWSx1tdTXMmijuoyGQW1r7NwYq25dttahH6AI8dpgI9jRDx1jqsYeGuDszifTc3XrWdN3+9Ig2TuSGR14CYcZkSzjurZdYlTYnCBDsBLf5D1adGGr1jhBQefxajctFnYQNFIwnzNPe/d1feOAshHkts1XbGfFwHZgjIr8RFFEmWBMwoQr5tTVLyfPf0Vusw87Itp4D8C8DHWFFL2iGAIbEMU+BfeLuqiEb5SPZ9I5LgpneqTFJpW0qOYOVt7h9ZoOh0F0lhkhy5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SA1PR11MB5897.namprd11.prod.outlook.com
 (2603:10b6:806:228::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 16:15:17 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.022; Mon, 21 Mar
 2022 16:15:16 +0000
Message-ID: <4d351b6f-0e2e-727e-1384-e815e7af0abe@intel.com>
Date: Mon, 21 Mar 2022 17:15:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 06/13] ASoC: Intel: avs: Parse path and path templates tuples
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-7-cezary.rojewski@intel.com>
 <33814efe-010d-d9a0-dc3f-90b0cf5241ba@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <33814efe-010d-d9a0-dc3f-90b0cf5241ba@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0510.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::14) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1b1fbed-d5a6-4078-1718-08da0b55fcb0
X-MS-TrafficTypeDiagnostic: SA1PR11MB5897:EE_
X-Microsoft-Antispam-PRVS: <SA1PR11MB5897962F6C6E25A52C1FF7A5E3169@SA1PR11MB5897.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wm2o0dIw/9ITPyj8L3FJSKK0EC9cOc2wtR0FLZt5fQMVo4U5/Rqc+AzJS7+161aERZ9GXxVCgCMrs/OvNqd1ULj5Maovt/SoU2eW453Px3qFVHDQvwVd4GdFFsCLwRvjZYz6aUi8CkShMn2mtBpnBsorfUaFCMlr5zWw9KmODv0XH5y1qgh+zFg1cW9cH3Q/dTvFnhhaKVCz4EP7+NdiW/X2KYMbgMpiZhkjW6p/IP47O7vqCf/+GvFOwb5GVIpI7JFYY9skCpJMCsSe0o0y+L4YS2D4bx2qNFYqydZwlNkUhc8CNfWJZ3emUTJC2NTdg7DUaKTsUqrUbAa3LxWd4lx4gyYmyAjWigXH3SigWunKEahF4LRNbzAjuPYxLuLdlLMdpt7XERzv9zGfuIk10inDVx4kyjyxsqEGnfKl9ft1pQ05VqwoP70KOWQwLBp1UGvaztkp5kNPdZB5hN8nvEJrVacRbAtEKB1IDyfok/CQT+l78N1M309oJ4k1vrUEO4z0tzPomdLN+JDvXIosUwNKHH3iTAkMKW9cA7jeO2FDbM9oTEb+MO4YLUBUV5g7a2c3SZIh7r3Q5YnMHN7JO6UOfT6vCVoRRMXa/KSGnIsK/+1oup/1YjAYdg8f4mmGSiS9D4e/tpk9zaVrcASbGXdr7IGG6T/Ti0LoOFopyRbssTKxUDlPsuFMK0Kb9Bq8X3RJbIb1Cv0UuiX0y75WCuP/c9iUTPPvRbJuQ5zsJTGdr7nd674fLa78i+FdXtueHxQxLio+vewmlNyiDQ6XSBqfYdfvHNZ62Ti/OBI/W6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(508600001)(2906002)(8936002)(31696002)(4326008)(8676002)(66476007)(66556008)(66946007)(44832011)(316002)(6666004)(6486002)(6506007)(53546011)(6512007)(38100700002)(26005)(2616005)(82960400001)(186003)(83380400001)(7416002)(5660300002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUtrVFBuc2tvTVoyQWdUMi9pYXZwL2paMkVqRU5VcHJHbDBtNjdFb0RXaWRB?=
 =?utf-8?B?S3ZFZnBJU08yV01OQ1ZuUXZCSkZOejF6TWRwY1BGNDI1LzlhNk96OTJER2x4?=
 =?utf-8?B?SmxCTUVNbTZRSWFmWHBmcTAxSDZkY1p0R1JwNytZelJ2QkkwOFBBYld6TEZG?=
 =?utf-8?B?NzdhRU9qbDdSQnZndzRmckpwQnpDTEM3TFIya0xickdzSGdPcUNGdkZNbFB6?=
 =?utf-8?B?clZ1a0tMSDVOWFdTZmRHbytqWEZERmFRdlBuSTRSYzZBNThieThYVzFjcjVw?=
 =?utf-8?B?OHNyMld5Z2JJMm9mNlk4MmR5OHQ5QVNnSTdHRUorQUh2YnVzWGhRYnEyT1V1?=
 =?utf-8?B?aFp0a1dHSDFpRWJWS01NTE44SnFLOWg4eUNaaWUrS0pNdWpkTmU2dHZRNnk2?=
 =?utf-8?B?WHVYY1ZtOTRCbFQrREZoS21ydDduOWZ6RnhjUkNNbEtPd3hkSUdmRkZ4dXBW?=
 =?utf-8?B?ek4zZGJGdFhjV2NicGFlTDVPcVRKNDMzSUNyTlZONXIyekc2YTJRcS9TTURR?=
 =?utf-8?B?ejlGSUFWMU04eC9NTVVEVnV0KzRSRk5OS2FEeEozeFdBMkxORnFyTUV1dTQ2?=
 =?utf-8?B?bERvZjlpWlNXcWpKK01yM0hFV3B6UVp3ZW1sdkhqeTFsUnVkdzI4MW9qZGk3?=
 =?utf-8?B?UUNGR3diTTZCcnhRdnNyVUdjZmZFamRtVGNOdURoYjFkWm1lcWhEN1JuQjRi?=
 =?utf-8?B?RVByaWVUOTJFWTZRNWd1TUpoMzJKRGxvWFhqdmVpYklndU9Dd0FnZjlLclRZ?=
 =?utf-8?B?L2VpTEpyUmxjUWhpbEVSNk5XSXU4cWc0ejNPUDdDK3lsOVhTUVhKSEhqZXpH?=
 =?utf-8?B?TW81TnI2TGt2aTVGQyt4UDhoeVZEV0lrNlB5NTViazhRWmV6WHhZWHV1Q1dB?=
 =?utf-8?B?MVFnaWVIamMzTzFSTmNzd3BFUGVmenNzRTVrR1ZqNmRWQlVQT0JCeWhMTVlD?=
 =?utf-8?B?UU5lY0R2YVJzOFF0TkJYUjVtLzNBcnF1NkFpTTNqUXJPamI1bzdLVUVyNEhE?=
 =?utf-8?B?KzhSWXNpaFJYYnpEMUxmT1BhMHFzL01CRWVTdlc0V0QwUGdza3IyOHE3bVZ5?=
 =?utf-8?B?cENEZ1Jwc2V1MEYyV1ViaEk3WGpiaXNrU2Vpd1hicHJPaGkvVWFSYWxzT3JS?=
 =?utf-8?B?Mit1UTJNWm5ldithaFVzUzhHMk5hdVo1ei95LzZHaGhPd3BaT1BRVkNOazhP?=
 =?utf-8?B?TmZGYlZnWk5UYm8rejBUUzI5QUhZNUpiOFBqcG5tUHpkVjcwL3l1VCtHdTlt?=
 =?utf-8?B?WkF2QytoRFpraVFRNVhNSUorSm9SckFWbmUzek9LeUV1S1lwbEd4MlpZVTc5?=
 =?utf-8?B?bmJIWXRwdFd4UlE5ekZzZWt5SWl5L2Z0MnhveVdMZWJjcFVmSytUSDJFYmFO?=
 =?utf-8?B?WlN6T1dPa1g5NWVHeHNpOXlVRDRhSGtnTzNHL1piUkNTc0c2Z2gvR1F0eFNH?=
 =?utf-8?B?QTExbUxueEppK0JDKzUwSUpoa2RVNldMdUo5MUhFNVZrWjExaVRLcEZPL1hV?=
 =?utf-8?B?WE5XYSs2SWF6QlV5a1l6UWxGYksrdS8vaWNnbmYvMi9tZWZ0MS9BemdDRXJL?=
 =?utf-8?B?NlBqTk96RjRlRGErS3VyQi9aNnYwcUhRSk1YenloblBnNDl5TlU0M0xwaWhs?=
 =?utf-8?B?bFlWSWFVRVQvaVNSYUpZZW9FeWJoRE1BaHpLUmRuNFNvU2xaZStBRE52V3FG?=
 =?utf-8?B?enFaR0ttNnlKNVNCM0wrb3JtaTVJR1JnUm83eFBGZUhTZVZEWXZRYldUSDQ3?=
 =?utf-8?B?UXhqT2J4VFhucGUyeGFmUUVpOVdkdTJuSmRPVzV0Nll0SUo1RFZtRjBvbVQw?=
 =?utf-8?B?KzJiMHozQWs2eGpGQ3dlMnJPclZHWGNIMTh6Y25ld2pNTWpMVWtPRnloVzMz?=
 =?utf-8?B?a21pQS8vN2xEVEhuamRCUEpRNGR0Z1BLQVB5anRnWjBZV0tmYjN3WGduRlJk?=
 =?utf-8?B?NDUwdlNCcDFza242bU5ON0QrMHNTclRPMzNna1pialo4MG9zdE5ITzJ0RWxN?=
 =?utf-8?B?UFdKVUtwLzRBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b1fbed-d5a6-4078-1718-08da0b55fcb0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 16:15:16.8370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QSGLr5M57yKfPWtz6EP4EprWUPoUDDpoB5fR8tOIaJM9R2W6x/47fJJbZOPYRAwZN4bJV9UxlSIZp0ePr4H5i6rrVMYiUFaXrsugyRhfVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5897
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

On 2022-02-25 8:09 PM, Pierre-Louis Bossart wrote:
> On 2/7/22 07:25, Cezary Rojewski wrote:
>> Path template is a pattern like its name suggests. It is tied to DAPM
> 
> the name really doesn't suggest anything to me, and I have no idea what
> a 'pattern' represents for graph management.
> 
> You really ought to uplevel and expose the concepts earlier


Again, such 'concept' already exists in kernel since skylake-driver. 
Topology never matched runtime 1:1, you are going to have some kind of 
template or pattern that you later convert into actual runtime stream.

Please state what would you like to see here as nether the ASoC topology 
nor the "template/pattern" is new here and I'm having trouble 
understanding what's need to be added.

>> widget which represents a FE or a BE and is used during path
> 
> 'a widget which represents a FE or a BE'. I do not see a 1:1
> relationship between widget and FE/BE. these are different concepts/levels.


Huh? For skylake-driver you have a widget per module which together make 
FE or BE. We simplified this here as duplicating widgets for no reason 
is not good.

>> instantiation when substream is opened for streaming. It carries a range
>> of available variants - actual implementation of a runtime path on
>> AudioDSP side. Only one variant of given path template can be
>> instantiated at a time and selection is based off of audio format
>> provided from userspace and currently selected one on the codec.
> 
> well, the last part is the fundamental problem that I am trying to explain.
> 
> The codec rate is not necessarily fixed as you seem to assume. There are
> many cases where the codec rate can be changed depending on the audio
> format changes happening in the DSP.
> 
> It is an invalid assumption to assume the codec rate is selected
> arbitrarily. It's often the case but that's more of a DPCM limitation
> than a design guiding principle we should build on.

That case is perfectly fine and is supported by the topology implemented 
here. I don't understand what's the issue here. Perhaps something is not 
worded correctly in the description.

>> +static struct avs_tplg_path_template *
>> +avs_tplg_path_template_create(struct snd_soc_component *comp, struct avs_tplg *owner,
>> +			      struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
>> +{
>> +	struct avs_tplg_path_template *template;
>> +	int ret;
>> +
>> +	template = devm_kzalloc(comp->card->dev, sizeof(*template), GFP_KERNEL);
>> +	if (!template)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	template->owner = owner; /* Used when building sysfs hierarchy. */
> 
> sysfs is a showstopper if the intent is to let userspace modify the
> hierarchy.
> 
> Even for read-only information, it's not clear to me what application
> would ever read this information. debugfs seems more appropriate?
> 
> please clarify what the intended use might be.


I'll drop the 'owner' part and move it into a separate subject. The 
intent is not to modify the hierarchy, it's for having something to hook 
to to read info during runtime from DPS.

>> +	INIT_LIST_HEAD(&template->path_list);
>> +	INIT_LIST_HEAD(&template->node);
>> +
>> +	ret = parse_path_template(comp, tuples, block_size, template, path_tmpl_parsers,
>> +				  ARRAY_SIZE(path_tmpl_parsers), path_parsers,
>> +				  ARRAY_SIZE(path_parsers));
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return template;
>> +}
> 
>>   struct avs_tplg_path {
>>   	u32 id;
>> +
>> +	/* Path format requirements. */
>> +	struct avs_audio_format *fe_fmt;
>> +	struct avs_audio_format *be_fmt;
> 
> this doesn't seem quite right or assumes a very narrow set of DPCM uses.
> 
> First I am not sure why there is only one format possible on both FE and
> BE sides. If you have multiples paths to represent all possible
> combinations of FE and BE formats, then it will become really confusing
> really quickly.
> 
> This representation would also not scale if there are multiple FEs are
> connected to the same BE, or conversely one FE is connected to multiple
> BEs. It's also quite possible that the different BE and FE have
> different formats, e.g. you could mix 24 and 32 bit data.
> 
> In addition, it is a really bad assumption to think that the BE is
> independent of the FE. In cases where its format can be adjusted, we
> would want constraints to be identified and select the 'best' possible
> BE format.

struct avs_path_path_template can have a large list of struct 
avs_tplg_path defined, so it's not limited to one format. Remember that 
each format combination has its implication in form of need for 
different modules being engaged, changes in number of pipelines running 
and so on. And there's no running away from that. So, regardless of how 
you layout the struct which represents a "path" each combination will 
need a separate instance of it for its representation. Otherwise we 
enter the world where kernel driver has additional logic implemented so 
it modifies 'path' layouts on the fly. And that's a very dangerous path, 
especially when considering long term maintenance and backward 
compatibility subject.

Why would it not scale if multiple FEs are connected to the same BE? FE 
paths attached to single BE can have SRC/UpDownMixers modules within 
them to help with conversions. Remember that you have to take 
copier/mixin/mixout/fw modules limitations into account. You cannot just 
do random stuff and expect firmware to cope with that.

Sure, we want to select the best possible format. That's why you don't 
have to have different FE/BE format. It's a flexible approach.

>> +
>> +	struct list_head ppl_list;
>> +
>> +	struct avs_tplg_path_template *owner;
>> +	/* Path template path-variants management. */
>> +	struct list_head node;
>>   };
>>   
>>   struct avs_tplg_pipeline {
