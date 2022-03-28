Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 822524E9269
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 12:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECB9117A8;
	Mon, 28 Mar 2022 12:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECB9117A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648462837;
	bh=Mybjbb8TKKp7VMsIwyViYjc0guQK9zora/49PnulGqA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H9BjY/4DF21IOqi+Ki/UQw3clWZvthVyZ2e1Cl4tdn/+KIYq2qJ/KKEXBvMf47FG2
	 C4XtoFI0erVR+DNS3H+70/9dZVdh4xrE0XiYwNM4Tx4yNhd1ONVeJp6yohuGuBL6uX
	 8SW/zKp8ofOKtD/63Np86v8KRgA5hEHZMVOhJ7xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ED28F800FA;
	Mon, 28 Mar 2022 12:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65192F8024C; Mon, 28 Mar 2022 12:19:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 147BEF800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 12:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 147BEF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="birGGCfA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuyuGzDbh3ASOeaQj8HSfc0s+7RFG6BJKjqrvQH7gLtO4I6A9TnpJRFMFfwT13JBJ9i0XlOcMMPMiRVMp/wkgrWkZhkWW83en43g/uV45pKYjXW2t3nNzadf6UjeQ7EFGc3Nzw2l8OJo+NFvQ3YI+DmUwZ6XgxrJ0vXbZl+KqncIzw8WxlpXEekhBk66q/BGXM9LH4l1oMu/yx4D5l+GBlWrbUDvpvRVHR9Y6n4Q26Scr2DBNOCMy5EolazEoktHSRpKqTncjN1x0IERNvyZGi0FV8/PP2qL0JOhMWF9wyPmy/H0KDa869gk1a7JqT9W7rVYyQi7l7fZ1J6am/SB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqGvBOX+RZHvjpULbSIhtYrmhtAz8sV7FD9sgqjRNAk=;
 b=e6nNLe2495XHwq48IYtvbHU2xCA4iboX4v8s8g3/IxXhi8ZVF5/qvWVnmLMW4Hailu9ThD/FhvugaUdhDNL0xIFywVrQQMQeEb01ThGNCHdU64mGMXoVhnbpU2jHXx3hjgf66kQWgVLUHXNn6gy8JL3oZc3G9f//TFAunXvUG5lvRiCHhScqkxrw9N9RtwsKeqZgoGVoTSDUZ04yj5GtvGPAcmM9Iz8v2XFuqVG30q4PEEHkzG1FACKHZhkAvrLKH6yeKUebXR82IvCe6evXnDKoqEWIyz7c8E4ybMeMWodG/S1AGMnQdxra81L874qF36Mtv2/BEJohr+poXuT6wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqGvBOX+RZHvjpULbSIhtYrmhtAz8sV7FD9sgqjRNAk=;
 b=birGGCfAjYZYPfKVkhyxUJm6SshIhZCn7/1qJJkZ5gzecOl6iFBvAzckoiznzQQJWIgZt8+8lGMXdR88tDG5bZy0a/xk2gFKQeKZMu5YOxBEc4KtX8k/okQQ050V+FQybur8n0MqSsailLMAh8ho7Ngj0RSJIs12SAzE6ooJ9yFo1tydNSEudhx4UvgOt5GJ1i/mqEESYXnFdGStNrSas+xdUUx+gBibfmbq8itw3+E1pIOEDbzs2LyItUc079qF/ZS2VcNKxmlL510+CvAjzAhPhbYFi/iwKKgR9mjM9kQolEEHWTB6ng8dq37TXojSOTlzt6HuXqH326HjF+I/vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23)
 by CY4PR12MB1704.namprd12.prod.outlook.com (2603:10b6:903:11d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.21; Mon, 28 Mar
 2022 10:19:16 +0000
Received: from DM6PR12MB4435.namprd12.prod.outlook.com
 ([fe80::83b:60bf:1e58:de83]) by DM6PR12MB4435.namprd12.prod.outlook.com
 ([fe80::83b:60bf:1e58:de83%9]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 10:19:16 +0000
Message-ID: <7f7934e6-137c-4d8d-049b-0ed5e57cf00b@nvidia.com>
Date: Mon, 28 Mar 2022 15:49:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ALSA: hda: Avoid unsol event during RPM suspending
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220328091411.31488-1-mkumard@nvidia.com>
 <s5hczi6l8fz.wl-tiwai@suse.de>
From: Mohan Kumar D <mkumard@nvidia.com>
In-Reply-To: <s5hczi6l8fz.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::26) To DM6PR12MB4435.namprd12.prod.outlook.com
 (2603:10b6:5:2a6::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd0acad0-2cde-4678-1962-08da10a469cd
X-MS-TrafficTypeDiagnostic: CY4PR12MB1704:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1704674204BAA615A1E450DBC11D9@CY4PR12MB1704.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SosaDeAtztcOthhso0atoao8IE6xME4ZkW/0Apxqy/R3rnDWRc9UyvhugYc6HfA/kqJVIs/b0do2lwuK/jF5lB2CpbQEaZ0b+0iqp0VoHm9RV5oQtaJTMhdRmMiATm83w7UuRRSd8LWl4t7L8IYMtga8nqF/itdHT1MaHGwhfjPTkbhI/qn9CrI0KydRCAa2tZT+jAxBL8fUdxYOZHNiH8CL17lOHW2V6jxbYjlHVniJ04jdMZ6FTgfsx2TCBM0hvBrp1zSPnaIo25OeRO2D00IYxZyFTO0nYIPzTbYVeAP1fB/zS56RvS5PF3dVuXAF9zGeEd/1PpshU3j2zGqViIS+/C4+8PWZbpk8FXXrv36MdCvK3q9sWEhbne6XHJ2MNh1O7MWZC170ELMtKWizwAwHiFBrBYOZjUr6j0c0s5AF7JEnbxir17F0XXzpj5XnJCxzUP4T9h4wIENKD3sbudQo/AUdlMe6qDjmODmRWgA3MD8GnVmP6nTGsGcjegakLAhmWOXzIdBpaezgTEgd5Sms9zqp50a5iaqF6rsvjsDMXua+CPMgO01Ziv4kwEWzmtSSNNPknWsk3lbUf9adF2KDeRjbHVK7QaWyHaJC12D2ioJLeZka06XQHAO11sEyRO/5/rsd6LduP5Dy2CJRXmpW0gJSoWjzwHgTwIZW+WubkUXaMQyl2edsttvHp9i6KpW6YmPbQFvwAcQ4rnuM6s4v9i4wHtz5jpfTVgJ4+rEhv1VOwSZPTf3BZRUf2sIN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(53546011)(2906002)(31696002)(86362001)(508600001)(4326008)(15650500001)(66946007)(66556008)(66476007)(6506007)(8676002)(6666004)(5660300002)(36756003)(316002)(186003)(26005)(31686004)(107886003)(38100700002)(83380400001)(6916009)(2616005)(6486002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlppdmFUQ0dSUzhxU3phek42NVZib1pvd0tRVjkxcnZXMDNPUG5RRkViL01m?=
 =?utf-8?B?dFRndG8wUmQ5a3pvaEFyZUMxQ1F6ejdKZFBuQmd0clhDTWROZ3V0Q1F1QVpU?=
 =?utf-8?B?Qklmay93UE11U1FDd3BvdFZyZlAvQmpjWlhiQlRzMTRxQ2dnOG5MVTFoTmJS?=
 =?utf-8?B?QVZUMWVXRHBLOStqNE5aUXZoUElOMTFyT0d5WTZZNmNibnUvd0R5ZFRIQVVz?=
 =?utf-8?B?RlpzQ3JMV2k4VHU3TzlmYmVFbmZmU2RNVGc4djVCVWlkalRiVy80d2kxbFV3?=
 =?utf-8?B?NnI2M05zRURyT2dZYWlDeGx0R0RaenJmaWpSd0s1WXdNc0cxdytIR3drNVEr?=
 =?utf-8?B?cUNLemFhbE9Meis2VCsxaW1ndjA2OWF1clJDZkZtZmhSdUdqdUJIbUtOdWxw?=
 =?utf-8?B?eTJUenMzWXlJWG5rR21QNDVrZk04OEExQ3RsbTQrNmZWOVZncEt6bkM3SVBo?=
 =?utf-8?B?dUhndHlaTDFLMkxoK3lDTVJyTGhRdThobXY1ekJqSTVzQVE3ZU9lcnAxN0p0?=
 =?utf-8?B?Y2xsbm9NcENHMC8rL2J3RnBsY3NUUXNQQW9heWZKekVDc0J4NnlDV096MjhS?=
 =?utf-8?B?b1BCdnd3cW0zNmp2VUV3MTExSXQ2ZldkYnhxazB3akYrek12cUcrbUwzS0dH?=
 =?utf-8?B?TGRMVTdNZEtNOUliSEZMUWx5UXRVZ0w5YXgwMDJNMzdKV2NGbmN2VWpWUWtZ?=
 =?utf-8?B?NzVRTmJVZWducU4zbmFWWFVoajltMnJmWGRxeDBYM1Q0ZHpDQmhFTUtpZU1D?=
 =?utf-8?B?ekZMbFpoNzFaMjFGWHhobVl0Q1BDMGZPc0hRUW5jb3VYWnZQVkUzSFdrb2F5?=
 =?utf-8?B?WkdWMmo2aWY2YS85WU95TkpEUHl4TzVPNEhKeFlKc3VvVUlXMWZ0WG9aTisy?=
 =?utf-8?B?SVFUWjg3WWU1NnlUbjAvejI2Y3JPRXE1MG16dVpRckQ3cUF0ZHAxRXVaWkRx?=
 =?utf-8?B?MGpUc3NMVWFXNmtNK1Q5TXU1emhkMUpib1kxUjc5RWVWREE0WXZkS2NLOTd6?=
 =?utf-8?B?MEZ0UUFBdk9sRXl0ZzZoNFo3a0hOdG9OYS9peWk3SWdqeGloMUVJTUpDclhO?=
 =?utf-8?B?MEtURWtMQXk1TWNHS0pHb3NYNG1kVUFmeGpLL2w3L05ydGR2elBYMDE5SFI4?=
 =?utf-8?B?RDAraUNjdHNWVC9tOFh4RHpGWVhCeVBBRXIySGZ1cysveEhxcFJTMFNCMjEv?=
 =?utf-8?B?T1dFekkxTVNsUjA4bVpqWkhXUWxFSWpEUWcwQ0RPUjdUTnlGTENEZE1yUnR1?=
 =?utf-8?B?OWNGK2doZDN4L3VQOG9PMFh5RjR0cDZ0YXRwY0lCSHh2UnBySm9VTmNtY1Ry?=
 =?utf-8?B?SFNITk1JSGt2QlZIeU1sWWdYNnF4MkE5MGdWOHJ5RnZYcmZXNDcveE0vdjVy?=
 =?utf-8?B?cmpjTDl1cjMrZ2FueURnenUzamFpeG9uL3JxOEVMdXdnb0lrWHdweXcwcVVu?=
 =?utf-8?B?dHNlZHVKYjk0eUN1aW12RmdyUnMxTmU5akJ3WjloL2pseTNlMS9RNmFjRk4w?=
 =?utf-8?B?UlExRUovaDN3REdKemNRelZySkxGaWRtN3paU1lzd1pOdVdpcUYxbEJnU3U2?=
 =?utf-8?B?alNrZVBYcmordzViQ2cxUDkzMmRMUFZhWEFFM0xjMVl5dHU3allOUmcvR1Qv?=
 =?utf-8?B?cmRhcEU5QkJiZXJXcHpBQkVha2Z3ajhkWjg5TkRzbml3T01RcVdIN2lGVTFI?=
 =?utf-8?B?UU9HMVg4a0ZDM1BRZU9yZlJPTXRQVis4ZHV6SXkwUXpmVzRiN1pzbmZ0THlF?=
 =?utf-8?B?MGkvSGZlUnNnWUs4Q1NQOHFqZzVYYkhLVWlaSXh5QkdQbkdNdTVEbk9wQU5O?=
 =?utf-8?B?U0JKVjdmSFZkMUREd2J1MVp2ZlVpYUpqTnBlRVpvb2NDSTVBVisvakVsU1Vw?=
 =?utf-8?B?ME9TMGZIMjFFL2EyTGxxV2lCc25PSnUwOHU5VjVER1JaZW1XaXVMREFJNVB2?=
 =?utf-8?B?aFMrTldCeTl3SzJHUmZDL3FTdlZHbkFXd1NwUHhqV2k5WU51cGw0SWw5WW1P?=
 =?utf-8?B?S2NLSHFUbVlXRWpHbGNoZENJL29LWTZqK0VjY0x1djFrN2J4OFFBa2VpaHNr?=
 =?utf-8?B?RG5ENGFQaWJ4a0E5YWVhcGh6RUN6QmlOWlJ6REhocWFzWW0rZ3hTTjJRUW5V?=
 =?utf-8?B?Tk9kZUxrdzdnNG9WU2NiaGtBZWt1VUFMWTdsbU1ScXBkQkxCUGRnRjNBVUZh?=
 =?utf-8?B?Y1dZWEE5UVM1dURZbWcxQnE4RkJtWU9aL00xVjhuVHBkMVBrVDRsMjdOQ0Qy?=
 =?utf-8?B?SXFhek1FWnprZVdLRmFEQVBCN0FkbXpCRnVhM01TWjlNamFTaitqeXhLY3dw?=
 =?utf-8?B?cWtkcHcrYXNsVHFmTk0waEkyYmI3SklzZWpWUzF1RGVWOHRPOWpGdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0acad0-2cde-4678-1962-08da10a469cd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 10:19:16.5513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uwy5+P7sRJzB8ipyh+IiWw5WyViCct+ni8HSYtHlEIbzqLTTmLRJZxD3d7PNFQzLhYQqi9XcYA1bBWtgSR4nhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1704
Cc: jonathanh@nvidia.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 thierry.reding@gmail.com, ville.syrjala@linux.intel.com
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


On 3/28/2022 3:12 PM, Takashi Iwai wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, 28 Mar 2022 11:14:11 +0200,
> Mohan Kumar wrote:
>> There is a corner case with unsol event handling during codec runtime
>> suspending state. When the codec runtime suspend call initiated, the
>> codec->in_pm atomic variable would be 0, currently the codec runtime
>> suspend function calls snd_hdac_enter_pm() which will just increments
>> the codec->in_pm atomic variable. Consider unsol event happened just
>> after this step and before snd_hdac_leave_pm() in the codec runtime
>> suspend function. The snd_hdac_power_up_pm() in the unsol event
>> flow in hdmi_present_sense_via_verbs() function would just increment
>> the codec->in_pm atomic variable without calling pm_runtime_get_sync
>> function.
>>
>> As codec runtime suspend flow is already in progress and in parallel
>> unsol event is also accessing the codec verbs, as soon as codec
>> suspend flow completes and clocks are  switched off before completing
>> the unsol event handling as both functions doesn't wait for each other.
>> This will result in below errors
>>
>> [  589.428020] tegra-hda 3510000.hda: azx_get_response timeout, switching
>> to polling mode: last cmd=0x505f2f57
>> [  589.428344] tegra-hda 3510000.hda: spurious response 0x80000074:0x5,
>> last cmd=0x505f2f57
>> [  589.428547] tegra-hda 3510000.hda: spurious response 0x80000065:0x5,
>> last cmd=0x505f2f57
>>
>> To avoid this, the unsol event flow should not perform any codec verb
>> related operations during RPM_SUSPENDING state.
>>
>> Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> Thanks, that's a hairy problem...
>
> The logic sounds good, but can we check the PM state before calling
> snd_hda_power_up_pm()?

If am not wrong, PM apis exposed either provide RPM_ACTIVE or 
RPM_SUSPENDED status. Don't see anything which provides info on 
RPM_SUSPENDING. We might need to exactly know this state to fix this issue.

>
> Takashi
