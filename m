Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9DD14EFD5
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 16:40:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99178167A;
	Fri, 31 Jan 2020 16:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99178167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580485250;
	bh=252iMRuw9Vilu/QB/2mQWdlAHtvxyfpuvlC61NkyxBU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlvrvVugcv0ylbt0aNPB5iIJc1CXzq5AIDvYSfBm2dbsFn9TqfLf6Y6bl2w1Hxs3b
	 Brgfkfj5P9SDH8+ZGxD8tHTPPtYBrkYt+12ktndKv1sGZet5nyyr2I0kagxWow9tQT
	 8EBz71AMGMr68xbtZVt3JAOi/I0RYXFuDgzxRSIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E050F80218;
	Fri, 31 Jan 2020 16:39:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8DFBF8021E; Fri, 31 Jan 2020 16:39:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFD06F80082
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 16:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFD06F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HY2h8qXH"
Received: by mail-lj1-x241.google.com with SMTP id v17so7551137ljg.4
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 07:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9NPQscGNoa4QIXz4hQhsZPNEmWteEQEWE2lnF9zwH24=;
 b=HY2h8qXHR+65tHbLBV9R4c9tHZBR6GbAHVfWKrQFLM/T5OcNZzujzh4h7wyxaLOZSw
 DtPJLapCShNv4r6pa6VPaHjq51f/tLFeFcRtJ7NcTLclpzwfOBa94vMHQl6Y5HO/NLp+
 Oq9rxnOfqpbInouIdupaA9abu/BKodBdajs8+MsBsiJX6/Xy2p9io6kvVneyr7jDueG0
 NB4JE12KytkZznQWOAresZeeo5efZmvuSvEBZRaTTEL6tVJEFat8x8y5kTMwsTAw1Qh3
 JNAXjXVQdajYbUuRbidVUTXYzt1Lmf/EGuut289IrEL/xvNuCBOaUcneJTBJ65yFVeR/
 1Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9NPQscGNoa4QIXz4hQhsZPNEmWteEQEWE2lnF9zwH24=;
 b=dNj4VAbB6MdsTJsbh3820Q5AhBf+Nct1d0cSyBiR6pnaQ4hseFs7w7zDrV/0NxDrQ5
 Sbv0C8g7i5haCK3i/QB7YLYynfTFzOgB5CmIAHofbbKczhryculuvaBAIDjxmkgoWsAg
 3ImxFFSWGDxGS4XOPETV+QRuJmogGLzw4jWJ+DH+xWM0vqz9o8ojdMkKlFMp2VN7frsC
 39Tob1zMXcv6/+fOgNYYqAGfIs7RZ6aT9VIeQPsEc+1HxX1MmtbD2CrlO+Jil02UhR4N
 RwsVwhHSQfhVQVHUjmrTw4Brnyef3g7SLeDIE5GIN2M3jvXVv+Tgd+pYsb8d1XedrEpo
 s7rA==
X-Gm-Message-State: APjAAAVTl9a+qP+NxPAETBvLmyNmZdHpRGz5853U8RvCvqGXPGSGMuKM
 SLqXl0eMskw9GTPpCONp6Gk=
X-Google-Smtp-Source: APXvYqxQpZSCnRWgO07QQjTkLnxT1f+sOw6/HeSxPP+VGu4ipK/vezwcHwADfcg1x2dJ2mXLXhKwOA==
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr6362924ljk.201.1580485137587; 
 Fri, 31 Jan 2020 07:38:57 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id a10sm4761180lfr.94.2020.01.31.07.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 07:38:57 -0800 (PST)
To: Jon Hunter <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>
References: <20200131091901.13014-1-jonathanh@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2bb53d7d-2d36-e16e-5858-24360b19f936@gmail.com>
Date: Fri, 31 Jan 2020 18:38:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200131091901.13014-1-jonathanh@nvidia.com>
Content-Language: en-US
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] Revert "ASoC: tegra: Allow 24bit and 32bit
	samples"
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

MzEuMDEuMjAyMCAxMjoxOSwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IENvbW1pdCBmM2VlOTkw
ODdjOGNhMGVjZmRkNTQ5ZWY1YTk0ZjU1N2M0MmQ1NDI4ICgiQVNvQzogdGVncmE6IEFsbG93Cj4g
MjRiaXQgYW5kIDMyYml0IHNhbXBsZXMiKSBhZGRlZCAyNC1iaXQgYW5kIDMyLWJpdCBzdXBwb3J0
IGZvciB0byB0aGUKPiBUZWdyYTMwIEkyUyBkcml2ZXIuIEhvd2V2ZXIsIHRoZXJlIGFyZSB0d28g
YWRkaXRpb25hbCBjb21taXRzIHRoYXQgYXJlCj4gYWxzbyBuZWVkZWQgdG8gZ2V0IDI0LWJpdCBh
bmQgMzItYml0IHN1cHBvcnQgdG8gd29yayBjb3JyZWN0bHkuIFRoZXNlCj4gY29tbWl0cyBhcmUg
bm90IHlldCBhcHBsaWVkIGJlY2F1c2UgdGhlcmUgYXJlIHN0aWxsIHNvbWUgcmV2aWV3IGNvbW1l
bnRzCj4gdGhhdCBuZWVkIHRvIGJlIGFkZHJlc3NlZC4gV2l0aCBvbmx5IHRoaXMgY2hhbmdlIGFw
cGxpZWQsIDI0LWJpdCBhbmQKPiAzMi1iaXQgc3VwcG9ydCBpcyBhZHZlcnRpc2VkIGJ5IHRoZSBJ
MlMgZHJpdmVyLCBidXQgaXQgZG9lcyBub3Qgd29yayBhbmQKPiB0aGUgYXVkaW8gaXMgZGlzdG9y
dGVkLiBUaGVyZWZvcmUsIHJldmVydCB0aGlzIHBhdGNoIGZvciBub3cgdW50aWwgdGhlCj4gb3Ro
ZXIgY2hhbmdlcyBhcmUgYWxzbyByZWFkeS4KPiAKPiBGdXJ0aGVybW9yZSwgYSBjbG9jayBpc3N1
ZSB3aXRoIDI0LWJpdCBzdXBwb3J0IGhhcyBiZWVuIGlkZW50aWZpZWQgd2l0aAo+IHRoaXMgY2hh
bmdlIGFuZCBzbyBpZiB3ZSByZXZlcnQgdGhpcyBub3csIHdlIGNhbiBhbHNvIGZpeCB0aGF0IGlu
IHRoZQo+IHVwZGF0ZWQgdmVyc2lvbi4KPiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
IAo+IFJlcG9ydGVkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+Cj4gLS0tCgpUaGFu
a3MsIEpvbiEKClRlc3RlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgoK
QmVuLCBsb29raW5nIGZvcndhcmQgdG8gaGF2ZSAyNGJpdCB3b3JraW5nIGluIDUuNyA6KQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
