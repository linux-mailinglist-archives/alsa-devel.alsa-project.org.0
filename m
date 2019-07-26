Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EAF760EE
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 10:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 137FA1FFA;
	Fri, 26 Jul 2019 10:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 137FA1FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564130134;
	bh=78Aq0X17jqDO52B8pxSa6OOzmkOGJzqPhLzoXx6+gdk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kl4XVZXF1+YoiOzM3fpyPqySRxK1V1LT0Jeth52CeLttVlX+Kc2G0arO62GkItGrW
	 YH4ZP86pVlp2rJaasra/GA5F7n0r4FLcd8ABzRMpFFwPOgLIjSoCBAvfgNHQrfmdPo
	 0W8thagFcSLSTZWQO9X/6H7J8Xm1dzj/ctd1q/f8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65471F80393;
	Fri, 26 Jul 2019 10:33:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DFC5F80393; Fri, 26 Jul 2019 10:33:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CF89F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 10:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF89F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com
 header.b="EPWqIOfw"; 
 dkim=pass (1024-bit key) header.d=cadence.com header.i=@cadence.com
 header.b="l32j+0ZU"
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6Q8TXV1031340; Fri, 26 Jul 2019 01:33:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=Xmzl2AV+FynxVm26H1pEXIhXDVu9sSAmuDmqycIeO6I=;
 b=EPWqIOfwT7KGi7syMK9eQrpdWLjlWlxhlu1BL4wGxeIWnua3mnzR+2SGkocVMIIv2BSn
 +mg5PvrtThwZRcIL4yMYzem511TIsL+JLyFL/CO0kGfflJZlO8SL0a0OXFhvmrJrQCgr
 yksX4CRRP1DQFn/18NlrMk0ajqKBY67UxrFw9X+k0daB4K0SJh1VjHm7TvoByxXHzPwG
 QjfaTMiL3dg8f2rUAkEnHe+jYTIR0YdqVO87kFmEOcXaGT4Nmm4//PQ4MXjJ1EGi8MN6
 raPH4HUkHs765nqEpzvRX1K951xIx5Dspr2gdcGr0s5JnfEn/dmB4LH55nfPdfBPX2WK tA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2058.outbound.protection.outlook.com [104.47.37.58])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2tx61fd653-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2019 01:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UygaBNK8xWb19HyONSEGRNYi2dmGmHyoY6/Fny5IpkvT5QNVYGsRCwob9CWST2ciejDGHmWoxAH4wn3jYAXzIoWUHMnBmTtvpvfnFox+as5fTKM0ziiYRc83ilD89s2fyOfJMCtpoXVhA7n2Hs6vCEuOUiHNcbMqOk04VGzK93Qkpz3tbdiGcOozUKJMs5I9TU4DKH4fxVtmvmy6PIG6s1CYqs75hejSm5+VegkD5tx227mLe+weJKd8VXew3hFzguY1A0GMDwuJV3kYMVMAGQQP08RCiwSkEnYI8HbbB2kc4WP8vsb//YBCPJrcm3un34AGHGikWfLREO5VmUa46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xmzl2AV+FynxVm26H1pEXIhXDVu9sSAmuDmqycIeO6I=;
 b=fDwNjVSiSTZSSH5pGXHo/Tde6P6c9lU5DL/oqO4menR3zy+BXSuE5IZYPUjdw7fpMvbsZ5VhrBa9R+wTMjC0o/M0Lmc5jwxCbcTpR9oiAFf6vNW09yhlCY70s+Ws51vQiY+x/DQt7x6JGDecxYNqKc9E+iG9PGzB/GHbLYKg3ekG/JFj1UvmZrKsPWmYqIxhBmQTj9wMTG4fTODRYZv4ZaQfyxD+zzLQ3efj4sO1YFNyWFlb2P9VBO0PKfVOmaG7s/N0Lnf6D4zwH2VGixWD9vt63P8vqPro/nye0+zI0RDgBMOkC73yy6YB88YzwT1ctnxhsOfLQso/0JLAnNhgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=cadence.com;dmarc=pass action=none
 header.from=cadence.com;dkim=pass header.d=cadence.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xmzl2AV+FynxVm26H1pEXIhXDVu9sSAmuDmqycIeO6I=;
 b=l32j+0ZUMLeSyg0oM5mI77J8xj0RyGripq7UFfHXRr25+7BJCCGNiGZHwxXNZcONyYCLOzlx29+ySkwswpVhi+sThPFuOS/P65eeFN2a94fK9joUHpPoIcU4KhvKFhXyYHvq5xhjodrarvNNHUarQhnAfCYcQs0yWoTYenT7Uho=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1PR07MB2715.namprd07.prod.outlook.com (10.167.17.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Fri, 26 Jul 2019 08:33:35 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::ac78:3ee1:c7d6:763]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::ac78:3ee1:c7d6:763%6]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 08:33:35 +0000
