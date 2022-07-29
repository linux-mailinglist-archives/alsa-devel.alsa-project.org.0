Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C86584F01
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 12:41:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 174C81652;
	Fri, 29 Jul 2022 12:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 174C81652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659091310;
	bh=64gnyrgtOBPvmgqtWPHqSjy/nJ60aldoklEecTglugY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nj+EHlyXHvKo+VAi794Rbf8KGHsS4KCg61b8uWJjVrDiEREKwGuUV8e6g1I3wguR+
	 TJZY+UbOJpgr1uYLbA/gTVXq3XoNxuSR2pGHeY7doBhUpKVcuPOW/Vs+ZPGM18LjuT
	 Wc1d4titIvM93z/kmQzD+biNEAtFEyirsi9EvkN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8828FF804B1;
	Fri, 29 Jul 2022 12:40:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B26BF8015B; Fri, 29 Jul 2022 12:40:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37416F8015B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 12:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37416F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="f8NKnb+Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSW61jNdh2vVe1gGxmGBQkCX6B9/xS7Kn2WXFb6H0wzBEcD+/j454jDtJEzRNPNhUHeAcrSCv/RTKqEDHBNCVeLA547ggkyZpmurKqZSrFYiaHrE5oA+rLlb9ZNiLPSyf3G4f0WM7DOzFJ0fLfQJ4PSWrwaXu8Wn5BQKRoEm6X5O3sJ6+BrPcpodPkw9+Zls4090H2H4lIIvHqVwbnyueEubf7hVSqmjq0AYS+FGpleAVXkNBRiTsha58P9G9mdceqgckL7BNmTOhvPqBsQVYEUvcxTneP25PTaU6W35jtl8T85JX1VJrh0UKZOKNPKGK8TovPbVLZnlYQRjVl9WTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay7i7ehHgNn2n4h9LnvIQSjPgmrnU/uFR5syWdsi/rQ=;
 b=kftUkNgytHZiRk21J+0Og4mEPKqR+6jztGchVcEMAj8431B0JPQKbAaClJxUa377jsEA3gTKpjgTryBmGIhWwOIUdG9JpdCV+lLAYZREf3PUWGonI7wMv3MDJn+xqpvHrTR2dKwbVxPFK5KOK5yuElH6qcIDquuQkbVWqu6C5wp9iVqIomcxijPJF2S3tX7EhN80Jl/bLbqARrai6SRWvrIyCA+cqSwJw4+7WbWvZebibiQak6gIeIp93H76XmnMm3143p1Sttr7x4VWE7ommWcaJM4aRWTf0UPQ+Ve+Y9FlhS3UHCQur4ekCa1UlVoTDb2dhsgfYetiIrpzcZi8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay7i7ehHgNn2n4h9LnvIQSjPgmrnU/uFR5syWdsi/rQ=;
 b=f8NKnb+Yi5XNWbOaqmP5kRx0FJtY78vEHrbmj07AocUnyNnb6SZP9u2g2s0MZfeXteX6LrVrntUGQc2q8RFJoP7XY3BmxLUOcocRcumsCYEGG2/WGkyHFJ9xom137z/JpZank6lyqf7abgL5ncEwfLBMKC+NVygk+HEU1p0F0kE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DM5PR12MB1772.namprd12.prod.outlook.com (2603:10b6:3:107::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Fri, 29 Jul
 2022 10:40:34 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::ed9a:b809:1f3c:1e7f]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::ed9a:b809:1f3c:1e7f%7]) with mapi id 15.20.5458.020; Fri, 29 Jul 2022
 10:40:34 +0000
