Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE8213904
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 13:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169D416D2;
	Fri,  3 Jul 2020 13:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169D416D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593774083;
	bh=YSJFZ7kt6Lz2qhQcV++BPvkxktEmy0dScPhCGRMhXK8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ba+hFjn1+6UKO2S5joCcEJ0ATG0si8caCnlFlhU2rp9vB/IRLRd1kQojmkmTKl0Dn
	 nga3+aaOOXclJ6kTZeyVK6WA7mLDYU54vHDk+oaxNQUzcwImiZIbm9NtcD4K3/IF2x
	 d9aaSuEbNWfxRJTXfDor0MWUuuHxRfvZgZpWgUWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09E2AF8021D;
	Fri,  3 Jul 2020 12:59:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E423F80217; Fri,  3 Jul 2020 12:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E196F800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 12:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E196F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=LenovoBeijing.onmicrosoft.com
 header.i=@LenovoBeijing.onmicrosoft.com header.b="eafOJD7X"
Received: from [100.112.128.227] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.us-west-2.aws.symcld.net id E4/58-25315-39F0FFE5;
 Fri, 03 Jul 2020 10:59:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTf0wTZxzG+/au14P14CgoL13qQtUNkXa0Dnc
 sbiHZjJ1CtsTAH4boDqi0SX+tVyawZCkMQxX5IQKRMlbHryFDQTZjLQwFcZssqBBNyBYdhCKj
 gDpwMIlr1+tVt/33ed7nuef7fZP3cETsxyS4ptCqsRhpvQwLR/M3eVH5qUj/weSHdxHqzvgwn
 2qYU1DuX2sA5fNcQyhfRQdGda5NoNQxd7WA6l07B6j68fS0MHXvSimmXrY/EqgdtkpMfdlxT6
 geXOrA1DNL3wrVPd/dRT8UHhDojDmmwo8E2vW1WWA+KyqcG1/FbKBOdByE42LSxocXGzoxTsw
 D2N5WjnLCD+DT1VqEE+sAtoyUBAUg2xH4pO8h4MQPKDwx6BFwohfAivWVoIOS/QicdNUKuYJG
 PlzsPRWqvg9g2fJqwAnDMTIBOpsag0YMWQugrbwvKBByBsCuySnApqJJPWxevSRgOYY0QPu94
 0KOVbC6fy7AeGDgFuj+KYk9Jshs+Nv9WsBNawXwrOt6sCeM3AV7qgdQlgG5Ea6NdvNZRshY+I
 vHGWRIkrBt4BbC8QY4P+ML3c4O4PIXj0OheDg7fV3IsRROOCsAxxnwm3pv6OMkuLC4LuDYBOs
 eXAjxq3By0R7KbIJdldNoDVA5/rOHI3AfhNwGe9yvc8fxsK5iWugI3i0K3mj0oGcA2gXezLHo
 8rVWA63Ty5XJyXKlUiVXqlLlKckKulhOKwoY+RENY5WrFPQRRsEUGXL1eQqjxtoHAi8vz1yic
 oG/Fx4rhkEczpdtIE4T/oPiiBxTXpGWZrSHLAV6DTMMEnCcvDM00gQkqNFk1MggsSIK5KIsmn
 xN4WGdPvCWn0chLpLFECa2hmDMtIHR5XPWKNiB18w3tyD4SHN7CyIONkliiWNslGSj2gLji6L
 n/8UEkEqiCcDj8cQis8Zi0Fn/73tBLA5k0YSWbRHpjNYX87yBVfiBVfa+4mNXsdL/WhIb/+04
 e5qlHrWXvKwUnTi5k7iqt51OrWn+erNe5FjgOZd+fN8r8fEn363qiPQ5L3d+dkX6VntWuZLIn
 b/qq8Jmv8odImMuxgxmmFMSl307w/vd2cl+54GfXZEjU08Mik+HaybTb9z+Mt3u2hG1pSxt10
 B2luDkG3+1JsV5G/cV9EfYusePeqiGj7Frf7wm3Di2Nb5l737pbnpRu/VpcVPlmZTSbN6jcWV
 s9+8RVTljpdsvTCVsO/xeZidZH31T1rMs2GP6/FCGGIyqsdJLY1m3nomPlknaphJSz0+8czsz
 se1KUf2f0vOtVZ3f73/pwfYhGxpZ/IFa+ywroeTmOaryk9TM3WYZymhpZSJiYeh/AFF91YSSB
 AAA
