Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282314D747
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 09:07:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3349166C;
	Thu, 30 Jan 2020 09:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3349166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580371643;
	bh=SEZQt2q8GV1iuWKMoal6PjJ/+pBnXGw9bTI4DRVcegE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y+sISvwpxtBv4XeiJlVrP1w2QysmY11/2b2TaHSuwNHjZHxHlCSvcwKunS5NO3eZd
	 GY+TAdGS6HB5Lw1fQM9Wh1J16EfjntDOrCkFpZbopbqYQbSQZA+OaH/f2sTaXiKdMC
	 nIyj4mq4BIG5KOnfecwT141+mgXp5tMMKuCQzbCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDEEFF80276;
	Thu, 30 Jan 2020 09:05:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88394F80274; Thu, 30 Jan 2020 09:05:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3454F80227
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 09:05:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3454F80227
Received: from [167.98.27.226] (helo=[172.16.102.1])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1ix4p7-0001dD-Mk; Thu, 30 Jan 2020 08:05:13 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>
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
 <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
 <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
 <2ff97414-f0a5-7224-0e53-6cad2ed0ccd2@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <35667c85-67b5-6f6f-ffe8-4fe3455ea4bb@codethink.co.uk>
Date: Thu, 30 Jan 2020 08:05:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2ff97414-f0a5-7224-0e53-6cad2ed0ccd2@gmail.com>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] (no subject)
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

T24gMjkvMDEvMjAyMCAwMDoxNywgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI4LjAxLjIwMjAg
MjE6MTksIEpvbiBIdW50ZXIg0L/QuNGI0LXRgjoKPj4KPj4gT24gMjgvMDEvMjAyMCAxNzo0Miwg
RG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMjguMDEuMjAyMCAxNToxMywgTWFyayBCcm93biDQ
v9C40YjQtdGCOgo+Pj4+IE9uIE1vbiwgSmFuIDI3LCAyMDIwIGF0IDEwOjIwOjI1UE0gKzAzMDAs
IERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4gMjQuMDEuMjAyMCAxOTo1MCwgSm9uIEh1bnRl
ciDQv9C40YjQtdGCOgo+Pj4+Cj4+Pj4+PiAgICAgICAgICAgICAgICAgIC5yYXRlcyA9IFNORFJW
X1BDTV9SQVRFXzgwMDBfOTYwMDAsCj4+Pj4+PiAgICAgICAgICAgICAgICAgIC5mb3JtYXRzID0g
U05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUgfAo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgU05EUlZfUENNX0ZNVEJJVF9TMjRfM0xFIHwKPj4+Pgo+Pj4+PiBJdCBzaG91bGQgc29s
dmUgdGhlIHByb2JsZW0gaW4gbXkgcGFydGljdWxhciBjYXNlLCBidXQgSSdtIG5vdCBzdXJlIHRo
YXQKPj4+Pj4gdGhlIHNvbHV0aW9uIGlzIGNvcnJlY3QuCj4+Pj4KPj4+PiBJZiB0aGUgZm9ybWF0
IGltcGxlbWVudGVkIGJ5IHRoZSBkcml2ZXIgaXMgUzI0XzNMRSB0aGUgZHJpdmVyIHNob3VsZAo+
Pj4+IGFkdmVydGlzZSBTMjRfM0xFLgo+Pj4KPj4+IEl0IHNob3VsZCBiZSBTMjRfTEUsIGJ1dCBz
ZWVtcyB3ZSBzdGlsbCBkb24ndCBrbm93IGZvciBzdXJlLgo+Pgo+PiBXaHk/Cj4gL0kgdGhpbmsv
IHNvdW5kIHNob3VsZCBiZSBtdWNoIG1vcmUgZGlzdG9ydGVkIGlmIGl0IHdhcyBTMjRfM0xFLCBi
dXQKPiBtYXliZSBJJ20gd3JvbmcuCgpTMjRfM0xFIGlzIElJQ0MgdGhlIHdyb25nIHRoaW5nIGFu
ZCB3ZSBjYW4ndCBzdXBwb3J0IGl0IG9uIHRoZSB0ZWdyYTMKCgotLSAKQmVuIERvb2tzCQkJCWh0
dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0g
UHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRt
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
