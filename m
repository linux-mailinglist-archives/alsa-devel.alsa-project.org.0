Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16388150A8
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9607F1927;
	Mon,  6 May 2019 17:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9607F1927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557157798;
	bh=ZyVpjM9gibZnDe9f6P3TuZTILKx6ZaJdEhVBgtPRk1k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZKIP/ZTjnQKrIn+OZIq2fO01YXnXSAvMpg23lbt9Z2ofznKEVzVQm3wSeArjvhxQ2
	 W2RR/kVFSZIxqRTjgoKlSIwN8Nnhr/4cTm4/+THJS48/2Kwz1xvIGvcTxSm7tgB1Bh
	 wNOA4a0G/9iTqMLQEC7Lor3Xh2sinJLnoH85eotg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F69AF89715;
	Mon,  6 May 2019 17:48:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 262FFF89701; Mon,  6 May 2019 17:48:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09D7FF80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D7FF80C07
Received: by mail-ed1-f67.google.com with SMTP id f37so15767022edb.13
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 08:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D044CB3ldsnFTWWR9zn1mDGutl9EAIqq+47R4uBZa5I=;
 b=ZCU2kmcUODL7OMHaCJlBM82UVDjRUPuCWb4Oh0LeozJ/wlkClm2PkX8ERfs2Ct07hp
 sbqMIpPWdbEhfIvN7EbZhzOB3mqI7P9Guga5o704sdlbMPUYbnglJafF8R+5eNn+R2tL
 +7OFP7uowzuFvuezmHjliiECDnMylbrrArfluHFlR+3+lQYbnAlx9WqOuDF2lLLY0Uc5
 iQdM0BWYx3AoMi9A/wS6TXIh4kxvsmG/m94wXKrbl7hioUbuZFN7zuu3QLsfiMXXqLHW
 lW51cke+z7voBskjk7dqlFsgP1Bxg3KvFAVjMQS+16bmiVdVt11M6OBAtNKx4jNAsFZ8
 Tunw==
X-Gm-Message-State: APjAAAXqz0dfXF9Ii/fbLEYwrX+n3s3AhVf1jjga7RHOjKcrbF++hY8z
 qsOFvtf/X8z2AZDDqJjHvpMzBw==
X-Google-Smtp-Source: APXvYqxWEiBhc6aafxXJje+l0pisjs6TLIXAHJXClDrdeNfqakh2QoSYDgVEmIvv5JQ63g5Zxw3lTg==
X-Received: by 2002:a50:be03:: with SMTP id a3mr24558576edi.5.1557157699428;
 Mon, 06 May 2019 08:48:19 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id i9sm3184135edk.56.2019.05.06.08.48.18
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 08:48:18 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nariman <narimantos@gmail.com>, linux-kernel@vger.kernel.org
References: <20190504151652.5213-1-user@elitebook-localhost>
 <20190504151652.5213-2-user@elitebook-localhost>
 <92f39b95-aabe-0a92-714e-15d2ea123f49@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <93914256-4fbd-a17b-c283-7dbad37649d0@redhat.com>
Date: Mon, 6 May 2019 17:48:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <92f39b95-aabe-0a92-714e-15d2ea123f49@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, yang.jie@linux.intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 Damian van Soelen <dj.vsoelen@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: cht_bsw_rt5645.c: Remove
 buffer and snprintf calls
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

