Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C36311A4A5
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 07:42:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 146AF165F;
	Wed, 11 Dec 2019 07:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 146AF165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576046546;
	bh=pgHEYdcKaJJc2yKOtaz8pi4erRjxpPcDgrc/7zFoMyU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G4NpCMvH/lUxjeLvDWyDPd+FBVSHBedfAmcMwV7w0D93k9UTpgRRItKRNgCciQYaU
	 dO+qlt3okfU75pThnHY9keH3z8Y3kGR6wkZF8LQeuj7r98Nor36njIhUAMA/d1lOik
	 OaXro9j58bMNh1Mjb+Yub0Wlh753LbKl6VItoI20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFD04F8025F;
	Wed, 11 Dec 2019 07:38:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1F2CF8020C; Tue, 10 Dec 2019 19:30:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65737F8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 19:30:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65737F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X/8vG0ml"
Received: by mail-lf1-x142.google.com with SMTP id 15so14556876lfr.2
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 10:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qJU4Pmn8p+BP6WtR4OMNjM0SlbVb7r9lcUi4XdHIpn4=;
 b=X/8vG0mliUAaIF4AfnO5i7Xkz0m6r0I1Guf84MbCuz9S76xmx4xu/0UiO32//pvXxl
 I+SYlBnp2QkEqd1Td3/X9xRrrYwwoZPSucVDR4luj0Bq+LC6c6y+QUU4ITNMep/ISIag
 YiHUno0cnwaF4V+dCzvQFmBt3VxXvVEA19HrnKjaPbI0ApizKiFWEFqig6jKb3Ft7wf9
 m6Rh7P1C/ZnJvCNbQFw6shgZuNq0gjdey2Cy78F1sO0jLbUXdNb+JAHKJRgIf8TgIiwW
 03hIVUOa9YUiEZdWTX3Zjbd6qqyE7w1PQqA3iDFJUFBzyy5HDMpEXCd4DGKiJCgfnEOf
 6ZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qJU4Pmn8p+BP6WtR4OMNjM0SlbVb7r9lcUi4XdHIpn4=;
 b=K/yzKDQovvOB51/NJ3UcfQfWBe762B/8j8m53S0v6Gu7I9BVpCsU/QElm9433/m6cJ
 bMZD6cMoiCRX0yTColiKkFqE1gE2fud0LEYhntKTkaNuBF24a8iM081gW8qGFR5HLLKy
 zHUUJJxFM+ExP/5d8wlHy8KlGSSEJ4UzuRIdz7S40pt/fKj+nOZDC4xeWVfmkY8rWnJE
 CoU3NJ1gkXnnpIaoPBHHWn8urpkCP0J6woJnceuXRd3pW2vVdMVVUMTqCHGc/Zq4fsvj
 +T+kPfv+27iE1nIk0bfWq0hAWqEarLWhU0qTlvRdnE95Lm+KyGN37J9jNWUpes30MW2p
 t+7g==
X-Gm-Message-State: APjAAAXip2CbDNm924Zl2swoS3pJ7+SqAEynwatoNfspeAd/secaJtx1
 eTsKr/UQnNnwA3OHcGc1ro3KvHEE
X-Google-Smtp-Source: APXvYqyO2DJRFRYreVbJWU1FOfHdesOW3uMVxL4CrJOhxgLnOJJWcJ1dSr+dh7dlPGifSs3bh7KGqA==
X-Received: by 2002:a19:5013:: with SMTP id e19mr20136293lfb.8.1576002602556; 
 Tue, 10 Dec 2019 10:30:02 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id g5sm2018377lfc.11.2019.12.10.10.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 10:30:01 -0800 (PST)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a5cfa74-66be-5c7a-04eb-88c355851c59@gmail.com>
Date: Tue, 10 Dec 2019 21:30:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <22a2f8bd-561d-f4c6-4eef-bb61095c53b2@nvidia.com>
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

