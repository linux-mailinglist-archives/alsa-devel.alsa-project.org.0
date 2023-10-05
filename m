Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7477B9D07
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 14:39:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D80A112;
	Thu,  5 Oct 2023 14:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D80A112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696509575;
	bh=Cjb85P2/nmUWVN7cd2yxID4UI4DYX00unwo3wBELHYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cWvMp6KOgoiIaJiz/64O5gM7JJi3KpRCa3yzGAjyYphf5c1kNLAACIudqw4KRjjD8
	 ZZfPegyVi9hu2UGZbZDlN2Ricwv0o3NrOKE4mWxQ93owtmydRp5+XwjxK2V0aC6GKe
	 1phHnIjQPqIFsZOYz0uavMV1fH78G8TT20qIqfMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A76FBF8047D; Thu,  5 Oct 2023 14:38:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46BA1F80310;
	Thu,  5 Oct 2023 14:38:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 453BCF8047D; Thu,  5 Oct 2023 14:38:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6BD3F800C1
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 14:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6BD3F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZjDXk42N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogu6fhizznZbue/uGPAiyPsHfeoGPjpwofRS01eUCylI2aqXV10dyvOz7GDLy5IxzyVjRHdfpTXPwPDO4xHW1AqPts7bp/o9XLSt1QPbnivsnaKoPPQZpM/Es+1wd2J9HnwBSLJbL99ko0stCyU6EHn/ufcc/NnhiSu17aSZgMW0/oLT0TngfCdN4ZDFVIQzua3ZfMisqYYM39QYUfF9Zk9UPuy9h0d1jZDa+FzJbFoIU+hpQPnDU/tcphw2InU4D+1qNMXVZGnG/PIIaKEom3hNQef64lKRe1a6E+nUNAhdZHgu5xZF/0ZEwMEojA8kebkg+VvpyAqcqdA1HTDTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cjb85P2/nmUWVN7cd2yxID4UI4DYX00unwo3wBELHYs=;
 b=Q5WzS3AN3+zMSbr/UXezYxXO4QT5+7RptoRifrBjxPsCA3ZW0rJScAIK7y59X6vb2Rt7cy6VmRgbU6k/k0rFrS5/p75O4W6R+tFI6JylKKlRiamiNC3Qy/4oHlXPSSBezV+glOP8AkJ648EB3skai5PuSnSSkKByjQmAbQmmLByaZFBHFIZJj7PG4q+4j/H0rfYP1l2r/nuJNwbtQvZ7PkJ7W4LEBVxKDYxwdKJcjMqLX/NypktYhr2YdiaPqNJc/V244CjNpwNrikyaSrwPQC7I9sSP8hDNQ9DlgOSti/GniGFnTkTrcUQR1KFA8e0e1wN3hUinokflEMGjmeXnNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cjb85P2/nmUWVN7cd2yxID4UI4DYX00unwo3wBELHYs=;
 b=ZjDXk42NSF548NJbkVTynMEAE5DN7XDBEXsipPJ7tqlzulmDBmx2lrGSG4UrFsJ3oqWrE0/OVy/2ky3evZqKPrc4p7mfVQBJtSC4w4+fXMl5slLD8hCONMemn5QSK+lhaUg2StXbEUbf7wtzRAF8rNxaBqEc9AsiP+AR2TvfmRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by BY5PR12MB4934.namprd12.prod.outlook.com (2603:10b6:a03:1db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 12:38:22 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::1ec:3e1e:98f4:b1b9]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::1ec:3e1e:98f4:b1b9%7]) with mapi id 15.20.6838.029; Thu, 5 Oct 2023
 12:38:22 +0000
