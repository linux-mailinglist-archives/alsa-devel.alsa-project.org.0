Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF264B120
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 09:27:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1275E18BA;
	Tue, 13 Dec 2022 09:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1275E18BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670920072;
	bh=jLrABWr//YQPmvSG0hI5DVyqwTGT1Oli+tldOLmR7Rg=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B7uRAE1WFB3IWHbkyWz/HeHfdyErEUGwjR3xRhOlBGSeMBAj2at9JP2bOx0KvJ5Pe
	 gC6Ea57q1beXqeaNdC7L/k2Fy1HLf8AqDEM4aldRbtKyLyn/LwvsZFqSJ6S9v5fuxV
	 /f390LZ7Xvxyb8wAOYD8u5VaLaJu16J1S3CH7eQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72849F80431;
	Tue, 13 Dec 2022 09:26:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5129CF804D6; Tue, 13 Dec 2022 09:26:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F33AF80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 09:26:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F33AF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=microchip.com
 header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=vsG+kf9J; 
 dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=SiQPiXy/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1670920010; x=1702456010;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jLrABWr//YQPmvSG0hI5DVyqwTGT1Oli+tldOLmR7Rg=;
 b=vsG+kf9JyPPLcY5Ao8v+u3DQp/K9QC+8l85WhHwRjqnE0FtUbaaCF59+
 RLw9GM9kZLE/TXNiXPZsmTPA9VIQcz/TTTXYexUbKjZRqfQpfc41ZTVii
 LOXs0jgW7rB+NscD8P21WYTFH+QP0V6Nv+H0cnhFe0GPciNU8osaqIjbE
 nKqAnxpmLTSLugv5jQVu3d5bFiPB5tEzdKA64rFMteHkGma6zbbYgoQvg
 W2ChqzsPDgAtMX44KFo0Zg/9xMzv/uHzqUu3j53iqF5zCNr7rIUSj6fDC
 47KuzwVj+8GybyjpIkmYy+N2UdMbdCHay6ndaOPC+Ifc3hOEXvuldcjxX A==;
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; d="scan'208";a="192839756"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Dec 2022 01:26:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 01:26:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 01:26:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gilqj6LX76yvFXc7SEUhtbjpZMtuE+XzDhh4ozz4WcbKNfWjbN4DpB5LQqbbEAyKJMY2a4oRjz2TBuWdNZ31QnopkF8560OnfrX5skK2Ryn2SaiCTAnTeNwjAPA9q7BrpvEXpSVidH7+LyxR/q+qNRIvd55ndaCNZtIh+GStkRWybkI5vEoTMdVebiJiZsPluIlFLoiwllWcKxPOIv1rh+dTBeU9I78FM2ymz8kHZgAjXDAavaOTr4Nm48SHqz/jLBuCOY8ba396qniUb8/7Eihn1cIVOEAENXIlyldnrdxIMAJsyQrC23tn7Ua2f1K2vv4AbIgXnGw80z3qPLMAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLrABWr//YQPmvSG0hI5DVyqwTGT1Oli+tldOLmR7Rg=;
 b=jJIycufO71Fiw7BJI7kwqBvwoNNjxwtP5x84H+yriQyhHQbLb8wudY/Np9c/hY572HJxz4v+H156j36eQ6BvIVhuWiojeIiWcylv0ZhxG/UXrc2EGX9CGvzNDhIsHfsDFIe6vmUdAHZf5b/CkK4wk92BecvuBN0EweT82/PZ0Nadbsxa46BgvYxftHrT4wAImC+2wExvdNGdWJB+/3T5VxGC+cnxNL5+n18XN+oQdnp+onJ4izBMvuuEfEz6dqHc3DtLXTrQl6YQnKY/uajUPh75ZXL/EpmkMaY9lrJSU5VpYq/LEdaqpUhXeAbZZoxZQ9KVnPD3OSJhPSEx5pBZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLrABWr//YQPmvSG0hI5DVyqwTGT1Oli+tldOLmR7Rg=;
 b=SiQPiXy/ybA7iHjMmZHQZqzbHRBGXIVR4Oy/WcysXfiw3mZecdDFj19FZkzz6p5zVRODeFaaigB5gPAMYP5p1dykBdrunjPeEIGvGdiJwgJFP/uNzqhOZ3yNVBxbOf/ZQVwPfCH3Ct4ZHP0tH3i3KZyFWXsCcUNWjB9eS7rESuo=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 08:26:43 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::98f6:c9d1:bb68:1c15]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::98f6:c9d1:bb68:1c15%10]) with mapi id 15.20.5880.019; Tue, 13 Dec
 2022 08:26:43 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>
