Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0638F55E01
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 03:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 687DA1663;
	Wed, 26 Jun 2019 03:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 687DA1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561514181;
	bh=FCOqNjIOOgBoi5U5hVOyjFADEpDD865njIQImf5pwD0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=byYwPTF5MWeX/n9rjvwbnjL4sdmSsN+37Dsgb2k+D26h+2ntt2o8rW5BhcgDRMYgI
	 T1rV7l9/2CDFdGrlZ5iINQ/u88WKV98+5Q4PKpO/072nRTOx1TJewgeEvN7Zt61nn8
	 2eFJPjtvF3bUPyVbB2d6bjK0cwQCYSB/t3MwT1Yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0A71F896CC;
	Wed, 26 Jun 2019 03:54:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0575AF896B9; Wed, 26 Jun 2019 03:54:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57F10F8070C
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 03:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57F10F8070C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eJ7JU99E"
Received: by mail-lj1-x242.google.com with SMTP id i21so461729ljj.3
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 18:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z6VBucdKxKHrVhZM6PcmyKrMoCL4LfIzgNE/Pfs7Mx8=;
 b=eJ7JU99EbhjX4WAgvwzVmAP8i1dAxKxB7gEOB9j27N0/0fj6QQSxBG0cv2ssINi+ME
 AfCO7cW7oUtUPep+OjkdldB7ctNfdFMaFXEVtgUmmWleJpFayMu9aYH4wFEnBsXTKIDK
 +21UpwcM/qxCj/eXdxri0+HhL9ILDaMSNsyFwki5RtctwyYfY0ZOE/4mD7irys60Vsz8
 8XlVI9tyDJq42L+ifhdFsKev4e6q3yugc+mi7uuA3wLdrZcrw62naFsArERgArsn/sb+
 gihLhg/qjFtem0VAkeAaOLdBdTetYiBL9BlMeShHOyZ5jsweNrbhBS3A3JhR3iFGvmhw
 aJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z6VBucdKxKHrVhZM6PcmyKrMoCL4LfIzgNE/Pfs7Mx8=;
 b=K/4IeYNKAuw0xzkW9HTjBMUp5aoK4RJF7DvQJRcpvPG1ty22YnlC3YLgS1ngWHez2Y
 HWd3BBbnN5QxAJa0WypZNa1jY4I3Csn8ZUNMA15+5q6TTwRnCnCk6G32CQb0tOFzCX4L
 2/0hlcT6T7CBvGbZ7bUdiDY+3gKnIgD763jvN+iNDHY+NIDMs09ewhTcX1PogPTeIpQ6
 srwdQwqwJS3BUewhEFslMJvRKgd0kHhLyz62pqoXHR41cR+vYLUyNgzRtJRA5bStk456
 uDI71NRsuXFGzLm4Gjkz3cnsj8RBEk2PAAbNjNh2umyNq4+L5+FZIKAkEZhunVeBs+gc
 CWuQ==
X-Gm-Message-State: APjAAAUKtM6YnLqYZ+0C3Dsii3ReERi4IL6s8D+MakK3RLhkAYI7kSTk
 Wfej6lxR1g8/EAQis5sdN+M=
X-Google-Smtp-Source: APXvYqzCQrEk2rp9lnn+wcIqMON/h7Slh8Fg3hT+QJpgd3RQOYQdP/xeEtOHvZ0FLPyw6AEFp6qvnw==
X-Received: by 2002:a2e:85d4:: with SMTP id h20mr964418ljj.142.1561514070167; 
 Tue, 25 Jun 2019 18:54:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru.
 [91.79.162.197])
 by smtp.googlemail.com with ESMTPSA id y10sm2164862lfb.28.2019.06.25.18.54.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 18:54:29 -0700 (PDT)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>
References: <878stpyvky.wl-kuninori.morimoto.gx@renesas.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8291b20f-8926-8089-0507-36b8b1025b35@gmail.com>
Date: Wed, 26 Jun 2019 04:54:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <878stpyvky.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: don't use
 soc_find_component() at snd_soc_find_dai()
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

