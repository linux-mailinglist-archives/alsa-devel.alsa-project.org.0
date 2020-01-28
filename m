Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB9714BCCC
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 16:27:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B2C1671;
	Tue, 28 Jan 2020 16:26:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B2C1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580225232;
	bh=WxLCI+3kBD2MduBAwFmgXxBPuNpqeHO9mGt1WrTSYpI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FKUf3tyIDu061I79MsJNHYtoQaO4T4hBD7uTM1fPdzZ78u5pL8pSnQqFrHOCd4yhj
	 rvvxBNHq4zICCSeC4rmK5P2EIFnaOTvfxH/5Ph+R54eEtGkwHjJGHRdSUAdRceH791
	 dJe1PN9y684ZfYAg+6hv66f5QYVeHnUbeQrlT+18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFECDF801EB;
	Tue, 28 Jan 2020 16:25:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EED36F80150; Tue, 28 Jan 2020 16:25:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_1,PRX_BODY_13,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55821F800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 16:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55821F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mSMaf3GF"
Received: by mail-lj1-x241.google.com with SMTP id h23so15144662ljc.8
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wt1vosh5doE0CTfo450Q1EteoZWXd05+2wERnPg/Das=;
 b=mSMaf3GF40AF6W5ANFgPQ9CrM3aHDVjVi3gk0ESEK1kKonC5JyQSUpE93Le6B7CcgI
 nnGO2q8RMAXvgBgB944YXdXE1U7zrkXDU6NgsY2RBkA0cg25F4wph53rEwhwm75PnTnF
 Fs8jd+ay6dEc0LB3zIZKFDJz0GxzQ0N4kEZAebK1E3BZDVkLlAQ6koig5FUNzLFYuNxD
 ctwTshydCtIK3w6eliJf0la16m0rBr1I47VyTUpZXqluGwuy2juCMA9uGew0R83Y6zTp
 RQOInS/UI2BSkZpiXI8YdMaMnRYaMyVnvFBQX4xkSeh9pnF7iHgMnuNwntkiETi5sdra
 psFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wt1vosh5doE0CTfo450Q1EteoZWXd05+2wERnPg/Das=;
 b=lZ5NqrT9cWcRhyA+A/z8ZIlmRz25IOE/LhJ7hTFdzkxEbxpLwgUE+JlkeTmiyd+9eO
 8tw1Z8OlztXNBgxDA7Vw8RsABndN9KNgDvej8Bn8ZV6vz8MkHRExHf7i2QTgJHEJT50Y
 eDICqp8xzzjEm8eOgFhIlNQNsUfaYwwjwyGytO+NMU+GB5/jw24YhbD99M2V3L4iresY
 1KhPWOeacQg1BM4o9nmsQUqdySpBqkm6tPHzlClMo78dOqK2hWcgaRBjUA7EA/HsX0HH
 aKpSOPec+uraDAIGikjQd2R4/r5lz2ObihGFClvDmk2UPkXed9siAgyd7gS5LaNZA4Je
 Ue7w==
X-Gm-Message-State: APjAAAWEy+xrn0W4k1mktYSiP0rPUB47JSUCsYmacY+TT5Zphk/dOYVi
 Pf+gUsY1fVYZiReElgeMhUY=
X-Google-Smtp-Source: APXvYqxJXNRv3sXMNruaDyN8qSDfgWtYeDy/sN0vsUVncH+3pcE3rkyyiIESKlIpEkKoiYbd/aKIFg==
X-Received: by 2002:a2e:7207:: with SMTP id n7mr12227173ljc.242.1580225123107; 
 Tue, 28 Jan 2020 07:25:23 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id v7sm8187419ljd.12.2020.01.28.07.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 07:25:22 -0800 (PST)
To: Jon Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
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
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <1aa6a4bf-10ea-001d-2d35-44494d9554f8@gmail.com>
 <62cea895-c1f1-a833-b63c-050642bb8a79@codethink.co.uk>
 <d6bb92e2-16ba-3c00-2f07-e741ecaa5ec8@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4b7ccb4f-ee19-a2f2-88cb-3f0dc97f9da9@gmail.com>
Date: Tue, 28 Jan 2020 18:25:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <d6bb92e2-16ba-3c00-2f07-e741ecaa5ec8@nvidia.com>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
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