Message-ID: <c0cf1873-f72d-3cd3-0b70-db70d76546f5@amd.com>
Date: Thu, 5 Oct 2023 18:08:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Mastan Katragadda <Mastan.Katragadda@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
 "kondaveeti, Arungopal" <arungopal.kondaveeti@amd.com>
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
 <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
 <2023100453-perfected-palm-3503@gregkh>
 <624b044a-1f0f-4961-8b57-cb5346e7b0d3@linux.intel.com>
 <2023100452-craziness-unpopular-7d97@gregkh>
 <04c5911a-a894-44b3-9f0e-fe9e6de203f2@linux.intel.com>
 <d648c3d1-53ac-4021-ac7f-6a81f1a72dd3@sirena.org.uk>
 <bf4ee895-293f-4bc3-ac4b-30df6361e973@linux.intel.com>
 <c7fb4ead-13af-438b-a199-c52105545047@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <c7fb4ead-13af-438b-a199-c52105545047@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0192.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::17) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|BY5PR12MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: b00d0f9c-74f5-4182-c3f8-08dbc59ff5eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z1Lskv1gkYc39p+3ZgNXX4FCZm2ASJn1ekGOjsLO+OF6/ZhSeVHGSSCGenoXdjmkDZ8aIU6ngbKMNsn+7g/Yoh+DiMbYFBH9eSaPy88BWuiBjC1oOizEapNiLCgoJ0Ajkg32+guvr4OJGQJeUCeT+XpvjCRkksIaX//+L82I3xB7UNeRLUzSmPBTf83LzPBYnxg6f8m68/1+q3Ezu+hGrBaVLSY4n5JUmn7GQqtkluv+YbUIo0MUcehYqkBM05warEGc4mfKB1NoWhGiJKwQfQr7zTbjO00Ig/IPFI1RvV1BRcq4HHVgC0Yf5DQ1GDdqccMLQ36XiNQlUW1uFmF/Y3VXjSeLvZUgJuuZxBxyd5H2vmJQpXsRQTdsJyRvjCRZay9VVKs5YBfDV3T+UskNDp0hhjw35mEF7yOrRIIsJXmV+XDH9pnrXQ10pxfaIU9T8/9yrglKvELMrbEbMAEdk6Ws1GbV9bXlN6pZ24dJDNuVFh0G/TkzZa1BnPD1Zc/sKVBxFnv60ZM9Y4NUuEpZ/pLMxxqsI+DU+r57QD0ll44jI35D6gqZOF5cJkbybqiaccBx5rRaXkWKeSf87qJa7GA9VftV6CbOWwqckapbD5ukreA/uT8xdUHNtNKdtGfLvb0O+XHu936V44w/M2xN2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(8676002)(110136005)(66556008)(66476007)(316002)(66946007)(54906003)(6486002)(6506007)(8936002)(38100700002)(2616005)(26005)(4326008)(6666004)(41300700001)(966005)(5660300002)(7416002)(31686004)(53546011)(6512007)(2906002)(478600001)(66899024)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VjY4MUFFNnVSZm1DeXVpeldRSkJ6WW1ONmVrMDZaZkpWRUFxcHlKb00zN3Q4?=
 =?utf-8?B?UHhyNjBVNzFMRnA2T0pvOGd5b1NwcFVlZlFPOEVZek5ld0ZpRnk3Z3J5WUgz?=
 =?utf-8?B?ZTdNUnhLdUxkUEF0SzFGYktTZHJlbnVScGFwVXU2TithQ2paQWxQNFR5QjVk?=
 =?utf-8?B?cGVKeWhSQXlHR2MxamFsTjRveGJTaFFtdGY5Mll4WTdpNkQxMmxBV0ZMbFNk?=
 =?utf-8?B?RzJ5SWo3NVNMRnFvcjNzZEd1Y1NMUi9jTHhVVUpWTVlJZUFBcm9JTFZJY3Y2?=
 =?utf-8?B?aHRSenR4VUM0WHA3cHVjNVFjVi91RGp1OE5aekFGUDhmTUhmYzRPZ2V2K2pW?=
 =?utf-8?B?TnlVY0VmMDFHZGtBU1dUS28rekJSWk1OaUJ1SGthelNxM1VkTHhRbnRqOFRx?=
 =?utf-8?B?OG5HTmFWeEFhOTg0RDZid3poVm5ITDlIK3o0SzhHNUZZcDVycU5GSjVRclNx?=
 =?utf-8?B?NHN5elVCRUZraEZoUUVMYUI1MkJtTTcwSVpKQmd3N0tiQVhMRnhESnNFaVhG?=
 =?utf-8?B?aE5rZUo1THZiK25xdVp4NVlOaHBpb282QlJHU0tkT3cydmwxRFlNLzZuRis3?=
 =?utf-8?B?K0VOcWh6aERRU3I2cytmdEYxckE0YWxxMCt4c1FRS21nbzdINC9wZ0NWYkNK?=
 =?utf-8?B?eDBiMDZJZTNsZ0ZwNlFXSVNreCtmSkpwOU9LMFFJT0NVVUg4STZoZ0hSQzRm?=
 =?utf-8?B?MnJFcVY1OFA1bitmMGZrTFlxa0VUZEFFdWZnaFpGSStjdzVEUWxtemxveVoz?=
 =?utf-8?B?eFZ6T0dBemc3SW5jek8vb2VrQ0w5Z1daOHF0dWJkUlJQanJ5NWZ5U3l6QUpL?=
 =?utf-8?B?enB4S29VQWlmei9naWo2WFlDZ0piTmFVOTU1YTkvcE9CTWwrdEdnVGRwbThI?=
 =?utf-8?B?U04vNlhqVlZPME04YmM3RUNWRzVjZVVieWZXRS9VQXg2S0lhRlF3R1lFSVRF?=
 =?utf-8?B?SGtjc1d1S3pmeGhPS0hoT0Nadm12c0wxVWJzdTk5MWswQTVpc2hwZlpMcDl5?=
 =?utf-8?B?N1BHNitsOU41Z0orazlWVVUzVWtPK1RKcWZXSlp6bXZQR0xUeWE0ZDQxVER6?=
 =?utf-8?B?NE9TUmVnN0RWZkhHMFZkVE1NNEhGbHRvM2VWNll2QUE1QTFYallScDc2c3FQ?=
 =?utf-8?B?N21OMlVSeGZLTlNyNngwZW9PdllXWnRSOFUyRU82T0ZZTG05VXpEYk1CVDA4?=
 =?utf-8?B?b3pPUlMzVG01MDFLM1pBazBMclJZRWYyK2RCZGxUUDFiOGllbmhqUU44SXlp?=
 =?utf-8?B?ZTVHeXpOblA5T0xqQnI0SXZLaSsvUXBML3V2Ly9HYkc4S1phWGF3aDQ3RENn?=
 =?utf-8?B?eHBOVTdJajh1MVo3d255c1BqVTFjQitHL3pMaUhZQjBKVTZnd0krU0JDNFo2?=
 =?utf-8?B?bFBTNUFZcDdTKzY1RUhhNERnamxsemgvdUhrT3Yyd290TVBDdVVhcW9FOVpQ?=
 =?utf-8?B?NisxTGlNYVdSdUJ5WlVQcFlXQVJ4SERRYngvNTkzZzAzN05NQU9xRmkxenNJ?=
 =?utf-8?B?cWREQUlnR0RKd1pONUQ0M2tHeVBFY3ladmt1dGJmU3lQb0JpZlg4aVhYSGsv?=
 =?utf-8?B?QzVVVHNGaDQrb0g2Uk54aXh1T1lxWkFiNERZbWw4MFFUbGMrUDlvYUhyMzl3?=
 =?utf-8?B?ZkRralhWVTJjNGlQVUFiUGc5R01CZVMwVXNUUlJ6aXFtQ2c4eTRTQlI0WS9Q?=
 =?utf-8?B?eHVBSDg3WGI2bUhDWDhmQ29VK0JJbTFzd2pTZjVQdjJIQ3FBQ25FYVhUdTRH?=
 =?utf-8?B?aWx3QUN3Mk81cUxQMGp1ZHlQU1FFMWYxMkx5TTg3SUQ4SVVTRlJyL2ljTGd5?=
 =?utf-8?B?ZG95bTRrNWRvampVaExSa1VoMk5rTU95Z3p1N2dhQkxvbDVzaWFwNW1lNmdL?=
 =?utf-8?B?Rld0S3VQTnlLb0VFcnI2YmhMN1c3MXFTdGhvcnd3MG5reUJ0QVh3NVB0QnNq?=
 =?utf-8?B?T24vOUZ4MHZZeFpVemV4N2x5RWlwYUVuUXBMOWw3NHZ2eXJyaHlJWkxVOG5k?=
 =?utf-8?B?MmRkL0xHd1V3c0FqeHUvUFFlZE8xQ2JMSDI5MEpkMkdKS0NKRzVGc1BkR20z?=
 =?utf-8?B?ZWRuQjd5NmZhYnhtQjFqWXE2Q0JINnNTS04reWNLOFUvcmUvZXJFdGdlYmRw?=
 =?utf-8?Q?x6LVXBMAPGtn+9gY/od/0AlYJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b00d0f9c-74f5-4182-c3f8-08dbc59ff5eb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 12:38:22.0908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yq85hjNhLEXZG3nJublPE1/RsdvRk8X2sVVhzUwSvqpCLylVbPbyA9NLIxswKndIhW2H35OUAoFgJgG4PR3+YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4934
