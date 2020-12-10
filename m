Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786372D4F32
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 01:05:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CADE5168C;
	Thu, 10 Dec 2020 00:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CADE5168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607558327;
	bh=59OV9D46AKRs5bFJnTk9bPLDdqEnepKei61j/S/mfZs=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=homNMpssyDpH87IZS6TsnFG4C/7TSxHLHIyOSI1LZ29dtfV1YWGbp8+OI95barBwk
	 F9ogJFZzq0y+xDz5SJZJl4AORhQTnn0b+GnBNlmUrJE59fUugT2148ghw/rSQymkgU
	 BMzj86cNq5x3C5fQDQA5va+AyK33kjqxLjtHKkjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC025F800E1;
	Thu, 10 Dec 2020 00:57:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19AFEF8020D; Thu, 10 Dec 2020 00:57:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E39FFF8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 00:57:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E39FFF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="kWiUx9Aa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APNGjMk6I45BEsXgJRHuZMrbGGUpirl/Y0aruW68M8FUzNXZ9Z4EU3SN3TCSjcZA9A2uH8Vks924r0ZrXZtsw+VuCVCu/uobmMiunYUmr811faRbWkKQH9dT/Jw/tSYpGIlpaItW9IPmfqdkNFQz2USc3ds8YUeQRz/R52kpGD1HeAksB8ocQ8cCIYO7OesTeGHvDQZGTEln5DtrOd6X9QYyTW0cBd43ttVo2NhG4IwBeM9BS1PqN6sdttbf8PAMGB5ABLujL+QnhXj8zagz4N0Nr/Q2LXPCuJSwn4g03Aix7RRig761p8iOVkJ8WFic4JlEH1sLTSy9XO7WbL15yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fQRJj+zpYVXAOoDEKEyJYUtYGGhVWUF4mnFkVpXyCg=;
 b=XKQrDqFj4ozn+yt6d1ZeYve5x4plb/+Fn8DoOBF76Z/871fzO6usMKN0J0vDHQ2v5cVpKkcbf4PLxCSTE/mTQ5/Xruaa5/XbAhZBIjasRv5bii3YtmGWLL6K11gzaFm6CQjTcquB9xeuP9YPdROhh24M0VghMeNNWKqzRJsWP9gnaD7ttYRciIh6vz7EEbgFc/6Gw6ZnU6qTzkgXGC/lpSnhrGP06Q6KhjXV2jYe7Zah295iGRMU+C4kwlovR2S7V25CIkxF5fmtb+pNHOHtQHFQ/KQ6tyLJQxFB/J93pqiibhEKx0CG/Lz2DvihmjbrQyLUgM4OdI5ESkAOW2RhBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fQRJj+zpYVXAOoDEKEyJYUtYGGhVWUF4mnFkVpXyCg=;
 b=kWiUx9AaEwFupMu41JkFJcfcLcq/gsSrfdP14ldP7s0c7AzPAxETsXWnFNPr8kFlO8zcZVIfpyTK9UkZL/2uaFBHW1OYJ3PKGBI0el9JjxAeppy7z1DBZ0DPtfKdHjGHFB4F7QcuKRHLEKolrb8Rn5Tz/k92+XG8ZH7scnZ6KkE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Wed, 9 Dec 2020 23:57:00 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 23:56:59 +0000
Subject: Re: AMD ACP raven ridge: invalid audio mode 2
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: Janpieter Sollie <janpieter.sollie@kabelmail.de>,
 Takashi Iwai <tiwai@suse.de>
References: <07aae8e3-1ee2-60a9-daee-a0172c1012e7@kabelmail.de>
 <s5hczzkwd82.wl-tiwai@suse.de> <d4e099cd-3600-43d8-d2f5-9f7257da80ba@amd.com>
 <99e81caf-2742-32a0-cee1-7ff3ea8c6913@kabelmail.de>
 <3d8b7ad9-c6a4-0e2b-7e56-62b8d898eb23@amd.com>
