Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 405A173F3E1
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 07:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D01B822;
	Tue, 27 Jun 2023 07:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D01B822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687843008;
	bh=l5H08Pdu7qVlaDNW5J96Jyl6lzqznYGDF9ZrMDh7LLg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rlLGVlyLHOZronFpnMiLZcec39XMhlrmoe/fFae3c77MrqwC3DBbWGYqLU/Tlw6MY
	 VJ7TXjUdBp3TwG60nlf+IOFpFoaBM2L8jSqEDa/xyGZaDQRacg49FRAnD1N0mMT/I8
	 KWUsgYknyJC+Jc4SJAOuWjrdKU+NwiR0Y8UqCPuU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E33A7F8027B; Tue, 27 Jun 2023 07:15:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E75CF80124;
	Tue, 27 Jun 2023 07:15:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 381CCF80246; Tue, 27 Jun 2023 07:15:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18D37F80124
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 07:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18D37F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ufB5yYnR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPloHXblLH8bjdWErt6jVRo+Nw7sqFhGJOYpPV1jIYlhG2FfYnnh06Klu5bq0kL7HejTQmI1JZTojeAMauTZLPeWsVf1Nkfr0StuXREWEqXV5/d3E3AqIO1ueZbW998comAqI3MNi/+7sEy8jO0+902V3yngTz31VGE+NHGdaszJOCD2fRkneVRFscOsYvSoArqWAwmhQLIVEctIoeviyvSJxTkd2JJuePkatW2aOOZz2KXiIzRfjoUjcDkv+ZGw/+d7z8ckhXKyKLPYTStEXDLD6kGhyyQ96ZohHj8aIRr1/PzIwCix3XYky2/WVOkYvF3yEp2bbqj7R/7dFHbw7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5H08Pdu7qVlaDNW5J96Jyl6lzqznYGDF9ZrMDh7LLg=;
 b=Oeod4c9FgAODOP9WozzXLh5aI8SwnKdgeSKse49dhY8v9dHxuiK5UuknIcWlLRHm9ghIUgutdRUAW6wR8/hNJpTT8lp3aBSzaCvYV+lFm45xH9W9H6dQXB5c7oZXAxVZxbLe0kkbUW2fXStRGjqlfxUhtDHsssRaJw9T2OovffAXtCftI408yWSffP0ZEw/dKAY2mgLudBQNIlvowkwaam3w4SNn/df3y3rZzR1SOoUXj1L+m8Ppp8r6jwMuz8+CD9GoXvdbU6GNnQDVBxSqUDb4tAqHFGAc/619hU9UU73xdtelf04WGy2akvCH83IFQ9Fikt50rhJL2WFtibgBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5H08Pdu7qVlaDNW5J96Jyl6lzqznYGDF9ZrMDh7LLg=;
 b=ufB5yYnRVjxcmH9KH/ly5B75DgZ+mkqC1rISm09LDunjYLRWHgZP52k+jFJHAUxL/ZZ14kgCoHvYH0MaHF2aZQR+6QHYGDdRGPenbSPN+QSv2sS5bHrt2xxXsZdhC9DUYjIPlxcHwJvJawRKGgjH2TcfxPXrY3d1Xvx2QnfFSzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by BL1PR12MB5077.namprd12.prod.outlook.com (2603:10b6:208:310::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 05:15:34 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 05:15:34 +0000
Message-ID: <2ce17a88-1bfa-7791-8f91-a8ae84bb5269@amd.com>
Date: Tue, 27 Jun 2023 10:50:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [BUG] ASoC: Use the maple tree register cache for RealTek
 SoundWire CODECs
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, oder_chiou@realtek.com,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@linaro.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 "Katragadda, Mastan" <mastan.katragadda@amd.com>,
 "kondaveeti, Arungopal" <arungopal.kondaveeti@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
 <b8af4050-85e7-6974-9c44-c26cb6962972@amd.com>
 <d305c960-afe8-49b0-8583-a3f168311cf5@sirena.org.uk>
 <df864ba0-154d-512e-c0ca-434ecf1cbace@amd.com>
In-Reply-To: <df864ba0-154d-512e-c0ca-434ecf1cbace@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::7) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|BL1PR12MB5077:EE_
X-MS-Office365-Filtering-Correlation-Id: f09b08cc-038f-431f-a3c1-08db76cd88f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HNa7a2Gp0v5qDKsARrIJrlkl0r7ECUvRk1dziJZedJokyvSuI2cPLnrrLSqelneBrgF3LDXseLrKFaXcuFBKG8tv8SdbbZ2BuLd+JLTNm8EXcKrnfID1OB8qU6Rl+bHTZBCT/lzI5Ieyx1MPErsrx3TgtROuIb56SzIw35k9c/74TBpHyXldjkXxc3odEkdTViLEQsORFQbx1O+AwY5x2lyVgi4GjKD7EcDaHUeAQgk2QNA7MiInpmxFmVtPlX9tciHQEiwmyq9z8ZUXk2srsFIjmn0SDPrHjK9sHuwWnlB0hV+8YpUlD6olkT3e8GLWOXlz2zxDxI04PqQf/0k/MWP+ithJMPRMe2v6/5i7B08NJ82IjNn9xdjIg6JcloJuTa2bX6txOPFCojxaTFPUP3QoE7ri75uITq/uba3nF9//RxQ08L460E11TDoaX82fGxipDkZkbVwuQwIDAGSk86ik++SzGsrw+YgK4H9ffR6YV5sHnChEjMZu5+Ho793IupQTDKcIUQDA4OBpjreNzcVXNiGBZfXguau7TG9DCY3zUqbijSbA6we+3qb1y6H6HGFnZw1cgIt6LTRomaNzMNCnXpz8m7FmM8zQkuvXrEMgBMQrLd6J+MvvjNBYMt34JVejNijcwDYDV9liaCC/1rM/WkYy+xDUZ2tWG4vOer0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(66476007)(66556008)(966005)(53546011)(54906003)(6486002)(2616005)(478600001)(6666004)(83380400001)(186003)(6506007)(26005)(4744005)(2906002)(5660300002)(36756003)(66946007)(4326008)(31696002)(86362001)(41300700001)(8936002)(6916009)(8676002)(316002)(38100700002)(31686004)(6512007)(10126625003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WFZrM0pwa1hGdnZ5NU9UNlYyYnpzb21PeGp0T1NORC9VUlpoT3BKSmN4UGlK?=
 =?utf-8?B?ejZ2OEhHc01wbnozcCtUR21BM0Z0RkpXQjFEUkZPTHpNK2sxam5Fb2NXN2ly?=
 =?utf-8?B?RHVWTDB2R2lnNEhSOHZaVWgwWllkZGxQY0N2UEVoMkQ1ejRIWEJjaGRXOXF2?=
 =?utf-8?B?cithTCtkcXlvRWh6Wnp5UHIzbTZSOEI2RVpsSnhhWCtFUVU4WUV4ZHJlUEhl?=
 =?utf-8?B?VllIVmpPak1LYmRaUXNTTytGTTVyM2tuK2xLRlNoU3d2NkZ6am5WYnlaVEdF?=
 =?utf-8?B?amtieDdvL2pBWFo4dnFVSzUvR0ZXaWs2eWlHcmxZMjA4ZEpmNjRDaldKUW95?=
 =?utf-8?B?VWhRN3Fib1VCUStQNzArY0tiT0ZlZE1HVUY0UXhlajNZaDdyVU1rUkFrNUVo?=
 =?utf-8?B?SEtSU0hnQnlCRXBUTFA1VjY2bUVKaG50c1hZUW5Da2NFbXMyLzdIdmVySnlF?=
 =?utf-8?B?RjFJblRjRTFaRXp6N3pQdmNFUkdNaHZDUHIzZU1BWjlGSW9BR3pONUgyQ2hq?=
 =?utf-8?B?OW9telZQL1lkZTJNbUtJMkNzSE9qL1FNUTZUNHdqOWkvelhYMzNEcHdSUTRP?=
 =?utf-8?B?elVwQ3FvRzgvdzNrSWk5ZGJsUW1ta3pBUHJtd0VlVGNpN2RjQ3R6emJ1QmJE?=
 =?utf-8?B?NnJtVDNVVmU5d1puVll0OThNcEV6K2JtQ3NhZUpwd0x0MWM1RFBuQyswU2JG?=
 =?utf-8?B?U29wUHV1YTdMQ0JMRTA1Wm9mTXZINkYzZnNCVk9TRnBmMXl2WlgzZFhUNFRp?=
 =?utf-8?B?b2s4R0l6UFhsWHYvd29pQ2lxcDF6cWNwaVFtd2ljd0VaUXI3MXltNDZKcEVm?=
 =?utf-8?B?Z00zM0hJOUwxampCZXlLZmVXUmtBZEdDdVNkSXZBTzdKWnE0VlNNN3VxV00v?=
 =?utf-8?B?YTJ0akFxZmZ2UGYxbXl0S081YmEwblQ2L1c0bUY4R1crMk5LTTI2bEUvN3ZC?=
 =?utf-8?B?Z0lyeXladnMydjJrNnB0ZDJDbzBoV0lOKytCL09EV3cwR1pzdndxMHlQZlFj?=
 =?utf-8?B?aFd1RGgxa2xtUDE4U29MZFV5T1Fkb2Y5Zzd5Q1FudmUzeUdUdGtrVzJLRDNl?=
 =?utf-8?B?bXVJSEx4aEY2dC9wOFI3cWhXTEhKNEdkY3RVejl6dDhJL0dtQUNCcXVTL0Zo?=
 =?utf-8?B?dlNNdU94Q3VTMU1OTjFabXpCNzlOOG00aTQ4YVJWaWR2c0ZBTnd1Tzk1cE9S?=
 =?utf-8?B?UGt5a3pHekhRdVNoN2FldjhxNXdxM2VCNjEyNms1Q3UzOXJ6bWt1d1BBK1pX?=
 =?utf-8?B?Zk11Z0d1aFcxWk1GaCtWWTRPNmsyRjFkYnhuVWEyVkxPNWRWMk5HcDEzYjhh?=
 =?utf-8?B?Ni91QTNVUmpwN2hMSENkR1F4eU1UUGJDeEs1ZFVoSXAzM3lhQ0V6WlZUVkda?=
 =?utf-8?B?cGJKOHRka28wY2FlTjdkbzNhcEhBcjZFVFAxYzQzWThlVCtQZENyMUR5SGts?=
 =?utf-8?B?aHloV0pIQnVpNVFOaG5TM2swL0JsSW92d0k5cUZ0YkI1c1B1ejB0Zm90NmVt?=
 =?utf-8?B?ODhSRkdDYWFJbDB1WkFKV2NPS3liUTZPY2gvRHBnM21EaXZVN3NPT1NJZkZB?=
 =?utf-8?B?M2hEZFhzS2FFQ2ZFbDRYbkxEUTZ0VmZLd3RwT1RuOGswb3YwSTRwTmNZdXRz?=
 =?utf-8?B?N3R6OE1GSm1SV29pQ1JndWNFVllybFY5eU45MzZ1YnhIek5OcDYzdHM3ZC9V?=
 =?utf-8?B?WFRaTHVWNVhFeWNhYjM4eXUwd2lQSWwyY2J3TDVCSE4rOTk1R1NQVjJPN0ZZ?=
 =?utf-8?B?SHIzTTZyS0xXK01jeGl0V3R5Uk4vR3hHMThienBsMmJxWnovYWp3M2VTeTFh?=
 =?utf-8?B?K1BkTm8rUzQvV01GeG1nQjgxM3AweVIva3h0U0ZJUHA1WW9UdFV0UzJoVWZT?=
 =?utf-8?B?VVF0RjhLT3FnR3dVeFBKOWU1NGptVUxVOFdlVjFhVzYxWWhoTnpoZjRFa0F4?=
 =?utf-8?B?WS9ST0R5aXgzSGRqMHNlc3gxUjY4cUQ5S0tkYVByNklYRzh1QXJQdXRMTXVG?=
 =?utf-8?B?cXRCekVxNzBPRWdmS0tISGRkd0l2eXd3VEhrMmhmajlpV0R1MzRHR2F1VU1t?=
 =?utf-8?B?dmozYjdGNGNmVmJRVEg0d2JzTFQ3ajkxZUt4Y0lKODMrT01BRm53Vm1BZkwv?=
 =?utf-8?Q?2QCO0jMh+yQBxjbB6CFCd1GTy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f09b08cc-038f-431f-a3c1-08db76cd88f1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 05:15:34.4515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 z5C45KRBUtkykwkCg+y6pRazoLESoY2JlPi6yN+zjl/C5apRv/XeWm6vQSmlc9mzqfYv/HuL+Q5hers5Nu7hUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5077
