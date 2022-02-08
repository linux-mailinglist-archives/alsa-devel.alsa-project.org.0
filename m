Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5864ADE6C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 17:36:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A0891733;
	Tue,  8 Feb 2022 17:35:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A0891733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644338175;
	bh=9MOw1u4kMJncdBfxGzdsK2BhzGlicyOLxCqneYLaNcI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h/EJbiK8F1ueACR33M57piLAldUMx80D10dqf+Sk09jj7DrUr1aj7wPh+BuyWt1bY
	 WC9xbw9+XEHmV5BLFGTyE8Bf4YxLbhzpJElXi5Em4IHh58ERwTU9/u11yO0TpaGy/O
	 yYQeA2I+1c1enUQiNYJEqBHlfHX6csd2rEbfY6LE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E287CF800E1;
	Tue,  8 Feb 2022 17:35:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A688F8013C; Tue,  8 Feb 2022 17:35:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 583DEF800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 17:35:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 583DEF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Xj6Lkw/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644338102; x=1675874102;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9MOw1u4kMJncdBfxGzdsK2BhzGlicyOLxCqneYLaNcI=;
 b=Xj6Lkw/2I58Mv2SxDkZ3RQtjv8VeeYN9EtMAt84mDbNh2295tURLX+V9
 LCsnJ8H3gi/+TaEUwF/Tgt4TFUGQ8fzloEM83Sv7LsJGsmuFhyc4af7Wq
 gJkLA6bBgJyiRIll1FAOoK2sJAe9m+KfuKhTZdLmeQVcEdXBFu/DUEx8a
 2cItKKT78DN7AX2BeqyIaM9Fbfu/ZRRmLTpMv5wRGO4RuuziTvzq+aCVv
 /gCHkK/6OyXujLHTG588y2Dckuo5H6hHAAvZxLOAntOka9dJPyKfGlad5
 n3WZzh7UTG4s2VY+Xe6+guADa0OIi9tN3kMOGhSqhfQRp0N8hTueXjwv0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273519367"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="273519367"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 08:34:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="481995157"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 08 Feb 2022 08:34:58 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 8 Feb 2022 08:34:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 8 Feb 2022 08:34:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 8 Feb 2022 08:34:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftAIW5tiX5CQ7OrQ9LBb6ebiY8q0GPOSOCexSxWrpfSrX82yZijMeZ929ezoMoKtT05PzD25U9CqpPcX81z6i6AOKegMCvkZYBNYHxeKpfA3tyCLFGs+pD8QmbC1YOh6bWoUaVg0sAaetTkQSsmE5nYbTU2LrluYFm30gn17KmcBU2lU3s/uoorWSxVeYC/QeBt0s2PdT/v7GJPQTNz9oQyfxDeDVUC6NsJIDJ990A1G+zOpuUSqxOPzUPtf5TunrQNSab/b9r+vj3262tgt6LP5QtCoQL8oahRo6c2SwCgQuZKVC9hsDBXh3w3AEKY2GjaAAf2yt7xatZQdc9BcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGrjyVUe3Qd+//p8x4SXMOc0sQlhRT+w9zpqYEEzZoE=;
 b=K5M/au37tW9RVYwZfnCSqAMxbqWXG+cMOojyO6ZUcpmOBZYgZkUxW/ny9/qZ+Qm1c9K6oHFmzpxw8Emu+Zn0OropxQWsdBefPqdD0DH+KF5eNBozk3T+JuFo1Sd7EbVrHLWqu8u7BHGCk6+kr2N6k/Gd5MMk3UgVrUQ5ADoeZ+te17U+Xut4PqgfEW8evNCiM1AgvW0XZB6ZVatb7ceu0BT0itfwWrYwE9XxK8FqirCA056a7EkgOPb+7rni7dqu+RPiATKIfXMFDC8A17HvvoXDk3/NF9yp/AxhA7I5ZfLSQER1/Z92YGuOOimkYfjSR79pSLn20U1+i+0xRugM+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MN0PR11MB6012.namprd11.prod.outlook.com
 (2603:10b6:208:373::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 16:34:56 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 16:34:55 +0000
Message-ID: <c144c67d-e6a8-1baa-82e8-37065c053919@intel.com>
Date: Tue, 8 Feb 2022 17:34:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
Content-Language: en-US
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <20220207114906.3759800-4-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0007.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::20) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e36e6581-ca52-44c7-6eec-08d9eb20f045
X-MS-TrafficTypeDiagnostic: MN0PR11MB6012:EE_
X-Microsoft-Antispam-PRVS: <MN0PR11MB60126987931F8CDEB9C42A4BE32D9@MN0PR11MB6012.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n/g+1NVKY8tFtJKfnjtLvbnXHBzZGR8av4eiKqKPmUjLKLnORC7p6DnXcMcRws9hpP0+ihWyPEic3ZFBqaMOOHhU+WlcM7VsfSMpYaf/4Cy0q8ID5iae5SInIQtOS2jIOO1UUb5YLahc5g0ZU8GOkulwJPOKVgBoDGuCDT8wnZIXc1/2MqwuiITlRgv24K22DCQXFzJs1kEeGfTe8Xvj+UAQiUAIqbD+4K5Ok9677r/srAHLUyUcF87cvrwjmDe5lsnlXx6MMXOuXlA2Mu0ZyxYaVxTvHPFcMHpOkhLuCn5yuWtgRZtfe+gC8/5EOw3jgZlWax5KtdSqKCOFaMokrV4dwVt/FjIX9Lud+4qYcTLAT+cAyo53g3j/QlpWm3Ak99FD7uXNBeUdx72g73Zv1H1bgHDZTX23l/Gdu+9Wk+/WtNWZufIOA00jQJ/k8O1WZzLtEETH9EVsIXKKII5HJOVXC6MLGMWoXrIpe5jA3bU40s2076w798rVkRLH53qqExRmXtd1WtBZ6wpD2KqME4oB20e3DGSBuG+MhYk0mvh+14W7kr2JhnfBoq8F62LOAP6qidzQwzf7eAnd6+xltUsC38dl29FdcQP66pvu488mmtCvmE48rPG4BPnM61Q3q8WR8/TfCJST8Ynoh4WIjjd0p4G69T1OoNKyfScQLrZHXzh6pqYYRXn6sId+EdLZDvf9SYflKZ8k+e+p6zBPXx8r3XtNj0kOOdaACttnXIZBnM84tkNOsbg6gMk41fTp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(15650500001)(66476007)(66556008)(31696002)(2906002)(8676002)(38100700002)(44832011)(4326008)(26005)(82960400001)(508600001)(7416002)(2616005)(86362001)(8936002)(6512007)(6666004)(6506007)(36756003)(6486002)(83380400001)(53546011)(316002)(6916009)(31686004)(5660300002)(66946007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2loNGhBK3M0YW1Kb1R2c0xsaFp2MFdoVW5JLzJOZGRxbnJ6WlZUUHcwY1oy?=
 =?utf-8?B?cW1pT3h4WlNVRXJ2Mm1mUHQwaFRHV2pySU10NDNWRm1LcmJZOExUblJTem4v?=
 =?utf-8?B?Y042RTUrQWpXU3hhd1AwRTFpNjZHR2duc21xT1NrdWlvVGtGTXJ5eEVzYSsx?=
 =?utf-8?B?OTdyaU80ZkJHMllkYXNQTVI5QTRtSjNjMEFIMkpHNDQxRDZNd3pXSnR5SFc0?=
 =?utf-8?B?RWFQS0VnVkdSWS9BUmhBdGJmZ2pJZW5VVVhyUXpRbFVBZkZrL1dkRUpZM3ND?=
 =?utf-8?B?UWNZajRlTDBBLzk3Mm42ZnNWc0dGT3dtUFZOTmZZNllRL2pxVytKazVHRmYx?=
 =?utf-8?B?U0g1Zyt6L2dMMmhGblZMMEo1RFdqRzlhMWYrSDM0bmRBZDZOb2NCaDdjMHZS?=
 =?utf-8?B?NFBhamZuTWxqQmhIdDBnbC9yRmlDTThpQkJOcG1mSDkrOVlHVUUzK1ZoNk9v?=
 =?utf-8?B?SG5VbjZxSC9Hd3BTYmFhaTFZajFza0VlNnFvK053STVBK1dDbXRxQUt2Mmdn?=
 =?utf-8?B?VXRhSVExcmRLbm9zangyWmtPSm9IZnNFZmR1a1V5VFB6cGN0eHNYZE5SaWF3?=
 =?utf-8?B?RDl4OWtnenJ2c2xrNEJleWdZYkY1bjdyOXV0M0JVb2tLbGhxMEpkNmtSVG1C?=
 =?utf-8?B?N2JzazhKdStsME5JdGc5VmNJT3RlN1FpV0VJNVlITmR3bllQKzZocUwwVytt?=
 =?utf-8?B?bDAyR1dOSkI5Z05JNGQ1bE96NGo1Y3QyRmFXNE83MHprOGZ2dVNteFB0R0JL?=
 =?utf-8?B?cGZSTmx6K0dDRlloZWQxQldsb2E3Zmw1TnVaNHFtOHZQNFNvWlVKbGczb3R2?=
 =?utf-8?B?ZkFlKzdiMXVCdUliV1pibHlwMlpWZFhvWFVoMFk5c1A1Vjl6R1p5bjJDVEs3?=
 =?utf-8?B?RnFJZmFQTHEwVC93YldPVk1CeVRlVFVVUmhSVjdqaC8xQkN2RlN2TStaTGNo?=
 =?utf-8?B?S0lyczRVZ1VyZmhqYklrTEd2YmR3a1FJWURVL1dOa3cvUUhKazRINlJnbHBQ?=
 =?utf-8?B?aXpMaUMxSjRuTmxHV252c3pLMkJPckxmLzJWeGl6aittWThyb2VsaEQxckl0?=
 =?utf-8?B?aVdMYjk2b3VEWEpQVTZpeHBydXhGa0FaMVNqbFdsMzZyQ1E1aWxEY09FM2FM?=
 =?utf-8?B?WmNLdDFGWi9PWTAyZlFmNVJ1ZG5EakVIOGdvcUprUVZNeVh1SWZUeVJGMjJm?=
 =?utf-8?B?WEorMGlsTkZPNWRFeVQ0TndrbEtVSkVjVXQ5Wng3aSttc0ladG00U2RLVWJU?=
 =?utf-8?B?UytRSXp2K3BaSmRVWkdvejBNU0FjcXFnWXVJcUV1RHJNYVlyMWFMRjFSRjZI?=
 =?utf-8?B?SW5taWYyaHhwMWIzc3lhNDFnd0hOdkhoQW1kQnNLU2EwM0wwdFdoeFNWeWVr?=
 =?utf-8?B?OFZlMFlPcExqQnpxMy9Tb3NmcktuM2h5ZHRGQkpIUkNJTFA5aWNzeTRWQys2?=
 =?utf-8?B?VVhORjZYdWZRdzduckk0Q0ppdEYxL2xleUtOenVncW1Kc0ZiOFZndjRjT1NM?=
 =?utf-8?B?MXp0V1dPc1VtK0xUenBZL0JQdVpQbExJT0Q5QlBaWUE4MnkzKy8zS01VZ3hx?=
 =?utf-8?B?cElLcjFtaGhGS0FPVzl3anNoUlo3ZzdDTWNGcHBGMUY4d05YdDNkRGhKSzRU?=
 =?utf-8?B?WU9nL3dGcU1HcG05QUNPNlVpb0IrVmJaT2NSQjhlQTFQYjFiRHY1TE9VclRz?=
 =?utf-8?B?WFNreVhMdVFzeUVBRkVkYklzNUVlS3RLRVlXN1Nyb0EwOGJNL3RGM2lSUDkv?=
 =?utf-8?B?aUJFM2lxT1lja0lNVDB1L1JEdGVOYU4rWlNmeXVYekROa1Z6MEZPdjh4T2w0?=
 =?utf-8?B?UFVyeFJIL0FjSHVJODJPNnc5WmJVeVU4ZHdHSjBmbGxkUzRMVGlieU1ialp6?=
 =?utf-8?B?dVRZc1hVb21lRXVRV3BFc1p1OWVOVlo5Ym1tQkJmRTI2K1R0aGFldjFSQVVp?=
 =?utf-8?B?QTFRVnNOb1dvS1g0S2E2bTFZa0N6dTRzQlhHNXlsM3BROHAyOXBEeGxuVE9S?=
 =?utf-8?B?OW1hTWFqK0FFRnMyb0pTZFgxMGVod09Vdk9SN0ZPeUdhbEtSSHlNT3BhSUZE?=
 =?utf-8?B?NXBLOGdYVFF2SnVLdkF5WGhlRW5MRzRHYXlyZEFiek5NY1Q3eGp5bE9NODJ1?=
 =?utf-8?B?YkMvb0tzbElxK0N6M0lnaGl0QnpiN1VQWmpTcFRsZmtqN0FtM1B4QmV3bDNG?=
 =?utf-8?B?RHc1Q1ZQL0xDRXBwNkUvTjlrRnFxOWtETnI2b2N1RHhsbGp1dnRyNm15bVBx?=
 =?utf-8?Q?0v5q0/F1UPM7Hnqp2eFHPgbn62kuhhUL4DxmajfCrs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e36e6581-ca52-44c7-6eec-08d9eb20f045
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 16:34:55.6261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6R7Ra4Vpj1Efla6S1HQLMkpBgdJQRSBM6/ftg826r+SXZYjjyjCKCdaoNVWMxFvypJBQauiEbZAQLLt8aUCzLVuTYJk8lOCWQ/uwLGw4PkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
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

On 2022-02-08 4:54 PM, Kai Vehmanen wrote:
> Hi,
> 
> On Mon, 7 Feb 2022, Cezary Rojewski wrote:
> 
>> With few changes, snd_hda_codec_register() and its
>> unregister-counterpart can be re-used by ASoC drivers. While at it,
>> provide kernel doc for the exposed functions.
> 
> thanks, there is no doubt room to improve the HDA<->asoc interaction
> still and increase reuse. Some questions:

Thanks for taking time in reviewing the patches, Kai!

>> Due to ALSA-device vs ASoC-component organization differences, new
>> 'snddev_managed' argument is specified allowing for better control over
>> codec registration process.
> 
> Can you maybe clarify this? The existing code to handle the different
> paths is already quite hairy (e.g. code in
> hda_codec.c:snd_hda_codec_dev_free() that does different actions
> depending on whether "codec->core.type == HDA_DEV_LEGACY) is true or
> false), so we'd need to have very clear semantics for the
> "snddev_managed".

It's rather straightforward - ASoC does not provide you with pointer to 
struct snd_card until all components are accounted for. 
snd_hda_codec_device_new() in its current form needs such information 
upfront though. As we want to create only as many DAIs (and other ASoC 
components like links and routes) as needed, codec's ->pcm_list_head 
needs to be built before codec's probing can be completed. But in order 
to have hda codec to fill ->pcm_list_head for, you need to create it. 
And in order to create it you need snd_card pointer which ASoC won't 
give you before you complete component probing.

Typical chicken and egg problem. And that's why additional option is 
provided - it solves that problem.

>> @@ -940,12 +953,13 @@ int snd_hda_codec_new(struct hda_bus *bus, struct snd_card *card,
>>   		return PTR_ERR(codec);
>>   	*codecp = codec;
>>   
>> -	return snd_hda_codec_device_new(bus, card, codec_addr, *codecp);
>> +	return snd_hda_codec_device_new(bus, card, codec_addr, *codecp, false);
> 
> So this sets snddev_managed to "false" for snd-hda-intel? How is this
> expected to work?

Good catch! It is supposed to be 'true' by default. I checked previous 
'releases' of this patch: between internal RFC v1 -> RFC v2 this mistake 
got in, and probably because I've rebased the driver during that time 
and run into several conflicts which I had to fix manually.

Will update in v2.

>>   int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
>> -			unsigned int codec_addr, struct hda_codec *codec)
>> +			unsigned int codec_addr, struct hda_codec *codec,
>> +			bool snddev_managed)
>>   {
>>   	char component[31];
>>   	hda_nid_t fg;
>> @@ -1020,9 +1034,12 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
>>   		codec->core.subsystem_id, codec->core.revision_id);
>>   	snd_component_add(card, component);
> [...]
>> -	err = snd_device_new(card, SNDRV_DEV_CODEC, codec, &dev_ops);
>> -	if (err < 0)
>> -		goto error;
>> +	if (snddev_managed) {
>> +		/* ASoC features component management instead */
>> +		err = snd_device_new(card, SNDRV_DEV_CODEC, codec, &dev_ops);
>> +		if (err < 0)
>> +			goto error;
>> +	}
> 
> I might misunderstand semantics of snddev_managed here, but given
> in case of non-ASoC use, snddev_managed is false, this would
> mean we don't call snd_device_new() at all...? I don't see where this is
> added elsewhere in the series, so this would seem to break the flow for
> non-ASoC case.

Same as above.


Regards,
Czarek
