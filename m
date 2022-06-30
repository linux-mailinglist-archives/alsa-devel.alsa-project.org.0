Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679EC562207
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 20:31:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75F11699;
	Thu, 30 Jun 2022 20:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75F11699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656613865;
	bh=67QQsV6GstehOyVlxSe4HpLvNHyqF7PG6sSP7mNFjFM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3xLFAANSiHhOwPs0Z6SdefcYRIoH3ZfImRhfKaljrYi15SU9uGEsnHAX2HZyMXA+
	 IWXqfwahZik6m4puxiTM5iR18dYunxzpEnv2XVWPEWOEv0G2DUVkLZRsnzWXsLYo7U
	 h2AuvDpvBYP22HJ6JDcGyRdiISOVpimhdvA3awyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16570F80107;
	Thu, 30 Jun 2022 20:30:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C468F804D8; Thu, 30 Jun 2022 20:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59C93F8014E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 20:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59C93F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ZgHExm8N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLY8ilyQCpu73t7urQlG+miREk6SQr8rTUd7RnIcuWN9P+iYDqkYE4dr2md89eG2bi9pdNmS/eeBQSvhIFE2P9EFvNqv3eRmFxyZwOp/FPYlxGyZvRpunIhL67+MO7XNrxrT9t5pjlivda7Dlj3yjJS+9PGL4aUVFuhmshLFBoVkwYNxqcfzBHwCzxnkiRJ4v/QB/vZ3sjki+hl95IgVHqzC2GOWHtRFISf/7vtUUzmm30MX7PrfW3JKL7lE0lMc+HYBWHxnCYbHWQU4LYZvCVcN4VapAOlj31SdHJeBbLDLm3nb2TCO6i+qqVCtaQojaJQGcWpCEniXBWTrzNbX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CKJm3taaNU29G9UqYZKXdiRPyMbSbrefel5N9RpMJo=;
 b=e/zpyUjbZ0BzrXAXMFMsIbV/TYzpz+t78c+skjzgCjh5fQQrqB7UIAhkXtmjrq8Mn5pSPKPcxKy9xYtaYDBJBDPh5WdGLIbqKblQpfXujCQg/mwfMjN8FK3Ru5r7X/Wmzttz2AqSzMIgktIBZFfXnMtgfc+Nhxek6zurowR7lNcynXT+6g6MpUPj6CCrCC3iJKfzklbEIAGS+F2DlpkaMjJIhSIDfkMNYDv9dfluBiQtEUYdamm2NsYexjZZmbX+Pt4n3hTvz/1dlQYKsTP3GAv1fc32ZynsuOq5vAkfi2jaf+DXgF6zzfwDz7EJhmqN1gww+qOY2jQ0hKZZM2ReUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CKJm3taaNU29G9UqYZKXdiRPyMbSbrefel5N9RpMJo=;
 b=ZgHExm8NlSUV8NHwYfALMTT9PFHrPdmrPUW5bpBvt02QHD1WutNUKNVI2U8VXnY9JULwT2acgvmy0aM3q3Tw04vnVDRrolYUXWINOLWZ+AjL6me1yagrRr9UNZQL54dsYiB+aZVUQIza4E07d7WWtTrTgeDslwTa9TKp7/sUUzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM6PR12MB3580.namprd12.prod.outlook.com (2603:10b6:5:11e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 18:29:47 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95%6]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 18:29:47 +0000
Message-ID: <cc1dd78a-487b-bf10-5297-66941b9847fd@amd.com>
Date: Fri, 1 Jul 2022 00:02:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] ASoC: amd: enable machine driver build for Jadeite
 platform
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
 <20220630031755.1055413-6-Vijendar.Mukunda@amd.com>
 <Yr2E9SQCtk1u6V+i@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <Yr2E9SQCtk1u6V+i@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::18) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11b1dd4e-6e30-40e1-a870-08da5ac682ce
