Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEDB7D4EE
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2019 07:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A916716C1;
	Thu,  1 Aug 2019 07:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A916716C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564637632;
	bh=KA28N+EeYhxE7nOpDjs9TZPrW32fDip9VTgyRqJgYZ0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pu8f1Vb4l+2LTEb+9KIpRlOgRVp3lmrIeJNqpFJhrx+6kNphsQMOgPok2V5BHtpIU
	 ifKpwsT022Wqk5CthiW2XKsapDGpZBfcv30fTfnMJIpMxUVQsZocYh6mMoB9K4qfXG
	 4rPeS4dmB5u6GNDyKbwD6E9/c9jyeS98uyw3LoQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F86F804CC;
	Thu,  1 Aug 2019 07:32:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6C75F804CC; Thu,  1 Aug 2019 07:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 709B5F800F3
 for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2019 07:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 709B5F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FWFYV5rx"
Received: by mail-wr1-x442.google.com with SMTP id n9so72204224wru.0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 22:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=huNfAOKjl+kk+4Jtq0u6/qi6NLR+RYJid7AxvJTx6iY=;
 b=FWFYV5rxxlAYxAyoz/kKo31BDIaLqpIqBrNWI0UIl/b7/S4FYjmih8RX2OMahtJZ0P
 8su1AOW2vd6neyowrzCnQzv1dFWesGMLkemIjw/yETxa1X/2DXRPUr9JtSnSFMfgBsuU
 wlsEtfODcgAQ079oIj/sHHVU+6k3s9j8Lur5KGllD1lDFPmDO+MYO4ZojPr3gQq+GQtX
 NNy8zD4WNZO8+9Os0mlEw4IbovjIfQ6NoXG1JsVxiyNau5fs86qT8Ff8eJe034BW10Yz
 QldOQUWCevUbtw1eUE3LU83A8qzYOi1/rjPJ78QJDQUHbtOVRN2nlhS9pdGjO2ps+Ncg
 bLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=huNfAOKjl+kk+4Jtq0u6/qi6NLR+RYJid7AxvJTx6iY=;
 b=BUxficZbN2IRECAa94AvFfONdyAlB/iTdLh0TvIy04MqaD9mUnXWNN3Isu5fSK/HIO
 6Q1SZ21FaX30lZMd9JUmOn/7tn2wXdN/SA0sV6c9F82k338On02mw/4gF3v5SBp02G0O
 wmZrGkjLPr/idSX6Mwz5Li9xd0OhnBQhyzfm90Ov2r6YZEyD4SltbKQdJW7nWF+v2kzv
 FN6L3jfKccM6R7SaIEPa6El0SgOMSk7zYaJ1+ZvnrpB7AGgTzVq2a3Db6PkbKeEOsNns
 s5bngUaXANc8eHXJXu3peqjISEAcywiJ/L43q+tkn5Ogxu6EF2AXMbkm8VJlj7SqlJB9
 e/FA==
X-Gm-Message-State: APjAAAWRYKhMhPQZaSqV63j7pjlVc/VcC1ig7nn8ppZfok+PO5RoW3Pd
 lrv6rnqR3+vN6AskxJdUZaZ8oab8rAw=
X-Google-Smtp-Source: APXvYqzGfkEtAIaSRDZ/5FHdZBBGE9LyWinhe6pQxrmSPYLcwZ/eZiDN2S5PQ04+spdYxBWXDX0+Kw==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr136182150wrp.101.1564637518192; 
 Wed, 31 Jul 2019 22:31:58 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-194-152-11-237.cable.triera.net.
 [194.152.11.237])
 by smtp.gmail.com with ESMTPSA id o7sm61277403wmf.43.2019.07.31.22.31.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 22:31:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@googlegroups.com, maxime.ripard@bootlin.com
