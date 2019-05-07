Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3E116150
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 11:46:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2169184A;
	Tue,  7 May 2019 11:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2169184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557222400;
	bh=jelee2X9XZqpahzF3wgslnjzUnoYrWp/4mt+cDKAORM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bgqE1tfR4INxh+FanpE6lcs2HQkepyukK6WggbuntP/ztL7nDBs9uaBaIblaRZZ9Y
	 hWS0w8jY0B93HhhS+mYLRIeDNwJeQ8XdZJ9h1lt/jfyP4OU4NBOHmBS9zUryNpw/na
	 Db/XLL+PjevE1HOZ7LTzwFq5BtYw20m/+KZMuxjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E290FF89674;
	Tue,  7 May 2019 11:44:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4063F89674; Tue,  7 May 2019 11:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E23DF807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 11:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E23DF807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IzDbYDwY"
Received: by mail-wm1-x341.google.com with SMTP id o25so8447074wmf.2
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 02:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=tBpp/bG/ZmwTb4vBiTX4r+mHSsHGogQ7hhruU5zMJ7o=;
 b=IzDbYDwYnXtOG1djPxlvt2LH/gq3sVbvwRxtcnZgh6Xe8g4j7rqnzNmj0GBVChEvaJ
 sCrDxLQtGvvbltABdIA7Q3iAnHOjsjJS2V5BCXI33456vJ76skhl8UNDLNGV/Kg45ktt
 3iTiKjG6v6Rsgc0Ss9yrXs3ASwzs4oAwJDEXE5DMhaehSneauawPeGroDKnJJtQe8poa
 /AQJW6XWId70OxT2gxdI34ZmYbN598BCI4E49YeRnEWa/HLGQhvU6NbtaxsSZRiF3iGa
 IjBc2ucSTG7XWWcY4I4HKU0plyMf70gDpWlbD9bpR+EFGF8ZIFfPoAUqAn0xNzW59Waf
 +c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=tBpp/bG/ZmwTb4vBiTX4r+mHSsHGogQ7hhruU5zMJ7o=;
 b=l6mjf42ZbYxPb3yC0T9CegGZDY1n5Q0c878IRvuF3kkygpz99dc58XLKR4hbVOMKjr
 sMxIIrk3gsU9OeGtfgR/xd/50IJ9pnfX973WHOXYhX28vN7KhREfOoUBBzv320v5KtUB
 DwJPfSfHWdTYzmbvSmMuFb9tglIaMmEg6XkPWxDV846gGh5kr9DIM+msfWjBLMmystit
 c0PehkG5J3nbtnxBQNLyeNovTHO5dYGHwezuvYTN51VUYeC7xWFfSQfWcxQBbnVHFUmB
 q3sutRrbudw8aLd52ipr7ZtBnPIEhjoeopCYSqdEk7sRixJAmltCi8hRxK+5ZFyWHtiO
 L/cQ==
X-Gm-Message-State: APjAAAV7wejDdx493CtfMki4PxutK08yq1id2YePY6LRzj3ef5QG27Ip
 qapXUHmWQ06M0gGjxR14rAIinA==
X-Google-Smtp-Source: APXvYqycfwgVAYDhFRxFI6FyrSmaV7Jpwm1mE2kT04bW6crWZrdbMErveEz28TjLhod7S7fOIVm3OA==
X-Received: by 2002:a7b:c415:: with SMTP id k21mr7780514wmi.29.1557222288438; 
 Tue, 07 May 2019 02:44:48 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id 195sm27122082wme.32.2019.05.07.02.44.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 02:44:47 -0700 (PDT)
Date: Tue, 7 May 2019 10:44:46 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gwendal Grignou <gwendal@chromium.org>
Message-ID: <20190507094446.GD4529@dell>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org, tiwai@suse.com,
 groeck@chromium.org, broonie@kernel.org, enric.balletbo@collabora.com,
 bleung@chromium.org, jic23@kernel.org, cychiang@chromium.org
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

