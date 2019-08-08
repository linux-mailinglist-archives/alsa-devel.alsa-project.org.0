Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE82A866E7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 18:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54ABF1612;
	Thu,  8 Aug 2019 18:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54ABF1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565281322;
	bh=J43OxdrtGak1PSErRXNGEGD2Lz+MC3BM0Kzs02Hfq8I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Glhy/XP95SB9pWmCTBz42oOZgKk7Gdjt8Awbn9Vd+IC7bfpR8vwaniLosl4BSx4AL
	 JL6iLpCEoDkvX4mCRIVaL2W9DzDlqXiWOoktTrTvxNDtPpKo0nvNM6AFlR9nXd0NIn
	 YsTC/FY/zzI0vtnEogXktsWlvedQdfY4+bZCqTb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68E72F80534;
	Thu,  8 Aug 2019 18:20:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C366CF80534; Thu,  8 Aug 2019 18:20:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74D46F800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 18:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74D46F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QmimsXUF"
Received: by mail-wm1-x341.google.com with SMTP id l2so3022494wmg.0
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 09:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1NYy6jhNv5L/j22hMt/7zGYwXYT4XYZjeIveAA57XzM=;
 b=QmimsXUFgnp+EwH0ImQpoB5uS3ZkI7FvT4yL2KLH9G9axMEZLL7ehS21TM+wpNWR1D
 QdLyOe5botiNS8o/1uOh1WQe5a3XFWbKPbnOncXMjiT8fsIpzsEAOJftnlnoADdKpIzR
 PqYe5WQTrizr3EVyaRffq4tmjHPk2qjxECNHW6lYdT5ANfyK6rYSv6hhUu4fUGP6tzbI
 SkYx2AOWEEl1ggDl/d6bVSq4aTWA75o75IIuXYGksay4QTGsKBLXgPavWW515eFBAFqQ
 6mGDs4jziP6mttXaj+FIUFDjXzh6aS2S+jzPzKtbpkQ3loe9GMeEXmlYhpo+95ipGm5S
 Zbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1NYy6jhNv5L/j22hMt/7zGYwXYT4XYZjeIveAA57XzM=;
 b=gK19xI69hYdR0TgOv52g34Z21xBJvxpl6EOn0wqJsKl4RzJDjEtPdbBQYaMxXQ8cCS
 uYyx1yonu544Wmkr7ah2vn7DqK4ULZGWdpQ/swvpICDJO5/7OMdHlPUyTYuS6AOhdf/Y
 0SvrKhbeossH//FQxu6QEyGo1ew9lKJUro15ChmBOn+Ox3fGhOCpWljLbLWa/w2bWFT/
 jiwoqIUDCyZjn6Z10riVx/3H5jA/aOitzH2XLJvI8Yt2B3IrJUBsqLeSeW100yPYSw8n
 d65vsIZLUrMemanV6yhx4yYvGkGWbAvugRSQAAoUQzP7yMDUYw3KG2VMN3Ar8dx0E3hO
 +Ryg==
X-Gm-Message-State: APjAAAWL7DbdesjH8Gp3gcuDG+KiZpjJ9yLgN/u4upNZVLm1nfigc7OX
 AgckOUw+TkjsU6Uc02+Jt3EPag==
X-Google-Smtp-Source: APXvYqzlqUyMtb48QP37+XtZ8ncJsns5sI6OoNYtFyW+My/DiEv3ApO+4HgmoJKKF8gwnz1Y/7bNuQ==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr5496582wma.34.1565281212220; 
 Thu, 08 Aug 2019 09:20:12 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t140sm6315315wmt.0.2019.08.08.09.20.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 09:20:11 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-5-srinivas.kandagatla@linaro.org>
 <3ad15652-9d6c-11e4-7cc3-0f076c6841bb@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <32516aae-8a43-6a74-c564-92dea8ff6e53@linaro.org>
Date: Thu, 8 Aug 2019 17:20:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3ad15652-9d6c-11e4-7cc3-0f076c6841bb@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 4/4] ASoC: codecs: add wsa881x amplifier
 support
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

