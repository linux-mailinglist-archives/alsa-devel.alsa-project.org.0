Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC64B29A9A6
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 11:30:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DD541699;
	Tue, 27 Oct 2020 11:29:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DD541699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603794648;
	bh=lI1rHYpY+CiSC3fg2g3y3KjP/CT7FHrSA+j5s8OF8S8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZxXmFNZBKCH+Y3sevBs5D4wddk5SV39rwsx1uzcgkklZqbU+c8ARcD3+zc2yw6uN
	 YBfTuz2ofY70GkW87qM72l9/3P4iGbcqOiA1EalKJakZY6ypUZe99T5cApD+3w9e7H
	 EsVn1+WphLWPcx5T8ggWPEjFH5J6OtC56/UOrrAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6004F800FF;
	Tue, 27 Oct 2020 11:29:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17C1AF8020D; Tue, 27 Oct 2020 11:29:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 93E75F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93E75F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="JIAb8qRm"
X-UUID: b1ba04f039b94df293fae011de86c2a1-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lI1rHYpY+CiSC3fg2g3y3KjP/CT7FHrSA+j5s8OF8S8=; 
 b=JIAb8qRmlXdWorFqndwiH1RPBJD69+AONjtAqE/eICvQ5pWXgIfaWzbVGqwio7LWLUy7LGYxVqMmzyImN9kfqOa48tUygEJc20Uh5kdCsnIn/SzwF2g9HkEf/zFXAQWBJG8UxWuXZawKYiIQDpD5R1/CdUjm+bE1yXD1UO2+Ix8=;
X-UUID: b1ba04f039b94df293fae011de86c2a1-20201027
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1089795499; Tue, 27 Oct 2020 18:29:00 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 27 Oct 2020 18:28:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Oct 2020 18:28:57 +0800
Message-ID: <1603794538.26523.6.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] ASoC: mt6359: skip first time data at the beginning
 of DMIC recording
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Oct 2020 18:28:58 +0800
In-Reply-To: <20201026123325.GC7402@sirena.org.uk>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com>
 <20201026123325.GC7402@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

T24gTW9uLCAyMDIwLTEwLTI2IGF0IDEyOjMzICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBTYXQsIE9jdCAyNCwgMjAyMCBhdCAwMjo0MToyNVBNICswODAwLCBKaWF4aW4gWXUgd3JvdGU6
DQo+ID4gV2UgY2FuIGNob29zZSB0byBkcm9wIGF3YXkgYW55IGxlbmd0aCBvZiBkYXRhIGZyb20g
dGhlIGJlZ2lubmluZyBhY2NvcmRpbmcNCj4gPiB0byBwcm9qZWN0IG5lZWRzLiBTb21lIHByb2pl
Y3RzIGRvbid0IHdhbnQgdG8gdGhyb3cgYXdheSBhbnkgZGF0YSwgYmVjYXVzZQ0KPiA+IHRoZXkg
d2FudCB0byB1c2UgcmVjb3JkZWQgZGF0YSB0byBkbyBlY2hvIGNhbmNlbGxhdGlvbiwgc28gdGhl
eSBoYXZlIHRvDQo+ID4gbWFrZSBzdXJlIHRoYXQgdGhleSBhcmUgYWxpZ25lZCB3aXRoIHRoZSBy
ZWZlcmVuY2UgZGF0YSBhcyBtdWNoIGFzDQo+ID4gcG9zc2libGUuIE9yIHRoZXJlIGFyZSBvdGhl
ciBhbGdvcml0aG1zIGluIHRoZSB1cHBlciBsYXllciB0byBlbGltaW5hdGUNCj4gPiB0aGlzIG5v
aXNlLiBPciBzb21lIHByb2plY3RzIHdhbnQgdG8gZWxpbWluYXRlIHRoaXMgbm9pc2UgZm9ybSB0
aGUga2VybmVsDQo+ID4gbGF5ZXIuIEhvd2V2ZXIsIHRoZSBtaW5pbXVtIHJlY29tbWVuZGVkIHZh
bHVlIGlzIDUwbXMgdG8gc2tpcCBwb3Agbm9pc2UuDQo+IA0KPiBUaGlzIHNlZW1zIGxpa2Ugc29t
ZXRoaW5nIHRoYXQgd291bGQgYXBwbHkgZXF1YWxseSB0byBhbGwgRE1JQ3Mgc28NCj4gc2hvdWxk
IGJlIGRvbmUgYXQgYSBtb3JlIGdlbmVyYWwgbGV2ZWwgcmF0aGVyIHRoYW4gaW4gdGhpcyBzcGVj
aWZpYw0KPiBkcml2ZXIsIGZvciBleGFtcGxlIGl0IGNvdWxkIGJlIGRvbmUgaW4gdGhlIERNSUMg
ZHJpdmVyLg0KDQpIaSBCcm93biwNCg0KU28geW91IHN1Z2dlc3QgdGhhdCB3ZSB1c2Ugc291bmQv
c29jL2NvZGVjcy9kbWljLmMgdG8gY29udHJvbCB0aGUgZGVsYXkNCmFmdGVyIHJlY29yZGluZz8N
CklmIHNvLCBzaG91bGQgd2UgYWRkIG9uZSBtb3JlIENPREVDKCdkbWljLWNvZGVjJyBhbmQgJ2Rt
aWMtaGlmaScpIHRvDQpkbWljJ3MgZGFpLWxpbms/IEl0IGxvb2tzIGxpbmsgZG1pYy5jIGhhcyBo
ZWxwZWQgdXMgZG8gc29tZXRoaW5nIHRvDQpjb250cm9sIGRtaWNzLg0K