X-MS-TrafficTypeDiagnostic: DM6PR12MB3580:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RV8zfvNpnnzoOjvK8nbJiJTZg49f2iTAgikShFl0P5KXSnG8qdTPpTEEl35v7b6RT6zfnWV/2Ag1+qTj6tryIPqnRKJ+zbghrAh+4zus7yV6Hwrkv4rWlI7W2dJzGb9fpyPytbfdLK8G658l9c/ab7sYqMFyhSHHWKp1FL22e4IqHQZC3/t0jq1aAQ98esPkjijvsf5rCGXwwk7MZzU8QAmIKDoesesBdMtH0fE3LPCi8EPlc0JmkLJCUziiMer5pY5nyRkHx1Q2kWUuMJNj13N8RDbILQHdurOwqUn/1rD2CA8jfb+fEfpT5pDpPvcpQTQA349p4UVUH8Ys1TnWUE4m/4tY8Tz/yg3Kn++O6xJdPsEDcyuK4ko0Mc6OOIz4aYH71NqwHwkYS6OUl4NqFfPuRtevN0X83auwDlGCRO/5emyL8uzAXYXpNRF+E13O5CCEJVTdZWNr5UfJg+R3kDmygBavUAIJygqIlwTn5PSFlYJajADR46pcjyxKbdt31G/AZi+IOuTNRm9L6TcG8HN0F1Nta5t1xVtv+It390RaCtgboVhnsgzkeq9IeFuNx7HFZvMlJpS4hvXEsWl4UC36EUNNZN/fwR6ocANWJ/zIuAZ8CGvVslwLx2qLmvIN+y6usDYy6wQe23SUUpxBGosg967+5rHTsWWbbB0EPaZ8jiKBlOgVzb1iImHkqlctqqJjzMdzUKdKB4g/cbeZuDf4UTEPLwoaYNCR5SzqoF4LIBG3ZjOXSPzpdR8PyKGADQyoE7kmDTc6iO4Ecl3tLtAhMz2s84EWIkOODelLAcnuAgWdKAtas7PzWbuW75DREPfbXfN8d8IGYOw4fCO7ZzDnAOCfyVhsORFlIDTSfkI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(6916009)(4744005)(54906003)(86362001)(5660300002)(41300700001)(2616005)(31696002)(38100700002)(8936002)(6486002)(6666004)(478600001)(186003)(316002)(66556008)(31686004)(36756003)(8676002)(66946007)(53546011)(7416002)(6512007)(26005)(2906002)(4326008)(66476007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGFpN25iZzRFUXlQOEhYMTA0Z0ZKRWhmUnRQZGQ3RHZlL2hUSWR1QkFZckhQ?=
 =?utf-8?B?VzJORFkxdWEyOVhDdGNJU2pFUHFhQzJld21FM1psWms2T3A1REhWZkZCWlp1?=
 =?utf-8?B?T3hkTkxaU3VoYTNkTjlidkRaUzJpZExSNUxIVmh6aUF0WXd6VEYwRTNCZ0N4?=
 =?utf-8?B?ZHZ2d2xEUzVkOVUzK3dHamx3Ry85RWpSR0RzQ1pQbXdMRm1jN2tDem9nbHJa?=
 =?utf-8?B?R0VzYVVNZDZhRWgzblpQMnBreTRFTnhUY3UwYmNMdHI3UXRVRW40aDFzR1Rk?=
 =?utf-8?B?Tnljakszc0lvSFN5NFhIMlJ5aU91ZE9SdnBpTXR2d0p1aUR1YWduZFBsZTNx?=
 =?utf-8?B?L0JVUExvdVkrSU0vemRERWs2QzRwTUFCcmtjcTgxV1hSRW9yNEl6NmIxMHRl?=
 =?utf-8?B?MFkxU0FqSmlmWUc4U29zeWJyaHVCS1JVM2t2N2FFdGVNUm1UQUk1cWdWb3Mw?=
 =?utf-8?B?SzVFODBRNWxoOHI2bWw4cUlBVmJYdVg1M1RnbUNKcVQ3QS9vVkZGeldRYjhX?=
 =?utf-8?B?N2RDcFZQUmZCWWlxVTRWUU4xQmJ0ZjE4KzN2MUhXVGpScmVQWFJCbWRkMnRt?=
 =?utf-8?B?d2t5TmNvUWxDMWNKZkM4OGNQOHBEc2tXQ21QbmtScHMyWUZkd04yaTZDdjB3?=
 =?utf-8?B?ZXJ6QytqaFNNSUVnYzFMTzRCOVVCUWdpV2tRSVVGdFlqZC91TFAyOU1yUG83?=
 =?utf-8?B?M1BFWGovOEMwazVHSS9QeXZyTXVsYm5YWklFLzdtK0NnRXRXRmV6UDRmV0J4?=
 =?utf-8?B?N1dYR2ZEc2R5YnFGSUltYk1ESE9KcVBZQ3N3STJMaTAvcFVCSmZJMUxEWGwz?=
 =?utf-8?B?ZEdsTWptbjAvUFdjU3pCWHR4YW1abDFLZTdVQzNTbUZLeDdMUDg4amZtVDJE?=
 =?utf-8?B?dGpyR0VPVGRqWGF5L3RtT0hKcm1mcngxaTl0WDNsTmUzbXRuZ2pDeUNHNUU2?=
 =?utf-8?B?K0ViRkRWRE96U2xkSXpHYUVLVWlRZTFHRk1uR3gwZlVvQnlCK09wQU1UejhF?=
 =?utf-8?B?T0JIcG5HZmkyd2FzZWt5WjdlWFJYTC9TcXUyaEJKakxjTXN3RjZ0eDk2SlBC?=
 =?utf-8?B?OVNpTENuY05Qc1Avem5UYlJpRXFZK09KNXV0U0JGdHkxN2R2cUtURlQwRTNF?=
 =?utf-8?B?ME9EQ1d2a1U3YWZYNElvSmRxNWxxemNtU1YxT050aThSVThIcTNhK1FUN3dw?=
 =?utf-8?B?VE83ZnYxUUFFYnc3Ni9iUHo3N0tFU0QzcXdPWnNQUUpwNkRVTlVHeUpvQldU?=
 =?utf-8?B?KzViancxaXlaTU5yZW5FZGVRZzFOVVQ0KzRmM1FCelhCUFJYdTFoRGptWEpH?=
 =?utf-8?B?Z1ZudmtwMDI4dFdEN3MwYkxqTmdPN1QycFc4eG9LYmhqZWVsQU84TVRBV0Q5?=
 =?utf-8?B?UjlJVWp2TFA1citHcVlSZEtaKzhML2ZUVWJjTDM5MzUvS1lqb2cwR05hbVlY?=
 =?utf-8?B?NTlrTitEV2RDQm9FdUR1cnJUUVg0MmVITUFPZkRiZUNiT0VrSGt0eGJMcy9h?=
 =?utf-8?B?YjZzczNtTFViOXNTVm5aWnIrQnpzTlllWllBcXFmemxsYTJPZE9rSzQyZGNn?=
 =?utf-8?B?VkhXd2E1dmZSbHNuaFM3VTZhbytvbU1lWmhxVVIyeWRBOHpjc2d1RE9DdW84?=
 =?utf-8?B?WXJOdUp4c3lCdDBOdURuWTBGZHl0SDBXbER1WEhGNWhSMVBkaFZpakYySmhk?=
 =?utf-8?B?R25IckR1UmljN1llclpZNkR6TmQxRi84Ty9nMGNMOWRSS2lJaWNRdW9yQ1JZ?=
 =?utf-8?B?MUNxamZLMSt4aCtYQWJGc3JoY1dweGtCSnFIRzQxUVMvOFFFQ0pLWDBVSlEr?=
 =?utf-8?B?SXVqWThmN0l1QytBQXkwYlNCYTdUSHR0TkpWa3V1VmV1YkpOZkQwd2RlaVVv?=
 =?utf-8?B?QlRmbzYzQmJuS1NCenErYWs2ZThkWldETUhYN1BockVhL3drUUdZN1lxZ3JB?=
 =?utf-8?B?MnRaZFJ2TzlBZDBZV29ncGIvaFpZV2NtNnJoYk1tVlBSVkxnaHpXUHdINTl1?=
 =?utf-8?B?cnBkZXRJRUZxNmFDejFLRUQ4ellLVjIrOExBUmtWdjMyL1N0c3c0TXdIM3Zr?=
 =?utf-8?B?TDdwSERXUnpaRnpxc1hMODJNdUFnVlJCMnJCL0RYeUorQzJXelBHMFh1QTZX?=
 =?utf-8?Q?Bd8z2MZWnXMUfFCprgqIRTRmu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b1dd4e-6e30-40e1-a870-08da5ac682ce
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 18:29:47.5169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8GXhRXXavvIM0o4+/c9b/QpnGWn+VsO4QReDb40eGF0wRrK+kp4pp6Ws/JZq1naLQVZiyHHkw6IJ5wrMXZsrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3580
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexander.Deucher@amd.com, zhuning@everest-semi.com,
 Julian Braha <julianbraha@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On 6/30/22 4:41 PM, Mark Brown wrote:
> On Thu, Jun 30, 2022 at 08:47:55AM +0530, Vijendar Mukunda wrote:
> 
>> +	depends on SND_SOC_AMD_ACP && I2C && ACPI
> 
> The code treated ACPI as optional so you could relax the ACPI dependency
> ot be "ACPI || COMPILE_TEST" (I think the same applies to I2C).

Will fix it and push the newer version.
