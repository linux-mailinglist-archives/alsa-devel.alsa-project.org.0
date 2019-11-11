Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AB0F6C8F
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 03:06:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 583E61675;
	Mon, 11 Nov 2019 03:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 583E61675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573437989;
	bh=4FXe+5WSgndROIjmNYuYo9pn0zYKYnJb8Jg+V/1/HVo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kF9ionu0dMi6uku/89PbPnt7cRQ1z8CkkhyZ00ZXiOjzCwLJcWJyvZnKAYgC0ISWd
	 8QBA+H+fTcpHgS+3dE+GYvL9FB2LT0AgEzn/Ji4EWFf6PyB61nY+iYo5LcLcYF/93H
	 BCv6wB1QJqOweZCq0aHbHp/mdoai5bThefl0DXpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73F6FF80483;
	Mon, 11 Nov 2019 03:04:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B650F80483; Mon, 11 Nov 2019 03:04:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC1E5F80141
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 03:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC1E5F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="dUIzRZQP"
Received: by mail-wm1-x342.google.com with SMTP id l1so247899wme.2
 for <alsa-devel@alsa-project.org>; Sun, 10 Nov 2019 18:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hoNRr8vMAuZwu+YxnjVHz8DQL1f8vFbQxE/Xx5h1Uag=;
 b=dUIzRZQPn/lsKAoYuwHMdjBxwYwlKCfZbPdvnE4IpNnhKzkriar+VAq1Cc9xTIzWdt
 HB2Sr4iA0F3xg9/qMg7xZlnfZSaBiAszS1bLOReMnGIFeKzbQdab+nDkP6yZFPgW4rEI
 IIipkRJi3XMWnuDGFEV7tN8RD2wtZmehkqtmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hoNRr8vMAuZwu+YxnjVHz8DQL1f8vFbQxE/Xx5h1Uag=;
 b=MHlVUxSQyI4mbcLpj3HAgiMNG8iwlQhmESsKzvVCgURjbvRjOq5oYlG94VtV1vIPxV
 vQAQyUQVoJrlFKQZ9NOFP+Wey+C1ZasDv9OfgvunDAxH7K05P+hSD+0uAnE5p2UopQWA
 8AMVtB9Sm0QKQYeOnolMZ3jIDUswV/Y0pMLgFM3suDx9ievtSyy7D1fHppa0mf86LP7t
 W0x8aCGaMQQctGReyKuvBmH5pgXEKt0xmIYR2Ut/Cb3cani12uG4EQN1XCc4wJnvxDRt
 3KxlFeKNGwKuR0TsFg/7iawuUtfnQHf5tmLDXzO2wjNSo6Q35q+Ae0p/3U6IEbwD1URM
 cQFA==
X-Gm-Message-State: APjAAAXXa0CgcFGDuIZKyu1GnCF85UNp2wQ3h0K2JRndUr6sb3rQUk83
 5HCSS1UPmOXrB5tr0qL6dKxBcPhw23yaZR4DcaGxq6w7
X-Google-Smtp-Source: APXvYqz4nE5Jey3AtmxapRoFeQip25ILCpYY1Y44sryEjEoj5y9aOXdidpoAfaXB7e4B2t2fTyDBijMmi+ugy+XBkBg=
X-Received: by 2002:a1c:e157:: with SMTP id y84mr17186005wmg.59.1573437877833; 
 Sun, 10 Nov 2019 18:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20190923162940.199580-1-yuhsuan@chromium.org>
In-Reply-To: <20190923162940.199580-1-yuhsuan@chromium.org>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Mon, 11 Nov 2019 10:04:26 +0800
Message-ID: <CAGvk5PqdnJ61XZMw3e4ja8YZ5_LAwJP3n=fYyKHQRwv_A+Kdwg@mail.gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v2] ASoC: Intel:
 kbl_rt5663_rt5514_max98927: Add dmic format constraint
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