Message-ID-Hash: G4G6D552JLYNVDVVSOM3V57ZW3BCUZFO
X-Message-ID-Hash: G4G6D552JLYNVDVVSOM3V57ZW3BCUZFO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4G6D552JLYNVDVVSOM3V57ZW3BCUZFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/10/23 17:54, Pierre-Louis Bossart wrote:
>
>
>> I think we keep circling on the differences between "Controller" and
>> "link" (aka bus). A Controller can have one or more links. A system can
>> have one or more controllers.
>>
>> Intel platforms have one controller and 4 or more links.
>> QCOM platforms have one or more controllers with one link each.
>>
>> I am not sure how this IDA-generated bus_id helps deal with these two
>> cases, since we can't really make any assumptions on how
>> controllers/links will be started and probed.
>>
>> What we are missing is a hierarchical controller/link definition, IOW a
>> controller_id should be given to the master by a higher level instead of
>> using an IDA.
> Tentative patches to introduce a 'controller_id' that's not an IDA are
> here: https://github.com/thesofproject/linux/pull/4616
>
> Initial results are positive for Intel devices. it *should* work for
> other devices but I can't test. If folks at Linaro/Qualcomm and AMD can
> give it a try, that would be much appreciated.
Will test on AMD platforms and let you know the result.

>
> Thanks.

