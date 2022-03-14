Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D54D8B3F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 19:01:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E360172E;
	Mon, 14 Mar 2022 19:00:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E360172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647280892;
	bh=1F27GDCKsCI7AByVU4gmRluh68rggjFB3rsJRTJfAAM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tEzFWIV/eGARUvhvQt2msA9ViWMAh/iSnOJxBBTULMRCM1bLB74FVKog34M0u2IBu
	 miOoUgvIG3q4E+Slo8AoBMaGDIwPAOSyO73jH0O/05EpHaomQDQT/TnemDfAsanCeW
	 3N6k4D/VQlC6deXZxPfrU6HNfpe43FCL6EbT0miI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F37AF8012C;
	Mon, 14 Mar 2022 19:00:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCED1F80139; Mon, 14 Mar 2022 19:00:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CE16F8011C
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 19:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CE16F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JGwHanRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647280821; x=1678816821;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1F27GDCKsCI7AByVU4gmRluh68rggjFB3rsJRTJfAAM=;
 b=JGwHanRAgtoQagh4Wq2H2rKmXM1XhLFvow+K+brKwRZpsMJ5VqaFICVJ
 F+CabLutylg10P1cH4GViatzswoiK1go9pfJMHorBODTR5XBAquzcGpBA
 tP8xiMM8h6YVxqgjyO3TNUUm2OMIKCKjNvRqzhqTwvnwezL/uBLA8XOyu
 LE/ELCZofYyM21O3nbRi3itv/qybfWzv+pd54LMDHX7TNUEKmjX3jjFbH
 tsHqGnZoa4cz+edUiXIPayeF8hp67hN8I3cfgeuM17qPikzzD6WuMiR0y
 1B1V8a5dNSDMlsPk/w5O4BGW5whBHz4DuWJpgCRvIXpS67+n9kmWyDQM/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="253661793"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="253661793"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 11:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="597996623"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga008.fm.intel.com with ESMTP; 14 Mar 2022 11:00:12 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 14 Mar 2022 11:00:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 14 Mar 2022 11:00:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 14 Mar 2022 11:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9HuG77UIwQwmX+WEuY2ew02mm2mASuZYTPEEjK6Hyyrj3GlRGt5mkc9L3Zkb7j+ls23fmf4QkVzLDnOFPVjYtL1VUWBi4giNAhsjZ/CWNh4Fibgskw6RxN8iMKiDDgpTlkuRYvcNKY6AxY/lNxDzz8437RJKAeccx1h+JZ3JG9F8doxGwl2KW3snC3mm2GqJFH0j62nMe4cbvcqZcp94ZvOkVZoaWG+LubV0zzpXC6vTu/Pk8RwyNeHGVQ48JNSssuAzfbBQLwWatDPDNNuWwCkPeuA2nbWg/U/Ze3SeoeclonN0m4EIduzU+Ror+Szb91merzofSJCnfefOywqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmEWEvsKbZG5o4YCk6MYHAsVQzXXLFH2nfHeBnleokw=;
 b=UcHPO0HsSylVYp6z2mh7RD0MytF9NYuTtWG8Fe34uItFIYFZZPCtLz0MARikYXGJJdkQp3TQgxG1LQ4hV4rbOODZ90mxd/4yIMUPzn8uFVIKEMKOkDJXAh/STiBNVJvCEZ17YetcL3UlgQoGzMPncTRcI99KMt0RUzZ24WytjB0cG2/GDpnUSd6hEaydGX/DevabN3No3KMdLPIwvqOd9Xdn++QW2qrV2ppOIvz/3Mh8nPd4YH+9gS/1+B/9rd8gC0exd/E41HayTzG/hFCBltRyY0LbmwjVyZNJb1zLgVLR3VPTjLUTgjnv4N82J8vJsEbx3sqFbtSEC1zoAOP2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM5PR11MB1818.namprd11.prod.outlook.com
 (2603:10b6:3:114::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Mon, 14 Mar
 2022 18:00:05 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 18:00:05 +0000
Message-ID: <d1a118b6-55e6-4ece-00b3-4f930521b25a@intel.com>
Date: Mon, 14 Mar 2022 18:59:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH v4 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-12-cezary.rojewski@intel.com>
 <5e47e4dd-bef1-8c3c-ba28-d651fc2dae9a@linux.intel.com>
 <05f38bf1-4400-354e-bfc6-636e602201f7@intel.com>
 <7deed9cd-0123-1903-00dd-4b7ce9232f14@linux.intel.com>
 <8560cb93-c2f8-a486-61d8-7955d888d97b@intel.com>
 <936f37e6-e0de-b0da-a4ae-ff52ff8af136@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <936f37e6-e0de-b0da-a4ae-ff52ff8af136@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::19) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64549b9d-5f28-44f3-692d-08da05e477c4