Message-ID: <c0451d3b-40bc-a593-f0fe-fa16bc036706@amd.com>
Date: Fri, 29 Jul 2022 16:13:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: amd: acp: Modify dai_id macros to be more generic
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220722141705.3340440-1-venkataprasad.potturu@amd.com>
 <Ytq5rlr/er0wDTae@sirena.org.uk>
 <PH7PR12MB595106BC93458F31B2D8C5A9E9959@PH7PR12MB5951.namprd12.prod.outlook.com>
 <Yt6GW/29wJ9081rh@sirena.org.uk>
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <Yt6GW/29wJ9081rh@sirena.org.uk>
X-ClientProxiedBy: PN2PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::15) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49f416d2-4371-40fd-b043-08da714ec45d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1772:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JZitnuwUHmoOB9C5lyUqUfyV3Y+TstwO65yAQC20e5vWkPtrGrtu2YYTHBt2hQgoWkW3e4l4jWWfoo2DXM3fjppHmF5LVanGm6OpmP3rY/nTYoH2/D5IVMwK3gv+ZrQFWvlTDgbCRMUoQ+A6PF6hi83KnOp/JAfmSQMawYYEg37pW1atftRSK26MlM22LbE1/kBNG0dZBWHlZWzfflvECzdoOY8j5RNZTzPZlCH8OgqBY16ZPjT2TtVAvFZyKjnYgWrjbe6y3fvmXznWVQuLboCQwZEC/V52fyCIHAIMuL8T771WXRIzguBI70qZwdh1lWsvli2cNRpp3mieKFk03+E097KjeGBZTb2ku4VyWlnKJxgUUnV43trpfA2+TfHCWX0/BV2CmKoOqCD60HbZlq+dD/CdsgA1Hv0xFdun0OQylAi99cpWdty4W6Ur9ohCqZmcUjRgOt0Hfrq+jvloR3RzxiTC2YYCN5p0qDf2v7BwT1NO21KH8S+fZ/aKhWbFPW6yXFKo635TAt7UZhAAzED35MJ3XZERD4kKlh4QH3QQoCM1bsBJnnMxchyVCzQ7zszHxPLdOuewzlaeAcTKvD2riSq3MRGW9zmwxF8ms7Y5bgl0RueiuOwmThI4LdsGGSUoB0eOLN4ss6SwXqjWpRYkH2YY5amnnnKNq4ryFcXXabUPNQz8hlQpYW91cRYRp9Awpye+udpWm0wvpj/mZuP9XYYiISYVyG91xO7tuWMf9xXdSFrXTLyrC2FElKMxiBvG2Iots1QpWhVpFReXcwI+aVUvFTQOamsFqqap7K+4tmi6pVZVY026//U76C3zU4daZCMWPqJovQbdXzt9S5JPjf72Yh9f36DY84mj36k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(33964004)(6506007)(41300700001)(6486002)(478600001)(83380400001)(26005)(53546011)(6512007)(186003)(2616005)(2906002)(5660300002)(8936002)(316002)(6916009)(66946007)(4326008)(8676002)(66476007)(66556008)(86362001)(54906003)(38100700002)(31696002)(31686004)(36756003)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEF4ZW1PQUd1SUtlWm9SZWhZQjN0dFIvMVhUT0FnbldXdEFwVWgyMi9ZTUJK?=
 =?utf-8?B?RWdKNjhzcmx4VytNcVUrV3REcXMyelRFL3ljZ3U2cE5lSUtCQ1RBNzRGdkZJ?=
 =?utf-8?B?L2w5U2FrRzFHbFdEeWs3bTdFZVJrOGlGaThWenF6UGVCOGhHWjlIZ2VRQ3RN?=
 =?utf-8?B?bjRlRHVtaWttU2lwVE0ycW51dHVwaHJOcXcxMlFRSkx1Y1FSU2dRUTNzdVVT?=
 =?utf-8?B?MzVKUVhPbWJ0TUdUY3l2aGNnbll6M2dNR3BpVjFSaGI4eVh1djJUamt3UTRr?=
 =?utf-8?B?dU01U0ViaWoyTUlSM0VZdjZyOWIyMnRNakV0aVhYOGFhdXRBS0JlMC9QeC9v?=
 =?utf-8?B?YXpwb003dzBrYVU3bE04bFZRNTlVVE5BMWZIWXMxdlBmSGhhYTdJYmJ0U3hy?=
 =?utf-8?B?L2lYY3BMQ0FhdVFkeitmTFp3Z2VROHZkU29qeTBLbjdycTVzVlhSRzV2cVdo?=
 =?utf-8?B?UUhqaVc1Q3N3TGgreFZMejcxUlN5bFk2S3FxU0svUTRkSG42c3dUMk9CR0RC?=
 =?utf-8?B?QjJ1NHZyWDdSdldVSE9nbUFIcysrb1hOTVpka3k1UVc5QW5QbkZicmhLY0c5?=
 =?utf-8?B?Sk5kd2pYWStMV21aSEU4OU9nZHdieEV3Wm4xUnhnbDl5RlN5cTN6REt0VUh2?=
 =?utf-8?B?Q1o3aUx1U2lKWWJnVVJVODcxU0RWbnBUSGNteTkvRHZmaDZOZFZENU16UjZo?=
 =?utf-8?B?UlMzY2xWZmowOTFObGlOY2hkdkFzd25pZ3liVFRsMWlEME0xeEEvNFE4aUJi?=
 =?utf-8?B?MEtST1FYNkFVZWN5YlB1Z0psRGQyMFVka3pIaWR1cjdTOTdyS1k4bTkxTjdD?=
 =?utf-8?B?cWNrZWMrWjlOS0g1NTgvZ2JibnlZci9zMklBR2pIUjJHMFJ2YnBDbzRmaEdH?=
 =?utf-8?B?M2dqZ0VHaTRiK0lod2orbWE2QzNLcGFsdmQyYm9sMEhtTk1Gb2M4bjhpZFFy?=
 =?utf-8?B?aWZKOWEvNkFqYTAzTXNnakE0UUFIYTBkNjRYUDlHTktYcktqRUlwWlVjRDNr?=
 =?utf-8?B?SFozMWt2MEtkZHF1QlExTFI2RkxIN0VhL3pDZDVCeEduUSthbHVkbHRpZWpr?=
 =?utf-8?B?aG1sR2k1djEraWlSL292Ynk1MmswdkMxbk1VSFNOamRQWlArVjRjcDg3VFYy?=
 =?utf-8?B?NWFYQk9abDlQbTVuOENvdkpzOHJMTGdHZkNTWHpJWDlrYUNxc2JHQnlueGM3?=
 =?utf-8?B?U24xSm90QVRHeXh3ZDZCQWoyOWJJVGRXUWM1Zm4rbG1aeTZBTnltUUtlRno1?=
 =?utf-8?B?dXZzdWVkMElJMFRPa1RaKzNrL1A3cVlRZC84ejVsenZRckZRN00wd3JzeUpR?=
 =?utf-8?B?NWh6cUpqUmNKV25MU2kwUlZienpRMzBTMjgvLyttdW1PNktRVUl2cW5YT3FZ?=
 =?utf-8?B?SituZjd3Z2luSkQyYkI4R1hPZjVyV1o4NXJ0SmFibEM2am4xM1hFZHcvZnkz?=
 =?utf-8?B?Qzdxd0c2dTg2eTk4U25KQmtXY1FvQ2NZR3BXN052Wkx1MVlzY1o1T1lXOGNz?=
 =?utf-8?B?dVVGK2Vzb0VpejFUVVRyVmlXdkVSU3pXWU5CUlUwaGJBOEtvZ2xzd0VFeWNG?=
 =?utf-8?B?ODdQMnFxUlJHR3FLSmNSSU9sTlhWcDZCQVR5Y3JRQW1DVmRpaksyWm43aEpB?=
 =?utf-8?B?OG95V2pNMDBtSEZaU2dOakFsVUFYb0NjZ21YbHdlc1lQWnBlMEJoSUtTTFo0?=
 =?utf-8?B?djM2UG1mVmlaSDdQcFBGTWFXN3A4QWRBRDVoTmNkVzdpdUQ5RWtrODJHZzI4?=
 =?utf-8?B?S21qQmdsaCs0V0Z2TDJYdUxGOCsvUVIzcDJMRE02MmVPdTVwTE9UeEMvcVRi?=
 =?utf-8?B?OGFPanJaa3lLNzQvSTNuRVNFczBMam9EOEN2ZEhNSGZJNWJtb3h2YkFwMEpv?=
 =?utf-8?B?bW8xTTNWSXdZODlZOW9GNjVMeGtyWHA3SXB1QU9rWTByZkkwNkxXbmJmWUVn?=
 =?utf-8?B?bEFPSUc0WE9zOXM1d0JjRThIb0pTTzVTaXlHUDkvWEtIRGxmNGNZdzgzZVBM?=
 =?utf-8?B?SCtKNTVvN29YT2JYbXcyN05jT0hhNEZUTjR0eDNEYnFJRXdZbkJRdzdvajZF?=
 =?utf-8?B?dHdiMnlobHdSSjE4U0R2SGtzVjc0Mys2MU05VEdQNHpyOHF6NnBwbGc1UU1t?=
 =?utf-8?Q?hKG/OChv3bebd+tTznxsliYiO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f416d2-4371-40fd-b043-08da714ec45d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 10:40:34.5489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXyUYfBMIx6Q80f8rV7T2MVGAohtsrrLPcelnC8+tKyB8E2mYY0k/BEjlSdeFjm7C/qX2LD0ASzHHLSxT2urvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1772
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Saba Kareem,
 Syed" <Syed.SabaKareem@amd.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Reddy,
 V sujith kumar" <Vsujithkumar.Reddy@amd.com>
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


On 7/25/22 17:32, Mark Brown wrote:
Thanks for your time.
> On Mon, Jul 25, 2022 at 10:27:19AM +0000, Prasad, Prasad wrote:
>
>> This looks like it's just an indentation/formatting change which isn't
>>
>> what the changelog said?
>> We are changing dai_id macro numbers, as renoir platform has 2 I2S instances and Rembrandt platform has 3 I2S instances.
>>
>> To make I2S instances as order, change DMIC_INSTANCE to 0x00, I2S_SP_INSTANCE to 0x01 and I2S_BT_INSTANCE to 0x02.
>> I2S_HS_INSTANCE is already 0x03.
> Please write a better changelog which makes this clear.
Okay, we will change accordingly.
>
> Please fix your e-mail client to clearly distinguish between quoted and
> non-quoted text, it's very hard to find your new text in your mail.