Message-ID: <ca8fa345-f0dd-330a-5a16-a8dbf68ea687@amd.com>
Date: Thu, 10 Dec 2020 05:42:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <3d8b7ad9-c6a4-0e2b-7e56-62b8d898eb23@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.251]
X-ClientProxiedBy: PN2PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::11) To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 PN2PR01CA0156.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:26::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 23:56:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b40ab8a-8cef-4775-2713-08d89c9e1e3b
X-MS-TrafficTypeDiagnostic: MW3PR12MB4428:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4428787882C817854049960E97CC0@MW3PR12MB4428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJB9UW4EClFgqzJyYrJ5Guj1waIbuNT/Qfw6Z12Q99H+sSKjoLFjn57JR1CI0S4lDUikkZR/YlbelEgSezMIYp9wWGA5rX1dfHsXqEe3X0y3/FsVgpnJxYUQNtTwmc4hxRtcObeuT1AVeEN/evV7Pn8AJKf2s9v3osuwZ8er6NteoZoOdyZupYGYrSW16tWIWeFwpL2nC5FKPQpEgG6th1zBlCG5XnQRcoHdpYPSp1plmfvu2TwRiDSR5ea2BdnQLz2VF44yd3dLXNO6FWkUYvUgLmG6o9nsE1uw+cH9x+7KDHNpPvvqXO/lU4h21ASlmjs3T88YSnzXW26g2yangHmkJp4Z2ABY3QETounhtY0G8UDA1zBGMvgFBnmbc2sZ7WvsCX2qK61/RW8kxLx/hjbcFXfqa85451oZEPzekBrbiDyfFKXIw2uYSG/I9amXVnsEnNrcDPdWIbHe4kcYngEQiBDvNaO7mpeKJnBB6sybZ/kG2zCVCsEjXzZV7zmQShjVybM3bxppbSdmbqo6UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(186003)(16526019)(52116002)(6486002)(5660300002)(6666004)(4326008)(83380400001)(31686004)(34490700003)(36756003)(2906002)(8936002)(31696002)(54906003)(26005)(53546011)(2616005)(966005)(66476007)(956004)(16576012)(110136005)(508600001)(86362001)(8676002)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K0haRkgvWWo1UnV2Z1ZYUlJKWjNLckJyOFFqMWV6L1BpRDhBRmJsV3VlSFht?=
 =?utf-8?B?U3NSOUNFU3BlQTNld1J2czFwbGp4SHcvcTlPQlc5UDdTZkRlYkc1cGYyUkpz?=
 =?utf-8?B?K3Rmb1JXV2szSWZqYVBPeHorb2w2bXdoaUVBYnpHYXRQY3hmd2hZWHZtRjVY?=
 =?utf-8?B?VXh5UFl3OFJ5Y2N6Y3FOQ3JVTHh5eTM5cDNxenJ5eC9RRkMxZ0hzbTRmUkFa?=
 =?utf-8?B?ejYrZnVmQzNFMVlMRExuWWZYVkNjejRXa0dsaEFHR3V2VWU0QlJzTWJYM2RB?=
 =?utf-8?B?dlBrWFlnTFB3Y0laM2dvUlZlRkdnWGp3S25xMXNTV2hGaUEvVGhhenVwSDB5?=
 =?utf-8?B?aGFNRkY4RE9XS0FHVUtKa09ZVm1QR0dITVB6V3I4TlFLR2xiNWY2TFFQUlc2?=
 =?utf-8?B?RlhPRzRpTFVIQVkzN1MzVzB0d09lMmFFbFFMWFB4SVFOL0g1TVV0TXdEaXRW?=
 =?utf-8?B?ckdVcUprMEtYSEwzR1l5UTZmTUU3cm5yMFdZeW9OOSszelFPdHhDUTR3bFFa?=
 =?utf-8?B?clg1S0pQR2NJblVJbFVyQkN4R0xoeFRaMmg3Z2lEejZGZXRHek5sSDgxdkEw?=
 =?utf-8?B?US8yMyt3NVZ6aUdxTlZIUFdzWnlOYnZPMmxCMVJCT1pyN0x5QXd5K0R2aXVQ?=
 =?utf-8?B?VzR1UGFHYUc4cEpVcGdnVENKWElxWTB2Z0ZUMmgxcTQxVEEySGZOcUQvZCtZ?=
 =?utf-8?B?QkhGUjFScTRnNW1ZYTJHVlRDaVcwblpuU1NRVFVMdTFkT01UWHRKclRaZ2o5?=
 =?utf-8?B?WERvRDBDN1AyeTdXRFlQc1ZlMnZhQ2lPK055ZVZnREdndzc0bU92TmpLYzE1?=
 =?utf-8?B?U3FGOTRSNG0vWWduMVhleldDV1h5Zi9rcE5vMFl2L0RlMGxRREREb2FKUGUw?=
 =?utf-8?B?VXJjckwwTFFOM3Z0c2U2Z2MzSUdta3BpaDJLYzhSVUNhdkllSTNCZk5HaXIx?=
 =?utf-8?B?eWNNckdrZnpvTEdES2RkZ1M1TWNqbE1iS0hVVzQyRkYybjdxZ2w5Y0Q3ZzNr?=
 =?utf-8?B?ZjdvQitzcWFvbWpSelJLV2plZzB6TmxZK1lMMDQrMlp0T3ZUNmVVUUw1VFZC?=
 =?utf-8?B?TmZmMjlQMXNYRUJNQkg2MEVrNStxbEhDNDJKaUVsKzNuaklsblEvK0pOdm40?=
 =?utf-8?B?K0hxc0dVdFFTZWFMSW1CcS8vOU4zUytRVEtzNXRCbk50Skd0WTl4dkRoSmZj?=
 =?utf-8?B?MzVFMFVhbzhiNkU5YklGczZFakVFcTlYMmIwTVZaYVdvaGx6NXlsajNyNGZi?=
 =?utf-8?B?NnB5ZVkyQTV1bUROOXRSMHBuQjgxL0lnQWpLTWRVVitEY3pEOVNiKzFFZXJs?=
 =?utf-8?Q?C3aznfVy6dnJEEBlZxbeDAC+FOXopuy3dC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 23:56:59.3516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b40ab8a-8cef-4775-2713-08d89c9e1e3b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ehY7AeJfCNWmb3sTmXea5BSKUZxgU8s6AsKB2qlmst3o5+x/GNf0EekzM1QWJpotXSG6y0TlQCBsL4Sg3gpjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428
