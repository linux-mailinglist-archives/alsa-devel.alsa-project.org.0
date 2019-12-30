Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DEE12D408
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Dec 2019 20:39:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B2616DA;
	Mon, 30 Dec 2019 20:38:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B2616DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577734744;
	bh=YAsITj9ofvvJYdZ8Upg+PmM+P+wYI6GKxVvYQ8GpdlA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vf9ABbYHLcc8alMbWDUZUt6cZo1VicvA6PvfXg8WebyJ+LF7mHLplTGxPUUtYwXKT
	 nBbUSEBr5oiLBdIRzIeboNob7k5plVXyV9F05Ly08TjjuSnf7auaVjXCk9XK+Fojmj
	 YOP8oYFx3q3IZTkuq4t98R0kChQfMSKsj+KbddFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC0EEF8015F;
	Mon, 30 Dec 2019 20:37:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88076F8015D; Mon, 30 Dec 2019 20:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A741BF8011E
 for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2019 20:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A741BF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TOAZ66X1"
Received: by mail-lf1-x141.google.com with SMTP id y19so25755652lfl.9
 for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2019 11:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qOOSKaKHeFnod5RsK2x90NOSdkdcsmV7T1nxZJUbNFM=;
 b=TOAZ66X1HMUwmsDMiHpQaMSWjWbrMckRdF29Qmkw7WUdjCLexTFaLygZn8cL9rW5i9
 u2nmP4MGXAdzM0V0vWb85sv0RkLb+sc2jJhz7mF9tJVpf5W5VR9tqxPD4Ee0550aYaaB
 3wA9OdqVgQ6eN3NMBX/IPlw8gPc4WmGEmxVt2+Ze6lJB7g8edNyM7l7ObYvqwMgvkyRp
 LpVqziMyB7SbH3CCkTDL9J0gfxSHQPbZN0W3lQk3cwNHRflk4wNHe3EBHN4D/JU5Vawv
 /M21K4hjE5XCMVwZVwQCvzBA/zESjM0aS9G1mluJAS1TxItdyZPOM+DYk9yniyZHx3aE
 bLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qOOSKaKHeFnod5RsK2x90NOSdkdcsmV7T1nxZJUbNFM=;
 b=RaGPvHCOzfYxzbaRsDeJEML08eBeIjo7pwYcwKbf3sGrHM1eIEIrsKIFpy5J13d9bs
 c2YsEPhVGd1eldDBJIDj8VP0hzKEi1a39NdNkPiLgBdMawOK1u/Dq9R29DuaAJbb2nnc
 N48sbCiX3OoGdpJl5PKK0cc/+k0azhjKu3ul4QEizigVYwoqCrY0PTxYRTH5fyaXa1Y+
 x24o39waJ32+iKTaGewTwLx4S8UShLedb1XX674PTWNJrOw9Y7/vuW/rShxo9eS2Yb5G
 nLK4iiyvSHYJmt0TxBzdxJjq5ixUiD6XwBTJTcPvGFCWWjF+Ub97yuNeInIVL+Hqk9h/
 MgVg==
X-Gm-Message-State: APjAAAX+i4zPYcllK3C0eyu4iAexZGUvFjLHq2D71d8GdPj7glt/jZ4U
 IyeIiizStRP6NTzJaw0fB+I=
X-Google-Smtp-Source: APXvYqxazqU9rDtT0rPVHMMgwW7B4Kv0P8Jgclqa/eU938P2WNSQlrWfofGwQnG/j+Id1P8xPxj4ag==
X-Received: by 2002:ac2:41c8:: with SMTP id d8mr38454027lfi.65.1577734626358; 
 Mon, 30 Dec 2019 11:37:06 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id m15sm18353822ljg.4.2019.12.30.11.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 11:37:04 -0800 (PST)
To: Takashi Iwai <tiwai@suse.de>
References: <20191229150454.2127-1-digetx@gmail.com>
 <s5hh81i47a5.wl-tiwai@suse.de>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <68754394-fb34-b109-264a-98f36d05ff2a@gmail.com>
Date: Mon, 30 Dec 2019 22:37:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <s5hh81i47a5.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Bard Liao <bardliao@realtek.com>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: rt5640: Fix NULL dereference on
	module unload
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

