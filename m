Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 303BA598836
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 18:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E881682;
	Thu, 18 Aug 2022 18:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E881682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660838474;
	bh=d8/wQMgjdOp5GAfAa7+2UO80W3Q0sLJUQGiX/U2l1ks=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=scQ2F/kbL7+oacBg06u1FeoAJVu0izJG95g8tmiBN1X/wtWczrewJTkZs919iWMQ1
	 TJ/WEZVtr0k3v0Cfz0mK4GisyxAVHS8Gx+rsXqUeeV3HSTszy1QcK6F9mrf7bIXiXx
	 qxIqanRGW3Kl7I6bq79QqPr0d9NrBDc0RE1IwTVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63260F8049E;
	Thu, 18 Aug 2022 17:59:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E419F80430; Thu, 18 Aug 2022 17:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86A1FF80430
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 17:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86A1FF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PoZqCTRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660838391; x=1692374391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d8/wQMgjdOp5GAfAa7+2UO80W3Q0sLJUQGiX/U2l1ks=;
 b=PoZqCTRiaZbshPDN+ut/haslypxA43g6XxosU7rFBtTJXTPcoRS/KgrC
 IsXJT6kegJZtwXdhkE6u2P/sPdl70FeZt2VpLtFo3sD4tVKQiybVQJHGr
 +b1YAYqJfDCYmQuIpzVx8UGlOmTN3022IVJWF9GAGmChzM/LN62ov+Isa
 bPsfYco3t+HFIJiayf/I2d+m0xBw09MAgdyreqx42WzhsMR9J91JxXeCe
 vF5V3QNxEuTB3rhSMnFqzFV8Mi+8Nu2FuZhhkAYjRjvMQ0xJarbYq1PMS
 VjhqfLgGI/LlPkLNnhqTg5IpyWb349IUAvyjVgQtbSDhu6pxpqX9Tw+c9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293587789"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="293587789"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 08:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783821451"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 18 Aug 2022 08:59:46 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 08:59:45 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 08:59:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 18 Aug 2022 08:59:45 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 18 Aug 2022 08:59:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WebfHuP0k4Xh0O48OSr68Jhl4s1uBz15LMTNI1i6zxYI9arer1D+vqXgC9T1dYd6XQuazUCdlBUb+QacJ33ctI2Ex7ZCTAZwp/fdOHhmtviyn9zCbrFqXTzsEmUVzGzBqmamkhNQbXnPV+IKz2WoqApbQXBDo8Oyd1BabvtvM4N8O9UmdJpsHqaopDkDhloFaE/82ZTs6Kxpcf8TpW4KGS5r45rJY9fEfsQdEQtpC+AW3ov9NZlr1nU7tfxk+T7bK/s0NQAzv/+K+zE2qGMZv7tXC3L8FLsPK9hgibt1CTqV4pyEFceHweJhQqBFIGD1bHGLRFo3eXWz2q0waNlqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkoHI2CtuVSl1AIuG2UAJ4Lh/uuYPD60SOVEggRrtVE=;
 b=NrkHvBrkqKeHTQDE5igYG4svZbAh2s4Ghia6EBCgHwpMgU5eEM4UZYc+UWzNR4bj688YwiPfdJjCmvmTnyO5vBOR7AapT9rvXPBmCIVZ7dysH0qQjpjhgOg0s2xsRvNOoLQWKv1fXgG26x+YbM929ttrD9lJsOvkH1q8BecITn0Po6WC3lcS4lFQV/vDoBcMiAigDiKlO82NxX9JWvKeZeDWPf5ZbRp2FUh10+yeiqlCprOB1wn6Nms2zecCWLvk0tiqvfI8XSA9wsJQaj+IfTgtH/iaxyl9B4Aa2vsISHcgIAsF+NsAnaP1o1CQ1fnzPoxV1mGB0oYalFqj6Iwq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM6PR11MB4476.namprd11.prod.outlook.com (2603:10b6:5:201::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.19; Thu, 18 Aug 2022 15:59:43 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae%5]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 15:59:43 +0000
