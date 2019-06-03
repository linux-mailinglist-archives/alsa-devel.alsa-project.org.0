Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CEC33052
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 14:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B491662;
	Mon,  3 Jun 2019 14:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B491662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559566505;
	bh=zMhbIxXzniILL/Z7Nrj4/9uNY2nzcOr07bgqOA9XEBI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FbTO3PX1b8FXzGwMCeT4vAIN0/YC6SR2FfINEZzLnvgtbYeNMMgihHDIKFuOYzmJ1
	 fvsse2DzQBQWD5fdIs7iESg2wSTZ4dkbhawoFJCRfkcAKRKc5wanEOShn/r9mbO97b
	 fJX0ovOCVe9q2oI5g0KfyR/jegKEF5FSMQlU4CQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09863F896ED;
	Mon,  3 Jun 2019 14:53:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C743AF896DD; Mon,  3 Jun 2019 14:53:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42884F80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 14:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42884F80774
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="i336iScQ"
Received: by mail-wr1-x442.google.com with SMTP id d18so11949827wrs.5
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 05:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=mJzvhiGffEycEWujL+bss26vNVFhjmchmuQXEPVt3OI=;
 b=i336iScQCfCZvbvTGweyXXgI7STx9ES6GbBUErWAbm2GYjsrk15DzygvtflxAU75bw
 7zytegesZVYlVbKGZQl2/uIhWWJLVtIB42A7hmZakjv5JVueeBrWMm6YSSJtVlMdtPEu
 6BS5T8Nzfd4M/xL4YMfXi7rwAtZ+RcQH5RAVDIramgsZf91yFBzp7pqCwOhqc+14iMv2
 k6i1pJeIxiMLnLrjUBpYDHmESWhAfOV6uapL12RaqR4azwGZxYYhiO+BCDffN6O90661
 6HD5JtgDf3Vn7KATsxAB91xl0IhFjSUR8bnZnOe3m9rHBgba5fZbGmYl6BbASR1XySRS
 JaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mJzvhiGffEycEWujL+bss26vNVFhjmchmuQXEPVt3OI=;
 b=IIUsojY+wP2DIWjDIicKymrjGjTS5Ezl1wCGh18yG1F4e3PIfa+CegfShLlSiceMpO
 Ks0Kv3OhVrmfjLW8sd3nAEpclDxr+XpvWVHwC+n9EY9X37gH1X9HX3D3/4yl7yfVwIRL
 OQSb3jPoxWDrHJLb6iuis/IRYEgfXlvsp4zkdGaPZXpV/whgxjGRsBmIEWDan55nCm2F
 bMD3VphgR0tkKvQt49r9/2a3qO69rqW0tvk3ZTvt8a0XlFZL+1frWob5XC/0+vW7/k1U
 Een45fsEQo/3D/yxCH/xSKTaOnolYjLd498+E5dll4o9HPG1znRcJTUSrHmAU40Q70QI
 b6lg==
X-Gm-Message-State: APjAAAUq9guB3yCiNbYjt4JU5pPrGWn065PWPx/Kp2aXnY2DdAomKXtL
 saNFqFwb2Ez3tP6M4eldk/NeDg==
X-Google-Smtp-Source: APXvYqxFE0118CiSNYTdmHv39GS0d43c8AFGtSRqVsdLZ2291NPcyMYGAd6S+TG69G1rOWsB4WIMmg==
X-Received: by 2002:a5d:6849:: with SMTP id o9mr2541732wrw.196.1559566395383; 
 Mon, 03 Jun 2019 05:53:15 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id g8sm1176779wmf.17.2019.06.03.05.53.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 05:53:14 -0700 (PDT)
Date: Mon, 3 Jun 2019 13:53:13 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gwendal Grignou <gwendal@chromium.org>
Message-ID: <20190603125313.GU4797@dell>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, groeck@chromium.org, broonie@kernel.org,
 enric.balletbo@collabora.com, bleung@chromium.org, jic23@kernel.org,
 cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH v3 00/30] Update cros_ec_commands.h
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

