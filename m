Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A44A7715
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 18:49:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADC8C1743;
	Wed,  2 Feb 2022 18:48:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADC8C1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643824147;
	bh=nL33WSsIfe5mTp6bTXggY0z6HMUlI0+K4mdQR1cJb6E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c7/Re9g2cgPzW8SagqB0TwyVTS7CEnnxTsjGHHkmkSJlUCUSdwN0JkHYQ3lHxEjCw
	 2kXX2h7Xrv0TOaDfPG4qFJZM4KqvcTR91r/ekQOs7Cvy3E5Hpc62LXtOlH+41ds89i
	 YpLkzOLiWUrRjCTAJ+npKa8X5lgvl7DLaPtoURGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC43F804B1;
	Wed,  2 Feb 2022 18:48:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07552F804B0; Wed,  2 Feb 2022 18:47:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2170F80095
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 18:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2170F80095
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPosm3N6ffajY9NuoRjNJLbeWJsvi6XPtfbTa/yLX/UwNYfdvoKNTPpapibt7MAxEqC8WrA9EoY5Lep1DYZacRUxe8vlIg4lsQsZQXUrGexEilHZbJ/hGIiZ7n3ylSPOjske5iCfeEVdrAW0W4ltttAaqEsIFzXVZPjwyM7S4pSD7AtcZdQN2BXTpxhrPvPS1S3Od2KktyuExF2ktxYVD/xjvyLMLY3qPs2kS/Nv7w/LKxe9ezYsOu3MzV5yVmyM1pAxWNk0IBjd6Ke6mHUjBnAi2N1iooZ8x3Q6xmsXBOVgipC6iybuatzHtfaCdq3Xd0xjIuwcTkQpNO7sniEMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL33WSsIfe5mTp6bTXggY0z6HMUlI0+K4mdQR1cJb6E=;
 b=Ph9YYn5i51PqZQz1TNfGcZJkcxMIW2z3me0RlM9aAIk8nE1D2k+Oz37BjGH+Z0rU8B13u/roFFVKYOqxRiZQkaW4y0GdOGqh/6gpGGpCtfwdDp0UTS3F97xZ5OpXGasW3dJ8uAxkG9TXGFcCeJe4Hq2B+2x2T+zu4jBy/TwPqJDQN/GF8lT/BYI344agO+9Pxr822LAzoBNAV2RXgPU3rEAV/e/HtHIgBOKVQqdD1C7leTqUof3Lgh1V6mN9JlrCCIznKyUp5HnOlLxaELT8aPDFsuMoWqQqNZ9HBWux80uS19zlRJTVL/Sjrk19zczAZH+ClSgK+Q0+qJm+jDLByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2540.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Wed, 2 Feb
 2022 17:47:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 17:47:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: How to add support for A_LAW pcm format to ALSA Loop driver ?
