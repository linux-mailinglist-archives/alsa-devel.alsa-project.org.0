Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEEE30D3DA
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 08:08:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ABBC179B;
	Wed,  3 Feb 2021 08:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ABBC179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612336120;
	bh=xRMlI2EADtM4gae429sxpvqn+NvYbc5cVgo4D59hErQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IwWq6AAs3cOefx9fl5Gu2J+i5ceE2KsdBa/t11INpFWTuv5+EWtY5gCnbsomZn5uc
	 9GMy3Pa4xYwXaEURBk22N9oPSa22Y4JVHj/ZBGKVkCiGSJrBsPlyuyQ1KH2uQqY3xd
	 apclkz0mPgoMWFNlYV2+JhRmAlH1qJcGaMkmAQB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAAF8F804FB;
	Wed,  3 Feb 2021 08:01:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2643F8015A; Wed,  3 Feb 2021 07:57:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id BB2CEF8013C
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 07:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB2CEF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="BT4M3Prs"
X-UUID: b25f4208624141f387ec8ef77e08ea68-20210203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xRMlI2EADtM4gae429sxpvqn+NvYbc5cVgo4D59hErQ=; 
 b=BT4M3PrsQ5TGCxdMvQMoEw82htr4KY49+wSBhScM0I4Mgp6CZPdigPsdoyqjhkLNFyJ1gW7bGmptO7phCBeRKL+llB2dnBgiG/D6RtueM043GNLl0kVDgngD1wmuYcqBJy6hERGLiMJOhqFfXzBZ7atfJkElpdDyBrmhzZrbRDU=;
X-UUID: b25f4208624141f387ec8ef77e08ea68-20210203
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <argus.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 815628569; Wed, 03 Feb 2021 14:57:44 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 14:57:43 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 14:57:43 +0800
Message-ID: <1612335462.9202.1.camel@mtkswgap22>
Subject: Re: [PATCH 0/2] Add mediatek MT6359 accdet driver
From: Argus Lin <argus.lin@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Wed, 3 Feb 2021 14:57:42 +0800
In-Reply-To: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
References: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:01:31 +0100
Cc: Jack Yu <jack.yu@realtek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ChiPeng Chang =?UTF-8?Q?=28=E5=BC=B5=E7=90=A6=E6=9C=8B=29?=
 <chipeng.chang@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Shane Chien =?UTF-8?Q?=28=E7=B0=A1=E4=BD=91=E8=BB=92=29?=
 <Shane.Chien@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?=
 <Jiaxin.Yu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dan Murphy <dmurphy@ti.com>, Shuming Fan <shumingf@realtek.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 wsd_upstream <wsd_upstream@mediatek.com>
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

RGVhciBtYWludGFpbmVyczoNCkNhbiB5b3UgcmVwbHkgdG8gbWUgaWYgYW55IG9waW5pb24/DQp0
aGFua3MNCg0KQi5SLg0KQXJndXMNCg0KT24gV2VkLCAyMDIxLTAxLTA2IGF0IDIwOjE5ICswODAw
LCBBcmd1cyBMaW4gd3JvdGU6DQo+IE1UNjM1OSBhdWRpbyBjb2RlYyBzdXBwb3J0IGFjY2Vzc29y
eSBkZXRlY3QgZmVhdHVyZXMsIHRoZSBnZW5lcmFsIGZlYXR1cmVzDQo+IGFyZSBqYWNrIHBsdWcg
ZGV0ZWN0aW9uIGFuZCBrZXkgZGV0ZWN0aW9uLg0KPiANCj4gQWxsIG9mIDMtcG9sZSBhbmQgNC1w
b2xlIGphY2sgYXJlIHN1cHBvcnRlZC4NCj4gDQo+IGNoYW5nZSBzaW5jZSB2MToNCj4gICAtIGFk
ZHMgbXQ2MzU5IGFjY2RldCBiaW5kaW5nIGRvY3VtZW50DQo+ICAgLSBhZGRzIG10NjM1OSBhY2Nk
ZXQgZHJpdmVyDQo+IA0KPiANCj4gQXJndXMgTGluICgyKToNCj4gICBkdC1iaW5kaW5nczogbWVk
aWF0ZWs6IG10NjM1OTogYWRkIEFTb0MgbXQ2MzU5IGFjY2RldCBkb2N1bWVudA0KPiAgIEFTb0M6
IG1lZGlhdGVrOiBtdDYzNTk6IGFkZCBNVDYzNTkgYWNjZGV0IGRyaXZlcg0KPiANCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210NjM1OS1hY2NkZXQueWFtbCAgIHwgIDE0MiArKw0K
PiAgc291bmQvc29jL2NvZGVjcy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICA3ICsNCj4gIHNvdW5kL3NvYy9jb2RlY3MvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgMiArDQo+ICBzb3VuZC9zb2MvY29kZWNzL210NjM1OS1hY2NkZXQuYyAgICAgICAg
ICAgICAgICAgICB8IDE5NTEgKysrKysrKysrKysrKysrKysrKysNCj4gIHNvdW5kL3NvYy9jb2Rl
Y3MvbXQ2MzU5LWFjY2RldC5oICAgICAgICAgICAgICAgICAgIHwgIDEzNiArKw0KPiAgc291bmQv
c29jL2NvZGVjcy9tdDYzNTkuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxODYzICsrKysr
KysrKysrKysrKysrLS0NCj4gIDYgZmlsZXMgY2hhbmdlZCwgMzk5NSBpbnNlcnRpb25zKCspLCAx
MDYgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvdW5kL210NjM1OS1hY2NkZXQueWFtbA0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHNvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5LWFjY2RldC5jDQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgc291bmQvc29jL2NvZGVjcy9tdDYzNTktYWNjZGV0LmgNCj4gDQo+IC0tDQo+IDEuOC4x
LjEuZGlydHkNCj4gDQoNCg==