VGhhbmtzIGZvciB0YWtpbmcgdGltZSB0byByZXZpZXcsCgpPbiAwOC8wOC8yMDE5IDE2OjE4LCBQ
aWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPj4gKy8qIDQgcG9ydHMgKi8KPj4gK3N0YXRp
YyBzdHJ1Y3Qgc2R3X2Rwbl9wcm9wIHdzYV9zaW5rX2Rwbl9wcm9wW1dTQTg4MVhfTUFYX1NXUl9Q
T1JUU10gPSB7Cj4+ICvCoMKgwqAgewo+PiArwqDCoMKgwqDCoMKgwqAgLyogREFDICovCj4+ICvC
oMKgwqDCoMKgwqDCoCAubnVtID0gMSwKPj4gK8KgwqDCoMKgwqDCoMKgIC50eXBlID0gU0RXX0RQ
Tl9TSU1QTEUsCj4gCj4gSUlSQyB3ZSBhZGRlZCB0aGUgUkVEVUNFRCB0eXBlIGluIFNvdW5kV2ly
ZSAxLjEgdG8gY292ZXIgdGhlIFBETSBjYXNlIAo+IHdpdGggY2hhbm5lbCBwYWNraW5nIChvciB3
YXMgaXQgZ3JvdXBpbmcpIHVzZWQgYnkgUXVhbGNvbW0uIEkgYW0gbm90IAo+IHN1cmUgdGhlIFNJ
TVBMRSB0eXBlIHdvcmtzPwpncm91cGluZyBJIGd1ZXNzLgoKVGhpcyBpcyBhIHNpbXBsaWZpZWQg
ZGF0YSBwb3J0IGFzIHRoZXJlIGlzIG5vIERQbl9PZmZzZXRDdHJsMiByZWdpc3RlciAKaW1wbGVt
ZW50ZWQuCgpIYXZpbmcgc2FpZCBiZWxvdyBjaGFubmVsIGNvdW50IGxvb2tzIGluY29ycmVjdCwg
aSBzaG91bGQgZml4IHRoYXQuCgo+IAo+PiArwqDCoMKgwqDCoMKgwqAgLm1pbl9jaCA9IDEsCj4+
ICvCoMKgwqDCoMKgwqDCoCAubWF4X2NoID0gOCwKPj4gK8KgwqDCoMKgwqDCoMKgIC5zaW1wbGVf
Y2hfcHJlcF9zbSA9IHRydWUsCj4+ICvCoMKgwqAgfSwgewo+PiArwqDCoMKgwqDCoMKgwqAgLyog
Q09NUCAqLwo+PiArwqDCoMKgwqDCoMKgwqAgLm51bSA9IDIsCj4+ICvCoMKgwqDCoMKgwqDCoCAu
dHlwZSA9IFNEV19EUE5fU0lNUExFLAo+PiArwqDCoMKgwqDCoMKgwqAgLm1pbl9jaCA9IDEsCj4+
ICvCoMKgwqDCoMKgwqDCoCAubWF4X2NoID0gOCwKPj4gK8KgwqDCoMKgwqDCoMKgIC5zaW1wbGVf
Y2hfcHJlcF9zbSA9IHRydWUsCj4+ICvCoMKgwqAgfSwgewo+PiArwqDCoMKgwqDCoMKgwqAgLyog
Qk9PU1QgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIC5udW0gPSAzLAo+PiArwqDCoMKgwqDCoMKgwqAg
LnR5cGUgPSBTRFdfRFBOX1NJTVBMRSwKPj4gK8KgwqDCoMKgwqDCoMKgIC5taW5fY2ggPSAxLAo+
PiArwqDCoMKgwqDCoMKgwqAgLm1heF9jaCA9IDgsCj4+ICvCoMKgwqDCoMKgwqDCoCAuc2ltcGxl
X2NoX3ByZXBfc20gPSB0cnVlLAo+PiArwqDCoMKgIH0sIHsKPj4gK8KgwqDCoMKgwqDCoMKgIC8q
IFZJU0VOU0UgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIC5udW0gPSA0LAo+PiArwqDCoMKgwqDCoMKg
wqAgLnR5cGUgPSBTRFdfRFBOX1NJTVBMRSwKPj4gK8KgwqDCoMKgwqDCoMKgIC5taW5fY2ggPSAx
LAo+PiArwqDCoMKgwqDCoMKgwqAgLm1heF9jaCA9IDgsCj4+ICvCoMKgwqDCoMKgwqDCoCAuc2lt
cGxlX2NoX3ByZXBfc20gPSB0cnVlLAo+PiArwqDCoMKgIH0KPj4gK307Cj4gCj4+ICtzdGF0aWMg
aW50IHdzYTg4MXhfdXBkYXRlX3N0YXR1cyhzdHJ1Y3Qgc2R3X3NsYXZlICpzbGF2ZSwKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0gc2R3X3NsYXZlX3N0YXR1cyBzdGF0
dXMpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHdzYTg4MXhfcHJpdiAqd3NhODgxeCA9IGRldl9n
ZXRfZHJ2ZGF0YSgmc2xhdmUtPmRldik7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoc3RhdHVzID09IFNE
V19TTEFWRV9BVFRBQ0hFRCkgewo+IAo+IHRoZXJlIGlzIGFuIGFtYmlndWl0eSBoZXJlLCB0aGUg
U2xhdmUgY2FuIGJlIGF0dGFjaGVkIGJ1dCBhcyBkZXZpY2UwIAo+IChub3QgZW51bWVyYXRlZCku
IFdlIHNob3VsZCBjaGVjayBkZXZfbnVtID4gMAo+IApUaGFua3MgZm9yIHBvaW50IHRoYXQhIHdp
bGwgYWRkIGEgY2hlY2shCgo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCF3c2E4ODF4LT5yZWdtYXAp
IHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3NhODgxeC0+cmVnbWFwID0gZGV2bV9yZWdt
YXBfaW5pdF9zZHcoc2xhdmUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJndzYTg4MXhfcmVnbWFwX2NvbmZpZyk7Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIod3NhODgxeC0+cmVnbWFwKSkgewo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoJnNsYXZlLT5kZXYsICJyZWdt
YXBfaW5pdCBmYWlsZWRcbiIpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBQVFJfRVJSKHdzYTg4MXgtPnJlZ21hcCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0KPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHNu
ZF9zb2NfcmVnaXN0ZXJfY29tcG9uZW50KCZzbGF2ZS0+ZGV2LAo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJndzYTg4MXhfY29tcG9uZW50X2Ry
diwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IE5VTEwsIDApOwo+PiArwqDCoMKgIH0gZWxzZSBpZiAoc3RhdHVzID09IFNEV19TTEFWRV9VTkFU
VEFDSEVEKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzbmRfc29jX3VucmVnaXN0ZXJfY29tcG9uZW50
KCZzbGF2ZS0+ZGV2KTsKPiAKPiB0aGUgdXBkYXRlX3N0YXR1cygpIGlzIHN1cHBvc2VkIHRvIGJl
IGNhbGxlZCBiYXNlZCBvbiBidXMgZXZlbnRzLCBpdCdkIAo+IGJlIHZlcnkgb2RkIHRvIHJlZ2lz
dGVyL3VucmVnaXN0ZXIgdGhlIGNvbXBvbmVudCBpdHNlbGYgZHluYW1pY2FsbHkuIEluIAo+IG91
ciBleGlzdGluZyBSZWFsdGVrLWJhc2VkIHNvbHV0aW9ucyB0aGUgcmVnaXN0ZXJfY29tcG9uZW50
KCkgaXMgY2FsbGVkIAo+IGluIHRoZSBwcm9iZSBmdW5jdGlvbiAoYW5kIHVucmVnaXN0ZXJfY29t
cG9uZW50KCkgaW4gcmVtb3ZlKS4gV2UgZG8gdGhlIAo+IGluaXRzIHdoZW4gdGhlIFNsYXZlIGJl
Y29tZXMgYXR0YWNoZWQgYnV0IHRoZSBjb21wb25lbnQgaXMgYWxyZWFkeSAKPiByZWdpc3RlcmVk
Lgo+IApsb29rcyBsZXNzIGludHJ1c2l2ZSEgIEkgd2lsbCBnaXZlIHRoYXQgYSB0cnkhCgo+PiAr
wqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArCj4+ICsKPj4gK3N0
YXRpYyBpbnQgd3NhODgxeF9yZW1vdmUoc3RydWN0IHNkd19zbGF2ZSAqc2R3KQo+PiArewo+PiAr
wqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNkd19k
ZXZpY2VfaWQgd3NhODgxeF9zbGF2ZV9pZFtdID0gewo+PiArwqDCoMKgIFNEV19TTEFWRV9FTlRS
WSgweDAyMTcsIDB4MjAxMCwgMCksCj4+ICvCoMKgwqAge30sCj4+ICt9Owo+PiArTU9EVUxFX0RF
VklDRV9UQUJMRShzZHcsIHdzYTg4MXhfc2xhdmVfaWQpOwo+PiArCj4+ICtzdGF0aWMgc3RydWN0
IHNkd19kcml2ZXIgd3NhODgxeF9jb2RlY19kcml2ZXIgPSB7Cj4+ICvCoMKgwqAgLnByb2JlwqDC
oMKgID0gd3NhODgxeF9wcm9iZSwKPj4gK8KgwqDCoCAucmVtb3ZlID0gd3NhODgxeF9yZW1vdmUs
Cj4gCj4gaXMgdGhpcyBuZWVkZWQgc2luY2UgeW91IGRvIG5vdGhpbmcgaW4gdGhhdCBmdW5jdGlv
bj8KCnllcywgaXQgY2FuIGJlIHJlbW92ZWQhIHdpbGwgZG8gdGhhdCBpbiBuZXh0IHZlcnNpb24u
CgotLXNyaW5pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
