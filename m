Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE3122D5F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 14:48:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA8A71655;
	Tue, 17 Dec 2019 14:47:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA8A71655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576590486;
	bh=8FDadMwkx3KpxRoI2y3OLdNL7DMkJcz7hxi0r06NVto=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ofn/+dq+c0cQCkviHmdobehvhtZm+m70shexOx8GOhAlxUxz/gsk1WeT69EFff9wI
	 p5IDUFJjMvFzQAR2y6S8MtjetsSSsLA/hYu3xRX0dNrV4TwUMZVbFjCgo7SmLfrHFx
	 o8XITEDK5ZDhOjWFdrm29DRa/hE3LUlWYYOeXLLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ADCCF80218;
	Tue, 17 Dec 2019 14:46:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 008A9F80234; Tue, 17 Dec 2019 14:46:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 217CCF80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 14:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 217CCF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XK994wVV"
Received: by mail-wm1-x342.google.com with SMTP id b72so3229683wme.4
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 05:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=kZuWd/3jkSU468vrZtKybTAjJX1Jep24XVi1Wi4q33k=;
 b=XK994wVVrkzFy0kYAn6YNVPCGij+VqhuMZC2yPF2zmpoSL1t182ncy8nuiNo5zng4Z
 WPFfdmKerYYyv2faiAywqYmjUlJWN8c8sDMRIiX2QhGVIqH9X2zcK+ROViyaRiDUZfjN
 MS46kihklyILLInJAkBt/mjzCwvf4dpgp0yac7AA3B1aclCBtqlsVz1qRWbAJUzDd6Wp
 walFi+txkCkoY1p6ZAmsmDSUtNZN4W9uvEoo1yOW0pXVuhMT3ppXifn3dvN1DFIBG6hT
 /2vATZu+R8Iuq8zTRgwX1otltmSndbWvbKrOSQtab37hC5Xokm6YJYdFkuILS1JKU5S4
 RQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kZuWd/3jkSU468vrZtKybTAjJX1Jep24XVi1Wi4q33k=;
 b=sxyhEuh8B/A4di/fAPSbyWEPNHJO8usspenTnXeHgJLvzUrsOAsKerRyGKgh8G+AWn
 2HZcw9Ke+CmaUFbMhAE3H1HSpZMNLs9b72JyQZWNa4U4cg7sIcKU5WYotcJItN2NIZir
 tN/+JHQMfPL8pHeDDegEftkV7oqcfG1delv053aHYyme/srIHPjdqhRIqTJMpBAX9srL
 5btv5wOyEG10EZ0k+P7+VlOLRcAqZseetm0DccqDi7f3qiPt4M3XadCGFD4uzjOnyJ4b
 1nkCmpkY3r01jfZbTu3mdrDl9/8WBmqRksZxo7ntz0V3K3/fq6F02mFR/N0HC2S3HANO
 z35w==
X-Gm-Message-State: APjAAAVkgaKqxbFbiJljEtWAlV7pUtyvRMqpz9yTKVDMyFCsWWW7CGgY
 1HQMOrayepCgFmJ1GMR7ZVhEnONA60k=
X-Google-Smtp-Source: APXvYqyNCklkEVENRexg11/lVsAZF67JMyMSJB9/s1vxBi0hQ6lOnAJ1HSWjhfQSwKh/52Z4A1/krA==
X-Received: by 2002:a1c:3d07:: with SMTP id k7mr5986321wma.79.1576590377924;
 Tue, 17 Dec 2019 05:46:17 -0800 (PST)
Received: from dell ([2.27.35.132])
 by smtp.gmail.com with ESMTPSA id r15sm2967823wmh.21.2019.12.17.05.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 05:46:17 -0800 (PST)
Date: Tue, 17 Dec 2019 13:46:17 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Mack <daniel@zonque.org>
Message-ID: <20191217134617.GK18955@dell>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-8-daniel@zonque.org>
 <20191217133952.GJ18955@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217133952.GJ18955@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-i2c@vger.kernel.org, pascal.huerst@gmail.com, linux-clk@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 06/10] mfd: Add core driver for AD242x A2B
	transceivers
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

