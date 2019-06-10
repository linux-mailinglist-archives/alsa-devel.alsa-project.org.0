Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93643B0AB
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 10:22:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B9AE16C0;
	Mon, 10 Jun 2019 10:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B9AE16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560154921;
	bh=+G+a2okHEa8ThCFN7ejnFUlcWTrF7nhsbX9EHuVddBk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+2IC91e4MzlaJvioCI4mBo/4Zo+ad0IAc6ZIMpmeDTLt9yAwyC3CRK7smWdEznCm
	 6qrGqSv+uaHCuOBy7tKz8kdU8E16kXi3qyr+4b9Nfsf4jocfqf3FWYOU4dXLfhXUZ4
	 ZZflAwamFfTaVmFcioRgKtH+SrOBYBLDfE56ytLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20FADF8970C;
	Mon, 10 Jun 2019 10:20:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F579F896FA; Mon, 10 Jun 2019 10:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF21FF8070E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 10:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF21FF8070E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ShN/wlRZ"
Received: by mail-wr1-x434.google.com with SMTP id n9so8224029wru.0
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 01:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=s4CuSQBNjpCCNw2nzrPLspN54vVYUiRnMZOt2mADAck=;
 b=ShN/wlRZ6+T44YTTak7qIefyrWi2CFZpPHiFhwCs+6agNStIZl1VrtoRnwiAM0giZH
 IAwfc0CH0F4tiD3rFC4avNyeVdYZ6SnX2Bq/7D/tKM+S6r1BRT2JYQ6XNmpvZ/nizexF
 0lnXpdRjyFe0c1z5FobfClGzY0GDVCh5ptL25eI7JnK8KFmopfny2JNzAT0J9JElyoxP
 7NGTznHV5Rjbx7fviSoZ1YLTCNdo1WxzQwPTEm5ygMLqr2hjqAnGLHRUXs3O9Ffpi8Ck
 jb/Fe1KXTTaiFa7yR3iziFOKj8R2lcOeLwmPPYpJAwkVTiPZEHiKSRAizxcp7h1NgrsV
 1eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=s4CuSQBNjpCCNw2nzrPLspN54vVYUiRnMZOt2mADAck=;
 b=owjawmS1sPmDTaTCTuD9Kl1TcBWiXqU2lIcsQ78IfedgS/kChSLU83GKRchHVvZVzZ
 UWreeF4UEz0TEu3pNO9FeY3/+xU689vydybJ0m4OF748OnepCEoJDqak+JNntkUvswKb
 XjoGxLrgf2bfQ/ufn3po1gnB5+f/9IIziGQbdjHXwcCtGXcfh6Gkgb6JVWQAgZxkWiS4
 k/OULBg2+G88oQa7aDpmV0qvYnRKvjzjqsZFWuRbUx3ykwkJrn/AsePhFofqIIRi7UJW
 viacGBfGd+GEe2Cb08XnogsT8eJRrBfR3/hrIigSigZTNMpild/bj3sDPPLpF+HPs9xQ
 vcuA==
X-Gm-Message-State: APjAAAWWjp+1OfqD2CCX9/gINrsJ0HaBrIUdYFPJaM7QCQga7tbhwPY2
 tmKXazEJiHGsamJQayFR7kuv1A==
X-Google-Smtp-Source: APXvYqwZMgo/mIX2mHjN3PTc4kasBDUVDC60B5GI5hdZc40wSrHoaFk89PunjVBNxAjDf3jnFeSU0Q==
X-Received: by 2002:a5d:53d2:: with SMTP id a18mr17554731wrw.98.1560154814655; 
 Mon, 10 Jun 2019 01:20:14 -0700 (PDT)
Received: from dell ([2.31.167.229])
 by smtp.gmail.com with ESMTPSA id o185sm14013441wmo.45.2019.06.10.01.20.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Jun 2019 01:20:13 -0700 (PDT)
Date: Mon, 10 Jun 2019 09:20:12 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Message-ID: <20190610082012.GK4797@dell>
References: <20190603183401.151408-1-gwendal@chromium.org>
 <20190604055908.GA4797@dell>
 <CAFqH_51gMu81f=VFQaF4u9-tAWDMocGAwM_fOPT3Cctv6KWniw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFqH_51gMu81f=VFQaF4u9-tAWDMocGAwM_fOPT3Cctv6KWniw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Gwendal Grignou <gwendal@chromium.org>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 fabien.lahoudere@collabora.com, Jonathan Cameron <jic23@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [GIT PULL] Immutable branch between MFD and Cros due
 for the v5.3 merge window
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

