Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB77A8363
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 15:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D2816BE;
	Wed,  4 Sep 2019 15:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D2816BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567602608;
	bh=kFMaSfA3OJtu3UgHLtIGfT0kwON/ijVc7EQ4uvC0/GQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=By1QJlMQgjm4wIJvrtXGuJxr0zDfY3R/hNzx4XmVdOWdr4b9v7afEBU8fHKguF6YV
	 xNFw916Z+CM6oXiU5R4sfs6/Wdai0v2WzxqYidDibL98+7zlsqbUF0UdbB3vj5/XgG
	 eV3Fi/6SIjMWZyKC3guoivvyc8Y24e+bfLI08OvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E978F803A6;
	Wed,  4 Sep 2019 15:08:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EB20F803A6; Wed,  4 Sep 2019 15:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12AB0F80228
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 15:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12AB0F80228
Received: from [222.130.137.249] (helo=[192.168.1.108])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1i5V1E-0005EK-L7; Wed, 04 Sep 2019 13:08:16 +0000
To: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org, tiwai@suse.de
References: <20190904055327.9883-1-hui.wang@canonical.com>
 <20190904123534.ED0DD23402@mail.kernel.org>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <b5ab2817-dd0a-e8f6-a827-9a5313715a69@canonical.com>
Date: Wed, 4 Sep 2019 21:08:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904123534.ED0DD23402@mail.kernel.org>
Content-Language: en-US
Cc: stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek - Fix the problem of two
 front mics on a ThinkCentre
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

