Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F021521520
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 14:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 038F517ED;
	Tue, 10 May 2022 14:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 038F517ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652185370;
	bh=ZMTGULoUMcX0IQsqeicm3f4SCKSpnyzhPtHgWEwOj6U=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RYA82tHBursvCxpXw/mdxD0PJMYrgsWxH9KCogORMWrrdrR80sWZwIrqrAy3X15w5
	 zRInWj6Qodphqm+PMp3gZ0bBDONTOxpMSBSzCHGBFjiyl2xxnoQgdI8ANdW6EcrOpF
	 X++kjjq42NXO3rGYItRPtmbW74hrr9rhrxxKnubE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59899F8011C;
	Tue, 10 May 2022 14:21:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7378EF800E3; Fri,  6 May 2022 13:16:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41D60F800E3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 13:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41D60F800E3
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-141-5bFZsmBPMJaCVZ5XX50WZg-1; Fri, 06 May 2022 12:15:26 +0100
X-MC-Unique: 5bFZsmBPMJaCVZ5XX50WZg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Fri, 6 May 2022 12:15:23 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Fri, 6 May 2022 12:15:23 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Johannes Berg' <johannes@sipsolutions.net>, Keith Packard
 <keithp@keithp.com>, Kees Cook <keescook@chromium.org>
Subject: RE: [PATCH 02/32] Introduce flexible array struct memcpy() helpers
Thread-Topic: [PATCH 02/32] Introduce flexible array struct memcpy() helpers
Thread-Index: AQHYYLyA1R9dSzYVM0KNCrE+uTLPFK0RsSYw
Date: Fri, 6 May 2022 11:15:23 +0000
Message-ID: <46ec2f1d6e9347eaba1feeb00e8c508a@AcuMS.aculab.com>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-3-keescook@chromium.org>
 <d3b73d80f66325fdfaf2d1f00ea97ab3db03146a.camel@sipsolutions.net>
 <202205040819.DEA70BD@keescook>
 <970a674df04271b5fd1971b495c6b11a996c20c2.camel@sipsolutions.net>
 <871qx8qabo.fsf@keithp.com> <202205051228.4D5B8CD624@keescook>
 <87pmkrpwrs.fsf@keithp.com>
 <e1ea4926f105b456f6a86ce30a0380ee5f48fe6d.camel@sipsolutions.net>
In-Reply-To: <e1ea4926f105b456f6a86ce30a0380ee5f48fe6d.camel@sipsolutions.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Tue, 10 May 2022 14:21:49 +0200
Cc: Christian Lamparter <chunkeey@googlemail.com>, Eli Cohen <elic@nvidia.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Louis Peens <louis.peens@corigine.com>,
 Wei Liu <wei.liu@kernel.org>, Hulk Robot <hulkci@huawei.com>, Eugeniu
 Rosca <erosca@de.adit-jv.com>, James Morris <jmorris@namei.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Guenter Roeck <linux@roeck-us.net>, Marcel Holtmann <marcel@holtmann.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
 Christian Brauner <brauner@kernel.org>, Dmitry
 Kasatkin <dmitry.kasatkin@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 John Keeping <john@metanate.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Dumazet <edumazet@google.com>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>, Lars-Peter
 Clausen <lars@metafoo.de>, Stephen Hemminger <sthemmin@microsoft.com>,
 Bradley Grove <linuxdrivers@attotech.com>, Leon Romanovsky <leon@kernel.org>,
 Udipto Goswami <quic_ugoswami@quicinc.com>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Baowen Zheng <baowen.zheng@corigine.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Muchun Song <songmuchun@bytedance.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Chris Zankel <chris@zankel.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 Cong Wang <cong.wang@bytedance.com>, David
 Gow <davidgow@google.com>, Tom Rix <trix@redhat.com>,
 Alexei Starovoitov <ast@kernel.org>,
 =?utf-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Frank Rowand <frowand.list@gmail.com>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>, Andrew
 Gabbasov <andrew_gabbasov@mentor.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Simon Horman <simon.horman@corigine.com>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jens Axboe <axboe@kernel.dk>, Xiu Jianfeng <xiujianfeng@huawei.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Hante
 Meuleman <hante.meuleman@broadcom.com>, Nathan Chancellor <nathan@kernel.org>,
 Paul Moore <paul@paul-moore.com>, Mark Brown <broonie@kernel.org>,
 Eric Paris <eparis@parisplace.org>, Dan
 Williams <dan.j.williams@intel.com>, Tadeusz Struk <tadeusz.struk@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEfDtnR0c2NoZQ==?= <cgzones@googlemail.com>,
 Franky Lin <franky.lin@broadcom.com>, Felipe Balbi <balbi@kernel.org>,
 Arend van Spriel <aspriel@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, "David S.
 Miller" <davem@davemloft.net>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>,
 "wcn36xx@lists.infradead.org" <wcn36xx@lists.infradead.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Lee Jones <lee.jones@linaro.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 "SHA-cyfmac-dev-list@infineon.com" <SHA-cyfmac-dev-list@infineon.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Andy Lavr <andy.lavr@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Rich
 Felker <dalias@aerifal.cx>, Rob Herring <robh+dt@kernel.org>, Luiz
 Augusto von Dentz <luiz.dentz@gmail.com>,
 "kunit-dev@googlegroups.com" <kunit-dev@googlegroups.com>,
 Juergen Gross <jgross@suse.com>,
 "brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>
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