Message-ID: <fdfd19f4-436b-bc1b-65f2-7b60f8e59277@intel.com>
Date: Thu, 18 Aug 2022 17:59:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: Buffers used in ASoC Intel Atom SST driver
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>
References: <874jy98snd.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <874jy98snd.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc5d7bcf-e78c-49d1-cd8a-08da8132aa77
X-MS-TrafficTypeDiagnostic: DM6PR11MB4476:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A49KdsyichMA+PyIKn96KDRT7d9tEu3OFE0orIj0mJePwxGPLU8+uKi1GJiTUMbjhVK4mok6zbzL8nckYsoRQOqAKmI0s1yLmuwClY6xASfurVghrzsV/61Dmail9cz4lpI6BqeIzpicK/mZFqNVpqpEmSmg6sCIe46JSUwr1+mZCE3KtaHHLUPYy5VmFjJlzI013m8VACobMwSfbmj1nfDcfVzTHXH6YAY0j++NCSJVkGRImwmfVy4Hns1YoaHtsuzDWdzNz7GTkjJwOPLoFvtYTU0CYFUBZCW6v/vxsO6Fi7eaBv3cYALeh8Ll/5QEoVGthLhoyDdVJjC6aO0bRibF0qRKjjNOD+rkbdgVtXsv8/CX3VckQ/OOwRNJ6gWAsvjLjUVzSrGyg70VGtCFJpwBKUiz5gQQwcvcYynz1B2dyHNaKoA1K1IIttCu80QqD/Nj8ijMSfb5YE/0SQ7hBb2QdO6J6/UECgL3N8hFXsy5J5RwqQZMBSMeDtFi8dBV1WfWAYcjHOWG3kgMgSourjbIk29hWlf7AFs4su9CZ4a01Crs6bTY5nQzAvOqJIUOwV6UsCfpHVVYUl0Xt8EVZ4GW7OsusOmhGfvDE1+n3Qrd/DtqQpfMXmndfn9OOqaT5EACK/8oUROyefFlvOSjL77OxoSc81ece6oUd9Xll2RCLmnEZJXq7qZfSv0aJ9nmhyS5Tip/t3fhcSd630kishrfV/WGmpKxjiAuVFlH4qSlJ2wv8NbEX/fTlkmGL/R7bTdIZSPEeSVL1q2oWHyk6XN7MptzsZdDLXHVLuyKdRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(136003)(39860400002)(396003)(366004)(2616005)(38100700002)(8936002)(82960400001)(5660300002)(83380400001)(8676002)(66476007)(66946007)(66556008)(4744005)(2906002)(44832011)(6666004)(41300700001)(478600001)(186003)(26005)(6512007)(54906003)(6506007)(53546011)(6486002)(86362001)(31686004)(4326008)(36756003)(316002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFYaEgyUi83THJuSVdIbnA1YzgzSkhmVzJrb2JWQTN5V1hQeFlNTkxkTVQv?=
 =?utf-8?B?dGdnazgvclUrM1lDQ3dsYzRxNXVISllyUFFBSG9xSm9hMG5NUVVnTUgwalpi?=
 =?utf-8?B?bDhwK3lxaFNXNFZDNkVZdDQ1TDUwaUtRNk52OGJmdU53MDJTNmNKSnFvWE5o?=
 =?utf-8?B?OXFBcm5qc2hZOGpFSTFOQ2dSTDZBajh5b0xUY280aEVIaDkyM0pqN3RVUzVQ?=
 =?utf-8?B?TDdoTVIrdVVnYTRxYk5ISTdvS2tCOHlqNlBoZGEwTFdwdVRlOGRpWmN5aUs3?=
 =?utf-8?B?R2xsSkdZaFBnK0l2dVJOZ1dkcmZWMmxDcHNjYmRRYjVhWjYzRjZwclJIYTF2?=
 =?utf-8?B?dlMydzhQM25wZ2xoZVRBOUVqeVNNWTUranRtN0czSXFldTVhK1pxL2lieUY3?=
 =?utf-8?B?UlpSWm9waTlIZ0RhUTVjTE9GWitTUVdzdFJ5Zy90dW5FV2R2OHhmY3VHUVNJ?=
 =?utf-8?B?cEtpWW1QcEw5YnhCRU0xU3dtTEFVQ0pVQmFFVnVobEZaM1JHVEJRc05LR29z?=
 =?utf-8?B?bTVXM1RxWmc0cGpvVjNWaVNvaUlWT1ptZVhEV2hFRGhYQXFOWHh6cnFJTURG?=
 =?utf-8?B?bnVQeFh3bGhDWk1RcStrUjJhUXFzL0xQbzQxaG9kZkQrd1Z2SCtuSytuZ0NJ?=
 =?utf-8?B?bTBOSFdTVWFMb3c1STU4VGljQjA3QldkbFNvVWI5THlYTTlCUDZxRkFqTDRU?=
 =?utf-8?B?NDFDZ05RNWE0SlBjRzhpcDBvS1Y0WFJDQUZIWHlOZTlCS2VpTXFOQncwZ2M4?=
 =?utf-8?B?aktoR0NvRjd3bGNYa3dobHh6TlZUc1llUXJTbmhuM050dmVzeWdKKytVZENa?=
 =?utf-8?B?RTArU212ZVhkRHpBWmVqZEk2UityYXZlODdwcnFOSE85YUUzdk9UaW1sN1Ew?=
 =?utf-8?B?SC9SYjZyWEttVjZ4MmdHSmlRZnJhZlZOMUxhY2tkRmhjNlFMS1F4Q1NkRWZT?=
 =?utf-8?B?aDBJWkFHRnhFWVIyMzQwM0NNWVQ2NjMwMVY3MTMwWFQzNHlGUDEza1FraFdu?=
 =?utf-8?B?K1JWSERTNmdNdHFMM0xXMFg1SmhlR1plTjRNd0N2OFJUK3p0Um1yN0J0SHZk?=
 =?utf-8?B?NzhyaUtLUFNMWmtISXE1d2d5aFY5TXQyVFRpSWtUTmVQb3BQUkpiZDJ0Lzh1?=
 =?utf-8?B?UFZvMzZhUkhseFE5d21pS2g5ZXZHQTZ4ZWl1U3pDeHpFL1hRSEVJOUtWSXJS?=
 =?utf-8?B?ay9KbjFqYnpFZ0gzblRkOFZNRnBsYmk2K09idTB0QTMvNDhxZ3hFOUZ2OC9N?=
 =?utf-8?B?ZFpnMGdWWkhMK0lSQm11VUFadFQycUhRMzFtdElqZVVqWkhYTGl3ZU5xRVlS?=
 =?utf-8?B?MG1IYVQzcHJhY3I0VjNCS1AwOGEyNjBXQ3E0a1dqY3Z6KzNWL1lnU0oxWWJE?=
 =?utf-8?B?T0M2MFptSmFKTUFaRXQwZUg2a0YzUERVTmRTRnV0NldUOUZJS1RZV1docVh2?=
 =?utf-8?B?dDl0UFhuakhKd3lmT0RsemUvY1pncDN4YlZkY21rSXhXaUdFTjNnVmM1UTVh?=
 =?utf-8?B?NndUdWpwZmsyVzhuWHg0TXl3K3hYN2pWRFNJL09BaTZUMFZOWHpRQXc5bk5V?=
 =?utf-8?B?SUFVOHFOUnB1VGF0dENGL1R2MWpDbkJBSWxjOTFWN3J6YlpOd0ZGSTgzdklC?=
 =?utf-8?B?NXNYM0dzQTloR1VoS2RGOTAvcE9qVThTdkV0eForQ3VyMlR4YWRQK2kzbHdI?=
 =?utf-8?B?a1AyVXJha3k2a3l4aDRxNktXNGJHdS9DWStacmNqellTbzZnK1hIOTFVL0Vl?=
 =?utf-8?B?aE5BcXRKQ0lZYTMvM0E3U0RyckxVS2Z3ZTYrSStjSGZDaW5hdUczRVpkQytR?=
 =?utf-8?B?anZXamdCdTRqcExkMC9qN0ZjMXJRQkVvVVdTbWhhV284dTlpUk1OMEZKMWlW?=
 =?utf-8?B?NHB5WW9XWU5GSFVYRFA4dUxxTzgxNzJ2Wnh4dXlNQm5zN3ZsYWxQcU5NWndV?=
 =?utf-8?B?bDdKOGhWM1QxYzZZbExlbm9HZXpLb0hEWFMzb1lwTktFcGF3UXlWRlZMZUFp?=
 =?utf-8?B?TnMzUmRNMnNJZnVWUmNldHRUMk9pQjk2Ny9SUVEvS2xtUUpMVVJlNkp3MVcy?=
 =?utf-8?B?TFZvd0NJQUpIeFpLM0hZcnpwbEF2cEdibFcxSzV2azVtZG1EWnYwVnFWbGx1?=
 =?utf-8?B?NzYvakY0VFVVKzJGY0RaQkdqd2ZrUU95ZWc5WXluMGd6YWx2dW9yV1dmVlJn?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5d7bcf-e78c-49d1-cd8a-08da8132aa77
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:59:43.7015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8Zi3xoQyuMemJLGyojAdYV2a0l8QK536P7h8bk/iXFCa0lVcL4GadRXmMMFQBchHbUbgMCgwfo0CIf1lWd9PFNsX+tAujphr8a/3fsKcQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4476
X-OriginatorOrg: intel.com
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 2022-08-18 5:42 PM, Takashi Iwai wrote:
> Hi,
> 
> while cleaning up / fixing the memory allocation code, I noticed that
> Intel SST driver is the only driver that currently uses the
> SNDRV_DMA_TYPE_CONTINUOUS pages for its PCM buffer.
> 
> Is there any reason not to use the standard device buffer
> (SNDRV_DMA_TYPE_DEV)?  i.e. the change like below.


Hello,

Does not hurt to check the change out. I'm not aware of such limitation 
for any of Intel's AudioDSP solutions. I cannot test this change though 
as ATOM devices are not part of my CI. Pierre, do you have any devices 
where this change could be tested?

Adding Hans as he is the key intel/atom maintainer too and I'm pretty 
sure he has few devices on his own.

Regards,
Czarek
