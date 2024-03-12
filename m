Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2377C8798FB
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 17:30:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BDEEE7D;
	Tue, 12 Mar 2024 17:30:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BDEEE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710261019;
	bh=IcVf7NWIVkll8edLcA1yimAxN2NZRW8r0YWSfscuY9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AVNc6UK6TvudPakKRhte/Tvjeo/oBg150GklWI6ZTrQuaqj/pHPQCYTVgjOYlYnyV
	 LXATpSa0azLvBU4KHuxARDdgZDc0X9SJuTU7EzwExmLTTi0pE/wbY1jFB3DmfNxfzz
	 fKXxoMcLVXsQ2XJ20RCOWUrSLbhJ+Vn5j8Zs4x8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17C2BF805AB; Tue, 12 Mar 2024 17:29:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 469BAF805A0;
	Tue, 12 Mar 2024 17:29:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FD91F8028D; Tue, 12 Mar 2024 17:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E3FEF800E4
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 17:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E3FEF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Zq1vjMA5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKDC/J7vpbCXdm47w/geer/xnxLaUlqxrIs9SXMv6MbTrGlAvQE4c+MSTlNYVcdKimrhNVmG2faLTLx6m397B6SFBvNWnbNGxsLsTjW6TlH5RLFE+83P6odTEjKhzQtpCXnXRKPNd1UFZkexw+h2dbD8vhFUW+iyOBYWhPs1dORGN31McQBcykhcCFcGiHOXp7rVuIYLv+2jnjZAXHSJpiXJ/EztG7pWypW/+h2DCbdF8UypwYljVJG67WynzMJtYs0S9e1X1jwzsjCeTUALLxwYKOongm6MJ/gXbx13BPslfMxF5e/M47zdzywIdSwakYJ6sCR1f3FbgxBsk1+cZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTZA2fYeiBcRfGDW8LZezTuT6G/5JqmBdeWSdRBUD8E=;
 b=HA9YamZbNpQWZ4ZJ3hyJsU/iP5kTzShx4Ckyx/IZJnmALoADuB5woMq73AI10+bGLH0uAK9SmB25qx0CJqufhnMq3n/PTsWQBciN5yTkEaPLeHqV0rs+xr0qTT+5KxX7FOGJr5xNe0VZa2719AMCnKsVmUxJH5Oh4sk9tD+Nj+q3CkNdcndigN8r18bXHJXMABVdtQm+swOzIMyWN2Y2l1BmYNp0/iPWnpXJ7/sTed7H4p0MNs+9PtzgrHgoywBbiN1+cAyrJwxocNJyyzvhqS3F0ydplnksRKm77DaTFZpnORRQVbX1tsK0feKBl5TpnSF+q94cPt9LnzjRM7mZ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTZA2fYeiBcRfGDW8LZezTuT6G/5JqmBdeWSdRBUD8E=;
 b=Zq1vjMA5OBSjxlwAxd/LIMiivO5rd7JXwjrw5dYlKcwXmj5ufygvOF3dW9rKo8RsVCc+F5YkezMfopBC49UXJNCiueQL4uPo0XfrSNHEP03/XInjQ1rd6aLd82ZSk40ue03tGgnU0J9hYsiXdknWWvwKmR0FHxv2ywhvSNrQGPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SN7PR12MB7452.namprd12.prod.outlook.com (2603:10b6:806:299::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Tue, 12 Mar
 2024 16:29:19 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3%3]) with mapi id 15.20.7362.035; Tue, 12 Mar 2024
 16:29:19 +0000