X-Env-Sender: mpearson@lenovo.com
X-Msg-Ref: server-15.tower-336.messagelabs.com!1593773968!47502!1
X-Originating-IP: [103.30.234.4]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18809 invoked from network); 3 Jul 2020 10:59:30 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.4)
 by server-15.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jul 2020 10:59:30 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 02F9FAE18A4EE5386C97;
 Fri,  3 Jul 2020 18:59:28 +0800 (CST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Fri, 3 Jul 2020 19:00:09 +0800
Received: from HKEXEDGE02.lenovo.com (10.128.62.72) by HKGWPEMAIL04.lenovo.com
 (10.128.3.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5 via Frontend
 Transport; Fri, 3 Jul 2020 19:00:09 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.51)
 by mail.lenovo.com (10.128.62.72) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Fri, 3 Jul 2020
 19:00:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qbz7886SdwZDdNYIkwaJiAxhPDir0V6Zx1c3+hl6Kx0fQlkqPI+jePgl9qlkHQ3zFQ3U+aFmAZg/IxYpWw6L1RLSyD43d4Gya6dH0Zuu8x/rbS1MyQvEarUiy8PcxzlATaE5dDfTdDnMxRE7MAZvZvlvIC0p5nauQFogh74S+vKcnTZJV+VBmiLikmYopCaJPjbY6UhTFlxMKOK0Vet/yPEs1r02xJvs/gcLBXlLl6ZKN6g+kgMRd44sBmBhariIpRGs63B2xNM/Geje15shtnIkrqfaR5/GyYDRvwaaqVVx36HJQJ7s/lLj3LbEfDdEGDY5iodQJFJ/esyACqz+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSJFZ7kt6Lz2qhQcV++BPvkxktEmy0dScPhCGRMhXK8=;
 b=Ovrmt7rCJoJVvc87HVj4Dj8LOVnrP/f7iYLpBRbxqlq8uSXvCxZtq88yRuQEX3WMvhfziBsc9HMsV4uk9emszxDtOyu/St9EnF2HY2TaLTMKRmXwRfXrW53JmNago5tqo1U7kZKwnc/jM5o3g45TrkUHRfgUxNRH22atCLElj6z+iiaYrdoFBcL0dVNjtl9W+/G67rFD14sU2v2fZjmfmbn/KWgz27kdD1/O/phTBadrs+E4EworDdfSmLuUwY3cYEw2wMrbYF5h4f/TWQOQT6lg+IuVe4wma/FGjnW5gaGgL5R/7fp6OC/Q95u8O/WwkFJBrlI1KH8I0cC80blvkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSJFZ7kt6Lz2qhQcV++BPvkxktEmy0dScPhCGRMhXK8=;
 b=eafOJD7XEx9876pzi9eBxf1yAzd7DP1MOafKYIh3gSilXjS1+YeyZL50CxcUwU36aIBXlt/PNAgJ6yuakv+My9oRD5HvEkXjVht4SViKKbOlgqurNFHj6gzld+Zwb4yi+lHZhXe0yqODkVCdhT83nxErbwBnxiIQWXBOmQj5t3w=
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com (2603:1096:4:19::12) by
 SG2PR0302MB2477.apcprd03.prod.outlook.com (2603:1096:3:c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.12; Fri, 3 Jul 2020 10:59:26 +0000
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3c41:2202:7bbe:8717]) by SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3c41:2202:7bbe:8717%6]) with mapi id 15.20.3153.028; Fri, 3 Jul 2020
 10:59:26 +0000
