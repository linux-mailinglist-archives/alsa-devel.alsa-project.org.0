Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8734746AB9
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 09:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AF8320C;
	Tue,  4 Jul 2023 09:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AF8320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688456064;
	bh=RkqLthba9MtzQkNiaE9iN2e0ZG43yMYUyoYFQVMoBL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lUrJ97Bjj/bLhm8oc6KxOhoXy5ZV76qJdLjcQW7Itr35I8b2D+iVfc7epBZu3KLDJ
	 MI4tkOcxIXxwSbdit7MNepmm7cj52ok09G1vJs6Glw1Yfo5KOkREfqkm6gwuydlRVg
	 UAR6dnn2xsUdt2lSHL0rBu68v6HKbqkUUT7LQOBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0B30F800E4; Tue,  4 Jul 2023 09:33:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A69AF80124;
	Tue,  4 Jul 2023 09:33:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09D74F80125; Tue,  4 Jul 2023 09:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 877BDF800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 09:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 877BDF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=djUtLqAP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aF/7J19agf4V6azJaTLzWSSUcsTvs/4vPMNuEjKkKkVNIoOnZvwItMdWYmS1MI565w9Cm6Ttd5nqnnNkO8HYFF4mAPAmTlNxX7GBG0ZLC6eZccZ49CNFcitG90KBPPGsGthTgr5HEj4z6fTgv8maKDTnl094yH0OpA5C/Rb0M+JowDylDCY9skVEcwepo9Ibd+oA93SPi/dY0puJQEcjt3LO/w962ll9z1ldEll1RRgeq9LwAKidc9LFYtDbY+k9jNM4oqjyppsOF2yK7+l1aDvB5l7mgyAUreL0BBRxGKBOWkAkO8k9kE0VE+c/4j8KtipB/v0zsziRq8EvHio/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uobX4GqxD9TY+lwpx1C/eJ5SlNA2xB33Ge0yhDJbIIE=;
 b=FBIqDmIl+N+fkksK8OE/JYxEZHj70wxEEtm0GtsJ4wEZdlNbwt7SH3XpAJDEFv9/jW5U0o71b+A0+8VJd1KnAQ1lBBUIgHROXqH4rSAuFwr8bq8YR5lTKzLC6EbHBDP4jpozwSwKmDwCCXwdmAw+oz8dfcLOYZfWWjgbOYFagFycDXUm2X2w1ksieNOVKdbhgA1ucAtXsDJl9t35gg8VbYeXHLJZpMKtlhwv2IPIAJP0OzUn7itU4qKJWwMhACH+/Z6pCNaqiVnB4uT0+W+u9rEIU6z3Es4Kx8823M/3EbEQo1eoUvgDjfWF1zr+aR2cpluuiN5fH+Dv4I46pP4WsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uobX4GqxD9TY+lwpx1C/eJ5SlNA2xB33Ge0yhDJbIIE=;
 b=djUtLqAP/6gH5JGDjOPPp2CYmIy6VmJXi9rhrKwru4i0armdF2VJk4NQKhYFU/5P+X5usLler3/aZaXRH7HmBoYassSYB9+KO6dDK7AKdtdTEvkaI+62hzYO6aUR5Se3klEL8V4q3SSRdNUKav3Dp+pfdW1TpcC0KHafXSBCGPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 07:32:56 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 07:32:56 +0000