MTAuMTIuMjAxOSAyMDo0OCwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IAo+IE9u
IDEyLzEwLzE5IDk6NDEgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDkuMTIuMjAxOSAy
Mzo0NiwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+Pj4gT24gMTIvOS8xOSAxMjox
MiBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+IDA4LjEyLjIwMTkgMDA6MzYsIFNvd2ph
bnlhIEtvbWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+Pj4gT24gMTIvNy8xOSAxMTo1OSBBTSwgU293
amFueWEgS29tYXRpbmVuaSB3cm90ZToKPj4+Pj4+IE9uIDEyLzcvMTkgODowMCBBTSwgRG1pdHJ5
IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4+IDA3LjEyLjIwMTkgMTg6NTMsIERtaXRyeSBPc2lwZW5r
byDQv9C40YjQtdGCOgo+Pj4+Pj4+PiAwNy4xMi4yMDE5IDE4OjQ3LCBEbWl0cnkgT3NpcGVua28g
0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+IDA3LjEyLjIwMTkgMTc6MjgsIERtaXRyeSBPc2lwZW5rbyDQ
v9C40YjQtdGCOgo+Pj4+Pj4+Pj4+IDA2LjEyLjIwMTkgMDU6NDgsIFNvd2phbnlhIEtvbWF0aW5l
bmkg0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+Pj4gVGVncmEyMTAgYW5kIHByaW9yIFRlZ3JhIFBNQyBo
YXMgY2xrX291dF8xLCBjbGtfb3V0XzIsIGNsa19vdXRfMwo+Pj4+Pj4+Pj4+PiB3aXRoCj4+Pj4+
Pj4+Pj4+IG11eCBhbmQgZ2F0ZSBmb3IgZWFjaCBvZiB0aGVzZSBjbG9ja3MuCj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+IEN1cnJlbnRseSB0aGVzZSBQTUMgY2xvY2tzIGFyZSByZWdpc3RlcmVkIGJ5
IFRlZ3JhIGNsb2NrIGRyaXZlcgo+Pj4+Pj4+Pj4+PiB1c2luZwo+Pj4+Pj4+Pj4+PiBjbGtfcmVn
aXN0ZXJfbXV4IGFuZCBjbGtfcmVnaXN0ZXJfZ2F0ZSBieSBwYXNzaW5nIFBNQyBiYXNlIGFkZHJl
c3MKPj4+Pj4+Pj4+Pj4gYW5kIHJlZ2lzdGVyIG9mZnNldHMgYW5kIFBNQyBwcm9ncmFtbWluZyBm
b3IgdGhlc2UgY2xvY2tzIGhhcHBlbnMKPj4+Pj4+Pj4+Pj4gdGhyb3VnaCBkaXJlY3QgUE1DIGFj
Y2VzcyBieSB0aGUgY2xvY2sgZHJpdmVyLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBXaXRoIHRo
aXMsIHdoZW4gUE1DIGlzIGluIHNlY3VyZSBtb2RlIGFueSBkaXJlY3QgUE1DIGFjY2Vzcwo+Pj4+
Pj4+Pj4+PiBmcm9tIHRoZQo+Pj4+Pj4+Pj4+PiBub24tc2VjdXJlIHdvcmxkIGRvZXMgbm90IGdv
IHRocm91Z2ggYW5kIHRoZXNlIGNsb2NrcyB3aWxsIG5vdCBiZQo+Pj4+Pj4+Pj4+PiBmdW5jdGlv
bmFsLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgdGhlc2UgY2xvY2tz
IHJlZ2lzdHJhdGlvbiB3aXRoIFBNQyBhcyBhIGNsb2NrCj4+Pj4+Pj4+Pj4+IHByb3ZpZGVyCj4+
Pj4+Pj4+Pj4+IGZvciB0aGVzZSBjbG9ja3MuIGNsa19vcHMgY2FsbGJhY2sgaW1wbGVtZW50YXRp
b25zIGZvciB0aGVzZQo+Pj4+Pj4+Pj4+PiBjbG9ja3MKPj4+Pj4+Pj4+Pj4gdXNlcyB0ZWdyYV9w
bWNfcmVhZGwgYW5kIHRlZ3JhX3BtY193cml0ZWwgd2hpY2ggc3VwcG9ydHMgUE1DCj4+Pj4+Pj4+
Pj4+IHByb2dyYW1taW5nCj4+Pj4+Pj4+Pj4+IGluIHNlY3VyZSBtb2RlIGFuZCBub24tc2VjdXJl
IG1vZGUuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNvd2phbnlhIEtv
bWF0aW5lbmkgPHNrb21hdGluZW5pQG52aWRpYS5jb20+Cj4+Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+
Pj4gW3NuaXBdCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGNsa19vcHMgcG1jX2Nsa19nYXRlX29wcyA9IHsKPj4+Pj4+Pj4+Pj4gK8KgwqDC
oCAuaXNfZW5hYmxlZCA9IHBtY19jbGtfaXNfZW5hYmxlZCwKPj4+Pj4+Pj4+Pj4gK8KgwqDCoCAu
ZW5hYmxlID0gcG1jX2Nsa19lbmFibGUsCj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgLmRpc2FibGUgPSBw
bWNfY2xrX2Rpc2FibGUsCj4+Pj4+Pj4+Pj4+ICt9Owo+Pj4+Pj4+Pj4+IFdoYXQncyB0aGUgYmVu
ZWZpdCBvZiBzZXBhcmF0aW5nIEdBVEUgZnJvbSB0aGUgTVVYPwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4gSSB0aGluayBpdCBjb3VsZCBiZSBhIHNpbmdsZSBjbG9jay4KPj4+Pj4+Pj4+IEFjY29yZGlu
ZyB0byBUUk06Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gMS4gR0FURSBhbmQgTVVYIGFyZSBzZXBhcmF0
ZSBlbnRpdGllcy4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAyLiBHQVRFIGlzIHRoZSBwYXJlbnQgb2Yg
TVVYIChzZWUgUE1DJ3MgQ0xLX09VVCBwYXRocyBkaWFncmFtIGluCj4+Pj4+Pj4+PiBUUk0pLgo+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IDMuIFBNQyBkb2Vzbid0IGdhdGUgRVhUUEVSSVBIIGNsb2NrIGJ1
dCBjb3VsZCAiZm9yY2UtZW5hYmxlIiBpdCwKPj4+Pj4+Pj4+IGNvcnJlY3Q/Cj4+Pj4+IFdhcyBm
b2xsb3dpbmcgZXhpc3RpbmcgY2xrLXRlZ3JhLXBtYyBhcyBJIGFtIG5vdCBzdXJlIG9mIHJlYXNv
biBmb3IKPj4+Pj4gaGF2aW5nIHRoZXNlIGNsb2NrcyByZWdpc3RlcmVkIGFzIHNlcGFyYXRlIG11
eCBhbmQgZ2F0ZSBjbG9ja3MuCj4+Pj4+Cj4+Pj4+IFllcywgUE1DIGNsb2NrcyBjYW4gYmUgcmVn
aXN0ZXJlZCBhcyBzaW5nbGUgY2xvY2sgYW5kIGNhbiB1c2UgY2xrX29wcwo+Pj4+PiBmb3Igc2V0
L2dldCBwYXJlbnQgYW5kIGVuYWJsZS9kaXNhYmxlLgo+Pj4+Pgo+Pj4+PiBlbmFibGUvZGlzYWJs
ZSBvZiBQTUMgY2xvY2tzIGlzIGZvciBmb3JjZS1lbmFibGUgdG8gZm9yY2UgdGhlIGNsb2NrIHRv
Cj4+Pj4+IHJ1biByZWdhcmRsZXNzIG9mIEFDQ0VQVF9SRVEgb3IgSU5WRVJUX1JFUS4KPj4+Pj4K
Pj4+Pj4+Pj4gNC4gY2xrX21fZGl2Mi80IGFyZSBpbnRlcm5hbCBQTUMgT1NDIGRpdmlkZXJzIGFu
ZCB0aHVzIHRoZXNlIGNsb2Nrcwo+Pj4+Pj4+PiBzaG91bGQgYmVsb25nIHRvIFBNQy4KPj4+Pj4+
PiBBbHNvLCBpdCBzaG91bGQgYmUgIm9zYyIgYW5kIG5vdCAiY2xrX20iLgo+Pj4+Pj4gSSBmb2xs
b3dlZCB0aGUgc2FtZSBwYXJlbnRzIGFzIGl0IHdlcmUgaW4gZXhpc3RpbmcgY2xrLXRlZ3JhLXBt
Ywo+Pj4+Pj4gZHJpdmVyLgo+Pj4+Pj4KPj4+Pj4+IFllYWggdGhleSBhcmUgd3JvbmcgYW5kIHRo
ZXkgc2hvdWxkIGJlIGZyb20gb3NjIGFuZCBub3QgY2xrX20uCj4+Pj4+Pgo+Pj4+Pj4gV2lsbCBm
aXggaW4gbmV4dCB2ZXJzaW9uLgo+Pj4+Pj4KPj4+PiBDb3VsZCB5b3UgcGxlYXNlIGRlc2NyaWJl
IHRoZSBmdWxsIEVYVFBFUklQSCBjbG9jayB0b3BvbG9neSBhbmQgaG93IHRoZQo+Pj4+IHBpbm11
eCBjb25maWd1cmF0aW9uIGlzIHJlbGF0ZWQgdG8gaXQgYWxsPwo+Pj4+Cj4+Pj4gV2hhdCBpcyBp
bnRlcm5hbCB0byB0aGUgVGVncmEgY2hpcCBhbmQgd2hhdCBhcmUgdGhlIGV4dGVybmFsIG91dHB1
dHM/Cj4+Pj4KPj4+PiBJcyBpdCBwb3NzaWJsZSB0byBieXBhc3MgUE1DIG9uIFQzMCsgZm9yIHRo
ZSBFWFRQRVJJUEggY2xvY2tzPwo+Pj4gUE1DIENMSzEvMi8zIHBvc3NpYmxlIHNvdXJjZXMgYXJl
IE9TQ19ESVYxLCBPU0NfRElWMiwgT1NDX0RJVjQsCj4+PiBFWFRQRVJJUEggZnJvbSBDQVIuCj4+
Pgo+Pj4gT1NDX0RJVjEvMi80IGFyZSB3aXRoIGludGVybmFsIGRpdmlkZXJzIGF0IHRoZSBPU0Mg
UGFkcwo+Pj4KPj4+IEVYVFBFUklQSCBpcyBmcm9tIENBUiBhbmQgaXQgaGFzIHJlc2V0IGFuZCBl
bmFibGUgY29udHJvbHMgYWxvbmcgd2l0aAo+Pj4gY2xvY2sgc291cmNlIHNlbGVjdGlvbnMgdG8g
Y2hvb3NlIG9uZSBvZiB0aGUgUExMQV9PVVQwLCBDTEtfUywKPj4+IFBMTFBfT1VUMCwgQ0xLX00s
IFBMTEVfT1VUMAo+PiBBcmUgeW91IHN1cmUgdGhhdCBFWFRQRVJJUEggaGFzIGEgcmVzZXQ/IFdo
YXQgd2lsbCBpdCByZXNldD8gV2h5IGl0J3MKPj4gbm90IGRvY3VtZW50ZWQgaW4gVFJNPwo+IFll
cywgRXh0cGVyaXBoMS8yLzMgaGFzIFJTVCBwYXJ0IG9mIENBUiBSU1RfREVWSUNFU19WIGJpdHMg
MjQvMjUvMjYKCkFyZSB0aGVzZSBiaXRzIG5vdCBkb2N1bWVudGVkIGluIGEgcHVibGljIFRSTXM/
IEkgY2hlY2tlZApUMzAvMTE0LzEyNC8yMTAgVFJNcyBhbmQgQ0xLX1JTVF9DT05UUk9MTEVSX1JT
VF9ERVZJQ0VTX1ZfMCBkb2Vzbid0IGhhdmUKdGhvc2UgYml0cyBpbiB0aGUgZG9jcy4KCj4+PiBT
bywgUE1DIENMSzEvMi80IHBvc3NpYmxlIHBhcmVudHMgYXJlIE9TQ19ESVYxLCBPU0NfRElWMiwg
T1NDX0RJVjQsIEVYVEVSTi4KPj4+Cj4+Pgo+Pj4gQ0xLMS8yLzMgYWxzbyBoYXMgUGlubXV4IHRv
IHJvdXRlIEVYVFBFUklQSCBvdXRwdXQgb24gdG8gdGhlc2UgcGlucy4KPj4gQ291bGQgeW91IHBs
ZWFzZSBjbGFyaWZ5IHdoYXQgYXJlICJ0aGVzZSIgcGlucz8gUGVyaGFwcyB5b3UgbWVhbnQgdGhl
Cj4+IEVYVEVSTiBwaW4gb2YgUE1DPwo+IEJ5IENMSzEvMi8zIHBpbnMsIEkgYW0gcmVmZXJyaW5n
IHRvIENMS19PVVRfMS8yLzMgcGlucyBmcm9tIFRlZ3JhCgpJIHNlZSBub3cgd2hhdCB5b3UgbWVh
bnQsIHRoYW5rcy4KCltzbmlwfQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