From: Mark Pearson <mpearson@lenovo.com>
To: Jaroslav Kysela <perex@perex.cz>, Benjamin Poirier
 <benjamin.poirier@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [External] Re: [PATCH v2 2/2] ALSA: hda/realtek - Replace Lenovo
 Thinkpad X1 Carbon 7th quirk
Thread-Topic: [External]  Re: [PATCH v2 2/2] ALSA: hda/realtek - Replace
 Lenovo Thinkpad X1 Carbon 7th quirk
Thread-Index: AQHWUSXExNBSyYzG8EejeoLkHWIQK6j1rtDA
Date: Fri, 3 Jul 2020 10:59:26 +0000
Message-ID: <SG2PR03MB3324D74B5A539F69DBDDE0F5BD6A0@SG2PR03MB3324.apcprd03.prod.outlook.com>
References: <20200703080005.8942-1-benjamin.poirier@gmail.com>
 <20200703080005.8942-3-benjamin.poirier@gmail.com>
 <58a7791c-0db4-a585-c550-3d3e9576191c@perex.cz>
In-Reply-To: <58a7791c-0db4-a585-c550-3d3e9576191c@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [69.158.79.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf9b52ce-5117-4167-5957-08d81f40270a
x-ms-traffictypediagnostic: SG2PR0302MB2477:
x-microsoft-antispam-prvs: <SG2PR0302MB247704D8E19E0BCB6AA549ECBD6A0@SG2PR0302MB2477.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: omQScpmzl0uhFMH9T5fNYJih7q5gHbXhBQFK6fjlBBioa7m0fxhkaU/rfudlgn7W1I5CEfd1IgpEiGZtUvWDwISI7kW/I7iEfnee26sVgTG+sT40acUVXiGQvPDOFkVW5w+W+wriTygNFQvEbx0egQxY3go0LdlGZ+ADY62ztU/QgoS7HJAcjTQH6OQyUGb5NApCRN7b2y/8EVurqrLrmcxebTrhNA57lzlMWyfbhec2dkwceFOBX0oxCw4Ag98d1+CbNFQT5BYbe2IDCexGGt5dv7FNKUTFXDIlNmnYl455zj3AdaIDG0JpTgZvXJj7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB3324.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(366004)(39860400002)(136003)(396003)(86362001)(316002)(54906003)(110136005)(33656002)(83380400001)(478600001)(64756008)(66446008)(66556008)(71200400001)(8936002)(66476007)(66946007)(5660300002)(76116006)(9686003)(186003)(26005)(8676002)(55016002)(2906002)(4326008)(6506007)(7696005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ME3Nf2QabxhoYt17M8d3i+6yp6Bdya+DeplbGXYKQEbgt0emM765DtNBenjjDDUE6VLF+G/Ehh6zKJfoulLXu/fDT5eUoD+gHI0CNpJa/qnk1KyqcO/o801JBs2DD7H2aTOV+c27WgrFuDzSSkUIQX/5LmtS2mOGZEl/iz4HDRFeOELtovZ2BJJtX/P7VPZN8W1lAeIDc6oDB1G9RZUmVLeb3hhh6V68whkVDQ8AfkpXS4ZC85vkXgfsiSsg0N5yJqAFOklxixnx0CjG5/bUL4qCxTw+DnG7QwVTBzOx/FI+B2oT0ijfkEDDQMGqgRPWo5+2NTJwkcAYKkAwF7ZvPxxaqjQwhORZsa3wmNkyq3rZfQdyIEnA8c17gU5EK3t0dV213aLjmGyvysCfjcxVmBvfmxE313Efdq1pMqtd4jYObojKVholxBja6vDsgB0P4W+HGhRm4h44pYDeyVyodBkqO35dSneNM/QuRShRIXckZ3l80lH2yjo5Qg9Qj9rJ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB3324.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9b52ce-5117-4167-5957-08d81f40270a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 10:59:26.3947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gt2Qf+aX1q+mpEXFzKcl8DD6d9vqYHn68vabsYKIPWJg4IstsMd5Nk3raMt9+z01Cf7v+W7tDFr+pr1aKZbKpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR0302MB2477
X-OriginatorOrg: lenovo.com
Cc: Kailang Yang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.com>, Hui
 Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vincent Bernat <vincent@bernat.ch>, Even Brenden <evenbrenden@gmail.com>
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsc2EtZGV2ZWwgPGFsc2Et
ZGV2ZWwtYm91bmNlc0BhbHNhLXByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gSmFyb3NsYXYg
S3lzZWxhDQo+IFNlbnQ6IEZyaWRheSwgSnVseSAzLCAyMDIwIDY6MzQgQU0NCj4gDQo+IERuZSAw
My4gMDcuIDIwIHYgMTA6MDAgQmVuamFtaW4gUG9pcmllciBuYXBzYWwoYSk6DQo+ID4gQXMgYSBy
ZXN1bHQgb2YgY29tbWl0IGQyY2Q3OTVjNGVjZSAoIkFMU0E6IGhkYSAtIGZpeHVwIGZvciB0aGUg
YmFzcw0KPiA+IHNwZWFrZXIgb24gTGVub3ZvIENhcmJvbiBYMSA3dGggZ2VuIiksIHRoZSBzb3Vu
ZCBvdXRwdXQgbGV2ZWwgb24gbXkgbWFjaGluZSwgYW4NCj4gPiBYMSBDYXJib24gN3RoIGdlbiwg
d2FzIHJlZHVjZWQgdG8gfjY1JSBvZiBpdHMgcHJldmlvdXMgbGV2ZWwgd2hlbiBwbGF5aW5nDQo+
ID4gY2VydGFpbiBzb3VuZHMuIFsxXQ0KPiA+DQo8c25pcD4NCj4gDQo+IFRoYW5rIHlvdSBmb3Ig
dGhpcyB3b3JrLiBQZXJoYXBzLCBUYWthc2hpIHdpbGwgaGF2ZSBzb21lIGNvbW1lbnRzIHRvDQo+
IGltcHJvdmUgdGhpcyBxdWlyay4NClNlY29uZGVkIC0gdGhhbmsgeW91IQ0KDQo8c25pcD4NCj4g
DQo+ID4gSXQgaXMgcG9zc2libGUgdGhhdCB0aGUgWDEgQ2FyYm9uIDh0aCBnZW4gd291bGQgYmVu
ZWZpdCBmcm9tIHRoZSBzYW1lDQo+ID4gY2hhbmdlcyBidXQgSSBkb24ndCBoYXZlIGEgZGV2aWNl
IHRvIHRlc3QgdGhhdC4gRml4dXBzIGFyZSByZW9yZGVyZWQgc28NCj4gPiB0aGF0IHRoZSBkZXZp
Y2VzIGZvciA3dGggJiA4dGggZ2VuIGNhbiBzaGFyZSB0aGUgc2FtZSBjaGFpbiBhZnRlciB0aGUg
Zmlyc3QNCj4gPiBmaXh1cC4gVGhlIHJlc3VsdGluZyBjaGFpbiBpczoNCj4gDQo+IDh0aCBnZW4g
aGFyZHdhcmUgc2hvdWxkIGJlIHNpbWlsYXIsIHNvIHRoZSBuZXcgZml4dXAgc2hvdWxkIGJlIGFw
cGxpZWQgdG8gdGhpcw0KPiBodywgdG9vLg0KPiANCldlJ2xsIGRvIHNvbWUgdGVzdGluZyBoZXJl
IGFuZCBjb25maXJtIHRoZSBmaXhlcyBvbiB0aGUgWDFDNyBhbmQgWDFDOCAoYW5kIFlvZ2EpDQoN
CkRvIGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueSBkZXRhaWxzIExlbm92byBjYW4gcHJvdmlk
ZSB0aGF0IHdvdWxkIGhlbHANCg0KTWFyaw0K
