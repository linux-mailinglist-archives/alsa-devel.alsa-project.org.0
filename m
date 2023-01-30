Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F26D6809C4
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 10:40:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74C7FA4F;
	Mon, 30 Jan 2023 10:39:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74C7FA4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675071633;
	bh=yR0GCleKSvsm0QjjBgqLngSpuO4sX2QgPq+jYm1iYks=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pT6/N8CTj8PbvpwkiNs9dtdMJUeZ3UgRza9JSM9aKaHWorZcISBS0Yz2MDl2vJ49O
	 szYmB+Fm8G0iyCYRx7UHg5i6hwmRynMMiGqp/95UAhCm4ZUu60HtYag1hey3Kvfc+1
	 nz5Ex62qQA9JqH6sBY5mVDUgPBiBo7UeQNk9l+VA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 822F8F800A7;
	Mon, 30 Jan 2023 10:39:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5DF4F8032B; Mon, 30 Jan 2023 10:39:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C39EFF800A7
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 10:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C39EFF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=axis.com header.i=@axis.com
 header.a=rsa-sha256 header.s=axis-central1 header.b=QNxfIG5r; 
 dkim=pass (1024-bit key,
 unprotected) header.d=axis365.onmicrosoft.com
 header.i=@axis365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-axis365-onmicrosoft-com header.b=L/ascvr9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1675071564;
 x=1706607564; h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GK5nfVUPpDDOvgLVU24NBLX1MLI8LDGrI/NMS03B804=;
 b=QNxfIG5rsLxKjJvil4OeXfLHvsoG4x2RRenkNXXI1jsM3z6GyPzMFJ5n
 P5qoVfrvyndwM+mcxA/Xph7FgnZinwIDb99pl19ShRbmo+A66eOB3KIpY
 r9hKN7Dcg+Tj7nK4XmoLwJPud3RQ+PBWgI0FdosXB9cnbicjTWnQbw0S8
 T6f+eYJrpG8HMe+Sv86Horfgy4d6OR0DoBw7kD4R47REDCzfcdI/J21V0
 Q5hUFBqnMMgdqVFsUrN3w5jqYNeudmAAzz41IM9oa3AwnXrdWz9oBZEVo
 JU25CKBIeyKGgERdJ+nJyFfLn/OphtnybZkVwwH6PZMIeqLzPt430tjqj w==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ/T8us88xiztlos9U6JzmI4b2hvugBE98MCUSrliHWQ+BjALOPUS8rGqQS+ItkHivrD04gjtCiWqjNu+03dqIGa8MMauvKoK9ihdkjeDR2IWZhv0klzLv4k0y1ceXXUlp0GlFPeinqTwcWr6EI/oLBHO8WcaF+PDvUUmk/1SIfEAJZXsl7+ir3vOF7tISvHEa311dREa2F2Q6SmD2xrUmAuFgolPELLk1N/YTK8PiqnxonRJNmCjwf9bAy+kFzgDambYr5aTj0/kfp1Wz2Z6LkZc3m4yBtUO8db/5pVN2BH4IqMeSWdHpujcB6T4tK51uFCNlJWGq2fX4Xwn2HV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GK5nfVUPpDDOvgLVU24NBLX1MLI8LDGrI/NMS03B804=;
 b=cM/HC0jIe1DxR3YTn0ByMS9ZC+fMmOoUK6oEG/Szx0Ww1cBQ7Eb1X96zmePNYeuE2zY5XfTu2Lalo7uC2kORr8kJ2UAgnAK1wuUdWBB6JH9Z1wIRh/5tVh4gWTexOJ6dkPoRtet0ubn0sAze8GpsT7hpebPGU855Z1HP7KsYzFGEvT1kEr/pMKGKGoHAOmN0xaFRP8vXromY/d4faVzxP7pBlBpD8Nrm3KuKkO0tFLFdU75Yml4wnae6lmqnvKi7AQAkvV/JsyMOdhSzrVGta5XuVcf0CAAdi0AGPDR8bNJ2OPNvku4Wq46zKlm3odiPOhwefgJ666UdTkUl2vZ9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GK5nfVUPpDDOvgLVU24NBLX1MLI8LDGrI/NMS03B804=;
 b=L/ascvr9N84z0bKF+Mahf2eb4cskR1rPEaYmV43Ri8jWmsS8+FPYQgiObscYz/8AzLjpuuiFQww4XtAfKxpitsPCAEj/qlB2t8wgXga/Q9kRNyB0CpBHPjZzjnOxdg4of6BrJUXAqZSMfPk75dGqEuTcFriRP34PLuNSpZ9LfEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Message-ID: <0177c346-d969-f8d2-6a31-e3ce570c8251@axis.com>
