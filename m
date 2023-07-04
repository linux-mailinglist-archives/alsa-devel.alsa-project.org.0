Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 577FC7469BE
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 08:35:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0303D7F1;
	Tue,  4 Jul 2023 08:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0303D7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688452505;
	bh=M1//FAojS25FLR2pE8783gCaZO/CR2dyDmy3pA9vrFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KrNULWJpE5EZ0cb2wMZkNrtZl5rFoHtdsN9fqggmDD0n0CIGe6vrkxyc3CHtgbXlR
	 IieCQ9P2whUpu/L/oGKXaIEAQg6+QyCWM+Y6AFgmf4oRG+7A1UPFynDMOdUh/Md8UE
	 KXx+bxjQq/PLsDEj1nt2sIqm+Z/QkqAcpiNPAwtA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4116AF80104; Tue,  4 Jul 2023 08:33:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAEEEF80124;
	Tue,  4 Jul 2023 08:33:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3645F80125; Tue,  4 Jul 2023 08:33:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45133F80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 08:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45133F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hQt+Ivc1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3hXXOnAWFRLB1jzfw3F7C9Oz2GaFvvutsIcW/07VQxkvx+OqIM//YkMU0vYskpKXIzuwIO9wA8tBFf745cv8KR56AncGD9R+tIwhgHG76b+UnKOlJilELXgWxZUW2eXkdLi4PGyBfdx0RHQT2pQnxw6qbT1QhaH1rzjFA+4DXHollkoeu+YhEe2BZ6ardkaG23ENXFBvUoc+DpoANhTB/jbr7SdbPzrSlZ9D0P3ySxRXQ/5H+owt3HxlUYBBLpWNc5VUJUXut8iAaw/MveIonAOc1AV7Iu8tC4uuOQg75M8WJfs8aE1gmlOP3HmGn8Jq0gzvLV+8Jdf2iGsCw5Ycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ccoo7K3PNyTLe2/DM8B33TBXsvjnqhoJAU6BFleqmsI=;
 b=NzrTemcMRleRJdfhuYTm20+hJYYBBR9fcWF87649touEElhK0VWkZC/qAWq8gWaoztYPnPFbgkJE/mNM9lAPOUDt2NAW/0GgvO2jRaHGLqlRdHdE66vwYIa9xxGT8DWpmX9iAs96sLn6EEEi+yZE/Zq5Sh7HDaV5IIB7QFXI/gWDLfDvmfblPfVA/M2Bp+ozWJcBlXj/RpH3ZJv12YZ2TEd3QFpCcdAtTAkMcN4YY4RG7Ymsld4GFaVcb1/3+SKUmp+1FtmR3udvQWrzATiNCRkH/Tw4XVipGjQhvOfpMxUEZkeTbrdsfKFjWqc1hR+AggO+gbUeri/3ilkvIgK0Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ccoo7K3PNyTLe2/DM8B33TBXsvjnqhoJAU6BFleqmsI=;
 b=hQt+Ivc1bgL60/qP6Z8sR4UGWWy0n0ikyVwr6MIQVAH6Jm/FD53x11lslPkkCYHhTJL+ObkT97Yj9NuQIYQLzyF4qa1sGXGQZKB2QvhouOSuiHLrfXWV7GzJLeOk9Vhf882Dl2tKNVDRsPd5dex8q2e5BJ4H3sACSUBogwuKMBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by IA0PR12MB8278.namprd12.prod.outlook.com (2603:10b6:208:3dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 06:32:42 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 06:32:42 +0000
Message-ID: <abb4376e-15d3-6211-5024-03caf29c7a3f@amd.com>
Date: Tue, 4 Jul 2023 12:06:59 +0530
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
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <7e6faede-af5c-c251-d6eb-cc3590b36337@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::21) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|IA0PR12MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 92879c07-cdfd-4e2d-1a98-08db7c58785d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jvaI3FAGdyzXibjfdjqATt/gVWLnZYg9ng7tnOq4+0enERlkHQYYWaC5YHzsETFyViV1iKMiu+IhPJ7R+urLcNI3hQIRK7DRtiT5o3NZ+r+r7uR97zxZpvg1umhl+oqy5CvhAjkiklmnP4xDqFyoWyqWGXP3pyj6XQYvR3MuYOZXYT/BQywjIDyKJ57wml4gTAA2XG4ou9YX/RFyUQ1drxulANtPSS/AQzoijG3HsKiHZtgncfB8AdKNBNn1O3MI5TOSYKaBK0xehvbpSp8OpPOCO1awu9n/y1vFSMhSmw8CT1y1LOwvnB+JeP/ATnwzXtQBgc4PRXafxN4k1nxlulqHTaKhpX1+Zf+BM6eGEy2Ge078TvestC1yREu4mB9hW0HLdXBtHnwnLxGrQElNzfajixoRBfaj7Rqg6xKatZdR6cpWPJfi267kLWXxZ8016x4ZtI4/YXmXp5pDGC/DPbHeE33LAaxQFz6fRUcJYVaE7BC2oYjT67kEUzPx/eARtkTuJ0FHch4q8XGs6IKqXVnolktlanyoW7WNsjZHEppXmSuqTRSMhKqrr/nBEn8+WSiYiISnsriXOn/cWDAu5XirgI1lAY/+XIeNsRlzOBlzjRdYU6FCaRcrIAwjwtaH9mO3hAovGCXz0FS2qaBFDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(6666004)(38100700002)(2906002)(6486002)(8936002)(8676002)(110136005)(54906003)(36756003)(41300700001)(5660300002)(7416002)(478600001)(66946007)(66556008)(186003)(86362001)(53546011)(6506007)(66476007)(26005)(6512007)(4326008)(31686004)(316002)(31696002)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnJPY3ZsNFlJRHdEaEhEVkluVVFpZlNNcFBsRjlxNklaU0h6YzFZRFV5ZEN2?=
 =?utf-8?B?REdINmNRTGFueHNzejhGQmhlRWUwSGtpNnBKWXRGVkVJb0xoMG5FbkpDRHU4?=
 =?utf-8?B?NU1NY1BoWTBrL0tvek0vM0pBWjRUTWhnSDM2Ymt5cjdBck9DTUJRcWlldjg5?=
 =?utf-8?B?Z2tPbzhzb1Zvb3Bxbm9FUmRkL0tDWXJpbmhBWGxPV2VlQXZRQ1J4RUpWUU1S?=
 =?utf-8?B?SmY0dEJOaEZKVm8xY25meWlzSlJoM2h4ZG1LNUJkNkpBakplcUFZVEhtVUtI?=
 =?utf-8?B?K0tTL0ZUNndRSFkvVyszdTVkUnZKemdiV0EybXQ2RUpjcmJ5ZkFYOWhNNmZP?=
 =?utf-8?B?RFRCYzNHVElKTmt3c21yVGExVFJhSWxwQm5LV2pERWh1MHJPS2kzdEFmQzkv?=
 =?utf-8?B?MG4ydGIrYWJ4VTg4ckRVc1RKK21kaEJEdnhqK08xOG9oZDZjV3grSHdKR1g3?=
 =?utf-8?B?ekNBRVNhNXhISmMrOVE1c2hXeDVWTEZtZVlFdXg5OC9NcXNhRm5LMlVudzll?=
 =?utf-8?B?QTJ5cERFS25RTkpkUHIzdldFZ0pkTnB0MjNNZ0FqY2ZYNk9NajJObTQ5TVBG?=
 =?utf-8?B?WVcvZmN0QXQyVmdtVDBINGJ5NDl3SWtVVWhZbG85bk8vUnpYemM4YXFBbHh3?=
 =?utf-8?B?Z0FCaG8rRkhFTDVZT25CTlZQQjZVemczN3BPRjBOOWVFV0xmUWsvZExMa2Q5?=
 =?utf-8?B?VFRQMDU0OTY3d0lMaVhqall1U0ZqSUJac3BrMnNvWC9YNUsyS2d1MVl3UHpt?=
 =?utf-8?B?WGdVZ25ZUGdxSkNSbC8vbzB2bkdHeUxNMndWcTJCdWg3dWwwaVNRTENLbHp4?=
 =?utf-8?B?VjQ1Smx3R0YzQWJ3eWRZUEJ0ZUJWa3p2eDgyRUNPeUpHUmJkQ2hwbW9NVmxB?=
 =?utf-8?B?VG5GMDduY1BHRlNFWE9GR2o4aFRLU3I5YTNaN0NKb0hqZFBlWm9VSURkZ0NM?=
 =?utf-8?B?L2Z4TGZSTitZWGx5UTZGc3ZSclRLN3ZtVGFpZXJkS0U0S09HcnEvMmtzcUxw?=
 =?utf-8?B?SXAzYlI4S241R0YwWGhpekdtaEV1UXJLekoycmtMeGFpb0ZxUTR1Z1c4Yy91?=
 =?utf-8?B?K1BLYUI0ZzViYitBdTFrd3Nab2FHUC9nN3d3NWIwS2lScXBLQVUxbDVndHln?=
 =?utf-8?B?N3ZidlV1akJoN0pqZVBZK3lsQnZrV3RVOVJpMXdDN05tUXluc0hKY0d2K1hI?=
 =?utf-8?B?MFZOYy9leWRJYVVYS0tvVC8wZVYyRXh6MDZpUUdWd0VpY2cxNUFtbDRSZWdi?=
 =?utf-8?B?T1F5ZHB2NU5iazJQU2Y5WW9BOU5YUmlvRlJkdW9CMEYxZlNmRmFtanF6aW9x?=
 =?utf-8?B?TENNYjhGVFFGdVNwVXYza0JUN25oVm0vdGh3cmFsYUllWmJPTkNMUWVjQ2Vr?=
 =?utf-8?B?eXJLamRjblhPYXJ4UU1reEowWHZiTFRtbnpFT1pxb1JMYU5HZXlKZTZRZ1VJ?=
 =?utf-8?B?WnBZTE00ZXd1dzhCWDc3eWZjbmtwODVwaVlSVTNESEVMRnpnbTNVQ0cwRzJC?=
 =?utf-8?B?dTBjSEpQZkpKTEtnSnlFbURLbHBMQ1luRXlIcXN1TU5odzNFbW1zWjlmbDIy?=
 =?utf-8?B?MEVpNnlpMFNJSFFOcXRCcWNaTHE4TDRoMkFJYTdHYkp4SVdkdm5PNi9iOU52?=
 =?utf-8?B?eFpxTUROd2srclBRbGhBZXBYUzRtV2ppZnlubnRGUTUwMFp3a2FreDIxa1lD?=
 =?utf-8?B?RHUzOWd3dmlEaGd6NXlNNGV3Sk9JRHpFeGY5UDZWVWJVZW91Y1pWRW4vcFhq?=
 =?utf-8?B?a29xWWpGTEY5eExOcmRldzJ6Ly94YVNpOG1qT1JOMVFIQTNGODFlOXQ5VzFQ?=
 =?utf-8?B?c2huY2RhT1I0VTB1Nm1RZm9MTVgzSjJubVI4OHBEbHVGem1NY2ZxSkdsVlZ5?=
 =?utf-8?B?ZStHaER0ZTlUTGNvRmJjVVFPMUEyWHZvUlJjVFhtalVaNnJ1T2N2aXhzckZw?=
 =?utf-8?B?cTlhak8yeGRYa3JhR2FVWXpSeEt2UkxkR0dqYklZL2ppWGFyV0ZKVWthbFM4?=
 =?utf-8?B?YktNejVNRS82YmpEbGNFbVBZdytsU3kvT0dBeWF6azBNRWxDRWN5aEJmOHRi?=
 =?utf-8?B?UE5aVkthWks5U1QyOHBiczNVMENTTXJ0QVA2NytHZnRkcitTYkYyZ0VkSWJU?=
 =?utf-8?Q?bib1gW16yG/wFClsnj8mGyGp5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 92879c07-cdfd-4e2d-1a98-08db7c58785d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 06:32:42.5068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gxoLqvzcXT+TIKEGjr4Mm12lnn1UiqehwumIzCqAv4gm9Y8//48FNpvD9/uH1wD+00UBomCohnfy9xDZaTmouA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8278