QXMgcmVxdWVzdGVkLgoKRW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
IGExODgzMzljYTVhMzk2YWNjNTg4ZTU4NTFlZDdlMTlmNjZiMGViZDk6CgogIExpbnV4IDUuMi1y
YzEgKDIwMTktMDUtMTkgMTU6NDc6MDkgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2xlZS9tZmQuZ2l0IGliLW1mZC1jcm9zLXY1LjMKCmZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0byAzYWE2YmUzMGRhODk5NjE5YzQ0YWE2NTQzMTNiYTY2ZWI0NGU3MjkxOgoKICBt
ZmQ6IGNyb3NfZWM6IFVwZGF0ZSBJMlMgQVBJICgyMDE5LTA2LTEwIDA5OjE1OjA4ICswMTAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpJbW11dGFibGUgYnJhbmNoIGJldHdlZW4gTUZEIGFuZCBDcm9zIGR1ZSBmb3IgdGhl
IHY1LjMgbWVyZ2Ugd2luZG93CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkd3ZW5kYWwgR3JpZ25vdSAoMzApOgogICAgICBt
ZmQ6IGNyb3NfZWM6IFVwZGF0ZSBsaWNlbnNlIHRlcm0KICAgICAgbWZkOiBjcm9zX2VjOiBaZXJv
IEJVSUxEXyBtYWNybwogICAgICBtZmQ6IGNyb3NfZWM6IHNldCBjb21tZW50cyBwcm9wZXJseQog
ICAgICBtZmQ6IGNyb3NfZWM6IGFkZCBlY19hbGlnbiBtYWNyb3MKICAgICAgbWZkOiBjcm9zX2Vj
OiBEZWZpbmUgY29tbWFuZHMgYXMgNC1kaWdpdCBVUFBFUiBDQVNFIGhleCB2YWx1ZXMKICAgICAg
bWZkOiBjcm9zX2VjOiB1c2UgQklUIG1hY3JvCiAgICAgIG1mZDogY3Jvc19lYzogVXBkYXRlIEFD
UEkgaW50ZXJmYWNlIGRlZmluaXRpb24KICAgICAgbWZkOiBjcm9zX2VjOiBtb3ZlIEhETUkgQ0VD
IEFQSSBkZWZpbml0aW9uCiAgICAgIG1mZDogY3Jvc19lYzogUmVtb3ZlIHplcm8tc2l6ZSBzdHJ1
Y3RzCiAgICAgIG1mZDogY3Jvc19lYzogQWRkIEZsYXNoIFYyIGNvbW1hbmRzIEFQSQogICAgICBt
ZmQ6IGNyb3NfZWM6IEFkZCBQV01fU0VUX0RVVFkgQVBJCiAgICAgIG1mZDogY3Jvc19lYzogQWRk
IGxpZ2h0YmFyIHYyIEFQSQogICAgICBtZmQ6IGNyb3NfZWM6IEV4cGFuZCBoYXNoIEFQSQogICAg
ICBtZmQ6IGNyb3NfZWM6IEFkZCBFQyB0cmFuc3BvcnQgcHJvdG9jb2wgdjQKICAgICAgbWZkOiBj
cm9zX2VjOiBDb21wbGV0ZSBNRU1TIHNlbnNvciBBUEkKICAgICAgbWZkOiBjcm9zX2VjOiBGaXgg
ZXZlbnQgcHJvY2Vzc2luZyBBUEkKICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgZmluZ2VycHJpbnQg
QVBJCiAgICAgIG1mZDogY3Jvc19lYzogRml4IHRlbXBlcmF0dXJlIEFQSQogICAgICBtZmQ6IGNy
b3NfZWM6IENvbXBsZXRlIFBvd2VyIGFuZCBVU0IgUEQgQVBJCiAgICAgIG1mZDogY3Jvc19lYzog
QWRkIEFQSSBmb3Iga2V5Ym9hcmQgdGVzdGluZwogICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBIaWJl
cm5hdGUgQVBJCiAgICAgIG1mZDogY3Jvc19lYzogQWRkIFNtYXJ0IEJhdHRlcnkgRmlybXdhcmUg
dXBkYXRlIEFQSQogICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBJMkMgcGFzc3RocnUgcHJvdGVjdGlv
biBBUEkKICAgICAgbWZkOiBjcm9zX2VjOiBBZGQgQVBJIGZvciBFQy1FQyBjb21tdW5pY2F0aW9u
CiAgICAgIG1mZDogY3Jvc19lYzogQWRkIEFQSSBmb3IgVG91Y2hwYWQgc3VwcG9ydAogICAgICBt
ZmQ6IGNyb3NfZWM6IEFkZCBBUEkgZm9yIEZpbmdlcnByaW50IHN1cHBvcnQKICAgICAgbWZkOiBj
cm9zX2VjOiBBZGQgQVBJIGZvciByd3NpZwogICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBTS1UgSUQg
YW5kIFNlY3VyZSBzdG9yYWdlIEFQSQogICAgICBtZmQ6IGNyb3NfZWM6IEFkZCBNYW5hZ2VtZW50
IEFQSSBlbnRyeSBwb2ludHMKICAgICAgbWZkOiBjcm9zX2VjOiBVcGRhdGUgSTJTIEFQSQoKIGlu
Y2x1ZGUvbGludXgvbWZkL2Nyb3NfZWNfY29tbWFuZHMuaCB8IDM2NTggKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLQogc291bmQvc29jL2NvZGVjcy9jcm9zX2VjX2NvZGVjLmMgICAg
IHwgICAgOCArLQogMiBmaWxlcyBjaGFuZ2VkLCAyOTE1IGluc2VydGlvbnMoKyksIDc1MSBkZWxl
dGlvbnMoLSkKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2hu
aWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
