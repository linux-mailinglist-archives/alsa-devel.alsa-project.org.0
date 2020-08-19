Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB524A17F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 16:17:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03BD7185A;
	Wed, 19 Aug 2020 16:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03BD7185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597846632;
	bh=kYIAM6np6YE2QL6+tc8lKdM+PSm8Ac5OwNVmkbFSCSw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OpVBMUvvmoriV6biM7TadH3Jf2YH9+rDiMeTKNLLK1fj0ZdzP+7/Z5wCPmN2v2mbQ
	 DKZgY/PGkBxnS1l9eZdjKA0GGVMlfVh5ByXz6NGUk7fMW1frdFuayZ+OMesmNVgOcN
	 qZkrDUKVvFdih7+wlzTtAjYNsJ2MbplsHtzGbHnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32ACDF80255;
	Wed, 19 Aug 2020 16:15:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FCBCF80218; Wed, 19 Aug 2020 16:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_135,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 163D9F800D3
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 16:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 163D9F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com
 header.b="NuZN1pLC"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
 t=1597846523; x=1629382523;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=TCPiu/jCQImGdZSDtgLgcsS+uu4b1HDoWYwHlZmyNgY=;
 b=NuZN1pLC+fb9sbrABZADAtfTefPw1ZL89WyLJ8BJJZFc5J8/44m0j3CR
 gfTyx4EBVdvECCvhlhA943eRn81Uezk9UTMm9qw84OAa5YAAfb4H5qLII
 F3N0xZ2sGaAAMbzebz/n7CYsy4Qa2JCPPFpMvg/hbuTr+1AhCcQumpls8
 myV0Ep/4+5ToWn/+w8qYIYiwOFwChrNJw+zScZFiiN8Mt8CPIbNe/Mhfh
 6b5hKd3rwEUVrNEU56JdbJOJWONmQZo94VOSzOgSMdUcfqfUiD9p6yTb1
 FJlHj0VF0ZgCfLwF/YFAGCTDiDY3g3Fz6XAAN8l2hbOz0uWMSuIhu8PmM A==;
IronPort-SDR: sSZwLWQsn70qiVekDZbq0Nv+XKf3uxcvJPfaBn63b4JvIfmMGp21RhItvX2jjXG8MsvVrU6q12
 QMCWPYf25UYiTi694GkVxY+964pXc0aXWTL4Ycv3oWgl2/G9W/qPMUIBvNUcIlf82d2V8vdyjH
 FxEHaripcSqQuhzedKkEMIYBJIYyTnW3obttHl3L/7GqAufOlvZKeFjWGINjrXAukRGx/k0Ay9
 78MIYS0s+na7VK2JoVGwUDEHLN1vUwYg+z4jTSpht5SekvGUeCCDG5yS8d1lAeVO1C3Z+bpyGQ
 0DE=
X-IronPort-AV: E=Sophos;i="5.76,331,1592863200"; d="scan'208,217";a="26224415"
From: Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Robin Gong <yibin.gong@nxp.com>
Subject: RE: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Topic: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Index: AQHWcWQZKYOChL0mPkuCFeZyDJy6mKk3KiiAgABS1/CAB7DUgIAAJ+UQ
Date: Wed, 19 Aug 2020 14:15:17 +0000
Message-ID: <81a316e2390a48e5961e08c45762ed27@skidata.com>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <61498763c60e488a825e8dd270732b62@skidata.com>
 <16942794-1e03-6da0-b8e5-c82332a217a5@metafoo.de>