X-MS-TrafficTypeDiagnostic: DM5PR11MB1818:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB1818BFF4A563D269A6195DBAE30F9@DM5PR11MB1818.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cudzPeNic1wTBhWHwdNBnMqU4dkbZDnRIz5+s6rQdBXg8a9ttrDmnYw2DFkL6JmMQTklExoR0kitwopvEfzcrUMnyyPjZdGs3d4AwAsZZLysnzAMV9xTOQkwxXrv2dFxHrSkTLzaI0uQUi7OxwLigv5zdf1G6SEv4k7JtqshW5acKVnAck3QMVgudSW2yYKwLkKGjufYFfDm+9COzXtDtRHXTDQyLhIMrtPlawgNBMV9g8nb8FUZjVAUaMQDdOKCVzXqBG6own8o85Ws5F+nPNXW+kLX0igg4gyWx3F7Gvb/ANrDgY/lYBZ+SWZRXyYwWtQIlD2634hbRsUzw914RdUZRB4SlfXeOMB/fL7APBm1leFFaEEfjKaBisuikaFMbEJ17+FF5DtnUo22NTw0cccxTvMZapbXrJ/ZwSNR4541ZfMEwQ9xMQ5kdsk+PGBJ8VatlYOTORXlXFnx73nsFu6zKsqPB0ObpW6yTIE4fVZKgIrrTMK0QiXzDIfu6BCubmD6Out2qLlRz3E0y4VSzYTSKsg3WwEhDd6Wq9AOKR8iLTor+I/6qFA87VZqA//G9qF7rHSvdTXeITJ7dzrMYPwIcavokMetflFL75ESPnotuSlhTNt0BQDjfpjRrILUtwfvK9XbfkvEmydGKaWov1z53+IVOAbHApPr5r+1ApV4L97Wa38rWqmtuf+WfkQ865YPXCuEu6MiCXLfNTnUHInvx5JtARMPCCsxh9+8PoY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(8676002)(66556008)(66476007)(4326008)(82960400001)(38100700002)(66946007)(53546011)(8936002)(6666004)(6486002)(508600001)(86362001)(6506007)(316002)(5660300002)(31696002)(31686004)(6512007)(2616005)(36756003)(7416002)(44832011)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2Z1WWQ0RnJ0dlNVU3MrZTdiVTk2MEJhN2RwYmxjWVJ0RExGN2dwN2RsVjRO?=
 =?utf-8?B?UFZIaWdsdWoyQjE4YVhVS2RoTnNhSGU0YzlwUGRJdmthUVhqcDFLU09hMENz?=
 =?utf-8?B?WWd2N1Y0ZXN1YWlRWStUT3B5T2pPbTNGQVlzTkxoQlE5endwTkpDbHBTVFJr?=
 =?utf-8?B?TmVMZGxJbGNHVHJrRjByZUxQNkZlci9NOXVOc3hrTXNyWHo0NXlSWHdTVHBG?=
 =?utf-8?B?b2N4YjRVZHozUStFeHE1TnlQd1Z2TG53OW42RkdTNkU2VGZRRk9uNWp5V3Nu?=
 =?utf-8?B?SDdwNUFJQ2J5eE5IZDVxRmFzbm1wZnVEZlM5MWxJbWRrTCt3MVFpM2psdVps?=
 =?utf-8?B?ckFKU3g4ZGdNU2E5dmFuN01zRHFpbWpPOGFobTZNcms2a2VEZm1lNjBteHlG?=
 =?utf-8?B?WGhVM29uNDdHY01FRnVqN1hQV2tteHpXNkpwTUFwQVRVU2psMFM0SzdVL3Z3?=
 =?utf-8?B?OE90WXNMUGFEWTNHaEFPVVl4TnRSZlp3dE1DZU9KTW9ZOU43Y0p3RVpWNmpV?=
 =?utf-8?B?VzU4Z2FyRVVJK201bXlaWTgrTy9pSjZVQkhGbEdFbG82NUhPWVdQMWNaQ056?=
 =?utf-8?B?VEVQRTJ0S1dtQW1Eay9wUVdZbWdVclpxSFJHZGEzUEMzNVhzWlFQdktlQ21Y?=
 =?utf-8?B?cjFMNU4xTEVUNUxYZmZMQjdrcGE2RDFaa0hJRlBOaEYzRWFzQ1lhZlgzUHN3?=
 =?utf-8?B?NE5OMVJUeERXSk5hdjYzaFY2ZXZLVWNzZDE4dHNjVXlvUTVraER1ZUsxSmRu?=
 =?utf-8?B?dTBaTmhINnFsTnp5bHNlOUppWHFxNENxVkNUOVlQdWpDWlo3bTc0ODBwRE5P?=
 =?utf-8?B?NVBkbURPTnIwcE1MQndxRjAvN1RRMzE0RzBINnBhYmNNSEpjNTdWZUkxQU9z?=
 =?utf-8?B?TnExQXZ2VkdYdko2K1FoZFBLM2FvVkZ4MFdMTXJwU0pUSWd2UVJ2U2FSNnd6?=
 =?utf-8?B?UXdReS9jMytBb3E2L3hRLzdPVjhNblBFTG16T0hvMmlVK1c2cExaMmtrSnRC?=
 =?utf-8?B?V2o5Z0VrbENaZU8rcG9hZ1RPUEwwSEJGL0VSblZYYy8yZUhibVc4UFU1d3di?=
 =?utf-8?B?MDBKdDdhdTdPSFBBWTJsSk5TRm5JOEFLdGdieUVsWHVQcTVGdUZyb2dqb0JG?=
 =?utf-8?B?Z2pBNERNWkc2RDg0eVBLNjh0YUcycWg0MFcyUnNTeHBsRHJNdFBKVXZ0U1BD?=
 =?utf-8?B?QS95eXBkWEtaeVdhdHd0eTM4djZqZE12Zk5SdGk3U2JCMXVXazhtU1U3Mkhw?=
 =?utf-8?B?b3ozTXJieW91dm0yMGNUVHRZREQ2MzN4S0paMVZLaTBWVE1ySEFGUzB2V0Y0?=
 =?utf-8?B?UFhzcUkwNnlIS3ZjRzBxbWtyYWFQeDdjNU4yRkRPck9sd295REoycHFjOExL?=
 =?utf-8?B?U0xTbXBaY0d5c1h3VnJ5UVBNWHJXMGJTNnNXSEpybmU0S0llZG01Vzl6NEU2?=
 =?utf-8?B?Rlk5RTRPZXpyekthU1hkNys1Z1VuNFBSTURTUGsvV3ZEaCs3UVNhUUgya1dP?=
 =?utf-8?B?ZTV5Z0p3NXhKaFlCSjNlRWtMcDlnc2NnZVJrbXBqL0J5TWIyWjRsbDd5MzJw?=
 =?utf-8?B?cDU5Nk1sQXRMQkQ3TW5aRkZsYW8zVDR0WU5ydmlnbksvcng4WXEzZklZcFhB?=
 =?utf-8?B?N0lFZUZDRXFJL2dLZ0dZZ1gxMGRnQkR5NTBtK3I2NTdibEhneWR2c2hPdHZK?=
 =?utf-8?B?MXFWckdpNEtKdnRvR0dmWGh5QXZreHBLZHVtaUtpTExjSEFWVHN3eU1OVXk0?=
 =?utf-8?B?N2JhRXNwTUZwQWEzUGVtZllSZzc1bE8rN2M1d29JenZUU0FORWtwZnlLb21p?=
 =?utf-8?B?ZnJ2aXpaandwR1orZ1ZzWGhiUWJxMm1sblVDYTVnMzVCUVhJSDJFWUdib1VF?=
 =?utf-8?B?VE5CMkpYTWVWMjE5MHorejN0MFgyYTlSUmg4VmsyU0h3eUtKMEZ1Qkk4NDVW?=
 =?utf-8?B?YUgzRUt0RGszTG9EeTFENlVBWlpjYkFtdGs3dythaWtEbDZTMHFhL1BIdE1t?=
 =?utf-8?B?QUdUdVRmc2dBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64549b9d-5f28-44f3-692d-08da05e477c4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 18:00:04.9983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jM+7TeN5MXxYwIAlwtguM+inXN/QUuK8b7vVeCPGyD/JD9/OLlddcCMetk2gCeB8EmHlcUmZa3RdIqrMttOXccLXMJdF+Wj+I7CEtgO9izk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1818
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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

