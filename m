Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F4D1538C3
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 20:09:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16EB81683;
	Wed,  5 Feb 2020 20:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16EB81683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580929751;
	bh=87k7ob1fyzEs7fi1VVNk4F0KSJuRO4xoNKk7ktxtkws=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WaKWZZsJtFc2X3/X+KgCIa1Ty/DL9bSbKDKhdstB8VTwYdlGqM2g5S7DB5+I54188
	 dH2ksJMrRcZmCMuwua53V7etyQ70y3HbJ6/bhZ33VaH4JEKJaQAcumHvKSyZPpn1b+
	 hhjTVk8qwj4C44++GvtO7KpGc6SIrC71HUirG1gE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2746EF800AB;
	Wed,  5 Feb 2020 20:07:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49468F80148; Wed,  5 Feb 2020 20:07:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30C1AF800AB
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 20:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30C1AF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="pYH50PnM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=WkB7OR5Zis9QB/dWPepcJ8WTki6yzNa8ER+yG7H7czQ=; b=pYH50PnMrS5rzNfBwAvHTi09SC
 TY9fpT118JsKG7Bj6J+/dqdlHJwN8/PYYAuEFVCRUKL6S9Za1uNiZ8PwKA7rjw3gmkEI7+ImnEPnd
 ZqSvGfUh1gMMtlnJMKo6zJxBuYclJCQc2QcLKHPHwkRdbcirtBW3R7PnMCQTDZVp+nf4=;
Received: from [10.8.10.223] (helo=work)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1izQ13-000Ac0-8t; Wed, 05 Feb 2020 22:07:13 +0300
Message-ID: <6cb1135be692d460256de2cf65b0a023eea1295e.camel@tsoy.me>
From: Alexander Tsoy <alexander@tsoy.me>
To: Tobias <toszlanyi@yahoo.de>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Date: Wed, 05 Feb 2020 22:07:12 +0300
In-Reply-To: <d9cdf599-6e53-29bc-e42f-a2a8acee85be@yahoo.de>
References: <9457db14-4084-c0dd-5c89-821b35c3db66.ref@yahoo.de>
 <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
 <697208e751dcbcc70cf00af7b625a4109b9c66cb.camel@tsoy.me>
 <a0e87326-839d-76df-dfd1-6d571017fc27@yahoo.de>
 <6a0079e3343a6bc860b495d9258fada061bf83ba.camel@tsoy.me>
 <1697977016.25666627.1579681629054@mail.yahoo.com>
 <d9cdf599-6e53-29bc-e42f-a2a8acee85be@yahoo.de>
User-Agent: Evolution 3.32.5 
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>
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

