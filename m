Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0A14AA63
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 20:22:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2473A847;
	Mon, 27 Jan 2020 20:21:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2473A847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580152936;
	bh=GcYzYUmHAAPXNxYUNAKBy9ZlFvDhXc0tgjIkCpLcFK4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ORRc7dRep2hwhNzD5DLE2EKqBSt8IQ0qfdU8bsrJOGMgk2//KAY/zh6j6vJ4FrmU2
	 bDv9jIC4vsNgLoLIhkNxgu56pemmQl5WnvB/RQIDREieDJCJvgvZMCldCPPuTBqYks
	 UEY5bLnVGv6ThAL62AX4NLK52/2OiiJ06tsU1zew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E4BF80234;
	Mon, 27 Jan 2020 20:20:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B8E3F8021E; Mon, 27 Jan 2020 20:20:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_1,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70FB2F80082
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 20:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70FB2F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NauE/QhW"
Received: by mail-lf1-x143.google.com with SMTP id v201so7073061lfa.11
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 11:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LJiaXgjICgo/XXAUdR4g5JkrfL49KD8QaesWIJOnGz0=;
 b=NauE/QhWzu3qJtxuIML9TCqc8tf36t5NqGU+o1PDEVDHHqKbM64pWaHr0ZjGlUkXda
 ATuVfCWZdIPKZ5Q/ch29etOR/PgD/Aio1v1DLjFe1U7QavLvdxu6ePQWwztda5AkV1R9
 gdTmrMXSE89gXyxdnrS3z40aYYDwo00Iq+C7FmRdHJSX/PS0Ln14GxE1M+B/2AslIdkR
 ZxpgBl/aWrJTywktAD53TOK5iSlAymZ6HoknmbHsZzZ56WMlUH0LMeKuhOKhy7FIriMT
 a9ZN0XqohZxzaq+31IwhC/AGDO+8aQAJ3F3b1T/IBkEY8lKXHbonsh1VCg2A4G/FAYfz
 zmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LJiaXgjICgo/XXAUdR4g5JkrfL49KD8QaesWIJOnGz0=;
 b=Vtl/QHLUxPVy3c5IzN4/YkELDDbQvJ4WppgZF7vLxGiF/s8AI0ctJgPd6nnSmYm94/
 jejFVwLVoj6BcB3vxqOto78dJsdQUik0hO3BJ2Ft9nbmv1EcfcUYCN41r/fPZoBPTIZL
 I3XeCuXntLqxV/m8Iz9n7dFlZwmSPk8t+okUe/Gbk1U6oHxPFLQ/P4NJHbf2HfIWPxw8
 0GnChFCDiYBHj6HfaormzkXuv0/1qO2hYF0ZANN72+P9vepvkBja7/ebi9G6i13+m7OS
 /GvhpuSVyCFnFe9BGQwvoP7D0Bd7ejwoOEpywG0sCWo0Aad0JKzN5fxCLEIWIEN9/Nbj
 dzMA==
X-Gm-Message-State: APjAAAW3GzBpWsG0uZltpkSbp5iQBH8nhW5EiaDn38p+RWx8i26OEMw1
 n7xanO8Lm7Vn5FhVNteqvws=
X-Google-Smtp-Source: APXvYqwLNSx1MHDPVT4gI3iQhfSP9gKoKX5WZYRDmLOPtTZTm5/6/rYRULOLNodZkIglsTUu17onug==
X-Received: by 2002:ac2:489b:: with SMTP id x27mr88558lfc.130.1580152829250;
 Mon, 27 Jan 2020 11:20:29 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id n13sm8620864lji.91.2020.01.27.11.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 11:20:28 -0800 (PST)
To: Jon Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
Date: Mon, 27 Jan 2020 22:20:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
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