RnJvbTogSm9oYW5uZXMgQmVyZw0KPiBTZW50OiAwNSBNYXkgMjAyMiAyMToxMw0KPiBPbiBUaHUs
IDIwMjItMDUtMDUgYXQgMTM6MDggLTA3MDAsIEtlaXRoIFBhY2thcmQgd3JvdGU6DQo+IA0KPiAN
Cj4gPiBJIGJldCB5b3UndmUgYWxyZWFkeSBjb25zaWRlcmVkIHRoZSBzaW1wbGVyIGZvcm06DQo+
ID4NCj4gPiAgICAgICAgIHN0cnVjdCBzb21ldGhpbmcgKmluc3RhbmNlID0gbWVtX3RvX2ZsZXhf
ZHVwKGJ5dGVfYXJyYXksIGNvdW50LCBHRlBfS0VSTkVMKTsNCj4gPiAgICAgICAgIGlmIChJU19F
UlIoaW5zdGFuY2UpKQ0KPiA+ICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGluc3RhbmNlKTsN
Cj4gPg0KPiANCj4gU2FkbHksIHRoaXMgZG9lc24ndCB3b3JrIGluIGFueSB3YXkgYmVjYXVzZSBt
ZW1fdG9fZmxleF9kdXAoKSBuZWVkcyB0bw0KPiBrbm93IGF0IGxlYXN0IHRoZSB0eXBlLCBoZW5j
ZSBwYXNzaW5nICdpbnN0YW5jZScsIHdoaWNoIGlzIHNpbXBsZXIgdGhhbg0KPiBwYXNzaW5nICdz
dHJ1Y3Qgc29tZXRoaW5nJy4NCg0KWW91IGNhbiB1c2U6DQogICAgICAgICBzdHJ1Y3Qgc29tZXRo
aW5nICppbnN0YW5jZTsNCiAgICAgICAgIG1lbV90b19mbGV4X2R1cChpbnN0YW5jZSwgYnl0ZV9h
cnJheSwgY291bnQsIEdGUF9LRVJORUwpOw0KICAgICAgICAgaWYgKElTX0VSUihpbnN0YW5jZSkp
DQogICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoaW5zdGFuY2UpOw0KYW5kIGhhdmUgbWVtX3Rv
X2ZsZXhfZHVwKCkgKHdoaWNoIG11c3QgYmUgYSAjZGVmaW5lKSB1cGRhdGUgJ2luc3RhbmNlJy4N
CihZb3UgY2FuIHJlcXVpcmUgJmluc3RhbmNlIC0gYW5kIGp1c3QgcHJlY2VkZSBhbGwgdGhlIHVz
ZXMgd2l0aA0KYW4gZXh0cmEgJyonIHRvIG1ha2UgaXQgbW9yZSBvYnZpb3VzIHRoZSB2YXJpYWJs
ZSBpcyB1cGRhdGVkLg0KQnV0IHRoZXJlIGlzIGxpdHRsZSBwb2ludCByZXF1aXJpbmcgaXQgYmUg
TlVMTC4pDQoNCklmIHlvdSByZWFsbHkgd2FudCB0byBkZWZpbmUgdGhlIHZhcmlhYmxlIG1pZC1i
bG9jayB5b3UgY2FuIHVzZToNCiAgICAgICAgIG1lbV90b19mbGV4X2R1cChzdHJ1Y3Qgc29tZXRo
aW5nICosIGluc3RhbmNlLCBieXRlX2FycmF5LCBjb3VudCwgR0ZQX0tFUk5FTCk7DQoNCmJ1dCBJ
IHJlYWxseSBoYXRlIGhhdmluZyBkZWNsYXJhdGlvbnMgYW55d2hlcmUgb3RoZXIgdGhhbiB0aGUg
dG9wIG9mDQphIGZ1bmN0aW9uIGJlY2F1c2UgaXQgbWFrZXMgdGhlbSBoYXJkIGZvciB0aGUgJ21r
MSBleWViYWxsJyB0byBzcG90Lg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExh
a2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQs
IFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

