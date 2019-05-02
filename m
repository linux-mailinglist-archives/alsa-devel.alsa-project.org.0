Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2061169B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 11:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D90D4179D;
	Thu,  2 May 2019 11:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D90D4179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556790088;
	bh=WRvZTd4Aex1ZvDxL8FtKHZCieyj5Ncnhdub1KZB26Uc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/0zz0MdwDOUHixVnHgsk9jM7TKp3q4J99OhxmAEOSvRVE+JoqyVSyV5dK6MDvjtc
	 KjV2Ou9+G9znEtyNUexF8pRYLeIX6j1A74nzyaSoBQb399leFj0VmquarLHTvkifWE
	 WjSPmowUGx7+lXWgtJPVSrpIlPfueBIhY6+n0Ylo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F91F896E3;
	Thu,  2 May 2019 11:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AD32F896C7; Thu,  2 May 2019 11:39:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,PRX_BODY_26,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72BEDF80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 11:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72BEDF80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o/QvTJIE"
Received: by mail-yw1-xc41.google.com with SMTP id y131so1065945ywa.9
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 02:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xdth6z7sqKu/asM4+DC73vTGpHLCXQAmob0Qaa/8YnM=;
 b=o/QvTJIE8PitYxkh4yvYEP7Tlz9YaO+C3yH6EjG0InghIxds93jyqsBTvd52ICXN9/
 GrsEFXSoSFhBiKoP4lgs43Hyd+cApUzno5wzvBlSlVRc17HFgBdUeUCqkiFKLM3zryEM
 3ww+v/AQN2i8rwinnsnyvLywB9TAc6JhEuP1XTMaFp397P1A/y1eS8hqZJz/9eCGek1j
 xGi0wf/jWQRIu1krKaeL3h6+yi/bDCwuMYNCXkvjnn8yJhuqN8P/5se0UN+kynzp+7qW
 xSpBXd9xbPfFTxWtze6TWkl/13g0pLSVUZQTskfULsKHeXUWmtlqcbPWB+Dtd0mydcb7
 k9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xdth6z7sqKu/asM4+DC73vTGpHLCXQAmob0Qaa/8YnM=;
 b=B5iqybBrTVtqmWv7cSoXFeBT9D5Zjgu/aeqgGcuhrQtF2SMvOBg7qq8sftsD2es3/Q
 +JzxoGk4J9oYTnBBrnFYUdkmDduM+gqpZ9gjPC+YZkAcLRjKas6Hmni5gaKyOqhdzVXM
 KLoRrFVBxdoIvUXWVOajvSTEqhoXcJOtnpLnL3jBFt5bfQNMD9EviQfgrDaUFV5Hned5
 LXi+AKE3h689XQUhnspLVHfCq7IORBUzE/0xtDBvAiSCqz8seiyF/tuLY4uztJQdcwBI
 wjDAeE1aIY7nl7jxLtJrtrLw3glH4zoTUx7eXTO0P4+R4I6Uo1qCg3i5R/o4+Xp8TeBb
 +U8w==
X-Gm-Message-State: APjAAAXqtJ6PmFXDANp3tTK17GHEBwH5QUFedkTKrxkrfzmDYVCJD61X
 imGDxphd67xMHjEoEf1J4j3v7BE8MMH0TN9/Yls=
X-Google-Smtp-Source: APXvYqy9UVNsnJk0s5cEO6VZ63moEbd8k1NJDxozXOq8MMQz8L/1qN9gkjVoDMSbQ5Zo2h1ORNtu8+kTCWPcECUeFqY=
X-Received: by 2002:a81:b653:: with SMTP id h19mr2129914ywk.253.1556789975500; 
 Thu, 02 May 2019 02:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190419191730.9437-1-peron.clem@gmail.com>
 <20190419191730.9437-3-peron.clem@gmail.com>
 <20190502082526.c5zo4uzceqzizbxo@flea>
In-Reply-To: <20190502082526.c5zo4uzceqzizbxo@flea>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 2 May 2019 11:39:24 +0200
Message-ID: <CAJiuCcdFUPBsXfKtDLt-p6Edx-7JrST9d0C=ofCU4CL8ZxwcsA@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2 2/5] ASoC: sun4i-spdif: Add support for
	H6 SoC
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