SGkgYWxsLAoKRG9lcyBhbnlvbmUgaGF2ZSB0aW1lIHRvIHJldmlldyB0aGlzIHBhdGNoPyBJdCBz
aG91bGQgYmUgZWFzeSB0bwpyZXZpZXcgYmVjYXVzZSBpdCBqdXN0IGEgZm9ybWF0IGNvbnN0cmFp
bnQuCgpUaGFua3MsCll1LUhzdWFuCgpZdS1Ic3VhbiBIc3UgPHl1aHN1YW5AY2hyb21pdW0ub3Jn
PiDmlrwgMjAxOeW5tDnmnIgyNOaXpSDpgLHkuowg5LiK5Y2IMTI6Mjnlr6vpgZPvvJoKPgo+IE9u
IEtCTCBwbGF0Zm9ybSwgdGhlIG1pY3JvcGhvbmUgaXMgYXR0YWNoZWQgdG8gZXh0ZXJuYWwgY29k
ZWMocnQ1NTE0KQo+IGluc3RlYWQgb2YgUENILiBIb3dldmVyLCBURE0gc2xvdCBiZXR3ZWVuIFBD
SCBhbmQgY29kZWMgaXMgMTYgYml0cyBvbmx5Lgo+IEluIG9yZGVyIHRvIGF2b2lkIHNldHRpbmcg
d3JvbmcgZm9ybWF0LCB3ZSBzaG91bGQgYWRkIGEgY29uc3RyYWludCB0bwo+IGZvcmNlIHRvIHVz
ZSAxNiBiaXRzIGZvcm1hdCBmb3JldmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtSHN1YW4gSHN1
IDx5dWhzdWFuQGNocm9taXVtLm9yZz4KPiAtLS0KPiBJIGhhdmUgdXBkYXRlZCB0aGUgY29tbWl0
IG1lc3NhZ2UuIFBsZWFzZSBzZWUgd2hldGhlciBpdCBpcyBjbGVhcgo+IGVub3VnaC4gVGhhbmtz
Lgo+ICBzb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2tibF9ydDU2NjNfcnQ1NTE0X21heDk4OTI3LmMg
fCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvc291bmQvc29jL2ludGVsL2JvYXJkcy9rYmxfcnQ1NjYzX3J0NTUxNF9tYXg5ODkyNy5jIGIv
c291bmQvc29jL2ludGVsL2JvYXJkcy9rYmxfcnQ1NjYzX3J0NTUxNF9tYXg5ODkyNy5jCj4gaW5k
ZXggNzRkZGE4Nzg0ZjFhMDEuLjY3YjI3NmE2NWE4ZDJkIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3Nv
Yy9pbnRlbC9ib2FyZHMva2JsX3J0NTY2M19ydDU1MTRfbWF4OTg5MjcuYwo+ICsrKyBiL3NvdW5k
L3NvYy9pbnRlbC9ib2FyZHMva2JsX3J0NTY2M19ydDU1MTRfbWF4OTg5MjcuYwo+IEBAIC00MDAs
NiArNDAwLDkgQEAgc3RhdGljIGludCBrYWJ5bGFrZV9kbWljX3N0YXJ0dXAoc3RydWN0IHNuZF9w
Y21fc3Vic3RyZWFtICpzdWJzdHJlYW0pCj4gICAgICAgICBzbmRfcGNtX2h3X2NvbnN0cmFpbnRf
bGlzdChydW50aW1lLCAwLCBTTkRSVl9QQ01fSFdfUEFSQU1fQ0hBTk5FTFMsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZG1pY19jb25zdHJhaW50cyk7Cj4KPiArICAgICAgIHJ1bnRpbWUtPmh3
LmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRTsKPiArICAgICAgIHNuZF9wY21faHdf
Y29uc3RyYWludF9tc2JpdHMocnVudGltZSwgMCwgMTYsIDE2KTsKPiArCj4gICAgICAgICByZXR1
cm4gc25kX3BjbV9od19jb25zdHJhaW50X2xpc3Qoc3Vic3RyZWFtLT5ydW50aW1lLCAwLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9IV19QQVJBTV9SQVRFLCAmY29uc3RyYWlu
dHNfcmF0ZXMpOwo+ICB9Cj4gLS0KPiAyLjIzLjAuMzUxLmdjNDMxNzAzMmU2LWdvb2cKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
