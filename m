Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00820425B20
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 20:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95797827;
	Thu,  7 Oct 2021 20:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95797827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633632469;
	bh=Ki+O8ED0qRRhYxg77zCufWQradfVqRwKD1B+gaV9PAs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LcNcyOHHnJySCPDXtC0y+9jxLUCATXDYV4csDrOqF+Il6PsDISyk3ZrqLfWG05UkQ
	 qIgkMkEOPeqsb1IAdB79oArcrAFo/lxb/KObbQxn5flDBGeb0k3W/9d9fAz2YmCdJt
	 UQrVqN+kVtX8PFFPVKitYNe76W60Lt+0Ws5yS3rU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9C3F8028B;
	Thu,  7 Oct 2021 20:46:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D889BF8027D; Thu,  7 Oct 2021 20:46:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79C52F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 20:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C52F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="DkG0UL8V"
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="312529212"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="312529212"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 11:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="560677007"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Oct 2021 11:46:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 11:46:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 7 Oct 2021 11:46:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 7 Oct 2021 11:46:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1vXcpIgO4zO9ks+DO2XSsuCdHTGr+c2KoriIS4kxqSdWYI/PLjywDtdUK2MISEoD78uNeMqk8uUguMTUyFPyI3ZLg/qWLB7IQFcTF9r+oIU9cftEKo9yLmm1X+qR0W62KyOastMfWoi+o32EKBtDJyz5KoONw7JqfxG4/qGebhUmxaFAcUh2YBIa+ZhHDAe5TxaNfyrmXbAhIaCvdkRga05EB9Rl9gcarmH4Y3HJM+tOMlBQSJWfTcniB6Z9/NbXRkp8bf2tNcMNRFSpxeDn9GxVl5ty/QmIfAR33+TTBPM6pvjHqPBBYtD05SbJayLKvhMZDiDY20uziTy2oD7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwW9b2k5b9uV9LpV/gnsl5s27Z/QCHy7jrKELYB1Phw=;
 b=fUzys8MuMXTIdbnvbycV2kYVV4mnPUTQQEIHFwti3dmSCGIEgE1+m02l+3muDayGOnPz/xZ9dTmN7qSEr+Q0bJV3UlclNGlp9BNvCBQr59fqqjhzlUcAVU+HGCmiIONl+Hm5An/J5Bwjnqx2sXI7DCDp257EShMTCGnoHw14IrljsWbuo2+SFY+ufAX68/fhV2weh+dhXUtJQ8zuMzdlezuiTsVtyK7uO6o7eFP4ZiOXUviZIZrXQl3a25vVV+76eeyTkyapT/1nQf+ME0odVkeltDQlq78/vNgnw3Tf944cZA0EE33tNIFdTbbXi78ziipfvoc9k7ek0RUzQaUeFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwW9b2k5b9uV9LpV/gnsl5s27Z/QCHy7jrKELYB1Phw=;
 b=DkG0UL8VrgQekBYErRklBLF+LaygmCh0jWo6/Ul4LMaCd5VNJ3/QjYi3TFHwuQ3L6VucNf9/MNH/K/dOVPxzhrl1XnG3N3XvTzBYVtqbMtZxYW9y6TmQh+V2dgG3K/JSzmoDcSGvKgrwFFBZ9C4SLrstRPOwob8QL3ukmwXFdTY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN7PR11MB2625.namprd11.prod.outlook.com (2603:10b6:406:b9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Thu, 7 Oct
 2021 18:46:17 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 18:46:17 +0000
Subject: Re: [PATCH v2 1/3] ASoC: soc-acpi: add comp_ids field for machine
 driver matching
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Brent Lu
 <brent.lu@intel.com>, <alsa-devel@alsa-project.org>
References: <20211007133516.1464655-1-brent.lu@intel.com>
 <20211007133516.1464655-2-brent.lu@intel.com>
 <7e6cf92f-b889-aed9-b13a-615d4d5f9b93@intel.com>
 <2ae5e8ef-76cb-8335-e250-64b0246175f3@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <6d2eb853-60f4-73ee-a465-aaa4528c100f@intel.com>
Date: Thu, 7 Oct 2021 20:46:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <2ae5e8ef-76cb-8335-e250-64b0246175f3@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:36::36) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.109.202) by
 DB7PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:10:36::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 7 Oct 2021 18:46:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7686f240-ba93-4ad9-3e06-08d989c2befd
