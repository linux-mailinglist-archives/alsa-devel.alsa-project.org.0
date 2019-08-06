Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A482B92
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 08:24:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C301660;
	Tue,  6 Aug 2019 08:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C301660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565072658;
	bh=vqW5ECl33J5UwATQJ17cC9aiHwY1l4o7KD8AzoXtbCw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=roqnKEmvxkUo1wPe1r/t7IUwXgPiP3+X42KThbHA0Sp350C2Gpncw7tRWtTNmSwmm
	 ac5N5gy3qtiPugdouYSC9uAULxgTRl9h1nVa/W0E5iDx4OfKBo6JKb36fRUH2Hn79n
	 JU2+lC4QvF+ilvoAqW/oCE8EP06Xn7nDMtEMy+ZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3B0EF804CB;
	Tue,  6 Aug 2019 08:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8CF2F80483; Tue,  6 Aug 2019 08:22:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA678F800F3
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 08:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA678F800F3
Received: by mail-ed1-f66.google.com with SMTP id w13so81300479eds.4
 for <alsa-devel@alsa-project.org>; Mon, 05 Aug 2019 23:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=31ueH4xeu7Xw4wz+WZeX4tVZdv/T52Sgk7fLVWTqQcw=;
 b=RNn8u3Ku/JF8cR5pZWj3qxgJof2NuCnyZZbpyl55+/GjIKlSv+OMx5aCyXzFD5INEi
 5Dn2b2b9WISdWE437IvDcqS2CyNjVf51o+YIEy6RhZLF0RZ2ggg7cX0HKeBsjDKf927k
 Be3s9amq9NY35sSrqycv9QBdbzVgPJlM6niFzK6UZfy1xwpE8i/X5xzfOvqWhb6JFJdG
 XzxgsphP2Kkib3ttEbvyufgYcwbKNGSj9LGSydDGAJ4v2DHiTJb7b94Ggy7m4ahJmYny
 s7Nl/XQGUWLYqM9hj326nLpmlL1W/qYh/H880sXd3PAnc3/HQ4HoJbGSvQqwLWTCiHmG
 mwbg==
X-Gm-Message-State: APjAAAVjiebAO8KhvSevot+YW5xNOUBHCUcEMAT9HMcpE+s0UF/4IjL/
 GKE01iBaL8PcNB/+CFZJexQOuO8WgVc=
X-Google-Smtp-Source: APXvYqyxgNN0jPb4AYf11ltWrAe4djh0icNRKVN1WF+zkX4JBZy6lrBcmqurl28deJLnm59/UVpFMg==
X-Received: by 2002:aa7:c490:: with SMTP id m16mr2124102edq.156.1565072547848; 
 Mon, 05 Aug 2019 23:22:27 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49])
 by smtp.gmail.com with ESMTPSA id c53sm20445014ede.84.2019.08.05.23.22.26
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 23:22:27 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id v19so75192867wmj.5
 for <alsa-devel@alsa-project.org>; Mon, 05 Aug 2019 23:22:26 -0700 (PDT)
X-Received: by 2002:a7b:cc04:: with SMTP id f4mr2565217wmh.125.1565072546430; 
 Mon, 05 Aug 2019 23:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190603174735.21002-1-codekipper@gmail.com>
 <2092329.vleAuWJ0xl@jernej-laptop>
 <20190731122953.2u3iabd6gkn7jv7k@flea> <1589203.0AjJVEASy3@jernej-laptop>
