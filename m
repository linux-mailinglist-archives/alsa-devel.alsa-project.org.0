Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4164F2385
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 08:45:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8150E16D9;
	Tue,  5 Apr 2022 08:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8150E16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649141147;
	bh=AWT1jqnNR25iobGeMMK0fLQxJJ2RodxDdCyz/d+1bik=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EFs72/38KA/6MH1Dr+gnxXaAK4677B418aOBdZTwfJ4UEIC39/WRXz1USajESgFsJ
	 erdDpKWLBhbFhwomvm0WKSxVHqKQUhpinyhknGOX8uM3LEmUNc3gqYaOzqwe+dGZGj
	 5BFkPg7QPSQ/8VYOFLKJG3NaKcQGIRWnVxKh6by8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F34CAF8016B;
	Tue,  5 Apr 2022 08:44:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40A83F8016A; Tue,  5 Apr 2022 08:44:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38430F800D1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 08:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38430F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Ag9klUrP"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="CVtxRTVL"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649141082; x=1680677082;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AWT1jqnNR25iobGeMMK0fLQxJJ2RodxDdCyz/d+1bik=;
 b=Ag9klUrPG8wjfcprDsi2qRt0c15xPr79Y+NuUkY18Vr+75Id/DMghUIm
 VFK7IpAmisG4kKbb2lnA404D+Hr72TavckoCZ0scG/uBMBEfSEJyM10/I
 TRAPsJHI40/bdIcGV8GhsX5bWlBFYDMRM+uLd3fQDMeUzN3CVp25e6AWR
 V0Yi+VvjTfmZYSVKtSEriXMkzuePF8Gglt8+uws6PtNhZK8VjV2xokPeG
 hP4jJr7VyofYOjan0U5d5Or4Kc1ngX6R010ZWJt76eAVxpzBf4ifNgzev
 EL6lkE7Nb9Ed/WxHLYopoOd2DM05ts5ckSotix0xH72+LXtD9LYCak3/s g==;
X-IronPort-AV: E=Sophos;i="5.90,236,1643698800"; d="scan'208";a="151519321"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Apr 2022 23:44:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Apr 2022 23:44:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 4 Apr 2022 23:44:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1euUhJSaTjQS+aXU6RKCHrmoBZHuwFZuKlmw6coTeE2oHOklcNnie1qQAH85RKYLuZr1bPQr3g8B3KDXK7bbF7xS62gk8r3bCzYn9bGJeTIPAKLUa9Fw3eH1VmWs7BFRzXo+1IyNramvmclRwFDZil3x5sxPbZoBjwsCHi+kfkjtQtR+JanqMsDfcc2OfEHmmlrg0wH0xMZvl5x2s5jgEdcFjUif/6pFVCtGPNYKcU8i4k/2hv2kKmB2SZ1Z8wZeT9FXSmoUcTNK2mYOYkoGzvFkmFvwr7DlPEepWmW1dt0XKLjbG5HyULkCMbUqqXpg6VJmCZFJthhy7XcKG9fLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWT1jqnNR25iobGeMMK0fLQxJJ2RodxDdCyz/d+1bik=;
 b=dKjYGXN17rEPYnRZafIhRBl34a++5i+wXfbosEhM7/xKKg7yzfwxlnLnGdU8NoDVatqE2PvtsDJxs+jSbSs702AoqmdluH1T44mdT6SuQsbfzefGP5SHSb192Ch7iPBs2HFiZZShoMYe7sEgAWUzDgxTdo7qxH8NGqDYBvdmbDh37Wrgc/twk9qXtMtTAmJXb8WSbCkwcLOroWi945lKtZ2RLuRDctsbmqWjk9OyOd7qEtiVScVqtsCTR2INmKZZvM1VotS4glKVqNxYfPM7K4WStf8ThTus5bwVatrm/tBCECNyaZVChf8PYFQZstlO+tY72tcBYAYPQsqQYBURUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWT1jqnNR25iobGeMMK0fLQxJJ2RodxDdCyz/d+1bik=;
 b=CVtxRTVLiSEy4WjFXIBJipeOf3lkpqjpu0qeMj8dudJmP9euaNh/tgHoEzEw7/fXTzG7BbsXdAWUl9NslwWwjT8CzZWX4TIw+ltRGjzz+d0kBvf/J7bs9IHAqO9hWHmgpwt7FscOTPMFCVMetnW8ImzIjKDNX6QhwvfNtx2QjfY=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Tue, 5 Apr 2022 06:44:31 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f%5]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 06:44:31 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <jakobkoschel@gmail.com>