MjYuMDYuMjAxOSA0OjQwLCBLdW5pbm9yaSBNb3JpbW90byDQv9C40YjQtdGCOgo+IEZyb206IEt1
bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KPiAKPiBj
b21taXQgYjlmMmUyNWM1OTliYiAoIkFTb0M6IHNvYy1jb3JlOiB1c2Ugc29jX2ZpbmRfY29tcG9u
ZW50KCkgYXQKPiBzbmRfc29jX2ZpbmRfZGFpKCkiKSB1c2VkIHNvY19maW5kX2NvbXBvbmVudCgp
IGF0IHNuZF9zb2NfZmluZF9kYWkoKSwKPiBidXQsIHNvbWUgQ1BVIGRyaXZlciBoYXMgQ1BVIGNv
bXBvbmVudCBmb3IgREFJIGFuZCBQbGF0Zm9ybSBjb21wb25lbnQsCj4gZm9yIGV4YW1wbGUgZ2Vu
ZXJpYyBETUFFbmdpbmUgY29tcG9uZW50Lgo+IEluIHN1Y2ggY2FzZSwgQ1BVIGNvbXBvbmVudCBh
bmQgUGxhdGZvcm0gY29tcG9uZW50IGhhdmUgc2FtZQo+IG9mX25vZGUgLyBuYW1lLgo+IAo+IEhl
cmUgc29jX2ZpbmRfY29tcG9uZW50KCkgcmV0dXJucyAqMXN0KiBmb3VuZCBjb21wb25lbnQuCj4g
VGh1cywgd2Ugc2hvdWxkbid0IHVzZSBzb2NfZmluZF9jb21wb25lbnQoKSBhdCBzbmRfc29jX2Zp
bmRfZGFpKCkuCj4gVGhpcyBwYXRjaCBmaXh1cCB0aGlzIGl0LCBhbmQgYWRkIGNvbW1lbnQgdG8g
aW5kaWNhdGUgdGhpcyBsaW1pdGF0aW9uLgo+IAo+IEZpeGVzOiBjb21taXQgYjlmMmUyNWM1OTli
YiAoIkFTb0M6IHNvYy1jb3JlOiB1c2Ugc29jX2ZpbmRfY29tcG9uZW50KCkgYXQgc25kX3NvY19m
aW5kX2RhaSgpIikKPiBSZXBvcnRlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwu
Y29tPgo+IFJlcG9ydGVkLWJ5OiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBLdW5pbm9yaSBNb3JpbW90byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVu
ZXNhcy5jb20+Cj4gLS0tCj4gIHNvdW5kL3NvYy9zb2MtY29yZS5jIHwgMTMgKysrKysrKysrKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvYy1jb3JlLmMgYi9zb3VuZC9zb2Mvc29jLWNvcmUu
Ywo+IGluZGV4IDM1OGYxZmIuLjhjY2FmNjMgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL3NvYy1j
b3JlLmMKPiArKysgYi9zb3VuZC9zb2Mvc29jLWNvcmUuYwo+IEBAIC03ODYsNiArNzg2LDE0IEBA
IHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKnNvY19maW5kX2NvbXBvbmVudCgKPiAg
Cj4gIAlsb2NrZGVwX2Fzc2VydF9oZWxkKCZjbGllbnRfbXV0ZXgpOwo+ICAKPiArCS8qCj4gKwkg
KiBOT1RFCj4gKwkgKgo+ICsJICogSXQgcmV0dXJucyAqMXN0KiBmb3VuZCBjb21wb25lbnQsIGJ1
dCBzb21lIGRyaXZlcgo+ICsJICogaGFzIGZldyBjb21wb25lbnRzIGJ5IHNhbWUgb2Zfbm9kZS9u
YW1lCj4gKwkgKiBleCkKPiArCSAqCUNQVSBjb21wb25lbnQgYW5kIGdlbmVyaWMgRE1BRW5naW5l
IGNvbXBvbmVudAo+ICsJICovCj4gIAlmb3JfZWFjaF9jb21wb25lbnQoY29tcG9uZW50KQo+ICAJ
CWlmIChzbmRfc29jX2lzX21hdGNoaW5nX2NvbXBvbmVudChkbGMsIGNvbXBvbmVudCkpCj4gIAkJ
CXJldHVybiBjb21wb25lbnQ7Cj4gQEAgLTgxMyw4ICs4MjEsOSBAQCBzdHJ1Y3Qgc25kX3NvY19k
YWkgKnNuZF9zb2NfZmluZF9kYWkoCj4gIAlsb2NrZGVwX2Fzc2VydF9oZWxkKCZjbGllbnRfbXV0
ZXgpOwo+ICAKPiAgCS8qIEZpbmQgQ1BVIERBSSBmcm9tIHJlZ2lzdGVyZWQgREFJcyAqLwo+IC0J
Y29tcG9uZW50ID0gc29jX2ZpbmRfY29tcG9uZW50KGRsYyk7Cj4gLQlpZiAoY29tcG9uZW50KSB7
Cj4gKwlmb3JfZWFjaF9jb21wb25lbnQoY29tcG9uZW50KSB7Cj4gKwkJaWYgKCFzbmRfc29jX2lz
X21hdGNoaW5nX2NvbXBvbmVudChkbGMsIGNvbXBvbmVudCkpCj4gKwkJCWNvbnRpbnVlOwo+ICAJ
CWZvcl9lYWNoX2NvbXBvbmVudF9kYWlzKGNvbXBvbmVudCwgZGFpKSB7Cj4gIAkJCWlmIChkbGMt
PmRhaV9uYW1lICYmIHN0cmNtcChkYWktPm5hbWUsIGRsYy0+ZGFpX25hbWUpCj4gIAkJCSAgICAm
JiAoIWRhaS0+ZHJpdmVyLT5uYW1lCj4gCgpUaGFuayB5b3UgdmVyeSBtdWNoIQoKVGVzdGVkLWJ5
OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
