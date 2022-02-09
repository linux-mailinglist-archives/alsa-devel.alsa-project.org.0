Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BDE4AF0BE
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 13:06:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6595417F4;
	Wed,  9 Feb 2022 13:06:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6595417F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644408415;
	bh=ugocTCbMtr9zEtJNjbP7dm4Cm38Nc9LcjIZuQICzn8Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VSLPDPFp7t70zYoQI087a1LH+QW4zSHlWuPbNcWsr8eAFI9J8vJXHxSzRrp1Cx1Yc
	 ZE0b3WtbIu1kaM+tMLSBMylF1rfGILfpMXLcenVKfAyDeC3ZJVSxOFchqETWlBvOW3
	 xUJD8jPyJI5+Lx+R3QZ2fY+SIkb/rC7xb1fVdS60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7C36F8016B;
	Wed,  9 Feb 2022 13:05:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 254A6F8016A; Wed,  9 Feb 2022 13:05:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D880F800A7
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 13:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D880F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Mw2j46g4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644408343; x=1675944343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ugocTCbMtr9zEtJNjbP7dm4Cm38Nc9LcjIZuQICzn8Q=;
 b=Mw2j46g44R/7MLnJ230GBsOG0mZTjWc5MpN5B695t3HaO4/euBmZeYvn
 vcLTbBTfCm5YjlkU/ck2ZvQTneZ2uz58D2GFSOnY9rVozsmiJn25jhcri
 vgJVZuQEK9m1C00SxFoDttJ4oKTop2iO7YaT3uIFE6n2YBYp7BHNe16fn
 vTz6J4rD33utvyW/IA4cchUYmsHEWPkfLaJJT81qzWTMyg1Ff7Z95ezfR
 2uhsjqGXa/To28cdLS/f4m7B9CgM+7K0lZRnEY4/GfTQDyXx35Yzf0Iu2
 SD1ma2e8Xgu+b9QYA1MCPqumQHxv81txhJMfrreW9n01yhulyCbM8WoLN A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="312483975"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="312483975"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 04:05:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="541068391"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 09 Feb 2022 04:05:36 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 04:05:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 9 Feb 2022 04:05:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 9 Feb 2022 04:05:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzE1VCe4tnDVRGJcLCQoNg3FVqPWVtGM7H0iIL/njgl774FJ9D3wghP/n0sftEj42dHG6FVctp8ZatjVvy26F1gAzCYkhheeqC2z+xKkRAoNo/1okluJdxm2SfMcBPbzI7UoI7sYF7sIyJTVBvvYOSfNGklFj8y90qPvzFKaIKSIr4zWe8S+EfABOuB6ErDxv456GF5MHeHJ++4pDvyRR63YlqK3k3xMmIOH8Ht6YiidK9S7vClClO+eraFuW1IYeSW9UqihtKvle66UslLwJOtqnNNmlAOc4oKx6p+xKSni1BATkwKfR0BJdwfnLWvgPWil4XMvadr2Mrpg1hvnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj0jmPd2//plhIThRnwbU2JjHdrnadCCv8vClZ92t9s=;
 b=HV8n+NDAR990Agpxy9acWCIwRK8NdGVyFWCS6k3yXuCPDcNdTZtRhnC1mJYb2IJ7+2oX49lQAy+fabzU5RzPEJkK16WsWqm+nc4fw91/CvXkSCX//u10FvFgHCoDphZqTSy2Uft+yhDz9EWlmMmGQlJjRbjOyM9awQP/zLNIxJ9eM4T1WsviiP6RnVgpQh2Lm5sn/AYDisQW/o3sYo/AFxOCumaZhles552PymI824AG0bYFVYPB2ftAKeTv8GVuXIsLI4OHOp589oX/kf8Y+ZPWVSLQmNpNeRgvDch4IjgliG0pvPPpjKCiHuWSy6pmZz9ZczBwyZaLOoG53UkIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SN6PR11MB2718.namprd11.prod.outlook.com
 (2603:10b6:805:63::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Wed, 9 Feb
 2022 12:05:33 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 12:05:32 +0000
Message-ID: <23f36ba1-277c-6998-f569-2861887720dd@intel.com>
Date: Wed, 9 Feb 2022 13:05:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <20220207114906.3759800-4-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
 <c144c67d-e6a8-1baa-82e8-37065c053919@intel.com>
 <41671a26-bd27-78ab-3440-eb9cb22c1ad1@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <41671a26-bd27-78ab-3440-eb9cb22c1ad1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0082.eurprd06.prod.outlook.com
 (2603:10a6:206::47) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce587ae2-4970-4ebe-d1dd-08d9ebc478ff
X-MS-TrafficTypeDiagnostic: SN6PR11MB2718:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB27189A6113219BDC5072017DE32E9@SN6PR11MB2718.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N17DUaU4VV57vtYt0bfG4/s6PmwPoIdVOpuUwJ1vd7/E6CuJ5tPXzB3GoyJGz4rpP72rntNk/SgQ3TfOFy/IikRx2cvlk50GZDiwYQW2XH2vi8E+tmtbR++HvR/9roa+xjzb9177iJ0f4OywDyeGzzmWR0hoUZHp89VU+NVJfvHvzHgVQOOKmYiNrWUzVtUU8nXLod4e4rZASMSVm5FkCpAvZR79CeuWdoL0KBu1XjP9L3bSWtVN3xGaF2qdtpUwns4bLMv/xLV0FHMGcFpDFjBDqgOfjGhUllefQwQiRKSQQh0QyvF9+I/GOYapnKc8GquQwd9lyr4aw/AuvYmqC0cxM5P7+NZESyO9O586S4GvyqRTHtgjWy1rNvWQwIz1fW70dfrEqGFFx4vxzQS9mQX4DI9XRZrYBhax6Xf5ka7TaYiz8L19g+I+thhHB8LGbfF/z4He26R3qxcW66g+e6eJpLYyKcsoFo62xrzwyy6Nabyllt3QgEhY8jUamlFOrDeUjmeg7TMnJhwT/67uIYRYqzkSadMfdIB+iRPgyJp2UxgeR9wNbLo6MWca8XTEDHptk/5F8qqBOV/QQpvBItvlYiprC+C+Yk3NRwM5Nv/qzwHXboRWCZH+vd4IRUWafgZ+POAjEnN+PMnM378QgHBTeLSn9ZFu/9aZ4kzVRvNz0+jrV402Kul3xHGuijjn9dbaf4Ebe0zT4bdcIHTa58f1myeac85OjyfIXRwYRGpKcvSZaLeaYE44DcwQuAJ5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(26005)(31696002)(15650500001)(5660300002)(6666004)(110136005)(8936002)(53546011)(66556008)(66476007)(6506007)(8676002)(186003)(44832011)(86362001)(66946007)(4326008)(316002)(508600001)(7416002)(31686004)(6486002)(38100700002)(83380400001)(2616005)(82960400001)(36756003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWx5RWR3TDUzallNSzFJeWhKaVpnSVJyNmJNMFBndFZzb2c1dG9EYTJ5M2JQ?=
 =?utf-8?B?ZVB4eDh4ajFFYm1rMWFoeE12N0xrWTR3VUhUaTBRWkZJcEl3YlpFM3d4ZDA4?=
 =?utf-8?B?Rm5Ic3dJTXlYSzhaNkhua0ZvYm8xQ0x6NkIvSW5YQ2cwaGV1aThEWEFSR2VH?=
 =?utf-8?B?N1RFUE1DcXdzUGhNZGxBWXl2NldBWXNyM3Fva0V5eTdaMmhsYVk4MkVZSmxH?=
 =?utf-8?B?Y1Exa1g4SHVxaVZXMVdCdTRDRTZqeDZjYlg0OXBGcGpVcHVMdElXclA5eDhO?=
 =?utf-8?B?bHNUbGYvUU1zcGFwd2RHVU9nbS9sVXE1WmFvdXZYZmFVb1grbmE5dzExWDEv?=
 =?utf-8?B?Y2trSGRXRlZUVTBZemlKUTZlNnRiWmtiZTJCMXFLSGNwODlKaUhsTmtsZEpT?=
 =?utf-8?B?eEt5ZU5mbmFTMmxWMFgwTjlaNVVkSGptUDkzWWRmeDA2NUc2a1d6d2NWaVNP?=
 =?utf-8?B?M1BTSVBvT0pTYkE5WEl4dWFUbFBFVis0K3FCaTNzWSsrRXA0eml5WDJLVmhU?=
 =?utf-8?B?Znh6cFArRG1teUJjRy9aNzNUSUh6VUlHZG83N0NuV0p5T0l6N3pEOCtWNlVS?=
 =?utf-8?B?MVUzSXdCQzIvd28xTWQ1dXo1M1UzNCtrYVdjRmRuM1pXVkN5YlhCWEc4R2wx?=
 =?utf-8?B?MTIvMjRjbXpwN2RhSlowc2YySURTUFppN3krUFF4cXVSMWVxYWp2UFh0MDJ5?=
 =?utf-8?B?ZHRnd1BrOEdjdjRKMngzdFhhT2F2UzNncDAzMEt0NUJZWFhFdzJ2RmwrK1dp?=
 =?utf-8?B?MCsvWEZyUVpZMmNuZ3VVWENhRU1XajA4aTUvaTQwcmJOa0cxT3ZIOUFVMFBV?=
 =?utf-8?B?MEh4U2hkSWc5ZEt4MnovSTNZZjdiZGpDQW1mMnlINHB1S3FlNmk3cGE5UCtE?=
 =?utf-8?B?RFNlc1JrOGcxdUxIV3h4c0ZKbzEwemVoVjg5aW9vTFV6RlBoY1ZXTDRsSDd4?=
 =?utf-8?B?bmdPekZXVUZJYzEwd1FhQWdkYklwdHJIdjRmb0NJallQZFoyeG54NERhdHh4?=
 =?utf-8?B?cXNabFNLQ2dCSkdiQ1lhZEs3NW9UNWZQME4zVmxxdmNJd05udGZnSFFvTWtZ?=
 =?utf-8?B?SWNGLzJmUEJ5Q2RVUlkrM3pkbGFJcFM0QWU2aUt4ckdtcEYvNWtmWHpWT0RV?=
 =?utf-8?B?VlJRTjA1YUJuc1NuY1pKK0FSMUlacUN6ekFUNkxuUnBPZnUwTmhvdCtMQURu?=
 =?utf-8?B?OXlxQUJldWhGQiszcEtTVU1vR0NuTmtzSXV6K3d5Y3BET0RPTk5XRERDeEtC?=
 =?utf-8?B?SlJyVldNdERLREorUFl0OHBPTjFzbHBmV0RTQkMvL2lRNGxHNmZmY253bTRy?=
 =?utf-8?B?WXlNODNKWVN4MkVGSmh0akQ1bEcxWW1Yb3pKcWJKUndJQzNsaEsvRk5CSG84?=
 =?utf-8?B?cVpaYVBqd0U0c0Z3eWJFdkZrc0dJM0F3NmpuOU5yZkk2bDZqZXhtcStWK3lw?=
 =?utf-8?B?ajd3QjlxeEVhNG5HY0czaXp5RUhqWXh6TjN0T2hSVFdaK2h1aU8yNVVLNDRx?=
 =?utf-8?B?TUR3WXIyRjZmNkZBUlZWc1lHdXIrQzh5ZUZZT0NtL0MxN1JMc3hveWhDYnM2?=
 =?utf-8?B?N1lKc0FTWkJtWG4xeXJJam9qcDB3djdScWQ1cVBDamNLZGN3Z09nNDlzM1pF?=
 =?utf-8?B?d3JqT0xlVE1PRUdrVTlqUUJyTUN0Zm1ZOWdseHZiWTZvZXJyeWMxejMya1d0?=
 =?utf-8?B?SkhyclR1QVphZHV4KzczNzNvYnc1cHJaa2VzSHEwd2VBU21wcFBOQzNXdDV0?=
 =?utf-8?B?TWlxaFVYNGI2V2NWWG90VWltZ2VjcUNlVy9yN0F4c2h5Q0FGQVpNS3U2SjU2?=
 =?utf-8?B?Y29Xdm0zMXVZU0tXdUFvVFMvUWpvSzMzbGxRNTJWdlBZVFJtTjFuWm4zY1Jk?=
 =?utf-8?B?VEE4ajg0VEZjZng5SlQvMTNnL29ob3IrMDhXYjZrNGtySDdiOTlqVjBnWXdG?=
 =?utf-8?B?TC9VenBuUHRuY3hETXlBWGFGcXEwd1dBWm5qQkZTMll3MzNOVEkyME0vTVhj?=
 =?utf-8?B?bWZ1bTczdGJxa1ZGL2dTRDdsNE1vODZOM0ZUOHNoK0s2VnBHVDJCdkx2YklN?=
 =?utf-8?B?WnRYMThEWnNKRU1KamJKYnRzcXJVSkYrU0lUTFpsTGJIZ0o4WVFrMmN3WWFM?=
 =?utf-8?B?Tm9lZkZvZDJPR1dBcDhaTDFQSFVrRUs3QjI3MzFXblc5Q1BDNGQ1bmFMRW9E?=
 =?utf-8?B?Zk5PNTR4c1VLQ1ZBcHlGdThtWWpIMUVnR0YyWW1uK216S3Y0RTk3VjRmclY5?=
 =?utf-8?Q?l5QHLqnqV05gttO7Cq3KQFlUkj+Vb8275DutGVI9iY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce587ae2-4970-4ebe-d1dd-08d9ebc478ff
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 12:05:32.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +e41IzqHbeSqwwxu6sX9jakc0ngMgltZdnDdNGvqBSQy2pxyChnQi/W2zLyPpaWU+VilHzbfaKLsza8qeCuy4XEYwGm6mr4nmZP6qYtKQ5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2718
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-02-08 6:46 PM, Pierre-Louis Bossart wrote:

> New capabilities are always welcome, what I am missing is how important
> your suggestion is for end users or OEMs.


Users won't notice and why would we like them to notice? The intended 
behavior is 1:1 with hda legacy one.

> The main reason for using a DSP-based driver on a HDaudio Intel platform
> is when DMICs connected to the PCH, since this link cannot be handled by
> the legacy driver. Those sort of form factors typically have analog
> playback and capture only. UCM exposes only analog playback and capture.
> 
> Desktops without DMICs generally rely on the legacy driver and have
> different sorts of problems with jack retasking and other time-consuming
> problems.


I believe we're all aware why and when DSP-drivers are chosen over HDA 
legacy driver. That's orthogonal to the current subject.

> Exposing additional DAIs in a DSP-based driver when supported by the
> codec is a good idea on paper, but it's far from straightforward.


The outcome is reduction in number of DAIs exposed for basically all 
codecs except for HDMIs as DSP-based solutions are hardcoding 3-DAIs. 
Here, the intended behavior is to be 1:1 with hda legacy behavior, not 
hardcoding.

> a) it assumes that there are indeed additional DAIs. Is this really the
> case on the SKL/KBL devices you are targeting? It's not on newer
> CML..ADL devices we've been supporting with SOF.


It does not _assume_, it _reads_. The outcome is reduction of DAIs 
exposed rather than hardcoding Analog/Alt Analog/Digital endpoints what 
is currently the case.

> b) it assumes that what is exposed by the codec actually does work - and
> the number of quirks tells us to be cautious. We routinely get reports
> that even Intel NUCs don't have the right quirks in the kernel...


