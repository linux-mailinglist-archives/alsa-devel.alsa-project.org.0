Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA807131D4D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 02:41:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9FB1809;
	Tue,  7 Jan 2020 02:40:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9FB1809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578361307;
	bh=vLucLSnjIUFqlQCq9jw+YIjXC7zDxoMXSQ7MiKDJMBc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J4rMMFSYieDZBFjrTNAzPPZ/7Zm58tDSvvPPH7sJzwJRU12uKH2NN3HxnunXZ3One
	 +WBU0ipQ5Jxc4/bToHrbFmC+IssE/KhS/WPWi0Y0IOwHu0eChaMNx3Sm3QM9Xj51L8
	 82YatBYNVisT/jk8Mgkcq05A9HsHLc2tUktD1Fjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA048F801ED;
	Tue,  7 Jan 2020 02:40:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B04EF80159; Tue,  7 Jan 2020 02:40:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 431A3F80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 02:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 431A3F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HEHOaba8"
Received: by mail-lf1-x143.google.com with SMTP id n12so37694583lfe.3
 for <alsa-devel@alsa-project.org>; Mon, 06 Jan 2020 17:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lxnvfp5VC343XHHg909SUXIQiaU3FYHnyesY0NbV52s=;
 b=HEHOaba85kHY2JfMsANHNhKcLo+c9w513es3pIkRwEqTNARv097eQqmvaKoRWI61ow
 FS4QegglU7KBNst4ZuWZY68Ri+mzUOAfPmE6WjOGb02+FG/AAHbP60uMfmMaZfB9c/6N
 vZf3jMD/vjeKjEH8862bWNIhN79TxWDxuT2GIc6Ah6kR1qoUKGBuk/ya6v006wjVWxWJ
 CPW8vYUFLb90w2OFlvaHrDS38fiDJRIN+Bk7QHFHnTXIbkwTJX/0HPHpTuHyFRt2xkhD
 PDWm3pnFA1lqMpqHhMSo6Ilcrr2iqkgR3hu2je1j8sIviATi9RHx6QSIrgNrfg85jAq0
 iviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lxnvfp5VC343XHHg909SUXIQiaU3FYHnyesY0NbV52s=;
 b=JNYZ4og7x2bkfurZWW5ILbRsyBU3WaClQLvGGAEY3xOnxCU7oHKCkaZIRrmH40XvlG
 B4dTM0kpQfHw1ZPCm2WjiLhGeMUl9EyOzGzUjuQVt6vtkOh9c2L67Z6v62rgXby8hyx9
 5MLQlE1cTOOTcM1yfsdHTmu3KjPYzivyTumMHIRu0R6kiUfi/LHLaVgo4miw2MZhdr33
 23608v6RCQVUgX/PiOv/+XWEw4kN1fjiXpnmF14Sxl34lejNtHjH6oGqr+etuuuc7FdY
 eAl0aDDnzuS4x6UwqXuAWDodlropklzfj7nsgiAhrBqMDwou0uwbklPDo+UVLH0/EkM9
 zaQA==
X-Gm-Message-State: APjAAAXZzd27A3TeEhJzH1NgmKbBGLcyP2lGS0Rzxy/cgBo1g+CN9NST
 zFg5feb64I5w8UuEAg/xVkU=
X-Google-Smtp-Source: APXvYqwCjxdSfvtwXVkhI/bAkHyw7cLLOmc2xoNHKZwXrac30TuwkcRP9oPm95HbZid+Snrc8YlhZQ==
X-Received: by 2002:ac2:5605:: with SMTP id v5mr59898160lfd.136.1578361197030; 
 Mon, 06 Jan 2020 17:39:57 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id q11sm22285429ljm.76.2020.01.06.17.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 17:39:56 -0800 (PST)
To: Ben Dooks <ben.dooks@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
Date: Tue, 7 Jan 2020 04:39:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
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

MDYuMDEuMjAyMCAyMjowMCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gT24gMDUvMDEvMjAyMCAx
MDo1MywgQmVuIERvb2tzIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMDIwLTAxLTA1IDAxOjQ4LCBEbWl0
cnkgT3NpcGVua28gd3JvdGU6Cj4+PiAwNS4wMS4yMDIwIDAzOjA0LCBCZW4gRG9va3Mg0L/QuNGI
0LXRgjoKPj4+PiBbc25pcF0KPj4+Pgo+Pj4+IEkndmUganVzdCBnb25lIHRocm91Z2ggdGVzdGlu
Zy4KPj4+Pgo+Pj4+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMgc2hvdyAxNiBhbmQgMzItYml0cyB3
b3JrLgo+Pj4+Cj4+Pj4gVGhlIDI0IGJpdCBjYXNlIHNlZW1zIHRvIGJlIHdlaXJkLCBpdCBsb29r
cyBsaWtlIHRoZSAyNC1iaXQgZXhwZWN0cwo+Pj4+IDI0IGJpdCBzYW1wbGVzIGluIDMyIGJpdCB3
b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+Pj4+IGRvIDI0IGJpdCBp
biAyNCBiaXQsIHNvIHdlIG1heSBoYXZlIHRvIHJlbW92ZSAyNCBiaXQgc2FtcGxlIHN1cHBvcnQK
Pj4+PiAod2hpY2ggaXMgYSBzaGFtZSkKPj4+Pgo+Pj4+IE15IHByZWZlcmVuY2UgaXMgdG8gcmVt
b3ZlIHRoZSAyNC1iaXQgc3VwcG9ydCBhbmQga2VlcCB0aGUgMzIgYml0IGluLgo+Pj4+Cj4+Pgo+
Pj4gSW50ZXJlc3RpbmcuLiBKb24sIGNvdWxkIHlvdSBwbGVhc2UgY29uZmlybSB0aGF0IDI0Yml0
IGZvcm1hdCBpc24ndAo+Pj4gdXNhYmxlIG9uIFQzMD8KPj4KPj4gSWYgdGhlcmUgaXMgYW4gb3B0
aW9uIG9mIDI0IHBhY2tlZCBpbnRvIDMyLCB0aGVuIEkgdGhpbmsgdGhhdCB3b3VsZCB3b3JrLgo+
Pgo+PiBJIGNhbiB0cnkgdGVzdGluZyB0aGF0IHdpdGggcmF3IGRhdGEgb24gTW9uZGF5Lgo+IAo+
IEkgbmVlZCB0byBjaGVjayBzb21lIHRoaW5ncywgSSBhc3N1bWVkIDI0IHdhcyAyNCBwYWNrZWQg
Yml0cywgaXQgbG9va3MKPiBsaWtlIHRoZSBkZWZhdWx0IGlzIDI0IGluIDMyIGJpdHMgc28gd2Ug
bWF5IGJlIG9rLiBIb3dldmVyIEkgbmVlZCB0bwo+IHJlLXdyaXRlIG15IHRlc3QgY2FzZSB3aGlj
aCBhc3N1bWVkIGl0IHdhcyAyNGJpdHMgaW4gMyBieXRlcyAoUzI0XzNMRSkuCj4gCj4gSSdsbCBm
b2xsb3cgdXAgbGF0ZXIsCgpPa2F5LCB0aGUgUzI0XzNMRSBpc24ndCBzdXBwb3J0ZWQgYnkgUlQ1
NjQwIGNvZGVjIGluIG15IGNhc2UuIEkgYnJpZWZseQpsb29rZWQgdGhyb3VnaCB0aGUgVFJNIGRv
YyBhbmQgZ290IGltcHJlc3Npb24gdGhhdCBBSFVCIGNvdWxkIHJlLXBhY2sKZGF0YSBzdHJlYW0g
aW50byBzb21ldGhpbmcgdGhhdCBjb2RlYyBzdXBwb3J0cywgYnV0IG1heWJlIGl0J3MgYSB3cm9u
ZwppbXByZXNzaW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
