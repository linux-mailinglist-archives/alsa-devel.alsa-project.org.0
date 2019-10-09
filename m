Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA3FD53BA
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Oct 2019 03:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB771673;
	Sun, 13 Oct 2019 03:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB771673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570931114;
	bh=Wj8QWcHTPurtSg95J/M3mg2oop7XsnSs7jUzA7ihVcw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JZjXT8CEodbhrH5BxJlSEed2iQklqO81B5Vuu7xcOCSNO/tq92bdfNeCnfjWoclw1
	 +Qvw1Uyf8Ish/iQTZ7NAkUyXkRzx6rME+GTPDoSAx0i/iiamWv247+iRp+B9oiNNtk
	 VPG0U0slw7wnkQNrovSpvTSZJ0nrTAbMP96h7V30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDA8F80376;
	Sun, 13 Oct 2019 03:43:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 845DAF8036C; Sun, 13 Oct 2019 03:43:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
 MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14AB8F80322
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 03:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14AB8F80322
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9D1hIEt031119
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 19:43:18 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9D1hICQ031112; Sat, 12 Oct 2019 19:43:18 -0600
Received: from BY5PR03MB5281.namprd03.prod.outlook.com (2603:10b6:a02:ee::45)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR02CA0032.NAMPRD02.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 18:25:45 +0000
Received: from BN3PR03CA0068.namprd03.prod.outlook.com
 (2a01:111:e400:7a4d::28) by
 BY5PR03MB5281.namprd03.prod.outlook.com (2603:10b6:a03:226::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 17:27:11 +0000
Received: from BY2NAM01FT041.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e42::200) by BN3PR03CA0068.outlook.office365.com
 (2a01:111:e400:7a4d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 17:27:10 +0000
Received: from ipmx7.colorado.edu (128.138.128.233) by
 BY2NAM01FT041.mail.protection.outlook.com (10.152.68.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 17:27:09 +0000
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:46:28 -0600
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:15:17 -0600
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 09:55:13 -0600
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 09:45:22 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 09:37:37 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731557AbfJIPhg (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 11:37:36 -0400
Received: from mga06.intel.com ([134.134.136.31]:3516 "EHLO mga06.intel.com" 
 rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP        id
 S1729742AbfJIPhg (ORCPT <rfc822;linux-kernel@vger.kernel.org>);        Wed,
 9 Oct 2019 11:37:36 -0400
Received: from fmsmga002.fm.intel.com ([10.253.24.26]) by
 orsmga104.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 08:37:35 -0700
Received: from mmahler-mobl1.amr.corp.intel.com (HELO [10.251.30.188])
 ([10.251.30.188])  by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2019
 08:37:33 -0700
Authentication-Results: spf=none (sender IP is 128.138.128.233)
 smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=none (message not signed)
 header.d=none;o365.colorado.edu; dmarc=fail action=none
 header.from=linux.intel.com;
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
IronPort-SDR: zuCrWZnBl5SVKTpdX8RJCIKubq4I9f6WJo19z1fRi6TFVAQpEY+Vhd1ItRN8F9ga7RS6F69sOT
 aW5L06mhKjMsZqV8pELJ/N8ikAhBeFX2E=
IronPort-SDR: P8mOP5lzO7ntLVGdNv47s1PXZlqyNh2mZqI45NVEOnV1VHpzqGKlMyCSh8sy/frtFe2KXHH5Pm
 NiDgLRKNBa4rjtLHBMqw+JKiQQjR8kfBo=
IronPort-SDR: WzblY/gRzoxi74W450tIW4qAC1A9T/tv3ZgQTSaAR1J/DoQOPwv9Z2Kyu4/nymepienwfY6lh6
 DPFG+4AzaGHd4AaBqVQypJvQM753u93nI=
IronPort-SDR: H5V7cgn98Ir6k6ZVAlVvV9S7kxFDQHk+Rm/urVKcAmUxZU5BmsycFPzaIi5zKeMDIyazOf9qom
 Be0fCGjSGcvzEuxCurcL5X6uYbrNNgAC8=
IronPort-SDR: FJK5M4vC3/+QoszIof+pZCn89SBWj8k7kVto0wAQjPxAX3qtkGuvCvzxpP2W9SjnZ0/U7CCa95
 lLnhYnYR/UGC8D0yPe9JJ/lpyw3Kdc5UQ=
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: migi9492@g.colorado.edu
Authentication-Results-Original: mx.colorado.edu;
 dkim=none (message not signed) header.i=none
IronPort-PHdr: =?us-ascii?q?9a23=3As65WCBX+/VMe1wLs6prqiHvSDxPV8LGuZFw894?=
 =?us-ascii?q?YnhrRSc6+q45XlOgnl6O5wiEPSA9yJ7uICgO3StLrpVWtG7Jqc4zgOc51JAh?=
 =?us-ascii?q?kCj8he3wktG9WMBkCzKvn2Jzc7E8JPWB4t/3yyPUVPXserYVrUr3A=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0EWAQDP+51dh0O0hNFlGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYF7ghuBQwEfEoRNiQKFWYIPFJNvhywBAQEBAQE?=
 =?us-ascii?q?BAQEILAECAQEBgyyDZSM4EwIDCQEBAQMBAQECAQUCAQECAhABAQEKCwkIKYV?=
 =?us-ascii?q?AhiEBAgMBAiAVQQYJAQEKGAICJgICA1QGAQwIAQEBgx2CC7BCgTKFTYR5gQw?=
 =?us-ascii?q?ojA40ZX6BOIJrPodSglgElidEllgHgiWVEwYbmUAtjgCZXoFpgXszGiODPU8?=
 =?us-ascii?q?QFIFbFxWOLCMBAYE3AQGTWgMBAQ?=
X-IPAS-Result: =?us-ascii?q?A0EWAQDP+51dh0O0hNFlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYF7ghuBQwEfEoRNiQKFWYIPFJNvhywBAQEBAQEBAQEILAECAQEBg?=
 =?us-ascii?q?yyDZSM4EwIDCQEBAQMBAQECAQUCAQECAhABAQEKCwkIKYVAhiEBAgMBAiAVQ?=
 =?us-ascii?q?QYJAQEKGAICJgICA1QGAQwIAQEBgx2CC7BCgTKFTYR5gQwojA40ZX6BOIJrP?=
 =?us-ascii?q?odSglgElidEllgHgiWVEwYbmUAtjgCZXoFpgXszGiODPU8QFIFbFxWOLCMBA?=
 =?us-ascii?q?YE3AQGTWgMBAQ?=
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="286792135"
X-IronPort-AV: E=Sophos; i="5.67,276,1566889200"; d="scan'208"; a="223620857"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-ExtLoop1: 1
To: "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>, "Vinod Koul"
 <vkoul@kernel.org>, "Mark Brown" <broonie@kernel.org>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
 <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
 <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
 <f0228cb4-0a6f-17f3-fe03-9be7f5f2e59d@linux.intel.com>
 <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
 <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
 <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
From: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
Message-ID: <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
Date: Wed, 9 Oct 2019 09:29:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:60.0) Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
Content-Language: en-US
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 17:27:09.8524 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 72ecfab4-b190-4fd0-a850-08d74cddea4b
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.128.233; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:BY5PR03MB5281; H:ipmx7.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: BY2NAM01FT041.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72ecfab4-b190-4fd0-a850-08d74cddea4b
X-MS-TrafficTypeDiagnostic: BY5PR03MB5281:|BY5PR03MB5281:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:27:09.6182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ecfab4-b190-4fd0-a850-08d74cddea4b
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.128.233];
 Helo=[ipmx7.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5281
X-MS-Exchange-Transport-EndToEndLatency: 00:58:35.9592806
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jBEBJg9LXTL4c618SatgilVdBkhAAQjusVzAUSWkyr+qdox8L17hBXBYewYP?=
 =?us-ascii?Q?6kFI8dQROv79Fkp9pB6PNS/+k8g7INMC/vbUSPBpG7KqE3kF/oHkP65mAB6Y?=
 =?us-ascii?Q?BZMrlIbFRxm741u3ePDlPvyaoEvWqCuiIgzrKZGDNQ1w1vofbaNZ1vRlwzgY?=
 =?us-ascii?Q?FvfXO8ikohPCnP4An6KzGXZwOUcq6aQd5lEEA9IIkehXx8YOrPJ/5mfcAjLA?=
 =?us-ascii?Q?1QClMi8q1Gd1g0/41emf3bOlLmY2VMz9qVLctU3TZGs7Pu48QZxfHgA2GGqc?=
 =?us-ascii?Q?+93VzaPnM8B4wrMzC5u0fHTvrkjbKC6cbdb5/T5tgRb7Z0bVKHtjwfvIuTnD?=
 =?us-ascii?Q?s9NBjVzNMrIqt4a050+o1aYnMExeuwCIRpeqtQI97eOGXZK6lg3OtHWb74CR?=
 =?us-ascii?Q?qZYzz40hk7seJqJsCxI0/HDegm6ewmd/JhYChwYY1u8E/+KCqWMZSx06aLg3?=
 =?us-ascii?Q?jG9vAp1e3nmqECLCbq63zSppRmNleDdtR/xDgFgGftHCyLZsHvJxcJMzxhcU?=
 =?us-ascii?Q?k7LAlK6SLmIcIsZfFWatqUfNu67wQlYOXjbsA5enM72+Ik+zDd3ZUwmXAXcr?=
 =?us-ascii?Q?xxdaHWYtaT+n1exXgx0QZc0Sj9KnoBDMgAWUZNFDCGX7iPrcHMIaHgihQ5aF?=
 =?us-ascii?Q?XpJ5JTqbeDwfXEgZOHY5uzGhv/LNijQNp1QTSdfIOTEJFUJvOHQTH0yoLq7+?=
 =?us-ascii?Q?xnt7CSSkgLD2pJtjT6ko3ObqIT1K0zOTTnnY2nyr1pY1SJqFFo0gNdkOTPwp?=
 =?us-ascii?Q?8q9NRFJhKXfgNuDfIkHlhl3GvWIQdkrDuJDfjJ2trgNczIXvLTJIBZxi/chp?=
 =?us-ascii?Q?8c3fFqhs8AhVaEj42khWofiEiFo7kqsJcFBVazNOSKePcUOTf37Mxp2W2Q9T?=
 =?us-ascii?Q?KY1tUklJFnYdSIx0m/0wBsVaAb67MdmEZWfjg/OsldPtzBWOpRJeMPrB52VT?=
 =?us-ascii?Q?lYNvgHSXyXF69ef4fvFk7v4so1oFbat0UK0B37CeZrT2ySVJoB6GqHEiarhH?=
 =?us-ascii?Q?ZP4l8+Wxy45z4R3G0E+gB+uJcHGKH0olbHTAeHvZpcC+6FrH+tobBTCg3jP1?=
 =?us-ascii?Q?mSyWIShjbLbvREZAuHKDHDdrid1uUhbOtYELNkKI59NATP+HtN0=3D?=
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "bgoswami@codeaurora.org" <bgoswami@codeaurora.org>,
 "plai@codeaurora.org" <plai@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "spapothi@codeaurora.org" <spapothi@codeaurora.org>
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 10/9/19 3:32 AM, Srinivas Kandagatla wrote:
> Hi Pierre,
> 
> On 14/08/2019 15:09, Pierre-Louis Bossart wrote:
>>
>>
>> On 8/13/19 11:11 PM, Vinod Koul wrote:
>>> On 13-08-19, 20:58, Mark Brown wrote:
>>>> On Tue, Aug 13, 2019 at 02:38:53PM -0500, Pierre-Louis Bossart wrote:
>>>>
>>>>> Indeed. I don't have a full understanding of that part to be 
>>>>> honest, nor why
>>>>> we need something SoundWire-specific. We already abused the 
>>>>> set_tdm_slot API
>>>>> to store an HDaudio stream, now we have a rather confusing stream
>>>>> information for SoundWire and I have about 3 other 'stream' 
>>>>> contexts in
>>>>> SOF... I am still doing basic cleanups but this has been on my 
>>>>> radar for a
>>>>> while.
>>>>
>>>> There is something to be said for not abusing the TDM slot API if it 
>>>> can
>>>> make things clearer by using bus-idiomatic mechanisms, but it does mean
>>>> everything needs to know about each individual bus :/ .
>>>
>>> Here ASoC doesn't need to know about sdw bus. As Srini explained, this
>>> helps in the case for him to get the stream context and set the stream
>>> context from the machine driver.
>>>
>>> Nothing else is expected to be done from this API. We already do a set
>>> using snd_soc_dai_set_sdw_stream(). Here we add the 
>>> snd_soc_dai_get_sdw_stream() to query
>>
>> I didn't see a call to snd_soc_dai_set_sdw_stream() in Srini's code?
> 
> 
> There is a snd_soc_dai_get_sdw_stream() to get stream context and we add 
> slave streams(amplifier in this case) to that context using 
> sdw_stream_add_slave() in machine driver[1].
> 
> Without this helper there is no way to link slave streams to stream 
> context in non dai based setup like smart speaker amplifiers.
> 
> Currently this driver is blocked on this patch, If you think there are 
> other ways to do this, am happy to try them out.

So to be clear, you are *not* using snd_soc_dai_set_sdw_stream?






_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
