Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8471611E4
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 13:19:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F3BA1679;
	Mon, 17 Feb 2020 13:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F3BA1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581941961;
	bh=UJJQIV6QC4RUJAySZCIsVmDf3AdiZzpJ5u48FrJ0S88=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MZu6VvFTluxyMDKG/Y3kIxStINtJva3ch0iALouGp9Q3otRWPRiTXWjHuVWGF60Ht
	 JFUKZfQvVrivFgxtFM8BhgrH3HMfOdDpiyzzBEbFJDoJ+LwSJidhFdoLHtVd00WruZ
	 ldID58e8SHdZHfOiphc0wDEUX4tCBnPf4WzUxx00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B235CF801F4;
	Mon, 17 Feb 2020 13:17:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85EBBF80172; Mon, 17 Feb 2020 13:17:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E669BF800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 13:17:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E669BF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="NaDUFXbf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fZoATTqPJUdKKC1IrtDOAB96Jovw6rpyMcO43yCvYnY=; b=NaDUFXbfMP/SP9qaMEYzwzE1pZ
 RQM59QJelqnu7IK1BegM4TGvTJVsXUPjoLLwyKp3vXfMnQzcOpJUo5ZJFonTyzwHRzECBKHbX/zX2
 0JdvHZo5Cl9EGAkTKhUvHDKBNvpyIi2Hz8YkPnW9LOE7R5n0P00bGIs6BHTek7/xPHfc3LHicsSSj
 lPpWaVQj93SpMR51I0YtBPS1ZkfJZJIzMIcms76BwzaUShc+rZf+tHndmeMrReD6R9iMGlCZqq65T
 HY1B9+aKP4fg0zQg2IAAuByB44pFZGOmfaiT6zARmCK4kGVt3IY0dPIYl4JeUYNNahF0dwRleO28i
 5T7jmpzQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <lars@metafoo.de>)
 id 1j3fL9-0008Gr-0T; Mon, 17 Feb 2020 13:17:31 +0100
Received: from [93.104.109.112] (helo=[192.168.178.20])
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1j3fL8-000GU3-PV; Mon, 17 Feb 2020 13:17:30 +0100
To: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <77884bad-81fd-f876-3f72-1f96a39d6329@perex.cz>
 <d1d0be54-5bdb-0405-320a-d7e542fdbcde@metafoo.de>
 <20200217113540.GB108283@ediswmail.ad.cirrus.com>
 <4fafa55a-acd0-8a64-2ebe-0ed38b306678@ti.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <ce896073-df9e-7504-6c37-c611dd750936@metafoo.de>
Date: Mon, 17 Feb 2020 13:17:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4fafa55a-acd0-8a64-2ebe-0ed38b306678@ti.com>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25725/Sun Feb 16 13:04:22 2020)
Cc: ALSA development <alsa-devel@alsa-project.org>
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

