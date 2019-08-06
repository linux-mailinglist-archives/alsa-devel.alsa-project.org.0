Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D28356E
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:38:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7AF11660;
	Tue,  6 Aug 2019 17:37:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7AF11660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565105884;
	bh=b5I0z5DeEItDa5OkGs3Uc/psFLWhkxZwF+0Di/vYIEU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bBsF/sjC7bvboPDqj0HtaTzM50GwHUn3rSZasjinzMqjjBU7OcpamXoT+CQLFyAEl
	 rbzJgX1geZXljBmZJz7mhVig+EoxALReYmTliOvA2hab2hLm9WqtMbQ+GYqPPpeflt
	 vQXl+ewIz9Z1DYyLssAo4VdfiiFjY5xmNN60XqAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5A9CF80483;
	Tue,  6 Aug 2019 17:36:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A54F80483; Tue,  6 Aug 2019 17:36:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6E9EF800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6E9EF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MyaF49MA"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A09320A14;
 Tue,  6 Aug 2019 11:36:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Aug 2019 11:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=iK/z60jrLmYRc+O4E3Nos+6cVOv911VE97RTFSdWH
 hM=; b=MyaF49MAMdNKuF+ZftabP82lpabcybV4Pw6mrk0Af+LQkBh+V77Wduk7g
 FGTfVIJ1Uwyys6STQz5JFZIoZbf8UF9Onzqy5PaWoinIV0T2DZ0P6q6aALRUMjML
 vLiBdBL24P9UcAaSgAqZ+jU6rQmZl4qaV+Mobvs0IZKYnz5c0vWRd+DmuPhKtUBe
 wpQrIMWo+NU9Mu7NPdSj9JAPEBr3cXR6Uu2LBaPSeVIv6yorpWdc8OtL2WCsay0y
 u64oCDDeIqEevi/Ki3UY8ZXdsgiYnM0o2z43jZOiTgth57FuNI7gKX95a30GUy45
 4gFtGXd206jFfs1In+Bl2pvev0rBA==
X-ME-Sender: <xms:bJ5JXb-vixvWpzE_aJ5SDkJJIuwaZ5ieUDNaOcRnd6NSq1ozGLlBsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddutddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomhepvfgrnhhu
 ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehlih
 gsvghrrghprgihrdgtohhmpdhmvghgrgdqnhgvrhgurdgtohhmpdhrvghpohhlohhghidr
 ohhrghdprghlshgrqdhprhhojhgvtghtrdhorhhgpdhprghtrhgvohhnrdgtohhmnecukf
 hppeduleeirddvgeegrdduledurddutdeinecurfgrrhgrmhepmhgrihhlfhhrohhmpeht
 rghnuhhksehikhhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:bJ5JXZnWYUM3hhKcrWXzxFBM4cyOy11yOSWkE5xluhstCkVccMPoMA>
 <xmx:bJ5JXdoRQiXVtu5qh5TlSw4twcYZ4ayTOIqj6dSzw5GNgkHLcYDDdQ>
 <xmx:bJ5JXV--jE3zIbkhNuNOz5NvuRibSsv1y5xDOXsjfqcUzWhGhP8hng>
 <xmx:bZ5JXcnoSuYUUtfLqKPFrPyJoDhaLIEa2bX_KLj7yOp6yB36QYoLvw>
Received: from laptop (unknown [196.244.191.106])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F2A838009E;
 Tue,  6 Aug 2019 11:36:11 -0400 (EDT)
Message-ID: <5509faf2dabd477bb2a5a35f249d6ed689611b8e.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: karina filer <kafiler0911@gmail.com>, alsa-devel@alsa-project.org
Date: Tue, 06 Aug 2019 18:36:06 +0300
In-Reply-To: <5e969a5245d6922d28d71a7c453dd6e3f5fd2228.camel@iki.fi>
References: <CAM+cExGffwFD7U--tZqd_PxFwgdy6YA_tZHvw6B3au9KNygEhA@mail.gmail.com>
 <CAM+cExEBpgWctFLKcVej9UnLS2VVx9CoaOigu9y3BvYGNOi1zA@mail.gmail.com>
 <5e969a5245d6922d28d71a7c453dd6e3f5fd2228.camel@iki.fi>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] Alsa-Plugin 1.0.25 License
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

