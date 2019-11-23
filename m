Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164F1080BE
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Nov 2019 22:11:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D66D185B;
	Sat, 23 Nov 2019 22:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D66D185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574543462;
	bh=N+mAThBycBIQYDK4kC2hPl4S5zzh9Ygr7v1T6OFzEko=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=It9KoNt6+KD37KLpFbLlQy22N80F+WMhB1Q6ascFUK1SGaly0Z+nyyRalW8OMheK8
	 CLAgnCz+U3G+e4JzmtpqtIHLq6VTOfTw3VvrOULMYbyHr21xaBDXax4M7zP9LUlYAH
	 ceOlnZ2tjAw/YjS86POKBQk7E3Y3kR79lnd0UiX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5537F8015B;
	Sat, 23 Nov 2019 22:09:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F21CF8015B; Sat, 23 Nov 2019 22:09:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A0B2F800EB
 for <alsa-devel@alsa-project.org>; Sat, 23 Nov 2019 22:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A0B2F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hzcdJe3n"
Received: by mail-lj1-x244.google.com with SMTP id y23so11270173ljh.10
 for <alsa-devel@alsa-project.org>; Sat, 23 Nov 2019 13:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vUTDzwLJEZ5e31rqYQ2YddmxPWbsZ/6DlrZVyrT6URM=;
 b=hzcdJe3niCw4ldOCm3BfL913+mivy+m5APNdxFkUKAv3+RdjyYqmY1elqHcfDut9/q
 q2gys1yc8EFQh1Umu99Ch9BRLGCL75VUsnoI6N9PDEAiFBQdjaZI9VEsAKHH6chNlWbC
 nmpnC/d6UbF/wYDUAh3+ntvpb5/LXBHUK6JJERsR8LITp70RvrGGwhzZlt59p0kAc0Yo
 XPLXG6EwZAmoyn5OeuY4Pt8w/BU4GcUrftVkVtXFaZMv1Hazo8hGC/4E23ht2MozSzJA
 eWyDK1bQEN1nZRoPxYZPGSG/jL7v/RTMAikE20eOilk1gF9wlJd1Dkh+zQu7feYwXTa3
 kb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vUTDzwLJEZ5e31rqYQ2YddmxPWbsZ/6DlrZVyrT6URM=;
 b=faUkreF+uH9eoBJWMsqlUkQ+MZtImsjN0J6kbg2rhy1YP68hjtDEaYEfQT3KzNd9bB
 SENg62Z6WQsDXHi+x4uXtm7gQ4RMkuxmurKMsrkgvEuvz9mVBe2BPvQyXNIC79Zs8XRF
 kI/MBHGdjI4MNTdY7Vn0f140d1KZOizRtZJj2ZdhmgQkK4JR7R9PzE1VCjQopkZlkV5i
 sKS9sjxyXSu7aEmFIU4Iy9kdt4MNJe+f6Fcrd3t1qJWhb7IzOC4HWkJ2jjW3EtrkDJx6
 +IszuiVKGs8iQquiLUBhJoo4654hWLbdKpLm92bEm4USwcn1/lFBrwX8Y04UvHqn8Fdf
 j6Mw==
X-Gm-Message-State: APjAAAWr/Jnhrq8gQCwtRGDryiKYgyyVF/Rd+TIMPbapFjvSyF6toMfm
 vOxOP7SZtv7vFCWJZZAUzXI=
X-Google-Smtp-Source: APXvYqy3I+WHtWo/sNzk5bilKI/KTawHty3KlA9n7AZI1PvYcBTWq1kj1B3W5Tr0Y7O9l4NRSVkqYg==
X-Received: by 2002:a2e:a404:: with SMTP id p4mr2879297ljn.234.1574543352138; 
 Sat, 23 Nov 2019 13:09:12 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id i23sm1137658lfj.71.2019.11.23.13.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Nov 2019 13:09:11 -0800 (PST)
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
Date: Sun, 24 Nov 2019 00:09:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191018154833.7560-3-ben.dooks@codethink.co.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
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

