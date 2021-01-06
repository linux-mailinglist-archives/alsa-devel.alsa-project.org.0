Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D971D2EC231
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 18:29:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616F81681;
	Wed,  6 Jan 2021 18:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616F81681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609954168;
	bh=O7euKb6/xtsoxg41MBsHbmvmopD3At4XS9g77oW1Ngg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RwcFTCk8IBJGJFdY09m33ePs8GUTlqVYgde97PX1AE2PL5BhZnUJs7LAmX6oEZF2Y
	 L0cqJl8W7pna1+iDpWdOQ2YalxqkC50VXDn9XomxObGkbQbZ+3t2sUtX9tBBBkp4JH
	 gyc0K5gD8MAaUtwmI6/Fln9h8ubFzUbTGhoXYtQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 569A5F80167;
	Wed,  6 Jan 2021 18:27:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A21E2F80166; Wed,  6 Jan 2021 18:27:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE353F800E3
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 18:27:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE353F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="UVM9i5VP"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="nZFvzbnc"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1609954067; x=1641490067;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=O7euKb6/xtsoxg41MBsHbmvmopD3At4XS9g77oW1Ngg=;
 b=UVM9i5VPh5Wrko5tDc1xMwesj4LzFaAKHbZjg2SyDM6ILlN+ueqPiPJd
 W9GRkdNukGwNxu3elakOCNHBK+sNG9Gpm8Wz3dleDV7ZXv5w5bmi4oXyO
 YBoDvszxVRmnCYRzeCPinBOr/kmj+ik13mDtMZQHNqV6GBq9VUPm7I1kr
 Uim4Zumi6Be7o7C3IYl2rhaF87Yh/pkdAqcJUEoLa+rsvMh2XO77RHPai
 i+r0R5GnTbqB1/hIjfqnI9VhJQPsiLwrxcIdO8016dak9WxvZmGX9y/m1
 YFCOshte74Hli6pdqRF10VkXM1LmNzvu9qkw61a/zvTeDFKGbNC90KhqZ w==;
IronPort-SDR: AuQDJN3mATO2CQHJ4qo3o3y3Nbl65TH55mFCg4LnfEeHfcry7X1/WxLTINB7oY8y3CBqvAQB/F
 1rHugFeBnU4TOHD8pQeEgKsmdGvIyHcrmQfH+tK3GkvWQBxHVo0x2CxRZ3HOHAOdQfibHFXIid
 nBjfeJjYvu6K+lc+CJ8SyTgqx/Ix+eSMMd5PC/rB9zLgm720GC5Ticlawj+xZIuCIK5IwAuAW9
 bVIJdM8Ijsw+6qshasGjWyH0m6uHldbzo8r8YX67EbK//AXsbUZCCU6CA2i2wti75cDuHgNlci
 Z1U=
X-IronPort-AV: E=Sophos;i="5.79,327,1602572400"; d="scan'208";a="101980515"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Jan 2021 10:27:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 6 Jan 2021 10:27:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 6 Jan 2021 10:27:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjOQJhutitTG4gP4owkrZ8CAe4NrXkMWJvBbkz+ZOPCn96j67WNwg1hQn23KJmIPKE2KIb7KOeRz56qQ9yVp1RfiYpuLJ+O0KoZeGahUmBDSv0lIp84wO1dn4uTyOnCbFi2B3ohJP/zrHQyWw3imcrpTbKRSf7UQV6uew90uHITdhaWMyWCKWVv5Q2EFjkljogkQOZVphPw1LwSeUAv8lwaXBhECsFeBvN3EmU7RkRX2j7oMpwsKe7pHOrTxWtgBkeBJQsDvdTdy/bG9DfsPvaYxmUGu2DzimKSixzOVF8DMalrbvjbJ0jccMmmadaKn6eGrypW9rqMMtYxdpLGwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7euKb6/xtsoxg41MBsHbmvmopD3At4XS9g77oW1Ngg=;
 b=CVjRGRr59EAkEoPn2TttS2LgG0+u1+fQ2pKV6TDQ7iG+WM75lS74oBJ5joZUqqqKhOsfBUKllDs865ZH2WE9sWGk8FkCZNkKMpBkw7Vq4rZOCu29MNQ/uONpmXKMZaIlKYpxfIlrZF5GjjS92hzaF6djbe9Ti0IxkfIAmzHAsbyTSNSiiCF+kmbJq3nS3/egJ6FccPs4P6ooKFe+aCTEHV4RDJ3lpv8no4FdPf0H19RCyXT4g3OGKnBZpk4Zr0rvCqg61gLG/4Xqu5ooCPPAu4N2870kayGgv3FGeSfyP1ohfr1dpp20P5czr2S+OT6yS6wVy0Ok5CUP4TXb7D5UMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7euKb6/xtsoxg41MBsHbmvmopD3At4XS9g77oW1Ngg=;
 b=nZFvzbncYOqKjva12LSZWJfIURxErd4HgNTgWEwQFzf5BqUj1QBEvnMXpzyHj2sOCa/cJpEA+YH3hJCvESgRwFNijmTVG1IGkMT+qDH440Vb3JSzPVnJDX+8KIsS24GdXuYpG9i/x41A8paKtWGtkXiFIYzkYFnNJ20oeFzip2Y=