Patches just expose functions. Logic stays the same. As it is 
sound/pci/hda code we're talking about, that code is quirk-friendly - it 
contains several "patches" and quirks already.

> c) and then it creates new problems for the topology that may expose
> paths that may or may not be supported by the codec. I am not aware of
> any existing APIs to take down or enable a path conditionally - though
> it's been a problem for a very long time for SSP and DMIC enablement
> that are not always correctly described, and any suggestions to improve
> this limitation would have my full support.


The default for topology is to expose just single analog endpoint as 
majority of codecs expose nothing else. Moreover, having just 1 FE 
defined in topology can be used to limit the usecases where we know 
codec says it exposes more but in fact these endpoints aren't 
functional. For specific codecs that expose more, a specific topology 
can be provided just like it's done for any DSP-driver today.

> FWIW, in our latest SOF work we went back to handling ONE DAI with
> analog playback and capture and ditched the 'digital playback'. Trying
> to do more led us to too many issues of 'works on platform A' and 'does
> not work on platform B', and sometimes with different answers depending
> on which BIOS version is used.
> 
> IMHO what's really problematic for HDaudio is the support for amplifiers
> located behind the HDaudio codec, for which we more often than not are
> missing the I2C configuration sequences. Suspend-resume is a recurring
> problem as well.
> 
> I am not saying no for the sake of saying no, I have just never heard of
> anyone complain about restrictions on the number of DAIs in the HDaudio
> world.


I believe our goals align. Rather than hardcoding Analog/Alt 
Analog/Digital endpoints as it's done currently, when codec most of the 
time do not have them working anyway, rely on behavior found in 
sound/hda and sound/pci/hda. If there are some problems there it's 
win:win for us and legacy driver. Fix one spot, have both drivers happy.


Regards,
Czarek
