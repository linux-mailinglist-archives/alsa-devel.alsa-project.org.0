Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 101E614CD4B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 16:24:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7DD4167B;
	Wed, 29 Jan 2020 16:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7DD4167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580311463;
	bh=rHQYz2pmXu9d9REgIZH2t+ddzPDi7r+5979+hS/YmNc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6DLVOONwUyaupGe9ZJjGBj2kjrN8Jr0VYuHClI7Lo4xf5kanmdYZ+4o7WwMMw8L7
	 4geWLTN0nS+w1CEswtF4gyPPhqKVkVE2wck8tGQ0ZQ2B6C0pbgd8DlH1SfLx/XALqW
	 RZ4KEJJ+ncYZtdk4jHGMqFtQemaT4Jtlxei3LFgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9307F80082;
	Wed, 29 Jan 2020 16:22:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7CA1F8021E; Wed, 29 Jan 2020 16:22:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF3B1F80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 16:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF3B1F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QapQxTJV"
Received: by mail-lj1-x242.google.com with SMTP id f25so5999470ljg.12
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 07:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GditBgjv04bGKi5ughJOq3WqReWgzWw+7OJFtryNwQY=;
 b=QapQxTJVfP76PPBBJ3+k0t6YauG1bfsaydAmNX0jW/tS37X7uFBwn3rBSK+/t0DNBm
 wXlXGQHn/K5L+khuuAeBFy/yZexQyRpjbc8yp30rFQLAvtHMf86d3+h5dir+xyrDuZMD
 Ozhga00M1apPXuPe1i9duLFbhO6FljsyhAbvXuP8mAMUx9r+iSxA9qSWAAQ1It75h7Iu
 4T38TUqEj8Ri3qfyJPc6VihILIETCT9oScM4zGWc21bDZJrna04NK/k1OVRLK2C8K8ob
 dFix87ZfZNrD1itEGb/KyTdqOVKgXWH1+EEVhlAl4hjGGUslgw9wfWOTJK2D6bW5NNHk
 dVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GditBgjv04bGKi5ughJOq3WqReWgzWw+7OJFtryNwQY=;
 b=SKfxDNXMY2iZpxXMnVzQlpn3sLJntMzidQLqC5y6gvg2SDlvYL6OCTR/4M9711iMPQ
 PpxCBC5nsXOoJUX4LvM+kzl2FdjOnzdse5hgznCrsTfXCU9OnR6fjSMP+isokAuXND+m
 GbSHJUXWe+4V9N9j2KY1OM1gNpl0ZbeP0bjrkHcGnEO02cWT3BjN6yMKV0Vm8in06SWM
 U2QFSYw39PD5gJHuvY60iFYVVjJ4pJE3CtIIXYI2wp3l1bd0GYO3sz5hQElT5Jf0YJ/X
 lolipFjC8ZsDEfWUoNy26NPYaWQWSPBqLpzpmgChs/UCmalEEcEZ2Z1ep+EOfxgpPO25
 XjHA==
X-Gm-Message-State: APjAAAVd3MAJJBrizUoDauXPaZS1AW89B99aLGA6UvWU1YL6QqMyeXU/
 jldFsVfattBSJmaf0+WyJIE=
X-Google-Smtp-Source: APXvYqyHTxmhchYypqQ3D/M1NjRJy8h5Jmpf0J5DuiV5vm886ljgNTxQBYcUHuMT8r1CfpWdKQrAdQ==
X-Received: by 2002:a2e:97c1:: with SMTP id m1mr16381367ljj.270.1580311350631; 
 Wed, 29 Jan 2020 07:22:30 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id f16sm1134650ljn.17.2020.01.29.07.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2020 07:22:29 -0800 (PST)
To: Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a239652-0964-7234-21ab-00519c6c40f0@gmail.com>
Date: Wed, 29 Jan 2020 18:22:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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

