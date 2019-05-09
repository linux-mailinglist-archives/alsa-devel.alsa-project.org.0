Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B01852A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 08:13:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13DFB1855;
	Thu,  9 May 2019 08:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13DFB1855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557382393;
	bh=zQGu4eE8y9gWLWYRDAWp6X9h0SEDHlbJuZQ0IA+Uwls=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VbmSfSxV+LdpL80O9lnlnlMBCyWRaTXGJCo4L3jXAVE6l5/1ZFGXpTvjHhXv5oLPr
	 JBmpla9zC/V4CkJ0bEI/Yb1A+LPlRHRlEALCQqJkk/HlR6WErXkG20dQRdTsaJxVHm
	 iRlbkDvDIZ5Nmmox3w7RMT3MHhIvDMQpN3EhEY/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65EC4F89682;
	Thu,  9 May 2019 08:11:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E4C2F89674; Thu,  9 May 2019 08:11:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC5D2F807B5
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 08:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC5D2F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="laZZODAe"
Received: by mail-wm1-x343.google.com with SMTP id f2so1491519wmj.3
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 23:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=10yNfjWlj6Q+p5zJZH8R6Odak87HYwUB4RGRx/vkup4=;
 b=laZZODAesL0bLuuZenPPuVdtnwFMncG9bBdMr8peQvRNZYuu4JSUJvE6CyZlFBi52q
 DBDT+TOFV/NzibULe+t2UcLsAgjWf6DQaKje+NvL4dt/ANOnJkLTca4Yjb65ZHbiYvfg
 kcMgNVMNH7gwzLb4yLACOGzO1VGg+r5KE46B+nCQxHeXltIAtQ/jUVL8NchSYENN8DqJ
 +O7aZUJv/YWOh78j1i3oigS3XNvw1cZTrrdn3JwzoTlul7CRPhlb9vLHnIJNKWkY7CYi
 aMJ3+87uhtvSVECffSlgUT+mn7mURg31oiDF43ZvtxFiCEyj2JDTRcc63eFBleB4ohZW
 4TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=10yNfjWlj6Q+p5zJZH8R6Odak87HYwUB4RGRx/vkup4=;
 b=k4yBmo1nijHk7C1MeRoqNoUyRJVfwnZvtirdHH+BLLBdn3LWSOTHt4KJj5rNq284iR
 aYEEWg96AUb48kttUBVlChdVOvMIm8SHrsFeR9YQNsS77bKn209V4RKjhMltFXL4f59B
 HmynFkqmJ3BX9svY6VgPyH7X0UJ6SqLMu0ikKWkgc5LrvrS40qxikS0bgDxuXaiwF0pB
 y0V2v8q+MIROoVX4YbZWstDp/BvN9wMB8eoWib/jgxfe7yvh6g34wqZJjH0n0e/VEz8t
 IpaDRcpBoGD8xB7gd8j7ph660WvvY9Pz/ZKbdedAhFRzC0wT/ZCSy0yYMz2Q/AN0k54V
 Dltw==
X-Gm-Message-State: APjAAAWKJvYAgcuCrB+VqRQyQvMeiXUTJwNUmb2gGE0Bc91s2LC/X3ia
 rAkrl7OV8l+z3prb1m8Nj49fFw==
X-Google-Smtp-Source: APXvYqw/E0mALvZqOxNaf2fa6zR5nT5NOytbPtk51OufaRcnN5C3ta1VLzkNXx/u8ButibYxSfElwA==
X-Received: by 2002:a1c:e3d7:: with SMTP id a206mr475288wmh.7.1557382282720;
 Wed, 08 May 2019 23:11:22 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id u9sm997939wmd.14.2019.05.08.23.11.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 23:11:21 -0700 (PDT)
Date: Thu, 9 May 2019 07:11:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Benson Leung <bleung@google.com>
Message-ID: <20190509061119.GT31645@dell>
References: <20190503220233.64546-1-gwendal@chromium.org>
 <20190507094446.GD4529@dell> <20190508231954.GA41543@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508231954.GA41543@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Gwendal Grignou <gwendal@chromium.org>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, tiwai@suse.com, groeck@chromium.org,
 broonie@kernel.org, enric.balletbo@collabora.com, bleung@chromium.org,
 jic23@kernel.org, cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH v2 00/30] Update cros_ec_commands.h
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

