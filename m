Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB96516370
	for <lists+alsa-devel@lfdr.de>; Sun,  1 May 2022 11:47:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E822A15E5;
	Sun,  1 May 2022 11:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E822A15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651398428;
	bh=BDwdUZHrBZkvuh+00WcMeqATuHqogI4d3rOdd8eAQdM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hgdmnwrJWXUk1VXaivdQco9mnwJP9FwmqcjCp5kCX/Vo9FpD3bNoUYD5QlEuXjVZ1
	 rpCnljrxoPKHkRPSQXA6UKHTGlrTNlp1MNbfvwAJetg5CeWcNYUxXV/Gd0amn8H+MO
	 PS+cXbUJGAuDcACOwZuRLjewcIh9wleKsMgSgqps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 567FAF8015B;
	Sun,  1 May 2022 11:46:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3530F80137; Sun,  1 May 2022 11:46:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CB51F800EF
 for <alsa-devel@alsa-project.org>; Sun,  1 May 2022 11:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CB51F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FLb1x1TT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651398363; x=1682934363;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BDwdUZHrBZkvuh+00WcMeqATuHqogI4d3rOdd8eAQdM=;
 b=FLb1x1TT/BX8V6xVD61TF8VrRU9WBE6I7WRX/iW2RAxEF+X39xppyDGY
 zNJfQWj0ScXNp/cb3AQt2EsGy/O/VfRju3evOOEBLVTUHmscB3xuaTrJs
 2n7WV8wrTeFPxRqj+nJJ7Ftv6Eiq1Op1j1aCrLmKjn4o+3eJeEz8e1wH4
 jgj+G3v8xjoxPRh8K1IHPuQKXVy6n/cehC/3cnsvezI3JhYMtOiJmtjyb
 /N0K5HcU/iRLuEUT3gcIE4Z7tVo1zLyyHUGFlTH0CBcvGlMJjsDJiHr6d
 ZpZQzhR59GOm1rcnYNWueFLIQIKtw7yssxhDFJca3o9W63Nb8E4wVUQLS g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="266848608"
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; d="scan'208";a="266848608"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 02:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; d="scan'208";a="707191548"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga001.fm.intel.com with ESMTP; 01 May 2022 02:45:57 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 02:45:57 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 02:45:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 1 May 2022 02:45:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 1 May 2022 02:45:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+emtWJspkloOOUjdrWlfrGGba71PSQBfnWKrRZr5aAhVuqsnE0fBHo6GJX18BSjPTx4ixqRyPHzEuVf4PUctN/CIl+TUlsMv9mqDfQGf8esomBz+/zSNivyxZnpFXz00GUzSieAR/GQbZE14HgtGJPzAetFX++rOq/1LLXMxy82fK5/7ldSrdF2IP4zxslDWBWZFgJ40uYa1W8jaJiwhr2OnCSuj1eax9n46QMQblk0+iiHR2wqV3TgeQjeMFW9dp9361KoLDhlKcU7P5H5un2+xtFEVM3AbMhrooVaUfsy00HZ/5XebebJcGl58Wr9RZ82ZYtROxPycdXn53z7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUS9ITWY7Q7sL6sbXXEP+oUaFLkpFKnppszyJaUUtwY=;
 b=lKbEwc4+yHfqXDFjSqw1CwM09O0uG5iTI/B13Vz451myGKCDedZAU3LxbU6KRh6kqEH+rUwERkqho8NQrHMsEsV/in/U404KwwahGT4VQ6oGIRPkap5oi+ogWOG88/EcbIo24D700HyOLQ0CiAyyqkYv0OsCo6EaLMt2mvWXtUaO4g1U5Q+o8YfC+DiXlppp8Yy+9p1TlSBUTKk9cUtZe+7HxoOrtbl/uj9QkwXBIKf0bWW0339kZyYxrICcC0x4bRvKx2ihwnif8yiwz7YJRld3kCt4VUwWhuQWa/Xg7HrRAHz+lXHTQ9e9u3lUe+wEBX9YqM+6X+0MxKluqhm0+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MN2PR11MB4062.namprd11.prod.outlook.com
 (2603:10b6:208:150::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Sun, 1 May
 2022 09:45:54 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.028; Sun, 1 May 2022
 09:45:53 +0000
Message-ID: <4ba8b812-2b67-5dd4-2774-f7a94e2d3cc1@intel.com>
Date: Sun, 1 May 2022 11:45:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 01/14] ASoC: Intel: avs: Account for libraries when
 booting basefw
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-2-cezary.rojewski@intel.com>
 <9854d2e1-63da-2377-3fd1-120adfb4d381@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <9854d2e1-63da-2377-3fd1-120adfb4d381@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0420.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::24) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fabc6ede-a22a-40cf-b45a-08da2b5761e7
