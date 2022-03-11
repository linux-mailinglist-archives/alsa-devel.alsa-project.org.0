Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5B4D64B2
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:32:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 662881A23;
	Fri, 11 Mar 2022 16:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 662881A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647012753;
	bh=yoj3IICbt7Hi4tZ5kLA3QZ9VR7pnnUlJp7fkN+Wno1o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V3J/oHF8lYbKyqrclw9UqSVkw/nQAfT+S4E2aO1h70xExxtHI+lV7TzPkanLLkFQ0
	 FMCOGU/DmMMs0jP+lrAuKTeOElMVf1RPlBTX2Jkz9q07nLgfNT4FEKToZ9Sy7dSO/x
	 V4I4Dys6fzWcm7WtHOn3sWeXnU+YyI8cwVjXkGrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1560F80578;
	Fri, 11 Mar 2022 16:28:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52064F80578; Fri, 11 Mar 2022 16:28:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FD38F80563
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FD38F80563
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DnvgO+yY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647012502; x=1678548502;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yoj3IICbt7Hi4tZ5kLA3QZ9VR7pnnUlJp7fkN+Wno1o=;
 b=DnvgO+yY1EsaKJ9IfrejLxwkYyaXwZ5bLvR32Bir07f7UCuteylTv2zB
 QsHbLk1HEhP5/b8liYGf8ohaKzlvx9XVMa/hT4vgatkO09pj09ZNT+ITk
 QKSKdH92lfCxV0QBAVRy+i4ioZ1xxeslRAdjP5F/W4M+heTy19PVNecqx
 rRm6WmX9TmC2nUnWABnjd/LRiYq11FWZqZhsk3EEiNG9av6iBcvbxb/2f
 8pocpmLsI3hxMi725OIshCH1CyZWWIN0K7b139QYK/5m8JsJbWsjTDnYZ
 6MW+Iv4cUo5WDuStKsvll03AtBfk2FE7bTD23kp1VQArjJ4myGcRWgA8x g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318813395"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="318813395"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:28:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="555343933"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 11 Mar 2022 07:28:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Mar 2022 07:28:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 11 Mar 2022 07:28:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 11 Mar 2022 07:28:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCD6f87HU7AtU9tF0RC07//7zxbQNc0myg6zjzIo56g/IQ42qQLpRIgX7vXeUcOkoS9NbqhuSRhMHDvPmoBoih7XOR1bHdxaDByqCC8I3iCBFkPfBD6usu1WZl5E5SEmSwJAWHoMEV2fLTlGXsFMn2qRFgAMd/YoXm4DvTZWbRYQ/3hLJg5but2G6iZqI3PW097XyPDfd9dqHbaXjndX05g5hbGSM+1nsZrC1fhXmEnN768VD55D4449D+Z9JVP1bdH7GMn42pvUXGA6xAcRYUurKbksEoMBFy3kZKzdXOSnuTAj9BcJlqy9DjOlWC64R1UJrIVvcUo+Lb8P8hP6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrBSHQ8x0fDkT3rFss0yioT/1LcAS3G3R7dBsnuLQY8=;
 b=YhV7gXQQtJHfwdlPcyKpJ71zhpGuBBiS8uo9J19hipH0tuL3IlnzyKxAbG42o+WvE4LAcNWnP4t3v5jnxeDE/OZzRje1gpx1d1hg7V8OwdwQLnw4iyiPDVmjwrJhWvy/9uWXOjDcJxlwct99IDDfRP843RA2HgkHczjIwTIlWC/pTea3OlSC2gWHVBno5yBzA1eBftuBW0fYoORA0Cdi97WQlGAgyzxDBreKJQDjZmSIMCOsQDPaxxUYWrPvW1x2B+6JFBV2SoZKu5ff/Sz0kvmEZ1lrt5VBAgv1u5el9+QqNu98FSnGGHbGyg6aJ6KSKbw1JuM13hVwZjWJqn7Wfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN7PR11MB2851.namprd11.prod.outlook.com
 (2603:10b6:406:ac::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 11 Mar
 2022 15:28:13 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.030; Fri, 11 Mar 2022
 15:28:11 +0000
Message-ID: <f12e629b-20b8-afdf-004a-42f5eacb08d5@intel.com>
Date: Fri, 11 Mar 2022 16:28:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH v4 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-12-cezary.rojewski@intel.com>
 <5e47e4dd-bef1-8c3c-ba28-d651fc2dae9a@linux.intel.com>
 <7e3f87d1-d50c-63a3-9e06-c6a38d3a4cb8@intel.com>
 <Yis8I8frENyvEbxW@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <Yis8I8frENyvEbxW@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::15) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a3ac703-c5b6-41bf-fb97-08da0373c087