Received: from DM6PR11MB3260.namprd11.prod.outlook.com (2603:10b6:5:b::30) by
 DM5PR11MB2027.namprd11.prod.outlook.com (2603:10b6:3:a::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20; Wed, 6 Jan 2021 17:27:39 +0000
Received: from DM6PR11MB3260.namprd11.prod.outlook.com
 ([fe80::5cf9:cc0d:a11d:3154]) by DM6PR11MB3260.namprd11.prod.outlook.com
 ([fe80::5cf9:cc0d:a11d:3154%5]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 17:27:39 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <lars@metafoo.de>, <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: atmel-pdc: Use managed DMA buffer allocation
Thread-Topic: [PATCH 1/3] ASoC: atmel-pdc: Use managed DMA buffer allocation
Thread-Index: AQHW5DEQu2tBjFr7Ek6mJL1hSHHe86oa2hIA
Date: Wed, 6 Jan 2021 17:27:39 +0000
Message-ID: <57729e02-d4db-0851-9c9d-ae764a69924b@microchip.com>
References: <20210106133650.13509-1-lars@metafoo.de>
In-Reply-To: <20210106133650.13509-1-lars@metafoo.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
authentication-results: metafoo.de; dkim=none (message not signed)
 header.d=none;metafoo.de; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [188.27.102.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0076182c-dcd1-4009-900d-08d8b2685dde
x-ms-traffictypediagnostic: DM5PR11MB2027:
x-microsoft-antispam-prvs: <DM5PR11MB20271E3521022C4CFE9E5269E7D00@DM5PR11MB2027.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h3u8O9xcWSgWYG+diQENoycCGYnUC0ymSmalf7lGX6q/2Lzd75UyLFfWsMpChnwrA1hMrJPwLsGtmKpncLq8qpL2UXm5w8PG/lpEyQvSiQVtYlJMwEIewAp1cs083r+B8SYC34mfhEh7DeC0iueMVsZGZrK7tmb7TD7bLh1/ySKmSD4qgZ4OWuYbfjYB0vALA/Tail34qb4KNhz7Ez1xhlDHKhxi3xtEcqOkfE/QVqjso82Xm1qP0EejhCfAri3uDBujHJErBwBaB/4JrpzKVL9dccDaQEa5wVBsB9u5QjRq4n2oIvJr9W9Rh6tUUcFkQrIe1nKkt4RrLpimH/oOpk9Xiuh3LISOEaW+2oUdcSkhDgGBGD2h8hr7kEFPLYMdDdgPXTzavsyDkzAkvATJySHhLctNKP+6obXdsfE/DKKCgA5MXSHXwhnRrOV5onwsDON9txGpJufmhrS1l9HBK2OK+T/Ibt0uopBhHZKBx18=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(39860400002)(366004)(376002)(136003)(86362001)(8676002)(186003)(316002)(4744005)(66446008)(8936002)(71200400001)(6506007)(36756003)(54906003)(6512007)(2906002)(478600001)(53546011)(2616005)(6486002)(110136005)(31696002)(4326008)(66476007)(76116006)(5660300002)(31686004)(91956017)(26005)(66946007)(64756008)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eUFQUnM2cDRIYWpyekN0cllqR0pYZzFZaGJ0TXJCMHQ3RDJiWTlQaWRwSldj?=
 =?utf-8?B?VEQvNkxBVGdxdnJSaUxESk9rMmVvMHRYQ3k1LzFYZjBjT0pVTFJBTnFkdkpz?=
 =?utf-8?B?dUJON2RXVkpLYXVMRExJZjZZZUxmK082UXNGWUsvSzNabmFiVGt6R1dpVlRG?=
 =?utf-8?B?TDMzbTgrbzJJT29JQVg1WEZScHdxbUhFOG1HUzZ1TlVMU00rSFNlL1RJU3Nu?=
 =?utf-8?B?MC9KaXVjRFlYQWZES3BuSWN2SGNZU2F5Rm9SWDA1MzJ4Qm9DZENXOGd1ckJX?=
 =?utf-8?B?ZUhsc0hqZDlWOTV6WWJhdDB5cHhqUGFIcDdjUHZzZ09YbERHVjR2M1dWT3I2?=
 =?utf-8?B?U29tN0JqYVNLS0I3YjBGSGdQZTVvbGZEYmlyRSt3czRHZWk0c0NxSXhQOVNh?=
 =?utf-8?B?V1A4cjNrVFlJU1U0dUJYVE9sS0dVVUVERytUVmhreU5CMjZLamxoVjF4VURQ?=
 =?utf-8?B?bTZ4d29pdWVxYnNBNVA3RjNmcnl6K0JYaGJVdVZ3LzdudzZOYzZsSFJqcmdU?=
 =?utf-8?B?SldiZFJ2Zjd5d3FRd2I2VHpwdGJ6U1N1a2F5NzE3SC9adGlIQm4wOUhkdTZw?=
 =?utf-8?B?czNVdjZzWXlkS0dHeGtFVE1aVENITHlmSjU1RnVsTVNGRXJQOEZQMTVvVFNh?=
 =?utf-8?B?ZWRKclU4MzU3K2t4VnRrUGt4RWpwbS9rQlVTVFozVVVtK1dnK1JqUjUxTFV4?=
 =?utf-8?B?b0c4TUphSjVDUDY0TWlkam4zRWtLdjB5K0M4ZWF3bVdTUGJtSUIwc2VPQzNh?=
 =?utf-8?B?SXFyWmdsMHZ4OUdiRnZCUmkyNExKcDBYMHZMNmREbnRJQVh0Rk16NHF3MGVH?=
 =?utf-8?B?aVF1dk5TUm5nQTJ6Si8zcTdnbDlhWUF2WERzMjVYS2dXNnJ3YlVTc3pDdTZy?=
 =?utf-8?B?OFdmSGFWOGtPWFJYVVAvNVpqMHk0S0VaazdEcm94ZlFDQmdKTVZlK2VDV1FO?=
 =?utf-8?B?R202dHMxZFRJNDNEMjBYZ1hSU0NmeTFwKzNtcGk0bklpY3FtVVhScjllRU8z?=
 =?utf-8?B?aWdpVEVoekVYck5CUFdydjZoY3kwOHlJZm9TbzFrTS80WkY0TUtoWTF6Ny9x?=
 =?utf-8?B?dnIwTmhPbVdmU0drYk1ST2hoWmdObVRTd3R2YTZDcEtCSHFYdE94QlhTd0VX?=
 =?utf-8?B?YXVCaFNSSXNOUGJqalpwU2hXbVRhbW9CeHczS3hrUFQ0Q3NBbXJ0Ykh6ZE1w?=
 =?utf-8?B?UGlpYTRWNS9qUU9ZcnpVNktrdTUxbTVtWTZsTUdNdUxCNGpXU1V5bHJwc0JG?=
 =?utf-8?B?SWl4NThQUFU4eVpJdUFvS2wyYWtIS1VOV1lGRE5tTUU3bU1NZ0VUZzdjUUU1?=
 =?utf-8?Q?juHF9qMritc4k=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9E47C9AD8113D49A08A446F32FF390E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0076182c-dcd1-4009-900d-08d8b2685dde
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 17:27:39.2945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2fLpQKEgJsnDXMjIUU6FOOW/1icJKd7VgIT6cz/sNhvaZeFybkPV4yHoMwpvwZWg80J+UxKpW4mWZWuNxzQRE4ZGlLt6y4Fo8G0KOX1pa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2027
Cc: rjui@broadcom.com, rmk+kernel@armlinux.org.uk, alsa-devel@alsa-project.org,
 sbranden@broadcom.com, ssimran@broadcom.com
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

T24gMDYuMDEuMjAyMSAxNTozNiwgTGFycy1QZXRlciBDbGF1c2VuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEluc3RlYWQgb2YgbWFudWFsbHkgbWFu
YWdpbmcgaXRzIERNQSBidWZmZXJzIHVzaW5nDQo+IGRtYV97YWxsb2MsZnJlZX1fY29oZXJlbnQo
KSBsZXRzIHRoZSBzb3VuZCBjb3JlIHRha2UgY2FyZSBvZiB0aGlzIHVzaW5nDQo+IG1hbmFnZWQg
YnVmZmVycy4NCj4gDQo+IE9uIG9uZSBoYW5kIHRoaXMgcmVkdWNlcyB0aGUgYW1vdW50IG9mIGJv
aWxlciBwbGF0ZSBjb2RlLCBidXQgdGhlIG1haW4NCj4gbW90aXZhdGlvbiBmb3IgdGhlIGNoYW5n
ZSBpcyB0byB1c2UgdGhlIHNoYXJlZCBjb2RlIHdoZXJlIHBvc3NpYmxlLiBUaGlzDQo+IG1ha2Vz
IGl0IGVhc2llciB0byBhcmd1ZSBhYm91dCBjb3JyZWN0bmVzcyBhbmQgdGhhdCB0aGUgY29kZSBk
b2VzIG5vdA0KPiBjb250YWluIHN1YnRsZSBidWdzIGxpa2UgZGF0YSBsZWFrYWdlIG9yIHNpbWls
YXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYXJzLVBldGVyIENsYXVzZW4gPGxhcnNAbWV0YWZv
by5kZT4NCg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJp
dUBtaWNyb2NoaXAuY29tPg0KDQpUaGFua3MhDQo=