X-MS-TrafficTypeDiagnostic: MN2PR11MB4062:EE_
X-Microsoft-Antispam-PRVS: <MN2PR11MB40624F5F2A9101249DC1BE34E3FE9@MN2PR11MB4062.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PvIBA0iEhdpwRI9jGMyG2ogxO1oSNlrFB8srqULvZzRhSR6wrY2tEOiXW2ZBFdWHsei9N8EnP3lohOJ0DYGvR2VKMyFxRMU17HB4RRXQil1nxO0SW7gi8neSSP4eEgJi1IjwDI8Myks8DnoCc48Q/rJZoh91t16q/9ygbsJmD6KdfO4rW+cPcQNUwe4HcxvfZ8iW2W7Xum4FOUL3ks03IhXhrh1YzZHg2KAIPDoyAwRf8K2F1imx7xWsRfbcwTeSBX7mZnVa0cHCWEnmS0eOeVKE0CQNMltvA1Wk9ClT6yQGLnBcfuXQ/TGxhOeySQHDjavWlv7LB3BZcUKM4HdikYGrrUSxtI71b663InGI11ogTgBvi0ROisYimrxXZC4zA76hPi3QZnieY1BC7RjdKOJX1/TwbJevqiYJhd62mIy1hM7iUW/iEOjkAca5jlBYwJc/c9nFx75Jm8VA3Yyi9XYoPUmYPaOvxXYgLrFYLTxPkoBDb4DZHmlVAsM8dVXONTGXuipE2W132Zp/HqeEOH1Qbtn6FQSr3xaPwxJERxwj5Co2wTp8XVJjwLSBQrqzXobaLqE8XG7EA0snGz/+/NmDE0jGokJ+xNyOrhzU0kB0cTgfJ3fIN+rzOt+/nhPlNexaAK+vQTiknbJXrga3l1gwsto0BGsBNdqMtZd5ncdSYzyr0/soipdi8/8htc5X17ywjQPEwmp+nsMM6VFZOvMxEKvek/yEqV7IoTlYYBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(83380400001)(7416002)(44832011)(5660300002)(36756003)(15650500001)(8936002)(2906002)(31686004)(31696002)(86362001)(53546011)(82960400001)(66946007)(508600001)(186003)(2616005)(6486002)(66556008)(38100700002)(8676002)(66476007)(6506007)(4326008)(6666004)(26005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0Uvb2ovRENHbURwQUVVc3hxN3ZGaE1URzNDU25FR2hnNWpmTndiSXpwWmFJ?=
 =?utf-8?B?b016ZW01a2s1eFJ4SGcxSUVNM1c4Rm5iaUJtNWRxazhEN2hRRDFIQ21YNU9T?=
 =?utf-8?B?UW56dmxDMitoK2lVR05PNThSd09rck5PNitNZnU1dW9kek5sT3psam9GL0dp?=
 =?utf-8?B?SCs5MXhwMmFLci9EZnl1ZUpYT3l0UTdTZVNTaXpaUnp6eGVNN3AxRHFvbTJU?=
 =?utf-8?B?Z0o5VTVXL1NFN2NuUGhIWnlhWm9HM2wySWp4U3pnWXRKWEQzeGU4bGs5SnJm?=
 =?utf-8?B?V0pwZDZPWGRNcU1wWlBLdVBGVXdDSCt1UkhpTXN5Y2MxSWhTTzJnM2FaUm9y?=
 =?utf-8?B?aGsrcnJGQzdTRUEwSm9OVWRxU1JFODBWbjJmZllHbnA1N01Ba2txVW5SeTMv?=
 =?utf-8?B?elZVZDZvZjg0NEQ1UFNDSjNPaFE1Z1RlUUc1eTUvL1lZTGNBTUJzQm1kTER2?=
 =?utf-8?B?eVJaRGI3S0wvNDIvU1c0SXd4emtJMkZyUGMzSU4zWHpJTmJQNmNVOFMvMk9O?=
 =?utf-8?B?Y21wOFVQZy9FZklwbXk0eUovTWVDcmZwK0NacG5yME52eXlqZlphdklzc3RX?=
 =?utf-8?B?Y2ZYMkliODRqRFBIVldYcHJCVHRBeDJ2c3AzeGZrZWR6RzdHeUx0YmhiR09s?=
 =?utf-8?B?RHpFU3Z2WWNxSit2T05nTDFVNHVKVHk4alQ2YTdKSnVybDBFaEdFWDlYYk9T?=
 =?utf-8?B?Z3lITTBTN2YwK1Z4eXd1UVY2VkU1RkFQc3FqdDJZU0lTYVA3bG5lSUliOVAz?=
 =?utf-8?B?ZkxmSWh5K3F5Q2RKMDlrQVMxYnBPa3cxQTNtRkpSOVVaUUtCZkVUYmZyTUlu?=
 =?utf-8?B?a2dTejBPVm1iOHZXV0ZRK2o5ZS9vcmZHcU10dmpVcytkeHVWOXdmTTlCT1g0?=
 =?utf-8?B?UEV4YkxOcUdUdzhyWWJMMUQ5VFVUOHpGMlgzei9vbVhhTEhPaG81Z09lOU15?=
 =?utf-8?B?Q3BNdFNiR1FPZ29aRGh1MVZFOXNOUkFDYitibFNrbFlXOExDYlFkdTBhWW9w?=
 =?utf-8?B?b21SM1QxS01rWmVJTHRPNTFoRnRNWWE1WFR0eGdYcFlvK0ZtZWZWYmtvUndU?=
 =?utf-8?B?aUozZnpqQkhPV3A5QWFlVVI1Y0pjN054WTdLQ1N5dDIraEs3VVUyaVdyVngy?=
 =?utf-8?B?Qzl5NERLMXB2UDcrWEZ6U3NuVWgwM1cyMmRXNFdSVUs3S0xiRVozNjJOWndp?=
 =?utf-8?B?dURBNmMrbitHd2t2Z1Z2NUhxYThmK210UFZNOWFhUzdPZVFRei9QSWtEM0Fy?=
 =?utf-8?B?MkJpMW03WVlKRDNXbUt4THlDbGFEVnZjNFQrQ3pmNnVHNG9OQWRweHg2RE1i?=
 =?utf-8?B?bTZVQUFjYk9mWUVENDlrQWJJTkQ2d1VoSExLRDJBU1huSndhUWtlOXdxckpY?=
 =?utf-8?B?eFRiUGhhZk05clZrdTZCK05sY0JIcmVzOFM3ZTNzZEkrQ0pPeFBNK3R2Si9Z?=
 =?utf-8?B?aTlLSWtBM2VEMHc1VVFUOFFqYlNlcXM5bEhBbVVld3NrbUxQc1dnY05IZVNO?=
 =?utf-8?B?ZWxvQmhIbVFGclhTbTJLNkxPQWl6VlZFclRLNjZkOVR1UlErRGZTanR2U2dG?=
 =?utf-8?B?amg0dDlFc1JVVDhiQStyQllrdXZBbWk2b3NQZ09ScFVHVDlMa0VyeEFnN1dQ?=
 =?utf-8?B?T2pUWFdxdVNCempnYVcrdEhGNkVhY0lWc0VKY3liUjkxYUNoQXpnRDlQdHlH?=
 =?utf-8?B?VUpOMm92QjhQdlE2blhucHQ1QytQT0o1OE01ZE5jNG5qUFJ3ZkxTcFkyb2NT?=
 =?utf-8?B?a1Q4U09KeEwrTWVoZ2tHRVNHWlprWWxKUHNzdjlCNVZQdllVT2hmWCs4UXpY?=
 =?utf-8?B?MVRQckIzOUdoVUdUMnN6UURtcGcyWFZ5K0laVkQ0OXlPa0dFeHBZeS9XTE03?=
 =?utf-8?B?NGlwZDVTZDFFY1NrOXE3T1JxdXlLUzRwUkl4U1R1RnVaR0FxV0dyMGQwVjdt?=
 =?utf-8?B?OEtiMmN5OFpzZG8veVNnNkFkdkxKUGRPLzc0TFZId3RxL1NacFJkVGhUU3Nz?=
 =?utf-8?B?T2pRL3dsdVhTbnJrOVBwSHhYTkRzVFVzbWNyOVdGcVovQXVQN1dLdUpwcFVm?=
 =?utf-8?B?RXhhc2lRd3dhb0tpTHR2UG0vb283N3FtTFArZUI5enZTTCs3OU5zaHFnOEZx?=
 =?utf-8?B?TldCVUxzckpocS9QcXV4Z0dNVGEwYXl1VjY1T1hCOVVRTWRYb0QxOXZXYUlw?=
 =?utf-8?B?dVk1MzZoR1J0bGRQRUVKaDdCT1FBa3R3Q1JBTEMwa0VyV0RsbzNOQWxMaHMy?=
 =?utf-8?B?bE0wbVhLS0lCTmhTa1AyMnZqdnB1M3pxaDNXRHUyVzRtamZjTG5mSnc4ZWRK?=
 =?utf-8?B?a2UvZ0ZmQjhpMXQ3cDlibGlna29uYW9rbjVuL1kvSmpRTGpBaVovNXloUVZV?=
 =?utf-8?Q?JSBfUnreDCMej//U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fabc6ede-a22a-40cf-b45a-08da2b5761e7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2022 09:45:53.4039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nKBD3Ah/MaGKo2SCrWHRsrK8vqtPGzivNR3jcCv5ntuq5vFmfivH6Pempq8KymTi6v4GVuffXCdTXHh5lHHPBGUIJKpisNKszvJPdJ273s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4062
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
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

On 2022-04-26 11:21 PM, Pierre-Louis Bossart wrote:
> On 4/26/22 12:23, Cezary Rojewski wrote:

...

>> diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
>> index c47f85161d95..de98f4c3adf8 100644
>> --- a/sound/soc/intel/avs/loader.c
>> +++ b/sound/soc/intel/avs/loader.c
>> @@ -15,6 +15,7 @@
>>   #include "cldma.h"
>>   #include "messages.h"
>>   #include "registers.h"
>> +#include "topology.h"
>>   
>>   #define AVS_ROM_STS_MASK		0xFF
>>   #define AVS_ROM_INIT_DONE		0x1
>> @@ -466,6 +467,70 @@ int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
>>   	return 0;
>>   }
>>   
>> +int avs_dsp_load_libraries(struct avs_dev *adev, struct avs_tplg_library *libs, u32 num_libs)
>> +{
>> +	int start, id, i = 0;
>> +	int ret;
>> +
>> +	/* Calculate the id to assign for the next lib. */
>> +	for (id = 0; id < adev->fw_cfg.max_libs_count; id++)
>> +		if (adev->lib_names[id][0] == '\0')
>> +			break;
>> +	if (id + num_libs >= adev->fw_cfg.max_libs_count)
>> +		return -EINVAL;
> 
> use ida_alloc_max() ?


After reading this one couple of times I'm keen to agree that IDA should 
have been used for library ID allocation and a at the same time, 
surprised it has't done that already. Till now we used IDA 'only' when 
allocating pipeline IDs and module instance IDs. Pipeline allocation is 
good comparison here - makes use of ida_alloc_max() already - library 
one should follow.

This finding is much appreciated, Pierre.

>> +
>> +	start = id;
>> +	while (i < num_libs) {
>> +		struct avs_fw_manifest *man;
>> +		const struct firmware *fw;
>> +		struct firmware stripped_fw;
>> +		char *filename;
>> +		int j;
>> +
>> +		filename = kasprintf(GFP_KERNEL, "%s/%s/%s", AVS_ROOT_DIR, adev->spec->name,
>> +				     libs[i].name);
>> +		if (!filename)
>> +			return -ENOMEM;
>> +
>> +		ret = avs_request_firmware(adev, &fw, filename);
>> +		kfree(filename);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		stripped_fw = *fw;
>> +		ret = avs_fw_manifest_strip_verify(adev, &stripped_fw, NULL);
>> +		if (ret) {
>> +			dev_err(adev->dev, "invalid library data: %d\n", ret);
>> +			goto release_fw;
>> +		}
>> +
>> +		ret = avs_fw_manifest_offset(&stripped_fw);
>> +		if (ret < 0)
>> +			goto release_fw;
>> +		man = (struct avs_fw_manifest *)(stripped_fw.data + ret);
>> +
>> +		/* Don't load anything that's already in DSP memory. */
>> +		for (j = 0; j < id; j++)
>> +			if (!strncmp(adev->lib_names[j], man->name, AVS_LIB_NAME_SIZE))
>> +				goto next_lib;
>> +
>> +		ret = avs_dsp_op(adev, load_lib, &stripped_fw, id);
>> +		if (ret)
>> +			goto release_fw;
>> +
>> +		strncpy(adev->lib_names[id], man->name, AVS_LIB_NAME_SIZE);
>> +		id++;
>> +next_lib:
>> +		i++;
>> +	}
>> +
>> +	return start == id ? 1 : 0;
>> +
>> +release_fw:
>> +	avs_release_last_firmware(adev);
> 
> why release only the last library and not all the ones that were previous loaded?
> or why bother to even release the last since at this point you probably need to restart completely?


Yes, avs_release_last_firmware() is used to clean 'locally' and indeed, 
failing to load a library will most likely end-up is complete restart.

I'll provide an internal build with this part removed and have 
validation do some testing first as performing 
avs_release_last_firmware() keeps things sane i.e. no invalid entries in 
the ->fw_list, no unnecessarily occupied memory for the already invalid 
entry and such.

In regard to *why is only last one released*, it's tied to how base 
firmware behaves. Assuming a scenario where two libraries need to be 
loaded, if the loading procedure for the second fails, base firmware 
will NOT unload/unmap allocated memory and resources for the first one. 
At the same time, there is no capability to unload library on demand. In 
order to rollback the transaction, DSP has to be shut down entirely, 
just like if we were talking about firmware exception or IPC timeout.

So, by doing what we do here, driver reflects firmware side 
(MODULES_INFO) basically 1:1.

Another good one, Pierre.

>> +	return ret;
>> +}
