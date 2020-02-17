Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F271160EAA
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 10:35:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8C051672;
	Mon, 17 Feb 2020 10:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8C051672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581932152;
	bh=yoyD7JQowP823Fbm9eYRRglTArmUYtNsTO0lgUvs9O4=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ys35mewcOfT0PosGXAvCRGqVYcn0is90eka+84zDpLWSeGivuMTCk8VThgR6LlSuc
	 9fg+kvqEOca1N4soe64yU96kRDpeqCxOqpgPWzZWluscdH8r6Qd6cC00RjTG8darI3
	 iX7Dmg3fmHsRZmDMzgfnqLKcl1kxNsGQwofX3M58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3458F801F4;
	Mon, 17 Feb 2020 10:34:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44912F80172; Mon, 17 Feb 2020 10:34:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE53FF80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 10:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE53FF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="Vky6TI5N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5fvZZPmA2L/TOyQGRM4Qr6BxX/Q4zyAQ6rpl6eombl8=; b=Vky6TI5NmBfw+AwQuPUx8WDrVd
 6yCkJBmdgu+2zr5EhmlCTZMhqX/yBhv8Z6E6uGRWD+lTF6YW6Ui6yGvSMLnXgOReD602Z3cOXssxN
 9ljVjg2T7Qabb7q5ehaSMoA/bn5BtPgsJKyNS36G3aCvQfVtCTpAsX3xDIfdVtdULIBA1Erdehr26
 I5qGbH1YvR2Fs5OA2nHKiRZYEnqnQQqZTg7eQqYDCy3LllZ9BGBFNUuEanNVFxB0z/OtIvgxepOXu
 nB2Wc6ALtM8+/mwoAqRwB5fXbg3ohp83R5F95vYq1BY8YAfM4srzsoiDi56+kxbsbiTCyCL+Rr8JW
 u/c184lQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <lars@metafoo.de>)
 id 1j3cmr-0004Hs-FJ; Mon, 17 Feb 2020 10:33:58 +0100