MjQuMDEuMjAyMCAxOTo1MCwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDIzLzAxLzIw
MjAgMTk6MzgsIEJlbiBEb29rcyB3cm90ZToKPj4gT24gMDcvMDEvMjAyMCAwMTozOSwgRG1pdHJ5
IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMDYuMDEuMjAyMCAyMjowMCwgQmVuIERvb2tzINC/0LjRiNC1
0YI6Cj4+Pj4gT24gMDUvMDEvMjAyMCAxMDo1MywgQmVuIERvb2tzIHdyb3RlOgo+Pj4+Pgo+Pj4+
Pgo+Pj4+PiBPbiAyMDIwLTAxLTA1IDAxOjQ4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+
PiAwNS4wMS4yMDIwIDAzOjA0LCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4+PiBbc25pcF0K
Pj4+Pj4+Pgo+Pj4+Pj4+IEkndmUganVzdCBnb25lIHRocm91Z2ggdGVzdGluZy4KPj4+Pj4+Pgo+
Pj4+Pj4+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMgc2hvdyAxNiBhbmQgMzItYml0cyB3b3JrLgo+
Pj4+Pj4+Cj4+Pj4+Pj4gVGhlIDI0IGJpdCBjYXNlIHNlZW1zIHRvIGJlIHdlaXJkLCBpdCBsb29r
cyBsaWtlIHRoZSAyNC1iaXQgZXhwZWN0cwo+Pj4+Pj4+IDI0IGJpdCBzYW1wbGVzIGluIDMyIGJp
dCB3b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+Pj4+Pj4+IGRvIDI0
IGJpdCBpbiAyNCBiaXQsIHNvIHdlIG1heSBoYXZlIHRvIHJlbW92ZSAyNCBiaXQgc2FtcGxlIHN1
cHBvcnQKPj4+Pj4+PiAod2hpY2ggaXMgYSBzaGFtZSkKPj4+Pj4+Pgo+Pj4+Pj4+IE15IHByZWZl
cmVuY2UgaXMgdG8gcmVtb3ZlIHRoZSAyNC1iaXQgc3VwcG9ydCBhbmQga2VlcCB0aGUgMzIgYml0
IGluLgo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gSW50ZXJlc3RpbmcuLiBKb24sIGNvdWxkIHlvdSBw
bGVhc2UgY29uZmlybSB0aGF0IDI0Yml0IGZvcm1hdCBpc24ndAo+Pj4+Pj4gdXNhYmxlIG9uIFQz
MD8KPj4+Pj4KPj4+Pj4gSWYgdGhlcmUgaXMgYW4gb3B0aW9uIG9mIDI0IHBhY2tlZCBpbnRvIDMy
LCB0aGVuIEkgdGhpbmsgdGhhdCB3b3VsZAo+Pj4+PiB3b3JrLgo+Pj4+Pgo+Pj4+PiBJIGNhbiB0
cnkgdGVzdGluZyB0aGF0IHdpdGggcmF3IGRhdGEgb24gTW9uZGF5Lgo+Pj4+Cj4+Pj4gSSBuZWVk
IHRvIGNoZWNrIHNvbWUgdGhpbmdzLCBJIGFzc3VtZWQgMjQgd2FzIDI0IHBhY2tlZCBiaXRzLCBp
dCBsb29rcwo+Pj4+IGxpa2UgdGhlIGRlZmF1bHQgaXMgMjQgaW4gMzIgYml0cyBzbyB3ZSBtYXkg
YmUgb2suIEhvd2V2ZXIgSSBuZWVkIHRvCj4+Pj4gcmUtd3JpdGUgbXkgdGVzdCBjYXNlIHdoaWNo
IGFzc3VtZWQgaXQgd2FzIDI0Yml0cyBpbiAzIGJ5dGVzIChTMjRfM0xFKS4KPj4+Pgo+Pj4+IEkn
bGwgZm9sbG93IHVwIGxhdGVyLAo+Pj4KPj4+IE9rYXksIHRoZSBTMjRfM0xFIGlzbid0IHN1cHBv
cnRlZCBieSBSVDU2NDAgY29kZWMgaW4gbXkgY2FzZS4gSSBicmllZmx5Cj4+PiBsb29rZWQgdGhy
b3VnaCB0aGUgVFJNIGRvYyBhbmQgZ290IGltcHJlc3Npb24gdGhhdCBBSFVCIGNvdWxkIHJlLXBh
Y2sKPj4+IGRhdGEgc3RyZWFtIGludG8gc29tZXRoaW5nIHRoYXQgY29kZWMgc3VwcG9ydHMsIGJ1
dCBtYXliZSBpdCdzIGEgd3JvbmcKPj4+IGltcHJlc3Npb24uCj4+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4KPj4gSSBkaWQgYSBxdWljayB0ZXN0IHdpdGggdGhlIGZvbGxv
d2luZzoKPj4KPj4gwqBzb3ggLW4gLWIgMTYgLWMgMiAtciA0NDEwMCAvdG1wL3RtcC53YXbCoCBz
eW50aCBzaW5lIDUwMCB2b2wgMC41Cj4+IMKgc294IC1uIC1iIDI0IC1jIDIgLXIgNDQxMDAgL3Rt
cC90bXAud2F2wqAgc3ludGggc2luZSA1MDAgdm9sIDAuNQo+PiDCoHNveCAtbiAtYiAzMiAtYyAy
IC1yIDQ0MTAwIC90bXAvdG1wLndhdsKgIHN5bnRoIHNpbmUgNTAwIHZvbCAwLjUKPj4KPj4gVGhl
IDE2IGFuZCAzMiB3b3JrIGZpbmUsIHRoZSAyNCBpcyBzaG93aW5nIGEgcGxheWJhY2sgb3V0cHV0
IGZyZXEKPj4gb2YgNDQwSHogaW5zdGVhZCBvZiA1MDBIei4uLiB0aGlzIHN1Z2dlc3RzIHRoZSBj
bG9jayBpcyBvZmYsIG9yIHRoZXJlCj4+IGlzIHNvbWV0aGluZyBlbHNlIHdlaXJkIGdvaW5nIG9u
Li4uCj4gCj4gSSB3YXMgbG9va2luZyBhdCB1c2luZyBzb3ggdG8gY3JlYXRlIHN1Y2ggYXMgZmls
ZSwgYnV0IHRoZSBhYm92ZSBjb21tYW5kCj4gZ2VuZXJhdGVzIGEgUzI0XzNMRSBmaWxlIGFuZCBu
b3QgUzI0X0xFIGZpbGUuIFRoZSBjb2RlYyBvbiBKZXRzb24tVEsxCj4gc3VwcG9ydHMgUzI0X0xF
IGJ1dCBkb2VzIG5vdCBzdXBwb3J0IFMyNF8zTEUgYW5kIHNvIEkgY2Fubm90IHRlc3QgdGhpcy4K
PiBBbnl3YXksIHdlIHJlYWxseSBuZWVkIHRvIHRlc3QgUzI0X0xFIGFuZCBub3QgUzI0XzNMRSBi
ZWNhdXNlIHRoaXMgaXMKPiB0aGUgcHJvYmxlbSB0aGF0IERtaXRyeSBpcyBoYXZpbmcuCj4gCj4g
QmVuIGlzIFMyNF8zTEUgd2hhdCB5b3UgcmVhbGx5IG5lZWQgdG8gc3VwcG9ydD8KPiAKPiBEbWl0
cnksIGRvZXMgdGhlIGZvbGxvd2luZyBmaXggeW91ciBwcm9ibGVtPwo+IAo+IGRpZmYgLS1naXQg
YS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMw
X2kycy5jCj4gaW5kZXggZGJlZDNjNTQwOGU3Li45Mjg0NWM0YjYzZjQgMTAwNjQ0Cj4gLS0tIGEv
c291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPiArKysgYi9zb3VuZC9zb2MvdGVncmEvdGVn
cmEzMF9pMnMuYwo+IEBAIC0xNDAsNyArMTQwLDcgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19o
d19wYXJhbXMoc3RydWN0Cj4gc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPiAgICAgICAg
ICAgICAgICAgYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPiAgICAgICAg
ICAgICAgICAgc2FtcGxlX3NpemUgPSAxNjsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gLSAg
ICAgICBjYXNlIFNORFJWX1BDTV9GT1JNQVRfUzI0X0xFOgo+ICsgICAgICAgY2FzZSBTTkRSVl9Q
Q01fRk9STUFUX1MyNF8zTEU6Cj4gICAgICAgICAgICAgICAgIHZhbCA9IFRFR1JBMzBfSTJTX0NU
UkxfQklUX1NJWkVfMjQ7Cj4gICAgICAgICAgICAgICAgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FV
RElPQ0lGX0JJVFNfMjQ7Cj4gICAgICAgICAgICAgICAgIHNhbXBsZV9zaXplID0gMjQ7Cj4gQEAg
LTMxOCw3ICszMTgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcgo+
IHRlZ3JhMzBfaTJzX2RhaV90ZW1wbGF0ZSA9IHsKPiAgICAgICAgICAgICAgICAgLmNoYW5uZWxz
X21heCA9IDIsCj4gICAgICAgICAgICAgICAgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBf
OTYwMDAsCj4gICAgICAgICAgICAgICAgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJf
TEUgfAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xF
IHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF8zTEUg
fAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+
ICAgICAgICAgfSwKPiAgICAgICAgIC5jYXB0dXJlID0gewo+IEBAIC0zMjcsNyArMzI3LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIKPiB0ZWdyYTMwX2kyc19kYWlf
dGVtcGxhdGUgPSB7Cj4gICAgICAgICAgICAgICAgIC5jaGFubmVsc19tYXggPSAyLAo+ICAgICAg
ICAgICAgICAgICAucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAo+ICAgICAgICAg
ICAgICAgICAuZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFIHwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgU05EUlZfUENNX0ZNVEJJVF9TMjRfM0xFIHwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPiAgICAgICAgIH0sCj4gICAg
ICAgICAub3BzID0gJnRlZ3JhMzBfaTJzX2RhaV9vcHMsCj4gCj4gSm9uCj4gCgpJdCBzaG91bGQg
c29sdmUgdGhlIHByb2JsZW0gaW4gbXkgcGFydGljdWxhciBjYXNlLCBidXQgSSdtIG5vdCBzdXJl
IHRoYXQKdGhlIHNvbHV0aW9uIGlzIGNvcnJlY3QuCgpUaGUgdjUuNSBrZXJuZWwgaXMgcmVsZWFz
ZWQgbm93IHdpdGggdGhlIGJyb2tlbiBhdWRpbyBhbmQgYXBwYXJlbnRseQpnZXR0aW5nIDI0Yml0
IHRvIHdvcmsgd29uJ3QgYmUgdHJpdmlhbCAoaWYgcG9zc2libGUgYXQgYWxsKS4gQmVuLCBjb3Vs
ZAp5b3UgcGxlYXNlIHNlbmQgYSBwYXRjaCB0byBmaXggdjUuNSBieSByZW1vdmluZyB0aGUgUzI0
IHN1cHBvcnQKYWR2ZXJ0aXNlbWVudCBmcm9tIHRoZSBkcml2ZXI/Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