Date: Mon, 30 Jan 2023 10:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/3] ASoC: simple-card-utils: create jack inputs for
 aux_devs
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Astrid Rost <astrid.rost@axis.com>
References: <20230123135913.2720991-1-astrid.rost@axis.com>
 <20230123135913.2720991-3-astrid.rost@axis.com>
 <Y9PBZjkW7Nrsg4j9@sirena.org.uk>
From: Astrid Rost <astridr@axis.com>
In-Reply-To: <Y9PBZjkW7Nrsg4j9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0042.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:b::7)
 To DU0PR02MB9467.eurprd02.prod.outlook.com
 (2603:10a6:10:41b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9467:EE_|AS2PR02MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a3f2ae-e255-41ff-f0fc-08db02a5dd07
X-LD-Processed: 78703d3c-b907-432f-b066-88f7af9ca3af,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: peHVtdPMRKFTZQIawFwo9Q5Kri9mUOqKsmtNw5M2B27tB0ZK052v37QvBjEGMX1+/bIB3d9efCcIOtoXqPKjnDlD2uIeVlNthuHIHO/L2+IMhb4NHvPW2nOwhe96Gz36Po4d0cV2D9fDlGhTdFptipzdzejwOknWZKFbvj7qN/Gx01hVWALvgAwR9+aD5/PbZlNnRHRaU6LWfLEJFn9ft7pmq12bz+gNuoENNX7YuGQEI+vVQKFtKFVAzQmlmhD2g0rk4wug6ANXxWvpkMDcZGYP8J+3Bck4Axj0NV3LdLNIU2zmv6A1Ram51RSgPvzS1shzbJRcbmRW+PqynbQ9fvV7azoERJTCMlAa/oQoHNAK74zosrLe8AqaLX38HcJYausjHcMOGvQk2rCa+j9cgPbqfKqqguTfoNsTGsCcfe7kkP2TpApowL+O1H+0p9Lq0m08LqVKtPdfSD5ifdnEbLR1sAIq5vPyiee4T2gBPCXMF7/pwYxvqZkHPG5MS3QPUFb+SOsPt1YtRgydBMWKG3IQyVyXEHV7cAKOA0lERUQz4TIApVSKARbighMDWiIQTcFa5IMupFH0UaujthdkVBrMcATET8edGLrTKqTXGuJ6lvq8mjBHbtFfym3Q+b+0KamUOD8U6oI/U2utXuGIsQX0FsiQ5Drij/QcOPvB4Hx8Eh4LpCoaW8Db4vLKzBjDBQXK0UOxTcWwza/UYjddO5V+1u+29NLDvS4B7UBy9vM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR02MB9467.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199018)(41300700001)(38100700002)(54906003)(110136005)(8936002)(31696002)(6636002)(5660300002)(316002)(2616005)(36756003)(2906002)(83380400001)(53546011)(6506007)(6486002)(6512007)(4326008)(26005)(478600001)(186003)(31686004)(66476007)(66556008)(8676002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emFnczZuS1UvWXA4WkFVUmN2RTlQekRTR3RLVVYzZGZqUHNzeWV0RGN5MVAy?=
 =?utf-8?B?VFp4TVU0VFVHdDNYZ3hxSnR5R2tTUStnVithZHlENlVWQmZtOFhEbThLdm5l?=
 =?utf-8?B?L3pHYTJCZjNZS09xTkJpTUo2S3FGclpLVm85dG1XRzExbzBqeFUyKzJYcFJm?=
 =?utf-8?B?R2FFY0dSSTFTcWhpRmZoVzdvZ3NtcDVuY3ZvWWlKVlFKcDEvMXgzUTM2S3dv?=
 =?utf-8?B?SmJyZU9SS2JtaDJ6c1RtYWJKQmtTY2NJVldWbCtycDIxVTZYNUF6UUpzR3li?=
 =?utf-8?B?M1JNQlNydy9KcVhLenNPZU92WWsvd2h5Zy8yWGw3NFBZZUYzekg4Vk41aFgr?=
 =?utf-8?B?WEJCOFJPRzVUZ0VaWGJkamJYOHhoT014cnh1S0haT0d6amh0TSs0YlZhdjRF?=
 =?utf-8?B?Q0VUVTlqVnIrZWpFeGtqdmc5VFgrbVA5MVRCTnBlNEpDK21BK25NVVlpYThW?=
 =?utf-8?B?Y3Bzb01Eclh4emdFME1xOWlldndERU1kZzdlRTRyeTFLelpRRlo2YmFYUTF5?=
 =?utf-8?B?K3Axc2pKS3NtdDIraXNmWG5XaElRR1J0Mk83MUtxRlBDQXprcEtiSXFQTDMv?=
 =?utf-8?B?NnVGbFN4elBqKzJTUTBUU0RhMmgyUlorNDhYcURHQ0JBTmFKQ0dGVlpKUll4?=
 =?utf-8?B?S011ZXlnMFhTL2ZjUkxtcW1qa240M1JuVzlNVlRpclc4QTFQUTRHeThDWkZY?=
 =?utf-8?B?Q1ZGYUJVNzdrV2Y4VmRFOFVlM2E4d1RkYkFRamlRdUs4b0daMGFDQUoxNHFv?=
 =?utf-8?B?MDVsQU41TDVodDdZUmpZYytXbTk1bys1U1dOUHljTWFia3UrdE5IaVp4ampJ?=
 =?utf-8?B?OVJmeHpteVZORWpBSi83TmJRaTVIM0xML1ZWQzJMWnpLTHZReHo2MFNNeTVo?=
 =?utf-8?B?M2tra3VOcDJHL0Y0eXNUeWpjUTJHSUorV2RaSWJmNDN0S2dMV25xZERzdFdU?=
 =?utf-8?B?VmRMQ1dFR2JoODI3dHhjRDQydVNvREtIbkYwNlczVXZ3ZkZJTFRZR2wyTkVt?=
 =?utf-8?B?OEdpbEZjaStiSlJvdlNFVnN3eVozU1ExdUNkaXgyOWlpOFJTZjJtQ0JVbTBl?=
 =?utf-8?B?NHh6RURZSzhlUG9ZU1c4VUZvRDNCMm4wbHRneHRFeWlqSWowREZDcVVPSE10?=
 =?utf-8?B?WlhGZGpEVDQrRk1TWWQwc0ZDemZ4SkZJbnVWNnVaT20xemJtTDVtSmhsaXg3?=
 =?utf-8?B?NnJ3QW9GNHVTMVNmWHVxVk1qTUd6VDk2bDk2aUR5STU2cTBVdTY2UmUvc1Y1?=
 =?utf-8?B?NHJ1cmVIb1l6ZVB2ZG9Pd3gvcGp5RlpuTWlrbEU2SExNWGo5Z0VidGZiU0Vz?=
 =?utf-8?B?Smh1L2Vid0dCRUZCcUNGL0NXYi83ZGpyVFZnK0R5eWRFeWExcXljejRCbkZ2?=
 =?utf-8?B?UlBGaXMxeWJPZ2lKRG1uakV3NDNnbE5XZjlpUm90b2NlbjFFaGloMEhhT0Jz?=
 =?utf-8?B?K3F4eUxlcXNVNjk3T1J4ZVJpdVFsWFZFeExXQk1uU3lGL1lCa3hMbzdoYlJL?=
 =?utf-8?B?NnNtQzVWUGlkUHZJVEkyZGRjOVhNRnFDVHNRTm14di9UV0JELytBcWVmdFBG?=
 =?utf-8?B?cWJMRlN1Vk9xN1E1OS9IOG5mcnFxNjFHdEkyWWFXR3Y2dmF5K09DYnNBUXV3?=
 =?utf-8?B?Z0N5YVhoT0Vza2JTbjlKaGFQWnBiZENGekpqOWpibUlab0hldjZzTW1BYWdr?=
 =?utf-8?B?eHVpdHBWMm9qSHZwY3hOd0w3R1JRMjNXZ3RwQ0Q3QnNQcTdWbkhLYWc1TUVK?=
 =?utf-8?B?VWwwdGJBZk5DeFpxOEw3cGJIUnFXMUJhYWJ2QXBQa3o1ZmJ2YjlCb3I1dk9j?=
 =?utf-8?B?OURTdis3ZEw0WUxYWHYyRWwrVXMrRkVEOHZ5ajVUQzVoSXI3cjFOWS9Rb1Jv?=
 =?utf-8?B?c3VwR1dHa0ZWQjB5R1Jpa2FiM0hucEExZ1hqek5jMW10VytQVmVpcGNmdlRo?=
 =?utf-8?B?NmpoVmJBMHltdlBXWXlwKzlVUHY1RmdNQkN5aFgydlBzenpIcHY3SGpWMGxR?=
 =?utf-8?B?SHY1V0ZqcVUyK3V2VHJmZ0tnRDFTT2YvaSt2bE1neHRtZFcxVURyUkhZNnhT?=
 =?utf-8?B?RWNrOXlSM1l2MUQ0dVJxbWpWRFB6TGpaMUcxQ0JDTkUrRStKQXZEVlBNZnVv?=
 =?utf-8?Q?4rVKoN5aUBY9nW1R6wKACj+AH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a3f2ae-e255-41ff-f0fc-08db02a5dd07
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9467.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:39:20.5452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpGw1rvw4yy1vJGHk3uPzSi7NTYhkCtbb+3lPwDqJ1NaY2wJFhBmAkM9OEoX3fw8VlYOsVDUpaV+k4fF5nCe6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9291
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@axis.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/27/23 13:19, Mark Brown wrote:
> On Mon, Jan 23, 2023 at 02:59:12PM +0100, Astrid Rost wrote:
>> Add a generic way to create jack inputs for auxiliary jack detection
>> drivers (e.g. via i2c, spi), which are not part of any real codec.
>> The simple-card can be used as combining card driver to add the jacks,
>> no new one is required.
>>
>> Create a jack (for input-events) for jack devices in the auxiliary
>> device list (aux_devs). A device which returns a valid value on
>> get_jack_type counts as jack device; set_jack is required
>> to add the jack to the device.
>>
>> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
>> ---
>>   include/sound/simple_card_utils.h     |  3 ++
>>   sound/soc/generic/simple-card-utils.c | 49 +++++++++++++++++++++++++++
>>   sound/soc/generic/simple-card.c       |  4 +++
>>   3 files changed, 56 insertions(+)
> 
> Given that everyone is really supposed to be using the
> audio-graph cards for new systems this should be hooked up there
> too.

Hello,

Yes auxiliary devices are very useful, e.g. for GPIO. I can make a patch
for audio-graph-card.c  to add it.

Best Regards

Astrid