Received: from [93.104.109.112] (helo=[192.168.178.20])
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1j3cmr-000Fmt-7t; Mon, 17 Feb 2020 10:33:57 +0100
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <77884bad-81fd-f876-3f72-1f96a39d6329@perex.cz>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <d1d0be54-5bdb-0405-320a-d7e542fdbcde@metafoo.de>
Date: Mon, 17 Feb 2020 10:33:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <77884bad-81fd-f876-3f72-1f96a39d6329@perex.cz>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25725/Sun Feb 16 13:04:22 2020)
Subject: Re: [alsa-devel] DMARC & gmail & cirrus.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMi8xNy8yMCA5OjQ2IEFNLCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6Cj4gSGkgYWxsLAo+Cj4g
wqDCoMKgwqB0b2RheSwgYWxsIGdtYWlsIHVzZXJzIHdlcmUgdW5zdWJzY3JpYmVkIGZyb20gdGhl
IG1haWxpbmcgbGlzdCwgCj4gYmVjYXVzZSB3ZSBoYXZlIHVzZXJzIHdobyBzZW5kcyBlLW1haWxz
IGZyb20gZG9tYWlucyB3aXRoIHRoZSBETUFSQyAKPiBwb2xpY3kgcmVqZWN0IChsaWtlIGNpcnJ1
cy5jb20pLiBUaGUgbWFpbG1hbiBjb3VudHMgdGhvc2UgYm91bmNlcyBhbmQgCj4gdW5zdWJzY3Jp
YmUgdXNlcnMgd2hvIGRvIG5vdCByZWNlaXZlIHRob3NlIGUtbWFpbHMuIFRoZSBuaWNlIAo+IGV4
cGxhbmF0aW9uIGlzIGhlcmU6Cj4KPiBodHRwczovL3d3dy5saW51eGNoaXgub3JnL2NvbnRlbnQv
bWFpbGluZy1saXN0LWNoYW5nZXMKPgo+IMKgwqDCoMKgSSBjYW4gZW5hYmxlIHRoZSAiUmVwbGFj
ZSB0aGUgRnJvbTogaGVhZGVyIGFkZHJlc3MiIGluIHRoZSBtYWlsbWFuIAo+IGNvbmZpZyB0byAi
TXVuZ2UgRnJvbSIgbGlrZSBpbiB0aGUgYWJvdmUgZXhhbXBsZSwgYnV0IGl0IHdpbGwgbWVhbiAK
PiB0aGF0IEZyb206IHdpbGwgYmUgYWx0ZXJlZCAoc2VlIHRoZSBleHBsYW5hdGlvbikuCj4KPiDC
oMKgwqDCoEFub3RoZXIgb3B0aW9uIGlzIHRvIGRpc2FibGUgdGhlIGJvdW5jZSBjaGVjayBpbiBt
YWlsbWFuLCBidXQgaXQgCj4gd2lsbCBjYXVzZSB0aGF0IHRoZSAiZGVhZCIgc3Vic2NyaWJlcnMg
YXJlIG5vdCBkZXRlY3RlZCBhbnltb3JlLgo+Cj4gwqDCoMKgwqBBbnkgb3BpbmlvbnMgb24gdGhp
cz8KPgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEphcm9zbGF2IAoK
VGhlIHdheSBJIHVuZGVyc3RhbmQgaXQgb3B0aW9uIDIgd291bGQgYWxzbyBtZWFuIHRoYXQgbm9i
b2R5IGF0IGEgCnNlcnZpY2UgcHJvdmlkZXIgdGhhdCBpbXBsZW1lbnRzIERNQVJDIGNoZWNrcyBv
biB0aGUgcmVjZWl2ZXIgc2lkZSB3b3VsZCAKcmVjZWl2ZSBtYWlsIHNlbnQgdG8gdGhlIGxpc3Qg
YnkgcGVvcGxlIHVzaW5nIGEgc2VydmljZSBwcm92aWRlciB0aGF0IApoYXMgYSByZWplY3QgcG9s
aWN5IGZvciBvdXRnb2luZyBtYWlscy4gRS5nLiBpbiB5b3VyIGV4YW1wbGUgd2hpbGUgZ21haWwg
CnVzZXJzIHdvdWxkIG5vdCBiZSB1bnN1YnNjcmliZWQgZnJvbSB0aGUgbWFpbGluZy1saXN0LCBi
dXQgdGhleSBzdGlsbCAKd291bGRuJ3QgcmVjZWl2ZSB0aGUgbWFpbHMgc2VudCBmcm9tIGNpcnJ1
cy5jb20uIFdoaWNoIGtpbmQgb2YgbWFrZXMgdGhlIAptYWlsaW5nbGlzdCB1c2VsZXNzLgoKVGhl
IHdheSBJIHVuZGVyc3RhbmQgdGhlIG9wdGlvbiB0byByZXBsYWNlIHRoZSBGcm9tOiBoZWFkZXIg
aXMgdGhhdCBpdCAKd2lsbCBvbmx5IGhhcHBlbiBmb3IgdGhvc2UgdGhhdCBoYXZlIGEgcmVqZWN0
IHBvbGljeSwgZm9yIGV2ZXJ5Ym9keSBlbHNlIApub3RoaW5nIGNoYW5nZXMuIFNvIGlmIHRoZSBt
YWlsaW5nbGlzdCBpcyBzdXBwb3NlZCB0byBzdGF5IHVzZWZ1bCBmb3IgCnRob3NlIHdpdGggYSBy
ZWplY3QgcG9saWN5IHRoZSBvbmx5IG9wdGlvbiBpcyB0byByZXdyaXRlIHRoZSBmcm9tIGhlYWRl
ciAKZm9yIHRoZW0uCgotIExhcnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