SGksCgpPbiAwNi0wNS0xOSAxNzoyNCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gT24g
NS80LzE5IDEwOjE2IEFNLCBOYXJpbWFuIHdyb3RlOgo+PiBGcm9tOiBEYW1pYW4gdmFuIFNvZWxl
biA8ZGoudnNvZWxlbkBnbWFpbC5jb20+Cj4+Cj4+IFRoZSBzbnByaW50ZiBjYWxscyBmaWxsaW5n
IGNodF9ydDU2NDVfY3B1X2RhaV9uYW1lIC8gY2h0X3J0NTY0NV9jb2RlY19haWZfbmFtZQo+PiBh
bHdheXMgZmlsbCB0aGVtIHdpdGggdGhlIHNhbWUgc3RyaW5nICgic3NwMC1wb3J0IiByZXNwICJy
dDU2NDUtYWlmMiIpIHNvCj4+IGluc3RlYWQgb2Yga2VlcGluZyB0aGVzZSBidWZmZXJzIGFyb3Vu
ZCBhbmQgbWFraW5nIHRoZSBjcHVfZGFpX25hbWUgLwo+PiBjb2RlY19haWZfbmFtZSBwb2ludCB0
byB0aGlzLCBzaW1wbHkgdXBkYXRlIHRoZSBmb29fZGFpX25hbWUgYW5kIGZvb19haWZfbmFtZSBw
b2ludGVycyB0bwo+PiBkaXJlY3RseSBwb2ludCB0byBhIHN0cmluZyBjb25zdGFudCBjb250YWlu
aW5nIHRoZSBkZXNpcmVkIHN0cmluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFtaWFuIHZhbiBT
b2VsZW4gPGRqLnZzb2VsZW5AZ21haWwuY29tPgo+IAo+IE5lZWQgTmFyaW1hbidzIFNpZ25vZmYt
b2YtYnkgdGFnIGhlcmUuCgpZZXMsIE5hcmltYW4gY2FuIHlvdSByZXNlbmQgd2l0aCB5b3VyIFMt
by1iIGFkZGVkIG9uY2UgdGhlIG90aGVyIHBhcnQKb2YgdGhpcyBkaXNjdXNzaW9uIGlzIHJlc29s
dmVkPwoKTm90ZSB5b3UgbmVlZCB0byBwYXNzCgotLXN1YmplY3QtcHJlZml4PSJQQVRDSCB2MiIK
ClRvIGdpdCBzZW5kLWVtYWlsIHdoZW4gc2VuZGluZyBvdXQgdGhlIG5ldyB2ZXJzaW9uIHdpdGgg
eW91ciBTLW8tYiBhZGRlZAp0byB0aGUgMyBwYXRjaGVzIHdoaWNoIHlvdSBhcmUgbm90IHRoZSBh
dXRob3Igb2YuCgoKCgo+PiAtLS0KPj4gwqAgc291bmQvc29jL2ludGVsL2JvYXJkcy9jaHRfYnN3
X3J0NTY0NS5jIHwgMjYgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMvY2h0X2Jzd19ydDU2NDUuYyBiL3NvdW5kL3NvYy9pbnRl
bC9ib2FyZHMvY2h0X2Jzd19ydDU2NDUuYwo+PiBpbmRleCBjYmMyZDQ1ODQ4M2YuLmIxNTQ1OWU1
NjY2NSAxMDA2NDQKPj4gLS0tIGEvc291bmQvc29jL2ludGVsL2JvYXJkcy9jaHRfYnN3X3J0NTY0
NS5jCj4+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMvY2h0X2Jzd19ydDU2NDUuYwo+PiBA
QCAtNTA2LDggKzUwNiw2IEBAIHN0YXRpYyBzdHJ1Y3QgY2h0X2FjcGlfY2FyZCBzbmRfc29jX2Nh
cmRzW10gPSB7Cj4+IMKgIH07Cj4+IMKgIHN0YXRpYyBjaGFyIGNodF9ydDU2NDVfY29kZWNfbmFt
ZVtTTkRfQUNQSV9JMkNfSURfTEVOXTsKPj4gLXN0YXRpYyBjaGFyIGNodF9ydDU2NDVfY29kZWNf
YWlmX25hbWVbMTJdOyAvKsKgID0gInJ0NTY0NS1haWZbMXwyXSIgKi8KPj4gLXN0YXRpYyBjaGFy
IGNodF9ydDU2NDVfY3B1X2RhaV9uYW1lWzEwXTsgLyrCoCA9ICJzc3BbMHwyXS1wb3J0IiAqLwo+
PiDCoCBzdGF0aWMgYm9vbCBpc192YWxsZXl2aWV3KHZvaWQpCj4+IMKgIHsKPj4gQEAgLTY0MSwy
OCArNjM5LDEyIEBAIHN0YXRpYyBpbnQgc25kX2NodF9tY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+PiDCoMKgwqDCoMKgIGxvZ19xdWlya3MoJnBkZXYtPmRldik7Cj4+IMKg
wqDCoMKgwqAgaWYgKChjaHRfcnQ1NjQ1X3F1aXJrICYgQ0hUX1JUNTY0NV9TU1AyX0FJRjIpIHx8
Cj4+IC3CoMKgwqDCoMKgwqDCoCAoY2h0X3J0NTY0NV9xdWlyayAmIENIVF9SVDU2NDVfU1NQMF9B
SUYyKSkgewo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCAvKiBmaXh1cCBjb2RlYyBhaWYgbmFtZSAq
Lwo+PiAtwqDCoMKgwqDCoMKgwqAgc25wcmludGYoY2h0X3J0NTY0NV9jb2RlY19haWZfbmFtZSwK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKGNodF9ydDU2NDVfY29kZWNfYWlmX25h
bWUpLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJXMiLCAicnQ1NjQ1LWFpZjIiKTsKPj4g
LQo+PiAtwqDCoMKgwqDCoMKgwqAgY2h0X2RhaWxpbmtbZGFpX2luZGV4XS5jb2RlY19kYWlfbmFt
ZSA9Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNodF9ydDU2NDVfY29kZWNfYWlmX25hbWU7
Cj4+IC3CoMKgwqAgfQo+PiArwqDCoMKgwqDCoMKgwqAgKGNodF9ydDU2NDVfcXVpcmsgJiBDSFRf
UlQ1NjQ1X1NTUDBfQUlGMikpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNodF9kYWlsaW5r
W2RhaV9pbmRleF0uY29kZWNfZGFpX25hbWUgPSAicnQ1NjQ1LWFpZjIiOwo+IAo+IHNhbWUsIG5v
dCBlcXVpdmFsZW50LiBTU1AyX0FJRjIgaXMgbm90IGhhbmRsZWQuCgpTYW1lIHJlbWFyayBmcm9t
IG1lLCBhbmQgYWxzbyB0aGUgc2FtZSBmb3IgdGhlIDN0aCBwYXRjaCB5b3UndmUKcmVzcG9uZGVk
IHRvLgoKUmVnYXJkcywKCkhhbnMKCgo+IAo+PiDCoMKgwqDCoMKgIGlmICgoY2h0X3J0NTY0NV9x
dWlyayAmIENIVF9SVDU2NDVfU1NQMF9BSUYxKSB8fAo+PiAtwqDCoMKgwqDCoMKgwqAgKGNodF9y
dDU2NDVfcXVpcmsgJiBDSFRfUlQ1NjQ1X1NTUDBfQUlGMikpIHsKPj4gLQo+PiAtwqDCoMKgwqDC
oMKgwqAgLyogZml4dXAgY3B1IGRhaSBuYW1lIG5hbWUgKi8KPj4gLcKgwqDCoMKgwqDCoMKgIHNu
cHJpbnRmKGNodF9ydDU2NDVfY3B1X2RhaV9uYW1lLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzaXplb2YoY2h0X3J0NTY0NV9jcHVfZGFpX25hbWUpLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAiJXMiLCAic3NwMC1wb3J0Iik7Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIGNodF9kYWls
aW5rW2RhaV9pbmRleF0uY3B1X2RhaV9uYW1lID0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y2h0X3J0NTY0NV9jcHVfZGFpX25hbWU7Cj4+IC3CoMKgwqAgfQo+PiArwqDCoMKgwqDCoMKgwqAg
KGNodF9ydDU2NDVfcXVpcmsgJiBDSFRfUlQ1NjQ1X1NTUDBfQUlGMikpCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNodF9kYWlsaW5rW2RhaV9pbmRleF0uY3B1X2RhaV9uYW1lID0gInNzcDAt
cG9ydCI7Cj4gCj4gYW5kIHNhbWUgaGVyZSwgU1NQMF9BSUYxIHdpbGwgbm8gbG9uZ2VyIHdvcmsu
Cj4gCj4+IMKgwqDCoMKgwqAgLyogb3ZlcnJpZGUgcGxhZm9ybSBuYW1lLCBpZiByZXF1aXJlZCAq
Lwo+PiDCoMKgwqDCoMKgIHBsYXRmb3JtX25hbWUgPSBtYWNoLT5tYWNoX3BhcmFtcy5wbGF0Zm9y
bTsKPj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
