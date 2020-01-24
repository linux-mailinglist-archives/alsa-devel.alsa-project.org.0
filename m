Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F33CC1477A9
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 05:33:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A01D11681;
	Fri, 24 Jan 2020 05:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A01D11681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579840405;
	bh=y0KHDb1uGf7xjlx3HbwCZCDoeIiEzj7XjqLOI0H+gNA=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBUeVmR9R86jgzgG840d5Z2QDdK+50sb5l45iwsc1HweXCoIs2EK3nPyjU5L4t3p8
	 trf8n9tQW2CPpOtt+oRlHTnQYZCPWml3V8ng42HCXrM6wpUIUQ14j7jm3ZaQ6gF9v9
	 9WngYt9cOGeP/DesQkwz774Ipp7B2Xk80HmBpA4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70113F8020C;
	Fri, 24 Jan 2020 05:31:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C90CF8020C; Fri, 24 Jan 2020 05:31:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7448EF800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 05:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7448EF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="epG+XVAk"
Received: by mail-lf1-x143.google.com with SMTP id m30so293052lfp.8
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 20:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QFhUPyp2ZW+gx1b8GFNsdGdbU9UNpOwTbLh46EfrnmI=;
 b=epG+XVAkiD9oQ3lcwZLBgL6LLkaxgV0E6tON9yY/XoTfqOzpeL2xU7auI8wRTtjaq3
 WpylvbwvZAX4WO4RGhaDWU3jclnhwNBOpYur762jcX0iv82/M9quQES1r8ZeJF+rsYDz
 ZsY1w4jrsUKzpMPueYCTS3SXHpll1YLpEU6OV2AGw0bv1/fzW0Xnf7tm5y9zPj+1jEVr
 B4pC92PGqwn5GJ11H2xGSF6GBM/sJm2a+jU5hialozktG4ouvPhFM7c7qNgQ/BnGtSd/
 /nZRl1X2yjj4+ZHh7T/q85Ws4ig9eSd+UqP3PlRHVyqqfAjSP0ifvDu/ORijjm0IOPyy
 GRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QFhUPyp2ZW+gx1b8GFNsdGdbU9UNpOwTbLh46EfrnmI=;
 b=F+kE0gHmBpQ/CUV52I/qj5Hss6F5Jo3oc3GjSTf/9ytiYd34lokTboI5RIfWv4G9z6
 Ds6PFQBLs7WT/8YteFacwpZx6w0Jca/Np8ZhCGfdjolDI1Dq+FTw2cu6iLezDBsjsDao
 /YNeuuonwc0+rqOsV7tIFrnRHdXBUONLLGla9ZWIzMPnZr9lMfitY6VPR1sBvLGmST6V
 LnpuE7c35u2iju1hMugTfavghx/wMaVVKkhM8NCvWRJGV+ZnpfynT0wCoZo5dXfm7YHl
 s6aok5VSc3d1IXlGjwn3pSNvAcb1vzzigTBsOEMhYE0XlZHskJv6wK5pDJ41t2fE/xSj
 6fNg==
X-Gm-Message-State: APjAAAXjU6RcBAOLopu2fZM3APjw6HNUgQCxZocltlGiUKpoLH9f5cYX
 R8nEFYuCG1GnNLfoDywNf5F0c3zu
X-Google-Smtp-Source: APXvYqwT8abn8Fp+QKQOj4+jB1AxghROOkbB5LFcdditta+/+kPJrUGZLN6SCGeomPVro2GcDO1xPg==
X-Received: by 2002:ac2:58ea:: with SMTP id v10mr508226lfo.202.1579840296366; 
 Thu, 23 Jan 2020 20:31:36 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id i4sm2267498ljg.102.2020.01.23.20.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 20:31:35 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
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
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <9b3a0cdd-34c7-ecb4-4a26-268fd4a63041@codethink.co.uk>
 <76a6a818-ab60-45eb-a85e-fa3090266d6f@gmail.com>
