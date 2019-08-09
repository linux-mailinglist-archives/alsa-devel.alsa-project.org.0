Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CE487687
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 11:47:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4DF86E;
	Fri,  9 Aug 2019 11:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4DF86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565344074;
	bh=x/WNabtIs7Nxyu8NFl7zw1zqjNu+92j797e7jF6MTiY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lLc+HMIn48rHpARPHZz05Xp6xf5fdQz1NSw4q+3zNYsdXqryPkCc2as2ZOAo9iHDX
	 DLFA9biP9oeyzHxle9YbfQ08yTuR0GsRUTclBCXWHozfgKvOnw++ETVqj6tfU5K0DG
	 Xwy0ae5JIDI6EkaUaoDoaIW7XV/PxxXskFx1sWyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D665F803F3;
	Fri,  9 Aug 2019 11:46:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E445F803F3; Fri,  9 Aug 2019 11:46:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F040F800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 11:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F040F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hXXW58my"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x799k0SY044948;
 Fri, 9 Aug 2019 04:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565343961;
 bh=VAUibKQ17FtHu/o4K4gEdwvBb3ykAgS8C0kyYmuqJMs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hXXW58myDR7rgmzMIjsAZD++YVOvCKNjejY/gfIIja0DvxxQzuhgOYFWe4Cu0+t3n
 n6MkScmoZTCEn3nM6PZLcsz8ebZOranyordjvcUk4PD+azp6l8WwPWfXu4FmJKQkY6
 gs7fZExbxGszCZVok0rblWq1b2txmfg17CUMcWEQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x799k0Px064636
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 9 Aug 2019 04:46:00 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 04:45:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 04:45:59 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x799jreR115516;
 Fri, 9 Aug 2019 04:45:54 -0500
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
References: <87zhkk6wdy.wl-kuninori.morimoto.gx@renesas.com>
 <87imr86w96.wl-kuninori.morimoto.gx@renesas.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <09cd9fa0-28da-3e0e-3ad0-92a2a8598f28@ti.com>
Date: Fri, 9 Aug 2019 12:46:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87imr86w96.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Jie Yang <yang.jie@linux.intel.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Richard Fontana <rfontana@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Georgii Staroselski i <georgii.staroselskii@emlid.com>,
 Danny Milosavljevic <dannym@scratchpost.org>,
 Hans de Goede <hdegoede@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alexios Zavras <alexios.zavras@intel.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH 12/15] ASoC: ti: rx51: use
 snd_soc_dai_link_component for aux_dev
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

CgpPbiAwOC8wOC8yMDE5IDguNTQsIEt1bmlub3JpIE1vcmltb3RvIHdyb3RlOgo+IEZyb206IEt1
bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KPiAKPiBX
ZSBjYW4gdXNlIHNuZF9zb2NfZGFpX2xpbmtfY29tcG9uZW50IHRvIHNwZWNpZnkgYXV4X2Rldi4K
PiBMZXQncyB1c2UgaXQuCgpBY2tlZC1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNp
QHRpLmNvbT4KCj4gCj4gU2lnbmVkLW9mZi1ieTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3Jp
Lm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+IC0tLQo+ICBzb3VuZC9zb2MvdGkvcng1MS5jIHwg
MTQgKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3RpL3J4NTEuYyBiL3NvdW5k
L3NvYy90aS9yeDUxLmMKPiBpbmRleCBjY2QwZThhLi41ODhmNjgwIDEwMDY0NAo+IC0tLSBhL3Nv
dW5kL3NvYy90aS9yeDUxLmMKPiArKysgYi9zb3VuZC9zb2MvdGkvcng1MS5jCj4gQEAgLTMxOSwx
MiArMzE5LDEwIEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfbGluayByeDUxX2RhaVtdID0g
ewo+ICAKPiAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2F1eF9kZXYgcng1MV9hdXhfZGV2W10gPSB7
Cj4gIAl7Cj4gLQkJLm5hbWUgPSAiVExWMzIwQUlDMzRiIiwKPiAtCQkuY29kZWNfbmFtZSA9ICJ0
bHYzMjBhaWMzeC1jb2RlYy4yLTAwMTkiLAo+ICsJCS5kbGMgPSBDT01QX0FVWCgidGx2MzIwYWlj
M3gtY29kZWMuMi0wMDE5IiksCj4gIAl9LAo+ICAJewo+IC0JCS5uYW1lID0gIlRQQTYxMzIwQTIi
LAo+IC0JCS5jb2RlY19uYW1lID0gInRwYTYxMzBhMi4yLTAwNjAiLAo+ICsJCS5kbGMgPSBDT01Q
X0FVWCgidHBhNjEzMGEyLjItMDA2MCIpLAo+ICAJfSwKPiAgfTsKPiAgCj4gQEAgLTM5Nyw4ICsz
OTUsOCBAQCBzdGF0aWMgaW50IHJ4NTFfc29jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gIAkJCWRldl9lcnIoJnBkZXYtPmRldiwgIkF1eGlsaWFyeSBDb2RlYyBub2RlIGlz
IG5vdCBwcm92aWRlZFxuIik7Cj4gIAkJCXJldHVybiAtRUlOVkFMOwo+ICAJCX0KPiAtCQlyeDUx
X2F1eF9kZXZbMF0uY29kZWNfbmFtZSA9IE5VTEw7Cj4gLQkJcng1MV9hdXhfZGV2WzBdLmNvZGVj
X29mX25vZGUgPSBkYWlfbm9kZTsKPiArCQlyeDUxX2F1eF9kZXZbMF0uZGxjLm5hbWUgPSBOVUxM
Owo+ICsJCXJ4NTFfYXV4X2RldlswXS5kbGMub2Zfbm9kZSA9IGRhaV9ub2RlOwo+ICAJCXJ4NTFf
Y29kZWNfY29uZlswXS5kZXZfbmFtZSA9IE5VTEw7Cj4gIAkJcng1MV9jb2RlY19jb25mWzBdLm9m
X25vZGUgPSBkYWlfbm9kZTsKPiAgCj4gQEAgLTQwNyw4ICs0MDUsOCBAQCBzdGF0aWMgaW50IHJ4
NTFfc29jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJCWRldl9lcnIo
JnBkZXYtPmRldiwgIkhlYWRwaG9uZSBhbXBsaWZpZXIgbm9kZSBpcyBub3QgcHJvdmlkZWRcbiIp
Owo+ICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAgCQl9Cj4gLQkJcng1MV9hdXhfZGV2WzFdLmNvZGVj
X25hbWUgPSBOVUxMOwo+IC0JCXJ4NTFfYXV4X2RldlsxXS5jb2RlY19vZl9ub2RlID0gZGFpX25v
ZGU7Cj4gKwkJcng1MV9hdXhfZGV2WzFdLmRsYy5uYW1lID0gTlVMTDsKPiArCQlyeDUxX2F1eF9k
ZXZbMV0uZGxjLm9mX25vZGUgPSBkYWlfbm9kZTsKPiAgCQlyeDUxX2NvZGVjX2NvbmZbMV0uZGV2
X25hbWUgPSBOVUxMOwo+ICAJCXJ4NTFfY29kZWNfY29uZlsxXS5vZl9ub2RlID0gZGFpX25vZGU7
Cj4gIAl9Cj4gCgotIFDDqXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2th
bGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIx
LTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
