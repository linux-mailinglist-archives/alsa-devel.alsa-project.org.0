Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F00122D2E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 14:43:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A53AD1654;
	Tue, 17 Dec 2019 14:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A53AD1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576590227;
	bh=Zz6P3yF9/zhkHg3E522YrgNlIQXCoTee5vaHxDORPeE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c50Vn1wu//nhk2cn1gPhrYS3eGGks8D4rr8No6SADYW5Z3vGHwe+hc4qX+U7Jx2WC
	 CxGFOEtzRhUZ++6eVr72D/ro8wWmYm1ky1NM/yK8TFhF3p5qRUzcSSje0PkE98DXix
	 lxLbV6XD2xfVkopKgFblHFRXLsOFZQq9exHsBBgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15559F8028D;
	Tue, 17 Dec 2019 14:39:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99FA6F800AD; Mon, 16 Dec 2019 16:49:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31378F800AD
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 16:49:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31378F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jS7jD2bC"
Received: by mail-lf1-x143.google.com with SMTP id f15so4571170lfl.13
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XLefccWn9eLOZQVYfFnGLvT38QOza41B05dCschHmWs=;
 b=jS7jD2bCBBvJFfInfLsysA2/SacydhvAKRLPbaCZm9kCX3pEbkU+DyscpMbKooRhZs
 h544dWURUQyOXo0/bQwEhellGMd/VlQ1/IcSyTS+qUgsTb+ammoM8tYoeKcpP14K50cn
 CzG2pZnRX/+R+VKhQoR92F2AE926B49SvZBkZK41mZIrcGzX/zczjvwddjAc4tGGr4dE
 c1SEq/1MlAViqx+mT2+xxjepaaXMZ+LrVn663Yd1HFRTJmq/WpoMUzxo8sUBoxd9sUPk
 kjNxn2YRCiNFR2aiDMxWrTf0OaHZMHPTKCCcxJpJL5FKJFm3zCmoTjWWQzCfll95dnS+
 otdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XLefccWn9eLOZQVYfFnGLvT38QOza41B05dCschHmWs=;
 b=g5FsBmV6MB6kdSWDKI6InL6c8lR5wIsSDyu932xwaJIRFzmV3pt+hd444Ugir694dz
 bvxOKNjezk8rYOkijfd/zw0sD4lFU2soLg1lAGsfNzyIyisAoQ+fG8C110vmaH/rsXHU
 LfEdqC9Y+AYVhLdpGVzusjfeVXgmN4FpCQlye6nFemb2gksUz5sQ0Pn1RbLtyCmq1Mz2
 ngOPJwi3VVuY+kMYQ9yovgKQgGHjhxC7VAHnbowDWAAUoupRrkT5xVOlfMOJQMcz5A38
 GFaqEAsvZJtBSBo/qzkP0ldp6ZSPGWs5797C2EubX5Fe2KpfMUus9tnGugKglo0tncOY
 Gdpw==
X-Gm-Message-State: APjAAAWJFRzPo3MVhXQBVoiinsWbWq1euYffwcof1G97XD5y7KeuuQfR
 l44s3YIoxQEEFZ1rFNkQ4F/jsMVG
X-Google-Smtp-Source: APXvYqwgxkuXc185DH64gccxf2DghtR89KC9lp7fJkIdwOQboVqZO5SyW248v+/giOL9Y7/LPT5P3A==
X-Received: by 2002:a19:c210:: with SMTP id l16mr17999700lfc.35.1576511375718; 
 Mon, 16 Dec 2019 07:49:35 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id n13sm10730783lji.91.2019.12.16.07.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 07:49:34 -0800 (PST)
To: Peter De Schrijver <pdeschrijver@nvidia.com>
References: <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
 <20191211151028.GZ28289@pdeschrijver-desktop.Nvidia.com>
 <0930a710-174b-859b-294c-e9f81f6a3b5e@gmail.com>
 <20191216122005.GB28289@pdeschrijver-desktop.Nvidia.com>
 <53653719-f8e5-f6d1-a1d1-e53c7ccd7636@gmail.com>
 <20191216151132.GC28289@pdeschrijver-desktop.Nvidia.com>
 <20191216152435.GD28289@pdeschrijver-desktop.Nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fa538845-cb8e-cf88-34be-3ceb2daa63c2@gmail.com>