Message-ID: <20be0c65-1071-d24a-7e2d-1d30cbfec452@gmail.com>
Date: Fri, 24 Jan 2020 07:31:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <76a6a818-ab60-45eb-a85e-fa3090266d6f@gmail.com>
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

MjQuMDEuMjAyMCAwMToxMSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMjQuMDEuMjAy
MCAwMDo1OSwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+IE9uIDIzLzAxLzIwMjAgMTk6MzgsIEJl
biBEb29rcyB3cm90ZToKPj4+IE9uIDA3LzAxLzIwMjAgMDE6MzksIERtaXRyeSBPc2lwZW5rbyB3
cm90ZToKPj4+PiAwNi4wMS4yMDIwIDIyOjAwLCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4g
T24gMDUvMDEvMjAyMCAxMDo1MywgQmVuIERvb2tzIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+
PiBPbiAyMDIwLTAxLTA1IDAxOjQ4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+Pj4gMDUu
MDEuMjAyMCAwMzowNCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+Pj4+IFtzbmlwXQo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBJJ3ZlIGp1c3QgZ29uZSB0aHJvdWdoIHRlc3RpbmcuCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMgc2hvdyAxNiBhbmQgMzItYml0cyB3b3JrLgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUgMjQgYml0IGNhc2Ugc2VlbXMgdG8gYmUgd2VpcmQsIGl0IGxv
b2tzIGxpa2UgdGhlIDI0LWJpdCBleHBlY3RzCj4+Pj4+Pj4+IDI0IGJpdCBzYW1wbGVzIGluIDMy
IGJpdCB3b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+Pj4+Pj4+PiBk
byAyNCBiaXQgaW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUgMjQgYml0IHNhbXBs
ZSBzdXBwb3J0Cj4+Pj4+Pj4+ICh3aGljaCBpcyBhIHNoYW1lKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBN
eSBwcmVmZXJlbmNlIGlzIHRvIHJlbW92ZSB0aGUgMjQtYml0IHN1cHBvcnQgYW5kIGtlZXAgdGhl
IDMyIGJpdAo+Pj4+Pj4+PiBpbi4KPj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IEludGVyZXN0aW5n
Li4gSm9uLCBjb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gdGhhdCAyNGJpdCBmb3JtYXQgaXNuJ3QK
Pj4+Pj4+PiB1c2FibGUgb24gVDMwPwo+Pj4+Pj4KPj4+Pj4+IElmIHRoZXJlIGlzIGFuIG9wdGlv
biBvZiAyNCBwYWNrZWQgaW50byAzMiwgdGhlbiBJIHRoaW5rIHRoYXQgd291bGQKPj4+Pj4+IHdv
cmsuCj4+Pj4+Pgo+Pj4+Pj4gSSBjYW4gdHJ5IHRlc3RpbmcgdGhhdCB3aXRoIHJhdyBkYXRhIG9u
IE1vbmRheS4KPj4+Pj4KPj4+Pj4gSSBuZWVkIHRvIGNoZWNrIHNvbWUgdGhpbmdzLCBJIGFzc3Vt
ZWQgMjQgd2FzIDI0IHBhY2tlZCBiaXRzLCBpdCBsb29rcwo+Pj4+PiBsaWtlIHRoZSBkZWZhdWx0
IGlzIDI0IGluIDMyIGJpdHMgc28gd2UgbWF5IGJlIG9rLiBIb3dldmVyIEkgbmVlZCB0bwo+Pj4+
PiByZS13cml0ZSBteSB0ZXN0IGNhc2Ugd2hpY2ggYXNzdW1lZCBpdCB3YXMgMjRiaXRzIGluIDMg
Ynl0ZXMgKFMyNF8zTEUpLgo+Pj4+Pgo+Pj4+PiBJJ2xsIGZvbGxvdyB1cCBsYXRlciwKPj4+Pgo+
Pj4+IE9rYXksIHRoZSBTMjRfM0xFIGlzbid0IHN1cHBvcnRlZCBieSBSVDU2NDAgY29kZWMgaW4g
bXkgY2FzZS4gSSBicmllZmx5Cj4+Pj4gbG9va2VkIHRocm91Z2ggdGhlIFRSTSBkb2MgYW5kIGdv
dCBpbXByZXNzaW9uIHRoYXQgQUhVQiBjb3VsZCByZS1wYWNrCj4+Pj4gZGF0YSBzdHJlYW0gaW50
byBzb21ldGhpbmcgdGhhdCBjb2RlYyBzdXBwb3J0cywgYnV0IG1heWJlIGl0J3MgYSB3cm9uZwo+
Pj4+IGltcHJlc3Npb24uCj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
Pgo+Pj4gSSBkaWQgYSBxdWljayB0ZXN0IHdpdGggdGhlIGZvbGxvd2luZzoKPj4+Cj4+PiDCoMKg
c294IC1uIC1iIDE2IC1jIDIgLXIgNDQxMDAgL3RtcC90bXAud2F2wqAgc3ludGggc2luZSA1MDAg
dm9sIDAuNQo+Pj4gwqDCoHNveCAtbiAtYiAyNCAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndhdsKg
IHN5bnRoIHNpbmUgNTAwIHZvbCAwLjUKPj4+IMKgwqBzb3ggLW4gLWIgMzIgLWMgMiAtciA0NDEw
MCAvdG1wL3RtcC53YXbCoCBzeW50aCBzaW5lIDUwMCB2b2wgMC41Cj4+Pgo+Pj4gVGhlIDE2IGFu
ZCAzMiB3b3JrIGZpbmUsIHRoZSAyNCBpcyBzaG93aW5nIGEgcGxheWJhY2sgb3V0cHV0IGZyZXEK
Pj4+IG9mIDQ0MEh6IGluc3RlYWQgb2YgNTAwSHouLi4gdGhpcyBzdWdnZXN0cyB0aGUgY2xvY2sg
aXMgb2ZmLCBvciB0aGVyZQo+Pj4gaXMgc29tZXRoaW5nIGVsc2Ugd2VpcmQgZ29pbmcgb24uLi4K
Pj4+Cj4+Cj4+IEkgc2hvdWxkIGhhdmUgY2hlY2tlZCBwbGxfYV9vdXQwIHJhdGUsIGZvciAyNGJp
dCAyY2gsIEkgZ2V0Cj4+IHBsbF9hX291dCBhdCB3aGljaCBtYWtlczoKPj4KPj4gMTEyODk2MDAv
KDI0KjIqNDQxMDApID0gNS4zMzMzMzMzMzMzCj4+Cj4+IEZvciBzb21lIHJlYXNvbiB0aGUgUExM
IGNhbid0IGdldCBhIGRlY2VudCBkaXZpc29yIGZvciB0aGlzLgo+IAo+IEhhdmUgeW91IHRyaWVk
IHRvIGFkanVzdCB0aGUgcHJlZGVmaW5lZCBQTExBIHJhdGU/IFBsZWFzZSBzZWUKPiB0ZWdyYV9j
bGtfaW5pdF90YWJsZSBpbiBkcml2ZXJzL2Nsay90ZWdyYS9jbGstdGVncmEzMC5jLiBXaWxsIGJl
Cj4gaW50ZXJlc3RpbmcgaWYgaXQgd29ya3Mgd2l0aCB0aGF0Lgo+IAo+IFNvd2phbnlhIHNhaWQg
dGhhdCB0aGUgUExMQSByYXRlIHNldHVwIGlzIGdvaW5nIHRvIGJlIG1vdmVkIHRvIHRoZSBhdWRp
bwo+IGRyaXZlciBbMV0sIG1heWJlIHRoYXQncyB3aGF0IHdlIGFscmVhZHkgbmVlZCBmb3IgMjRi
aXQuCj4gCj4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzEvMjEvNzQ0CgpBY3R1YWxs
eSwgdGVncmFfYXNvY191dGlsc19zZXRfcmF0ZSgpIHNldHMgdGhlIFBMTEEgcmF0ZSwgYnV0IHRo
ZSB2YWx1ZXMKYXJlIGhhcmRjb2RlZCB0aGVyZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