X-MS-TrafficTypeDiagnostic: BN7PR11MB2851:EE_
X-Microsoft-Antispam-PRVS: <BN7PR11MB28512BD5F92183EDD6565127E30C9@BN7PR11MB2851.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnuN3Cdk5DcyKwSvuyCwd2gKMZChML1LNP8PAY8i5lOXgysxGQFC2dQG8glE4WzbDMyesS9oU/jew5x1q1P6RGISqG4aw8MlCQOmVjp75RYPgVBpQADOUd+HYimOZr90N6XIVnzL4RyupdTrHKA312f1mDQEmUfRz5bPlOTMC+Dc2nw8J8E8qc2PC8jvzhrc6TONsYJF24ifjG9lA1nwkvImO7GOArbvyJkE93KoN3yDOTv87Y/h3SdoTa2D8H3X+fdHQNLcuIZCLjKdpP5UFwB7g49+0duxsrReWr8euEpFSxYK9FIj2lO16lrPf1t9TZnnPn+kIAMvjgUSkasuw2EDWn2ftpW1FHBDv7CG5QlksQWFeN6cORzJ2WkSTjN41OWhXHwmgBt/g6aslI35YmBSJIn3L65afHuyhZTacfVf+1/7kSVFAD1axUjMcBvG+1zKIID6D8SFJNVongjjsLK6cP7FbvcqhnjGEVkmE/OWrnS3ellvnVfpbxC6naWMKvFq2znlxDw57y4sCPcHZ1XuTG9qB/If1SAvFd2Q81PccD1h9iNnxwzSJP0gi5VgCxRJIaJEZpfbQ9h+XRLPeiCA9iawxQg3E4CEtAl1/FjKPVK0b45bUNQccbkyB0zUOV1jxiaV/SfP3BPTBuZ68R6CY5oParAyOouMJzqZk2uLyxTe8tS9EkcUG0tYvamjqG75ijjeYIsU/ah7vRPg93CI6oLfA/dSfT2GLKWEbFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(7416002)(8936002)(186003)(26005)(36756003)(2616005)(2906002)(38100700002)(31696002)(86362001)(82960400001)(66556008)(8676002)(66946007)(44832011)(66476007)(508600001)(4326008)(6486002)(31686004)(6916009)(53546011)(5660300002)(6506007)(6666004)(4744005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2NJenNrdlBkS1JKZXhPYUxpTCtOVUhQYkVmSGlGR1NGUEhsL0gvd0VTWjk0?=
 =?utf-8?B?RXdkejFIVU9ZcFVhVzV0UUlJSXVxbUwrak1Tc3pDWDRJc0ltWFNDOFpDK2h6?=
 =?utf-8?B?TVA4b0pOZ2haNXBMMXVGUWpiQU1zRFlidUw0WmR2SStFUUpWeXp6U09YeW11?=
 =?utf-8?B?OG8wOVV1T2M3VGt4Q1pmc3J1dTBWV0N0NFJzL21iYXBqRnhMaTJjdnBnSm5t?=
 =?utf-8?B?WWczOEw4OFYzRTg3SWhMeWREaTBhMFVzVFBpUmZBcGZaMjhGUC90MGlYbnhY?=
 =?utf-8?B?dmdBSUxJdjJES3dhSURwaXJHOS9jOFYwc1lpVWlqemNmMVppWlE4dWpFU2g2?=
 =?utf-8?B?YTdibkdvMGxXeHpSMVBoeVlrem5iZXJWQnRFanFHTXFwL3ZiQzFFRUJxQW4r?=
 =?utf-8?B?YTZJajhRYkM3ZXR6T1ZhLzZ0ZGZRUndudnZBNWhPVzc1NFN6R2s4dGpXVkhp?=
 =?utf-8?B?MnZEbkxtWDVoZ3lnOW1jWXRKTUJ2QUJobTFIeEJiWmxrQVNFblluNXRTVy9p?=
 =?utf-8?B?VDBMWXBnVWQ3aFdYY1l0NUdvTWlYdGJZMUorekdGc2syR1hoT0xNRGNJK2Zo?=
 =?utf-8?B?ZTlCMkxZYzdnMUlvYUNaaGUvakxONTc1OW5CeXNQRHh4RDJNTjdMOE5BWWNS?=
 =?utf-8?B?djM4UmZ2NmRRNHdZWGdVeGJQRjhIcWFiR2F2SDk0alhpb1hQcUlVQlIvQ2VE?=
 =?utf-8?B?ZmhpMXltaURxQmx2aHcvOHM4VVd5VmpXbml2QUNtR2xxVzRsRDdTL2YvQldr?=
 =?utf-8?B?bnEzQmRyM1YwQ3VuQ09ob2t3ZTd1VEY4SzBMQ1FNNjQwYzJTQ3pDY0ovUWlr?=
 =?utf-8?B?aVRyZVZDeGU1YjhWOWxlaUNrcTYrMnhjNkpXbEFvSGpnQXdhaEhuckd0cVEv?=
 =?utf-8?B?QzdzWHowT0sxMXJOaXlCOVRrbjZUOXR4dlBXcHVwVmNEcnNkRFZrTlpzSHA1?=
 =?utf-8?B?YU9GNk8rVXNobHZmUlpVQVZKMnFIa2QxWTMvL1E1MmNvWW1FUmhLajQ5cFJV?=
 =?utf-8?B?YXNxaytINWZkbDhoWVdpZVJWSzgzTHlNaXV3cm9BbldWOVhWZUhzMTNQTldU?=
 =?utf-8?B?THRNS3dCZlFGamZoVzI2R2FyUWlqcjVtTDBVS2ZkeWl3dnQ5V01FRnR1NnB5?=
 =?utf-8?B?VlM4aytIWGtWN1lnTFlQRVpOWGNqaTBlRk9hNzFOYVhTYzVmQmIvZHBSQmRq?=
 =?utf-8?B?SkswOGlpcTFJZkQ4bEcvZWFISGtMT1lLN2NydTVVeStmYkltMklXemxQVGJa?=
 =?utf-8?B?RXlqc3BkSHc3S1lCMnZuWE5SQjEwWFFDWHJsa3dhaDkvVGZNQWx5QUUxNmlT?=
 =?utf-8?B?QVhhYURvQVhBZzFjaURQeVdGRzIveEdiUWVEd2lnQXhMNlFJbk1mREZ1WFUr?=
 =?utf-8?B?WjJiRHJpTGpzWjYrUU1KRGFIc1l3dmVJOEpoYjViQmdXcjJsU1RJdGxjU25U?=
 =?utf-8?B?eXJtbCtiWmdCWFRhSHBvczR1allXOEdsUWpHWUZUT2tBYWlXUlBsdUs1SktB?=
 =?utf-8?B?R0pvZE9aeTEzc01Ed3hnSm9DWitKYzREWTQ3UnB6NHRlTmNqNUlJTEhwRXlE?=
 =?utf-8?B?S3UrK3gvV29rQ0JkQ25lSDJZUWlzV1dRNEt0OEdoV3cxcHV5YUNWaGdjbjYw?=
 =?utf-8?B?Wkk2ZzFvUmR2dS84TGppdHlXZEMrRWQyVWRJbFhTUkswaWU4OFlSUSt5bjg2?=
 =?utf-8?B?MVhGNjl3V01zTTlDcWxIUXFWUXZQYWVnU1haN3dBMERUYUJLRE1kdlRGdzI2?=
 =?utf-8?B?TUtmU28yWmIzUkRGcDl2Mlo4QVNTK2FsSXhoM0pMWFFPK3NhS296empSTUlr?=
 =?utf-8?B?UDNzQmlvZjNFb1hpMGdpSFFsNUtWOWdmYzdZTGt2UlpxWlFlUmFNTlliQndC?=
 =?utf-8?B?QTBmd2RBUWRvOEFmU3VXTWxyditpZ1pPbFlNdm9Pa0tSdGo3ak9DVEZ2Nlc5?=
 =?utf-8?B?SFgyTlR3bWtUNW12L0lnSDJVS1Y2V1VWVW9KY0RFVXRCRzdtdlNSbnYybzZ0?=
 =?utf-8?B?czlGNjUwU3ZxZzBxaWdtUC9zNE1ka3dPTFA2blY2QUhacUl6U2VDV2tOeUFt?=
 =?utf-8?B?ZW1DcitJcFlwZEtXM0ZabmpiRjlWS3NjSFNHdjMzVUJGSktDd0xyTnltMFQr?=
 =?utf-8?B?ZmdRTVZyKzZESUJBTk5yVkRNTklnZy9tRjlLUzFuRkJtTXRGeHQwVjRYdWho?=
 =?utf-8?B?MXh6ZHQ3RUlmOW9pZmw4ZS9NbjgrUStuWlhiMmVVQ3Z2MklHNmhtQTJ4NVJi?=
 =?utf-8?B?bTEzYWtnOG5lNTh5dGw0aW1XNUF3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3ac703-c5b6-41bf-fb97-08da0373c087
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 15:28:11.6668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUPrFnJgBlKBmzTVrdx0H/8pGwBKrrlp7TCEh2xkFyslUlEce1wGNAnpXgJNzdyRedjQZmsDW0y8JlZcj4mQkWgF/N8hZQwxG3zu+JRwoj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2851
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, rad@semihalf.com, upstream@semihalf.com,
 harshapriya.n@intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hdegoede@redhat.com, ranjani.sridharan@linux.intel.com,
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

On 2022-03-11 1:10 PM, Mark Brown wrote:
> On Thu, Mar 10, 2022 at 06:11:31PM +0100, Cezary Rojewski wrote:
> 
>> I don't believe any of the comments provided are a strong reason for
>> re-send. Given that last revisions were mostly related to addressing
>> comments, rewords and explaining stuff, series is in good shape and ready
>> for merge. As I already stated, team continues to work on the subject and
>> there are more patch-series to come.
> 
> It'd be good to get the WARN()s fixed.


Ack. Addressed in v5.
