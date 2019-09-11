Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA40B025A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 19:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D614416EE;
	Wed, 11 Sep 2019 19:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D614416EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568221497;
	bh=UZcC3WKy5xGUTVHB9t4Hf1yoogHLH687gKB34ooZvpc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p00QX6FGzlX1od8Ffkyi268R33Lt0T1RxcDmSULh6oAOwB+dZ1eBgy15hXRmDAja8
	 tUZFbC0I5vEC8Ba1Ez8G6c3MiBuWZMJLkIh+h0GCGr84eQUxQmY9+4wQzeFuKjSJTb
	 ABGET73hw/+bvzaBMkCaQsqvEO8NICPtlpEOHPDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F3ACF80323;
	Wed, 11 Sep 2019 19:03:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D68CAF80323; Wed, 11 Sep 2019 19:03:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28C09F801ED
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 19:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28C09F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Z+nLvmJs"
Received: by mail-ua1-x941.google.com with SMTP id u18so7032916uap.2
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=buUqc8ERVmqHmMW6WwjRVMJPzy7dr7EKMl9vRpwJpZM=;
 b=Z+nLvmJsUyDmb3Z8llyNwlmD2jVrnXGV2ode7JUJ0CBsoLN0QQqjF/H/3gDTLg6VDJ
 jXit3LAhfojKsULrELXKF1wwGBp8vNz5EVM7DcARGt0ByQSpvOJ48NQVf6fQWh/Zujp+
 cBblUSKAe177/psfJfCGsbkuJOHDOsO5Qb/yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=buUqc8ERVmqHmMW6WwjRVMJPzy7dr7EKMl9vRpwJpZM=;
 b=aINTRTTytDr766rg6WwPUQPJUzq2QhuHimSG+hN5GYJMrl9oLhqeWYo6clUc0tW3g+
 iEQJgCqPCkpP5O0x5NFnlNFjNTJ7OuJy0qZrj+6/YdVcL2Oo/pVHsti8DeIpZqkchrEf
 X/sZbiRNQ/znWwM4y7708lqtW53Z3J9VnyHLlopLGOdmoNMFNjB/XCxmy6o9y0C2nAfb
 L12kj6GxKRi3XFmvDx6GpriRJxPRl9fG6UkPhmQ1rtOC1B8KjAOq0IuHxdhQ6gbEQrnp
 MhCDWkb7VSwlcxkXY6BoXFPNJDpyrT8D2wk06AOyMWeYtUR7fDoGIMtCfDmT7V+Tsd0/
 YKJQ==
X-Gm-Message-State: APjAAAXrXQ7az6OoeqSPgk4MXiIMdVoXJ9xWcH+86hPUN2aUIP3j1Zb9
 0T1rbwu+77AF5nU7VpCkSmL3dfSTH5+3qa7jr7mbIw==
X-Google-Smtp-Source: APXvYqyHbuhYljIhllMZZXCEGHUZOYmQOMAogOruLFfO7e3oALf2ZphzQ2tT6Oy4Xky7aPF4tOyye2GIxWQClO2dXQ0=
X-Received: by 2002:ab0:604a:: with SMTP id o10mr4566868ual.105.1568221385686; 
 Wed, 11 Sep 2019 10:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190911082646.134347-1-cychiang@chromium.org>
 <1e2ec69d-e42d-4e1b-7ce9-d1620cfbb4c9@baylibre.com>
 <10668907.r1TyVuJQb1@jernej-laptop>
In-Reply-To: <10668907.r1TyVuJQb1@jernej-laptop>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Thu, 12 Sep 2019 01:02:38 +0800
Message-ID: <CAFv8NwJGa0HXsnv2MvJhknpr9PxUL3jH2HZLSLiSD5s_nHiQhQ@mail.gmail.com>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Doug Anderson <dianders@chromium.org>,
 kuninori.morimoto.gx@renesas.com, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 cain.cai@rock-chips.com, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Yakir Yang <ykk@rock-chips.com>, sam@ravnborg.org,
 Jerome Brunet <jbrunet@baylibre.com>, Xing Zheng <zhengxing@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Jeffy Chen <jeffy.chen@rock-chips.com>,
 =?UTF-8?B?6JSh5p6r?= <eddie.cai@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, kuankuan.y@gmail.com
