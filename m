Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3148314BF6A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 19:21:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A8F7166F;
	Tue, 28 Jan 2020 19:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A8F7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580235673;
	bh=z6AylaGrtdqx/oFPBrPRSbG18Ys/q37WORygNGHN510=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QMJRgC1ne8Gb2IpcZmCJChQHyF6dmz6tCaVxpPW//Pra4zMRy4G7pJDb7/3/PGmLE
	 zmjGEQST2nlFHK46QhcoTJ76GFs296w12c5B3zKnQ57fag4ZragellePB7K9DSXJW2
	 d4ghxnyb7cppsgsi5tLS0eqCcw7eTaJZcyuzw9nA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A78FAF800FF;
	Tue, 28 Jan 2020 19:19:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A29EF800FF; Tue, 28 Jan 2020 19:19:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0C78F800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 19:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0C78F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="b2YDan7j"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e307b1d0000>; Tue, 28 Jan 2020 10:19:09 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 28 Jan 2020 10:19:23 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 28 Jan 2020 10:19:23 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 18:19:21 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Mark Brown <broonie@kernel.org>
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
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
Date: Tue, 28 Jan 2020 18:19:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580235549; bh=haGbRhnwYfqYm8OYOnYaS4TBQKtjm+tRkVZtCR7beeg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=b2YDan7jVhnoJbfoEICNiUrr3zwMH3xSwNsZomEUUiX4D1JJN4iAv2eZq7nNYBUb3
 syMh2miFnxtG9sm7webZD9FnIkb0QRmQsEtk5eN0RqpXFcVuKh750K6u1ciC9bA0fF
 l+Rv/+MDSEL4JmDcG5wJ8M4zKlF9u7wcOkSRBpdh4gkk7+JMEHxXwCd1ilPQgA/q3G
 jXWHrK6MlXpTY7tIrWnXzFWg3JygEkcVKx6m4Z9gzP5ZP2AmfggAh4tBfIOqf7auVV
 PoYjZpFJCs6xPLTnIltkkS0LHVWOhSktKd/oX/n3IrcywEvNvRnqXeGmGHsTfXfJ/Q
 CVzELsefxq+EQ==
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
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

Ck9uIDI4LzAxLzIwMjAgMTc6NDIsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAyOC4wMS4yMDIw
IDE1OjEzLCBNYXJrIEJyb3duINC/0LjRiNC10YI6Cj4+IE9uIE1vbiwgSmFuIDI3LCAyMDIwIGF0
IDEwOjIwOjI1UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDI0LjAxLjIwMjAg
MTk6NTAsIEpvbiBIdW50ZXIg0L/QuNGI0LXRgjoKPj4KPj4+PiAgICAgICAgICAgICAgICAgLnJh
dGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+PiAgICAgICAgICAgICAgICAgLmZv
cm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUgfAo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzI0XzNMRSB8Cj4+Cj4+PiBJdCBzaG91bGQgc29s
dmUgdGhlIHByb2JsZW0gaW4gbXkgcGFydGljdWxhciBjYXNlLCBidXQgSSdtIG5vdCBzdXJlIHRo
YXQKPj4+IHRoZSBzb2x1dGlvbiBpcyBjb3JyZWN0Lgo+Pgo+PiBJZiB0aGUgZm9ybWF0IGltcGxl
bWVudGVkIGJ5IHRoZSBkcml2ZXIgaXMgUzI0XzNMRSB0aGUgZHJpdmVyIHNob3VsZAo+PiBhZHZl
cnRpc2UgUzI0XzNMRS4KPiAKPiBJdCBzaG91bGQgYmUgUzI0X0xFLCBidXQgc2VlbXMgd2Ugc3Rp
bGwgZG9uJ3Qga25vdyBmb3Igc3VyZS4KCldoeT8KCj4+PiBUaGUgdjUuNSBrZXJuZWwgaXMgcmVs
ZWFzZWQgbm93IHdpdGggdGhlIGJyb2tlbiBhdWRpbyBhbmQgYXBwYXJlbnRseQo+Pj4gZ2V0dGlu
ZyAyNGJpdCB0byB3b3JrIHdvbid0IGJlIHRyaXZpYWwgKGlmIHBvc3NpYmxlIGF0IGFsbCkuIEJl
biwgY291bGQKPj4+IHlvdSBwbGVhc2Ugc2VuZCBhIHBhdGNoIHRvIGZpeCB2NS41IGJ5IHJlbW92
aW5nIHRoZSBTMjQgc3VwcG9ydAo+Pj4gYWR2ZXJ0aXNlbWVudCBmcm9tIHRoZSBkcml2ZXI/Cj4+
Cj4+IFdoeSBpcyB0aGF0IHRoZSBiZXN0IGZpeCByYXRoZXIgdGhhbiBqdXN0IGFkdmVydGlzaW5n
IHRoZSBmb3JtYXQKPj4gaW1wbGVtZW50ZWQgYnkgdGhlIGRyaXZlcj8KPiAKPiBUaGUgY3VycmVu
dGx5IHN1cHBvcnRlZCBmb3JtYXQgdGhhdCBpcyBrbm93biB0byB3b3JrIHdlbGwgaXMgUzE2X0xF
Lgo+IAo+IEknbSBzdWdnZXN0aW5nIHRvIGRyb3AgdGhlIFMyNF9MRSBhbmQgUzMyX0xFIHRoYXQg
d2VyZSBhZGRlZCBieSB0aGUKPiBhcHBsaWVkIHBhdGNoZXMgc2ltcGx5IGJlY2F1c2UgdGhpcyBz
ZXJpZXMgd2Fzbid0IHRlc3RlZCBwcm9wZXJseSBiZWZvcmUKPiBpdCB3YXMgc2VudCBvdXQgYW5k
IHR1cm5lZCBvdXQgdGhhdCBpdCBkb2Vzbid0IHdvcmsgd2VsbC4KClMzMl9MRSBzaG91bGQgYmUg
ZmluZSwgaG93ZXZlciwgSSBkbyBoYXZlIHNvbWUgY29uY2VybnMgYWJvdXQgUzI0X0xFLgoKSm9u
CgotLSAKbnZwdWJsaWMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