MjguMDEuMjAyMCAxNjoxOSwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDI4LzAxLzIw
MjAgMDg6NTksIEJlbiBEb29rcyB3cm90ZToKPj4gT24gMjcvMDEvMjAyMCAxOToyMywgRG1pdHJ5
IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMjcuMDEuMjAyMCAyMjoyMCwgRG1pdHJ5IE9zaXBlbmtvINC/
0LjRiNC10YI6Cj4+Pj4gMjQuMDEuMjAyMCAxOTo1MCwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+
Pj4+Pgo+Pj4+PiBPbiAyMy8wMS8yMDIwIDE5OjM4LCBCZW4gRG9va3Mgd3JvdGU6Cj4+Pj4+PiBP
biAwNy8wMS8yMDIwIDAxOjM5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+Pj4gMDYuMDEu
MjAyMCAyMjowMCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+Pj4+IE9uIDA1LzAxLzIwMjAg
MTA6NTMsIEJlbiBEb29rcyB3cm90ZToKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gT24g
MjAyMC0wMS0wNSAwMTo0OCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4+Pj4+IDA1LjAx
LjIwMjAgMDM6MDQsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4+PiBbc25pcF0KPj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gSSd2ZSBqdXN0IGdvbmUgdGhyb3VnaCB0ZXN0aW5nLgo+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBTb21lIHNpbXBsZSBkYXRhIHRlc3RzIHNob3cgMTYgYW5kIDMy
LWJpdHMgd29yay4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gVGhlIDI0IGJpdCBjYXNlIHNlZW1z
IHRvIGJlIHdlaXJkLCBpdCBsb29rcyBsaWtlIHRoZSAyNC1iaXQKPj4+Pj4+Pj4+Pj4gZXhwZWN0
cwo+Pj4+Pj4+Pj4+PiAyNCBiaXQgc2FtcGxlcyBpbiAzMiBiaXQgd29yZHMuIEkgY2FuJ3Qgc2Vl
IGFueSBwYWNraW5nCj4+Pj4+Pj4+Pj4+IG9wdGlvbnMgdG8KPj4+Pj4+Pj4+Pj4gZG8gMjQgYml0
IGluIDI0IGJpdCwgc28gd2UgbWF5IGhhdmUgdG8gcmVtb3ZlIDI0IGJpdCBzYW1wbGUKPj4+Pj4+
Pj4+Pj4gc3VwcG9ydAo+Pj4+Pj4+Pj4+PiAod2hpY2ggaXMgYSBzaGFtZSkKPj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4gTXkgcHJlZmVyZW5jZSBpcyB0byByZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0
IGFuZCBrZWVwIHRoZSAzMgo+Pj4+Pj4+Pj4+PiBiaXQgaW4uCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+PiBJbnRlcmVzdGluZy4uIEpvbiwgY291bGQgeW91IHBsZWFzZSBjb25maXJt
IHRoYXQgMjRiaXQgZm9ybWF0Cj4+Pj4+Pj4+Pj4gaXNuJ3QKPj4+Pj4+Pj4+PiB1c2FibGUgb24g
VDMwPwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IElmIHRoZXJlIGlzIGFuIG9wdGlvbiBvZiAyNCBwYWNr
ZWQgaW50byAzMiwgdGhlbiBJIHRoaW5rIHRoYXQgd291bGQKPj4+Pj4+Pj4+IHdvcmsuCj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4gSSBjYW4gdHJ5IHRlc3RpbmcgdGhhdCB3aXRoIHJhdyBkYXRhIG9uIE1v
bmRheS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSBuZWVkIHRvIGNoZWNrIHNvbWUgdGhpbmdzLCBJIGFz
c3VtZWQgMjQgd2FzIDI0IHBhY2tlZCBiaXRzLCBpdAo+Pj4+Pj4+PiBsb29rcwo+Pj4+Pj4+PiBs
aWtlIHRoZSBkZWZhdWx0IGlzIDI0IGluIDMyIGJpdHMgc28gd2UgbWF5IGJlIG9rLiBIb3dldmVy
IEkgbmVlZCB0bwo+Pj4+Pj4+PiByZS13cml0ZSBteSB0ZXN0IGNhc2Ugd2hpY2ggYXNzdW1lZCBp
dCB3YXMgMjRiaXRzIGluIDMgYnl0ZXMKPj4+Pj4+Pj4gKFMyNF8zTEUpLgo+Pj4+Pj4+Pgo+Pj4+
Pj4+PiBJJ2xsIGZvbGxvdyB1cCBsYXRlciwKPj4+Pj4+Pgo+Pj4+Pj4+IE9rYXksIHRoZSBTMjRf
M0xFIGlzbid0IHN1cHBvcnRlZCBieSBSVDU2NDAgY29kZWMgaW4gbXkgY2FzZS4gSQo+Pj4+Pj4+
IGJyaWVmbHkKPj4+Pj4+PiBsb29rZWQgdGhyb3VnaCB0aGUgVFJNIGRvYyBhbmQgZ290IGltcHJl
c3Npb24gdGhhdCBBSFVCIGNvdWxkIHJlLXBhY2sKPj4+Pj4+PiBkYXRhIHN0cmVhbSBpbnRvIHNv
bWV0aGluZyB0aGF0IGNvZGVjIHN1cHBvcnRzLCBidXQgbWF5YmUgaXQncyBhCj4+Pj4+Pj4gd3Jv
bmcKPj4+Pj4+PiBpbXByZXNzaW9uLgo+Pj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+Pj4+Pj4KPj4+Pj4+IEkgZGlkIGEgcXVpY2sgdGVzdCB3aXRoIHRoZSBmb2xsb3dp
bmc6Cj4+Pj4+Pgo+Pj4+Pj4gwqDCoHNveCAtbiAtYiAxNiAtYyAyIC1yIDQ0MTAwIC90bXAvdG1w
LndhdsKgIHN5bnRoIHNpbmUgNTAwIHZvbCAwLjUKPj4+Pj4+IMKgwqBzb3ggLW4gLWIgMjQgLWMg
MiAtciA0NDEwMCAvdG1wL3RtcC53YXbCoCBzeW50aCBzaW5lIDUwMCB2b2wgMC41Cj4+Pj4+PiDC
oMKgc294IC1uIC1iIDMyIC1jIDIgLXIgNDQxMDAgL3RtcC90bXAud2F2wqAgc3ludGggc2luZSA1
MDAgdm9sIDAuNQo+Pj4+Pj4KPj4+Pj4+IFRoZSAxNiBhbmQgMzIgd29yayBmaW5lLCB0aGUgMjQg
aXMgc2hvd2luZyBhIHBsYXliYWNrIG91dHB1dCBmcmVxCj4+Pj4+PiBvZiA0NDBIeiBpbnN0ZWFk
IG9mIDUwMEh6Li4uIHRoaXMgc3VnZ2VzdHMgdGhlIGNsb2NrIGlzIG9mZiwgb3IgdGhlcmUKPj4+
Pj4+IGlzIHNvbWV0aGluZyBlbHNlIHdlaXJkIGdvaW5nIG9uLi4uCj4+Pj4+Cj4+Pj4+IEkgd2Fz
IGxvb2tpbmcgYXQgdXNpbmcgc294IHRvIGNyZWF0ZSBzdWNoIGFzIGZpbGUsIGJ1dCB0aGUgYWJv
dmUKPj4+Pj4gY29tbWFuZAo+Pj4+PiBnZW5lcmF0ZXMgYSBTMjRfM0xFIGZpbGUgYW5kIG5vdCBT
MjRfTEUgZmlsZS4gVGhlIGNvZGVjIG9uIEpldHNvbi1USzEKPj4+Pj4gc3VwcG9ydHMgUzI0X0xF
IGJ1dCBkb2VzIG5vdCBzdXBwb3J0IFMyNF8zTEUgYW5kIHNvIEkgY2Fubm90IHRlc3QgdGhpcy4K
Pj4+Pj4gQW55d2F5LCB3ZSByZWFsbHkgbmVlZCB0byB0ZXN0IFMyNF9MRSBhbmQgbm90IFMyNF8z
TEUgYmVjYXVzZSB0aGlzIGlzCj4+Pj4+IHRoZSBwcm9ibGVtIHRoYXQgRG1pdHJ5IGlzIGhhdmlu
Zy4KPj4+Pj4KPj4+Pj4gQmVuIGlzIFMyNF8zTEUgd2hhdCB5b3UgcmVhbGx5IG5lZWQgdG8gc3Vw
cG9ydD8KPj4+Pj4KPj4+Pj4gRG1pdHJ5LCBkb2VzIHRoZSBmb2xsb3dpbmcgZml4IHlvdXIgcHJv
YmxlbT8KPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2ky
cy5jCj4+Pj4+IGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4gaW5kZXggZGJl
ZDNjNTQwOGU3Li45Mjg0NWM0YjYzZjQgMTAwNjQ0Cj4+Pj4+IC0tLSBhL3NvdW5kL3NvYy90ZWdy
YS90ZWdyYTMwX2kycy5jCj4+Pj4+ICsrKyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5j
Cj4+Pj4+IEBAIC0xNDAsNyArMTQwLDcgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19od19wYXJh
bXMoc3RydWN0Cj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lG
X0JJVFNfMTY7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNhbXBsZV9z
aXplID0gMTY7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+
Pj4+PiAtwqDCoMKgwqDCoMKgIGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMjRfTEU6Cj4+Pj4+ICvC
oMKgwqDCoMKgwqAgY2FzZSBTTkRSVl9QQ01fRk9STUFUX1MyNF8zTEU6Cj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCA9IFRFR1JBMzBfSTJTX0NUUkxfQklUX1NJWkVf
MjQ7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBU
RUdSQTMwX0FVRElPQ0lGX0JJVFNfMjQ7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNhbXBsZV9zaXplID0gMjQ7Cj4+Pj4+IEBAIC0zMTgsNyArMzE4LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIKPj4+Pj4gdGVncmEzMF9pMnNfZGFpX3Rl
bXBsYXRlID0gewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5l
bHNfbWF4ID0gMiwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhdGVz
ID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9Q
Q01fRk1UQklUX1MyNF9MRSB8Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MyNF8zTEUgfAo+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZf
UENNX0ZNVEJJVF9TMTZfTEUsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoCAuY2FwdHVyZSA9IHsKPj4+Pj4gQEAgLTMyNyw3ICszMjcsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcgo+Pj4+PiB0ZWdyYTMwX2kyc19kYWlfdGVt
cGxhdGUgPSB7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVs
c19tYXggPSAyLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmF0ZXMg
PSBTTkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFIHwKPj4+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BD
TV9GTVRCSVRfUzI0X0xFIHwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzI0XzNMRSB8Cj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9Q
Q01fRk1UQklUX1MxNl9MRSwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgIC5vcHMgPSAmdGVncmEzMF9pMnNfZGFpX29wcywKPj4+Pj4KPj4+Pj4gSm9uCj4+
Pj4+Cj4+Pj4KPj4+PiBJdCBzaG91bGQgc29sdmUgdGhlIHByb2JsZW0gaW4gbXkgcGFydGljdWxh
ciBjYXNlLCBidXQgSSdtIG5vdCBzdXJlIHRoYXQKPj4+PiB0aGUgc29sdXRpb24gaXMgY29ycmVj
dC4KPj4+Pgo+Pj4+IFRoZSB2NS41IGtlcm5lbCBpcyByZWxlYXNlZCBub3cgd2l0aCB0aGUgYnJv
a2VuIGF1ZGlvIGFuZCBhcHBhcmVudGx5Cj4+Pj4gZ2V0dGluZyAyNGJpdCB0byB3b3JrIHdvbid0
IGJlIHRyaXZpYWwgKGlmIHBvc3NpYmxlIGF0IGFsbCkuIEJlbiwgY291bGQKPj4+PiB5b3UgcGxl
YXNlIHNlbmQgYSBwYXRjaCB0byBmaXggdjUuNSBieSByZW1vdmluZyB0aGUgUzI0IHN1cHBvcnQK
Pj4+PiBhZHZlcnRpc2VtZW50IGZyb20gdGhlIGRyaXZlcj8KPj4+Cj4+PiBJIGFsc28gc3VzcGVj
dCB0aGF0IHMzMiBtYXkgbmVlZCBzb21lIGV4dHJhIHBhdGNoZXMgYW5kIHRodXMgY291bGQgYmUK
Pj4+IHdvcnRod2hpbGUgdG8gc3RvcCBhZHZlcnRpc2luZyBpdCBhcyB3ZWxsLgo+Pgo+PiBBcyBm
YXIgYXMgSSBhbSBhd2FyZSB0aGF0IHdvcmtzIGFuZCB3ZSBjYW4gaGl0IHRoZSBhdWRpbyByYXRl
cyBmb3IgaXQuCj4gCj4gSSByYW4gYSB0ZXN0IG9uIFRlZ3JhMTI0IEpldHNvbi1USzEgYW5kIDI0
LWJpdCBwbGF5YmFjayBzZWVtcyB0byB3b3JrIGFzCj4gQmVuIGhhcyBpbmRpY2F0ZWQuIFNvIEkg
ZG9uJ3QgdGhpbmsgaXQgaXMgYnJva2VuLgoKSGF2ZSB5b3UgdHJpZWQgdG8gcmVwbGljYXRlIG15
IGNhc2UgYnkgcGxheWluZyB0aGUgdmlkZW8gZmlsZT8KCj4gQ2FuIHlvdSB0cnkgQmVuJ3MgdGVz
dGNhc2Ugb24gVGVncmEzMCAoaWUuIGdlbmVyYXRlIGEgdG9uZSB1c2luZyBzb3ggYW5kCj4gdXNl
IGFwbGF5IHRvIHBsYXkpPwoKU3VyZWx5IEkgY2FuIHRyeSwgYnV0IG9ubHkgaWYgeW91J2xsIHNo
YXJlIHRoZSBzYW1wbGUgZmlsZSB3aXRoIG1lIGFuZApnaXZlIHByZWNpc2UgaW5zdHJ1Y3Rpb25z
IGhvdyB0byB0ZXN0IGl0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