T25lIG1vcmUgY29tbWVudC4uLgoKT24gVHVlLCAyMDE5LTA4LTA2IGF0IDE2OjIwICswMzAwLCBU
YW51IEthc2tpbmVuIHdyb3RlOgo+IE9uIE1vbiwgMjAxOS0wOC0wNSBhdCAyMjo0NCArMDUzMCwg
a2FyaW5hIGZpbGVyIHdyb3RlOgo+ID4gSGkgVGVhbSwKPiA+IAo+ID4gR3JlZXRpbmdzICEhCj4g
PiAKPiA+IEkgYW0gZmFjaW5nIGRpZmZpY3VsdHkgdG8gdW5kZXJzdGFuZCB0aGUgQWxzYS1QbHVn
aW4gTGljZW5zaW5nLCBDb3VsZCB5b3UKPiA+IHBsZWFzZSBoZWxwIG1lIHRvIG1ha2UgdW5kZXJz
dGFuZD8sIElzIGl0IHVuZGVyIEdQTCAyLjAgb3IgTEdQTCAyLjEgYmVjYXVzZQo+ID4gYWZ0ZXIg
ZXh0cmFjdGluZyB0aGUgZm9sZGVyIEkgY2FuIHNlZSAyIGNvcHlpbmcgZmlsZSBvbmUgZm9yIEdQ
TCBhbmQgb3RoZXIKPiA+IGZvciBMR1BMLgo+ID4gCj4gPiBodHRwczovL3JlcG9sb2d5Lm9yZy9w
cm9qZWN0L2Fsc2EtcGx1Z2lucy9wYWNrYWdlcwo+IAo+IGFsc2EtcGx1Z2lucyBzZWVtcyB0byBs
YWNrIGEgUkVBRE1FIG9yIG90aGVyIG92ZXJ2aWV3IGRvY3VtZW50IGFib3V0Cj4gdGhlIGxpY2Vu
c2luZy4uLiBhbHNhLXBsdWdpbnMgaXMgcHJpbWFyaWx5IGxpY2Vuc2VkIHVuZGVyIExHUEwgMi4x
LCBhbmQKPiB0byBteSBrbm93bGVkZ2UgdGhlIG9ubHkgZXhjZXB0aW9uIGlzIHRoZSBsaWJzYW1w
bGVyYXRlIGJhc2VkIHJhdGUKPiBwbHVnaW4uIFRoZSBsaWNlbnNpbmcgaXMgZXhwbGFpbmVkIGhl
cmU6Cj4gCj4gaHR0cHM6Ly9naXQuYWxzYS1wcm9qZWN0Lm9yZy8/cD1hbHNhLXBsdWdpbnMuZ2l0
O2E9YmxvYjtmPXJhdGUvcmF0ZV9zYW1wbGVyYXRlLmMKPiAKPiBTbyB0aGlzIHBhcnRpY2x1YXIg
cmF0ZSBwbHVnaW4gaXMgbGljZW5zZWQgdW5kZXIgR1BMIDIuMCAidG8gZm9sbG93IHRoZQo+IGxp
Y2Vuc2Ugb2YgbGlic2FtcGxlcmF0ZSIsIHVubGVzcyB5b3UgaGF2ZSBhIGNvbW1lcmNpYWwgbGlj
ZW5zZSB0bwo+IGxpYnNhbXBsZXJhdGUuIEkgZG9uJ3QgdGhpbmsgdGhlIHJhdGlvbmFsZSBmb3Ig
dGhhdCBleGNlcHRpb24gbWFrZXMKPiBtdWNoIHNlbnNlIChMR1BMIHdvdWxkIGhhdmUgd29ya2Vk
IGp1c3QgZmluZSwgYXMgZmFyIGFzIEkgY2FuIHRlbGwpLAo+IGJ1dCBhdCB0aGlzIHBvaW50IHJl
bGljZW5zaW5nIG1heSBiZSB2ZXJ5IGRpZmZpY3VsdCBkdWUgdG8gbWFueQo+IGNvbnRyaWJ1dG9y
cy4KClJlbGljZW5zaW5nIHNob3VsZG4ndCBiZSB0aGF0IGhhcmQgYWZ0ZXIgYWxsLCBpZiB0aGF0
J3MgZGVzaXJlZCAoSQp0aGluayBpdCB3b3VsZCBiZSBhIGdvb2QgaWRlYSkuIE5vdyB0aGF0IEkg
bG9va2VkLCB0aGVyZSBhY3R1YWxseQphcmVuJ3QgbWFueSBjb250cmlidXRvcnMgdG8gdGhhdCBw
bHVnaW4sIG9ubHkgVGFrYXNoaSBhbmQgSmFyb3NsYXYuCkRpZWdvIEUuICdGbGFtZWV5ZXMnIFBl
dHRlbsOyIGFsc28gaGFzIGEgY29tbWl0LCBidXQgaXQgb25seSBjaGFuZ2VzIG9uZQpsaW5lIGlu
IHRoZSBidWlsZCBzeXN0ZW0uCgo+IGxpYnNhbXBsZXJhdGUgd2FzIHJlbGljZW5zZWQgdW5kZXIg
dGhlIDItY2xhdXNlIEJTRCBsaWNlbnNlIGluIDIwMTZbMV0sCj4gd2hpY2ggbWF5IG9yIG1heSBu
b3QgYWxsb3cgeW91IHRvIGFwcGx5IExHUEwgdG8gdGhlIHJhdGUgcGx1Z2luIChteQo+IGd1ZXNz
IHdvdWxkIGJlIHRoYXQgaXQgZG9lc24ndCBhbGxvdyB5b3UgdG8gZG8gdGhhdCwgYnV0IElBTkFM
KS4KPiAKPiBbMV0gaHR0cDovL3d3dy5tZWdhLW5lcmQuY29tL1NSQy9saWNlbnNlLmh0bWwKCi0t
IApUYW51CgpodHRwczovL3d3dy5wYXRyZW9uLmNvbS90YW51awpodHRwczovL2xpYmVyYXBheS5j
b20vdGFudWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