In-Reply-To: <16942794-1e03-6da0-b8e5-c82332a217a5@metafoo.de>
Accept-Language: en-US, de-AT
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.111.252]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXJzLVBldGVyIENsYXVzZW4g
PGxhcnNAbWV0YWZvby5kZT4NCj4gU2VudDogTWl0dHdvY2gsIDE5LiBBdWd1c3QgMjAyMCAxMzow
OA0KPiBJIHRoaW5rIHRoaXMgbWlnaHQgYmUgYW4gc2RtYSBzcGVjaWZpYyBwcm9ibGVtIGFmdGVy
IGFsbC4NCj4gZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYygpIHdpbGwgaXNzdWUgYSByZXF1ZXN0
IHRvIHN0b3AgdGhlIERNQS4gQnV0IGl0DQo+IGlzIHN0aWxsIHNhZmUgdG8gaXNzdWUgdGhlIG5l
eHQgdHJhbnNmZXIsIGV2ZW4gd2l0aG91dCBjYWxsaW5nDQo+IGRtYWVuZ2luZV9zeW5jaHJvbml6
ZSgpLiBUaGUgRE1BIHNob3VsZCBzdGFydCB0aGUgbmV3IHRyYW5zZmVyIGF0IGl0cw0KPiBlYXJs
aWVzdCBjb252ZW5pZW5jZSBpbiB0aGF0IGNhc2UuDQo+DQo+IGRtYWVnaW5lX3N5bmNocm9uaXpl
KCkgaXMgc28gdGhhdCB0aGUgY29uc3VtZXIgaGFzIGEgZ3VhcmFudGVlIHRoYXQgdGhlDQo+IERN
QSBpcyBmaW5pc2hlZCB1c2luZyB0aGUgcmVzb3VyY2VzIChlLmcuIHRoZSBtZW1vcnkgYnVmZmVy
cykgYXNzb2NpYXRlZA0KPiB3aXRoIHRoZSBETUEgdHJhbnNmZXIgc28gaXQgY2FuIHNhZmVseSBm
cmVlIHRoZW0uDQoNClRoYW5rIHlvdSBmb3IgdGhlIGNsYXJpZmljYXRpb25zIQ0KDQo+IEkgZG9u
J3Qga25vdyBob3cgZmVhc2libGUgdGhpcyBpcyB0byBpbXBsZW1lbnQgaW4gdGhlIFNETUEgZG1h
ZW5naW5lDQo+IGRyaXZlci4gQnV0IEkgdGhpbmsgd2hhdCBpcyBzaG91bGQgZG8gaXMgdG8gaGF2
ZSBzb21lIGZsYWcgdG8gaW5kaWNhdGUNCj4gaWYgYSB0ZXJtaW5hdGUgaXMgaW4gcHJvZ3Jlc3Mu
IElmIGEgbmV3IHRyYW5zZmVyIGlzIGlzc3VlZCB3aGlsZQ0KPiB0ZXJtaW5hdGUgaXMgaW4gcHJv
Z3Jlc3MgdGhlIHRyYW5zZmVyIHNob3VsZCBnbyBvbiBhIGxpc3QuIE9uY2UNCj4gdGVybWluYXRl
IGZpbmlzaGVzIGl0IHNob3VsZCBjaGVjayB0aGUgbGlzdCBhbmQgc3RhcnQgdGhlIHRyYW5zZmVy
IGlmDQo+IHRoZXJlIGFyZSBhbnkgb24gdGhlIGxpc3QuDQoNCklNSE8gdGhhdCdzIG5lYXJseSB3
aGF0IFJvYmluJ3MgcGF0Y2hlcyBkbywgc28gaXQgc2hvdWxkIGJlIHN1ZmZpY2llbnQgdG8NCnB1
dCB0aGUgZGVzY3JpcHRvcnMgdG8gZnJlZSBpbiBhbiBleHRyYSB0ZXJtaW5hdGlvbiBsaXN0IGFu
ZCBlbnN1cmUNCnRoYXQgYSBuZXcgdHJhbnNmZXIgaXMgaGFuZGxlZCBhZnRlciB0aGUgbGFzdCB0
ZXJtaW5hdGlvbiBpcyBkb25lLg0KDQoNCkBSb2JpbjoNCklzIGl0IHBvc3NpYmxlIHRvIHRhZyB0
aGUgY29tbWl0cyBmb3IgdGhlIHN0YWJsZS10cmVlDQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zz8NCg0KQmVzdCByZWdhcmRzIGFuZCB0aGFuayB5b3UhDQpCZW5qYW1pbg0KUmljaGFyZA0KDQo=
