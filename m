Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8A155E88
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 20:13:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB50616BE;
	Fri,  7 Feb 2020 20:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB50616BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581102794;
	bh=YBJBg0Y/HPk+1+NrfoBOFd0U+QZT16uNhbu9r69Knss=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AzCK0MD6mjVXHuEGz48kTWBjFDs+1rg8zo1lRhSitpNFC6SATLmDw2VZ01g007hDN
	 L+UC+ApZZsOuFh6wvcumGHSjNhlXFbuDycKmF5J2l2YS8dMs0hFNcmhWcK135DNnC4
	 ZNOu8sWaopBX9tsEXIDYGeu9hOCM6VBpjOf5eBos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7962F800AB;
	Fri,  7 Feb 2020 20:11:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DA57F80148; Fri,  7 Feb 2020 20:11:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C40B4F800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 20:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C40B4F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="XVj1Wyvp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=KTGkgIeg8Tu/VYe0CMvBk+ZMEYmCOMIfPcplZJvvtm8=; b=XVj1Wyvp432avPdgXTlU/Trvi0
 Qv735nSoxB2ajWkj4Gz9ldMorHDJ/7Fh1amU1ROMFqbAmGZOIy6vP0hqFlwSYMwVoIZ98kww1J96J
 8EjzeH7sBB1cGtzB87VFkNJl6nZgbar10SPWdKgniFgQmxz/OpnGKRcHGmUIWHx7Izxk=;
Received: from [10.8.10.223] (helo=work)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1j092C-0017hg-Kn; Fri, 07 Feb 2020 22:11:24 +0300
Message-ID: <b4712d597701376f35018d7a410179a3c88ba939.camel@tsoy.me>
From: Alexander Tsoy <alexander@tsoy.me>
To: Tobias <toszlanyi@yahoo.de>
Date: Fri, 07 Feb 2020 22:11:23 +0300
In-Reply-To: <22fd2407-4935-1eb6-c59c-95a9b6d324d0@yahoo.de>
References: <9457db14-4084-c0dd-5c89-821b35c3db66.ref@yahoo.de>
 <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
 <697208e751dcbcc70cf00af7b625a4109b9c66cb.camel@tsoy.me>
 <a0e87326-839d-76df-dfd1-6d571017fc27@yahoo.de>
 <6a0079e3343a6bc860b495d9258fada061bf83ba.camel@tsoy.me>
 <1697977016.25666627.1579681629054@mail.yahoo.com>
 <d9cdf599-6e53-29bc-e42f-a2a8acee85be@yahoo.de>
 <6cb1135be692d460256de2cf65b0a023eea1295e.camel@tsoy.me>
 <05edff76-729f-0ffa-9a2b-908fa42c24d8@yahoo.de>
 <84ddb2438f13cc8c4a08aaffbca9faaec679c067.camel@tsoy.me>
 <s5htv42vmmt.wl-tiwai@suse.de>
 <73ec40e6-3b76-0bc3-8bd2-6146e0499fdc@yahoo.de>
 <154d6930f2b816819650f69fa86bf71b59c65251.camel@tsoy.me>
 <22fd2407-4935-1eb6-c59c-95a9b6d324d0@yahoo.de>
User-Agent: Evolution 3.32.5 
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] USB Audio Interface / Denon MC7000 and MC8000
 controller
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

0JIg0J/RgiwgMDcvMDIvMjAyMCDQsiAxOTo0OSArMDEwMCwgVG9iaWFzINC/0LjRiNC10YI6Cj4g
RGVhciBBbGV4YW5kZXIgLSB1bmZvcnR1bmF0ZWx5IHRoZSBwYXRjaCBkb2Vzbid0IHdhbnQgdG8g
YmUgYXBwbGllZC4KCkl0IHNlZW1zIEkgY29waWVkIGl0IGZyb20gbGVzcyB3aXRoIGRpZmZlcmVu
dCB0YWIgd2lkdGguIFRoZSBwYXRjaApiZWxvdyBzaG91bGQgYmUgT0suCgo+IAo+ICQgcGF0Y2gg
LXAxIDwgLi4vZGVub24tNC5wYXRjaAo+IHBhdGNoaW5nIGZpbGUgc291bmQvdXNiL2Nsb2NrLmMK
PiBIdW5rICMxIEZBSUxFRCBhdCAxODcuCj4gMSBvdXQgb2YgMSBodW5rIEZBSUxFRCAtLSBzYXZp
bmcgcmVqZWN0cyB0byBmaWxlCj4gc291bmQvdXNiL2Nsb2NrLmMucmVqCj4gCj4gSSBndWVzcyBp
dCB3YXMgbm90IHlvdXIgaW50ZW50aW9uIG9ubHkgYWRkaW5nIG9uZSBsaW5lIHRvIAo+IC9zb3Vu
ZC91c2IvY2xvY2suYy4gc28gd2hhdCBhbSBJIG1pc3NpbmcgaGVyZT8KCk5vLCBpdCB3YXMgaW50
ZW50aW9uYWwuIFRoaXMgcGF0Y2gganVzdCBhZGRzIHByaW50aW5nIG9mIHNvbWUgaW5mbyBJCm5l
ZWQgaW4gdGhlIGZvbGxvd2luZyBmb3JtYXQ6Cgp1YWNfY2xvY2tfc291cmNlX2lzX3ZhbGlkKCk6
IGVycjogWCA7IGRhdGE6IFgKCgpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL2Nsb2NrLmMgYi9zb3Vu
ZC91c2IvY2xvY2suYwppbmRleCAwMThiMWVjYjU0MDQuLjY1ZWU1YzI0YzVkMSAxMDA2NDQKLS0t
IGEvc291bmQvdXNiL2Nsb2NrLmMKKysrIGIvc291bmQvdXNiL2Nsb2NrLmMKQEAgLTE4Nyw2ICsx
ODcsOCBAQCBzdGF0aWMgYm9vbCB1YWNfY2xvY2tfc291cmNlX2lzX3ZhbGlkKHN0cnVjdCBzbmRf
dXNiX2F1ZGlvICpjaGlwLAogCQkJICAgICAgc25kX3VzYl9jdHJsX2ludGYoY2hpcCkgfCAoc291
cmNlX2lkIDw8IDgpLAogCQkJICAgICAgJmRhdGEsIHNpemVvZihkYXRhKSk7CiAKKwlkZXZfaW5m
bygmZGV2LT5kZXYsICIlcygpOiBlcnI6ICVkIDsgZGF0YTogJWRcbiIsIF9fZnVuY19fLCBlcnIs
IGRhdGEpOworCiAJaWYgKGVyciA8IDApIHsKIAkJZGV2X3dhcm4oJmRldi0+ZGV2LAogCQkJICIl
cygpOiBjYW5ub3QgZ2V0IGNsb2NrIHZhbGlkaXR5IGZvciBpZCAlZFxuIiwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