T24gV2VkLCAwOCBNYXkgMjAxOSwgQmVuc29uIExldW5nIHdyb3RlOgoKPiBIaSBHd2VuZGFsLCBI
aSBMZWUsCj4gCj4gT24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMTA6NDQ6NDZBTSArMDEwMCwgTGVl
IEpvbmVzIHdyb3RlOgo+ID4gT24gRnJpLCAwMyBNYXkgMjAxOSwgR3dlbmRhbCBHcmlnbm91IHdy
b3RlOgo+ID4gCj4gPiA+IFRoZSBpbnRlcmZhY2UgYmV0d2VlbiBDcm9zRUMgZW1iZWRkZWQgY29u
dHJvbGxlciBhbmQgdGhlIGhvc3QsCj4gPiA+IGRlc2NyaWJlZCBieSBjcm9zX2VjX2NvbW1hbmRz
LmgsIGFzIGRpdmVyZ2VkIGZyb20gd2hhdCB0aGUgZW1iZWRkZWQKPiA+ID4gY29udHJvbGxlciBy
ZWFsbHkgc3VwcG9ydC4KPiA+ID4gCj4gPiA+IFRoZSBzb3VyY2Ugb2YgdGhydXRoIGlzIGF0Cj4g
PiA+IGh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9jaHJvbWl1bW9zL3BsYXRmb3Jt
L2VjLysvbWFzdGVyL2luY2x1ZGUvZWNfY29tbWFuZHMuaAo+ID4gPiAKPiA+ID4gVGhhdCBpbmNs
dWRlIGZpbGUgaXMgY29udmVydGVkIHRvIHJlbW92ZSBBQ1BJIGFuZCBFbWJlZGRlZCBvbmx5IGNv
ZGUuCj4gPiA+IAo+ID4gPiBGcm9tIG5vdyBvbiwgY3Jvc19lY19jb21tYW5kcy5oIHdpbGwgYmUg
YXV0b21hdGljYWxseSBnZW5lcmF0ZWQgZnJvbQo+ID4gPiB0aGUgZmlsZSBhYm92ZSwgZG8gbm90
IG1vZGlmeSBkaXJlY3RseS4KPiA+ID4gCj4gPiA+IEZlbGwgZnJlZSB0byBzcXVhc2ggdGhlIGNv
bW1pdHMgYmVsb3cuCj4gPiA+IAo+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiAtIE1vdmUgSTJT
IGNoYW5nZXMgYXQgdGhlIGVuZCBvZiB0aGUgcGF0Y2hzZXQsIHNxdWFzaGVkIHdpdGggY2hhbmdl
IGluCj4gPiA+ICAgc291bmQvc29jL2NvZGVjcy9jcm9zX2VjX2NvZGVjLmMgdG8gbWF0Y2ggbmV3
IGludGVyZmFjZS4KPiA+ID4gLSBBZGQgQWNrZWQtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEg
PGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gPiA+IAo+ID4gPiBHd2VuZGFsIEdyaWdu
b3UgKDMwKToKPiA+ID4gICBtZmQ6IGNyb3NfZWM6IFVwZGF0ZSBsaWNlbnNlIHRlcm0KPiA+ID4g
ICBtZmQ6IGNyb3NfZWM6IFplcm8gQlVJTERfIG1hY3JvCj4gPiA+ICAgbWZkOiBjcm9zX2VjOiBz
ZXQgY29tbWVudHMgcHJvcGVybHkKPiA+ID4gICBtZmQ6IGNyb3NfZWM6IGFkZCBlY19hbGlnbiBt
YWNyb3MKPiA+ID4gICBtZmQ6IGNyb3NfZWM6IERlZmluZSBjb21tYW5kcyBhcyA0LWRpZ2l0IFVQ
UEVSIENBU0UgaGV4IHZhbHVlcwo+ID4gPiAgIG1mZDogY3Jvc19lYzogdXNlIEJJVCBtYWNybwo+
ID4gPiAgIG1mZDogY3Jvc19lYzogVXBkYXRlIEFDUEkgaW50ZXJmYWNlIGRlZmluaXRpb24KPiA+
ID4gICBtZmQ6IGNyb3NfZWM6IG1vdmUgSERNSSBDRUMgQVBJIGRlZmluaXRpb24KPiA+ID4gICBt
ZmQ6IGNyb3NfZWM6IFJlbW92ZSB6ZXJvLXNpemUgc3RydWN0cwo+ID4gPiAgIG1mZDogY3Jvc19l
YzogQWRkIEZsYXNoIFYyIGNvbW1hbmRzIEFQSQo+ID4gPiAgIG1mZDogY3Jvc19lYzogQWRkIFBX
TV9TRVRfRFVUWSBBUEkKPiA+ID4gICBtZmQ6IGNyb3NfZWM6IEFkZCBsaWdodGJhciB2MiBBUEkK
PiA+ID4gICBtZmQ6IGNyb3NfZWM6IEV4cGFuZCBoYXNoIEFQSQo+ID4gPiAgIG1mZDogY3Jvc19l
YzogQWRkIEVDIHRyYW5zcG9ydCBwcm90b2NvbCB2NAo+ID4gPiAgIG1mZDogY3Jvc19lYzogQ29t
cGxldGUgTUVNUyBzZW5zb3IgQVBJCj4gPiA+ICAgbWZkOiBjcm9zX2VjOiBGaXggZXZlbnQgcHJv
Y2Vzc2luZyBBUEkKPiA+ID4gICBtZmQ6IGNyb3NfZWM6IEFkZCBmaW5nZXJwcmludCBBUEkKPiA+
ID4gICBtZmQ6IGNyb3NfZWM6IEZpeCB0ZW1wZXJhdHVyZSBBUEkKPiA+ID4gICBtZmQ6IGNyb3Nf
ZWM6IENvbXBsZXRlIFBvd2VyIGFuZCBVU0IgUEQgQVBJCj4gPiA+ICAgbWZkOiBjcm9zX2VjOiBB
ZGQgQVBJIGZvciBrZXlib2FyZCB0ZXN0aW5nCj4gPiA+ICAgbWZkOiBjcm9zX2VjOiBBZGQgSGli
ZXJuYXRlIEFQSQo+ID4gPiAgIG1mZDogY3Jvc19lYzogQWRkIFNtYXJ0IEJhdHRlcnkgRmlybXdh
cmUgdXBkYXRlIEFQSQo+ID4gPiAgIG1mZDogY3Jvc19lYzogQWRkIEkyQyBwYXNzdGhydSBwcm90
ZWN0aW9uIEFQSQo+ID4gPiAgIG1mZDogY3Jvc19lYzogQWRkIEFQSSBmb3IgRUMtRUMgY29tbXVu
aWNhdGlvbgo+ID4gPiAgIG1mZDogY3Jvc19lYzogQWRkIEFQSSBmb3IgVG91Y2hwYWQgc3VwcG9y
dAo+ID4gPiAgIG1mZDogY3Jvc19lYzogQWRkIEFQSSBmb3IgRmluZ2VycHJpbnQgc3VwcG9ydAo+
ID4gPiAgIG1mZDogY3Jvc19lYzogQWRkIEFQSSBmb3IgcndzaWcKPiA+ID4gICBtZmQ6IGNyb3Nf
ZWM6IEFkZCBTS1UgSUQgYW5kIFNlY3VyZSBzdG9yYWdlIEFQSQo+ID4gPiAgIG1mZDogY3Jvc19l
YzogQWRkIE1hbmFnZW1lbnQgQVBJIGVudHJ5IHBvaW50cwo+ID4gPiAgIG1mZDogY3Jvc19lYzog
VXBkYXRlIEkyUyBBUEkKPiA+ID4gCj4gPiA+ICBpbmNsdWRlL2xpbnV4L21mZC9jcm9zX2VjX2Nv
bW1hbmRzLmggfCAzNzM1ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gPiA+ICBzb3VuZC9z
b2MvY29kZWNzL2Nyb3NfZWNfY29kZWMuYyAgICAgfCAgICA4ICstCj4gPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDI5OTcgaW5zZXJ0aW9ucygrKSwgNzQ2IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBBZ2Fp
biwgaXQgd291bGQgYmUgZ29vZCB0byBnZXQgMSBvciAyIG1vcmUgQ2hyb21pdW0gQWNrcywgZ2l2
ZW4gdGhlCj4gPiBleHRlbnQgb2YgdGhlIGNoYW5nZXMuCj4gCj4gSSd2ZSBnb25lIGFoZWFkIGFu
ZCBsb29rZWQgdGhyb3VnaCBhbGwgMzAgb2YgdGhlIGNoYW5nZXMgaGVyZS4gSXQgbG9va3MgZ29v
ZCB0byBtZS4KPiAKPiBBY2tlZC1CeTogQmVuc29uIExldW5nIDxibGV1bmdAY2hyb21pdW0ub3Jn
PgoKVGhhbmtzIGZvciB0YWtpbmcgaGUgdGltZS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10K
TGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNl
IHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIg
fCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