Subject: Re: [PATCH 03/15] ASoC: atmel-classd: Drop empty platform remove
 function
Thread-Topic: [PATCH 03/15] ASoC: atmel-classd: Drop empty platform remove
 function
Thread-Index: AQHZDsyhvgkZDH1CZkKPsiprbkJjgw==
Date: Tue, 13 Dec 2022 08:26:43 +0000
Message-ID: <437f7e63-3849-8c13-2122-8f37c02ca56e@microchip.com>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
 <20221212205406.3771071-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221212205406.3771071-4-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|SA2PR11MB5067:EE_
x-ms-office365-filtering-correlation-id: 68fff59b-05f8-466a-3fec-08dadce3c41e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y9DCMo+OIz59vWgI2MH7l0NvnzO+FVZEOAlRAU/VDT+qwjo8+CFAJkaz3WuktXss2MQh5p26Soxxk352GOp72WcVbfY1e3shzJxnqsVEKLaQRyO9AzAsa3OGzSdQJa2brRzdAoNC3y159atf2ddKwX0W71VVdhcdfzdsa4q9Q/CaqvbnrgvguqFiLFf9w8p26mxCf53ciSvGxu3WHAIL3QLuILZPE5GkOIrk/vgB4EATdAsqTTClvqaWo5VK0Ot/jspMCTHK8VuaC53TZ+WSo3zjN+JanRDUzKexj8MPDNSjhUkdUTjrNxjeGHWO/2bqIo8omrmV22ENz/q5SFcDGdz1Nq15nt29M6U73oe8dKNFsEGkrVlWABWq4eJUe/UWnWhXEQ5gqrZr/RKSG+SGCsOQboNWMkrUAOYkhYw/LAPNlgZce4XB8PuKG2y0cvoPMSx1+EEl1YAWtAbJg3crAg31lXHz9g+ms8gcnaX+Ys9QZkqBz1vBVB3AuYAgCeihN43v1cPrsJt0Y0p1ECU4wRTODtvQl/+A7sVyATudS9IAp1XNnpZeSdT3Sd7bBRXwHG1oPRbaeAb+z4Qbj2uJgjbIQtYlvB4n6wyVThiMqIQq8Y7pL0tKX1aFm56DMq57W3WmUTzbv1FPMclpSNLQja+JXYh18opE6Y/CDQ9S7R38Ia7UmlRoOXLZzJrWBY5dGybfmP2+Nj2PePLl32y/mZ/4JIT4PVnJY6EPmRsGvkI163N9qN4T5436J5e1eHRPkO+/TW92AL2Og0pUtcF+yA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(122000001)(31686004)(2906002)(6486002)(186003)(478600001)(83380400001)(38070700005)(316002)(5660300002)(86362001)(66556008)(31696002)(41300700001)(8936002)(53546011)(66946007)(66476007)(66446008)(64756008)(91956017)(38100700002)(76116006)(54906003)(36756003)(6506007)(6512007)(110136005)(26005)(8676002)(71200400001)(2616005)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzduOFpWWVJsSnY3WmlPT2pPeC8xZFBHaVpSVTNrWGZTdnJXdGVSSUVnVGhi?=
 =?utf-8?B?Z3VlbmhrSVlrZEV0ejF0MGs4WmU2bVE1bm9neVBRRVpyWVFSUCt0TDVOeWVG?=
 =?utf-8?B?QnRzMUZhYmIwR3VzU0Z2Z2o0SHRoUFFjOXdUbXVERVhsVkZUUUdsaThzWkVH?=
 =?utf-8?B?bmhxVjA2OUhuQ3B0VnlWVmszcmQxN1JnWTZqQUR1UmZaZEFUcnovb2pQNGVQ?=
 =?utf-8?B?djl3TE43YzlzaVA1UVNoM2hReWdrbldOZjYzdEZ5aU1VMjRWeUhKNUF5cENu?=
 =?utf-8?B?TitGaUVQaldGWWRIZmpWN0VrOXpkQmp1a012NWxzdFlyelJuTVdBZEFsZWJS?=
 =?utf-8?B?Rkt3OTA0OHJtNFRZM1RBMVc3U1ZhdWQzMnRHSk1HdkF6UmVrVGovSUZReDJP?=
 =?utf-8?B?c3l3NmhLS1QzK2NsVGozSU1MaUJoM0NvZTZkbVE4eVRrTHpVa25OQWlpYlJO?=
 =?utf-8?B?T2ZVNExXWS9JVitsSUlSaUZVWTFSUDVWY3dubUp1YXVsTUdUcDYwdjNaeXZU?=
 =?utf-8?B?M2dUWEpKeHNUVFFxQTJPczFYaFdZQ0hLVm52ZVNwL2MxUUp2ZFljeEZYSE9S?=
 =?utf-8?B?SWM1Qk1PakJCL3JtaElacVY5cHErVHlxSmY2YVhNNFhsQVd5TlJWSDJLYTBy?=
 =?utf-8?B?VUdqdlIwLysrTEFMRTc0U1FCaTFyVlJGTzV2WXI0b3lDeGZybTdHQUVxQ1BB?=
 =?utf-8?B?QXhrQnFGL2VYQmdwa2dvTHlCc1BRYm5BQWhubThZMys5N0FTSVJyS1RnNTIy?=
 =?utf-8?B?Q3FqNFlBTXVCUzJPMGtsWERzK3RWZVJiaEs4NzRoV3QzVnhrbHg5WmUvTllR?=
 =?utf-8?B?WXdXa0RIUnI0ODVyZWJzekxET1JGRWh1MlhsdlQ3MHB3TzVMZGpqTXdDSXZ0?=
 =?utf-8?B?ZHFBTFJsbWhEZng4bFZkOFFlUkhlaVBLaUZLYytNN3g0Y3lrTXIrYmpDak94?=
 =?utf-8?B?aEFtTzhKc2RMeXRvNzlnUlJhODFWMWgrTlNyK2tNTjRjRFZEalZVcVBncUFl?=
 =?utf-8?B?UFlCSW1vd1pidE4wdXE4cWkzVUdTMHMxSDVSN0lYS0dxdWExR3gyZWhCVWU2?=
 =?utf-8?B?OXgxZFhpQUMrVC9TVGtlS1RodW1GVlc4WlFZMStGTHdDTno4U3R1UEZGWGZx?=
 =?utf-8?B?cHhJUW5MSFZ1d2JybnZUU25WK2t2SkMwM2ptZkNDRlJUM01pNUhiMjRRamx0?=
 =?utf-8?B?QUxHNHhnOW4xZEh1TGNENWg4NCsyWjVkS2MzNWQzWUo1UUlDN00vVzdwSElC?=
 =?utf-8?B?OXI0TkppYUw3bWRMTjZ2OTMzcVZ2Q0FKV2tmVW1TNE1ST2ppWDdHNldaNHNz?=
 =?utf-8?B?by80NWMzM0pnQzRNZXdQZmNGRlVlRFBrYTNwK1pOekorbklVLzI5WDBnRmVY?=
 =?utf-8?B?YitadE1reEFCSFp2UGVCeUVsQzREOTVDVG5HZkNKQ3NXU3E4bW8xc1FKc20y?=
 =?utf-8?B?Tm90Vko1NkE3VVZjN1IyLzYybUZmcVM1THV0NWFCdGpZaWdIKzhtaUI2WlVa?=
 =?utf-8?B?SDc2djRLaUxMbnR6N3hxQ1FsR2d6N0JTTUxBQ2lrc0NSWHZVUUs2c1VtUlNh?=
 =?utf-8?B?TXFtZHFZRXU1UU5ackFqT1ZlQlNaK3RNbDJqOWgxcTM4UXhtY1lDRU50TGYr?=
 =?utf-8?B?Qm8xUW45eUlmSTZKTytpUHdJOUt4WFNEdStPc2c1UmtzblRnRVg0OCtFWjAr?=
 =?utf-8?B?NUwwQkl1LzRjOWljVkhLWlVwMjcvVzhzdFl5VlRHa2ZEVXB4aEJwUCtlSVkv?=
 =?utf-8?B?Uno3Zk5JU2FsMVFXWFROOU85S1hwdUQ0ME95dUEvQ3BJVkJIQVFKZ1Jkamtq?=
 =?utf-8?B?NHQwSVhWbWNyUFF5WHFqVkVxems0R0lZS2dNdkZXQUZib1FiZnZvTEhzQURy?=
 =?utf-8?B?bE5rUUYxS3huZjZ6V0dGMU91UlZQK3M3bThGcDBmc3lFS2dTZ1RQZVRKcFhN?=
 =?utf-8?B?VEZ5Wmp6UkMrNDZHYVNPenpFTmFmbk9UYWdMalBpdGs2aVU0VE9UNGs3aTQ1?=
 =?utf-8?B?RFgxejUvUGxlbENaV05EeGZjaDRIbytUcFEyOGlhK3QySG5RTWZlWlFuUWt1?=
 =?utf-8?B?Q2pyekZaVU1VK1NRdGtDem5vdUY1aXI1Wjd4b0ZIekcyVUd1cVhIVENBY3JE?=
 =?utf-8?B?Z2FIc0N6Z0IrQmxaR1NwS3RqZWI1OFZZZXEzazlsRzFBQ2hGa1FMdlp5dlFE?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C6E1C959930E24286BFEFD2C28AF09C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fff59b-05f8-466a-3fec-08dadce3c41e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 08:26:43.1725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b1BPIxWtdj6BwkA6QGBP1dp7FAXg9SG4aXSwmV37SJvvv6AtuUrKx7QtsJKD0tD4/ZDqij1m1Jh4CQc2zMs0XE45GPl34XbtW3uy7/H1WLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 Nicolas.Ferre@microchip.com, tiwai@suse.com, kernel@pengutronix.de,
 codrin.ciubotariu@microchip.com, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMTIuMTIuMjAyMiAyMjo1MywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQSByZW1vdmUgY2FsbGJhY2sganVzdCBy