From: Jan Kotas <jank@cadence.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Thread-Topic: [alsa-devel] [RFC PATCH 17/40] soundwire: bus: use
 runtime_pm_get_sync/pm when enabled
Thread-Index: AQHVQ0J6QtaVaTjiSkWdh9su5zQPs6bchAIAgAACGYCAAAoKgIAAAvSA
Date: Fri, 26 Jul 2019 08:33:35 +0000
Message-ID: <F31F0D1F-63E2-4ABF-9B38-10D55E773F11@global.cadence.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
 <20190726073931.GE16003@ubuntu>
 <716D5D19-D494-4F4E-9180-24CB5A575648@global.cadence.com>
 <20190726082258.GF16003@ubuntu>
In-Reply-To: <20190726082258.GF16003@ubuntu>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b8b231d-af8a-46e1-581d-08d711a3f32d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY1PR07MB2715; 
x-ms-traffictypediagnostic: CY1PR07MB2715:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY1PR07MB271551EBE91EB3A632645120D0C00@CY1PR07MB2715.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(36092001)(189003)(199004)(446003)(11346002)(476003)(102836004)(6246003)(486006)(6916009)(66946007)(33656002)(6506007)(229853002)(316002)(186003)(99286004)(6486002)(76176011)(26005)(7416002)(5660300002)(305945005)(76116006)(25786009)(53546011)(64756008)(66556008)(66476007)(53936002)(71200400001)(86362001)(71190400001)(4326008)(14444005)(91956017)(66446008)(256004)(68736007)(8936002)(966005)(6116002)(6512007)(14454004)(6436002)(81156014)(81166006)(2906002)(6306002)(66066001)(54906003)(7736002)(8676002)(3846002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR07MB2715;
 H:CY1PR07MB2521.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zuPOCj2bK+pVkw9NPyboOWPzeLwrVxyPuus6VVwVQVsksf/xG89LDiUNcxApe0kTAoik3r55aato3+jxW7FTAZbQZo4sOf9W7HJ875GSfrwXHZrhubCqS0bs90GmWjQ64qgPZmh42fWADOcW+s2hpiW37jz2uwLTU5Z73woqhMftRMRwgk9hLsiAVnjEvwQ4WqzvOj0KsZwOo+7fFtt8HqG9y3mniNQQ1hBGCf03spzJ/e1skI1pPdelHK2Qpyhsf7Kdr3pV4hzObsGtDktc4cLGv56wS3f2Z46Xv8WIcFOhcSGa+BXHefeoVqfH2V5/OA9fKvkye7HQpLbWBNEB+FX12V2nustoIBiLfXo//REXG5ZWyuC6OI0c1URdDSBm8oTUq7XbGTl87jVI3G+xHoZ5M1xf07mABckxaOWZe6A=
Content-ID: <AFB5D21A50AE594DA87BDB8AAAF75EA7@namprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8b231d-af8a-46e1-581d-08d711a3f32d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 08:33:35.1299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jank@global.cadence.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2715
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907260109
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jan Kotas <jank@cadence.com>,
 "slawomir.blauciak@intel.com" <slawomir.blauciak@intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 17/40] soundwire: bus: use
 runtime_pm_get_sync/pm when enabled
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DQoNCj4gT24gMjYgSnVsIDIwMTksIGF0IDEwOjIyLCBHdWVubmFkaSBMaWFraG92ZXRza2kgPGd1
ZW5uYWRpLmxpYWtob3ZldHNraUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPiANCj4gRVhURVJO
QUwgTUFJTA0KPiANCj4gDQo+IEhpIEphbiwNCj4gDQo+IE9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0
IDA3OjQ3OjA0QU0gKzAwMDAsIEphbiBLb3RhcyB3cm90ZToNCj4+IEhlbGxvLA0KPj4gDQo+PiBJ
IHdoaWxlIGJhY2sgSSBwcm9wb3NlZCBhIHBhdGNoIGZvciB0aGlzLCBidXQgaXQgd2VudCBub3do
ZXJlLg0KPj4gDQo+PiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9
aHR0cHMtM0FfX3BhdGNod29yay5rZXJuZWwub3JnX3BhdGNoXzEwODg3NDA1XyZkPUR3SUJBZyZj
PWFVcTk4M0wycHVlMkZxS0ZvUDZQR0hNSlF5b0o3a2wzczNHWi1faGFYcVkmcj1nN0dBUUVOVlh4
X1JRZHlYSEluUE1nJm09aV8wUzM1OWhGSVZxTmd2M2ZSNV9NTnpET0hQOTl0cmRYc3paLUZNaVFF
RSZzPWRka3RGWllsZVBoLWJDN2tYZW9LV3Q0UW9tdXB6SEFUSzRGTFk0b1NXS0EmZT0gDQo+PiBN
YXliZSBzb21ldGhpbmcgc2ltaWxhciBjYW4gYmUgaW1wbGVtZW50ZWQ/DQo+IA0KPiBZZXMsIEkg
d2FzIHRoaW5raW5nIGFib3V0IGNoZWNraW50IC1FQUNDRVNTIHRvbywgYnV0IHRoZW4gSSBub3Rp
Y2VkIHRoaXMgY29kZQ0KPiBpbiBycG1fcmVzdW1lKCk6DQo+IA0KPiAJZWxzZSBpZiAoZGV2LT5w
b3dlci5kaXNhYmxlX2RlcHRoID09IDEgJiYgZGV2LT5wb3dlci5pc19zdXNwZW5kZWQNCj4gCSAg
ICAmJiBkZXYtPnBvd2VyLnJ1bnRpbWVfc3RhdHVzID09IFJQTV9BQ1RJVkUpDQo+IAkJcmV0dmFs
ID0gMTsNCj4gDQo+IGkuZS4gaWYgUlQtUE0gaXMgZGlzYWJsZWQgb24gdGhlIGRldmljZSAoYnV0
IG9ubHkgZXhhY3RseSBvbmNlPy4uKSBhbmQgaXQncw0KPiBhY3RpdmUgYW5kIHRoZSBkZXZpY2Ug
aXMgc3VzcGVuZGVkIGZvciBhIHN5c3RlbSBzdXNwZW5kLCB0aGUgZnVuY3Rpb24gd2lsbA0KPiBy
ZXR1cm4gMS4gSSBkb24ndCB1bmRlcnN0YW5kIHRoZSBsb2dpYyBvZiB0aGlzIGNvZGUsIGJ1dCBp
dCBzZWVtcyB0byBtZSBpdA0KPiBjb3VsZCBicmVhayB0aGUgLUVBQ0NFU1MgY2hlY2s/DQo+IA0K
DQpIaSwNCg0KSW4gc3VjaCBjYXNlIHJldCA8IDAgd2lsbCBub3QgYmUgdHJ1ZSwgd2hpY2ggSSB0
aGluayBpcyBmaW5lLA0KaWYgSeKAmW0gdW5kZXJzdGFuZGluZyB5b3UgY29ycmVjdGx5Lg0KDQpS
ZWdhcmRzLA0KSmFuDQoNCg0KPiBUaGFua3MNCj4gR3Vlbm5hZGkNCj4gDQo+PiBKYW4NCj4+IA0K
Pj4+IE9uIDI2IEp1bCAyMDE5LCBhdCAwOTozOSwgR3Vlbm5hZGkgTGlha2hvdmV0c2tpIDxndWVu
bmFkaS5saWFraG92ZXRza2lAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4+PiANCj4+PiBFWFRF
Uk5BTCBNQUlMDQo+Pj4gDQo+Pj4gDQo+Pj4gSGkgUGllcnJlLA0KPj4+IA0KPj4+IEkgbWlnaHQg
YmUgd3JvbmcgYnV0IHRoaXMgZG9lc24ndCBzZWVtIHJpZ2h0IHRvIG1lLiAoU3VwcG9zZWRseSkg
YWxsIFJULVBNDQo+Pj4gZnVuY3Rpb25zIGNoZWNrIGZvciAiZW5hYmxlZCIgaW50ZXJuYWxseS4g
VGhlIG9ubHkgdGhpbmcgdGhhdCBjYW4gaGFwcGVuIGlzDQo+Pj4gdGhhdCBpZiBSVC1QTSBpc24n
dCBlbmFibGVkIHNvbWUgb2YgdGhvc2UgZnVuY3Rpb25zIHdpbGwgcmV0dXJuIGFuIGVycm9yLg0K
Pj4+IFNvLCBpbiB0aG9zZSBjYXNlcyB3aGVyZSB0aGUgcmV0dXJuIHZhbHVlIG9mIFJULVBNIGZ1
bmN0aW9ucyBpc24ndCBjaGVja2VkLA0KPj4+IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdG8gZG8g
YW55dGhpbmcuIFdoZXJlIGl0IGlzIGNoZWNrZWQgbWF5YmUgZG8NCj4+PiANCj4+PiArCWlmIChy
ZXQgPCAwICYmIHBtX3J1bnRpbWVfZW5hYmxlZChzbGF2ZS0+YnVzLT5kZXYpKQ0KPj4+IA0KPj4+
IFRoYW5rcw0KPj4+IEd1ZW5uYWRpDQo+Pj4gDQo+Pj4gT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQg
MDY6NDA6MDlQTSAtMDUwMCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+Pj4+IE5vdCBh
bGwgcGxhdGZvcm1zIHN1cHBvcnQgcnVudGltZV9wbSBmb3Igbm93LCBsZXQncyB1c2UgcnVudGlt
ZV9wbQ0KPj4+PiBvbmx5IHdoZW4gZW5hYmxlZC4NCj4+Pj4gDQo+Pj4+IFN1Z2dlc3RlZC1ieTog
U3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3Nh
cnRAbGludXguaW50ZWwuY29tPg0KPj4+PiAtLS0NCj4+Pj4gZHJpdmVycy9zb3VuZHdpcmUvYnVz
LmMgfCAyNSArKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc291bmR3aXJlL2J1cy5jIGIvZHJpdmVycy9zb3VuZHdpcmUvYnVzLmMNCj4+Pj4g
aW5kZXggNWFkNDEwOWRjNzJmLi4wYTQ1ZGM1NzEzZGYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZl
cnMvc291bmR3aXJlL2J1cy5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvc291bmR3aXJlL2J1cy5jDQo+
Pj4+IEBAIC0zMzIsMTIgKzMzMiwxNiBAQCBpbnQgc2R3X25yZWFkKHN0cnVjdCBzZHdfc2xhdmUg
KnNsYXZlLCB1MzIgYWRkciwgc2l6ZV90IGNvdW50LCB1OCAqdmFsKQ0KPj4+PiAJaWYgKHJldCA8
IDApDQo+Pj4+IAkJcmV0dXJuIHJldDsNCj4+Pj4gDQo+Pj4+IC0JcmV0ID0gcG1fcnVudGltZV9n
ZXRfc3luYyhzbGF2ZS0+YnVzLT5kZXYpOw0KPj4+PiAtCWlmIChyZXQgPCAwKQ0KPj4+PiAtCQly
ZXR1cm4gcmV0Ow0KPj4+PiArCWlmIChwbV9ydW50aW1lX2VuYWJsZWQoc2xhdmUtPmJ1cy0+ZGV2
KSkgew0KPj4+PiArCQlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKHNsYXZlLT5idXMtPmRldik7
DQo+Pj4+ICsJCWlmIChyZXQgPCAwKQ0KPj4+PiArCQkJcmV0dXJuIHJldDsNCj4+Pj4gKwl9DQo+
Pj4+IA0KPj4+PiAJcmV0ID0gc2R3X3RyYW5zZmVyKHNsYXZlLT5idXMsICZtc2cpOw0KPj4+PiAt
CXBtX3J1bnRpbWVfcHV0KHNsYXZlLT5idXMtPmRldik7DQo+Pj4+ICsNCj4+Pj4gKwlpZiAocG1f
cnVudGltZV9lbmFibGVkKHNsYXZlLT5idXMtPmRldikpDQo+Pj4+ICsJCXBtX3J1bnRpbWVfcHV0
KHNsYXZlLT5idXMtPmRldik7DQo+Pj4+IA0KPj4+PiAJcmV0dXJuIHJldDsNCj4+Pj4gfQ0KPj4+
PiBAQCAtMzU5LDEzICszNjMsMTYgQEAgaW50IHNkd19ud3JpdGUoc3RydWN0IHNkd19zbGF2ZSAq
c2xhdmUsIHUzMiBhZGRyLCBzaXplX3QgY291bnQsIHU4ICp2YWwpDQo+Pj4+IAkJCSAgIHNsYXZl
LT5kZXZfbnVtLCBTRFdfTVNHX0ZMQUdfV1JJVEUsIHZhbCk7DQo+Pj4+IAlpZiAocmV0IDwgMCkN
Cj4+Pj4gCQlyZXR1cm4gcmV0Ow0KPj4+PiAtDQo+Pj4+IC0JcmV0ID0gcG1fcnVudGltZV9nZXRf
c3luYyhzbGF2ZS0+YnVzLT5kZXYpOw0KPj4+PiAtCWlmIChyZXQgPCAwKQ0KPj4+PiAtCQlyZXR1
cm4gcmV0Ow0KPj4+PiArCWlmIChwbV9ydW50aW1lX2VuYWJsZWQoc2xhdmUtPmJ1cy0+ZGV2KSkg
ew0KPj4+PiArCQlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKHNsYXZlLT5idXMtPmRldik7DQo+
Pj4+ICsJCWlmIChyZXQgPCAwKQ0KPj4+PiArCQkJcmV0dXJuIHJldDsNCj4+Pj4gKwl9DQo+Pj4+
IA0KPj4+PiAJcmV0ID0gc2R3X3RyYW5zZmVyKHNsYXZlLT5idXMsICZtc2cpOw0KPj4+PiAtCXBt
X3J1bnRpbWVfcHV0KHNsYXZlLT5idXMtPmRldik7DQo+Pj4+ICsNCj4+Pj4gKwlpZiAocG1fcnVu
dGltZV9lbmFibGVkKHNsYXZlLT5idXMtPmRldikpDQo+Pj4+ICsJCXBtX3J1bnRpbWVfcHV0KHNs
YXZlLT5idXMtPmRldik7DQo+Pj4+IA0KPj4+PiAJcmV0dXJuIHJldDsNCj4+Pj4gfQ0KPj4+PiAt
LSANCj4+Pj4gMi4yMC4xDQo+Pj4+IA0KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPj4+PiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdA0KPj4+PiBB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcNCj4+Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29m
cG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19tYWlsbWFuLmFsc2EtMkRwcm9qZWN0Lm9yZ19t
YWlsbWFuX2xpc3RpbmZvX2Fsc2EtMkRkZXZlbCZkPUR3SUJBZyZjPWFVcTk4M0wycHVlMkZxS0Zv
UDZQR0hNSlF5b0o3a2wzczNHWi1faGFYcVkmcj1nN0dBUUVOVlh4X1JRZHlYSEluUE1nJm09dkVU
R1FMU1BlR2I3S19ac1h2NFRsM1ZGZmRYenl1bW1URGdhOTdvekpjZyZzPUxpVzRTVG9oNVUwemhu
a294NTRvUmhKMXUzdkZOYkJCOW5telJEdUNEakkmZT0NCj4+IA0KPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IEFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0DQo+PiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcNCj4+IGh0dHBzOi8vdXJsZGVmZW5z
ZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fbWFpbG1hbi5hbHNhLTJEcHJvamVj
dC5vcmdfbWFpbG1hbl9saXN0aW5mb19hbHNhLTJEZGV2ZWwmZD1Ed0lCQWcmYz1hVXE5ODNMMnB1
ZTJGcUtGb1A2UEdITUpReW9KN2tsM3MzR1otX2hhWHFZJnI9ZzdHQVFFTlZYeF9SUWR5WEhJblBN
ZyZtPWlfMFMzNTloRklWcU5ndjNmUjVfTU56RE9IUDk5dHJkWHN6Wi1GTWlRRUUmcz1SeFBIeEtm
STN2NkZraDdxektqcThzTmktNVFNb1k4WGZ5TURTcXVBMzhvJmU9IA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