SGkgTWF4aW1lLAoKT24gVGh1LCAyIE1heSAyMDE5IGF0IDEwOjI1LCBNYXhpbWUgUmlwYXJkIDxt
YXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDE5LCAyMDE5
IGF0IDA5OjE3OjI3UE0gKzAyMDAsIENsw6ltZW50IFDDqXJvbiB3cm90ZToKPiA+IEFsbHdpbm5l
ciBINiBoYXMgYSBkaWZmZXJlbnQgbWFwcGluZyBmb3IgdGhlIGZpZm8gcmVnaXN0ZXIgY29udHJv
bGxlci4KPiA+Cj4gPiBBY3R1YWxseSBvbmx5IHRoZSBmaWZvIHR4IGZsdXNoIGJpdCBpcyB1c2Vk
Lgo+ID4KPiA+IEFkZCBhIG5ldyBxdWlyayB0byBrbm93IHRoZSBjb3JyZWN0IGZpZm8gdHggZmx1
c2ggYml0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xl
bUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBzb3VuZC9zb2Mvc3VueGkvc3VuNGktc3BkaWYuYyB8
IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy9zdW54aS9zdW40aS1zcGRpZi5jIGIvc291bmQvc29jL3N1bnhpL3N1bjRpLXNw
ZGlmLmMKPiA+IGluZGV4IGI0YWY0YWFiZWFkMS4uMTllNGJmOWNhYTI0IDEwMDY0NAo+ID4gLS0t
IGEvc291bmQvc29jL3N1bnhpL3N1bjRpLXNwZGlmLmMKPiA+ICsrKyBiL3NvdW5kL3NvYy9zdW54
aS9zdW40aS1zcGRpZi5jCj4gPiBAQCAtNzUsNiArNzUsMTggQEAKPiA+ICAgICAgICNkZWZpbmUg
U1VONElfU1BESUZfRkNUTF9SWE9NKHYpICAgICAgICAgICAgICAgICgodikgPDwgMCkKPiA+ICAg
ICAgICNkZWZpbmUgU1VONElfU1BESUZfRkNUTF9SWE9NX01BU0sgICAgICAgICAgICAgIEdFTk1B
U0soMSwgMCkKPiA+Cj4gPiArI2RlZmluZSBTVU41MElfSDZfU1BESUZfRkNUTCAoMHgxNCkKPiA+
ICsgICAgICNkZWZpbmUgU1VONTBJX0g2X1NQRElGX0ZDVExfSFVCX0VOICAgICAgICAgICAgIEJJ
VCgzMSkKPiA+ICsgICAgICNkZWZpbmUgU1VONTBJX0g2X1NQRElGX0ZDVExfRlRYICAgICAgICAg
ICAgICAgIEJJVCgzMCkKPiA+ICsgICAgICNkZWZpbmUgU1VONTBJX0g2X1NQRElGX0ZDVExfRlJY
ICAgICAgICAgICAgICAgIEJJVCgyOSkKPiA+ICsgICAgICNkZWZpbmUgU1VONTBJX0g2X1NQRElG
X0ZDVExfVFhUTCh2KSAgICAgICAgICAgICgodikgPDwgMTIpCj4gPiArICAgICAjZGVmaW5lIFNV
TjUwSV9INl9TUERJRl9GQ1RMX1RYVExfTUFTSyAgICAgICAgICBHRU5NQVNLKDE5LCAxMikKPiA+
ICsgICAgICNkZWZpbmUgU1VONTBJX0g2X1NQRElGX0ZDVExfUlhUTCh2KSAgICAgICAgICAgICgo
dikgPDwgNCkKPiA+ICsgICAgICNkZWZpbmUgU1VONTBJX0g2X1NQRElGX0ZDVExfUlhUTF9NQVNL
ICAgICAgICAgIEdFTk1BU0soMTAsIDQpCj4gPiArICAgICAjZGVmaW5lIFNVTjUwSV9INl9TUERJ
Rl9GQ1RMX1RYSU0gICAgICAgICAgICAgICBCSVQoMikKPiA+ICsgICAgICNkZWZpbmUgU1VONTBJ
X0g2X1NQRElGX0ZDVExfUlhPTSh2KSAgICAgICAgICAgICgodikgPDwgMCkKPiA+ICsgICAgICNk
ZWZpbmUgU1VONTBJX0g2X1NQRElGX0ZDVExfUlhPTV9NQVNLICAgICAgICAgIEdFTk1BU0soMSwg
MCkKPiA+ICsKPiA+ICAjZGVmaW5lIFNVTjRJX1NQRElGX0ZTVEEgICAgICgweDE4KQo+ID4gICAg
ICAgI2RlZmluZSBTVU40SV9TUERJRl9GU1RBX1RYRSAgICAgICAgICAgICAgICAgICAgQklUKDE0
KQo+ID4gICAgICAgI2RlZmluZSBTVU40SV9TUERJRl9GU1RBX1RYRUNOVFNIVCAgICAgICAgICAg
ICAgKDgpCj4gPiBAQCAtMTY5LDE2ICsxODEsMjUgQEAgc3RydWN0IHN1bjRpX3NwZGlmX2RldiB7
Cj4gPiAgICAgICBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyIGNwdV9kYWlfZHJ2Owo+ID4gICAg
ICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ID4gICAgICAgc3RydWN0IHNuZF9kbWFlbmdpbmVf
ZGFpX2RtYV9kYXRhIGRtYV9wYXJhbXNfdHg7Cj4gPiArICAgICBjb25zdCBzdHJ1Y3Qgc3VuNGlf
c3BkaWZfcXVpcmtzICpxdWlya3M7Cj4KPiBJIGd1ZXNzIHRoaXMgd2lsbCBnZW5lcmF0ZSBhIHdh
cm5pbmcgc2luY2UgdGhlIHN0cnVjdHVyZSBoYXNuJ3QgYmVlbgo+IGRlZmluZWQgeWV0PwoKSXQn
cyBhIHBvaW50ZXIgdG8gYSBzdHJ1Y3R1cmUgc28gbm8gd2FybmluZyBmcm9tIHRoZSBjb21waWxl
ci4KCj4KPiA+ICt9Owo+ID4gKwo+ID4gK3N0cnVjdCBzdW40aV9zcGRpZl9xdWlya3Mgewo+ID4g
KyAgICAgdW5zaWduZWQgaW50IHJlZ19kYWNfdHhkYXRhOyAgICAvKiBUWCBGSUZPIG9mZnNldCBm
b3IgRE1BIGNvbmZpZyAqLwo+ID4gKyAgICAgdW5zaWduZWQgaW50IHJlZ19mY3RsX2Z0eDsgICAg
ICAvKiBUWCBGSUZPIGZsdXNoIGJpdG1hc2sgKi8KPiA+ICsgICAgIGJvb2wgaGFzX3Jlc2V0Owo+
Cj4gWW91IGRvbid0IHJlYWxseSBuZWVkIHRvIG1vdmUgaXQgYXJvdW5kLCB5b3UgY2FuIGp1c3Qg
YWRkIHRoZQo+IHN0cnVjdHVyZSBwcm90b3R5cGUuCj4KPiBJZiB5b3UgZG8gd2FudCB0byBtb3Zl
IGl0IGFyb3VuZCwgdGhlbiBwbGVhc2UgZG8gc28gaW4gYSBzZXBhcmF0ZSBwYXRjaAoKSSBoYXZl
IGNob29zZSB0byBtb3ZlIGl0IHRvIGZvbGxvdyB3aGF0IGlzIGRvbmUgaW4gdGhlIHN1bjRpLWky
cy4KSSB3aWxsIHB1dCBpdCBpbiBhIHNlcGFyYXRlIHBhdGNoIGFuZCBtYWtlIHRoZSBjb21tZW50
IGEgYml0IG1vcmUgcHJvcGVyLgoKPgo+ID4gIH07Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIHN1bjRp
X3NwZGlmX2NvbmZpZ3VyZShzdHJ1Y3Qgc3VuNGlfc3BkaWZfZGV2ICpob3N0KQo+ID4gIHsKPiA+
ICsgICAgIGNvbnN0IHN0cnVjdCBzdW40aV9zcGRpZl9xdWlya3MgKnF1aXJrcyA9IGhvc3QtPnF1
aXJrczsKPiA+ICsKPiA+ICAgICAgIC8qIHNvZnQgcmVzZXQgU1BESUYgKi8KPiA+ICAgICAgIHJl
Z21hcF93cml0ZShob3N0LT5yZWdtYXAsIFNVTjRJX1NQRElGX0NUTCwgU1VONElfU1BESUZfQ1RM
X1JFU0VUKTsKPiA+Cj4gPiAgICAgICAvKiBmbHVzaCBUWCBGSUZPICovCj4gPiAgICAgICByZWdt
YXBfdXBkYXRlX2JpdHMoaG9zdC0+cmVnbWFwLCBTVU40SV9TUERJRl9GQ1RMLAo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgIFNVTjRJX1NQRElGX0ZDVExfRlRYLCBTVU40SV9TUERJRl9GQ1RM
X0ZUWCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgcXVpcmtzLT5yZWdfZmN0bF9mdHgs
IHF1aXJrcy0+cmVnX2ZjdGxfZnR4KTsKPiA+Cj4gPiAgICAgICAvKiBjbGVhciBUWCBjb3VudGVy
ICovCj4gPiAgICAgICByZWdtYXBfd3JpdGUoaG9zdC0+cmVnbWFwLCBTVU40SV9TUERJRl9UWENO
VCwgMCk7Cj4gPiBAQCAtNDA1LDIyICs0MjYsMjYgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2Rh
aV9kcml2ZXIgc3VuNGlfc3BkaWZfZGFpID0gewo+ID4gICAgICAgLm5hbWUgPSAic3BkaWYiLAo+
ID4gIH07Cj4gPgo+ID4gLXN0cnVjdCBzdW40aV9zcGRpZl9xdWlya3Mgewo+ID4gLSAgICAgdW5z
aWduZWQgaW50IHJlZ19kYWNfdHhkYXRhOyAgICAvKiBUWCBGSUZPIG9mZnNldCBmb3IgRE1BIGNv
bmZpZyAqLwo+ID4gLSAgICAgYm9vbCBoYXNfcmVzZXQ7Cj4gPiAtfTsKPiA+IC0KPiA+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IHN1bjRpX3NwZGlmX3F1aXJrcyBzdW40aV9hMTBfc3BkaWZfcXVpcmtz
ID0gewo+ID4gICAgICAgLnJlZ19kYWNfdHhkYXRhID0gU1VONElfU1BESUZfVFhGSUZPLAo+ID4g
KyAgICAgLnJlZ19mY3RsX2Z0eCAgID0gU1VONElfU1BESUZfRkNUTF9GVFgsCj4gPiAgfTsKPiA+
Cj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW40aV9zcGRpZl9xdWlya3Mgc3VuNmlfYTMxX3Nw
ZGlmX3F1aXJrcyA9IHsKPiA+ICAgICAgIC5yZWdfZGFjX3R4ZGF0YSA9IFNVTjRJX1NQRElGX1RY
RklGTywKPiA+ICsgICAgIC5yZWdfZmN0bF9mdHggICA9IFNVTjRJX1NQRElGX0ZDVExfRlRYLAo+
ID4gICAgICAgLmhhc19yZXNldCAgICAgID0gdHJ1ZSwKPiA+ICB9Owo+ID4KPiA+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IHN1bjRpX3NwZGlmX3F1aXJrcyBzdW44aV9oM19zcGRpZl9xdWlya3MgPSB7
Cj4gPiAgICAgICAucmVnX2RhY190eGRhdGEgPSBTVU44SV9TUERJRl9UWEZJRk8sCj4gPiArICAg
ICAucmVnX2ZjdGxfZnR4ICAgPSBTVU40SV9TUERJRl9GQ1RMX0ZUWCwKPiA+ICsgICAgIC5oYXNf
cmVzZXQgICAgICA9IHRydWUsCj4gPiArfTsKPiA+Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBz
dW40aV9zcGRpZl9xdWlya3Mgc3VuNTBpX2g2X3NwZGlmX3F1aXJrcyA9IHsKPiA+ICsgICAgIC5y
ZWdfZGFjX3R4ZGF0YSA9IFNVTjhJX1NQRElGX1RYRklGTywKPiA+ICsgICAgIC5yZWdfZmN0bF9m
dHggICA9IFNVTjUwSV9INl9TUERJRl9GQ1RMX0ZUWCwKPiA+ICAgICAgIC5oYXNfcmVzZXQgICAg
ICA9IHRydWUsCj4KPiBUaGUgcmVnX2RhY190eGRhdGEgYW5kIHJlZ19mY3RsX2Z0eCBjaGFuZ2Vz
IGhlcmUgc2hvdWxkIGFsc28gYmUgcGFydAo+IG9mIGEgc2VwYXJhdGUgcGF0Y2guCgpZb3UgbWVh
biB0aGUgcmVnX2ZjdGxfZnR4IHF1aXJrIGFuZCB0aGUgSDYgaW50cm9kdWN0aW9uIHNob3VsZCBi
ZSBzcGxpdCA/CgpUaGFua3MgZm9yIHRoZSByZXZpZXcsCkNsZW1lbnQKCj4KPiBNYXhpbWUKPgo+
IC0tCj4gTWF4aW1lIFJpcGFyZCwgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