Subject: Re: [alsa-devel] [PATCH v3] drm: bridge/dw_hdmi: add audio sample
	channel status setting
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

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMTI6NTQgQU0gSmVybmVqIMWga3JhYmVjIDxqZXJuZWou
c2tyYWJlY0BzaW9sLm5ldD4gd3JvdGU6Cj4KPiBEbmUgc3JlZGEsIDExLiBzZXB0ZW1iZXIgMjAx
OSBvYiAxODoyMzo1OSBDRVNUIGplIE5laWwgQXJtc3Ryb25nIG5hcGlzYWwoYSk6Cj4gPiBPbiAx
MS8wOS8yMDE5IDEwOjI2LCBDaGVuZy1ZaSBDaGlhbmcgd3JvdGU6Cj4gPiA+IEZyb206IFlha2ly
IFlhbmcgPHlra0Byb2NrLWNoaXBzLmNvbT4KPiA+ID4KPiA+ID4gV2hlbiB0cmFuc21pdHRpbmcg
SUVDNjA5ODUgbGluZWFyIFBDTSBhdWRpbywgd2UgY29uZmlndXJlIHRoZQo+ID4gPiBBZHVpbyBT
YW1wbGUgQ2hhbm5lbCBTdGF0dXMgaW5mb3JtYXRpb24gaW4gdGhlIElFQzYwOTU4IGZyYW1lLgo+
ID4gPiBUaGUgc3RhdHVzIGJpdCBpcyBhbHJlYWR5IGF2YWlsYWJsZSBpbiBpZWMuc3RhdHVzIG9m
IGhkbWlfY29kZWNfcGFyYW1zLgo+ID4gPgo+ID4gPiBUaGlzIGZpeCB0aGUgaXNzdWUgdGhhdCBh
dWRpbyBkb2VzIG5vdCBjb21lIG91dCBvbiBzb21lIG1vbml0b3JzCj4gPiA+IChlLmcuIExHIDIy
Q1YyNDEpCj4gPiA+Cj4gPiA+IE5vdGUgdGhhdCB0aGVzZSByZWdpc3RlcnMgYXJlIG9ubHkgZm9y
IGludGVyZmFjZXM6Cj4gPiA+IEkyUyBhdWRpbyBpbnRlcmZhY2UsIEdlbmVyYWwgUHVycG9zZSBB
dWRpbyAoR1BBKSwgb3IgQUhCIGF1ZGlvIERNQQo+ID4gPiAoQUhCQVVERE1BKS4KPiA+ID4gRm9y
IFMvUERJRiBpbnRlcmZhY2UgdGhpcyBpbmZvcm1hdGlvbiBjb21lcyBmcm9tIHRoZSBzdHJlYW0u
Cj4gPiA+Cj4gPiA+IEN1cnJlbnRseSB0aGlzIGZ1bmN0aW9uIGR3X2hkbWlfc2V0X2NoYW5uZWxf
c3RhdHVzIGlzIG9ubHkgY2FsbGVkCj4gPiA+IGZyb20gZHctaGRtaS1pMnMtYXVkaW8gaW4gSTJT
IHNldHVwLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZYWtpciBZYW5nIDx5a2tAcm9jay1j
aGlwcy5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdA
Y2hyb21pdW0ub3JnPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gQ2hhbmdlIGZyb20gdjIgdG8gdjM6
Cj4gPiA+IDEuIFJldXNlIHdoYXQgaXMgYWxyZWFkeSBzZXQgaW4gaWVjLnN0YXR1cyBpbiBod19w
YXJhbS4KPiA+ID4gMi4gUmVtb3ZlIGFsbCB1c2VsZXNzIGRlZmluaXRpb24gb2YgcmVnaXN0ZXJz
IGFuZCB2YWx1ZXMuCj4gPiA+IDMuIE5vdGUgdGhhdCB0aGUgb3JpZ2luYWwgc2FtcGxpbmcgZnJl
cXVlbmN5IGlzIG5vdCB3cml0dGVuIHRvCj4gPiA+Cj4gPiA+ICAgIHRoZSBjaGFubmVsIHN0YXR1
cyBhcyB3ZSByZXVzZSBjcmVhdGVfaWVjOTU4X2NvbnN1bWVyIGluIHBjbV9pZWM5NTguYy4KPiA+
ID4gICAgV2l0aG91dCB0aGF0IGl0IGNhbiBzdGlsbCBwbGF5IGF1ZGlvIGZpbmUuCj4gPiA+Cj4g
PiA+ICAuLi4vZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jICAgfCAgMSAr
Cj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAgICAgfCAy
MCArKysrKysrKysrKysrKysrKysrCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWkuaCAgICAgfCAgMiArKwo+ID4gPiAgaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hk
bWkuaCAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgaW5kZXgKPiA+ID4gMzRkOGU4Mzc1
NTVmLi4yMGY0ZjkyZGQ4NjYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKPiA+ID4gQEAgLTEwMiw2ICsx
MDIsNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsCj4gPiA+IHZvaWQgKmRhdGEsPgo+ID4gPiAgICAgfQo+ID4gPgo+ID4gPiAgICAgZHdfaGRt
aV9zZXRfc2FtcGxlX3JhdGUoaGRtaSwgaHBhcm1zLT5zYW1wbGVfcmF0ZSk7Cj4gPiA+Cj4gPiA+
ICsgICBkd19oZG1pX3NldF9jaGFubmVsX3N0YXR1cyhoZG1pLCBocGFybXMtPmllYy5zdGF0dXMp
Owo+ID4gPgo+ID4gPiAgICAgZHdfaGRtaV9zZXRfY2hhbm5lbF9jb3VudChoZG1pLCBocGFybXMt
PmNoYW5uZWxzKTsKPiA+ID4gICAgIGR3X2hkbWlfc2V0X2NoYW5uZWxfYWxsb2NhdGlvbihoZG1p
LCBocGFybXMtCj4gPmNlYS5jaGFubmVsX2FsbG9jYXRpb24pOwo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiA+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBpbmRleAo+ID4gPiBiZDY1
ZDA0Nzk2ODMuLmFhN2VmZDRkYTFjOCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiA+ID4gQEAgLTU4Miw2ICs1ODIsMjYgQEAgc3RhdGlj
IHVuc2lnbmVkIGludCBoZG1pX2NvbXB1dGVfbih1bnNpZ25lZCBpbnQgZnJlcSwKPiA+ID4gdW5z
aWduZWQgbG9uZyBwaXhlbF9jbGspPgo+ID4gPiAgICAgcmV0dXJuIG47Cj4gPiA+Cj4gPiA+ICB9
Cj4gPiA+Cj4gPiA+ICsvKgo+ID4gPiArICogV2hlbiB0cmFuc21pdHRpbmcgSUVDNjA5NTggbGlu
ZWFyIFBDTSBhdWRpbywgdGhlc2UgcmVnaXN0ZXJzIGFsbG93IHRvCj4gPiA+ICsgKiBjb25maWd1
cmUgdGhlIGNoYW5uZWwgc3RhdHVzIGluZm9ybWF0aW9uIG9mIGFsbCB0aGUgY2hhbm5lbCBzdGF0
dXMKPiA+ID4gKyAqIGJpdHMgaW4gdGhlIElFQzYwOTU4IGZyYW1lLiBGb3IgdGhlIG1vbWVudCB0
aGlzIGNvbmZpZ3VyYXRpb24gaXMgb25seQo+ID4gPiArICogdXNlZCB3aGVuIHRoZSBJMlMgYXVk
aW8gaW50ZXJmYWNlLCBHZW5lcmFsIFB1cnBvc2UgQXVkaW8gKEdQQSksCj4gPiA+ICsgKiBvciBB
SEIgYXVkaW8gRE1BIChBSEJBVURETUEpIGludGVyZmFjZSBpcyBhY3RpdmUKPiA+ID4gKyAqIChm
b3IgUy9QRElGIGludGVyZmFjZSB0aGlzIGluZm9ybWF0aW9uIGNvbWVzIGZyb20gdGhlIHN0cmVh
bSkuCj4gPiA+ICsgKi8KPiA+ID4gK3ZvaWQgZHdfaGRtaV9zZXRfY2hhbm5lbF9zdGF0dXMoc3Ry
dWN0IGR3X2hkbWkgKmhkbWksCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1OCAq
Y2hhbm5lbF9zdGF0dXMpCj4gPiA+ICt7Cj4gPiA+ICsgICAvKgo+ID4gPiArICAgICogU2V0IGNo
YW5uZWwgc3RhdHVzIHJlZ2lzdGVyIGZvciBmcmVxdWVuY3kgYW5kIHdvcmQgbGVuZ3RoLgo+ID4g
PiArICAgICogVXNlIGRlZmF1bHQgdmFsdWVzIGZvciBvdGhlciByZWdpc3RlcnMuCj4gPiA+ICsg
ICAgKi8KPiA+ID4gKyAgIGhkbWlfd3JpdGViKGhkbWksIGNoYW5uZWxfc3RhdHVzWzNdLCBIRE1J
X0ZDX0FVRFNDSE5MUzcpOwo+ID4gPiArICAgaGRtaV93cml0ZWIoaGRtaSwgY2hhbm5lbF9zdGF0
dXNbNF0sIEhETUlfRkNfQVVEU0NITkxTOCk7Cj4gPiA+ICt9Cj4gPiA+ICtFWFBPUlRfU1lNQk9M
X0dQTChkd19oZG1pX3NldF9jaGFubmVsX3N0YXR1cyk7Cj4gPiA+ICsKPiA+ID4KPiA+ID4gIHN0
YXRpYyB2b2lkIGhkbWlfc2V0X2Nsa19yZWdlbmVyYXRvcihzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwK
PiA+ID4KPiA+ID4gICAgIHVuc2lnbmVkIGxvbmcgcGl4ZWxfY2xrLCB1bnNpZ25lZCBpbnQgc2Ft
cGxlX3JhdGUpCj4gPiA+Cj4gPiA+ICB7Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaAo+ID4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5oIGluZGV4Cj4gPiA+IDY5ODhmMTJkODlkOS4uZmNm
ZjUwNTlkYjI0IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWkuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuaAo+ID4gPiBAQCAtMTU4LDYgKzE1OCw4IEBACj4gPiA+Cj4gPiA+ICAjZGVmaW5l
IEhETUlfRkNfU1BEREVWSUNFSU5GICAgICAgICAgICAgICAgICAgICAweDEwNjIKPiA+ID4gICNk
ZWZpbmUgSERNSV9GQ19BVURTQ09ORiAgICAgICAgICAgICAgICAgICAgICAgIDB4MTA2Mwo+ID4g
PiAgI2RlZmluZSBIRE1JX0ZDX0FVRFNTVEFUICAgICAgICAgICAgICAgICAgICAgICAgMHgxMDY0
Cj4gPiA+Cj4gPiA+ICsjZGVmaW5lIEhETUlfRkNfQVVEU0NITkxTNyAgICAgICAgICAgICAgICAg
ICAgICAweDEwNmUKPiA+ID4gKyNkZWZpbmUgSERNSV9GQ19BVURTQ0hOTFM4ICAgICAgICAgICAg
ICAgICAgICAgIDB4MTA2Zgo+ID4gPgo+ID4gPiAgI2RlZmluZSBIRE1JX0ZDX0RBVEFDSDBGSUxM
ICAgICAgICAgICAgICAgICAgICAgMHgxMDcwCj4gPiA+ICAjZGVmaW5lIEhETUlfRkNfREFUQUNI
MUZJTEwgICAgICAgICAgICAgICAgICAgICAweDEwNzEKPiA+ID4gICNkZWZpbmUgSERNSV9GQ19E
QVRBQ0gyRklMTCAgICAgICAgICAgICAgICAgICAgIDB4MTA3Mgo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCBiL2luY2x1ZGUvZHJtL2JyaWRnZS9k
d19oZG1pLmgKPiA+ID4gaW5kZXggY2Y1MjhjMjg5ODU3Li40YjNlODYzYzRmOGEgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmgKPiA+ID4gKysrIGIvaW5jbHVk
ZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAo+ID4gPiBAQCAtMTU2LDYgKzE1Niw3IEBAIHZvaWQgZHdf
aGRtaV9zZXR1cF9yeF9zZW5zZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgYm9vbAo+ID4gPiBocGQs
IGJvb2wgcnhfc2Vuc2UpOz4KPiA+ID4gIHZvaWQgZHdfaGRtaV9zZXRfc2FtcGxlX3JhdGUoc3Ry
dWN0IGR3X2hkbWkgKmhkbWksIHVuc2lnbmVkIGludCByYXRlKTsKPiA+ID4gIHZvaWQgZHdfaGRt
aV9zZXRfY2hhbm5lbF9jb3VudChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdW5zaWduZWQgaW50IGNu
dCk7Cj4gPiA+Cj4gPiA+ICt2b2lkIGR3X2hkbWlfc2V0X2NoYW5uZWxfc3RhdHVzKHN0cnVjdCBk
d19oZG1pICpoZG1pLCB1OAo+ID4gPiAqY2hhbm5lbF9zdGF0dXMpOwo+ID4gPgo+ID4gPiAgdm9p
ZCBkd19oZG1pX3NldF9jaGFubmVsX2FsbG9jYXRpb24oc3RydWN0IGR3X2hkbWkgKmhkbWksIHVu
c2lnbmVkIGludAo+ID4gPiAgY2EpOwo+ID4gPiAgdm9pZCBkd19oZG1pX2F1ZGlvX2VuYWJsZShz
dHJ1Y3QgZHdfaGRtaSAqaGRtaSk7Cj4gPiA+ICB2b2lkIGR3X2hkbWlfYXVkaW9fZGlzYWJsZShz
dHJ1Y3QgZHdfaGRtaSAqaGRtaSk7Cj4gPgo+ID4gTG9va3MgZmluZSBmb3IgbWU6Cj4gPiBSZXZp
ZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+ID4KPiA+
IEpvbmFzID8gSmVybmVqID8gUnVzc2VsbCA/Cj4KPiBQYXRjaCBpdHNlbGYgaXMgZmluZSwgSSdt
IGp1c3Qgd29uZGVyaW5nIGlmIG1vcmUgaW5mb3JtYXRpb24gc2hvdWxkIGJlIGNvcGllZAo+IGZy
b20gc3RhdHVzIGFycmF5IHRvIHJlZ2lzdGVycy4gQnV0IEkgdGhpbmsgdGhleSBhcmUgbm90IDE6
MSBtYXBwaW5nIHNvIHNvbWUKPiBtb3JlIHdvcmsgd291bGQgYmUgbmVlZGVkLiBBbnl3YXksIHBh
dGNoIGlzOgoKSGkgSmVybmVqLApZZXMgeW91IGFyZSByaWdodC4gSSB3YXMgdGhpbmtpbmcgYWJv
dXQgdGhlIHNhbWUgdGhpbmcuCkJ1dCB0aGVyZSBhcmUgYWxzbyBzb21lIGZpZWxkcyBpbiB0aGUg
SUVDNjA5NTggc3BlYyBub3QgbWFwcGVkIHRvIHRoZQpyZWdpc3RlcnMgb24gZHctaGRtaS4KU28g
SSBlbmRlZCB1cCBqdXN0IHdyaXRpbmcgdGhlIHR3byByZWdpc3RlcnMgaW4gdGhlIG9yaWdpbmFs
IHlraydzCnBhdGNoLCBhbmQgaWdub3JpbmcgIm9yaWdpbmFsIHNhbXBsaW5nIGZyZXF1ZW5jeSIg
bGlrZSBwY21faWVjOTU4LgpJdCB0dXJucyBvdXQgdGhhdCBhdWRpbyBwbGF5cyBmaW5lIG9uIG15
IExHIG1vbml0b3IuIFNvIEkgc3VnZ2VzdCB3ZQpjYW4ga2VlcCB0aGlzIHBhdGNoIGFzIHNpbXBs
ZSBhcyBpdCBpcywgYW5kIGFkZCBtb3JlIHJlZ2lzdGVyIHNldHRpbmcKaWYgd2UgZmluZCBpc3N1
ZS4KVGhhbmtzIQoKPgo+Cj4gUmV2aWV3ZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2ty
YWJlY0BzaW9sLm5ldD4KPgo+IEJlc3QgcmVnYXJkcywKPiBKZXJuZWoKPgo+ID4KPiA+IElmIGl0
J3Mgb2sgZm9yIHlvdSBJJ2xsIGFwcGx5IGl0Lgo+ID4KPiA+IE5laWwKPgo+Cj4KPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