Cc: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 alsa-devel@alsa-project.org, Akshu Agrawal <akshu.agrawal@amd.com>
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



On 10/12/20 12:18 am, Mukunda,Vijendar wrote:
> 

>>
>> So, if I understand correctly, the snd_pci_acp3x module initialised 
>> the acp to mode 0x2, and
>> then decides the mode is not supported?
>> doesn't this sound a little weird to you?
> 
> On Raven Ridge platform, ACP device enumerated by PCI root.ACP PCI 
> driver creates child nodes for I2S device.
> 
> Currently we had added support for only I2S configuration.
> We recently fixed audio driver probe failure issue when Audio 
> configuration is set to other than I2S.
> 
> When Audio Configuration is set to other than I2S, load the ACP PCI 
> driver instead of returning probe failure.
> Below patch already got merged in to asoc-next branch.
> 
> https://lore.kernel.org/alsa-devel/1603476441-3506-1-git-send-email-Vijendar.Mukunda@amd.com/ 
> 
> 
> 
> Thanks,
> Vijendar
> 
> 

To add more to my previous explanation, Based on platform audio 
configuration, I2S_PIN_CONFIG value is programmed from BIOS.

ACP PCI driver during its probe it only checks what is the audio 
configuration is really set.

If it sees current configuration is set to I2S, then ACP PCI driver
will go ahead and create the platform devices required for I2S endpoint.

If it is other than I2S audio configuration, it wont create the child 
node and returns the probe as success.

ACP IP do's lot more stuff beyond supporting simple audio endpoints.
For other audio configurations, we have added a default case
and left it as a place holder for future implementation.


Thanks,
Vijendar