TGV0J3MgZHJvcCB0aGlzIHBhdGNoIHRvIHY0LjkuMTkwIGFuZCB2NC40LjE5MCwgaXQgaXMgZmlu
ZSB0byBhcHBseSB0byAKdjUuMi4xMSzCoCB2NC4xOS42OSBhbmQgdjQuMTQuMTQxIG9ubHkuCgpU
aGFua3MuCgpPbiAyMDE5LzkvNCDkuIvljYg4OjM1LCBTYXNoYSBMZXZpbiB3cm90ZToKPiBIaSwK
Pgo+IFtUaGlzIGlzIGFuIGF1dG9tYXRlZCBlbWFpbF0KPgo+IFRoaXMgY29tbWl0IGhhcyBiZWVu
IHByb2Nlc3NlZCBiZWNhdXNlIGl0IGNvbnRhaW5zIGEgLXN0YWJsZSB0YWcuCj4gVGhlIHN0YWJs
ZSB0YWcgaW5kaWNhdGVzIHRoYXQgaXQncyByZWxldmFudCBmb3IgdGhlIGZvbGxvd2luZyB0cmVl
czogYWxsCj4KPiBUaGUgYm90IGhhcyB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB0cmVlczogdjUuMi4x
MSwgdjQuMTkuNjksIHY0LjE0LjE0MSwgdjQuOS4xOTAsIHY0LjQuMTkwLgo+Cj4gdjUuMi4xMTog
QnVpbGQgT0shCj4gdjQuMTkuNjk6IEJ1aWxkIE9LIQo+IHY0LjE0LjE0MTogQnVpbGQgT0shCj4g
djQuOS4xOTA6IEZhaWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5kZW5jaWVzOgo+ICAgICAg
MjE2ZDdhZWJiZmJlICgiQUxTQTogaGRhL3JlYWx0ZWsgLSBGaXggaGVhZHNldCBtaWMgYW5kIHNw
ZWFrZXIgb24gQXN1cyBYNDQxU0EvWDQ0MVVWIikKPiAgICAgIDU4MjRjZThkZTdiMSAoIkFMU0E6
IGhkYS9yZWFsdGVrIC0gQWRkIHN1cHBvcnQgZm9yIEFjZXIgQXNwaXJlIEU1LTQ3NSBoZWFkc2V0
IG1pYyIpCj4gICAgICA2MTU5NjZhZGM0YjYgKCJBTFNBOiBoZGEvcmVhbHRlayAtIEZpeCBoZWFk
c2V0IG1pYyBvbiBzZXZlcmFsIEFzdXMgbGFwdG9wcyB3aXRoIEFMQzI1NSIpCj4gICAgICA4MjNm
ZjE2MWZlNTEgKCJBTFNBOiBoZGEgLSBGaXggY2xpY2sgbm9pc2VzIG9uIFNhbXN1bmcgQXRpdiBC
b29rIDgiKQo+ICAgICAgOGRhNWJiZmM3Y2JiICgiQUxTQTogaGRhIC0gY2hhbmdlIHRoZSBsb2Nh
dGlvbiBmb3Igb25lIG1pYyBvbiBhIExlbm92byBtYWNoaW5lIikKPiAgICAgIDllYjVkMGU2MzVl
YiAoIkFMU0E6IGhkYS9yZWFsdGVrIC0gQWRkIHN1cHBvcnQgaGVhZHBob25lIE1pYyBmb3IgQUxD
MjIxIG9mIEhQIHBsYXRmb3JtIikKPiAgICAgIGMxNzMyZWRlNWU4MCAoIkFMU0E6IGhkYS9yZWFs
dGVrIC0gRml4IGhlYWRzZXQgYW5kIG1pYyBvbiBzZXZlcmFsIEFzdXMgbGFwdG9wcyB3aXRoIEFM
QzI1NiIpCj4gICAgICBjNjc5MGM4ZTc3MGMgKCJBTFNBOiBoZGEvcmVhbHRlayAtIEFkZCBzdXBw
b3J0IGZvciBoZWFkc2V0IE1JQyBmb3IgQUxDNjIyIikKPiAgICAgIGNhMTY5Y2MyZjllMSAoIkFM
U0E6IGhkYS9yZWFsdGVrIC0gQWRkIER1YWwgQ29kZWNzIHN1cHBvcnQgZm9yIExlbm92byBQNTIw
LzQyMCIpCj4gICAgICBmMzNmNzlmM2QwZTUgKCJBTFNBOiBoZGEvcmVhbHRlayAtIGNoYW5nZSB0
aGUgbG9jYXRpb24gZm9yIG9uZSBvZiB0d28gZnJvbnQgbWljcm9waG9uZXMiKQo+Cj4gdjQuNC4x
OTA6IEZhaWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5kZW5jaWVzOgo+ICAgICAgMWEzZjA5
OTEwMWI4ICgiQUxTQTogaGRhIC0gRml4IHN1cnJvdW5kIG91dHB1dCBwaW5zIGZvciBBU1JvY2sg
QjE1ME0gbW9ibyIpCj4gICAgICAyMTZkN2FlYmJmYmUgKCJBTFNBOiBoZGEvcmVhbHRlayAtIEZp
eCBoZWFkc2V0IG1pYyBhbmQgc3BlYWtlciBvbiBBc3VzIFg0NDFTQS9YNDQxVVYiKQo+ICAgICAg
NTgyNGNlOGRlN2IxICgiQUxTQTogaGRhL3JlYWx0ZWsgLSBBZGQgc3VwcG9ydCBmb3IgQWNlciBB
c3BpcmUgRTUtNDc1IGhlYWRzZXQgbWljIikKPiAgICAgIDYxNTk2NmFkYzRiNiAoIkFMU0E6IGhk
YS9yZWFsdGVrIC0gRml4IGhlYWRzZXQgbWljIG9uIHNldmVyYWwgQXN1cyBsYXB0b3BzIHdpdGgg
QUxDMjU1IikKPiAgICAgIDc4ZjRmN2MyMzQxZiAoIkFMU0E6IGhkYS9yZWFsdGVrIC0gQUxDODkx
IGhlYWRzZXQgbW9kZSBmb3IgRGVsbCIpCj4gICAgICA4MjNmZjE2MWZlNTEgKCJBTFNBOiBoZGEg
LSBGaXggY2xpY2sgbm9pc2VzIG9uIFNhbXN1bmcgQXRpdiBCb29rIDgiKQo+ICAgICAgOGRhNWJi
ZmM3Y2JiICgiQUxTQTogaGRhIC0gY2hhbmdlIHRoZSBsb2NhdGlvbiBmb3Igb25lIG1pYyBvbiBh
IExlbm92byBtYWNoaW5lIikKPiAgICAgIDliNTFmZTNlZmU0YyAoIkFMU0E6IGhkYSAtIE9uLWJv
YXJkIHNwZWFrZXIgZml4dXAgb24gQUNFUiBWZXJpdG9uIikKPiAgICAgIDllYjVkMGU2MzVlYiAo
IkFMU0E6IGhkYS9yZWFsdGVrIC0gQWRkIHN1cHBvcnQgaGVhZHBob25lIE1pYyBmb3IgQUxDMjIx
IG9mIEhQIHBsYXRmb3JtIikKPiAgICAgIGFiYWEyMjc0ODExZCAoIkFMU0E6IGhkYS9yZWFsdGVr
IC0gZml4IGhlYWRzZXQgbWljIGRldGVjdGlvbiBmb3IgTVNJIE1TLUIxMjAiKQo+ICAgICAgYzE3
MzJlZGU1ZTgwICgiQUxTQTogaGRhL3JlYWx0ZWsgLSBGaXggaGVhZHNldCBhbmQgbWljIG9uIHNl
dmVyYWwgQXN1cyBsYXB0b3BzIHdpdGggQUxDMjU2IikKPiAgICAgIGM2NzkwYzhlNzcwYyAoIkFM
U0E6IGhkYS9yZWFsdGVrIC0gQWRkIHN1cHBvcnQgZm9yIGhlYWRzZXQgTUlDIGZvciBBTEM2MjIi
KQo+ICAgICAgY2ExNjljYzJmOWUxICgiQUxTQTogaGRhL3JlYWx0ZWsgLSBBZGQgRHVhbCBDb2Rl
Y3Mgc3VwcG9ydCBmb3IgTGVub3ZvIFA1MjAvNDIwIikKPiAgICAgIGYzM2Y3OWYzZDBlNSAoIkFM
U0E6IGhkYS9yZWFsdGVrIC0gY2hhbmdlIHRoZSBsb2NhdGlvbiBmb3Igb25lIG9mIHR3byBmcm9u
dCBtaWNyb3Bob25lcyIpCj4KPgo+IE5PVEU6IFRoZSBwYXRjaCB3aWxsIG5vdCBiZSBxdWV1ZWQg
dG8gc3RhYmxlIHRyZWVzIHVudGlsIGl0IGlzIHVwc3RyZWFtLgo+Cj4gSG93IHNob3VsZCB3ZSBw
cm9jZWVkIHdpdGggdGhpcyBwYXRjaD8KPgo+IC0tCj4gVGhhbmtzLAo+IFNhc2hhCj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