T24gVGh1LCAwOSBNYXkgMjAxOSwgR3dlbmRhbCBHcmlnbm91IHdyb3RlOgoKPiBUaGUgaW50ZXJm
YWNlIGJldHdlZW4gQ3Jvc0VDIGVtYmVkZGVkIGNvbnRyb2xsZXIgYW5kIHRoZSBob3N0LAo+IGRl
c2NyaWJlZCBieSBjcm9zX2VjX2NvbW1hbmRzLmgsIGFzIGRpdmVyZ2VkIGZyb20gd2hhdCB0aGUg
ZW1iZWRkZWQKPiBjb250cm9sbGVyIHJlYWxseSBzdXBwb3J0Lgo+IAo+IFRoZSBzb3VyY2Ugb2Yg
dGhydXRoIGlzIGF0Cj4gaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3VyY2UuY29tL2Nocm9taXVt
b3MvcGxhdGZvcm0vZWMvKy9tYXN0ZXIvaW5jbHVkZS9lY19jb21tYW5kcy5oCj4gCj4gVGhhdCBp
bmNsdWRlIGZpbGUgaXMgY29udmVydGVkIHRvIHJlbW92ZSBBQ1BJIGFuZCBFbWJlZGRlZCBvbmx5
IGNvZGUuCj4gCj4gRnJvbSBub3cgb24sIGNyb3NfZWNfY29tbWFuZHMuaCB3aWxsIGJlIGF1dG9t
YXRpY2FsbHkgZ2VuZXJhdGVkIGZyb20KPiB0aGUgZmlsZSBhYm92ZSwgZG8gbm90IG1vZGlmeSBk
aXJlY3RseS4KPiAKPiBGZWxsIGZyZWUgdG8gc3F1YXNoIHRoZSBjb21taXRzIGJlbG93Lgo+IAo+
IENoYW5nZXMgaW4gdjM6Cj4gLSBSZWJhc2UgYWZ0ZXIgY29tbWl0IDgxODg4ZDhhYjE1MzIgKCJt
ZmQ6IGNyb3NfZWM6IFVwZGF0ZSB0aGUgRUMgZmVhdHVyZSBjb2RlcyIpCj4gLSBBZGQgQWNrZWQt
Ynk6IEJlbnNvbiBMZXVuZyA8YmxldW5nQGNocm9taXVtLm9yZz4KPiAKPiBDaGFuZ2VzIGluIHYy
Ogo+IC0gTW92ZSBJMlMgY2hhbmdlcyBhdCB0aGUgZW5kIG9mIHRoZSBwYXRjaHNldCwgc3F1YXNo
ZWQgd2l0aCBjaGFuZ2UgaW4KPiAgIHNvdW5kL3NvYy9jb2RlY3MvY3Jvc19lY19jb2RlYy5jIHRv
IG1hdGNoIG5ldyBpbnRlcmZhY2UuCj4gLSBBZGQgQWNrZWQtYnk6IEVucmljIEJhbGxldGJvIGkg
U2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gCj4gR3dlbmRhbCBHcmlnbm91
ICgzMCk6Cj4gICBtZmQ6IGNyb3NfZWM6IFVwZGF0ZSBsaWNlbnNlIHRlcm0KPiAgIG1mZDogY3Jv
c19lYzogWmVybyBCVUlMRF8gbWFjcm8KPiAgIG1mZDogY3Jvc19lYzogc2V0IGNvbW1lbnRzIHBy
b3Blcmx5Cj4gICBtZmQ6IGNyb3NfZWM6IGFkZCBlY19hbGlnbiBtYWNyb3MKPiAgIG1mZDogY3Jv
c19lYzogRGVmaW5lIGNvbW1hbmRzIGFzIDQtZGlnaXQgVVBQRVIgQ0FTRSBoZXggdmFsdWVzCj4g
ICBtZmQ6IGNyb3NfZWM6IHVzZSBCSVQgbWFjcm8KPiAgIG1mZDogY3Jvc19lYzogVXBkYXRlIEFD
UEkgaW50ZXJmYWNlIGRlZmluaXRpb24KPiAgIG1mZDogY3Jvc19lYzogbW92ZSBIRE1JIENFQyBB
UEkgZGVmaW5pdGlvbgo+ICAgbWZkOiBjcm9zX2VjOiBSZW1vdmUgemVyby1zaXplIHN0cnVjdHMK
PiAgIG1mZDogY3Jvc19lYzogQWRkIEZsYXNoIFYyIGNvbW1hbmRzIEFQSQo+ICAgbWZkOiBjcm9z
X2VjOiBBZGQgUFdNX1NFVF9EVVRZIEFQSQo+ICAgbWZkOiBjcm9zX2VjOiBBZGQgbGlnaHRiYXIg
djIgQVBJCj4gICBtZmQ6IGNyb3NfZWM6IEV4cGFuZCBoYXNoIEFQSQo+ICAgbWZkOiBjcm9zX2Vj
OiBBZGQgRUMgdHJhbnNwb3J0IHByb3RvY29sIHY0Cj4gICBtZmQ6IGNyb3NfZWM6IENvbXBsZXRl
IE1FTVMgc2Vuc29yIEFQSQo+ICAgbWZkOiBjcm9zX2VjOiBGaXggZXZlbnQgcHJvY2Vzc2luZyBB
UEkKPiAgIG1mZDogY3Jvc19lYzogQWRkIGZpbmdlcnByaW50IEFQSQo+ICAgbWZkOiBjcm9zX2Vj
OiBGaXggdGVtcGVyYXR1cmUgQVBJCj4gICBtZmQ6IGNyb3NfZWM6IENvbXBsZXRlIFBvd2VyIGFu
ZCBVU0IgUEQgQVBJCj4gICBtZmQ6IGNyb3NfZWM6IEFkZCBBUEkgZm9yIGtleWJvYXJkIHRlc3Rp
bmcKPiAgIG1mZDogY3Jvc19lYzogQWRkIEhpYmVybmF0ZSBBUEkKPiAgIG1mZDogY3Jvc19lYzog
QWRkIFNtYXJ0IEJhdHRlcnkgRmlybXdhcmUgdXBkYXRlIEFQSQo+ICAgbWZkOiBjcm9zX2VjOiBB
ZGQgSTJDIHBhc3N0aHJ1IHByb3RlY3Rpb24gQVBJCj4gICBtZmQ6IGNyb3NfZWM6IEFkZCBBUEkg
Zm9yIEVDLUVDIGNvbW11bmljYXRpb24KPiAgIG1mZDogY3Jvc19lYzogQWRkIEFQSSBmb3IgVG91
Y2hwYWQgc3VwcG9ydAo+ICAgbWZkOiBjcm9zX2VjOiBBZGQgQVBJIGZvciBGaW5nZXJwcmludCBz
dXBwb3J0Cj4gICBtZmQ6IGNyb3NfZWM6IEFkZCBBUEkgZm9yIHJ3c2lnCj4gICBtZmQ6IGNyb3Nf
ZWM6IEFkZCBTS1UgSUQgYW5kIFNlY3VyZSBzdG9yYWdlIEFQSQo+ICAgbWZkOiBjcm9zX2VjOiBB
ZGQgTWFuYWdlbWVudCBBUEkgZW50cnkgcG9pbnRzCj4gICBtZmQ6IGNyb3NfZWM6IFVwZGF0ZSBJ
MlMgQVBJCj4gCj4gIGluY2x1ZGUvbGludXgvbWZkL2Nyb3NfZWNfY29tbWFuZHMuaCB8IDM2NTgg
KysrKysrKysrKysrKysrKysrKystLS0tLS0KPiAgc291bmQvc29jL2NvZGVjcy9jcm9zX2VjX2Nv
ZGVjLmMgICAgIHwgICAgOCArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI5MTUgaW5zZXJ0aW9ucygr
KSwgNzUxIGRlbGV0aW9ucygtKQoKT2theSwgSSdtIHJlYWR5IHRvIGFwcGx5IHRoaXMgbm93LiAg
Q291bGQgeW91IGNvbGxlY3QgYWxsIG9mIHRoZSBBY2tzCnlvdSByZWNlaXZlZCBhbmQgc3VibWl0
IGEgUkVTRU5EIHBsZWFzZT8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZp
Y2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