0JIg0J/QvSwgMDMvMDIvMjAyMCDQsiAxMToyMyArMDEwMCwgVG9iaWFzINC/0LjRiNC10YI6Cj4g
RGVhciBBbGV4YW5kZXIgLSB1bmZvcnR1bmF0ZWx5IEkgZGlkIGhvdCBoZWFyIGJhY2sgZnJvbSB5
b3UuIEkgZ3Vlc3MgCj4gdGhpcyBtYXkgbm90IGJlIHlvdXIgaGlnaGVzdCBwcmlvcml0eSBidXQg
c3RpbGwgLSBkbyB5b3UgaGF2ZSBhbnkKPiBvdGhlciAKPiBpZGVhIHRvIG1ha2UgdGhlIE1DNzAw
MCBzb3VuZCBkZXZpY2Ugd29ya2luZz8gVGhhbmtzIGEgbG90LgoKSSB0aGluayBpdCBzaG91bGQg
YmUgc2FmZSB0byBpZ25vcmUgY2xvY2sgdmFsaWRpdHkgY2hlY2sgcmVzdWx0IGlmOgotIG9ubHkg
b25lIHNpbmdsZSBzYW1wbGUgcmF0ZSBpcyBzdXBwb3J0ZWQ7Ci0gdGhlIGNsb2NrIHNvdXJjZSBp
cyBpbnRlcm5hbCwKLSB0aGVyZSBpcyBubyBjbG9jayBzZWxlY3Rvci4KCkNvdWxkIHlvdSB0cnkg
dGhlIGZvbGxvd2luZyBwYXRjaD8KCgpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL2Nsb2NrLmMgYi9z
b3VuZC91c2IvY2xvY2suYwppbmRleCAwMThiMWVjYjU0MDQuLjYzNmMzNDBkNGY5ZiAxMDA2NDQK
LS0tIGEvc291bmQvdXNiL2Nsb2NrLmMKKysrIGIvc291bmQvdXNiL2Nsb2NrLmMKQEAgLTE5Nyw2
ICsxOTcsMzggQEAgc3RhdGljIGJvb2wgdWFjX2Nsb2NrX3NvdXJjZV9pc192YWxpZChzdHJ1Y3Qg
c25kX3VzYl9hdWRpbyAqY2hpcCwKIAlyZXR1cm4gZGF0YSA/IHRydWUgOiAgZmFsc2U7CiB9CiAK
Ky8qCisgKiBBc3N1bWUgdGhlIGNsb2NrIGlzIHZhbGlkIGlmIGNsb2NrIHNvdXJjZSBzdXBwb3J0
cyBvbmx5IG9uZSBzaW5nbGUgc2FtcGxlCisgKiByYXRlLCBpdHMgdHlwZSBpcyBub3QgZXh0ZXJu
YWwgYW5kIHRoZXJlIGlzIG5vIGNsb2NrIHNlbGVjdG9yLiBUaGlzIGlzIG5lZWRlZAorICogZm9y
IHNvbWUgRGVub24gREogY29udHJvbGxlcnMsIHRoYXQgYWx3YXlzIHJlcG9ydCB0aGF0IGNsb2Nr
IGlzIGludmFsaWQuCisgKi8KK3N0YXRpYyBib29sIHVhY19jbG9ja19zb3VyY2VfaXNfdmFsaWRf
cXVpcmsoc3RydWN0IHNuZF91c2JfYXVkaW8gKmNoaXAsCisJCQkJCSAgICBzdHJ1Y3QgYXVkaW9m
b3JtYXQgKmZtdCwKKwkJCQkJICAgIGludCBjbG9jaykKK3sKKwlpZiAoZm10LT5wcm90b2NvbCA9
PSBVQUNfVkVSU0lPTl8zKSB7CisJCXN0cnVjdCB1YWMzX2Nsb2NrX3NvdXJjZV9kZXNjcmlwdG9y
ICpjc19kZXNjID0KKwkJCXNuZF91c2JfZmluZF9jbG9ja19zb3VyY2VfdjMoY2hpcC0+Y3RybF9p
bnRmLCBjbG9jayk7CisKKwkJaWYgKCFjc19kZXNjKQorCQkJcmV0dXJuIGZhbHNlOworCisJCXJl
dHVybiAoZm10LT5ucl9yYXRlcyA9PSAxICYmCisJCQkoZm10LT5jbG9jayAmIDB4ZmYpID09IGNz
X2Rlc2MtPmJDbG9ja0lEICYmCisJCQkoY3NfZGVzYy0+Ym1BdHRyaWJ1dGVzICYgMHgxKSAhPSBV
QUMzX0NMT0NLX1NPVVJDRV9UWVBFX0VYVCk7CisJfSBlbHNlIHsgLyogVUFDX1ZFUlNJT05fMiAq
LworCQlzdHJ1Y3QgdWFjX2Nsb2NrX3NvdXJjZV9kZXNjcmlwdG9yICpjc19kZXNjID0KKwkJCXNu
ZF91c2JfZmluZF9jbG9ja19zb3VyY2UoY2hpcC0+Y3RybF9pbnRmLCBjbG9jayk7CisKKwkJaWYg
KCFjc19kZXNjKQorCQkJcmV0dXJuIGZhbHNlOworCisJCXJldHVybiAoZm10LT5ucl9yYXRlcyA9
PSAxICYmCisJCQkoZm10LT5jbG9jayAmIDB4ZmYpID09IGNzX2Rlc2MtPmJDbG9ja0lEICYmCisJ
CQkoY3NfZGVzYy0+Ym1BdHRyaWJ1dGVzICYgMHgzKSAhPSBVQUNfQ0xPQ0tfU09VUkNFX1RZUEVf
RVhUKTsKKwl9Cit9CisKIHN0YXRpYyBpbnQgX191YWNfY2xvY2tfZmluZF9zb3VyY2Uoc3RydWN0
IHNuZF91c2JfYXVkaW8gKmNoaXAsIGludCBlbnRpdHlfaWQsCiAJCQkJICAgdW5zaWduZWQgbG9u
ZyAqdmlzaXRlZCwgYm9vbCB2YWxpZGF0ZSkKIHsKQEAgLTU3Nyw3ICs2MDksOCBAQCBzdGF0aWMg
aW50IHNldF9zYW1wbGVfcmF0ZV92MnYzKHN0cnVjdCBzbmRfdXNiX2F1ZGlvICpjaGlwLCBpbnQg
aWZhY2UsCiAKIHZhbGlkYXRpb246CiAJLyogdmFsaWRhdGUgY2xvY2sgYWZ0ZXIgcmF0ZSBjaGFu
Z2UgKi8KLQlpZiAoIXVhY19jbG9ja19zb3VyY2VfaXNfdmFsaWQoY2hpcCwgZm10LT5wcm90b2Nv
bCwgY2xvY2spKQorCWlmICghdWFjX2Nsb2NrX3NvdXJjZV9pc192YWxpZChjaGlwLCBmbXQtPnBy
b3RvY29sLCBjbG9jaykgJiYKKwkgICAgIXVhY19jbG9ja19zb3VyY2VfaXNfdmFsaWRfcXVpcmso
Y2hpcCwgZm10LCBjbG9jaykpCiAJCXJldHVybiAtRU5YSU87CiAJcmV0dXJuIDA7CiB9CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
