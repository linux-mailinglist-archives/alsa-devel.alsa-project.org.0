Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 849AE745FA2
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 17:15:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A91287F4;
	Mon,  3 Jul 2023 17:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A91287F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688397319;
	bh=xaIGQKHI8nyDeidwTWBlfGAJE1KOpCosmVzfuX2+6kQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PtyBStPgOAnZK5g2/p0BueEf2T7LioFuB1C4dcBjIw62wdq/FFwUZtRbLtqXpKxe3
	 DM8pEqZai9xwzqExFQaoMrzW2s9HUA91rI+iXypsVa9vD8yVyfsVghiIsb1JPa/IUe
	 qbEX7mapz6RrLov8jYefa5aLpZYeEsCoQEcu/PMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 392B4F80125; Mon,  3 Jul 2023 17:14:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07933F80125;
	Mon,  3 Jul 2023 17:14:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 017ABF80132; Mon,  3 Jul 2023 17:14:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71AFBF80124
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 17:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71AFBF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tK5dMJ6t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btm0HPMoVN1SiuDUrCzjVoXZLeRNEZ6wqUYDNHDmUknd3n70s4ip86SqL6+WCZDbEifw0i0pd8GSSguzxh/TpwWBALfIKQlrmLbDYbAkTyzMlwnwv8+a9XqE5IQEc/EyC3/AxRY2HBEmgKEb5tV3Q6dgYN8P/5OtT8vUOheLiYHkn4Kt88aQufrYXqM/z3TjwbmLqc5n8gkqtdBBjCgjbwKpl1cwI9sofuuAZ7zuHY1BiNo7vFypEtl3VjrmPjQN1QOy2FdH3KspMIquM/00je6lavxKz3F3MsxaTTI7wfeKDW1mPr4fBzdv21kk33CW/apcVU5xL5rQt27x3RwGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfDpwbXyvWRhLCwsJAzxnUQ6h8plJJy6ATLkhSmUM9I=;
 b=HvinsDwwo/L4dNuNKJuyX8O8IeyQ+sbNS12uYFfh3XIQAQiqn5Mtu41YAvvaTPlgEz4DrQd0pOpd2i1rdv6WcbfHIxShfW0nAli1RshywISqlgljngxKW5ZBCE6q4/NnFPRZC70n0nhaU2LHHM2DofXNSlP7ov9FUKMsaSEaouRYtjNVQkYZABXbjghLXQtusffE5mB+fhbpt3NOf4ISCGzAyK7dGNW+oi+ebYTgwbS+MZI4d0KIOArn9TGtDC0maheEapybBYQx9qeCgLMSqC7a3HiqgWRTMhdPIADlZ2/ut2/DtTZ1Kqttv6rB6eoFXiX3L3mWgrULkQa8aCsmoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfDpwbXyvWRhLCwsJAzxnUQ6h8plJJy6ATLkhSmUM9I=;
 b=tK5dMJ6tXGujnDEoKDJXX+n7KO/RM5U0zhoIo1DR07Uxy+wJ0o7j/racPO27vV6ptsh2X2NjquYBeimExghc/QOkigTm5JwDQUy4qnRAIMgIiVbGKVnyHGcoQv86HWK0NUz2o/7INbqxRw8lvL25HgtJ4O+19YEasIVXz/3jGX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by BN9PR12MB5291.namprd12.prod.outlook.com (2603:10b6:408:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 15:14:13 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 15:14:12 +0000
Message-ID: <7c8b7cc9-125e-e97e-2a42-046a025d4e94@amd.com>
Date: Mon, 3 Jul 2023 20:48:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230703090247.25261-1-shumingf@realtek.com>
 <f9e83b61-6e69-2467-d5a5-3c3a6a40e018@linux.intel.com>
 <81bf0fcc0b824c928e2e4e5a77ca37d8@realtek.com>
 <a10894a2-a6af-8c5f-b675-79cc7cfeb899@linux.intel.com>
 <1fb4d8ea138140d291a395dc82e710ae@realtek.com>
 <489e8631-b773-1916-40a7-3fd73af54c19@amd.com>
 <80c35e78-b82b-5d8a-bce7-fa8bb61e16cd@linux.intel.com>
 <a8c7ac88-4546-2b57-6f26-5ae2a9e603e4@amd.com>
 <95586650-6a22-f760-5eb7-0e1e3a5c0346@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <95586650-6a22-f760-5eb7-0e1e3a5c0346@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::7) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|BN9PR12MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: 8930b69d-3267-430a-d6c7-08db7bd8286a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tz6EcmoHOkNVtjqk8EY6E/y0fD8T1iKlzMGyKnunwZq29ydvr2sPTxGJbMlkj7LBSb6SJDtHpWLCve37YiShoWUWSq4gwpXqb5aHOQv9tL1zCznryvBwvOv4xmE0QbuiNKbGdncHx+eIUfS+MO/96cHRxstlbsaMCTUWN/7piv4QQPyr10+JLDxCsona9qwjdMePpR3JjzUFfaCb6ZORgR8kf7VzP8Ec6VlkO+6a+OHLEKpB3XwMm7UfdGqdgDF7Ye+R2llUSZvBqCnc3MtzFxNlwsAJIi2titetL5d5CXcgF8JTJ9DcMnZXtfEepVN5a5+Ip/ehTnPDqr61hsqT6y9B6e3FjP54IEdpwNZaqzaTPKvrgD3sYLKltDy/IW6DsqUyGabQWMN1FmogOoufWb/6ekhmoL6083klYfIcLEEtMwmzgT33qUodv+Txx2/JVjXK4uMzJNE9TWAYJejF0MGCWGfXl/gBBWMi7HfrsKvg+ZJWArnJ1BKHvAH4naIGSqq/1qAA83+oR7vVL4jvHZpQVj04naDw+SakC4jkS4NFQ1lJ9/QQKmRISqB4+/WYEefDR9Bx2IDjuKGPN/6Le8HcA12bMNQPSIIkmZuDAqdnhZ3OLZBOFx9HttGUoWp00YFIAw4/fqt+mRAKVa4lQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(2906002)(41300700001)(8936002)(5660300002)(8676002)(7416002)(36756003)(31696002)(86362001)(186003)(2616005)(31686004)(478600001)(26005)(6506007)(6512007)(6666004)(53546011)(6486002)(316002)(4326008)(66476007)(66556008)(66946007)(38100700002)(54906003)(110136005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aGprVmE1aUpIcm5PY0ZRMFVsMTA0ZXZRaTFUeHpMSEE0N1BkbEJrN29pK2gr?=
 =?utf-8?B?QzdHVEFLLzN6NTVvRjNwRWltc2liTWpWeFE5MkM0NitVbkoxT1hETFB4OTly?=
 =?utf-8?B?eHVmM2Rhb3RiUEVUZmdlY1I2L0xSYVZzQWg5cnoyK1JhNkk1MGUyZmJnU1dC?=
 =?utf-8?B?TW9vUG9MaW5jZVo5NGxlbkpaSThnUWROUVl2ZU56QXhwN05ER2FxZk9zTG54?=
 =?utf-8?B?LytWTnJoVENmWm1wK0tvbG5RcmlVY1ZCb3FGNTdMOWEwVjhUWlp4bkJGTVUv?=
 =?utf-8?B?QmtmSVRPNkN0TkcySWwrdFo5YUFNcnJGQ2Vrd25aMjZMZjFPcnlhbGlpUDJ5?=
 =?utf-8?B?WkFvM0V6YWY4RFBIYks5SHcvQ0Z1MnhoSjEvYmlMMHdIWGZvdHh4aWdESEVk?=
 =?utf-8?B?K0lEN0g1dTFiSFJxWFdwQTR1cThXSG9HVmRDZzl5VGtCeTU0TWFpTml0bWhD?=
 =?utf-8?B?UVhOeTJxWS9oZmtVSmxSWHFLdmJWUkt4eDFPQVpEaXF1Um80dVFqWHNjYmFU?=
 =?utf-8?B?YnFFYlJBRFZVNmpEMXZkMTdCaWVTQjlERDVRSUU3eTg0cnRCcGozc3pzcmRX?=
 =?utf-8?B?WE1yUlExZEJLTHg2TXhYR3N6MnpBb3VBK2JPZVpuM25DVmRaWXdWaEtQU1pB?=
 =?utf-8?B?UTQ3V2dVSmMwaXBENFE2bTBvUDFzS2Z5a1dUL21zdWswWUQySHc5ZGh0SURG?=
 =?utf-8?B?ei9oUWl3bTJrbWJNTW9ZcFB5cWxsU3lRNE1hWmpLYzMyUUwvblcvbjNIVGor?=
 =?utf-8?B?QlMwTFJBbFJQTzcrNGlyclUxY2srL2ZIRHNrUktBeDhUeEZNN1lmSGRtazJP?=
 =?utf-8?B?SWdxMGJTZUxpMU9idG5lUWpZckFFZXQyVzUzNHhDRkFuTmxLMkJEcmlQR3Ez?=
 =?utf-8?B?UVVBdUZrTjl4Qm10ZlhUbnV0aG51YUZ6NThmSWdpRGFzQWNtakc3UEYzRDBP?=
 =?utf-8?B?UkdSZS80RGFOS1lZa1I0SVlINmZGdWMzck5oeU0yU2JYd0pDV0Mvbml4VWVk?=
 =?utf-8?B?NzhGdC9BamhvNEwrOXZhdHNIMi8xaVdTTEF2K3hMOGZBWExabitRNndLSy9F?=
 =?utf-8?B?ajJ2MzZUMlFRV0lTcGhJSjRyYjIwQU82MU0wbnlhczBhblQ1anRIUGtEWlI3?=
 =?utf-8?B?c282SVFIcG1vQmZodmF3Rkw1aXJyS1NYdUlOM0wzMmlndVgyb2tEL05pUnVL?=
 =?utf-8?B?cXB0VGl6a0ZLQTV0TkVwT1VIMVhBb3JzQmhTeGkyM0NSSzRWN3Jla3pEc1Mr?=
 =?utf-8?B?QUdvMURhY29aNStoVDBKWWR2dVd5SXJhVGpZS1Z4TWFwMGRUb3h2OW90Wisv?=
 =?utf-8?B?YWxBbEFiYUpkT3h5K3czUitPRFhyRGtTM2N3aENDU2I4RU53OWp2REZPTjU3?=
 =?utf-8?B?bm5FTEExYTZRYXlMZExmNXlKem9lUDFGL2h2cUNIUXZscFg3Q1VhN0tKdU5V?=
 =?utf-8?B?TkVONlBnbHYzbkRmOEZ4VmhWSm1vR0dFYzBBZmFUZWg2bHA2LzZjK2tCUDZz?=
 =?utf-8?B?Q24xRytUOWhUemp6Z1VDSWx6Mk0veW4wb25zUEFuZkg5UUZNdzdPcVlwcmdR?=
 =?utf-8?B?d016eHQ4aE5GMkl5aVZ2bmRzdlBvVTM2Ylo3azB5d3l1RmgrbU9uV1Z5b1hK?=
 =?utf-8?B?Y0pjMml2SmVDeDVnSWwzNlR4UFRFWEd2WndDUlFmQW9hRE8zN2ZVYU94U1pB?=
 =?utf-8?B?WlhHelUvbXNiOEw5VjNTeVdsdmZ6L010ZkMyWlhXdW9nMHdYS1lOQ0VrSFNm?=
 =?utf-8?B?WFduVGxSM2FyOU1UeUY2dU5SU0NwS1ZEeXdob05SVUVFRmMvaG5TUnlHYTIv?=
 =?utf-8?B?MCthWE5Nb1hYVktVMEQwdzhCVmxlWnlSZWo0NjQ0Z2pLNUZGS3ZPWENnNFNa?=
 =?utf-8?B?UUQybDFEbDJ6RlFSbTdhSlR6elNGSW9LeGszejAxRktjNko3R2xwNlhKR3Uz?=
 =?utf-8?B?VE4zVUEzbW5sMXA1Q09lMGhjRHJJUEljdDVPTWtib25hU0RhL3hIdXFSN1VJ?=
 =?utf-8?B?eFdBZU53UDhud2dRWk02d1RsdHF6enE2d0pLVFNYS3dJSG51RStCT2VDU05Y?=
 =?utf-8?B?UWZGd1U1Mm1iV2hlZzV0WWc3dXRWTUR2WS8wZ0lMb1k5bFdBMFZxWFFzblFT?=
 =?utf-8?Q?FdM2oVFDzFv8Eonusat/HblNO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8930b69d-3267-430a-d6c7-08db7bd8286a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 15:14:12.7548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ghj4n0sXH6AqrOZ4z6Qp9NvLIL52EEI1NUITfiL7hzLEpf82ufn6Q21Y9TI6Z7jYLv/uGinYn+Dh/NPH2zwiHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5291
Message-ID-Hash: YG33RLIXNZTL2CFZOCPY7U5QOBZE6ODO
X-Message-ID-Hash: YG33RLIXNZTL2CFZOCPY7U5QOBZE6ODO
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YG33RLIXNZTL2CFZOCPY7U5QOBZE6ODO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/07/23 20:15, Pierre-Louis Bossart wrote:
>
> On 7/3/23 16:46, Mukunda,Vijendar wrote:
>> On 03/07/23 19:50, Pierre-Louis Bossart wrote:
>>> On 7/3/23 15:31, Mukunda,Vijendar wrote:
>>>> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>>>>> I can see that the interrupts are disabled in
>>>>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>>>>> is used... I don't think this commit message is correct.
>>>>>>>>
>>>>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>>>>> otherwise that would break the jack detection.
>>>>>>> You are right. The commit message is wrong and not clear.
>>>>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>>>>> system suspension.
>>>>>>
>>>>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>>>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>>>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>>>>> in the .prepare stage.
>>>>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>>>>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>>>>
>>>>> Hi Vijendar,
>>>>> Do you have any comments?
>>>> On AMD platforms, we are supporting two power modes.
>>>> 1) Bus reset mode
>>>> 2) Clock Stop Mode
>>>>
>>>> In Bus reset mode, bus will re-enumerate the peripheral devices
>>>> whereas in ClockStop Mode, applying ClockStop Mode0
>>>> in both pm ops (runtime pm ops and system level pm ops).
>>>>
>>>> Currently, SDCA interrupts are disabled on peripheral side, when system level
>>>> suspend is invoked.
>>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>>> SoundWire manager device is in D3 state.
>>> That was precisely the point of clock stop mode: a peripheral can
>>> restart the system even when it's in lower-power mode.
>>>
>>> If there's no means to let a peripheral restart, the only benefit is
>>> maybe to skip the enumeration time. That's not what the spec intended....
>> As per our understanding, you are pointing to ClockStopMode1.
>> ClockStopMode1 requires re-enumeration as peripherals move
>> to unattached state.
>> We have cross-checked ClockStopMode0 description in spec.
>> It doesn't specify about peripheral device state as Unattached.
>> We are referring here "ClockStopMode0" only.
> No I was describing the difference between the 'Bus reset mode' and the
> 'clock stop mode' on the manager side.
>
> There's also nothing in the spec preventing the manager from doing a
> reset at any time, including after exiting the clock mode0 stop.
>
>
Partly I agree.  As per our understanding, If any of the peripherals lost's sync,
and re-enumeration is required.
If continuous parity errors/bus clash conditions are reported over the link,
Sdw Manager bus reset sequence should be invoked. This is a different scenario.
Both the scenarios are asynchronous.
 
Going with Spec definition for ClockStopMode0, as it's Imp defined for
SoundWire Manager, want to stick to Clockstop when D3 call is invoked
and restore the clock when D0 call is invoked for our platforms.