MTguMTAuMjAxOSAxODo0OCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gRnJvbTogRWR3YXJkIENy
YWdnIDxlZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+IAo+IFRoZSB0ZWdyYTMgYXVkaW8g
Y2FuIHN1cHBvcnQgMjQgYW5kIDMyIGJpdCBzYW1wbGUgc2l6ZXMgc28gYWRkIHRoZQo+IG9wdGlv
biB0byB0aGUgdGVncmEzMF9pMnNfaHdfcGFyYW1zIHRvIGNvbmZpZ3VyZSB0aGUgUzI0X0xFIG9y
IFMzMl9MRQo+IGZvcm1hdHMgd2hlbiByZXF1ZXN0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRWR3
YXJkIENyYWdnIDxlZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+IFtiZW4uZG9va3NAY29k
ZXRoaW5rLmNvLnVrOiBmaXh1cCBtZXJnZSBvZiAyNCBhbmQgMzJiaXRdCj4gW2Jlbi5kb29rc0Bj
b2RldGhpbmsuY28udWs6IGFkZCBwbSBjYWxscyBhcm91bmQgeXRkbSBjb25maWddCj4gW2Jlbi5k
b29rc0Bjb2RldGhpbmsuY28udWs6IGRyb3AgZGVidWcgcHJpbnRpbmcgdG8gZGV2X2RiZ10KPiBT
aWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+Cj4gLS0t
Cj4gc3F1YXNoIDVhZWNhNWEwNTVmZCBBU29DOiB0ZWdyYTogaTJzOiBwbV9ydW50aW1lX2dldF9z
eW5jKCkgaXMgbmVlZGVkIGluIHRkbSBjb2RlCj4gCj4gQVNvQzogdGVncmE6IGkyczogcG1fcnVu
dGltZV9nZXRfc3luYygpIGlzIG5lZWRlZCBpbiB0ZG0gY29kZQo+IC0tLQo+ICBzb3VuZC9zb2Mv
dGVncmEvdGVncmEzMF9pMnMuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jIGIvc291bmQvc29jL3RlZ3JhL3Rl
Z3JhMzBfaTJzLmMKPiBpbmRleCA3M2YwZGRkZWFlZjMuLjA2M2YzNGM4ODJhZiAxMDA2NDQKPiAt
LS0gYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+ICsrKyBiL3NvdW5kL3NvYy90ZWdy
YS90ZWdyYTMwX2kycy5jCj4gQEAgLTEyNyw3ICsxMjcsNyBAQCBzdGF0aWMgaW50IHRlZ3JhMzBf
aTJzX2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPiAgCXN0
cnVjdCBkZXZpY2UgKmRldiA9IGRhaS0+ZGV2Owo+ICAJc3RydWN0IHRlZ3JhMzBfaTJzICppMnMg
PSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShkYWkpOwo+ICAJdW5zaWduZWQgaW50IG1hc2ssIHZh
bCwgcmVnOwo+IC0JaW50IHJldCwgc2FtcGxlX3NpemUsIHNyYXRlLCBpMnNjbG9jaywgYml0Y250
Owo+ICsJaW50IHJldCwgc2FtcGxlX3NpemUsIHNyYXRlLCBpMnNjbG9jaywgYml0Y250LCBhdWRp
b19iaXRzOwo+ICAJc3RydWN0IHRlZ3JhMzBfYWh1Yl9jaWZfY29uZiBjaWZfY29uZjsKPiAgCj4g
IAlpZiAocGFyYW1zX2NoYW5uZWxzKHBhcmFtcykgIT0gMikKPiBAQCAtMTM3LDggKzEzNywxOSBA
QCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJl
YW0gKnN1YnN0cmVhbSwKPiAgCXN3aXRjaCAocGFyYW1zX2Zvcm1hdChwYXJhbXMpKSB7Cj4gIAlj
YXNlIFNORFJWX1BDTV9GT1JNQVRfUzE2X0xFOgo+ICAJCXZhbCA9IFRFR1JBMzBfSTJTX0NUUkxf
QklUX1NJWkVfMTY7Cj4gKwkJYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsK
PiAgCQlzYW1wbGVfc2l6ZSA9IDE2Owo+ICAJCWJyZWFrOwo+ICsJY2FzZSBTTkRSVl9QQ01fRk9S
TUFUX1MyNF9MRToKPiArCQl2YWwgPSBURUdSQTMwX0kyU19DVFJMX0JJVF9TSVpFXzI0Owo+ICsJ
CWF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMjQ7Cj4gKwkJc2FtcGxlX3NpemUg
PSAyNDsKPiArCQlicmVhazsKPiArCWNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMzJfTEU6Cj4gKwkJ
dmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9CSVRfU0laRV8zMjsKPiArCQlhdWRpb19iaXRzID0gVEVH
UkEzMF9BVURJT0NJRl9CSVRTXzMyOwo+ICsJCXNhbXBsZV9zaXplID0gMzI7Cj4gKwkJYnJlYWs7
Cj4gIAlkZWZhdWx0Ogo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+IEBAIC0xNzAsOCArMTgx
LDggQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19od19wYXJhbXMoc3RydWN0IHNuZF9wY21fc3Vi
c3RyZWFtICpzdWJzdHJlYW0sCj4gIAljaWZfY29uZi50aHJlc2hvbGQgPSAwOwo+ICAJY2lmX2Nv
bmYuYXVkaW9fY2hhbm5lbHMgPSAyOwo+ICAJY2lmX2NvbmYuY2xpZW50X2NoYW5uZWxzID0gMjsK
PiAtCWNpZl9jb25mLmF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4gLQlj
aWZfY29uZi5jbGllbnRfYml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPiArCWNpZl9j
b25mLmF1ZGlvX2JpdHMgPSBhdWRpb19iaXRzOwo+ICsJY2lmX2NvbmYuY2xpZW50X2JpdHMgPSBh
dWRpb19iaXRzOwo+ICAJY2lmX2NvbmYuZXhwYW5kID0gMDsKPiAgCWNpZl9jb25mLnN0ZXJlb19j
b252ID0gMDsKPiAgCWNpZl9jb25mLnJlcGxpY2F0ZSA9IDA7Cj4gQEAgLTMwNiwxNCArMzE3LDE4
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyIHRlZ3JhMzBfaTJzX2Rh
aV90ZW1wbGF0ZSA9IHsKPiAgCQkuY2hhbm5lbHNfbWluID0gMiwKPiAgCQkuY2hhbm5lbHNfbWF4
ID0gMiwKPiAgCQkucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAo+IC0JCS5mb3Jt
YXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4gKwkJLmZvcm1hdHMgPSBTTkRSVl9QQ01f
Rk1UQklUX1MzMl9MRSB8Cj4gKwkJCSAgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwKPiArCQkJ
ICAgU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4gIAl9LAo+ICAJLmNhcHR1cmUgPSB7Cj4gIAkJ
LnN0cmVhbV9uYW1lID0gIkNhcHR1cmUiLAo+ICAJCS5jaGFubmVsc19taW4gPSAyLAo+ICAJCS5j
aGFubmVsc19tYXggPSAyLAo+ICAJCS5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAs
Cj4gLQkJLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPiArCQkuZm9ybWF0cyA9
IFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFIHwKPiArCQkJICAgU05EUlZfUENNX0ZNVEJJVF9TMjRf
TEUgfAo+ICsJCQkgICBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPiAgCX0sCj4gIAkub3BzID0g
JnRlZ3JhMzBfaTJzX2RhaV9vcHMsCj4gIAkuc3ltbWV0cmljX3JhdGVzID0gMSwKPiAKCkhlbGxv
LAoKVGhpcyBwYXRjaCBicmVha3MgYXVkaW8gb24gVGVncmEzMC4gSSBkb24ndCBzZWUgZXJyb3Jz
IGFueXdoZXJlLCBidXQKdGhlcmUgaXMgbm8gYXVkaW8gYW5kIHJldmVydGluZyB0aGlzIHBhdGNo
IGhlbHBzLiBQbGVhc2UgZml4IGl0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