Message-ID-Hash: G3GBFJZRGSBRNM5FV655T4RF7N3EJFKR
X-Message-ID-Hash: G3GBFJZRGSBRNM5FV655T4RF7N3EJFKR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3GBFJZRGSBRNM5FV655T4RF7N3EJFKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/07/23 22:48, Pierre-Louis Bossart wrote:
>
> On 7/3/23 17:18, Mukunda,Vijendar wrote:
>> On 03/07/23 20:15, Pierre-Louis Bossart wrote:
>>> On 7/3/23 16:46, Mukunda,Vijendar wrote:
>>>> On 03/07/23 19:50, Pierre-Louis Bossart wrote:
>>>>> On 7/3/23 15:31, Mukunda,Vijendar wrote:
>>>>>> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>>>>>>> I can see that the interrupts are disabled in
>>>>>>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>>>>>>> is used... I don't think this commit message is correct.
>>>>>>>>>>
>>>>>>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>>>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>>>>>>> otherwise that would break the jack detection.
>>>>>>>>> You are right. The commit message is wrong and not clear.
>>>>>>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>>>>>>> system suspension.
>>>>>>>>
>>>>>>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>>>>>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>>>>>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>>>>>>> in the .prepare stage.
>>>>>>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>>>>>>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>>>>>>
>>>>>>> Hi Vijendar,
>>>>>>> Do you have any comments?
>>>>>> On AMD platforms, we are supporting two power modes.
>>>>>> 1) Bus reset mode
>>>>>> 2) Clock Stop Mode
>>>>>>
>>>>>> In Bus reset mode, bus will re-enumerate the peripheral devices
>>>>>> whereas in ClockStop Mode, applying ClockStop Mode0
>>>>>> in both pm ops (runtime pm ops and system level pm ops).
>>>>>>
>>>>>> Currently, SDCA interrupts are disabled on peripheral side, when system level
>>>>>> suspend is invoked.
>>>>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>>>>> SoundWire manager device is in D3 state.
>>>>> That was precisely the point of clock stop mode: a peripheral can
>>>>> restart the system even when it's in lower-power mode.
>>>>>
>>>>> If there's no means to let a peripheral restart, the only benefit is
>>>>> maybe to skip the enumeration time. That's not what the spec intended....
>>>> As per our understanding, you are pointing to ClockStopMode1.
>>>> ClockStopMode1 requires re-enumeration as peripherals move
>>>> to unattached state.
>>>> We have cross-checked ClockStopMode0 description in spec.
>>>> It doesn't specify about peripheral device state as Unattached.
>>>> We are referring here "ClockStopMode0" only.
>>> No I was describing the difference between the 'Bus reset mode' and the
>>> 'clock stop mode' on the manager side.
>>>
>>> There's also nothing in the spec preventing the manager from doing a
>>> reset at any time, including after exiting the clock mode0 stop.
>>>
>>>
>> Partly I agree.  As per our understanding, If any of the peripherals lost's sync,
>> and re-enumeration is required.
>> If continuous parity errors/bus clash conditions are reported over the link,
>> Sdw Manager bus reset sequence should be invoked. This is a different scenario.
>> Both the scenarios are asynchronous.
>>  
>> Going with Spec definition for ClockStopMode0, as it's Imp defined for
>> SoundWire Manager, want to stick to Clockstop when D3 call is invoked
>> and restore the clock when D0 call is invoked for our platforms.
> The problem is that 'D3' can be used for two separate scenarios
> - S0/D3: that's pm_runtime suspend
> - Sx/D4: that's system suspend
> It's very unclear what the benefit of clock stop mode would be for the
> latter case.
>
We are pointing system level suspend scenario only.

We have already SoundWire Power off mode - ClockStop Mode will be
applied followed by bus reset and SoundWire manager will be disabled.
On parent side, ACP soft reset will be applied and ACP parent driver can
wake for PME events for Soundwire manager.

Sx/D4 case, want to avoid re-enumeration when multiple peripherals are connected.
For Clock Stop + Bus reset (keeping Sdw manager enabled), we can define a new power mode
on SoundWire manager side.

Having said that, below are power modes we want to support on our side.

1) Idle Mode - Don't stop the clock for SoundWire manager and Soundwire manager is not
disabled during suspend callbacks.
2) ClockStop Mode - Only apply ClockStopMode0 on Soundwire manager side and restore
the clock when resume sequence is invoked (even in case of system level suspend also)
3) ClockStop Mode + Bus reset - Apply ClockStopMode0 when Sound wire manager entering
runtime suspend state. In system level resume case, apply clock stop exit and bus reset which
will re-enumerate all peripheral devices over the links.
4) Power off mode: apply Clock Stop + SoundWire manager IP power off sequence.
Parent device(ACP) will be powered off. ACP can wake up for in band wake-up events.

We expect if someone wants to go with only ClockStop mode, peripheral side also required
support should be enabled.






