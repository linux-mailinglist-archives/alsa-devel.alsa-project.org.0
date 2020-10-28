Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 489A029CF41
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 10:41:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C667C1674;
	Wed, 28 Oct 2020 10:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C667C1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603878073;
	bh=NyaGgpuufUFBzrnTMBUGoQ6YITkAhsSqrfDv+fq13JE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYeeScA3hda/iIKyKMzVg8gs8XDSVBcyzFw5H/9y0jcMRjVuojhVHzzV5OVfDxh2i
	 fFagTB9Lj4fexcyCnq/skAfHCf+Zm2GmFYOAYUCOX/ar65do/+XwxAMmyyqkiSNedM
	 YcLGSL14oVkW60nFoZln+ZE2o0IhooqoiNfI3/0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB818F800FF;
	Wed, 28 Oct 2020 10:39:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F7BAF80212; Wed, 28 Oct 2020 10:39:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 70868F80134
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 10:39:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70868F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="E3RWoJ+g"
X-UUID: 15eb97178be0456589c47dcd84e5fbc1-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NyaGgpuufUFBzrnTMBUGoQ6YITkAhsSqrfDv+fq13JE=; 
 b=E3RWoJ+g4b0gquhyhIuM7PH2q26KAvPWUORHWpHdgpJuxD8G7BFerS1PbsbuRVyUl0JPBXEVwoz3KPZPfk+BpqEBJeHGeysuF6rzmvj8C6/GvctZdO0SwEwGMCmLuRMgwIfdqcQCghUC4JuVcIu7TYeWEQpBiuGmkdUNZdPvjLI=;
X-UUID: 15eb97178be0456589c47dcd84e5fbc1-20201028
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1967009791; Wed, 28 Oct 2020 17:39:26 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 28 Oct 2020 17:39:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Oct 2020 17:39:23 +0800
Message-ID: <1603877963.26523.10.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] ASoC: mt6359: skip first time data at the beginning
 of DMIC recording
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 28 Oct 2020 17:39:23 +0800
In-Reply-To: <20201027131519.GA4895@sirena.org.uk>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com>
 <20201026123325.GC7402@sirena.org.uk> <1603794538.26523.6.camel@mhfsdcap03>
 <20201027131519.GA4895@sirena.org.uk>
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

T24gVHVlLCAyMDIwLTEwLTI3IGF0IDEzOjE1ICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBUdWUsIE9jdCAyNywgMjAyMCBhdCAwNjoyODo1OFBNICswODAwLCBKaWF4aW4gWXUgd3JvdGU6
DQo+ID4gT24gTW9uLCAyMDIwLTEwLTI2IGF0IDEyOjMzICswMDAwLCBNYXJrIEJyb3duIHdyb3Rl
Og0KPiANCj4gPiA+IFRoaXMgc2VlbXMgbGlrZSBzb21ldGhpbmcgdGhhdCB3b3VsZCBhcHBseSBl
cXVhbGx5IHRvIGFsbCBETUlDcyBzbw0KPiA+ID4gc2hvdWxkIGJlIGRvbmUgYXQgYSBtb3JlIGdl
bmVyYWwgbGV2ZWwgcmF0aGVyIHRoYW4gaW4gdGhpcyBzcGVjaWZpYw0KPiA+ID4gZHJpdmVyLCBm
b3IgZXhhbXBsZSBpdCBjb3VsZCBiZSBkb25lIGluIHRoZSBETUlDIGRyaXZlci4NCj4gDQo+ID4g
U28geW91IHN1Z2dlc3QgdGhhdCB3ZSB1c2Ugc291bmQvc29jL2NvZGVjcy9kbWljLmMgdG8gY29u
dHJvbCB0aGUgZGVsYXkNCj4gPiBhZnRlciByZWNvcmRpbmc/DQo+ID4gSWYgc28sIHNob3VsZCB3
ZSBhZGQgb25lIG1vcmUgQ09ERUMoJ2RtaWMtY29kZWMnIGFuZCAnZG1pYy1oaWZpJykgdG8NCj4g
PiBkbWljJ3MgZGFpLWxpbms/IEl0IGxvb2tzIGxpbmsgZG1pYy5jIGhhcyBoZWxwZWQgdXMgZG8g
c29tZXRoaW5nIHRvDQo+ID4gY29udHJvbCBkbWljcy4NCj4gDQo+IFllcywgZXhhY3RseS4NCg0K
VGhhbmtzLCBpZiBzbywgdGhlbiB0aGUgbW9kaWZpY2F0aW9uIGlzIG1haW5seSBpbiB0aGUgbWFj
aGluZSBkcml2ZXIuDQpJIHdpbGwgc2VuZCB0aGUgUEFUQ0ggdjIgYWdhaW4gYWZ0ZXIgeW91IHJl
dmlldyB0aGUgbWFjaGluZSBkcml2ZXIgYW5kDQptZXJnZSB0aGVtLg0K