MzAuMTIuMjAxOSAxMDoxMSwgVGFrYXNoaSBJd2FpINC/0LjRiNC10YI6Cj4gT24gU3VuLCAyOSBE
ZWMgMjAxOSAxNjowNDo1NCArMDEwMCwKPiBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Cj4+IFRo
ZSBydDU2NDAtPmphY2sgaXMgTlVMTCBpZiBqYWNrIGlzIGFscmVhZHkgZGlzYWJsZWQgYXQgdGhl
IHRpbWUgb2YKPj4gZHJpdmVyJ3MgbW9kdWxlIHVubG9hZGluZy4KPj4KPj4gIFVuYWJsZSB0byBo
YW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3Mg
MDAwMDAwMjQKPj4gIC4uLgo+PiAgKHJ0NTY0MF9zZXRfamFjayBbc25kX3NvY19ydDU2NDBdKSBm
cm9tIFs8YmY4NmY3ZWQ+XSAoc25kX3NvY19jb21wb25lbnRfc2V0X2phY2srMHgxMS8weDFjIFtz
bmRfc29jX2NvcmVdKQo+PiAgKHNuZF9zb2NfY29tcG9uZW50X3NldF9qYWNrIFtzbmRfc29jX2Nv
cmVdKSBmcm9tIFs8YmY4Njc1Y2Y+XSAoc29jX3JlbW92ZV9jb21wb25lbnQrMHgxYi8weDU0IFtz
bmRfc29jX2NvcmVdKQo+PiAgKHNvY19yZW1vdmVfY29tcG9uZW50IFtzbmRfc29jX2NvcmVdKSBm
cm9tIFs8YmY4Njg4NTk+XSAoc29jX2NsZWFudXBfY2FyZF9yZXNvdXJjZXMrMHhhZC8weDFjYyBb
c25kX3NvY19jb3JlXSkKPj4gIChzb2NfY2xlYW51cF9jYXJkX3Jlc291cmNlcyBbc25kX3NvY19j
b3JlXSkgZnJvbSBbPGJmODY5NDVmPl0gKHNuZF9zb2NfdW5yZWdpc3Rlcl9jYXJkKzB4NDcvMHg3
OCBbc25kX3NvY19jb3JlXSkKPj4gIChzbmRfc29jX3VucmVnaXN0ZXJfY2FyZCBbc25kX3NvY19j
b3JlXSkgZnJvbSBbPGJmOGI0MDEzPl0gKHRlZ3JhX3J0NTY0MF9yZW1vdmUrMHgxMy8weDFjIFtz
bmRfc29jX3RlZ3JhX3J0NTY0MF0pCj4+ICAodGVncmFfcnQ1NjQwX3JlbW92ZSBbc25kX3NvY190
ZWdyYV9ydDU2NDBdKSBmcm9tIFs8YzA1MTZkMmY+XSAocGxhdGZvcm1fZHJ2X3JlbW92ZSsweDE3
LzB4MjQpCj4+ICAocGxhdGZvcm1fZHJ2X3JlbW92ZSkgZnJvbSBbPGMwNTE1YWVkPl0gKGRldmlj
ZV9yZWxlYXNlX2RyaXZlcl9pbnRlcm5hbCsweDk1LzB4MTE0KQo+PiAgKGRldmljZV9yZWxlYXNl
X2RyaXZlcl9pbnRlcm5hbCkgZnJvbSBbPGMwNTE1YmQ5Pl0gKGRyaXZlcl9kZXRhY2grMHg0ZC8w
eDkwKQo+PiAgKGRyaXZlcl9kZXRhY2gpIGZyb20gWzxjMDUxNGQ1OT5dIChidXNfcmVtb3ZlX2Ry
aXZlcisweDMxLzB4NzApCj4+ICAoYnVzX3JlbW92ZV9kcml2ZXIpIGZyb20gWzxiZjhiNDIxNT5d
ICh0ZWdyYV9ydDU2NDBfZHJpdmVyX2V4aXQrMHg5LzB4ZGY0IFtzbmRfc29jX3RlZ3JhX3J0NTY0
MF0pCj4+ICAodGVncmFfcnQ1NjQwX2RyaXZlcl9leGl0IFtzbmRfc29jX3RlZ3JhX3J0NTY0MF0p
IGZyb20gWzxjMDE5MzM2Zj5dIChzeXNfZGVsZXRlX21vZHVsZSsweGU3LzB4MTg0KQo+PiAgKHN5
c19kZWxldGVfbW9kdWxlKSBmcm9tIFs8YzAxMDEwMDE+XSAocmV0X2Zhc3Rfc3lzY2FsbCsweDEv
MHgyOCkKPj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwu
Y29tPgo+PiAtLS0KPj4gIHNvdW5kL3NvYy9jb2RlY3MvcnQ1NjQwLmMgfCAyMiArKysrKysrKysr
KysrKy0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjQwLmMgYi9z
b3VuZC9zb2MvY29kZWNzL3J0NTY0MC5jCj4+IGluZGV4IGFkYmFlMWYzNmE4YS4uYjI0NWM0NGNh
ZmJjIDEwMDY0NAo+PiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3J0NTY0MC5jCj4+ICsrKyBiL3Nv
dW5kL3NvYy9jb2RlY3MvcnQ1NjQwLmMKPj4gQEAgLTI0MzIsMTYgKzI0MzIsMjIgQEAgc3RhdGlj
IHZvaWQgcnQ1NjQwX2Rpc2FibGVfamFja19kZXRlY3Qoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50
ICpjb21wb25lbnQpCj4+ICB7Cj4+ICAJc3RydWN0IHJ0NTY0MF9wcml2ICpydDU2NDAgPSBzbmRf
c29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOwo+PiAgCj4+IC0JZGlzYWJsZV9p
cnEocnQ1NjQwLT5pcnEpOwo+PiAtCXJ0NTY0MF9jYW5jZWxfd29yayhydDU2NDApOwo+PiArCS8q
Cj4+ICsJICogc29jX3JlbW92ZV9jb21wb25lbnQoKSBmb3JjZS1kaXNhYmxlcyBqYWNrIGFuZCB0
aHVzIHJ0NTY0MC0+amFjawo+PiArCSAqIGNvdWxkIGJlIE5VTEwgYXQgdGhlIHRpbWUgb2YgZHJp
dmVyJ3MgbW9kdWxlIHVubG9hZGluZy4KPj4gKwkgKi8KPj4gKwlpZiAocnQ1NjQwLT5qYWNrKSB7
Cj4+ICsJCWRpc2FibGVfaXJxKHJ0NTY0MC0+aXJxKTsKPj4gKwkJcnQ1NjQwX2NhbmNlbF93b3Jr
KHJ0NTY0MCk7Cj4+ICAKPj4gLQlpZiAocnQ1NjQwLT5qYWNrLT5zdGF0dXMgJiBTTkRfSkFDS19N
SUNST1BIT05FKSB7Cj4+IC0JCXJ0NTY0MF9kaXNhYmxlX21pY2JpYXMxX292Y2RfaXJxKGNvbXBv
bmVudCk7Cj4+IC0JCXJ0NTY0MF9kaXNhYmxlX21pY2JpYXMxX2Zvcl9vdmNkKGNvbXBvbmVudCk7
Cj4+IC0JCXNuZF9zb2NfamFja19yZXBvcnQocnQ1NjQwLT5qYWNrLCAwLCBTTkRfSkFDS19CVE5f
MCk7Cj4+IC0JfQo+PiArCQlpZiAocnQ1NjQwLT5qYWNrLT5zdGF0dXMgJiBTTkRfSkFDS19NSUNS
T1BIT05FKSB7Cj4+ICsJCQlydDU2NDBfZGlzYWJsZV9taWNiaWFzMV9vdmNkX2lycShjb21wb25l
bnQpOwo+PiArCQkJcnQ1NjQwX2Rpc2FibGVfbWljYmlhczFfZm9yX292Y2QoY29tcG9uZW50KTsK
Pj4gKwkJCXNuZF9zb2NfamFja19yZXBvcnQocnQ1NjQwLT5qYWNrLCAwLCBTTkRfSkFDS19CVE5f
MCk7Cj4+ICsJCX0KPj4gIAo+PiAtCXJ0NTY0MC0+amFjayA9IE5VTEw7Cj4+ICsJCXJ0NTY0MC0+
amFjayA9IE5VTEw7Cj4+ICsJfQo+PiAgfQo+IAo+IEkgZ3Vlc3MgaXQncyBzaW1wbGVyIGp1c3Qg
cmV0dXJuaW5nIGlmIHJ0NTY0MC0+amFjayBpcyBhbHJlYWR5IE5VTEwuCj4gCj4gLS0tIGEvc291
bmQvc29jL2NvZGVjcy9ydDU2NDAuYwo+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjQwLmMK
PiBAQCAtMjQzMiw2ICsyNDMyLDEwIEBAIHN0YXRpYyB2b2lkIHJ0NTY0MF9kaXNhYmxlX2phY2tf
ZGV0ZWN0KHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50KQo+ICB7Cj4gIAlzdHJ1
Y3QgcnQ1NjQwX3ByaXYgKnJ0NTY0MCA9IHNuZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNv
bXBvbmVudCk7Cj4gIAo+ICsJLyogYWxyZWFkeSBkaXNhYmxlZD8gKi8KPiArCWlmICghcnQ1NjQw
LT5qYWNrKQo+ICsJCXJldHVybjsKPiArCj4gIAlkaXNhYmxlX2lycShydDU2NDAtPmlycSk7Cj4g
IAlydDU2NDBfY2FuY2VsX3dvcmsocnQ1NjQwKTsKPiAgCj4gCj4gdGhhbmtzLAo+IAo+IFRha2Fz
aGkKPiAKCk9rYXksIEknbGwgbWFrZSB2Mi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYWxzYS1kZXZlbAo=
