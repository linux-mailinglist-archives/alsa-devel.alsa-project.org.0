Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C56954A8ED
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 07:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10570184E;
	Tue, 14 Jun 2022 07:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10570184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655186112;
	bh=QXFd4rzgGAQOb7I5MjJJdvn8g/eM1bO2TVVCAC784so=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOhPakMSIkiMAzLCRf0Th4jcqF91bX2kV6cejKJO37haPIxfA2tJ9T5MSbDP/KdR0
	 LinK3F5UPDLUpWB1pDrMNM8out/Qb0D9AJqw5+ceIwT+KVjF166FA5fprevv9Z4IuS
	 i49dAw29jk/grSbRr7gCvL9BZ3pkJCsrfzaJy5Zk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55CDDF80165;
	Tue, 14 Jun 2022 07:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B1B2F804D2; Fri, 10 Jun 2022 11:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2394BF800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 11:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2394BF800DF
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-285-KXkgFt7gOaSUzoJhNxSJvA-1; Fri, 10 Jun 2022 10:14:48 +0100
X-MC-Unique: KXkgFt7gOaSUzoJhNxSJvA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Fri, 10 Jun 2022 10:14:45 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Fri, 10 Jun 2022 10:14:45 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jan Engelhardt' <jengelh@inai.de>
Subject: RE: [PATCH 00/12] Clang -Wformat warning fixes
Thread-Topic: [PATCH 00/12] Clang -Wformat warning fixes
Thread-Index: AQHYfFM1C3rJ7kSMAEGkdVTZFYHL+K1ISrPg///1DYCAABtWMA==
Date: Fri, 10 Jun 2022 09:14:45 +0000
Message-ID: <724889aa6a8d4d41b8557733610c7657@AcuMS.aculab.com>
References: <20220609221702.347522-1-morbo@google.com>
 <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
 <CAGG=3QXDt9AeCQOAp1311POFRSByJru4=Q=oFiQn3u2iZYk2_w@mail.gmail.com>
 <01da36bfd13e421aadb2eff661e7a959@AcuMS.aculab.com>
 <o5496n8r-451p-751-3258-97112opns7s8@vanv.qr>
In-Reply-To: <o5496n8r-451p-751-3258-97112opns7s8@vanv.qr>
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
X-Mailman-Approved-At: Tue, 14 Jun 2022 07:54:10 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND
 64-BIT\)" <x86@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric
 Dumazet <edumazet@google.com>, Networking <netdev@vger.kernel.org>,
 'Bill Wendling' <morbo@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Bill Wendling <isanbard@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 clang-built-linux <llvm@lists.linux.dev>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 Arnd Bergmann <arnd@arndb.de>, Ross Philipson <ross.philipson@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian
 Westphal <fw@strlen.de>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
 Jan Kara <jack@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

RnJvbTogSmFuIEVuZ2VsaGFyZHQNCj4gU2VudDogMTAgSnVuZSAyMDIyIDA5OjMyDQo+IA0KPiAN
Cj4gT24gRnJpZGF5IDIwMjItMDYtMTAgMTA6MTcsIERhdmlkIExhaWdodCB3cm90ZToNCj4gPj4N
Cj4gPj4gQ2FsbGluZyBhICJwcmludGYiIHN0eWxlIGZ1bmN0aW9uIGlzIGFscmVhZHkgaW5zYW5l
bHkgZXhwZW5zaXZlLiA6LSkgSQ0KPiA+PiB1bmRlcnN0YW5kIHRoYXQgaXQncyBub3Qgb2theSBi
bGl0aGVseSB0byBpbmNyZWFzZSBydW50aW1lIHJlc291cmNlcw0KPiA+PiBzaW1wbHkgYmVjYXVz
ZSBpdCdzIGFscmVhZHkgc2xvdywgYnV0IGluIHRoaXMgY2FzZSBpdCdzIHdvcnRod2hpbGUuDQo+
ID4NCj4gPlllcCwgSU1ITyBkZWZpbml0ZWx5IHNob3VsZCBiZSBmaXhlZC4NCj4gPkl0IGlzIGV2
ZW4gcG9zc2libGUgdGhhdCB1c2luZyAiJXMiIGlzIGZhc3RlciBiZWNhdXNlIHRoZSBwcmludGYN
Cj4gPmNvZGUgZG9lc24ndCBoYXZlIHRvIHNjYW4gdGhlIHN0cmluZyBmb3IgZm9ybWF0IGVmZmVj
dG9ycy4NCj4gDQo+IEkgc2VlIG5vIHNwZWNpYWwgaGFuZGxpbmc7IHRoZSB2c25wcmludGYgZnVu
Y3Rpb24ganVzdCBsb29wcw0KPiBvdmVyIGZtdCBhcyB1c3VhbCBhbmQgSSBzZWUgbm8gc3BlY2lh
bCBjYXNpbmcgb2YgZm10IGJ5DQo+IGUuZy4gc3RyY21wKGZtdCwgIiVzIinCoD09IDAgdG8gdGFr
ZSBhIHNob3J0Y3V0Lg0KDQpDb25zaWRlciB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuOg0KCXByaW50
ZigiZnViYXIiKTsNCmFuZA0KCXByaW50ZigiJXMiLCAiZnViYXIiKTsNCkluIHRoZSBmb3JtZXIg
YWxsIG9mICJmdWJhciIgaXMgY2hlY2tlZCBmb3IgJyUnLg0KSW4gdGhlIGxhdHRlciBvbmx5IHRo
ZSBsZW5ndGggb2YgImZ1YmFyIiBoYXMgdG8gYmUgY291bnRlZC4NCg0KRldJVyB0aGUgcGF0Y2gg
ZGVzY3JpcHRpb24gc2hvdWxkIHByb2JhYmx5IGJ5Og0KCXVzZSAiJXMiIHdoZW4gZm9ybWF0dGlu
ZyBhIHNpbmdsZSBzdHJpbmcuDQoob3Igc29tZXRoaW5nIHRvIHRoYXQgZWZmZWN0KS4NCg0KCURh
dmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3Vu
dCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3
Mzg2IChXYWxlcykNCg==