ZXR1cm5pbmcgMCBpcyBlcXVpdmFsZW50IHRvIG5vIHJlbW92ZSBjYWxsYmFjaw0KPiBhdCBhbGwu
IFNvIGRyb3AgdGhlIHVzZWxlc3MgZnVuY3Rpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQpSZXZpZXdl
ZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQoNCg0K
PiAtLS0NCj4gIHNvdW5kL3NvYy9hdG1lbC9hdG1lbC1jbGFzc2QuYyB8IDYgLS0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC9z
b2MvYXRtZWwvYXRtZWwtY2xhc3NkLmMgYi9zb3VuZC9zb2MvYXRtZWwvYXRtZWwtY2xhc3NkLmMN
Cj4gaW5kZXggODdkNmQ2ZWQwMjZiLi45ODgzZTY4NjdmZDEgMTAwNjQ0DQo+IC0tLSBhL3NvdW5k
L3NvYy9hdG1lbC9hdG1lbC1jbGFzc2QuYw0KPiArKysgYi9zb3VuZC9zb2MvYXRtZWwvYXRtZWwt
Y2xhc3NkLmMNCj4gQEAgLTYxNiwxMSArNjE2LDYgQEAgc3RhdGljIGludCBhdG1lbF9jbGFzc2Rf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICByZXR1cm4gcmV0
Ow0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgYXRtZWxfY2xhc3NkX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAtew0KPiAtICAgICAgIHJldHVybiAwOw0KPiAtfQ0KPiAt
DQo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhdG1lbF9jbGFzc2RfZHJpdmVyID0g
ew0KPiAgICAgICAgIC5kcml2ZXIgPSB7DQo+ICAgICAgICAgICAgICAgICAubmFtZSAgICAgICAg
ICAgPSAiYXRtZWwtY2xhc3NkIiwNCj4gQEAgLTYyOCw3ICs2MjMsNiBAQCBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBhdG1lbF9jbGFzc2RfZHJpdmVyID0gew0KPiAgICAgICAgICAgICAg
ICAgLnBtICAgICAgICAgICAgID0gJnNuZF9zb2NfcG1fb3BzLA0KPiAgICAgICAgIH0sDQo+ICAg
ICAgICAgLnByb2JlICA9IGF0bWVsX2NsYXNzZF9wcm9iZSwNCj4gLSAgICAgICAucmVtb3ZlID0g
YXRtZWxfY2xhc3NkX3JlbW92ZSwNCj4gIH07DQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGF0
bWVsX2NsYXNzZF9kcml2ZXIpOw0KPiANCj4gLS0NCj4gMi4zOC4xDQo+IA0KDQo=