T24gRnJpLCAwMyBNYXkgMjAxOSwgR3dlbmRhbCBHcmlnbm91IHdyb3RlOgoKPiBUaGUgaW50ZXJm
YWNlIGJldHdlZW4gQ3Jvc0VDIGVtYmVkZGVkIGNvbnRyb2xsZXIgYW5kIHRoZSBob3N0LAo+IGRl
c2NyaWJlZCBieSBjcm9zX2VjX2NvbW1hbmRzLmgsIGFzIGRpdmVyZ2VkIGZyb20gd2hhdCB0aGUg
ZW1iZWRkZWQKPiBjb250cm9sbGVyIHJlYWxseSBzdXBwb3J0Lgo+IAo+IFRoZSBzb3VyY2Ugb2Yg
dGhydXRoIGlzIGF0Cj4gaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3VyY2UuY29tL2Nocm9taXVt
b3MvcGxhdGZvcm0vZWMvKy9tYXN0ZXIvaW5jbHVkZS9lY19jb21tYW5kcy5oCj4gCj4gVGhhdCBp
bmNsdWRlIGZpbGUgaXMgY29udmVydGVkIHRvIHJlbW92ZSBBQ1BJIGFuZCBFbWJlZGRlZCBvbmx5
IGNvZGUuCj4gCj4gRnJvbSBub3cgb24sIGNyb3NfZWNfY29tbWFuZHMuaCB3aWxsIGJlIGF1dG9t
YXRpY2FsbHkgZ2VuZXJhdGVkIGZyb20KPiB0aGUgZmlsZSBhYm92ZSwgZG8gbm90IG1vZGlmeSBk
aXJlY3RseS4KPiAKPiBGZWxsIGZyZWUgdG8gc3F1YXNoIHRoZSBjb21taXRzIGJlbG93Lgo+IAo+
IENoYW5nZXMgaW4gdjI6Cj4gLSBNb3ZlIEkyUyBjaGFuZ2VzIGF0IHRoZSBlbmQgb2YgdGhlIHBh
dGNoc2V0LCBzcXVhc2hlZCB3aXRoIGNoYW5nZSBpbgo+ICAgc291bmQvc29jL2NvZGVjcy9jcm9z
X2VjX2NvZGVjLmMgdG8gbWF0Y2ggbmV3IGludGVyZmFjZS4KPiAtIEFkZCBBY2tlZC1ieTogRW5y
aWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiAKPiBH
d2VuZGFsIEdyaWdub3UgKDMwKToKPiAgIG1mZDogY3Jvc19lYzogVXBkYXRlIGxpY2Vuc2UgdGVy
bQo+ICAgbWZkOiBjcm9zX2VjOiBaZXJvIEJVSUxEXyBtYWNybwo+ICAgbWZkOiBjcm9zX2VjOiBz
ZXQgY29tbWVudHMgcHJvcGVybHkKPiAgIG1mZDogY3Jvc19lYzogYWRkIGVjX2FsaWduIG1hY3Jv
cwo+ICAgbWZkOiBjcm9zX2VjOiBEZWZpbmUgY29tbWFuZHMgYXMgNC1kaWdpdCBVUFBFUiBDQVNF
IGhleCB2YWx1ZXMKPiAgIG1mZDogY3Jvc19lYzogdXNlIEJJVCBtYWNybwo+ICAgbWZkOiBjcm9z
X2VjOiBVcGRhdGUgQUNQSSBpbnRlcmZhY2UgZGVmaW5pdGlvbgo+ICAgbWZkOiBjcm9zX2VjOiBt
b3ZlIEhETUkgQ0VDIEFQSSBkZWZpbml0aW9uCj4gICBtZmQ6IGNyb3NfZWM6IFJlbW92ZSB6ZXJv
LXNpemUgc3RydWN0cwo+ICAgbWZkOiBjcm9zX2VjOiBBZGQgRmxhc2ggVjIgY29tbWFuZHMgQVBJ
Cj4gICBtZmQ6IGNyb3NfZWM6IEFkZCBQV01fU0VUX0RVVFkgQVBJCj4gICBtZmQ6IGNyb3NfZWM6
IEFkZCBsaWdodGJhciB2MiBBUEkKPiAgIG1mZDogY3Jvc19lYzogRXhwYW5kIGhhc2ggQVBJCj4g
ICBtZmQ6IGNyb3NfZWM6IEFkZCBFQyB0cmFuc3BvcnQgcHJvdG9jb2wgdjQKPiAgIG1mZDogY3Jv
c19lYzogQ29tcGxldGUgTUVNUyBzZW5zb3IgQVBJCj4gICBtZmQ6IGNyb3NfZWM6IEZpeCBldmVu
dCBwcm9jZXNzaW5nIEFQSQo+ICAgbWZkOiBjcm9zX2VjOiBBZGQgZmluZ2VycHJpbnQgQVBJCj4g
ICBtZmQ6IGNyb3NfZWM6IEZpeCB0ZW1wZXJhdHVyZSBBUEkKPiAgIG1mZDogY3Jvc19lYzogQ29t
cGxldGUgUG93ZXIgYW5kIFVTQiBQRCBBUEkKPiAgIG1mZDogY3Jvc19lYzogQWRkIEFQSSBmb3Ig
a2V5Ym9hcmQgdGVzdGluZwo+ICAgbWZkOiBjcm9zX2VjOiBBZGQgSGliZXJuYXRlIEFQSQo+ICAg
bWZkOiBjcm9zX2VjOiBBZGQgU21hcnQgQmF0dGVyeSBGaXJtd2FyZSB1cGRhdGUgQVBJCj4gICBt
ZmQ6IGNyb3NfZWM6IEFkZCBJMkMgcGFzc3RocnUgcHJvdGVjdGlvbiBBUEkKPiAgIG1mZDogY3Jv
c19lYzogQWRkIEFQSSBmb3IgRUMtRUMgY29tbXVuaWNhdGlvbgo+ICAgbWZkOiBjcm9zX2VjOiBB
ZGQgQVBJIGZvciBUb3VjaHBhZCBzdXBwb3J0Cj4gICBtZmQ6IGNyb3NfZWM6IEFkZCBBUEkgZm9y
IEZpbmdlcnByaW50IHN1cHBvcnQKPiAgIG1mZDogY3Jvc19lYzogQWRkIEFQSSBmb3IgcndzaWcK
PiAgIG1mZDogY3Jvc19lYzogQWRkIFNLVSBJRCBhbmQgU2VjdXJlIHN0b3JhZ2UgQVBJCj4gICBt
ZmQ6IGNyb3NfZWM6IEFkZCBNYW5hZ2VtZW50IEFQSSBlbnRyeSBwb2ludHMKPiAgIG1mZDogY3Jv
c19lYzogVXBkYXRlIEkyUyBBUEkKPiAKPiAgaW5jbHVkZS9saW51eC9tZmQvY3Jvc19lY19jb21t
YW5kcy5oIHwgMzczNSArKysrKysrKysrKysrKysrKysrKystLS0tLQo+ICBzb3VuZC9zb2MvY29k
ZWNzL2Nyb3NfZWNfY29kZWMuYyAgICAgfCAgICA4ICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjk5
NyBpbnNlcnRpb25zKCspLCA3NDYgZGVsZXRpb25zKC0pCgpBZ2FpbiwgaXQgd291bGQgYmUgZ29v
ZCB0byBnZXQgMSBvciAyIG1vcmUgQ2hyb21pdW0gQWNrcywgZ2l2ZW4gdGhlCmV4dGVudCBvZiB0
aGUgY2hhbmdlcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRl
Y2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