Message-ID: <e6ec31d5-ab6b-4c28-8fbc-c706b56c7630@amd.com>
Date: Tue, 12 Mar 2024 21:59:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 00/13] soundwire/SOF: add SoundWire Interface support
 for AMD SOF stack
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
 venkataprasad.potturu@amd.com
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
 <565b9a1d-a074-4bb6-b4c5-2b9be9095a3f@sirena.org.uk>
 <581a81f4-e540-4de2-b17d-51bc192ae6ec@amd.com> <ZfBmoe4Rv2zjS7PV@matsya>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <ZfBmoe4Rv2zjS7PV@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::20) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SN7PR12MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f8f540-ea11-4ebc-6de1-08dc42b19109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7ok9d64gYgep3xwnbCGNM8pV6OwyIPnBHcvF3UvGjk5PWrUeDeDTQbLcQsf8z2wV2fX6RqYH4pD/7hvsKKes4LdGpHrH0LwurVfCffM6pvPy7zRCsNHtcxZyvKW7Y/Mz1++YRXOFpfuxyb4ewPfpc65X9svQ+8SJn3CiZ0lxKigDlcNB+7mGhujIMM3NpYYJVx1Prr6LhEtGS/A2uMgEc7vsPkiqkn7diIRj/CYTnc3dXbR6uGT6kvNS6ky4aIsY4GDTI2Ta/g9JeJPmE6yte7659Y++T4rPdngmFUp6kXfWceiTSgX0+OHbIRHhuMzf2XRdUc+Tf38bzBzqu5TPNB+skToHa6lWvUDKipNTJMgAPJlpENppkh1pt2B8/+HsUtwrwMwoG8X7CxMJUkD7UOsVgrGy1nUPtAzVfU1dT9i7ZproRlPjXFEmZSV1kAI7gVyM2xZlfYIbv3jmhv74CQ6sy0MYT+tgLxHrtw6ttYTylR6iKk++3YmJN3W31mkux9psAlYDpUctCTQTignz/QJUKjiw4cvPEvIBmj7goBpRN1ZAmB5/i8YPcRKIJ+nPzDH2ofRIPQlAPgPefpUTNa75AEbD87HtqZWLH9/bErU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qm1QQUZtbGZpdFkzcElFL0dPREhpT3ZVTUtFVy9SWkVxaldySjd2b2FVRFJz?=
 =?utf-8?B?Mis5K3hZcmNYMHNFYm43YlhyenRGNXBmVFMvK1VSU3VlYW8zcmxVZ1BWRjA2?=
 =?utf-8?B?U1BLaHJQTVVGV2FSN1drcjI3SWdNUXptajhJcldBbkMya2g5aDZRNU4yZFR6?=
 =?utf-8?B?VHNweU1FOTlRai9LSjVQVmdJOGczUWJlL1dOam9YVzRWTElnelFxV3daOUFZ?=
 =?utf-8?B?eHo5Mk9iR2pGbU5FaW1sMHhUMUY5V21nZzJFZloyeERTeVV0Y1I0VkpFR0Vy?=
 =?utf-8?B?UnpLM0U5dzRKY3JJODl0NlJDS3RpVGErbzlBdUY0RUYyU2ZQNmIwRERLSnFo?=
 =?utf-8?B?RGNwTTdzZExWNkMvT01MOTl1WUxJcThnVkxZc3d1cFUwblJVZE5TSUtJREQr?=
 =?utf-8?B?M1pwcUV2V0J3bFcwVUtCUDdVUWVLT0tkNFhka2VPVEFqdWNsb0sremZ6eVl1?=
 =?utf-8?B?cFB0RFRKUHdoNVoyVnhkM3dWZUwxY3FGRnRxdDE1a0plcVlObHJ4L1A3N1gr?=
 =?utf-8?B?QzErVWtOZFFhT3Vrb2dOUXJuZFBXQkdBamNoNWZvdThUTGd3OUUySllTd2dE?=
 =?utf-8?B?S25PREV4Z2I4Smk0MXB0UHdodTUzdjZYR1h4em5US01EeWdiZ0drNmo4TW04?=
 =?utf-8?B?MjQyVm9odExTRWJvc3A4MFZIdmJaNHVYcGs0N3RLb3lOdTM3S0NYTkRNaUUz?=
 =?utf-8?B?NitJa3NZNnZUUWIzUGNzSVNsZTNad2p6OWZsQlFvSEJIWHdhWHEzeGQ0c041?=
 =?utf-8?B?UDZkYUo2VEdna0pZSGl5Q2tuTENYUE9yZ2x5U3dzamplcGRIaTU2QldjemxZ?=
 =?utf-8?B?MWNSRXBsMk16VHl5NWFuOXJlV295UjI3d0NhL20rYTUvQWJzYytsdVNSbEFh?=
 =?utf-8?B?VWpub1Q5YS9mdWkrV1lYRzZteld6ZzF2alFqNHc4bGZnSUpaQVJ5ektqRGNK?=
 =?utf-8?B?SGpLWXl0cmlKU1N1T2lhUTNVY1kxVGc4ZFg5UjVOOFd4UGprakYrODRzSVI0?=
 =?utf-8?B?Z25XdDFiL3d0Q0piemsvMVhXR1JDNS9jZE96bzVMNGtUenJIKy9HYUpOQTNI?=
 =?utf-8?B?T0NzdzBvNGo5T05RL0lGVUVCb21Rb1U4RGw2M05xVUo4NUZTUnZFT1loTUFW?=
 =?utf-8?B?MFA3UmdwZ3ZHc1NycmFrSEloSkhVUjJmbDJDd0M3RUZpOS90MjNMYXVwR2pV?=
 =?utf-8?B?TzNVZUptTGNTMFRCUEZoMDhrSE1WemJqN3R1S0wyM2ZnWHhJc3pRTDhPYW53?=
 =?utf-8?B?Wm1CaEJUM3BkYVJIMEhQVGVBZDA2Z1JuYno0QmhNZHM5ZVpHMTZhUEZzdURD?=
 =?utf-8?B?QkZDYmtsallWdDRDVEdoU0syOVdBZ0x5NmNjZ0hnTEFFeEY4OWhQQnpuRmpX?=
 =?utf-8?B?WVBJNjUvMnpGUThDWWhHNGpldTJVQ3k2UDZ1U25uVDl0WFB0MFRKQlZMdUZq?=
 =?utf-8?B?NUYzUVJzNUpJOFdRa1c1allBZnRVKzFkWGl6cnRLTEwydWJjMkhpZ0tjL3Vr?=
 =?utf-8?B?TjgvUlRlbGJoSEZ0K2Ntd1BjczNMaXJHMHAzU09IZnYvT0gvNURaRXRwWU1W?=
 =?utf-8?B?SWtEM1k2UHlLSmZYZnB3ekRBMHNYSXZSMWRHZ3BaTi96aTh3c0xzeFVDMXpt?=
 =?utf-8?B?eWtqTEVWckFzZmY0MzlsL3BUNHg2TUJVUUIxUThSLzBWTmZwNmFENm00dDU2?=
 =?utf-8?B?aHdneW44cjhJSlVZcnd2RVRSdWZpcDFSNzA4NGxWcDYzbWhKd09RSGhydmE5?=
 =?utf-8?B?cGhuZlhRS0k4Y0IvK241WERLZUplQVlGQkJObmZSaGFrV2hhZDdaaE40dFln?=
 =?utf-8?B?dzdpVjdhZmxHS0RpUEo1RW1ON2dIRTYxaEFiOVdxK1AvYWFFOWEvcGZxZXJP?=
 =?utf-8?B?alh3akk1bFJuK0ZFcTEvMGozOXBNcTZvb01EcnhXdWN3c1RKTDE0OHpkT3Nv?=
 =?utf-8?B?ejVXN2dONEdyU2NDT2NvbHNJcTl5YWt2eUd6K0IxeDkxZXkzNjZFTDFqUjRR?=
 =?utf-8?B?NFBNcGJJazNMbithTkJjaE9QSmc1R0Z6aXY0ZWVKdXA1NDA3UEZTV3ZlbDVO?=
 =?utf-8?B?dUNUZ05VSlVJcGk2ZlVwb2M0QXU5UFB4aVRQaXNIbnMvZFhrZzRMUHFOZUVu?=
 =?utf-8?Q?TlTduwkNiJeXvNqiB64242SEI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87f8f540-ea11-4ebc-6de1-08dc42b19109
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 16:29:19.3565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Qzl45/tCs98+8wnZG+Vhnlu0L/uWhUXs4EcEzQKn7vEAFotrfZdhl1CsUdb2e3Bsil75lJGfo8FYWCss1tCJnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7452
Message-ID-Hash: ZTIQXPQACY3SCN7HSIZRY7XN7UQUBPV2
X-Message-ID-Hash: ZTIQXPQACY3SCN7HSIZRY7XN7UQUBPV2
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTIQXPQACY3SCN7HSIZRY7XN7UQUBPV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/03/24 19:58, Vinod Koul wrote:
> On 04-03-24, 12:17, Mukunda,Vijendar wrote:
>> On 31/01/24 23:21, Mark Brown wrote:
>>> On Mon, Jan 29, 2024 at 11:21:34AM +0530, Vijendar Mukunda wrote:
>>>> This patch series is to redesign existing platform device creation logic
>>>> for SoundWire managers and Implement generic functions for SoundWire
>>>> manager probe, start and exit sequence which are common for both Legacy
>>>> (NO DSP enabled) and SOF stack, and add SoundWire Interface support for
>>>> AMD SOF stack (ACP 6.3 based platform).
>>> The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:
>>>
>>>   Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-soundwire-amd-v6.9
>> Hi Vinod,
>>
>> As this patch series is merged in to sound git, Could you please let us know
>> when this soundwire patch series will be picked in to Soundwire git.
>>
>> We need to send few fixes on top of this patch series.
> If you had told me earlier I would have pulled. It is late now in merge
> window, pls send the patches after rc1 is out in two weeks
>
> BR
Hi Mark,

As patches already got merged into for-next branch, are you going to
create new tag for SoundWire patch series for RC1 release?