T24gVHVlLCAxNyBEZWMgMjAxOSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBNb24sIDA5IERlYyAy
MDE5LCBEYW5pZWwgTWFjayB3cm90ZToKPiAKPiA+IFRoZSBjb3JlIGRyaXZlciBmb3IgdGhlc2Ug
ZGV2aWNlcyBpcyBzcGxpdCBpbnRvIHNldmVyYWwgcGFydHMuCj4gPiAKPiA+IFRoZSBtYXN0ZXIg
bm9kZSBkcml2ZXIgaXMgYW4gSTJDIGNsaWVudC4gSXQgaXMgcmVzcG9uc2libGUgZm9yCj4gPiBi
cmluZ2luZyB1cCB0aGUgYnVzIHRvcG9sb2d5IGFuZCBkaXNjb3ZlcmluZyB0aGUgc2xhdmUgbm9k
ZXMuCj4gPiBUaGlzIHByb2Nlc3MgcmVxdXJpZXMgc29tZSBrbm93bGVnZGUgb2YgdGhlIHNsYXZl
IG5vZGUgY29uZmlndXJhdGlvbgo+ID4gdG8gcHJvZ3JhbSB0aGUgYnVzIHRpbWluZ3MgY29ycmVj
dGx5LCBzbyB0aGUgbWFzdGVyIGRyaXZlcnMgd2Fsa3MKPiA+IHRoZSB0cmVlIG9mIG5vZGVzIGlu
IHRoZSBkZXZpY2V0cmVlLiBUaGUgc2xhdmUgZHJpdmVyIGhhbmRsZXMgcGxhdGZvcm0KPiA+IGRl
dmljZXMgdGhhdCBhcmUgaW5zdGFudGlhdGVkIGJ5IHRoZSBtYXN0ZXIgbm9kZSBkcml2ZXIgYWZ0
ZXIKPiA+IGRpc2NvdmVyeSBoYXMgZmluaXNoZWQuCj4gPiAKPiA+IE1hc3RlciBub2RlcyBleHBv
c2UgdHdvIGFkZHJlc3NlcyBvbiB0aGUgSTJDIGJ1cywgb25lIChyZWZlcnJlZCB0byBhcwo+ID4g
J0JBU0UnIGluIHRoZSBkYXRhc2hlZXQpIGZvciBhY2Nlc3NpbmcgcmVnaXN0ZXJzIG9uIHRoZSB0
cmFuc2NlaXZlcgo+ID4gbm9kZSBpdHNlbGYsIGFuZCBvbmUgKHJlZmVycmVkIHRvIGFzICdCVVMn
KSBmb3IgYWNjZXNzaW5nIHJlbW90ZQo+ID4gcmVnaXN0ZXJzLCBlaXRoZXIgb24gdGhlIHJlbW90
ZSB0cmFuc2NlaXZlciBpdHNlbGYsIG9yIG9uIEkyQyBoYXJkd2FyZQo+ID4gY29ubmVjdGVkIHRv
IHRoYXQgcmVtb3RlIHRyYW5zY2VpdmVyLCB3aGljaCB0aGVuIGFjdHMgYXMgYSByZW1vdGUgSTJD
Cj4gPiBidXMgbWFzdGVyLgo+ID4gCj4gPiBJbiBvcmRlciB0byBhbGxvdyBNRkQgc3ViLWRldmlj
ZXMgdG8gYmUgcmVnaXN0ZXJlZCBhcyBjaGlsZHJlbiBvZgo+ID4gZWl0aGVyIHRoZSBtYXN0ZXIg
b3IgYW55IHNsYXZlIG5vZGUsIHRoZSBkZXRhaWxzIG9uIGhvdyB0byBhY2Nlc3MgdGhlCj4gPiBy
ZWdpc3RlcnMgYXJlIGhpZGRlbiBiZWhpbmQgYSByZWdtYXAgY29uZmlnLiBBIHBvaW50ZXIgdG8g
dGhlIHJlZ21hcAo+ID4gaXMgdGhlbiBleHBvc2VkIGluIHRoZSBzdHJ1Y3Qgc2hhcmVkIHdpdGgg
dGhlIHN1Yi1kZXZpY2VzLgo+ID4gCj4gPiBUaGUgYWQyNDJ4LWJ1cyBkcml2ZXIgaXMgYSBzaW1w
bGUgcHJveHkgdGhhdCBvY2N1cGllcyB0aGUgQlVTIEkyQwo+ID4gYWRkcmVzcyBhbmQgd2hpY2gg
aXMgcmVmZXJyZWQgdG8gdGhyb3VnaCBhIGRldmljZXRyZWUgaGFuZGxlIGJ5IHRoZQo+ID4gbWFz
dGVyIGRyaXZlci4KPiA+IAo+ID4gRm9yIHRoZSBkaXNjb3ZlcnkgcHJvY2VzcywgdGhlIGRyaXZl
ciBoYXMgdG8gd2FpdCBmb3IgYW4gaW50ZXJydXB0Cj4gPiB0byBvY2N1ci4gSW4gY2FzZSBubyBp
bnRlcnJ1cHQgaXMgY29uZmlndXJlZCBpbiBEVCwgdGhlIGRyaXZlciBmYWxscwo+ID4gYmFjayB0
byBpbnRlcnJ1cHQgcG9sbGluZy4gQWZ0ZXIgdGhlIGRpc2NvdmVyeSBwaGFzZSBpcyBjb21wbGV0
ZWQsCj4gPiBpbnRlcnJ1cHRzIGFyZSBvbmx5IG5lZWRlZCBmb3IgZXJyb3IgaGFuZGxpbmcgYW5k
IEdQSU8gaGFuZGxpbmcsCj4gPiBib3RoIG9mIHdoaWNoIGlzIG5vdCBjdXJyZW50eSBpbXBsZW1l
bnRlZC4KPiA+IAo+ID4gQ29kZSBjb21tb24gdG8gYm90aCB0aGUgbWFzdGVyIGFuZCB0aGUgc2xh
dmUgZHJpdmVyIGxpdmVzIGluCj4gPiAnYWQyNDJ4LW5vZGUuYycuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBNYWNrIDxkYW5pZWxAem9ucXVlLm9yZz4KPiA+IAo+ID4gbWZkCj4gCj4g
Pwo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgIHwgIDExICsKPiA+
ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgfCAgIDEgKwo+ID4gIGRyaXZlcnMvbWZkL2Fk
MjQyeC1idXMuYyAgICB8ICA0MiArKysKPiA+ICBkcml2ZXJzL21mZC9hZDI0MngtbWFzdGVyLmMg
fCA2MTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9t
ZmQvYWQyNDJ4LW5vZGUuYyAgIHwgMjYyICsrKysrKysrKysrKysrKysKPiA+ICBkcml2ZXJzL21m
ZC9hZDI0Mngtc2xhdmUuYyAgfCAyMzQgKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL2xpbnV4
L21mZC9hZDI0MnguaCAgfCA0MDAgKysrKysrKysrKysrKysrKysrKysrKysKPiAKPiBUaGlzIGRl
dmljZSwgb3IgYXQgbGVhc3QgdGhlIHdheSBpdCdzIGJlZW4gY29kZWQgaXMgYmF0dHkhCj4gCj4g
SXQncyBnb2luZyB0byBuZWVkIGEgbG90IG9mIG1hc3NhZ2luZyBiZWZvcmUgYmVpbmcgYWNjZXB0
ZWQuCgpPbmUgdGhpbmcgSSBzaG91bGQgbWVudGlvbiB1cGZyb250OyB0aGVyZSBpcyB0b28gbXVj
aCBjb2RlICJkb2luZwp0aGluZ3MiIGluIGhlcmUgZm9yIGl0IHRvIGJlIGFuIE1GRC4gIE1GRHMg
ZG9uJ3QgY2FyZSBhYm91dDsgc3luY3MsCnNsb3RzLCBURE0sIGludmVydGluZyBsaW5lcywgdXBz
dHJlYW1zLCBkb3duc3RyZWFtcywgZXRjIGV0YyBldGMuCkFueXRoaW5nIHJlbW90ZWx5IHRlY2hu
aWNhbCBvciBmdW5jdGlvbmFsLCB0aGUgY29kZSB0aGF0ICJkb2VzIHRoaW5ncyIKc2hvdWxkIGJl
IG1vdmVkIG91dCB0byB0aGUgcmVsZXZhbnQgYXJlYXMuICBJbiB0aGUgY2FzZSBvZiB0aGlzCmRl
dmljZSwgdGhhdCdzIGxvb2tpbmcgbGlrZSBvbmUgb2YgdGhlIEF1ZGlvIHJlbGF0ZWQgc3Vic3lz
dGVtcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNh
bCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpG
b2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