Message-ID: <c932e7c8-74f8-71f1-e35f-98e1a852bd71@amd.com>
Date: Tue, 4 Jul 2023 13:07:14 +0530
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
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>
References: <20230703090247.25261-1-shumingf@realtek.com>
 <f9e83b61-6e69-2467-d5a5-3c3a6a40e018@linux.intel.com>
 <81bf0fcc0b824c928e2e4e5a77ca37d8@realtek.com>
 <a10894a2-a6af-8c5f-b675-79cc7cfeb899@linux.intel.com>
 <1fb4d8ea138140d291a395dc82e710ae@realtek.com>
 <489e8631-b773-1916-40a7-3fd73af54c19@amd.com>
 <80c35e78-b82b-5d8a-bce7-fa8bb61e16cd@linux.intel.com>
 <a8c7ac88-4546-2b57-6f26-5ae2a9e603e4@amd.com>
 <95586650-6a22-f760-5eb7-0e1e3a5c0346@linux.intel.com>
 <7c8b7cc9-125e-e97e-2a42-046a025d4e94@amd.com>
 <7e6faede-af5c-c251-d6eb-cc3590b36337@linux.intel.com>
 <abb4376e-15d3-6211-5024-03caf29c7a3f@amd.com>
 <ff732d09-b620-cdfd-d055-da116b99223c@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <ff732d09-b620-cdfd-d055-da116b99223c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::7) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b4197f-39f7-4fd3-5240-08db7c60e292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4ShJpsVdCGCJqzmDa431eUbaMe38NtuFCFHh614tc427OaSly5N/VvZ8e0OF3IprUIT4Br1HKqd0BOfOAokDGA4IKH+nAEpFgmKDjC6y6okWEHKcxnTtXRyG+W3O33wnm4ASHHAAA2WbU0uXmQcau2V85t1tsMikmoWqFcn1jQedMXiTs1QFbbFWxwbOOyKU0GxN7Mt8H3jv7WMxPPsPQ+LhxSOH5oQ7tszwuEC0FGtnNQcK+RvIP+CZ2EIwxA1gth1oY5tVbh857D0KcFhgs8z+EZhPBolePISiaTjjjoE0dgfEagxoysA7YKlbQGnRHGhYrJ5yFKPmLW2RW9kcZNSeAJHWoomQwE9Hn4sLPDo5drSyqfAwDCvQV4E0/otKvPWSVxvvlOUrdDpL4xUxt76WPkjIA7LJ0hyTuymrMiDmdB3z+qWVmSkvDW2ZRQ983ThFXGHZuPmsN4ntVdCNkCPKr8wfpksT+HGNhpQV9J3unKBq/YbJqQP615+9+PWbs2HfKI1L5p21zApwFRWLCEcciDE9RpAi0hdA7x8R1rI2AJUg/vws7GVw9PNjBzr7/+MPYbyGRpmfqGGVz5CKvKULtgQMh3KXDfu2X1FlAVPKfhhxg7smMVlvCoaqZ/xSPjtTxUJd0oCUuKoZst3YyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(4326008)(31686004)(316002)(66556008)(66946007)(86362001)(186003)(31696002)(66476007)(26005)(6512007)(6506007)(53546011)(83380400001)(2616005)(2906002)(6486002)(6666004)(66899021)(38100700002)(7416002)(5660300002)(478600001)(8676002)(110136005)(54906003)(8936002)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkVWNGlmQjFuWWNNM3Jaekd6cGs3N1VZcm1wRmlHRVlZT1ZMVEttN0U4REMx?=
 =?utf-8?B?ZGd4NmMwK0RQSHM1ajN0ZG1xc1R5SG9pOXFjTWQzRlkrUXZCdWZqM3FmNkFG?=
 =?utf-8?B?YU94TlJqRUdZYi93WWkrYlptWVVqeGZ6RlRpOWM5Z1BIWllEc1MrMi9jTzdC?=
 =?utf-8?B?aStVdmdnR1pwT20vZUNOWkxCZjU5MVBpeTVwdWlrUWRzUTVIYSt6TWZMSkdq?=
 =?utf-8?B?Rll2U3NnQ1lxd05POC9Qc1hrT3BnR1JPZndqWmQ1cCt6TWdxMHJYUFBJZ2pB?=
 =?utf-8?B?MHpKbGc2YVFvWVV0ZW5ISmZDZUVDSjhkUTd1Sm9IT1p2ZUg1WTFGcmVuQzRK?=
 =?utf-8?B?aUQ1NFVLdGJZUG5sYjNaSXBSeExSTmdieHYrbk90Yml2U3ozcUgwOFJNWjV3?=
 =?utf-8?B?dWxualNhZkhuMnVCc29nR3VXS0VYWE1LOGJkUDBLb0kxWlArSXZudVdDeHpZ?=
 =?utf-8?B?YzMzdWNoMnlyd0hOL1UwQkNDcjkzQUVGYkpUOW5LYzJoNkpaYlJqQ3NPVTlB?=
 =?utf-8?B?Z1M0aUl6T2pBNXU1dkxUam56Z3REUUw4MUF5YzlmM3Z4ejdPdlJwOStRbk5O?=
 =?utf-8?B?MUhPMjQxSjZGS1VJQ1FmYlV0V1BWSFNhTXNhSm5JWk5qT3FiTHYxMjNFN0t4?=
 =?utf-8?B?VXNFYnZDd0dHUXVOMnhDTnFteVlqUGphak5JeFhpb2Nza1pIWitUYTFFSnRo?=
 =?utf-8?B?SlZPcDZsMURTQlhLYmczMjZCQnlhcTk1eGYveEh1b2o0cVlEUkhMUFZtKzV0?=
 =?utf-8?B?OTJuNXg5OWFtQzZZQlo3TzNSc211VFNlSUptUk9yUmo5UnEwWFZHZ0g5UkQw?=
 =?utf-8?B?akRqRGRIRk5Ibm9KbExSSS8vUndJdDFPUnliVDNTVHYrN2x0UHFIVHIwSE1U?=
 =?utf-8?B?WjBiVno5L0ViaU43V09IcWtIeml6SG94UlZ0MU5zZGFaMXVDQ1o0cFNqSzQv?=
 =?utf-8?B?QWJDUDlEcmY0RmlreVoxQTEybGlpYWkwM2poZm9KOTBBNTVGYXVIRGRKaDRm?=
 =?utf-8?B?bDVBdEUxUjFSNHl2aWYzZW1EQlFFbWNNTDlhVTZ2VDZWcWZWTGlOaEptMjNy?=
 =?utf-8?B?cHVVWmg2aGZxcWowWER6UXJ3ZkcwQUJWZEdYZWhScW1lZURPcG1GTk9TTlMy?=
 =?utf-8?B?YXhWSkJ0VVpyeHEwN1R0ckQxVDVxSjNiNURRM1p5QUhwQ2RkNys4NElFT3Zr?=
 =?utf-8?B?ejJBandJNXcvcFd4MHhrNEgvQ1dCYUQ5aWF2LzRvcFJKYlY4dHUvSFFGWFVE?=
 =?utf-8?B?TldyQzlVRDJRMXovNGFUdzcrcGZNUnFuRENSQ28yUEVid0pBK1dWMXR3MHFy?=
 =?utf-8?B?VW9DdDVEeVRDc2RIc1huZjNoL216N1FxeUhZTUtmVW9pZ1hEeFdvc0ZlKytZ?=
 =?utf-8?B?bDNrOTZ4REJZOEJSbnUzdkRZMHE2eWZHV202dHdoU0pncmdobzdXSE1lMHgz?=
 =?utf-8?B?a2tHT3BmWW96UTBtdEl4cnJKVmRoSnd0SFJrVDgyd0V6cGEzeVFONG8zZVVt?=
 =?utf-8?B?alJDUUxnbm1ldmJJdzNKN3J4WURlV0xpbE9YaUwzNGk1R3dYNExMZThNc3Fo?=
 =?utf-8?B?bzNHZUVWZnJhTjFrZllnRmI5Z3NFY3RyVERzTUcxb2V5QitOZ0lpSmI5eVB0?=
 =?utf-8?B?NEU0SEp3NDdlSjA4OWtJSEhVYXlyclBnUDlmSnk3cW1UaVRHV1pVTVJ6Q2VQ?=
 =?utf-8?B?S0RJdFByK2RTUWdmcjh5cGxHd1hoRUFXR2ZzSE5HMytUcklZQ2VUanRnNDN6?=
 =?utf-8?B?WXVQL0xjY2lpemFhQTNoUU5JcGhyTG9ETFVPK01yUmp0TFp4cTNWRDR4UTJY?=
 =?utf-8?B?RzVrUDBBOUc0VGpPV2YvNGNqWVhzUzM3UEVUcEQ1TVh4VnVqb1NuWkh3OGdU?=
 =?utf-8?B?RC9YZi8rb0d1UXBrR0V4dzNacjZLVUFSdC9vck5GSzdIUXJCNTZqNHozOHYz?=
 =?utf-8?B?ditsbmNTMTJ5NWUvbmE5SjRBMW9JN0puRldOWkRzQWtOeFl6Nm1DZU9nTCty?=
 =?utf-8?B?ckNVdFRjVEZoN1BHWFNIM25od3ZhUkwwL2YyYUYvVXRrZFdYY1BjSUEzamRl?=
 =?utf-8?B?YURRdmI4aTU0VUNjQUNVY0wzM2tqVFdBamNXbTJWWmNKT0VLOFFYVFJMQmlt?=
 =?utf-8?Q?AXNpmBP7zh3/sbKRQgOuifNL1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77b4197f-39f7-4fd3-5240-08db7c60e292
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 07:32:56.6653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ldoli3WPbq5Ag5VMvYiLLWIoEhW3PIXuh2YFPKF2YJ2XwqHfTYnAEE4KxQzERAUHjyvrtukzdIsNvpKoZEkyFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561
Message-ID-Hash: CNLKXHHG4AITSQ75QTWPT75MOPZEMQSC
X-Message-ID-Hash: CNLKXHHG4AITSQ75QTWPT75MOPZEMQSC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CNLKXHHG4AITSQ75QTWPT75MOPZEMQSC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/07/23 12:41, Pierre-Louis Bossart wrote:
>
> On 7/4/23 08:36, Mukunda,Vijendar wrote:
>> On 03/07/23 22:48, Pierre-Louis Bossart wrote:
>>> On 7/3/23 17:18, Mukunda,Vijendar wrote:
>>>> On 03/07/23 20:15, Pierre-Louis Bossart wrote:
>>>>> On 7/3/23 16:46, Mukunda,Vijendar wrote:
>>>>>> On 03/07/23 19:50, Pierre-Louis Bossart wrote:
>>>>>>> On 7/3/23 15:31, Mukunda,Vijendar wrote:
>>>>>>>> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>>>>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>>>>>>>>> I can see that the interrupts are disabled in
>>>>>>>>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>>>>>>>>> is used... I don't think this commit message is correct.
>>>>>>>>>>>>
>>>>>>>>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>>>>>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>>>>>>>>> otherwise that would break the jack detection.
>>>>>>>>>>> You are right. The commit message is wrong and not clear.
>>>>>>>>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>>>>>>>>> system suspension.
>>>>>>>>>>
>>>>>>>>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>>>>>>>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>>>>>>>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>>>>>>>>> in the .prepare stage.
>>>>>>>>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>>>>>>>>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>>>>>>>>
>>>>>>>>> Hi Vijendar,
>>>>>>>>> Do you have any comments?
>>>>>>>> On AMD platforms, we are supporting two power modes.
>>>>>>>> 1) Bus reset mode
>>>>>>>> 2) Clock Stop Mode
>>>>>>>>
>>>>>>>> In Bus reset mode, bus will re-enumerate the peripheral devices
>>>>>>>> whereas in ClockStop Mode, applying ClockStop Mode0
>>>>>>>> in both pm ops (runtime pm ops and system level pm ops).
>>>>>>>>
>>>>>>>> Currently, SDCA interrupts are disabled on peripheral side, when system level
>>>>>>>> suspend is invoked.
>>>>>>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>>>>>>> SoundWire manager device is in D3 state.
>>>>>>> That was precisely the point of clock stop mode: a peripheral can
>>>>>>> restart the system even when it's in lower-power mode.
>>>>>>>
>>>>>>> If there's no means to let a peripheral restart, the only benefit is
>>>>>>> maybe to skip the enumeration time. That's not what the spec intended....
>>>>>> As per our understanding, you are pointing to ClockStopMode1.
>>>>>> ClockStopMode1 requires re-enumeration as peripherals move
>>>>>> to unattached state.
>>>>>> We have cross-checked ClockStopMode0 description in spec.
>>>>>> It doesn't specify about peripheral device state as Unattached.
>>>>>> We are referring here "ClockStopMode0" only.
>>>>> No I was describing the difference between the 'Bus reset mode' and the
>>>>> 'clock stop mode' on the manager side.
>>>>>
>>>>> There's also nothing in the spec preventing the manager from doing a
>>>>> reset at any time, including after exiting the clock mode0 stop.
>>>>>
>>>>>
>>>> Partly I agree.  As per our understanding, If any of the peripherals lost's sync,
>>>> and re-enumeration is required.
>>>> If continuous parity errors/bus clash conditions are reported over the link,
>>>> Sdw Manager bus reset sequence should be invoked. This is a different scenario.
>>>> Both the scenarios are asynchronous.
>>>>  
>>>> Going with Spec definition for ClockStopMode0, as it's Imp defined for
>>>> SoundWire Manager, want to stick to Clockstop when D3 call is invoked
>>>> and restore the clock when D0 call is invoked for our platforms.
>>> The problem is that 'D3' can be used for two separate scenarios
>>> - S0/D3: that's pm_runtime suspend
>>> - Sx/D4: that's system suspend
>>> It's very unclear what the benefit of clock stop mode would be for the
>>> latter case.
>>>
>> We are pointing system level suspend scenario only.
>>
>> We have already SoundWire Power off mode - ClockStop Mode will be
>> applied followed by bus reset and SoundWire manager will be disabled.
>> On parent side, ACP soft reset will be applied and ACP parent driver can
>> wake for PME events for Soundwire manager.
>>
>> Sx/D4 case, want to avoid re-enumeration when multiple peripherals are connected.
>> For Clock Stop + Bus reset (keeping Sdw manager enabled), we can define a new power mode
>> on SoundWire manager side.
>>
>> Having said that, below are power modes we want to support on our side.
>>
>> 1) Idle Mode - Don't stop the clock for SoundWire manager and Soundwire manager is not
>> disabled during suspend callbacks.
>> 2) ClockStop Mode - Only apply ClockStopMode0 on Soundwire manager side and restore
>> the clock when resume sequence is invoked (even in case of system level suspend also)
>> 3) ClockStop Mode + Bus reset - Apply ClockStopMode0 when Sound wire manager entering
>> runtime suspend state. In system level resume case, apply clock stop exit and bus reset which
>> will re-enumerate all peripheral devices over the links.
>> 4) Power off mode: apply Clock Stop + SoundWire manager IP power off sequence.
>> Parent device(ACP) will be powered off. ACP can wake up for in band wake-up events.
>>
>> We expect if someone wants to go with only ClockStop mode, peripheral side also required
>> support should be enabled.
> I am not following any of this. You wrote both
>
> "
> For ClockStop mode SDW manager is not receiving any jack alert when
> SoundWire manager device is in D3 state.
> "
>
> and
>
> "
> Parent device(ACP) will be powered off. ACP can wake up for in band
> wake-up events.
> "
>
> I can't figure out how you deal with wake-ups and when exactly you
> expect jack detection to be functional.
Both power modes (case 2 & case 4) are different.
The current patch series is targeted to address JD events during system level
suspend/resume scenario, when ClockStop Power mode is selected.i.e case 2
as mentioned above. We're not expecting bus reset during system level resume in
this power mode.
As SDCA interrrupts are not enabled on peripheral side during system level resume,
No JD events are reported.

Test scenario will be let system level supend gets invoked. During suspend, plug/un-plug jack.
During system level resume, JD status should be reported correctly.