On 2022-03-11 9:30 PM, Pierre-Louis Bossart wrote:
> On 3/11/22 11:20, Cezary Rojewski wrote:


...

>> Sorry for the typo: s/avs_module_info/avs_module_entry/.
>>
>>>> runtime parameters.
>>>
>>> you clarified the mechanism but not the definition of 'module-type'?
>>>
>>> the definition doesn't really help.
>>>
>>> struct avs_module_type {
>>>      u32 load_type:4;
>>>      u32 auto_start:1;
>>>      u32 domain_ll:1;
>>>      u32 domain_dp:1;
>>>      u32 lib_code:1;
>>>      u32 rsvd:24;
>>> } __packed;
>>>
>>> I see nothing that would e.g. identify a mixer from a gain. The 
>>> definition of 'type' seems to refer to low-level properties, not what 
>>> the module actually does?
>>
>>
>> There is no "module-type" enum that software can rely on. We rely on 
>> hardcoded GUIDs instead. "module-type" is represented by struct 
>> avs_module_entry (per type) in context of MODULE_INFO IPC. All these 
>> names are indented to match firmware equivalents to make it easier to 
>> switch between the two worlds.
> 
> So the initial kernel-doc I commented on is still quite convoluted, you 
> are referring to a 'module-type' that's not really well defined or 
> useful for a driver.
> 
> Given the definition:
> 
> struct avs_mods_info {
>      u32 count;
>      struct avs_module_entry entries[];
> } __packed;
> 
> 
> wouldn't this be simpler/less confusing:
> 
> "
> @mods_info: Available array of module entries, obtained through
> MODULES_INFO message
> "

The major problem is the convoluted naming within the firmware itself.

The decision for the naming all the members as they are is dictated by 
the fact that there is much, much higher chance for Intel audio software 
or firmware developer to do some major/meaningful changes to the 
avs-driver as the kernel grows than a person outside that circle. Not 
everyone might agree, but that's the democratic decision made by the 
team in the early days of this driver. And thus, having close 
name-matching between the driver and the firmware makes it easier for 
given developer to switch between the two projects.

Agree on the rewording. There are probably more of such wordings within 
the code so this might span more than 1 file.


Regards,
Czarek
