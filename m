Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4494786EC
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 10:19:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF1E1ED5;
	Fri, 17 Dec 2021 10:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF1E1ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639732797;
	bh=tIRNGLfgfAXgvsXL/8JdAMZSDDCgp4mLlrCCpBa0UYY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AIDiyolV64rQeILg2otOs/vPsM2ZjnKTLC7tmXiyzgDQ6+J6Mx2yLUQ9/x3HhQtnT
	 FnnfXwwW+MsWe4bFw6Cfk+1o7FdLA8uzzcRc8TYe4u4ZMME61fZYKsMtW8hv+wK1C5
	 hIweSlj9CTgaQoguDtx1+73KXZqb0GMzzqpKroP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB09F80161;
	Fri, 17 Dec 2021 10:18:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFD89F80143; Fri, 17 Dec 2021 10:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FB30F80143
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 10:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FB30F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KTJGIxFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639732722; x=1671268722;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tIRNGLfgfAXgvsXL/8JdAMZSDDCgp4mLlrCCpBa0UYY=;
 b=KTJGIxFtfvtNLiXW+cNkuYnLFDgk9VOFMUNV8EYO39J+NEHcXvGRAids
 UsiEyLy2+k31akZAHgMBDyLNrOiQ3PfhQTIFiz7qBc6L9xGtEfrVUoU+L
 ZvcuWgTG6Bdsb9kqcaEA4e6iJfiU+TE+3B4ZMDkqxuJGdPFFekXDZNBqc
 nMsXksMrw+B0XOKd9UA0pX6fSXLCNKNrEj8gLiPTWD4fpOWAUFAymWGfb
 GGMv8NMDK8YKU1/lUe0peIH/5WtJ2kI6XPFAwu2a4DIZ1nJ+LQgoGT9FW
 TZeqbbKbZS0MC5ctsVBCVjOHVOfJFu1nRTaf6lOUBdBGkbzByqJQK82pt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="227004652"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="227004652"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 01:18:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="506699230"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 17 Dec 2021 01:18:37 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 01:18:36 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 01:18:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 17 Dec 2021 01:18:36 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 17 Dec 2021 01:18:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmUn8KCxA7Vo2mJ6PQV9qKKlE1qbDrd0Hmcnll/6RIKe0QFpvb5YFhhlK1xEj+pu5VTquxqFwXhoeGdR0iFhcNszkAsocFM0/qISS4dJL1GnGiNobDysneYm5ufuLaB2xMCwsInxuk5ZjyKWc1++pyxB5g87yVHMxJ9yVmLPDCjK2/EojLyRC61fCZcTjcF7Wao7PQznoqOxbbPLa65K2LEgN5LRy693PqIwQvdvBQLd9c49EqnTlCy8kdzRYKod+kl9W52JacPzwUYs2B4w7hmX15Gm39o+Fibdk4JA4sGY/mPqYIB3zssbDEzJqeq74Z6678lAzpxBMoF7xjNRlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VLyHDaiVGpPngqZYyXDvV3GRxORdzCB8Zrap93LP/8=;
 b=dn81u6k7a1BuT543ROX61WsFg8isQKk77322GkJywLhQ3HSHF5Hgsn+cBdagBlKzcv0ERIclXoYexIAVALq5FVL8Yi5QYOo1YiN3IA2sROY7bURQ0IFcnb4fS4h5xNte66PCmuyRWKhlYAEhJFe9eAard7u5WsSieQfS4dmNIRi0lZVHbNtvheTce2xrOWzQ/mAMMuGy5TMw0RfpqFr8drbQE2OD4XF/dCjpoG1yLj4pka/y1+GQ2jD7+kjQm2UK9WGtbczOtyj+/djAWHm5ScSjYgcMsqUevT77JyUfMZziw/xhWb8+iyMunlRmuuqKFRGG3PTbuuQW7Jp/ZPyKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR1101MB2163.namprd11.prod.outlook.com (2603:10b6:405:58::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 09:18:35 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 09:18:35 +0000
Message-ID: <7d4258e6-3ac7-8933-4675-0c1cd31cedac@intel.com>
Date: Fri, 17 Dec 2021 10:18:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] ALSA/ASoC: hda: move/rename snd_hdac_ext_stop_streams
 to hdac_stream.c
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211216231128.344321-1-pierre-louis.bossart@linux.intel.com>
 <20211216231128.344321-2-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20211216231128.344321-2-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0140.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::45) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b57887c-84c5-4a6e-59eb-08d9c13e33cd
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2163:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1101MB2163C3C372DC12EE135900C5E3789@BN6PR1101MB2163.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q2xgo1Ep/yhfqAqVrjT4sp1P8JodNas668BpLTGPwly9RFbIXum5Ss6MOXF3ZTQKS0XQz8DJs+PFzZskhHbA0q9vLCXrSV8V6yatgIx8QjB+jLnitLx4ycFAiBPyVprfFry1kKDJ6lwhMc80eJYPRrH6D+dTlGbTBVe0JZ92B5xAeqnVz7a+4Tdw3Nsu+RNIH+CAOAjgfEjMgW376qehCo1IhXY75zIVjiaKWZ66BjCdX+UUiRcadLuwkJ4JvvMJGku7mTKvRewkpefOtQuVHtlPASbcTLlXwO9qYdMGfZYMw/vmBPNzgJ7BTGeVPbMAKGdrY2X1xa4b7+hsI1R9tKpClp1TC11KW4gobjsHeLPkgXopD4EsIX8HyteE50zkXCGdyBU3VwSEeuE/r1AVbulQ1/HwBmJG7fIICe/xDC0AlPMRoWkYQJpNTKr3F9J21bKQ4pXsJe0wD/YfrzW3NcbQkY69x/BZTkJIVTGMU990WSq5hqH1WzTfcTsd61c1lLhx49zfLcsydz6wioKRaEWOyKJA1LlDtKFzB5xBvTkBPgym6DBvpelxyl1PBjErmZTde+Z+R+V1SGmD5A/BHQxkpmz/Soky8CjWwxQKeT26IFkGWU2oIF+plcac8m3bpJuhTsrcCWE476WyOxwAyGS3qqJNOjkkZPQZ5eSutg51taDvzZwcWfZKRusbZt3221dlcBOT1rlzMqXQppK7XpM8Hg8amzHUfSRwxbJ/bVYutw1d8jQ4YYB2oF3fvLMZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(53546011)(4001150100001)(31696002)(38100700002)(36756003)(82960400001)(26005)(31686004)(66946007)(86362001)(66476007)(66556008)(2616005)(186003)(44832011)(508600001)(2906002)(4744005)(4326008)(54906003)(5660300002)(6512007)(6666004)(8676002)(8936002)(6486002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alVuVkdWbXNWR2Z5WXVHVGdNaVlwWkpiU3pFV0dCM252S2o4RXlLZGp4SFA0?=
 =?utf-8?B?d2J5TWQ0MUlNTHFQYlpQMHVTQlVYU0g1Ni9XRGt6d1g4T242VXM3TmhSS2dh?=
 =?utf-8?B?Y0p6VlJSbllTMkZsb2FpdHBESG4zZlg4ZDBGOVBIaEhKUUxadUdtVUNrMGJE?=
 =?utf-8?B?YklOZk5XUkdsb1Zja0EwdXYrZFZ5cU5pbVVOZTB0aXplcWxmY083VEZXQURD?=
 =?utf-8?B?eEM4KzdTNlV1RW51UUFrL0FpL29DSzJISjhWTnN5L2hUVDlRc0xxRzhIdGs4?=
 =?utf-8?B?TEsvTUJxUXJJR2I3a3JxVkZHSHBKMTJqbTByU2sySU16aWFqV01CalhQSnhU?=
 =?utf-8?B?U0Y0WGhxek01czZOaE5DOHQ2S0I5eHFOTUIzUEFtV1NTcDdOeU1MVGEzNWlD?=
 =?utf-8?B?Z3p1NXNRRTR3TUpGaFJuQlJjZGk4T2FEVmg1YWRydmRuUWxHVHZzSmF6Qm54?=
 =?utf-8?B?MkFIWjRrNUdKcytnOFU2TVFGeEhFb2piRkhVRi8wTDFoTXFYenhXYzRFSG42?=
 =?utf-8?B?NU9rdWtoaWQ0V1JweWhmbzdRY1VVVkxEL0xZU3ArR20zNkZ0djZyUXUxOWlQ?=
 =?utf-8?B?d1Flc3pSSlZvcktMT0lpNE9Xa1BqK0tTaHNTMmZ6THJEd0F4SlNibUJrcWxl?=
 =?utf-8?B?R2s0WTJJc2NsY0wvVTJ2VGhhRWZqWG1KSGtmSlFWMk5OaFFGSmdjQm04ZUZi?=
 =?utf-8?B?VDlGKzJ0VHFjbTFWalZXNE5aQnhna1ZyMmRFT2xReFRRTXgzcmo2VHkyY0ox?=
 =?utf-8?B?S1VrVXhtNWR5eVF6ZUQ1QXFUMzRBL0tXKzJTdmwvU25YRy93QXBlalB0SDUw?=
 =?utf-8?B?eUlHYWdCazFYYVYzandqbys5aUtBQWpsV2ZST2l5YUdhWXhLS3dTVThrRXhJ?=
 =?utf-8?B?L20zMFgvNzNETWJBVlc0aHY2SVNDOTZDU2hzNFpUN0NtMWV2Y3lObmh3cVR5?=
 =?utf-8?B?STFQQlRrazFjZkJrTXNIdkJobzZKcWtTdGRHV01tZXpEMDBYWUU4ZDZUMFYy?=
 =?utf-8?B?bkZmbW5GSy9DTGJjTlpqV2YrWXErcnlqR0JkeHdCTnNQRHRjc1R2eWFzRi9m?=
 =?utf-8?B?R2FWcU92OXVnRkZ1Ri9lVXFFQzJpcFI0NFlmZzZiUTg1SG9HOWNQZ1VmZEYv?=
 =?utf-8?B?Sjh2UmtpODZUQmpzemRGSWRIczJmWXR5TnNvQ0tOMm1Ebm0xeFhMYVpYRjRE?=
 =?utf-8?B?TTdIWXVrMk13M3VYRk9nSkxCL3BxUW00bTNlUFRhemZsNWwvK1NraVp0RjZh?=
 =?utf-8?B?R3FuM1Uzd2pJeHpsYXVUTFpMcStGZzZGbEQ5TjlaQlZOSlo1WS9PdUt4UzM3?=
 =?utf-8?B?enRVK2ZwOGZ0cGk3bzBpZTIvYVFrQ2VBeVFpQUx2aGc5UEtNUHdYRi9aMmlp?=
 =?utf-8?B?ckNZVFR0aXhkYzdJY2tRWmJKVHF4eDR2ellBd284dFBiYkpPSG84Z1hjNHNq?=
 =?utf-8?B?ZUhhb3J4UTFiNk9sVlprRGR2SWgwb2trNitOdGlLeUdPcDJsYjJKdmRMOGVL?=
 =?utf-8?B?RGQ2dDc5SFB4REZjS1FQT2F0cTd2U1ZaUEl5WGQ5UDZPb2Zsd2IvYnk0bW9m?=
 =?utf-8?B?LzBVYXRhUm53RkxvMFFzREYwSlpzZDhDTnAwUjlRN2hCa2VYeXhEQ2ZndFZ6?=
 =?utf-8?B?Vks0ZUxJdkxBV2UyU3FKSDRMWG1pczJiT2JWdnZ4YnU4cE9kekpvclc1ZXF2?=
 =?utf-8?B?dWR1RCtQaWN0cGZtNXFzUnhlVTQ1aHlEYWFaY0tGTHNqZ2hScEJFYllOVE9S?=
 =?utf-8?B?RUVpSk5rQm05aXA2RVFYZlhZVVlYZFYvQWhQdUhOKytEUHdyVkVVallQdDdO?=
 =?utf-8?B?RFpDbGhsSXJDOW02SVBGU2EvZ2JMY2d1M2VObW9XamNsQXVsOUlUV29uN0dh?=
 =?utf-8?B?Zm1kcmM0d0JodWg3RldoVCsrOEZkc2dXdFZEQ3N3QW1zdVMyZHJSN1lvUlBr?=
 =?utf-8?B?TTRUTXVEU2liNDdKVDNUWWVrQkFBdncyeDM3b3loMGcyUXhGNFVnaUF4d1hH?=
 =?utf-8?B?d0JDOTZLOG1FaDFJYXhxUERZdXdQWWs0cTNiSWhQSkdIdGRiTHpWOWVnaERQ?=
 =?utf-8?B?OUU0cjI5QTRmYkFjL2g1M2liMlQraUNvaC9NVys2ZXc3K3hVQ0lBNWtDcmpt?=
 =?utf-8?B?Y2xVekczQlZxYWNnSWZ6eDVobFYybzU3eU82c2ZyeitMQ256UUU5d2RlcStp?=
 =?utf-8?B?YnJycVVWOUMra3NDb0o2c2NHWlVVaGxSZ0o3U1Q2UU1mblVKNlBlZVJrSW9H?=
 =?utf-8?Q?XWkyPD6/ij2nQ+zdeqn6goUND/sG/0Ve3E7FZ2xwBY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b57887c-84c5-4a6e-59eb-08d9c13e33cd
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 09:18:35.2344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKiqE3FbSambk7clcNLmU7AnGBt06DS3A6eQZPXw6MAR3nYvgXMYJaLnZyfLC26lEr2wfNQ2aYDHsGYbk+8R9aWUssALY1y7BsBMGviWds4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2163
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, Kai Vehmanen <kai.vehmanen@intel.com>, broonie@kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On 2021-12-17 12:11 AM, Pierre-Louis Bossart wrote:
> snd_hdac_ext_stop_streams() has really nothing to do with the
> extension, it just loops over the bus streams.
> 
> Move it to the hdac_stream layer and rename to remove the 'ext'
> prefix and add the precision that the chip will also be stopped.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Change looks good. I wonder though, if there is a better 'name' for the 
process (here, stop streams + stop chip as a tear down process) than 
'stop_streams_and_chip'.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