Thread-Topic: How to add support for A_LAW pcm format to ALSA Loop driver ?
Thread-Index: AQHYGF0AytmLbT5SsUSHMkjMgKOJIg==
Date: Wed, 2 Feb 2022 17:47:52 +0000
Message-ID: <ae9dc0fe-a97e-aac0-6644-20e3cbced76b@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abe185d7-ae70-4aab-ea0f-08d9e67422df
x-ms-traffictypediagnostic: MRZP264MB2540:EE_
x-microsoft-antispam-prvs: <MRZP264MB254014C998DF996F6524D92AED279@MRZP264MB2540.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sHwVzDh4mOYQv9+b4vUy4z3VxaD2ivRCVosj2Iuzg8jmpjGaOia9A+2CA1TJ1aVhBCC3iL4sKlIEbEcrucD7mrrck+sohFmDiOtu3ejcXVWEWhdMQ3mDmOgCz0M6+bp4sSsJhbcWq0fvqUMiZHokeus+DdmKQlEaAP7z4RP3QbThWZaUoQkkg1vQNDggJvWSm+pnxiMPg+YWoxfsrRobf1i+I3wwxiXGI4a/TCfMgDDDatetMSIRpceDtUiVO+Wloc4JX9JOVS0lA/ZUKYxG9ZstE6dHJ8hLpvnlVQj3l2C/qcFZscOBYk1Odd/gpb2o7YvcJYYcwXrUbqQ6uFXbwzrwTmI22yFlsvnWJuFYy/6BAhoimEH65keVwFCbHrvUsnNhs/541ngUXfdWiSpKEScj62122jJ2IFtEX5qqStU9y6ImaX+8iDXHn+g1iYHU2330a0xRnmTL+hewY9YylI7JV6dkRqdN9omr9FGi9CMONJ8xt1ugjk2nL/iYS2LMSwUp2zhf6Vvyp1L1lVyVynWhsfXe4k19XIZw3XYIPEwzDwIn3FHEujwL017Uz2EdMmZujQqCL4mqOgb0pGSpL1zor2X3ZDWiUZlqe0u9vqcccXNhCr1TiLZsHF171I+6Y/lk5GW+Tpmo1EFIF7yx5BGIvxuns+7s+rtlqa9EZmqnZKK7g//w/hgWCw/G06axI0WxFtfQZK/0IsO+8tvgCigK14XWx2fZn+2zGNevahpOn1hW7gh8rQppzVO+ZWB7QDqv1qRcmDP48QGOUv6uIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(38070700005)(86362001)(64756008)(66556008)(8676002)(66446008)(31696002)(66476007)(71200400001)(76116006)(66946007)(4326008)(5660300002)(6506007)(508600001)(8936002)(6512007)(83380400001)(26005)(91956017)(110136005)(6486002)(36756003)(31686004)(2906002)(44832011)(107886003)(186003)(2616005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R25OV05odDVMS1ZzTnUyK00wb05DTlhYcDRjbW5ZNTE1TmZ3VWt3U3hwQjY4?=
 =?utf-8?B?WnVCUDBwNGp0UEQyTXJaSThYVkJybENEV1IvREl5NHZEV0R1dWdGVytqSHZR?=
 =?utf-8?B?bGZGWDBHZmJRTTlnVWJaYjZJZnRMVUdDVTBneENvK3J0aFhvQjJzMldaZU9l?=
 =?utf-8?B?VU84eHM5dnNyVGY0L0d3SE9oUzdnV2p5aUcxWC9jR2pCRWQyUTQ3bzJvY2xs?=
 =?utf-8?B?dWIxZVBMUm9xUldpbEFEMlJVS3prTGZ5L0RxUUVZbFZTSlFBNVovQWJPa2Jn?=
 =?utf-8?B?M0dzczJPcERrd0U1TDY2U0wrWlNpMkFNR1VIMUVsRDRFMzB2aDhRZDN6OTdS?=
 =?utf-8?B?M3kvY1JHd2tGbXd6OGVKWDJnMkRINTZvNXlFRmczVFJtRDlsT2I1VWtRNC9a?=
 =?utf-8?B?QUc3aDlJMGl6TFJQODg3bUtUR1Y0Mjd2UmZETEgyTTNJQnlhODdDdVQrZGFW?=
 =?utf-8?B?amlBNC9zaE9VbDNGZDl0dE1KaXNsOWhybytnRnI2cVFZSmRKSXdZeTN2VXFC?=
 =?utf-8?B?N2MxNGhDbm90algrNU1ubWtCL20vcnB4M1dhRjFhYS9jR3IyUXRiN2l3WUQx?=
 =?utf-8?B?ZWZUZFVZVkJ5czNLM1B0K0tkNllOUmU2Y3Rnd3lnQy9Ucit4YUhOR0ZlcW9a?=
 =?utf-8?B?MUoxbXY4VTgreVVOQUhhZmVLbUUvRjdoVnhiY1VWRitWS3Rwekx3NHd0aytm?=
 =?utf-8?B?T1Rtb1E4SWxOaHhTWGJiazRJS3daalBUcW9TZmJldFZuZDIyUVhobDhFcGZK?=
 =?utf-8?B?VFl4UFpEYURLYWpPcytuMGVseWVCWWJEcUI4OENlR2tBbnUvbGNwK1NzLzIr?=
 =?utf-8?B?bGFtMHFGOU1BQVI2UGx3RmpYREZnMzBlUlVKSkpRVzFoTW1GbVViOGJFT3h2?=
 =?utf-8?B?dXpsclpVVjFtYi9wWEZZek5RRWRScFhGd09VWlZvTFVBcU42RjFXWkdvTElo?=
 =?utf-8?B?VkVLZDFLNU43QmFieU9qYStQMFcxNlA4NStBK2Z4RGU4ZkU2dVN5ZjJZNWZ5?=
 =?utf-8?B?ejlaY2FaVGtsdk9JTUpqZENocmdqV1l3VGVyVTc4KzA0bXVNaHV6VHlkZ1dM?=
 =?utf-8?B?TFpTTXgrTGJIZTQ1QnFkN3M0cmwzRit4eS94aktDSndqWVcwNVNJU0U1MFEz?=
 =?utf-8?B?YVhyNDlHVmtoYWhwcE9acm11NGpSTFlGVzlHTHZ1WFVvSWlRT09mYXJmVEF4?=
 =?utf-8?B?SlRUZHpXZm5DSi84SEdydGc2aytSazB5UDBFdkgwbStwNDIyRkg1bDR6d3lN?=
 =?utf-8?B?WmhLTjc2eHh2NE1SejBnaVgvMDRPMUdmMEJUc2ZFTFBvMFBuWUJYa09hU0Q5?=
 =?utf-8?B?ME1EYVZDSmN5RjcxNzFRWTV5aW5xOHROWXdsZWVMSzdKczZtZEEyVnJyVHRh?=
 =?utf-8?B?V2djTVBObDY4MDdVSGtaTXBwVVhpVmNZZWxpcXhrTXZGSnNIRC9HUG5ib0ZX?=
 =?utf-8?B?bHdCVDBPZjBvd3VPWW9HRVVBcE1xeG9DNGZFZEIvOGM5TnNXVUNGZ0Z6byt6?=
 =?utf-8?B?RU80L2V6T3pITExRaUIwVkJ5cHlub1JCQncyWUhKVkRDTDdmSzc3bm54cVdv?=
 =?utf-8?B?eldIemZxK20xaCt3Wlp0TDdYR1dmNTY3NWVEMFpnVHFUTHluRjN3aHh6VytL?=
 =?utf-8?B?U2lpaWxaTVdNcWNJK2Nrb0hCcWxRbUJ4U1MySWh2UGpHS2QwamY3RlhTbGpH?=
 =?utf-8?B?M2NZTVd3WmUrbmkrazJITkVDYlptTHQzOGtFcW4ydUNBM0FUV1dOUTVrejB1?=
 =?utf-8?B?QWxEWUlGUUFRVVFPYmcxZXh5Vk1HVlRFS1FFSEF1eEhJVy9zN0ZMaDhIZ3kv?=
 =?utf-8?B?c282TXdkbklFdGZmdjY2c0xVRmJQNUJGVXdkSjlIYjlVWFFVbGQySXpGSHRs?=
 =?utf-8?B?UTdiQ1AxK2hZM2l3Umw0aUU5U1MzL0I2aTJoVzFSZjB3VWp3VUU0dkIrQUR0?=
 =?utf-8?B?NlVXV0lQZGR6NjdFOEF5bFZURlIyL3dIenpsY3RqOTBWUDk0a2VmTHFzR2VW?=
 =?utf-8?B?czFwajZoREw2a1g1SmQrWkpKRUswU094UEdsVzNROUpxVnlBZXdsMDhXYzZ6?=
 =?utf-8?B?dU15UHpOY0RmS0hkMnJPMW1GQ2llSnEvWUh5Tm5kVHIxKzhnUG9oN0U3d21l?=
 =?utf-8?B?UWlqbTZiczlvYjdYYXNIYWdMSC9rNEpidVRUdDR3NGd5WXFLNHI5RGxocjBV?=
 =?utf-8?B?YTJCU2pXRlRobFZHd012elJkS3lnQlQ0L2o4NUR6WmNoeitrWkZQa0FGczBR?=
 =?utf-8?Q?2lWrFUL05WpknPFUqufa32PfrdimEQURzT8thS7n+0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9359B8B8CB319140A1A05F9AC7D1A972@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: abe185d7-ae70-4aab-ea0f-08d9e67422df
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 17:47:52.4536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKEM07gARnz00tsMOgIceg88rH/LOpqzkPln++A/gpISet1yzmC0wVIesPdJPuyK5TY8v09Eg1BdGv0EAGU2DsPXxBBsWHPCE8aeOoODLxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2540
Cc: TRINH-THAI Florent <florent.trinh-thai@csgroup.eu>
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