Date: Mon, 16 Dec 2019 18:49:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191216152435.GD28289@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 17 Dec 2019 14:39:17 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 lgirdwood@gmail.com, mturquette@baylibre.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, josephl@nvidia.com, linux-clk@vger.kernel.org,
 mmaddireddy@nvidia.com, daniel.lezcano@linaro.org, krzk@kernel.org,
 jonathanh@nvidia.com, spujar@nvidia.com, devicetree@vger.kernel.org,
 arnd@arndb.de, markz@nvidia.com, alexios.zavras@intel.com, robh+dt@kernel.org,
 tiwai@suse.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au,
 tglx@linutronix.de, allison@lohutok.net, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 Jisheng.Zhang@synaptics.com, broonie@kernel.org,
 Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock
 registrations into PMC driver
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

MTYuMTIuMjAxOSAxODoyNCwgUGV0ZXIgRGUgU2NocmlqdmVyINC/0LjRiNC10YI6Cj4gT24gTW9u
LCBEZWMgMTYsIDIwMTkgYXQgMDU6MTE6MzJQTSArMDIwMCwgUGV0ZXIgRGUgU2NocmlqdmVyIHdy
b3RlOgo+PiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRh
Y2htZW50cwo+Pgo+Pgo+PiBPbiBNb24sIERlYyAxNiwgMjAxOSBhdCAwNToyMzoyM1BNICswMzAw
LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+IENvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSB3
aGF0IGRvIHlvdSBtZWFuIGJ5IHRoZSAiZXhpc3RpbmcgdXNlcnMiPwo+Pj4+PiBBRkFJSywgbm90
aGluZyBpbiBrZXJuZWwgdXNlcyBtdXggY2xvY2tzLgo+Pj4+Cj4+Pj4gVGhlIERUIGNsayBiaW5k
aW5ncyBhbGxvdyBmb3IgcGFyZW50IGluaXRpYWxpemF0aW9uLCBzbyBpdCdzIGNlcnRhaW5seQo+
Pj4+IHBvc3NpYmxlIHRoZXJlIGFyZSBzb21lIERUcyB3aGljaCByZWx5IG9uIHRoaXMuIFdlIHBy
b21pc2VkIHRvIG5ldmVyCj4+Pj4gYnJlYWsgdGhlIGJpbmRpbmdzLCB3aGljaCBjaGFuZ2luZyB0
byAxIGNsb2NrIHdvdWxkIGRvLgo+Pj4KPj4+IFdoYXQgYWJvdXQgdGhpcyB2YXJpYW50Ogo+Pj4K
Pj4+ICAgMS4gS2VlcCB0aGUgb2xkIENhUiBjb2RlIGluIHBsYWNlLgo+Pj4KPj4+ICAgMi4gTWFr
ZSBDYVIgZHJpdmVyIHRvIHNjYW4gd2hvbGUgZGV2aWNlLXRyZWUgZm9yIHRoZSBsZWdhY3kgUE1D
IGNsb2Nrcy4KPj4+Cj4+PiAgIDMuIElmIGxlZ2FjeSBjbG9jayBpcyBmb3VuZCwgdGhlbiByZWdp
c3RlciBQTUMgY2xvY2tzIGZyb20gQ2FSLgo+Pj4KPj4+ICAgNC4gSWYgbGVnYWN5IGNsb2NrcyBh
cmUgbm90IGZvdW5kLCB0aGVuIGRvbid0IHJlZ2lzdGVyIFBNQyBjbG9ja3MgZnJvbQo+Pj4gQ2FS
Lgo+Pj4KPj4+ICAgNS4gQWRkIGNsb2NrcyBzdXBwb3J0IHRvIHRoZSBQTUMgZHJpdmVyIGFuZCBv
bmx5IHJlZ2lzdGVyIHRoZW0gaWYKPj4+IGxlZ2FjeSBjbG9ja3MgYXJlIG5vdCByZWdpc3RlcmVk
IGJ5IENhUi4KPj4+Cj4+PiBOb3cgYm90aCBvbGQgYW5kIG5ldyBEVEJzIGNhbiBjby1leGlzdCBh
bmQgd29yaywgZXZlcnlvbmUgaGFwcHkuCj4+Cj4+IFRoYXQgc2VlbXMgZXZlbiBtb3JlIHdvcmsu
LiBUb2RheSB0aGUgb25seSB1cHN0cmVhbSB1c2VyIGlzIGF1ZGlvLgo+PiBDdXJyZW50bHkgdGhl
c2UgY2xvY2tzIGFyZSBzZXR1cCBieSB0aGUgQ0FSIGNsb2NrIGRyaXZlci4gSG93ZXZlcgo+PiBh
cyB0aGV5IHdpbGwgbW92ZSB0byB0aGUgUE1DIGRyaXZlciwgdGhpcyBtZWNoYW5pc20gY2Fubm90
IGJlIHVzZWQuCj4+IEhlbmNlIHRoZSBwbGFuIGlzIHRvIG1vZGlmeSB0aGUgYXVkaW8gZHJpdmVy
IHRvIGNoZWNrIGZvciB0aGUgUE1DIGNsb2Nrcwo+PiBpbiBEVCBhbmQgaWYgdGhleSBhcmUgbm90
IGF2YWlsYWJsZSB1c2UgdGhlIENBUiBjbG9ja3MgYXMgZmFsbGJhY2suCj4+IFRoZSB3aG9sZSBy
ZWFzb24gdGhlIGNsb2NrcyBtb3ZlIHRvIHRoZSBQTUMgZHJpdmVyLCBpcyB0aGF0IHdoZW4gUE1D
Cj4+IGJlY29tZXMgc2VjdXJlLCBhbGwgYWNjZXNzZXMgaGF2ZSB0byBnbyB2aWEgYW4gU01DLiBH
aXZlbiB0aGF0IHdlIGRvbid0Cj4+IHdhbnQgU01DcyBhbGwgb3ZlciB0aGUgVGVncmEgZHJpdmVy
cywgaXQncyBhIGdvb2Qgb3Bwb3J0dW5pdHkgdG8gbW92ZQo+PiB0aGUgUE1DIGNsb2NrIGhhbmRs
aW5nIGludG8gdGhlIFBNQyBkcml2ZXIuIFBNQyBjYW4gYmUgc2VjdXJlIHdpdGggYm90aAo+PiAn
bmV3JyBhbmQgb2xkIERUcywgc28ganVzdCByZWdpc3RlcmluZyB0aGUgUE1DIGNsb2NrcyBpbiB0
aGUgQ0FSIGRyaXZlcgo+PiBpZiBsZWdhY3kgY2xvY2tzIGFyZSBmb3VuZCBpbiB0aGUgRFQsIHdv
bid0IGFsd2F5cyB3b3JrLgo+Pgo+IAo+IEdpdmVuIHRoZSBhdWRpbyBkcml2ZXIgbmVlZHMgdG8g
Y2hhbmdlIGFueXdheSwgd2UgY2FuIGluZGVlZCB1c2UgMSBjbG9jawo+IHBlciBQTUMgY2xrX291
dF8gcmF0aGVyIHRoYW4gMiBhcyB3ZSBoYXZlIHRvZGF5LiBBcyB0aGlzIG1vZGVscyB0aGUgaHcK
PiBzbGlnaHRseSBiZXR0ZXIsIEkgdGhpbmsgd2Ugc2hvdWxkIGRvIHRoYXQgYXMgeW91IHN1Z2dl
c3RlZC4KPiAKPiBQZXRlci4KPiAKCk9rYXksIGxldCdzIHRyeSBhbmQgc2VlIGhvdyBpdCB3aWxs
IGdvLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