Date: Thu, 01 Aug 2019 07:31:55 +0200
Message-ID: <1589203.0AjJVEASy3@jernej-laptop>
In-Reply-To: <20190731122953.2u3iabd6gkn7jv7k@flea>
References: <20190603174735.21002-1-codekipper@gmail.com>
 <2092329.vleAuWJ0xl@jernej-laptop> <20190731122953.2u3iabd6gkn7jv7k@flea>
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Christopher Obbard <chris@64studio.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, codekipper@gmail.com,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
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

RG5lIHNyZWRhLCAzMS4ganVsaWogMjAxOSBvYiAxNDoyOTo1MyBDRVNUIGplIE1heGltZSBSaXBh
cmQgbmFwaXNhbChhKToKPiBPbiBUdWUsIEp1bCAzMCwgMjAxOSBhdCAwNzo1NzoxMFBNICswMjAw
LCBKZXJuZWogxaBrcmFiZWMgd3JvdGU6Cj4gPiBEbmUgdG9yZWssIDA0LiBqdW5paiAyMDE5IG9i
IDExOjM4OjQ0IENFU1QgamUgQ29kZSBLaXBwZXIgbmFwaXNhbChhKToKPiA+ID4gT24gVHVlLCA0
IEp1biAyMDE5IGF0IDExOjAyLCBDaHJpc3RvcGhlciBPYmJhcmQgPGNocmlzQDY0c3R1ZGlvLmNv
bT4gCndyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgNCBKdW4gMjAxOSBhdCAwOTo0MywgQ29kZSBLaXBw
ZXIgPGNvZGVraXBwZXJAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgNCBKdW4g
MjAxOSBhdCAwOTo1OCwgTWF4aW1lIFJpcGFyZAo+ID4gPiA+ID4gPG1heGltZS5yaXBhcmRAYm9v
dGxpbi5jb20+Cj4gPiAKPiA+IHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBNb24sIEp1biAwMywgMjAx
OSBhdCAwNzo0NzozMlBNICswMjAwLCBjb2Rla2lwcGVyQGdtYWlsLmNvbSAKd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gRnJvbTogTWFyY3VzIENvb3BlciA8Y29kZWtpcHBlckBnbWFpbC5jb20+Cj4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVGhlIGkycyBibG9jayBzdXBwb3J0cyBtdWx0aS1sYW5l
IGkycyBvdXRwdXQgaG93ZXZlciB0aGlzCj4gPiA+ID4gPiA+ID4gZnVuY3Rpb25hbGl0eQo+ID4g
PiA+ID4gPiA+IGlzIG9ubHkgcG9zc2libGUgaW4gZWFybGllciBTb0NzIHdoZXJlIHRoZSBwaW5z
IGFyZSBleHBvc2VkIGFuZAo+ID4gPiA+ID4gPiA+IGZvcgo+ID4gPiA+ID4gPiA+IHRoZSBpMnMg
YmxvY2sgdXNlZCBmb3IgSERNSSBhdWRpbyBvbiB0aGUgbGF0ZXIgU29Dcy4KPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiBUbyBlbmFibGUgdGhpcyBmdW5jdGlvbmFsaXR5LCBhbiBvcHRpb25h
bCBwcm9wZXJ0eSBoYXMgYmVlbgo+ID4gPiA+ID4gPiA+IGFkZGVkIHRvCj4gPiA+ID4gPiA+ID4g
dGhlIGJpbmRpbmdzLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IE1hcmN1cyBDb29wZXIgPGNvZGVraXBwZXJAZ21haWwuY29tPgo+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gSSdkIGxpa2UgdG8gaGF2ZSBNYXJrJ3MgaW5wdXQgb24gdGhpcywgYnV0IEknbSByZWFs
bHkgd29ycmllZAo+ID4gPiA+ID4gPiBhYm91dAo+ID4gPiA+ID4gPiB0aGUgaW50ZXJhY3Rpb24g
d2l0aCB0aGUgcHJvcGVyIFRETSBzdXBwb3J0Lgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gT3Vy
IGZ1bmRhbWVudGFsIGlzc3VlIGlzIHRoYXQgdGhlIGNvbnRyb2xsZXIgY2FuIGhhdmUgdXAgdG8g
OAo+ID4gPiA+ID4gPiBjaGFubmVscywgYnV0IGVpdGhlciBvbiA0IGxpbmVzIChpbnN0ZWFkIG9m
IDEpLCBvciA4IGNoYW5uZWxzIG9uIDEKPiA+ID4gPiA+ID4gKGxpa2UgcHJvcGVyIFRETSkgKG9y
IGFueSBjb21iaW5hdGlvbiBiZXR3ZWVuIHRoZSB0d28sIGJ1dCB0aGF0Cj4gPiA+ID4gPiA+IHNo
b3VsZAo+ID4gPiA+ID4gPiBiZSBwcmV0dHkgcmFyZSkuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkg
dW5kZXJzdGFuZC4uLm1heWJlIHRoZSBURE0gbmVlZHMgdG8gYmUgZXh0ZW5kZWQgdG8gc3VwcG9y
dCB0aGlzIHRvCj4gPiA+ID4gPiBjb25zaWRlciBjaGFubmVsIG1hcHBpbmcgYW5kIG11bHRpcGxl
IHRyYW5zZmVyIGxpbmVzLiBJIHdhcyB0aGlua2luZwo+ID4gPiA+ID4gYWJvdXQgdGhlIGxhdGVy
IHdoZW4gc29tZW9uZSB3YXMgcmVxdWVzdGluZyBzdXBwb3J0IG9uIElJUkMgYSB3aGlsZQo+ID4g
PiA+ID4gYWdvLCBJIHRob3VnaHQgbWFza2luZyBtaWdodCBvZiBiZWVuIGEgc29sdXRpb24uIFRo
ZXNlIGNhbiB3YWl0IGFzCj4gPiA+ID4gPiB0aGUKPiA+ID4gPiA+IG9ubHkgY29uc3VtZXIgYXQg
dGhlIG1vbWVudCBpcyBMaWJyZUVMRUMgYW5kIHdlIGNhbiBwYXRjaCBpdCB0aGVyZS4KPiA+ID4g
PiAKPiA+ID4gPiBIaSBNYXJjdXMsCj4gPiA+ID4gCj4gPiA+ID4gRldJVywgdGhlIFRJIE1jQVNQ
IGRyaXZlciBoYXMgc3VwcG9ydCBmb3IgVERNICYgKGkgdGhpbms/KSBtdWx0aXBsZQo+ID4gPiA+
IHRyYW5zZmVyIGxpbmVzIHdoaWNoIGFyZSBjYWxsZWQgc2VyaWFsaXplcnMuCj4gPiA+ID4gTWF5
YmUgdGhpcyBjYW4gaGVscCB3aXRoIGluc3BpcmF0aW9uPwo+ID4gPiA+IHNlZQo+ID4gPiA+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xp
bnV4LmdpdC90cmUKPiA+ID4gPiBlL3MKPiA+ID4gPiBvdW5kL3NvYy90aS9kYXZpbmNpLW1jYXNw
LmMgc2FtcGxlIERUUzoKPiA+ID4gPiAKPiA+ID4gPiAmbWNhc3AwIHsKPiA+ID4gPiAKPiA+ID4g
PiAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsKPiA+ID4gPiAgICAgc3RhdHVzID0gIm9rYXki
Owo+ID4gPiA+ICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ID4gPiA+ICAgICBwaW5j
dHJsLTAgPSA8Jm1jYXNwMF9waW5zPjsKPiA+ID4gPiAgICAgCj4gPiA+ID4gICAgIG9wLW1vZGUg
PSA8MD47Cj4gPiA+ID4gICAgIHRkbS1zbG90cyA9IDw4PjsKPiA+ID4gPiAgICAgc2VyaWFsLWRp
ciA9IDwKPiA+ID4gPiAgICAgCj4gPiA+ID4gICAgICAgICAyIDAgMSAwCj4gPiA+ID4gICAgICAg
ICAwIDAgMCAwCj4gPiA+ID4gICAgICAgICAwIDAgMCAwCj4gPiA+ID4gICAgICAgICAwIDAgMCAw
Cj4gPiA+ID4gICAgID4KPiA+ID4gPiAgICAgPjsKPiA+ID4gPiAgICAgCj4gPiA+ID4gICAgIHR4
LW51bS1ldnQgPSA8MT47Cj4gPiA+ID4gICAgIHJ4LW51bS1ldnQgPSA8MT47Cj4gPiA+ID4gCj4g
PiA+ID4gfTsKPiA+ID4gPiAKPiA+ID4gPiBDaGVlcnMhCj4gPiA+IAo+ID4gPiBUaGFua3MsIHRo
aXMgbG9va3MgZ29vZC4KPiA+IAo+ID4gSSB3b3VsZCByZWFsbHkgbGlrZSB0byBzZWUgdGhpcyBp
c3N1ZSByZXNvbHZlZCwgYmVjYXVzZSBIRE1JIGF1ZGlvIHN1cHBvcnQKPiA+IGluIG1haW5saW5l
IExpbnV4IGZvciB0aG9zZSBTb0NzIGlzIGxvbmcgb3ZlcmR1ZS4KPiA+IAo+ID4gSG93ZXZlciwg
dGhlcmUgaXMgYSBwb3NzaWJpbGl0eSB0byBzdGlsbCBhZGQgSERNSSBhdWRpbyBzdXBvcnQgKHN0
ZXJlbwo+ID4gb25seSkgZXZlbiBpZiB0aGlzIGlzc3VlIGlzIG5vdCBjb21wbGV0ZWx5IHNvbHZl
ZC4gSWYgd2UgYWdyZWUgdGhhdAo+ID4gY29uZmlndXJhdGlvbiBvZiBjaGFubmVscyB3b3VsZCBi
ZSBzb2x2ZWQgd2l0aCBhZGRpdGlvbmFsIHByb3BlcnR5IGFzCj4gPiBDaHJpc3RvcGhlciBzdWdn
ZXN0ZWQsIHN1cHBvcnQgZm9yID4yIGNoYW5uZWxzIGNhbiBiZSBsZWZ0IGZvciBhIGxhdGVyCj4g
PiB0aW1lIHdoZW4gc3VwcG9ydCBmb3IgdGhhdCBwcm9wZXJ0eSB3b3VsZCBiZSBpbXBsZW1lbnRl
ZC4gQ3VycmVudGx5LAo+ID4gc3RlcmVvIEhETUkgYXVkaW8gc3VwcG9ydCBjYW4gYmUgYWRkZWQg
d2l0aCBhIGZldyBwYXRjaGVzLgo+ID4gCj4gPiBJIHRoaW5rIGFsbCBJMlMgY29yZXMgYXJlIHJl
YWxseSB0aGUgc2FtZSwgbm8gbWF0dGVyIGlmIGludGVybmFsbHkKPiA+IGNvbm5lY3RlZCB0byBI
RE1JIGNvbnRyb2xsZXIgb3Igcm91dGVkIHRvIHBpbnMsIHNvIGl0IHdvdWxkIG1ha2Ugc2Vuc2Ug
dG8KPiA+IHVzZSBzYW1lIGNvbXBhdGlibGUgZm9yIGFsbCBvZiB0aGVtLiBJdCdzIGp1c3QgdGhh
dCB0aG9zZSBJMlMgY29yZXMgd2hpY2gKPiA+IGFyZSByb3V0ZWQgdG8gcGlucyBjYW4gdXNlIG9u
bHkgb25lIGxhbmUgYW5kID4yIGNoYW5uZWxzIGNhbiBiZSB1c2VkIG9ubHkKPiA+IGluIFRETSBt
b2RlIG9mIG9wZXJhdGlvbiwgaWYgSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5Lgo+ID4gCj4g
PiBOZXcgcHJvcGVydHkgd291bGQgaGF2ZSB0byBiZSBvcHRpb25hbCwgc28gaXQncyBvbWlzc2lv
biB3b3VsZCByZXN1bHQgaW4KPiA+IHNhbWUgY2hhbm5lbCBjb25maWd1cmF0aW9uIGFzIGl0IGlz
IGFscmVhZHkgcHJlc2VudCwgdG8gcHJlc2VydmUKPiA+IGNvbXBhdGliaWxpdHkgd2l0aCBvbGQg
ZGV2aWNlIHRyZWVzLiBBbmQgdGhpcyBtb2RlIGlzIGFscmVhZHkgc3VmZmljaWVudAo+ID4gZm9y
IHN0ZXJlbyBIRE1JIGF1ZGlvIHN1cHBvcnQuCj4gCj4gWWVhaCwgaXQgbG9va3MgbGlrZSBhIGdv
b2QgcGxhbi4KPiAKPiA+IFNpZGUgbm90ZTogSERNSSBhdWRpbyB3aXRoIGN1cnJlbnQgc3VuNGkt
aTJzIGRyaXZlciBoYXMgYSBkZWxheSAoYWJvdXQgYQo+ID4gc2Vjb25kKSwgc3VwcG9zZWRseSBi
ZWNhdXNlIERXIEhETUkgY29udHJvbGxlciBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlcyBDVFMKPiA+
IHZhbHVlIGJhc2VkIG9uIEkyUyBjbG9jayAoYXV0byBDVFMgdmFsdWUgZ2VuZXJhdGlvbiBpcyBl
bmFibGVkIHBlcgo+ID4gRGVzaWduV2FyZSByZWNvbWVuZGF0aW9uIGZvciBEVyBIRE1JIEkyUyBp
bnRlcmZhY2UpLgo+IAo+IElzIHRoYXQgYSBjb25zdGFudCBkZWxheSBkdXJpbmcgdGhlIGF1ZGlv
IHBsYXliYWNrLCBvciBvbmx5IGF0IHN0YXJ0dXA/CgpJIHRoaW5rIGl0J3MganVzdCBhdCBzdGFy
dHVwLCBlLmcuIGlmIHlvdSdyZSB3YXRjaGluZyBtb3ZpZSwgYXVkaW8gaXMgaW4gc3luYywgCml0
J3MganVzdCB0aGF0IGZpcnN0IHNlY29uZCBvciBzbyBpcyBzaWxlbnQuCgo+IAo+ID4gSTJTIGRy
aXZlciBmcm9tIEJTUCBMaW51eCBzb2x2ZXMgdGhhdCBieSBoYXZpbmcgSTJTIGNsb2NrIG91dHB1
dAo+ID4gZW5hYmxlZCBhbGwgdGhlIHRpbWUuIFNob3VsZCB0aGlzIGJlIGZsYWdnZWQgd2l0aCBz
b21lIGFkZGl0aW9uYWwKPiA+IHByb3BlcnR5IGluIERUPwo+IAo+IEknZCBzYXkgdGhhdCBpZiB0
aGUgY29kZWMgaGFzIHRoYXQgcmVxdWlyZW1lbnQsIHRoZW4gaXQgc2hvdWxkIGJlCj4gYmV0d2Vl
biB0aGUgY29kZWMgYW5kIHRoZSBEQUksIHRoZSBEVCBkb2Vzbid0IHJlYWxseSBoYXZlIGFueXRo
aW5nIHRvCj4gZG8gd2l0aCB0aGlzLgoKT2ssIGJ1dCBob3cgdG8gY29tbXVuaWNhdGUgdGhhdCBm
YWN0IHRvIEkyUyBkcml2ZXIgdGhlbj8gQlNQIGRyaXZlciBzb2x2ZXMgCnRoYXQgYnkgdXNpbmcg
ZGlmZmVyZW50IGNvbXBhdGlibGUsIGJ1dCBhcyBJIHNhaWQgYmVmb3JlLCBJMlMgY29yZXMgYXJl
IG5vdCAKcmVhbGx5IGRpZmZlcmVudCwgc28gdGhpcyBzZWVtcyB3cm9uZy4KCkJlc3QgcmVnYXJk
cywKSmVybmVqCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
