Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1588114C3E3
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 01:19:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7B3A1665;
	Wed, 29 Jan 2020 01:18:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7B3A1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580257186;
	bh=hHTSrU16mpIs+mVmAwz2Tpw/sF/+/sfYSJHhzG5T/NI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DRdcyzvouiDQHZBRWk7b5oI1H8RqLS09Pw4vdw6lnBHPmS0v9qTa3lFhpZ70/mhlx
	 Pe2HBXEMG87bzbW4kPd4VMuO62SFZ/pbdTN4Cqa2yLoTXXPjySFekwtj4Ars8zjcMn
	 QHu/eXS9qzlsFTGZrz0S6sfwlKRvK5QxaPfkZgUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8EF5F80082;
	Wed, 29 Jan 2020 01:18:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86521F80150; Wed, 29 Jan 2020 01:18:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34938F80082
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 01:18:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34938F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cYeQlxKi"
Received: by mail-lj1-x242.google.com with SMTP id a13so16567638ljm.10
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 16:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YlgM9WZEZDdUs9qVD2FtzJ2n5fMFAKgcgxkNOPf+r3o=;
 b=cYeQlxKij/EYciFyZ2eVgWc7UcfCT5Hftve9Bn429wK6LfhSqhINprvyR406PmDrmb
 xOprsB3Dll0liXDPBDT7BWJahwh55TIuLntwbBoRY7RcXLlnzlUF8BPrv8ds7iQ3Zv95
 Ln/ZJIA+6Mq6sk1RIe6yy8ee+mu/eta6bl2ZNiieojocxbAf//g3ABe8Mm+XCy4qnR9X
 QGjnLjC6granoIrH0NuspheaP1+4L5pVJtuUEP+oUkZUaTvleqOuGgETJtlK9Aoxovcj
 V6F4wi4GobE5/CzFBzapsAUDoH6va+8wfXanK5b4ueA93suxSMqPWlNSwclRv2i5gI6c
 MaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YlgM9WZEZDdUs9qVD2FtzJ2n5fMFAKgcgxkNOPf+r3o=;
 b=Pi/MD2DPLtPEoKKhfjZgMVQ1cLP5a7r4Tx6i6qzGsDVlS4z08DS3wrbVUAeMbSvtv7
 7WV+MqbxyDqaXcNiDOWtPl+ncVhtUGn8zaQRpr6aVzARAPJTYd14FB58AFd/pfNr1u1W
 bU+tMHqE+KR1p4jZupEkBYftnNLlvd6CeBLpKLBK1xiaBctvdGX2egAGwONtO1KSRE1x
 Y+jQ9iJy1Kuqsm9v9qoQCDk8K5KEj/FFxXsEj+DUC6Yoq6JrPbEr7wM51Ra0lCNMTRjL
 IHqsEPRcZwS5togMozMhEN0G4Toi9lDk967+cZhLB4m+TgNGx0WCMOYKBetyvH7mFWh6
 O53A==
X-Gm-Message-State: APjAAAVa+5vIBesh1kuGn6vcBfpYJ/1bsEif3052l0PjS0upeCvVOakf
 xr3gdbigqaYX4h7A/z9ME0A=
X-Google-Smtp-Source: APXvYqyPrTRX37Z80j56HOEMPR3REwtI7reHbOy3u8Ry3Yq2ZOQnYCRkIhPUdiubDgVvvDSWJ8BwHw==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr14366306lja.231.1580257080080; 
 Tue, 28 Jan 2020 16:18:00 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id m13sm134471lfo.40.2020.01.28.16.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 16:17:59 -0800 (PST)
To: Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>
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
 <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
 <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ff97414-f0a5-7224-0e53-6cad2ed0ccd2@gmail.com>
Date: Wed, 29 Jan 2020 03:17:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
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

MjguMDEuMjAyMCAyMToxOSwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDI4LzAxLzIw
MjAgMTc6NDIsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMjguMDEuMjAyMCAxNToxMywgTWFy
ayBCcm93biDQv9C40YjQtdGCOgo+Pj4gT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMTA6MjA6MjVQ
TSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+IDI0LjAxLjIwMjAgMTk6NTAsIEpv
biBIdW50ZXIg0L/QuNGI0LXRgjoKPj4+Cj4+Pj4+ICAgICAgICAgICAgICAgICAucmF0ZXMgPSBT
TkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAo+Pj4+PiAgICAgICAgICAgICAgICAgLmZvcm1hdHMg
PSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgU05EUlZfUENNX0ZNVEJJVF9TMjRfM0xFIHwKPj4+Cj4+Pj4gSXQgc2hvdWxkIHNvbHZl
IHRoZSBwcm9ibGVtIGluIG15IHBhcnRpY3VsYXIgY2FzZSwgYnV0IEknbSBub3Qgc3VyZSB0aGF0
Cj4+Pj4gdGhlIHNvbHV0aW9uIGlzIGNvcnJlY3QuCj4+Pgo+Pj4gSWYgdGhlIGZvcm1hdCBpbXBs
ZW1lbnRlZCBieSB0aGUgZHJpdmVyIGlzIFMyNF8zTEUgdGhlIGRyaXZlciBzaG91bGQKPj4+IGFk
dmVydGlzZSBTMjRfM0xFLgo+Pgo+PiBJdCBzaG91bGQgYmUgUzI0X0xFLCBidXQgc2VlbXMgd2Ug
c3RpbGwgZG9uJ3Qga25vdyBmb3Igc3VyZS4KPiAKPiBXaHk/Ci9JIHRoaW5rLyBzb3VuZCBzaG91
bGQgYmUgbXVjaCBtb3JlIGRpc3RvcnRlZCBpZiBpdCB3YXMgUzI0XzNMRSwgYnV0Cm1heWJlIEkn
bSB3cm9uZy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
