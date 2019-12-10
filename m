Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 606BA11A4A9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 07:43:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2095166A;
	Wed, 11 Dec 2019 07:42:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2095166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576046627;
	bh=+g6GT9bq4Bwo9HFltEPpmqj9VnNHr6ijlFEWrlKpTSk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rh2P9R42doWaJmoRPL9sxiIWlZfLEI8Y3475bPOay3iAbpXU1Se4ddtq68HvpolyZ
	 1c0+x0EVwCmd1zau6JBF1UKlzfa8kBN/PnTna8VLbzr0nc1sF8saEKC27w1Vj1ZGPD
	 SHkIHGJHS9NaDg48DF7edAVv1vtbE5W4h6X0CQXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61785F8027C;
	Wed, 11 Dec 2019 07:38:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03990F8020C; Tue, 10 Dec 2019 21:32:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48E3FF800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 21:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48E3FF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IyTk5iPn"
Received: by mail-lf1-x141.google.com with SMTP id b15so14813836lfc.4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 12:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8PGr6iFXqcH5u2siMcozfGqSHbu6yt+vqLtRq5b4v6M=;
 b=IyTk5iPnIDMKfFHAyFcx8JzsVzLa2UdoTMeDdm7G4jE3shioDRJb8wX7IskqJAGRow
 Bs7cv1SF5Z8LpaAdlo0TOvedUsnQJAF4oQML/UzLmVmPbuJZiFV8/+ug/HcTngZQjSWA
 fKsoCE7DPAaqSQgSkfyKCa3t/FV0wwNZyJlTT+mqx+2cUf78H0D7pULivx+hhsovDOTn
 XQ50BZ6wZJ7Fpy4js0j/NbzHPQfbmYn0OwoOuGYBtWDbSn9XUghNxaKKZdA0bNdppYfh
 Wpd5COMMUxCdJyK/qQyrDCTvz5sIHpglMxa6UUZfu86eeDl/TvWeBRgB5muNNqIjDNe5
 cO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8PGr6iFXqcH5u2siMcozfGqSHbu6yt+vqLtRq5b4v6M=;
 b=rRcxqc9zq8Jcznj8Ym1bRU2o76iRrW6uV5i/xLeC/53ZvZLOJXrGaNg4Kuppnb+teM
 9bd8gCigvTmhraLYLsfDXUqOm+qUn0JXXQD6k1GHlR4uZBFIVTcOzNOWZvqn0s0rEGzs
 Sfbhnnt6qUDoWuwWR37hu2SK0go3e6ATRFDc+ICws4gNaQqCCEOOqB3tVHdJptYN4xe0
 tNuRFD4Ov3dbN0X34/n/K2uy1fCnsNYX4kipekUWubOjgWIwYbYdcvtWDAm8x6KPXcbD
 fLvDf7Te5z2j+i5nJMyRnfBh2RWQ/Qu3oxLy2gCoJqZ3ZIr+xClfbMH68TgOq6AiO5Kb
 Lx2Q==
X-Gm-Message-State: APjAAAURYWA78NjSqthTtHzLccXjAg3d5p3s9sWpnTBU0sx5TxMD9nkX
 JTk2HHwv54sYrT31F7cmdNYwWkVv
X-Google-Smtp-Source: APXvYqygJGjv3y7p8+QV+ErPle5+A2IkBFU3QJPycgtjC67SRuybF7hWpB19CKr121VXentSRjbjGg==
X-Received: by 2002:a19:491a:: with SMTP id w26mr6897711lfa.98.1576009920603; 
 Tue, 10 Dec 2019 12:32:00 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id g27sm2176381lfh.57.2019.12.10.12.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 12:32:00 -0800 (PST)
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-4-git-send-email-skomatineni@nvidia.com>
 <7cf4ff77-2f33-4ee5-0e09-5aa6aef3e8be@gmail.com>
 <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
 <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
 <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <db3bee1e-1bfa-2f9e-9ed1-91b98554556a@gmail.com>
 <22a2f8bd-561d-f4c6-4eef-bb61095c53b2@nvidia.com>
 <5a5cfa74-66be-5c7a-04eb-88c355851c59@gmail.com>
 <302d8483-513c-9c20-e4d4-1e24f2b317d6@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c8208be6-6471-9963-26ee-67579846b1ff@gmail.com>
Date: Tue, 10 Dec 2019 23:31:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <302d8483-513c-9c20-e4d4-1e24f2b317d6@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Dec 2019 07:38:39 +0100
Cc: alsa-devel@alsa-project.org, pgaikwad@nvidia.com, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, josephl@nvidia.com, linux-clk@vger.kernel.org,
 arnd@arndb.de, daniel.lezcano@linaro.org, krzk@kernel.org,
 mturquette@baylibre.com, devicetree@vger.kernel.org, mmaddireddy@nvidia.com,
 markz@nvidia.com, alexios.zavras@intel.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, tiwai@suse.com,
 allison@lohutok.net, pdeschrijver@nvidia.com, lgirdwood@gmail.com,
 vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