Subject: Re: [PATCH 3/3] ASoC: atmel-ssc: replace usage of found with
 dedicated list iterator variable
Thread-Topic: [PATCH 3/3] ASoC: atmel-ssc: replace usage of found with
 dedicated list iterator variable
Thread-Index: AQHYRUnBGgyvHb7KL0e0wZrMAc90sqzg5qAA
Date: Tue, 5 Apr 2022 06:44:31 +0000
Message-ID: <a82fb96b-6c34-25ed-47bc-53a755366676@microchip.com>
References: <20220331215003.882143-1-jakobkoschel@gmail.com>
 <20220331215003.882143-3-jakobkoschel@gmail.com>
In-Reply-To: <20220331215003.882143-3-jakobkoschel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d782dc10-aa4b-47bd-846a-08da16cfbd51
x-ms-traffictypediagnostic: SA2PR11MB4875:EE_
x-microsoft-antispam-prvs: <SA2PR11MB4875F945E681324F8DCB15FFE7E49@SA2PR11MB4875.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0NBptr64kgbpZIPa3tDFfn1sAs7QGPKd65JS924SM4+9OTfYbhpM/J35R1+YWZZS8fk5Bu14b6HmxXNR/az7CtsdWhDwHvGx4wTFYWzclKUhjYcj8rI8iUBhipSzvxs/cFEIMbkgZdG0NgNsoMWy8YYsZ1lZVmhwKDXTNGoWUH0YCWUW+X0+X7Av7OeiSu0BKS4yqYiWkw1lDKUpWjTzVB6STA7LI6Lb9HdIviIkmr2abHyLRP7j4Uk7TM2Pkf8ErDG5iK/nbd2v6FjbdarfqTTg6Bw+025JAjAeAAMF+mEBytr8UVirXFyChTPaaQySrqE5pRD/8CLsP+Ec5pPN31ciL/1Ft5gcEb64ScOhRsuPEC578DAVoB3RG/IU3if6Uj15mNYNty1jC0cEoygAnhNzneQKT3oXs9XbVtgD7MCaQSxhWh2TfYRSEq4gulJ8fjeLpnr3cbkL5WZtN4KdcsCf0a8vbfQjxr2EmXGxSdB8YzA5jqVambrV/q1iDim5MrBqDuPSP4KORgPcsL2kQDsRyTn1j3CZtv/YeEt6R1ad7l+xp87xUaDYRWmpCpc8QkxR8woiw570tkMERE3JRPB5zjo3LX9b3yw6KL0to5jnnL5tKMv+yhHR5BbeC4VCILYlp02gxlHb/wECRU4OBb/GpFDl3QIBEcR5SS78sg3l7Fge/pFMQRydtdj9+GxVlOhYQkKc4bvConzeYNrqygmEX3W4dQi4WY+HP0tX3MiPoOa2u1C8AzDq4/7vpv/ps+xzd9BYGMpjnqyjhhhI83/ryFQFOSj4UPVMwZBtcclbFn7o3QjVYT3NrMb3S4rSuVtSONCr6VOWzSShfnatsHlaz/ECsjUKe9Pb/x76glE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(966005)(6506007)(122000001)(66476007)(66556008)(6512007)(508600001)(64756008)(53546011)(66446008)(8676002)(6486002)(4326008)(4744005)(2906002)(86362001)(66946007)(38100700002)(186003)(5660300002)(316002)(7416002)(76116006)(6916009)(8936002)(31686004)(36756003)(91956017)(38070700005)(54906003)(71200400001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTB5b3RUQmg3c29vUmlnNFkzWmQ4eTZ3V3F0UWNwNW85WS8wUzZ6OTdTaG1p?=
 =?utf-8?B?emZnV3dxRkUyM094TmUwZGpUVldjdmpYWlBITnJTSStPcXgvR2Qvd0tFRzBK?=
 =?utf-8?B?WmxMNUFqL2llZnNyQkxZMlpya0xLS0FFK05oV2ZEb09IY3NaMUN0eXhtZ1FL?=
 =?utf-8?B?TUt5dlBBb29pVEEvQnNjSEU0OE1TSTJSUjRObStubnU4MDZnYzZ1K1d2azh1?=
 =?utf-8?B?VEE4VHl2WmxUU3Q5Tm8vMHdYRXorWk9RTXVhaWt4YXdqeDhxM1dWSk05Rll4?=
 =?utf-8?B?dmQ5RktFaXpRem9tZ1U1Yk1DUnFHZ2lTT00wa1NpV3lsVWl3dllOTjNEcjRk?=
 =?utf-8?B?SnFsY1FPZG1USFFiek9xZEJBVDluSEhIKzRKemh5eWpxai9HZGxwZldOczZH?=
 =?utf-8?B?MGRJMnpoK01jTGJlUDVmVmsyeCtOQjJRQ3JGVWFzS0tyQktQeG0wc3ltNkEr?=
 =?utf-8?B?d3hVZSt3MG5EbWRhMkZCOWVpWVUvcVZPSm9nTGNBUVR3SzZvWk5JazV0ZkRQ?=
 =?utf-8?B?YlRNSXhJYUlBMTNlR0xJbUkwMGtIVEVLQ1RRRkt5TUxUTllua0lCQjJIbE15?=
 =?utf-8?B?U0ZHZE9USkMwMW51VzJoNnN5MXMrczhVQzVwZkpNRlpNdzA5ZVB2djJHTjBt?=
 =?utf-8?B?ckVsMU9QdFRuZWRMZ1BKUjBJN0Flc0tXSlAwY1FqYXRERllXOFBUQWVIellF?=
 =?utf-8?B?ZGFTcnNrT0FISDNqeFpmbGJ5bHVSOGI3QytmWEZJc1JOSzN1T3FyUGREZHBz?=
 =?utf-8?B?eUczWHJhSmoxcGJyblVTRjdhQThyMDFLZERKRWJkQ0FEazJkeXN6STBFRk9W?=
 =?utf-8?B?TittVThnWjdlVkJaS2V4Vy9yKytoelhxZ0FKejFxeVFVckc5cVNnSmxZRFlE?=
 =?utf-8?B?UmpxbFgzZWJLTnRmWnRoQjljQUJ5ZmNnMVo4NFZxREtFNHpCYW11QWg1b0ZS?=
 =?utf-8?B?NmdaZWNSbzZ2cVBZdXR6ZW5iWGJ1QUdQVFFvSU91MWdCdmpFNzJkOHA1d0FI?=
 =?utf-8?B?RDZ3TjQ3b1dKNXJQU3NMQnZrdEFZb1BWZ3Zyazc2Nk9XZkduZWovdFBLc0Ry?=
 =?utf-8?B?dFdueFR5cWhZVTltTlhrL3RObkd2MmlGTVpjRVZVSDRGcGlaOWF4bEQ0L3Ri?=
 =?utf-8?B?NzBnbmpTVkFvMHVTcW1ZdVU3cGYzTDRMRWEwaERzNVB6SUN3NGxxZzhPNndj?=
 =?utf-8?B?N3llc3JPOGdKTUhlTmF0ZzJVaFBPOGpWV2g4U1BmQ21NTFBzbkhyZmJtSnY2?=
 =?utf-8?B?cklkNXU0dTBWcWEwQ0ZvbUdDRWZydXB2U2hnc1drcEFRT1RMN3cwSStXV1Fy?=
 =?utf-8?B?RnZmUTRCYWdXVmJvY2lFUjNISGVvZDY2b0J3NzZjcDFtMG91WThLWm90b241?=
 =?utf-8?B?UW5HREQwT3pqblFTS0REMFprbnBuWGt0elRWb3VIZTllR0VveXA2VkJLM1d5?=
 =?utf-8?B?UkVzV3cwRDJTMFduNmRweXdaZFlRU05QYVZVbU9UNndGR0IxTHFZL3J4a0xv?=
 =?utf-8?B?aFFNL3BTNkEvQ2tURW51S28vTktobGQwUGc2aFRoLzNwZ1R5N0Q4V2FaN2U5?=
 =?utf-8?B?U0ZrcWNxTllQa3c4L3U5TkZsTEJubWdMQ3FXcEFIZTFudStwTmpuNnRLM2RE?=
 =?utf-8?B?YSswS3RtU21hTTd0RXVIMjZERWs5UUxLODQ0b0lOT3lIcGk5aE5sdU1lT09k?=
 =?utf-8?B?MFhGaVliZFNpSW8reXRVNng4NnpSME42TDV6RnVoVldJODNReTI1aCtUT1RI?=
 =?utf-8?B?L1lhQndlQVZ3WlljWGNZbFBmK0VnUHR4UmFnd25ESmlVNjUrQU40UUMrTytW?=
 =?utf-8?B?ck5BcWI3dTlpT3pvQVFhYTRGVTNYQUdMam5uNW9PWW50R3djT2d0MTN5Z0Ju?=
 =?utf-8?B?UE5MQm9WTGkyOWNyUHJVK2hUcVc2TS9xWHhqWUd0L092eDFIN2lqQlp2MWVp?=
 =?utf-8?B?cmpidzd0ejY1RjNWS3RKTGR4cG5DY1I4VVYxbWRoeFlLUFArM2hzM2I4blkw?=
 =?utf-8?B?ZXpxNlk5R3I5RHFkc0VTMkhJZXlqajlaSGZKTklEOVU3YU9leEJhRmU4RHhq?=
 =?utf-8?B?TFVMVGdDZ1NlMjRlVkY1dWFXMDVpeUVnWjZ0Wm5LY0pBZG1MOWdoKzZkTG9C?=
 =?utf-8?B?Sml4OFcxNlZxNW42WWNTbHhpSjNsa0cwN0ZGeDBwSmxCMlZEekhPTTVsNDhT?=
 =?utf-8?B?SGViWGs0R3ErWktkWTF5MHZsUzk4dTBlYWlYZGZxa1JjSDRJZnBiTGJrNWVI?=
 =?utf-8?B?azVoU2dpd2RsMkdpVVNPdUU3RHZVR1hraXhscnFua2RialIzM0FSNU1odkxT?=
 =?utf-8?B?TEw0R045ZGYzSVFWWE1Uc25pcFFNNFgvUUgrcXdRenNqT2FudGdkZzBycFZl?=
 =?utf-8?Q?lBvexy2CWvRW3BQgIEYlg9ajN09Z4uxLkDGTnv2RdYwav?=
x-ms-exchange-antispam-messagedata-1: BTzrV44ha+FdqNNGXwmREI7WySnse742PIc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6246B41DB8B76541976E2FDF1C1424AD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d782dc10-aa4b-47bd-846a-08da16cfbd51
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 06:44:31.5999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WV93Qr2PfjWJE9OTMGj4oJP5hSKauvGLAbj8dSOaSsoqVr63k37bkOB5Wu8gL10Sp2OKEvanXkdzmOt3okTHamq71XX/u13arcrWkHzHb04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
Cc: alsa-devel@alsa-project.org, cezary.rojewski@intel.com,
 yang.jie@linux.intel.com, alexandre.belloni@bootlin.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, c.giuffrida@vu.nl, zhang.lyra@gmail.com,
 pierre-louis.bossart@linux.intel.com, h.j.bos@vu.nl, yangyingliang@huawei.com,
 orsonzhai@gmail.com, arnd@arndb.de, Nicolas.Ferre@microchip.com,
 bjohannesmeyer@gmail.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, baolin.wang7@gmail.com,
 Claudiu.Beznea@microchip.com, rppt@kernel.org
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

T24gMDEuMDQuMjAyMiAwMDo1MCwgSmFrb2IgS29zY2hlbCB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUbyBtb3ZlIHRoZSBsaXN0IGl0ZXJhdG9yIHZh
cmlhYmxlIGludG8gdGhlIGxpc3RfZm9yX2VhY2hfZW50cnlfKigpDQo+IG1hY3JvIGluIHRoZSBm
dXR1cmUgaXQgc2hvdWxkIGJlIGF2b2lkZWQgdG8gdXNlIHRoZSBsaXN0IGl0ZXJhdG9yDQo+IHZh
cmlhYmxlIGFmdGVyIHRoZSBsb29wIGJvZHkuDQo+IA0KPiBUbyAqbmV2ZXIqIHVzZSB0aGUgbGlz
dCBpdGVyYXRvciB2YXJpYWJsZSBhZnRlciB0aGUgbG9vcCBpdCB3YXMNCj4gY29uY2x1ZGVkIHRv
IHVzZSBhIHNlcGFyYXRlIGl0ZXJhdG9yIHZhcmlhYmxlIGluc3RlYWQgb2YgYQ0KPiBmb3VuZCBi
b29sZWFuIFsxXS4NCj4gDQo+IFRoaXMgcmVtb3ZlcyB0aGUgbmVlZCB0byB1c2UgYSBmb3VuZCB2
YXJpYWJsZSBhbmQgc2ltcGx5IGNoZWNraW5nIGlmDQo+IHRoZSB2YXJpYWJsZSB3YXMgc2V0LCBj
YW4gZGV0ZXJtaW5lIGlmIHRoZSBicmVhay9nb3RvIHdhcyBoaXQuDQo+IA0KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FIay09d2dScl9EOENCLUQ5S2ctYz1FSHJlQXNrNVNx
WFB3cjlZN2s5c0E2Y1dYSjZ3QG1haWwuZ21haWwuY29tLyBbMV0NCj4gU2lnbmVkLW9mZi1ieTog
SmFrb2IgS29zY2hlbCA8amFrb2Jrb3NjaGVsQGdtYWlsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENv
ZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNyb2NoaXAuY29tPg0KDQpUaGFu
a3MhDQo=