X-MS-TrafficTypeDiagnostic: BN7PR11MB2625:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR11MB2625521DEC4F27CD641FF0D3E3B19@BN7PR11MB2625.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L5TeNvr8GaV6FyHS+Z9Lk0gNx7b4QaeSsOLCljlsu/5IlanFrqlvXgFpfk5rls52YzJqASUTNj4zUZoKwbzzgvxtqFo7rtZAMQ3cUatMoui7DKl3OxUozednAgaakGD8j8+419uI44T3qBisWJj9pd/AVPxTDZKEPZ4W/CCRS4okkJ06YHGaxwFCXzu39M2rmsZbNSqQHyavtJIf/THLVx2K3EqKORHhVZS7iH9VefprLCgVxtu3ievdw1Ym1SVQlVXWuu8c/KxKJ/zI6qTch1lV5dNjnXAbb5QRT/Ibq/butLDTIDxSnZhGqgJOWC2Xu8Kd8rbt0xbMHrOXzjq3OugP8gkbYQzYBGlBYzZ+5vS2H2pNvXOlGwDfhAiQ8epDxoxeEcAIQtr+vESCoAdCpqjfm1bmrjP1INjn2LhNGoGfE3hld7pq/W+dt5OTCd9WVzLgwiy5R2u2Qia+3fo5yJIHptGZoPcQXXrkSDtWt79ApMiI4NjRNL8XNGqC3fnt+1kEvcAg+HywhVn5nV2b45OuRqXMeszg/UTboQ4bQJ7euO+JGcg5mrlToRDeS+FNjIXHxhN+zHcozNrR258JqC3iNU2WW77ISiBwo5C/Kv0TU0okSjxdcgcjZncJeIqTJPujJMvJdsnexu7G9PPpdmtWLI5MZcwPvZO1QVM5MKVaFBNafWkK0J5e5jB7klQYNeGcgbAjfbYCIG3e7D3ekf4vuzWELswdhvo6e4RqY8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(8936002)(7416002)(86362001)(36756003)(316002)(38100700002)(83380400001)(31696002)(53546011)(110136005)(6486002)(186003)(508600001)(26005)(16576012)(54906003)(66556008)(6666004)(66946007)(4326008)(66476007)(2906002)(8676002)(44832011)(31686004)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUFlVnlzbStmbmVFakpBdU9TdGorSURvYkJMSVhOL3AzRCs2eEhScCtZMDBz?=
 =?utf-8?B?MWNNRTQ5TjB0TUNpdWJPRHFxSHNZd2kycmlkZXpRVXpocGlXMVhLcXcrUzFC?=
 =?utf-8?B?bGNjM0hkZXFyb0w2cGloRjdtbjZIcjl5MWE5ek4rQkQ4cGNzeTFoVzYvQ1VQ?=
 =?utf-8?B?SENLekp0MW4rWGVaNHlYQWlnQitOY0duc1JEWEI4b1dXdjUrdlNSdDNRVjdl?=
 =?utf-8?B?Sis2eXUwcWJaUDFvTzhKWERySUNNNklmT1o5eVBOTU1qVVJwMGZoVzY2V081?=
 =?utf-8?B?OW5NaFMzazMweVpyV2wza09UbmhrY1RIQjRUU3BzZGRKdXVDSEZQSFowOG1S?=
 =?utf-8?B?RjZoWE5JRlgwQVErZFlYNkZjQ0lqR1gzeHo4bGlXcVpEQ1NkMElrUll4anJ2?=
 =?utf-8?B?QVJ2ZThNNXlFVlJac2JmR1V0RFE5dm1uYXEzN3Q5MDdNUjJtL1lwbFd0RlZU?=
 =?utf-8?B?QkRBallxTnFiUmJLaStBK1VGeUdNU05aZEtmN1hFWjBzZGtZWjZjRXBrTjho?=
 =?utf-8?B?S1Z4ODVlWnpZZ3lBdzIxK093cTNBcjBLYlN1ZlZyVUl5djBkSmhyblVyWkcy?=
 =?utf-8?B?YSsxOHBDejhQZkZQUEFzYStkOFBUUXB3SUdoYUVlZFl0ci8zTng0a2c2UzJi?=
 =?utf-8?B?TEcvMkpOWUQ0cHVKQTI3eHZoZ3ZlRGljYml1cXZubVRCNm1IR3Yra1RDazBy?=
 =?utf-8?B?ek9HMHVRTzVSY2FsTFNoUXFtRkRYaXBwbzRyU0VZT0ZIZVFjRkFod1kvMzI1?=
 =?utf-8?B?eTR5RjhKSkZGNUxKV3hCdjBhNWhaSlNIQTNGOS9wc3FzdTE2SmxrMk5yMjBO?=
 =?utf-8?B?YUE5SjdTVlFtVTk3Rm5Dc3B4dGExV0FKZWtWbDhCdHg3c1kvNEc2Rm15WjQv?=
 =?utf-8?B?amt4T3E4cmlzeTA1OG9EWjdjQW1BR2lpSTdQbHg5TDRhdzd5NHNQK04rS0NX?=
 =?utf-8?B?VEtHMytzMXJ2clFVOUNNM1Q5THdOMlV4N0tMWXR6SHdQZ1h4Q0grSW9QMjhF?=
 =?utf-8?B?aU50dUVIMlpiMUtRNVBNRlBPNGZ1Zkk4Q01VZU10MVd5RjNkeEY3dThObS9X?=
 =?utf-8?B?aHpLWmFnSXgzRHptMkhiYUFxOXhKOEg1OXpWdGl1MjR6UGR4YkZsVmhQa3I4?=
 =?utf-8?B?YnNicWt2c0k0N3BTbnFpR2RUOFczcDJxQkxNZURQZlE3OVk5NTNTYUJsZ01Q?=
 =?utf-8?B?S2RWWWVvUnVrVHY0U2pIdDM0ZTlSaGZ2cWkyRnRZTUJYdlJaYjNZQmlBTXhy?=
 =?utf-8?B?U2U1Y1BCMkxTWEx6cWUwNm1vM3VuUGdxejhDdnJZV1pxQzhtNHR1MGpJbjR5?=
 =?utf-8?B?RkV4SlpiREJ3WkljbHFEL0MxTnk3SDVRblBnbU5iTnBCenFqdEJPcVFVWkcz?=
 =?utf-8?B?QjUyMGlKS2VHMG04ZW9FaGN2dm10WmFRQ0x4amhic3Zkd0E4VDl1N3kxcjVQ?=
 =?utf-8?B?Y2pMb1dkamNFdHI2aThQckVBRmtBRm1ENC9jRXo2QzRlUXpxZkZBR0Iva2Nk?=
 =?utf-8?B?RmhYN3d2Mjh5S3dpTWQrWUtJTnZQK1Zvc0ludGxsUjF3OFJzOWtoL1ZqLyt0?=
 =?utf-8?B?cWVFckJRc0tDeld1ZHNsYW44SVIxSURmalRpcVZVRFF4QjlvSUVaQktqM01s?=
 =?utf-8?B?YXN1Nk1YeWFmS0dlL09Cc0JtVUJVa2RJUFpSaGg3MHB6c3ZFTkZxOFhrZW5Q?=
 =?utf-8?B?Vk1PYUM2MTltT0RHNDU4dHlxM0FKTGFhYnB1anpDNkFlODVMV0VSWEljWjNv?=
 =?utf-8?Q?5jV64fBsWKp7leHKpSa8IMZGy/XZ6iysdlFeopV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7686f240-ba93-4ad9-3e06-08d989c2befd
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 18:46:17.2992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CO5Qj0U6dCzsPtSWQFLIiSJ3by92SMnDqF+1bAVav9XPpz1s9UPBZ8Rvee75pWgcovdDS823gpixYcFAhJ7DwBSgfGu18seoFmKCWWXlJZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2625
X-OriginatorOrg: intel.com
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>, Bard
 Liao <bard.liao@intel.com>, Paul Olaru <paul.olaru@oss.nxp.com>, Curtis
 Malainey <cujomalainey@chromium.org>, Gongjun Song <gongjun.song@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

On 2021-10-07 7:27 PM, Pierre-Louis Bossart wrote:
> 
>>>    struct snd_soc_acpi_mach *
>>>    snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
>>>    {
>>>        struct snd_soc_acpi_mach *mach;
>>>        struct snd_soc_acpi_mach *mach_alt;
>>>    -    for (mach = machines; mach->id[0]; mach++) {
>>> -        if (acpi_dev_present(mach->id, NULL, -1)) {
>>> +    for (mach = machines; mach->id[0] || mach->comp_ids; mach++) {
>>
>> Such loops are hard to maintain i.e. 'comp_ids' acts here like a flex
>> array that follows 'id'. Removal of 'id' field and streamlining code to
>> only use 'comp_ids' should make this loop more intuitive.
> 
> Changing all the tables adds more noise IMHO. There are 15 files and
> about 100 ids.
> 
> This patch provides an opportunity to reduce duplication, that's good,
> but let's leave all the existing unique table entries alone, shall we?
> 

Well, we could have mentioned files updated in the follow up patches 
i.e. treat this patch as a 'preparation step'. In the long run, having 
two places for id initialization will cost us more than updating all 
those files.

Have no problem with leaving current patch as is if the end goal is 
removal of 'id' field. In some future series I guess..

Czarek