MjkuMDEuMjAyMCAxNzozMywgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDI5LzAxLzIw
MjAgMTA6NDksIEpvbiBIdW50ZXIgd3JvdGU6Cj4+Cj4+IE9uIDI4LzAxLzIwMjAgMTI6MTMsIE1h
cmsgQnJvd24gd3JvdGU6Cj4+PiBJIHJlYWxseSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGlzIGlz
IGFsbCB0YWtpbmcgc28gbG9uZywgdGhpcyB0aHJlYWQKPj4+IGp1c3Qgc2VlbXMgdG8gYmUgZ29p
bmcgcm91bmQgaW4gaW50ZXJtaW5hYmxlIGNpcmNsZXMgbG9uZyBhZnRlciBpdAo+Pj4gbG9va2Vk
IGxpa2UgdGhlIGlzc3VlIHdhcyB1bmRlcnN0b29kLiAgSSBoYXZlIHRvIGFkbWl0IEkndmUgbm90
IHJlYWQKPj4+IGV2ZXJ5IHNpbmdsZSBtZXNzYWdlIGluIHRoZSB0aHJlYWQgYnV0IGl0J3MgZGlm
ZmljdWx0IHRvIHNlZSB3aHkgaXQKPj4+IGRvZXNuJ3Qgc2VlbSB0byBiZSBtYWtpbmcgYW55IHBy
b2dyZXNzLgo+Pgo+PiBTb3JyeSBhYm91dCB0aGF0LiBPbiByZXZpZXdpbmcgdGhpcyB3aXRoIHRo
ZSBhdWRpbyB0ZWFtIGF0IE5WSURJQSwgSSB3YXMKPj4gdG9sZCB3ZSBkb24ndCBzdXBwb3J0IFMy
NF9MRSBmb3IgSTJTLiBUaGUgcmVhc29uIGJlaW5nIHRoYXQgdGhlIGNyb3NzYmFyCj4+IGJldHdl
ZW4gdGhlIERNQSBhbmQgSTJTIGlzIG5vdCBhYmxlIHRvIGV4dHJhY3QgdGhlIGNvcnJlY3QgMjQt
Yml0cyBmcm9tCj4+IHRoZSAzMi1iaXQgc2FtcGxlIHRvIGZlZWQgdG8gdGhlIEkyUyBpbnRlcmZh
Y2UuIFRoZSBUZWdyYSBkb2N1bWVudGF0aW9uCj4+IGRvZXMgc2hvdyBzdXBwb3J0IGZvciAyNC1i
aXRzLCBidXQgbm90IHN0YXRlIGV4cGxpY2l0IHN1cHBvcnQgZm9yIFMyNF9MRS4KPj4KPj4gTm93
IEJlbiBzYXlzIHRoYXQgaGUgaGFzIHRoaXMgd29ya2luZywgYnV0IEkgYW0gdW5hYmxlIHRvIHJl
cHJvZHVjZQo+PiB0aGlzLCBzbyBiZWZvcmUganVzdCBkcm9wcGluZyB0aGUgUzI0X0xFIHN1cHBv
cnQsIEkgd291bGQgbGlrZSB0bwo+PiB1bmRlcnN0YW5kIGhvdyB0aGlzIGlzIHdvcmtpbmcgZm9y
IEJlbiBpbiBjYXNlIHRoZXJlIGlzIHNvbWV0aGluZyB0aGF0Cj4+IHdlIGhhdmUgb3Zlcmxvb2tl
ZCBoZXJlLgo+IAo+IEFoLCBJIHNlZSB0aGF0IHBhcnQgb2YgdGhlIHByb2JsZW0gaXMgdGhhdCBw
YXRjaGVzIDYgYW5kIDcgYXJlIHlldCB0byBiZQo+IGFwcGxpZWQgYW5kIHdpdGhvdXQgdGhlc2Ug
dGhlIGF1ZGlvIGlzIGNvbXBsZXRlbHkgZGlzdG9ydGVkIGJlY2F1c2UKPiB0aGVyZSBpcyBhIG1p
c21hdGNoIGluIHRoZSBkYXRhIHNpemUgYmV0d2VlbiB0aGUgQVBCSUYgYW5kIEkyUwo+IGNvbnRy
b2xsZXIuIEFwcGx5aW5nIHRoZXNlIHBhdGNoZXMgaXQgaXMgbm90IGRpc3RvcnRlZCBidXQgbm93
IEkgYW0KPiBvYnNlcnZpbmcgdGhlIGNsb2NraW5nIGlzc3VlIEJlbiByZXBvcnRlZCBhbmQgc28g
dGhlIHRvbmUgaXMgbm90IHF1aXRlCj4gcmlnaHQuCj4gCj4gQmVuLCBJIHdhcyBhYmxlIHRvIHdv
cmthcm91bmQgdGhlIGNsb2NraW5nIGlzc3VlIGJ5IG1ha2luZyB0aGUgSTJTIHdvcmQKPiBjbG9j
ayA2NCBiaXRzIGxvbmcgYW5kIG5vdCA0OC4KPiAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3Rl
Z3JhL3RlZ3JhMzBfaTJzLmMgYi9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+IGluZGV4
IGJiZjgxYjVhYTcyMy4uM2M5YjQ3NzllNjFiIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy90ZWdy
YS90ZWdyYTMwX2kycy5jCj4gKysrIGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPiBA
QCAtMTQzLDcgKzE0Myw3IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1zKHN0cnVj
dAo+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4gICAgICAgICBjYXNlIFNORFJWX1BD
TV9GT1JNQVRfUzI0X0xFOgo+ICAgICAgICAgICAgICAgICB2YWwgPSBURUdSQTMwX0kyU19DVFJM
X0JJVF9TSVpFXzI0Owo+ICAgICAgICAgICAgICAgICBhdWRpb19iaXRzID0gVEVHUkEzMF9BVURJ
T0NJRl9CSVRTXzI0Owo+IC0gICAgICAgICAgICAgICBzYW1wbGVfc2l6ZSA9IDI0Owo+ICsgICAg
ICAgICAgICAgICBzYW1wbGVfc2l6ZSA9IDMyOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAg
ICAgICAgIGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMzJfTEU6Cj4gICAgICAgICAgICAgICAgIHZh
bCA9IFRFR1JBMzBfSTJTX0NUUkxfQklUX1NJWkVfMzI7Cj4gCj4gRm9yIEkyUyBJIGJlbGlldmUg
d2Ugb25seSBjYXJlIGFib3V0IHRoZSBlZGdlcyBvZiB0aGUgd29yZCBjbG9jayBhbmQgc28KPiB3
ZSBtYWtlIHRoZSBvdmVyYWxsIHBlcmlvZCBvZiB0aGUgd29yZCBjbG9jayA2NCBiaXQgY2xvY2tz
IHRoZW4gd2Ugbm8KPiBsb25nZXIgaGF2ZSBhbiBpc3N1ZSB3aXRoIHRoZSBiaXQgY2xvY2sgZnJl
cXVlbmN5LiBJIGFzc3VtZSB0aGF0IHRoaXMKPiBzaG91bGQgYWxzbyBiZSBmaW5lIGZvciBURE0g
bW9kZXMgYXMgd2VsbC4KPiAKPiBDYW4geW91IGxldCBtZSBrbm93IGlmIHRoaXMgd29ya3MgZm9y
IHlvdT8KCmNhdCAvcHJvYy9hc291bmQvY2FyZDAvcGNtMHAvc3ViMC9od19wYXJhbXMKCmFjY2Vz
czogTU1BUF9JTlRFUkxFQVZFRApmb3JtYXQ6IFMyNF9MRQpzdWJmb3JtYXQ6IFNURApjaGFubmVs
czogMgpyYXRlOiA0ODAwMCAoNDgwMDAvMSkKcGVyaW9kX3NpemU6IDUxMgpidWZmZXJfc2l6ZTog
NDA5NgoKTm8gZGlzdG9ydGlvbiBhdCBhbGwhIEpvbiwgdGhhbmsgeW91IHZlcnkgbXVjaCEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