T24gMi8xNy8yMCAxMjo1NiBQTSwgUGV0ZXIgVWpmYWx1c2kgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MTcvMDIvMjAyMCAxMy4zNSwgQ2hhcmxlcyBLZWVwYXggd3JvdGU6Cj4+IE9uIE1vbiwgRmViIDE3
LCAyMDIwIGF0IDEwOjMzOjU1QU0gKzAxMDAsIExhcnMtUGV0ZXIgQ2xhdXNlbiB3cm90ZToKPj4+
IE9uIDIvMTcvMjAgOTo0NiBBTSwgSmFyb3NsYXYgS3lzZWxhIHdyb3RlOgo+Pj4+ICDCoMKgwqDC
oEkgY2FuIGVuYWJsZSB0aGUgIlJlcGxhY2UgdGhlIEZyb206IGhlYWRlciBhZGRyZXNzIiBpbiB0
aGUKPj4+PiBtYWlsbWFuIGNvbmZpZyB0byAiTXVuZ2UgRnJvbSIgbGlrZSBpbiB0aGUgYWJvdmUg
ZXhhbXBsZSwgYnV0IGl0Cj4+Pj4gd2lsbCBtZWFuIHRoYXQgRnJvbTogd2lsbCBiZSBhbHRlcmVk
IChzZWUgdGhlIGV4cGxhbmF0aW9uKS4KPj4+Cj4+PiBUaGUgd2F5IEkgdW5kZXJzdGFuZCB0aGUg
b3B0aW9uIHRvIHJlcGxhY2UgdGhlIEZyb206IGhlYWRlciBpcyB0aGF0Cj4+PiBpdCB3aWxsIG9u
bHkgaGFwcGVuIGZvciB0aG9zZSB0aGF0IGhhdmUgYSByZWplY3QgcG9saWN5LCBmb3IKPj4+IGV2
ZXJ5Ym9keSBlbHNlIG5vdGhpbmcgY2hhbmdlcy4gU28gaWYgdGhlIG1haWxpbmdsaXN0IGlzIHN1
cHBvc2VkIHRvCj4+PiBzdGF5IHVzZWZ1bCBmb3IgdGhvc2Ugd2l0aCBhIHJlamVjdCBwb2xpY3kg
dGhlIG9ubHkgb3B0aW9uIGlzIHRvCj4+PiByZXdyaXRlIHRoZSBmcm9tIGhlYWRlciBmb3IgdGhl
bS4KPj4+Cj4+Cj4+IFJld3JpdGluZyBzZWVtcyBsaWtlIHRoZSBiZXN0IG9wdGlvbiByZWFsbHks
IEkgZG91YnQgdGhlcmUKPj4gaXMgbXVjaCBjaGFuY2Ugb2YgbWUgbWFuYWdpbmcgdG8gZ2V0IHRo
ZSBJUyBndXlzIHRvIGNoYW5nZQo+PiBjaXJydXMuY29tJ3MgRE1BUkMgcG9saWN5IGFuZCBJIGd1
ZXNzIHdlIG1pZ2h0IG5vdCBiZSB0aGUgb25seQo+PiBwZW9wbGUgd2hvIGNhdXNlIHRyb3VibGUg
b24gdGhpcyBmcm9udC4KPiAKPiB0aS5jb20gYWxzbyBoYWQgaXNzdWVzIGNhdXNlZCBieSBETUFS
QyBwb2xpY3kuIFdlIGhhdmUgZXh0ZW5zaXZlbHkKPiBuYWdnZWQgb3VyIElUIGRlcGFydG1lbnQg
b3ZlciB0aGlzIGFuZCBpdCBnb3QgcmVzb2x2ZWQ/Cj4gUHJvYmFibHkuIE5vdCBzdXJlLCBidXQg
SSBoYXZlIG5vdCBiZWVuIHVuc3Vic2NyaWJlZCBsYXRlbHkgZnJvbSBsaXN0cwo+IGFuZCBubyBj
b21wbGFpbnRzIG9uIHBlb3BsZSBub3QgcmVjZWl2aW5nIG15IG1haWxzLi4uIGl0IGNvdWxkIGJl
IHRoYXQKPiB0aGV5IGRvIG5vdCBpbmRlZWQgcmVjZWl2ZSB0aGUgbWFpbHMgd2hpY2ggbWFrZXMg
dGhlbSBoYXBweSA7KQpJdHMgbm90IHRoYXQgeW91IGdldCB1bnN1YnNjcmliZWQsIGJ1dCBldmVy
eWJvZHkgZWxzZSB3aG8gaXMgcmVqZWN0aW5nIAp5b3VyIG1haWxzIDspCgpfZG1hcmMudGkuY29t
LgkJMzYwMAlJTglUWFQgCiJ2PURNQVJDMTtwPXF1YXJhbnRpbmU7c3A9bm9uZTtydWE9bWFpbHRv
OmRtYXJjLWFnZ3JAdGkuY29tO3J1Zj1tYWlsdG86ZG1hcmMtZm9yQHRpLmNvbTtmbz0wIgoKVGhl
IHA9cXVhcmFudGluZSBtZWFucyB0aGF0IHlvdXIgbWVzc2FnZXMgZm9yd2FyZGVkIGJ5IHRoZSBB
TFNBIAptYWlsaW5nbGlzdCB3aWxsIHByb2JhYmx5IGdvIHRvIHNwYW0gZm9yIHBlb3BsZSB1c2lu
ZyBnbWFpbC4KClNvbWUgb3RoZXIgbWFpbGluZ2xpc3RzIGJ0dyBkb24ndCBoYXZlIHRoaXMgcHJv
YmxlbSwgc2luY2UgdGhleSBmb3J3YXJkIAp0aGUgc2lnbmVkIGNvbnRlbnQgb2YgdGhlIG1haWwg
dW5tb2RpZmllZC4gQnV0IHNpbmNlIGFsc2EgbW9kaWZpZXMgdGhlIApzdWJqZWN0IGFzIHdlbGwg
YXMgYWRkaW5nIHRoZSBpbmZvIGZvb3RlciB0aGUgb3JpZ2luYWwgc2lnbmF0dXJlIGlzIG5vIAps
b25nZXIgdmFsaWQuCgotIExhcnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
