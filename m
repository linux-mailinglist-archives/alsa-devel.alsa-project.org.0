Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9B72451A1
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Aug 2020 19:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FAB61679;
	Sat, 15 Aug 2020 19:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FAB61679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597513213;
	bh=Tb6/rrU+Whgc4JVZQ17Em6fT1xwjS1hWvPGz2ZfXBbs=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kfgneAxCbnDWaMqUwJ87KLJgt9Y+flzU15GroZzyIC2cQEWL35Ci7RbtvDfsB85wl
	 jqu2oCBXwduIlBE27zypxK/Xnj591h+jD01JvSY2BlpnmYbf4YpM5WL5xgyeCWc1x5
	 IgqIVDjIWtYA+I0CoJBjWKbRE2BQ6b4gUMGBvj+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D17F8014C;
	Sat, 15 Aug 2020 19:38:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6EA2F80171; Sat, 15 Aug 2020 19:38:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by alsa1.perex.cz (Postfix) with ESMTP id 1D483F800D3
 for <alsa-devel@alsa-project.org>; Sat, 15 Aug 2020 19:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D483F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="cf7RFWDW"
X-UUID: 05e85f7d7cea4cdcacd4211bb03f12d8-20200816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Tb6/rrU+Whgc4JVZQ17Em6fT1xwjS1hWvPGz2ZfXBbs=; 
 b=cf7RFWDWSZMnqMTyJVZzZquy2TgM7pNMTxoke84RGmj6aPAvk9PSs/7yssnC97kTK/O7O2RNwDWHpuGK9NB0qP6ok71yiOpEV/A23ZeD83x2rQjWHReJcgEyGEDwkatgKM9ZG7L7z2gzRSaOd/2BqvM76giFJZLw8Og6ZsVJATo=;
X-UUID: 05e85f7d7cea4cdcacd4211bb03f12d8-20200816
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1256276724; Sun, 16 Aug 2020 01:28:04 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 16 Aug 2020 01:28:01 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 16 Aug 2020 01:28:00 +0800
Message-ID: <1597512421.23246.74.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/2] WIP: ASoC: mediatek: mt6359: add codec driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, <tzungbi@google.com>
Date: Sun, 16 Aug 2020 01:27:01 +0800
In-Reply-To: <20200814160115.GC4783@sirena.org.uk>
References: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597401954-28388-2-git-send-email-jiaxin.yu@mediatek.com>
 <20200814160115.GC4783@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F4E5B18A5807A6EABCAC7321F18334F47F255F5F43AA401E0D7E4B88DE8CF31D2000:8
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com, Bicycle.Tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
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

T24gRnJpLCAyMDIwLTA4LTE0IGF0IDE3OjAxICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBGcmksIEF1ZyAxNCwgMjAyMCBhdCAwNjo0NTo1M1BNICswODAwLCBKaWF4aW4gWXUgd3JvdGU6
DQo+IA0KPiBUaGlzIGxvb2tzIG1vc3RseSBnb29kLCBhIGNvdXBsZSBvZiB2ZXJ5IHNtYWxsIHRo
aW5nczoNCj4gDQo+ID4gKwlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKHByaXYtPmF2ZGRfcmVnKTsN
Cj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICIlcygpLCBmYWls
ZWQgdG8gZW5hYmxlIHJlZ3VsYXRvciFcbiIsDQo+ID4gKwkJCV9fZnVuY19fKTsNCj4gPiArCQly
ZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiANCj4gWW91IG5lZWQgYSByZW1vdmUoKSBmdW5jdGlvbiB0
byB1bmRvIHRoaXMgZW5hYmxlLg0KPiANCg0KT2ssIEkgd2lsbCBhZGQgYSByZW1vdmUoKSBmdW5j
dGlvbiB0byBkbyByZWd1bGF0b3JfZGlzYWJsZSgpIGFuZA0Kc25kX3NvY191bnJlZ2lzdGVyX2Nv
bXBvbmVudCgpLg0KDQo+ID4gKwlkZXZfaW5mbygmcGRldi0+ZGV2LCAiJXMoKSwgZGV2IG5hbWUg
JXNcbiIsDQo+ID4gKwkJIF9fZnVuY19fLCBkZXZfbmFtZSgmcGRldi0+ZGV2KSk7DQo+IA0KPiBU
aGlzIGlzbid0IHJlYWxseSBhZGRpbmcgYW55dGhpbmcsIGp1c3QgcmVtb3ZlIGl0IC0gaXQncyBu
b3QgcmVhZGluZw0KPiBpbmZvIGZyb20gdGhlIGhhcmR3YXJlIG9yIGFueXRoaW5nLg0KDQpZZXMs
IGl0IHdhcyB1bm5lY2Vzc2FyeSwgcmVtb3ZlZCBpdCBpbiBQQVRDSCB2NC4NCg==