In-Reply-To: <1589203.0AjJVEASy3@jernej-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 6 Aug 2019 14:22:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v66D4-QvWYPXE=rf6Zv93X1LjnxUgpk+5wdAL_b7MM3vaA@mail.gmail.com>
Message-ID: <CAGb2v66D4-QvWYPXE=rf6Zv93X1LjnxUgpk+5wdAL_b7MM3vaA@mail.gmail.com>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Christopher Obbard <chris@64studio.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Code Kipper <codekipper@gmail.com>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] Re: [PATCH v4 6/9] ASoC: sun4i-i2s:
	Add multi-lane functionality
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

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAxOjMyIFBNIEplcm5laiDFoGtyYWJlYyA8amVybmVqLnNr
cmFiZWNAZ21haWwuY29tPiB3cm90ZToKPgo+IERuZSBzcmVkYSwgMzEuIGp1bGlqIDIwMTkgb2Ig
MTQ6Mjk6NTMgQ0VTVCBqZSBNYXhpbWUgUmlwYXJkIG5hcGlzYWwoYSk6Cj4gPiBPbiBUdWUsIEp1
bCAzMCwgMjAxOSBhdCAwNzo1NzoxMFBNICswMjAwLCBKZXJuZWogxaBrcmFiZWMgd3JvdGU6Cj4g
PiA+IERuZSB0b3JlaywgMDQuIGp1bmlqIDIwMTkgb2IgMTE6Mzg6NDQgQ0VTVCBqZSBDb2RlIEtp
cHBlciBuYXBpc2FsKGEpOgo+ID4gPiA+IE9uIFR1ZSwgNCBKdW4gMjAxOSBhdCAxMTowMiwgQ2hy
aXN0b3BoZXIgT2JiYXJkIDxjaHJpc0A2NHN0dWRpby5jb20+Cj4gd3JvdGU6Cj4gPiA+ID4gPiBP
biBUdWUsIDQgSnVuIDIwMTkgYXQgMDk6NDMsIENvZGUgS2lwcGVyIDxjb2Rla2lwcGVyQGdtYWls
LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgNCBKdW4gMjAxOSBhdCAwOTo1OCwgTWF4
aW1lIFJpcGFyZAo+ID4gPiA+ID4gPiA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiA+ID4K
PiA+ID4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDc6NDc6
MzJQTSArMDIwMCwgY29kZWtpcHBlckBnbWFpbC5jb20KPiB3cm90ZToKPiA+ID4gPiA+ID4gPiA+
IEZyb206IE1hcmN1cyBDb29wZXIgPGNvZGVraXBwZXJAZ21haWwuY29tPgo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+IFRoZSBpMnMgYmxvY2sgc3VwcG9ydHMgbXVsdGktbGFuZSBpMnMg
b3V0cHV0IGhvd2V2ZXIgdGhpcwo+ID4gPiA+ID4gPiA+ID4gZnVuY3Rpb25hbGl0eQo+ID4gPiA+
ID4gPiA+ID4gaXMgb25seSBwb3NzaWJsZSBpbiBlYXJsaWVyIFNvQ3Mgd2hlcmUgdGhlIHBpbnMg
YXJlIGV4cG9zZWQgYW5kCj4gPiA+ID4gPiA+ID4gPiBmb3IKPiA+ID4gPiA+ID4gPiA+IHRoZSBp
MnMgYmxvY2sgdXNlZCBmb3IgSERNSSBhdWRpbyBvbiB0aGUgbGF0ZXIgU29Dcy4KPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUbyBlbmFibGUgdGhpcyBmdW5jdGlvbmFsaXR5LCBhbiBv
cHRpb25hbCBwcm9wZXJ0eSBoYXMgYmVlbgo+ID4gPiA+ID4gPiA+ID4gYWRkZWQgdG8KPiA+ID4g
PiA+ID4gPiA+IHRoZSBiaW5kaW5ncy4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNYXJjdXMgQ29vcGVyIDxjb2Rla2lwcGVyQGdtYWlsLmNvbT4KPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+IEknZCBsaWtlIHRvIGhhdmUgTWFyaydzIGlucHV0IG9uIHRo
aXMsIGJ1dCBJJ20gcmVhbGx5IHdvcnJpZWQKPiA+ID4gPiA+ID4gPiBhYm91dAo+ID4gPiA+ID4g
PiA+IHRoZSBpbnRlcmFjdGlvbiB3aXRoIHRoZSBwcm9wZXIgVERNIHN1cHBvcnQuCj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiBPdXIgZnVuZGFtZW50YWwgaXNzdWUgaXMgdGhhdCB0aGUgY29u
dHJvbGxlciBjYW4gaGF2ZSB1cCB0byA4Cj4gPiA+ID4gPiA+ID4gY2hhbm5lbHMsIGJ1dCBlaXRo
ZXIgb24gNCBsaW5lcyAoaW5zdGVhZCBvZiAxKSwgb3IgOCBjaGFubmVscyBvbiAxCj4gPiA+ID4g
PiA+ID4gKGxpa2UgcHJvcGVyIFRETSkgKG9yIGFueSBjb21iaW5hdGlvbiBiZXR3ZWVuIHRoZSB0
d28sIGJ1dCB0aGF0Cj4gPiA+ID4gPiA+ID4gc2hvdWxkCj4gPiA+ID4gPiA+ID4gYmUgcHJldHR5
IHJhcmUpLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIHVuZGVyc3RhbmQuLi5tYXliZSB0aGUg
VERNIG5lZWRzIHRvIGJlIGV4dGVuZGVkIHRvIHN1cHBvcnQgdGhpcyB0bwo+ID4gPiA+ID4gPiBj
b25zaWRlciBjaGFubmVsIG1hcHBpbmcgYW5kIG11bHRpcGxlIHRyYW5zZmVyIGxpbmVzLiBJIHdh
cyB0aGlua2luZwo+ID4gPiA+ID4gPiBhYm91dCB0aGUgbGF0ZXIgd2hlbiBzb21lb25lIHdhcyBy
ZXF1ZXN0aW5nIHN1cHBvcnQgb24gSUlSQyBhIHdoaWxlCj4gPiA+ID4gPiA+IGFnbywgSSB0aG91
Z2h0IG1hc2tpbmcgbWlnaHQgb2YgYmVlbiBhIHNvbHV0aW9uLiBUaGVzZSBjYW4gd2FpdCBhcwo+
ID4gPiA+ID4gPiB0aGUKPiA+ID4gPiA+ID4gb25seSBjb25zdW1lciBhdCB0aGUgbW9tZW50IGlz
IExpYnJlRUxFQyBhbmQgd2UgY2FuIHBhdGNoIGl0IHRoZXJlLgo+ID4gPiA+ID4KPiA+ID4gPiA+
IEhpIE1hcmN1cywKPiA+ID4gPiA+Cj4gPiA+ID4gPiBGV0lXLCB0aGUgVEkgTWNBU1AgZHJpdmVy
IGhhcyBzdXBwb3J0IGZvciBURE0gJiAoaSB0aGluaz8pIG11bHRpcGxlCj4gPiA+ID4gPiB0cmFu
c2ZlciBsaW5lcyB3aGljaCBhcmUgY2FsbGVkIHNlcmlhbGl6ZXJzLgo+ID4gPiA+ID4gTWF5YmUg
dGhpcyBjYW4gaGVscCB3aXRoIGluc3BpcmF0aW9uPwo+ID4gPiA+ID4gc2VlCj4gPiA+ID4gPiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlCj4gPiA+ID4gPiBlL3MKPiA+ID4gPiA+IG91bmQvc29jL3RpL2RhdmluY2kt
bWNhc3AuYyBzYW1wbGUgRFRTOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICZtY2FzcDAgewo+ID4gPiA+
ID4KPiA+ID4gPiA+ICAgICAjc291bmQtZGFpLWNlbGxzID0gPDA+Owo+ID4gPiA+ID4gICAgIHN0
YXR1cyA9ICJva2F5IjsKPiA+ID4gPiA+ICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+
ID4gPiA+ID4gICAgIHBpbmN0cmwtMCA9IDwmbWNhc3AwX3BpbnM+Owo+ID4gPiA+ID4KPiA+ID4g
PiA+ICAgICBvcC1tb2RlID0gPDA+Owo+ID4gPiA+ID4gICAgIHRkbS1zbG90cyA9IDw4PjsKPiA+
ID4gPiA+ICAgICBzZXJpYWwtZGlyID0gPAo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgMiAw
IDEgMAo+ID4gPiA+ID4gICAgICAgICAwIDAgMCAwCj4gPiA+ID4gPiAgICAgICAgIDAgMCAwIDAK
PiA+ID4gPiA+ICAgICAgICAgMCAwIDAgMAo+ID4gPiA+ID4gICAgID4KPiA+ID4gPiA+ICAgICA+
Owo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICB0eC1udW0tZXZ0ID0gPDE+Owo+ID4gPiA+ID4gICAg
IHJ4LW51bS1ldnQgPSA8MT47Cj4gPiA+ID4gPgo+ID4gPiA+ID4gfTsKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBDaGVlcnMhCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MsIHRoaXMgbG9va3MgZ29vZC4KPiA+
ID4KPiA+ID4gSSB3b3VsZCByZWFsbHkgbGlrZSB0byBzZWUgdGhpcyBpc3N1ZSByZXNvbHZlZCwg
YmVjYXVzZSBIRE1JIGF1ZGlvIHN1cHBvcnQKPiA+ID4gaW4gbWFpbmxpbmUgTGludXggZm9yIHRo
b3NlIFNvQ3MgaXMgbG9uZyBvdmVyZHVlLgo+ID4gPgo+ID4gPiBIb3dldmVyLCB0aGVyZSBpcyBh
IHBvc3NpYmlsaXR5IHRvIHN0aWxsIGFkZCBIRE1JIGF1ZGlvIHN1cG9ydCAoc3RlcmVvCj4gPiA+
IG9ubHkpIGV2ZW4gaWYgdGhpcyBpc3N1ZSBpcyBub3QgY29tcGxldGVseSBzb2x2ZWQuIElmIHdl
IGFncmVlIHRoYXQKPiA+ID4gY29uZmlndXJhdGlvbiBvZiBjaGFubmVscyB3b3VsZCBiZSBzb2x2
ZWQgd2l0aCBhZGRpdGlvbmFsIHByb3BlcnR5IGFzCj4gPiA+IENocmlzdG9waGVyIHN1Z2dlc3Rl
ZCwgc3VwcG9ydCBmb3IgPjIgY2hhbm5lbHMgY2FuIGJlIGxlZnQgZm9yIGEgbGF0ZXIKPiA+ID4g
dGltZSB3aGVuIHN1cHBvcnQgZm9yIHRoYXQgcHJvcGVydHkgd291bGQgYmUgaW1wbGVtZW50ZWQu
IEN1cnJlbnRseSwKPiA+ID4gc3RlcmVvIEhETUkgYXVkaW8gc3VwcG9ydCBjYW4gYmUgYWRkZWQg
d2l0aCBhIGZldyBwYXRjaGVzLgo+ID4gPgo+ID4gPiBJIHRoaW5rIGFsbCBJMlMgY29yZXMgYXJl
IHJlYWxseSB0aGUgc2FtZSwgbm8gbWF0dGVyIGlmIGludGVybmFsbHkKPiA+ID4gY29ubmVjdGVk
IHRvIEhETUkgY29udHJvbGxlciBvciByb3V0ZWQgdG8gcGlucywgc28gaXQgd291bGQgbWFrZSBz
ZW5zZSB0bwo+ID4gPiB1c2Ugc2FtZSBjb21wYXRpYmxlIGZvciBhbGwgb2YgdGhlbS4gSXQncyBq
dXN0IHRoYXQgdGhvc2UgSTJTIGNvcmVzIHdoaWNoCj4gPiA+IGFyZSByb3V0ZWQgdG8gcGlucyBj
YW4gdXNlIG9ubHkgb25lIGxhbmUgYW5kID4yIGNoYW5uZWxzIGNhbiBiZSB1c2VkIG9ubHkKPiA+
ID4gaW4gVERNIG1vZGUgb2Ygb3BlcmF0aW9uLCBpZiBJIHVuZGVyc3RhbmQgdGhpcyBjb3JyZWN0
bHkuCj4gPiA+Cj4gPiA+IE5ldyBwcm9wZXJ0eSB3b3VsZCBoYXZlIHRvIGJlIG9wdGlvbmFsLCBz
byBpdCdzIG9taXNzaW9uIHdvdWxkIHJlc3VsdCBpbgo+ID4gPiBzYW1lIGNoYW5uZWwgY29uZmln
dXJhdGlvbiBhcyBpdCBpcyBhbHJlYWR5IHByZXNlbnQsIHRvIHByZXNlcnZlCj4gPiA+IGNvbXBh
dGliaWxpdHkgd2l0aCBvbGQgZGV2aWNlIHRyZWVzLiBBbmQgdGhpcyBtb2RlIGlzIGFscmVhZHkg
c3VmZmljaWVudAo+ID4gPiBmb3Igc3RlcmVvIEhETUkgYXVkaW8gc3VwcG9ydC4KPiA+Cj4gPiBZ
ZWFoLCBpdCBsb29rcyBsaWtlIGEgZ29vZCBwbGFuLgo+ID4KPiA+ID4gU2lkZSBub3RlOiBIRE1J
IGF1ZGlvIHdpdGggY3VycmVudCBzdW40aS1pMnMgZHJpdmVyIGhhcyBhIGRlbGF5IChhYm91dCBh
Cj4gPiA+IHNlY29uZCksIHN1cHBvc2VkbHkgYmVjYXVzZSBEVyBIRE1JIGNvbnRyb2xsZXIgYXV0
b21hdGljYWxseSBnZW5lcmF0ZXMgQ1RTCj4gPiA+IHZhbHVlIGJhc2VkIG9uIEkyUyBjbG9jayAo
YXV0byBDVFMgdmFsdWUgZ2VuZXJhdGlvbiBpcyBlbmFibGVkIHBlcgo+ID4gPiBEZXNpZ25XYXJl
IHJlY29tZW5kYXRpb24gZm9yIERXIEhETUkgSTJTIGludGVyZmFjZSkuCj4gPgo+ID4gSXMgdGhh
dCBhIGNvbnN0YW50IGRlbGF5IGR1cmluZyB0aGUgYXVkaW8gcGxheWJhY2ssIG9yIG9ubHkgYXQg
c3RhcnR1cD8KPgo+IEkgdGhpbmsgaXQncyBqdXN0IGF0IHN0YXJ0dXAsIGUuZy4gaWYgeW91J3Jl
IHdhdGNoaW5nIG1vdmllLCBhdWRpbyBpcyBpbiBzeW5jLAo+IGl0J3MganVzdCB0aGF0IGZpcnN0
IHNlY29uZCBvciBzbyBpcyBzaWxlbnQuCj4KPiA+Cj4gPiA+IEkyUyBkcml2ZXIgZnJvbSBCU1Ag
TGludXggc29sdmVzIHRoYXQgYnkgaGF2aW5nIEkyUyBjbG9jayBvdXRwdXQKPiA+ID4gZW5hYmxl
ZCBhbGwgdGhlIHRpbWUuIFNob3VsZCB0aGlzIGJlIGZsYWdnZWQgd2l0aCBzb21lIGFkZGl0aW9u
YWwKPiA+ID4gcHJvcGVydHkgaW4gRFQ/Cj4gPgo+ID4gSSdkIHNheSB0aGF0IGlmIHRoZSBjb2Rl
YyBoYXMgdGhhdCByZXF1aXJlbWVudCwgdGhlbiBpdCBzaG91bGQgYmUKPiA+IGJldHdlZW4gdGhl
IGNvZGVjIGFuZCB0aGUgREFJLCB0aGUgRFQgZG9lc24ndCByZWFsbHkgaGF2ZSBhbnl0aGluZyB0
bwo+ID4gZG8gd2l0aCB0aGlzLgo+Cj4gT2ssIGJ1dCBob3cgdG8gY29tbXVuaWNhdGUgdGhhdCBm
YWN0IHRvIEkyUyBkcml2ZXIgdGhlbj8gQlNQIGRyaXZlciBzb2x2ZXMKPiB0aGF0IGJ5IHVzaW5n
IGRpZmZlcmVudCBjb21wYXRpYmxlLCBidXQgYXMgSSBzYWlkIGJlZm9yZSwgSTJTIGNvcmVzIGFy
ZSBub3QKPiByZWFsbHkgZGlmZmVyZW50LCBzbyB0aGlzIHNlZW1zIHdyb25nLgoKTWF5YmUgd2Ug
Y291bGQgbWFrZSB0aGUgRFctSERNSSBJMlMgZHJpdmVyIHJlcXVpcmUgdGhlIEkyUyBjbG9jayBi
ZSBvbiBhbGwKdGhlIHRpbWU/IFlvdSB3b3VsZG4ndCBuZWVkIGFueSBjaGFuZ2VzIHRvIHRoZSBE
VC4KCkNoZW5ZdQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