SGksDQoNCkkgc2VlIHRoYXQgdGhlIEFMU0EgTG9vcCBkcml2ZXIgc3VwcG9ydHMgb25seSB0aGUg
Zm9sbG93aW5nIGZvcm1hdHM6DQoNCgkuZm9ybWF0cyA9CShTTkRSVl9QQ01fRk1UQklUX1MxNl9M
RSB8IFNORFJWX1BDTV9GTVRCSVRfUzE2X0JFIHwNCgkJCSBTTkRSVl9QQ01fRk1UQklUX1MyNF9M
RSB8IFNORFJWX1BDTV9GTVRCSVRfUzI0X0JFIHwNCgkJCSBTTkRSVl9QQ01fRk1UQklUX1MyNF8z
TEUgfCBTTkRSVl9QQ01fRk1UQklUX1MyNF8zQkUgfA0KCQkJIFNORFJWX1BDTV9GTVRCSVRfUzMy
X0xFIHwgU05EUlZfUENNX0ZNVEJJVF9TMzJfQkUgfA0KCQkJIFNORFJWX1BDTV9GTVRCSVRfRkxP
QVRfTEUgfCBTTkRSVl9QQ01fRk1UQklUX0ZMT0FUX0JFKSwNCg0KDQpJJ2QgbGlrZSB0byBoYXZl
IExvb3BiYWNrIHNlcnZpY2Ugd2l0aCBBX0xBVyBmb3JtYXQsIEkgdGhvdWdoIGl0IHdvdWxkIA0K
anVzdCByZXF1aXJlIHRvIGFkZCBTTkRSVl9QQ01fRk1UQklUX0FfTEFXIHRvIHRoZSBmb3JtYXQg
YWJvdmUgYXMgdGhlIA0KTG9vcGJhY2sgZHJpdmVyIGp1c3QgbG9vcHMgdGhlIHNhbXBsZXMuDQoN
CkJ1dCBpdCBkb2Vzbid0IHdvcmssIEkgc3RpbGwgZ2V0IG9ubHkgdGhlIGZvbGxvd2luZyBmb3Jt
YXRzOg0KDQpBTFNBIEVSUk9SIGh3X3BhcmFtczogc2V0IChGT1JNQVQpDQogICAgICAgICAgICB2
YWx1ZSA9IEFfTEFXIDogSW52YWxpZCBhcmd1bWVudA0KQUNDRVNTOiAgUldfSU5URVJMRUFWRUQN
CkZPUk1BVDogIFMxNl9MRSBTMTZfQkUgUzI0X0xFIFMzMl9MRSBTMzJfQkUgUzI0XzNMRQ0KU1VC
Rk9STUFUOiAgU1REDQpTQU1QTEVfQklUUzogWzE2IDMyXQ0KRlJBTUVfQklUUzogWzE2IDEwMjRd
DQpDSEFOTkVMUzogWzEgMzJdDQpSQVRFOiBbODAwMCAxOTIwMDBdDQpQRVJJT0RfVElNRTogKDUg
NjU1MzYwMDBdDQpQRVJJT0RfU0laRTogWzEgNTI0Mjg4XQ0KUEVSSU9EX0JZVEVTOiBbMiA2NzEw
ODg2NF0NClBFUklPRFM6IFsxIDEwMjRdDQpCVUZGRVJfVElNRTogKDUgMTMxMDcyMDAwXQ0KQlVG
RkVSX1NJWkU6IFsxIDEwNDg1NzZdDQpCVUZGRVJfQllURVM6IFsyIDEzNDIxNzcyOF0NClRJQ0tf
VElNRTogQUxMDQpBTFNBIGxpYiBwY20uYzo4NjQ0OihzbmRfcGNtX3NldF9wYXJhbXMpIFNhbXBs
ZSBmb3JtYXQgbm90IGF2YWlsYWJsZSBmb3IgDQpDQVBUVVJFOiBJbnZhbGlkIGFyZ3VtZW50DQoN
Cg0KV2hhdCBhbSBJIG1pc3NpbmcsIHdoYXQgbmVlZHMgdG8gYmUgYWRkZWQgdG8gdGhlIExvb3Ag
ZHJpdmVyIHRvIHN1cHBvcnQgDQpBX0xBVyBmb3JtYXQgPw0KDQpUaGFua3MgZm9yIHlvdXIgaGVs
cA0KQ2hyaXN0b3BoZQ==