Message-ID-Hash: QPQUOTDF2K7ZP6ZDQ652COQYZG2WHO6I
X-Message-ID-Hash: QPQUOTDF2K7ZP6ZDQ652COQYZG2WHO6I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QPQUOTDF2K7ZP6ZDQ652COQYZG2WHO6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/06/23 20:09, Mukunda,Vijendar wrote:
> On 26/06/23 18:59, Mark Brown wrote:
>> On Mon, Jun 26, 2023 at 07:00:31PM +0530, Mukunda,Vijendar wrote:
>>
>>> With cache type changing to maple tree for SoundWire Codec patch series, we are observing
>>> rcu warnings with AMD SoundWire stack.
>> Do you you have 0cc6578048e0980 ("regmap: maple: Drop the RCU read lock
>> while syncing registers") in your tree when testing?
> We have tested with ASoC tree for-next branch code.
> This patch is not included in our tree while testing.
>
> We will verify with the patch and let you know our findings.

After inclusion of above-mentioned patch, we are no longer
observing rcu warnings.

Thanks,
Vijendar
>>> Below are the pastebin links for rcu warnings dmesg logs.
>>> https://pastebin.com/6sadwNCw <https://pastebin.com/6sadwNCw>
>> Please include at least some of the actual warning in your emails so
>> they are directly readable.