Subject: Re: [alsa-devel] [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock
 registrations into PMC driver
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

MTAuMTIuMjAxOSAyMjoxOCwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IAo+IE9u
IDEyLzEwLzE5IDEwOjMwIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDEwLjEyLjIwMTkg
MjA6NDgsIFNvd2phbnlhIEtvbWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+IE9uIDEyLzEwLzE5IDk6
NDEgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+PiAwOS4xMi4yMDE5IDIzOjQ2LCBTb3dq
YW55YSBLb21hdGluZW5pINC/0LjRiNC10YI6Cj4+Pj4+IE9uIDEyLzkvMTkgMTI6MTIgUE0sIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4+IDA4LjEyLjIwMTkgMDA6MzYsIFNvd2phbnlhIEtv
bWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+Pj4+PiBPbiAxMi83LzE5IDExOjU5IEFNLCBTb3dqYW55
YSBLb21hdGluZW5pIHdyb3RlOgo+Pj4+Pj4+PiBPbiAxMi83LzE5IDg6MDAgQU0sIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPj4+Pj4+Pj4+IDA3LjEyLjIwMTkgMTg6NTMsIERtaXRyeSBPc2lwZW5r
byDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4+IDA3LjEyLjIwMTkgMTg6NDcsIERtaXRyeSBPc2lwZW5r
byDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4+PiAwNy4xMi4yMDE5IDE3OjI4LCBEbWl0cnkgT3NpcGVu
a28g0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+Pj4+IDA2LjEyLjIwMTkgMDU6NDgsIFNvd2phbnlhIEtv
bWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+Pj4+PiBUZWdyYTIxMCBhbmQgcHJpb3IgVGVn
cmEgUE1DIGhhcyBjbGtfb3V0XzEsIGNsa19vdXRfMiwKPj4+Pj4+Pj4+Pj4+PiBjbGtfb3V0XzMK
Pj4+Pj4+Pj4+Pj4+PiB3aXRoCj4+Pj4+Pj4+Pj4+Pj4gbXV4IGFuZCBnYXRlIGZvciBlYWNoIG9m
IHRoZXNlIGNsb2Nrcy4KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IEN1cnJlbnRseSB0aGVz
ZSBQTUMgY2xvY2tzIGFyZSByZWdpc3RlcmVkIGJ5IFRlZ3JhIGNsb2NrCj4+Pj4+Pj4+Pj4+Pj4g
ZHJpdmVyCj4+Pj4+Pj4+Pj4+Pj4gdXNpbmcKPj4+Pj4+Pj4+Pj4+PiBjbGtfcmVnaXN0ZXJfbXV4
IGFuZCBjbGtfcmVnaXN0ZXJfZ2F0ZSBieSBwYXNzaW5nIFBNQyBiYXNlCj4+Pj4+Pj4+Pj4+Pj4g
YWRkcmVzcwo+Pj4+Pj4+Pj4+Pj4+IGFuZCByZWdpc3RlciBvZmZzZXRzIGFuZCBQTUMgcHJvZ3Jh
bW1pbmcgZm9yIHRoZXNlIGNsb2Nrcwo+Pj4+Pj4+Pj4+Pj4+IGhhcHBlbnMKPj4+Pj4+Pj4+Pj4+
PiB0aHJvdWdoIGRpcmVjdCBQTUMgYWNjZXNzIGJ5IHRoZSBjbG9jayBkcml2ZXIuCj4+Pj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBXaXRoIHRoaXMsIHdoZW4gUE1DIGlzIGluIHNlY3VyZSBtb2Rl
IGFueSBkaXJlY3QgUE1DIGFjY2Vzcwo+Pj4+Pj4+Pj4+Pj4+IGZyb20gdGhlCj4+Pj4+Pj4+Pj4+
Pj4gbm9uLXNlY3VyZSB3b3JsZCBkb2VzIG5vdCBnbyB0aHJvdWdoIGFuZCB0aGVzZSBjbG9ja3Mg
d2lsbAo+Pj4+Pj4+Pj4+Pj4+IG5vdCBiZQo+Pj4+Pj4+Pj4+Pj4+IGZ1bmN0aW9uYWwuCj4+Pj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgdGhlc2UgY2xvY2tzIHJlZ2lz
dHJhdGlvbiB3aXRoIFBNQyBhcyBhIGNsb2NrCj4+Pj4+Pj4+Pj4+Pj4gcHJvdmlkZXIKPj4+Pj4+
Pj4+Pj4+PiBmb3IgdGhlc2UgY2xvY2tzLiBjbGtfb3BzIGNhbGxiYWNrIGltcGxlbWVudGF0aW9u
cyBmb3IgdGhlc2UKPj4+Pj4+Pj4+Pj4+PiBjbG9ja3MKPj4+Pj4+Pj4+Pj4+PiB1c2VzIHRlZ3Jh
X3BtY19yZWFkbCBhbmQgdGVncmFfcG1jX3dyaXRlbCB3aGljaCBzdXBwb3J0cyBQTUMKPj4+Pj4+
Pj4+Pj4+PiBwcm9ncmFtbWluZwo+Pj4+Pj4+Pj4+Pj4+IGluIHNlY3VyZSBtb2RlIGFuZCBub24t
c2VjdXJlIG1vZGUuCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBT
b3dqYW55YSBLb21hdGluZW5pIDxza29tYXRpbmVuaUBudmlkaWEuY29tPgo+Pj4+Pj4+Pj4+Pj4+
IC0tLQo+Pj4+Pj4+Pj4+PiBbc25pcF0KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiArCj4+Pj4+
Pj4+Pj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29wcyBwbWNfY2xrX2dhdGVfb3BzID0g
ewo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgLmlzX2VuYWJsZWQgPSBwbWNfY2xrX2lzX2VuYWJsZWQs
Cj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCAuZW5hYmxlID0gcG1jX2Nsa19lbmFibGUsCj4+Pj4+Pj4+
Pj4+Pj4gK8KgwqDCoCAuZGlzYWJsZSA9IHBtY19jbGtfZGlzYWJsZSwKPj4+Pj4+Pj4+Pj4+PiAr
fTsKPj4+Pj4+Pj4+Pj4+IFdoYXQncyB0aGUgYmVuZWZpdCBvZiBzZXBhcmF0aW5nIEdBVEUgZnJv
bSB0aGUgTVVYPwo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IEkgdGhpbmsgaXQgY291bGQgYmUg
YSBzaW5nbGUgY2xvY2suCj4+Pj4+Pj4+Pj4+IEFjY29yZGluZyB0byBUUk06Cj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+IDEuIEdBVEUgYW5kIE1VWCBhcmUgc2VwYXJhdGUgZW50aXRpZXMuCj4+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IDIuIEdBVEUgaXMgdGhlIHBhcmVudCBvZiBNVVggKHNlZSBQTUMn
cyBDTEtfT1VUIHBhdGhzIGRpYWdyYW0gaW4KPj4+Pj4+Pj4+Pj4gVFJNKS4KPj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4gMy4gUE1DIGRvZXNuJ3QgZ2F0ZSBFWFRQRVJJUEggY2xvY2sgYnV0IGNvdWxk
ICJmb3JjZS1lbmFibGUiIGl0LAo+Pj4+Pj4+Pj4+PiBjb3JyZWN0Pwo+Pj4+Pj4+IFdhcyBmb2xs
b3dpbmcgZXhpc3RpbmcgY2xrLXRlZ3JhLXBtYyBhcyBJIGFtIG5vdCBzdXJlIG9mIHJlYXNvbiBm
b3IKPj4+Pj4+PiBoYXZpbmcgdGhlc2UgY2xvY2tzIHJlZ2lzdGVyZWQgYXMgc2VwYXJhdGUgbXV4
IGFuZCBnYXRlIGNsb2Nrcy4KPj4+Pj4+Pgo+Pj4+Pj4+IFllcywgUE1DIGNsb2NrcyBjYW4gYmUg
cmVnaXN0ZXJlZCBhcyBzaW5nbGUgY2xvY2sgYW5kIGNhbiB1c2UKPj4+Pj4+PiBjbGtfb3BzCj4+
Pj4+Pj4gZm9yIHNldC9nZXQgcGFyZW50IGFuZCBlbmFibGUvZGlzYWJsZS4KPj4+Pj4+Pgo+Pj4+
Pj4+IGVuYWJsZS9kaXNhYmxlIG9mIFBNQyBjbG9ja3MgaXMgZm9yIGZvcmNlLWVuYWJsZSB0byBm
b3JjZSB0aGUKPj4+Pj4+PiBjbG9jayB0bwo+Pj4+Pj4+IHJ1biByZWdhcmRsZXNzIG9mIEFDQ0VQ
VF9SRVEgb3IgSU5WRVJUX1JFUS4KPj4+Pj4+Pgo+Pj4+Pj4+Pj4+IDQuIGNsa19tX2RpdjIvNCBh
cmUgaW50ZXJuYWwgUE1DIE9TQyBkaXZpZGVycyBhbmQgdGh1cyB0aGVzZQo+Pj4+Pj4+Pj4+IGNs
b2Nrcwo+Pj4+Pj4+Pj4+IHNob3VsZCBiZWxvbmcgdG8gUE1DLgo+Pj4+Pj4+Pj4gQWxzbywgaXQg
c2hvdWxkIGJlICJvc2MiIGFuZCBub3QgImNsa19tIi4KPj4+Pj4+Pj4gSSBmb2xsb3dlZCB0aGUg
c2FtZSBwYXJlbnRzIGFzIGl0IHdlcmUgaW4gZXhpc3RpbmcgY2xrLXRlZ3JhLXBtYwo+Pj4+Pj4+
PiBkcml2ZXIuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFllYWggdGhleSBhcmUgd3JvbmcgYW5kIHRoZXkg
c2hvdWxkIGJlIGZyb20gb3NjIGFuZCBub3QgY2xrX20uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdpbGwg
Zml4IGluIG5leHQgdmVyc2lvbi4KPj4+Pj4+Pj4KPj4+Pj4+IENvdWxkIHlvdSBwbGVhc2UgZGVz
Y3JpYmUgdGhlIGZ1bGwgRVhUUEVSSVBIIGNsb2NrIHRvcG9sb2d5IGFuZAo+Pj4+Pj4gaG93IHRo
ZQo+Pj4+Pj4gcGlubXV4IGNvbmZpZ3VyYXRpb24gaXMgcmVsYXRlZCB0byBpdCBhbGw/Cj4+Pj4+
Pgo+Pj4+Pj4gV2hhdCBpcyBpbnRlcm5hbCB0byB0aGUgVGVncmEgY2hpcCBhbmQgd2hhdCBhcmUg
dGhlIGV4dGVybmFsIG91dHB1dHM/Cj4+Pj4+Pgo+Pj4+Pj4gSXMgaXQgcG9zc2libGUgdG8gYnlw
YXNzIFBNQyBvbiBUMzArIGZvciB0aGUgRVhUUEVSSVBIIGNsb2Nrcz8KPj4+Pj4gUE1DIENMSzEv
Mi8zIHBvc3NpYmxlIHNvdXJjZXMgYXJlIE9TQ19ESVYxLCBPU0NfRElWMiwgT1NDX0RJVjQsCj4+
Pj4+IEVYVFBFUklQSCBmcm9tIENBUi4KPj4+Pj4KPj4+Pj4gT1NDX0RJVjEvMi80IGFyZSB3aXRo
IGludGVybmFsIGRpdmlkZXJzIGF0IHRoZSBPU0MgUGFkcwo+Pj4+Pgo+Pj4+PiBFWFRQRVJJUEgg
aXMgZnJvbSBDQVIgYW5kIGl0IGhhcyByZXNldCBhbmQgZW5hYmxlIGNvbnRyb2xzIGFsb25nIHdp
dGgKPj4+Pj4gY2xvY2sgc291cmNlIHNlbGVjdGlvbnMgdG8gY2hvb3NlIG9uZSBvZiB0aGUgUExM
QV9PVVQwLCBDTEtfUywKPj4+Pj4gUExMUF9PVVQwLCBDTEtfTSwgUExMRV9PVVQwCj4+Pj4gQXJl
IHlvdSBzdXJlIHRoYXQgRVhUUEVSSVBIIGhhcyBhIHJlc2V0PyBXaGF0IHdpbGwgaXQgcmVzZXQ/
IFdoeSBpdCdzCj4+Pj4gbm90IGRvY3VtZW50ZWQgaW4gVFJNPwo+Pj4gWWVzLCBFeHRwZXJpcGgx
LzIvMyBoYXMgUlNUIHBhcnQgb2YgQ0FSIFJTVF9ERVZJQ0VTX1YgYml0cyAyNC8yNS8yNgo+PiBB
cmUgdGhlc2UgYml0cyBub3QgZG9jdW1lbnRlZCBpbiBhIHB1YmxpYyBUUk1zPyBJIGNoZWNrZWQK
Pj4gVDMwLzExNC8xMjQvMjEwIFRSTXMgYW5kIENMS19SU1RfQ09OVFJPTExFUl9SU1RfREVWSUNF
U19WXzAgZG9lc24ndCBoYXZlCj4+IHRob3NlIGJpdHMgaW4gdGhlIGRvY3MuCj4+Cj4gWWVhaCB0
aGVzZSBiaXRzIGFyZSBtaXNzaW5nIGluIGFsbCBUZWdyYSBUUk0gZG9jcy4gV2lsbCByZXF1ZXN0
IGZvcgo+IGhhdmluZyBFWFRQRVJJUEggcmVzZXQgYml0cyB0byBiZSB1cGRhdGVkIGluIFRSTS4u
LgoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
