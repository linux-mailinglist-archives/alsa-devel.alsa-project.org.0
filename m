Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47114BED1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 18:44:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99C8B166C;
	Tue, 28 Jan 2020 18:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99C8B166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580233478;
	bh=Jd4jqvIFMMLRJmYD2AhyfbwBW7vpwreAiEczfk69WtU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bsirGLvKhtg1Bf7bz1cIYJ0dqwW+4UYgLGX2KN78Zqjl/MIXYAhEyWmcZVUIH2wtO
	 W0hlaj5REnI6O3nhuIo3bNTVTCkXf/G6LNfqT4O19afN5C11xOxNa9oE6noXRhAiQ3
	 O3NoyNToD/nBnwqeTIK3SiJYkgg9QRX8X9rPbLRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CB53F80082;
	Tue, 28 Jan 2020 18:42:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29BA6F80150; Tue, 28 Jan 2020 18:42:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47DB4F80123
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 18:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47DB4F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Tpgv1oHC"
Received: by mail-lj1-x241.google.com with SMTP id f25so2718027ljg.12
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hJoKIthAQFgZ7VR2m6M6xS8oQ/leqVcDe3VXNddw08E=;
 b=Tpgv1oHC5fsFg38MGKhsMLe2NCpsEnmpQIhN8yMYDthBd1rlr4s7CzBSetMdZpdTCo
 oouNzsNas9HCdMpmfquipE7uaqZg+8zFXJYv0cAqpDxOuTsq5IkpUCTJ1D8oMvyBrqri
 x6T26ghLW7GgXqsD/zCx9q1rvA2DbVGx7L9qiRnG4E6lkdq1Glytx8VAzs/A1pAl2dLw
 pjg2rw1nTOdrqNHPYAvyiFoCO45A/QFvfxFKX3GrsOh7doA0nu50l27nVR10vvwf+Woz
 ouxslrwu0RuGfS/TjlvCWmbC/FhJeX9d834GZ3Ys9Vm8XTK24PLTDoPXM0Vh2e54debO
 C+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hJoKIthAQFgZ7VR2m6M6xS8oQ/leqVcDe3VXNddw08E=;
 b=a5mLiUiFo1v9S7ie8VYQWL2KFrW26pTM2PQfiL4r4mcEN9fEqWHCvtmpKrE+tZBy8B
 E8kYoPsExIfZYOFFiByqXxSq1IWN8BD+bKTSBrBu07+vQ9o1kmMqkG379Qm5YAe16Sun
 xaXJ/ijtYwCh0GF1/35yuoAyZcu4EujmV5X7WZuEomJMsCITt1xz6bNszEkMuXJA0eWB
 R6pwmTAPHSGIej9ujfCI6TzL2/GBwL4xKnQlLKU4yVuuo6zZeEmZ83RHO7hIAIpFsXJJ
 QuhFIctWyrify4ZJONblePdAXEBpsjxxmeyMD20Z9vetURqd7dnZHWrKF/EX1tvoiHIv
 IzOg==
X-Gm-Message-State: APjAAAUCsl63EuuQBskfYLsmWMiTRpxRDojYGXzHBNPSXiSYLDllKwjX
 yvm4lenOeg99p/wvbCQ9Bws=
X-Google-Smtp-Source: APXvYqyu2ANQ51DyRAxl3hdd6sedoyacUos5bCBdEnZzcwVoSWTByw15S6I7Z2+SlhHytv14NvEF8Q==
X-Received: by 2002:a2e:7c08:: with SMTP id x8mr13801161ljc.185.1580233367895; 
 Tue, 28 Jan 2020 09:42:47 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id f29sm4724370ljo.76.2020.01.28.09.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 09:42:47 -0800 (PST)
To: Mark Brown <broonie@kernel.org>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
Date: Tue, 28 Jan 2020 20:42:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200128121315.GD4689@sirena.org.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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

MjguMDEuMjAyMCAxNToxMywgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIE1vbiwgSmFuIDI3
LCAyMDIwIGF0IDEwOjIwOjI1UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMjQu
MDEuMjAyMCAxOTo1MCwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+Pj4gICAgICAgICAgICAg
ICAgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAsCj4+PiAgICAgICAgICAgICAg
ICAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF8zTEUgfAo+IAo+PiBJdCBzaG91bGQg
c29sdmUgdGhlIHByb2JsZW0gaW4gbXkgcGFydGljdWxhciBjYXNlLCBidXQgSSdtIG5vdCBzdXJl
IHRoYXQKPj4gdGhlIHNvbHV0aW9uIGlzIGNvcnJlY3QuCj4gCj4gSWYgdGhlIGZvcm1hdCBpbXBs
ZW1lbnRlZCBieSB0aGUgZHJpdmVyIGlzIFMyNF8zTEUgdGhlIGRyaXZlciBzaG91bGQKPiBhZHZl
cnRpc2UgUzI0XzNMRS4KCkl0IHNob3VsZCBiZSBTMjRfTEUsIGJ1dCBzZWVtcyB3ZSBzdGlsbCBk
b24ndCBrbm93IGZvciBzdXJlLgoKPj4gVGhlIHY1LjUga2VybmVsIGlzIHJlbGVhc2VkIG5vdyB3
aXRoIHRoZSBicm9rZW4gYXVkaW8gYW5kIGFwcGFyZW50bHkKPj4gZ2V0dGluZyAyNGJpdCB0byB3
b3JrIHdvbid0IGJlIHRyaXZpYWwgKGlmIHBvc3NpYmxlIGF0IGFsbCkuIEJlbiwgY291bGQKPj4g
eW91IHBsZWFzZSBzZW5kIGEgcGF0Y2ggdG8gZml4IHY1LjUgYnkgcmVtb3ZpbmcgdGhlIFMyNCBz
dXBwb3J0Cj4+IGFkdmVydGlzZW1lbnQgZnJvbSB0aGUgZHJpdmVyPwo+IAo+IFdoeSBpcyB0aGF0
IHRoZSBiZXN0IGZpeCByYXRoZXIgdGhhbiBqdXN0IGFkdmVydGlzaW5nIHRoZSBmb3JtYXQKPiBp
bXBsZW1lbnRlZCBieSB0aGUgZHJpdmVyPwoKVGhlIGN1cnJlbnRseSBzdXBwb3J0ZWQgZm9ybWF0
IHRoYXQgaXMga25vd24gdG8gd29yayB3ZWxsIGlzIFMxNl9MRS4KCkknbSBzdWdnZXN0aW5nIHRv
IGRyb3AgdGhlIFMyNF9MRSBhbmQgUzMyX0xFIHRoYXQgd2VyZSBhZGRlZCBieSB0aGUKYXBwbGll
ZCBwYXRjaGVzIHNpbXBseSBiZWNhdXNlIHRoaXMgc2VyaWVzIHdhc24ndCB0ZXN0ZWQgcHJvcGVy
bHkgYmVmb3JlCml0IHdhcyBzZW50IG91dCBhbmQgdHVybmVkIG91dCB0aGF0IGl0IGRvZXNuJ3Qg
d29yayB3ZWxsLgoKPiBJIHJlYWxseSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGlzIGlzIGFsbCB0
YWtpbmcgc28gbG9uZywgdGhpcyB0aHJlYWQKPiBqdXN0IHNlZW1zIHRvIGJlIGdvaW5nIHJvdW5k
IGluIGludGVybWluYWJsZSBjaXJjbGVzIGxvbmcgYWZ0ZXIgaXQKPiBsb29rZWQgbGlrZSB0aGUg
aXNzdWUgd2FzIHVuZGVyc3Rvb2QuICBJIGhhdmUgdG8gYWRtaXQgSSd2ZSBub3QgcmVhZAo+IGV2
ZXJ5IHNpbmdsZSBtZXNzYWdlIGluIHRoZSB0aHJlYWQgYnV0IGl0J3MgZGlmZmljdWx0IHRvIHNl
ZSB3aHkgaXQKPiBkb2Vzbid0IHNlZW0gdG8gYmUgbWFraW5nIGFueSBwcm9ncmVzcy4KCkJlbiB3
YXMgdHJ5aW5nIHRvIG1ha2UgYSBmaXggZm9yIHRoZSBpbnRyb2R1Y2VkIHByb2JsZW0sIGJ1dCBp
dCdzIG5vdAplYXN5IGFzIHdlIHNlZSBub3cuCgpQZXJoYXBzIHRoZSBiZXN0IHNvbHV0aW9uIHNo
b3VsZCBiZSB0byByZXZlcnQgYWxsIG9mIHRoZSB0aHJlZSBhcHBsaWVkCnBhdGNoZXMgYW5kIHRy
eSBhZ2FpbiBsYXRlciBvbiwgb25jZSBhbGwgY3VycmVudCBwcm9ibGVtcyB3aWxsIGJlIHJlc29s
dmVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
