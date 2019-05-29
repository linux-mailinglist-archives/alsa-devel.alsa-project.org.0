Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 440732D9CC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 11:59:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A8716A0;
	Wed, 29 May 2019 11:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A8716A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559123973;
	bh=EMX4qNrNh0y04KAljYj9fK+eKqhmz/pYzOijeESuo6E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=omM53/rCIsL708LyG9pun+mhrc3j6rnvOJDH4IWm0emHT5GYn/M7jCjCizEZQqMS3
	 1MJS/3pVRUkBTOrrN8MPBiSVG0KtaQoR7u7xmOYd6W76s7ROwUTgHC5gm33SWDX7Q9
	 6lxce/8rFf3tyb19mZJD9w3vjCl/WMX+bkIhCzQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD6CF896E4;
	Wed, 29 May 2019 11:57:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DB26F896E4; Wed, 29 May 2019 11:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3EC2F8065A
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 11:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3EC2F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mn/7Y1LZ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XISi7eb0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id A37261B2A;
 Wed, 29 May 2019 05:57:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 May 2019 05:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=U
 v/IO1lpsMhYefZCZE7IzUSu7PAH6TRG1LbnuRgviM4=; b=mn/7Y1LZeF5WEZX9C
 kyxZtrcWF3ULGfrAWaVTCu5SVtlugVE3VqZmjWKq6xRLw16HfohMo8gWCyfoiTDU
 8ddDr3hcah8IDP6Hys4o8IC2EdotB5aWhP8EraoIMIJh7rSxM+BKMMZLl9NkVZnK
 u8d8d3Tq/d+bMYPb6BDrLZqiB9tpWxyCpNDdk+W8+YDBdrWfUs98RZG9TU53K7Dz
 JzBTbjFIf3kdd64Cj3KvVjOeVIk0m+zXZwZfm3VO+qvQIqvJ5VIncx8ff7FI9cB1
 yNg71nTx/SLC0V1NRLStXOGxLLLNq2SftFdwZcoJwvxVzm0f9yJ9xJHcvbMQXOqS
 f9JWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Uv/IO1lpsMhYefZCZE7IzUSu7PAH6TRG1LbnuRgvi
 M4=; b=XISi7eb0l5udJyx94Grx8xbNBu9uDmTspw9Ab8MZI6lurhPep2RI+RxCG
 ZQTte0gx97SzC5lbqL/OsmzePdtwqlKhCnCKwx+J0wQH/g8awSkdq4a1owukWtLA
 pSl7na4swI9Jn5vGwVD9JNDTU+FqQo7zHiwOYrXVPzhmvKU0bhF2leedTKJqnsWJ
 ZtZ3NyH7sqtqulHulH6p8cFT/inzGk9BoRibxUJQCqYn7HfABDtSJ4wgJtcE93Dn
 ubSwIKAl5IYPjRHsfy/9y3A9uQnHlGjBxilfoFBwIobYLPZxf0MeJIy/dpZ66Cd6
 VespO6do/dcNZaF/vdhqkw+ACdFLw==
X-ME-Sender: <xms:k1fuXLxZbQcc-ANNiTUK7UBI2sL_vR5WZupSdrUc2A253Dtx8L_3pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddvjedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtreejnecuhfhrohhmpefvrghk
 rghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhho
 mhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghruf
 hiiigvpedt
X-ME-Proxy: <xmx:k1fuXDqJLSpSTXkTZTciZs27YxisYeoGB6fGIVbV6inmjPgmkZdzug>
 <xmx:k1fuXDzlPHfLKSKrwsKOVVoZfcm6NUzgWaAMmPe5QrZQEgSnVBAz3g>
 <xmx:k1fuXCurnFtFsjwzcDFGDUTFxiwmFbRMHUebTfAZecsGB5BQqUsLjQ>
 <xmx:lVfuXHp1xBd2evfpTHfjZBexRzt3oLWMlb8KBbQqAvRZxYLnnEZERg>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59261380084;
 Wed, 29 May 2019 05:57:34 -0400 (EDT)
Date: Wed, 29 May 2019 18:57:31 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20190529095730.GA7089@workstation>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Igor Konopko <igor.j.konopko@intel.com>,
 David Howells <dhowells@redhat.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Eran Ben Elisha <eranbe@mellanox.com>,
 Matias Bjorling <mb@lightnvm.io>, Jiri Pirko <jiri@mellanox.com>,
 "David S . Miller" <davem@davemloft.net>,
 Jamal Hadi Salim <jhs@mojatatu.com>,
 Cong Wang <xiyou.wangcong@gmail.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 linux-block@vger.kernel.org, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-5-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528142424.19626-5-geert@linux-m68k.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-block@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>,
 Jamal Hadi Salim <jhs@mojatatu.com>, "David S . Miller" <davem@davemloft.net>,
 David Howells <dhowells@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Joe Perches <joe@perches.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Subject: Re: [alsa-devel] [PATCH 4/5] ALSA: fireface: Use ULL suffixes for
	64-bit constants
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

SGksCgpPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNDoyNDoyM1BNICswMjAwLCBHZWVydCBVeXR0
ZXJob2V2ZW4gd3JvdGU6Cj4gV2l0aCBnY2MgNC4xOgo+IAo+ICAgICBzb3VuZC9maXJld2lyZS9m
aXJlZmFjZS9mZi1wcm90b2NvbC1sYXR0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbGF0dGVyX3N3aXRj
aF9mZXRjaGluZ19tb2Rl4oCZOgo+ICAgICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9mZi1wcm90
b2NvbC1sYXR0ZXIuYzo5Nzogd2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2Ug
Zm9yIOKAmGxvbmfigJkgdHlwZQo+ICAgICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9mZi1wcm90
b2NvbC1sYXR0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbGF0dGVyX2JlZ2luX3Nlc3Npb27igJk6Cj4g
ICAgIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jOjE3MDogd2Fy
bmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQo+
ICAgICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9mZi1wcm90b2NvbC1sYXR0ZXIuYzoxOTc6IHdh
cm5pbmc6IGludGVnZXIgY29uc3RhbnQgaXMgdG9vIGxhcmdlIGZvciDigJhsb25n4oCZIHR5cGUK
PiAgICAgc291bmQvZmlyZXdpcmUvZmlyZWZhY2UvZmYtcHJvdG9jb2wtbGF0dGVyLmM6MjA1OiB3
YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBl
Cj4gICAgIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jOiBJbiBm
dW5jdGlvbiDigJhsYXR0ZXJfZmluaXNoX3Nlc3Npb27igJk6Cj4gICAgIHNvdW5kL2ZpcmV3aXJl
L2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jOjIxNDogd2FybmluZzogaW50ZWdlciBjb25z
dGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQo+IAo+IEZpeCB0aGlzIGJ5IGFk
ZGluZyB0aGUgbWlzc2luZyAiVUxMIiBzdWZmaXhlcy4KPiBBZGQgdGhlIHNhbWUgc3VmZml4IHRv
IHRoZSBsYXN0IGNvbnN0YW50LCB0byBtYWludGFpbiBjb25zaXN0ZW5jeS4KPiAKPiBGaXhlczog
ZmQxY2M5ZGU2NGMyY2E2YyAoIkFMU0E6IGZpcmVmYWNlOiBhZGQgc3VwcG9ydCBmb3IgRmlyZWZh
Y2UgVUNYIikKPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPgo+IC0tLQo+ICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9mZi1wcm90b2NvbC1s
YXR0ZXIuYyB8IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKClRoYW5rcyBmb3IgeW91ciBjYXJlLgoKUmV2aWV3ZWQtYnk6IFRh
a2FzaGkgU2FrYW1vdG8gPG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPgoKPiBkaWZmIC0tZ2l0IGEv
c291bmQvZmlyZXdpcmUvZmlyZWZhY2UvZmYtcHJvdG9jb2wtbGF0dGVyLmMgYi9zb3VuZC9maXJl
d2lyZS9maXJlZmFjZS9mZi1wcm90b2NvbC1sYXR0ZXIuYwo+IGluZGV4IGM4MjM2ZmY4OWI3ZmI5
ZGUuLmIzMGQwMmQzNTliMWQyMWIgMTAwNjQ0Cj4gLS0tIGEvc291bmQvZmlyZXdpcmUvZmlyZWZh
Y2UvZmYtcHJvdG9jb2wtbGF0dGVyLmMKPiArKysgYi9zb3VuZC9maXJld2lyZS9maXJlZmFjZS9m
Zi1wcm90b2NvbC1sYXR0ZXIuYwo+IEBAIC05LDExICs5LDExIEBACj4gIAo+ICAjaW5jbHVkZSAi
ZmYuaCIKPiAgCj4gLSNkZWZpbmUgTEFUVEVSX1NURgkJMHhmZmZmMDAwMDAwMDQKPiAtI2RlZmlu
ZSBMQVRURVJfSVNPQ19DSEFOTkVMUwkweGZmZmYwMDAwMDAwOAo+IC0jZGVmaW5lIExBVFRFUl9J
U09DX1NUQVJUCTB4ZmZmZjAwMDAwMDBjCj4gLSNkZWZpbmUgTEFUVEVSX0ZFVENIX01PREUJMHhm
ZmZmMDAwMDAwMTAKPiAtI2RlZmluZSBMQVRURVJfU1lOQ19TVEFUVVMJMHgwMDAwODAxYzAwMDAK
PiArI2RlZmluZSBMQVRURVJfU1RGCQkweGZmZmYwMDAwMDAwNFVMTAo+ICsjZGVmaW5lIExBVFRF
Ul9JU09DX0NIQU5ORUxTCTB4ZmZmZjAwMDAwMDA4VUxMCj4gKyNkZWZpbmUgTEFUVEVSX0lTT0Nf
U1RBUlQJMHhmZmZmMDAwMDAwMGNVTEwKPiArI2RlZmluZSBMQVRURVJfRkVUQ0hfTU9ERQkweGZm
ZmYwMDAwMDAxMFVMTAo+ICsjZGVmaW5lIExBVFRFUl9TWU5DX1NUQVRVUwkweDAwMDA4MDFjMDAw
MFVMTAo+ICAKPiAgc3RhdGljIGludCBwYXJzZV9jbG9ja19iaXRzKHUzMiBkYXRhLCB1bnNpZ25l
ZCBpbnQgKnJhdGUsCj4gIAkJCSAgICBlbnVtIHNuZF9mZl9jbG9ja19zcmMgKnNyYykKPiAtLSAK
PiAyLjE3LjEKPiAKCgpSZWdhcmRzCgpUYWthc2hpIFNha2Ftb3RvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
