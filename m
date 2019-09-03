Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E13FA7231
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 20:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CD0B16AC;
	Tue,  3 Sep 2019 20:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CD0B16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567533828;
	bh=2ZApXU0Z4sUEc/pbD5yz7y5Rs/sVmmnpehjjc1kPjFs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxskvEpM+JaUI5g2BlsSvwwruxFUeM2L667iiKN45bZ2wfyFDq71EWQpRWM2nlBHM
	 W4nogT2haiTgkbo5RG1zQqE+94Kj9oPBgT+vieeaj533FbO/MBfHvAACJy3sjQtfxu
	 GPO5lKu7Rx7GLbW+0+vkiIuxIAZ5GACCixTneCP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B231F805F7;
	Tue,  3 Sep 2019 20:00:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09096F80392; Tue,  3 Sep 2019 20:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_13,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF82CF80392
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 20:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF82CF80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="a6trZidW"
Received: by mail-wr1-x443.google.com with SMTP id z11so18458285wrt.4
 for <alsa-devel@alsa-project.org>; Tue, 03 Sep 2019 11:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=37SefE7uDW3/2543D3S+Jjxtsd+Rc7zPMQ8aAVy3HYY=;
 b=a6trZidWLAU9k7WRqdOQkCp9IdBEaDzcgHqsL+Wg97VV82pRlcP/uF/Jq3uAPV0B21
 sZ+2b9hn6RiyX3XhHnNaYqno6BP9dPMStmpZMAYVv2v7nCf5yt2ZtVJi6APjmy0gHVQu
 1V6ubbF5EwXHl+ub5YSr/oDKcc1c8VXqK5hcGcaAckmrT5y6UIoQnVsLWcYtWJC6JidG
 FzCF4eFaQM9DbZDOPe+qkEimC5KRhKwxWihBUoTwqPMYKrhGm3uVpICEIMWurhFwuftm
 OpxFJ+ksniPK9AfZAMnAMDM55S36oWoCjHAIY8pb1TZAHL1cYwHhZZprWAXlO0QHKBsL
 nTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=37SefE7uDW3/2543D3S+Jjxtsd+Rc7zPMQ8aAVy3HYY=;
 b=W/8BcVNzManolU8SXdG6nKMYVURgimz256vl+9iuI40z1aK28v7RgQDGp1LPODZ9dg
 0M86Ej1oLr4lnutnxF2dndnt/gTM0GeA8nsChrYLyidVZ5TIHcaVfk2ItjOLsOKqyjaZ
 tuD5M31c108uDHT2fbnrvVozSJXgC4tzKmp+DtbYNLu9BrA79SmK6MwQLD9f/7L9mZEk
 kj0H7H6a04+zClunSXyEzqMW0wN2x6tjejRimbGEMJJDuyCtNDOZwJvmZcR/FPib90H+
 06yjFt6sZL6jfcXaXpOdRQh5rlveS7lpJYCrqc+Z8ufcEtWAllJZGquojVtuVLhNMQtY
 x57w==
X-Gm-Message-State: APjAAAUccwC11ePwjYIc6so2C/+W9lPDDuFefJiMrQKHPF6geqNRqOZ0
 MeOTzKbYQ/Zb4mkdHfkOa8ux9g==
X-Google-Smtp-Source: APXvYqxw3MV79DlvDFQWO4+qFsE5JSOgoXa8EiuxVbez3UimtQqAtUACsAkfp1LMmbPSsVF3pmpGBw==
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr2224852wrx.309.1567533636499; 
 Tue, 03 Sep 2019 11:00:36 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id v6sm473623wma.24.2019.09.03.11.00.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 11:00:35 -0700 (PDT)
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>
References: <20190903055103.134764-1-cychiang@chromium.org>
 <e1c3483c-baa6-c726-e547-fadf40d259f4@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <d8a80ba5-dd2b-f84d-bbfc-9dd5ccbc26e9@baylibre.com>
Date: Tue, 3 Sep 2019 20:00:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <e1c3483c-baa6-c726-e547-fadf40d259f4@baylibre.com>
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org, zhengxing@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, sam@ravnborg.org, jeffy.chen@rock-chips.com,
 dianders@chromium.org, cain.cai@rock-chips.com, a.hajda@samsung.com,
 eddie.cai@rock-chips.com, Laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 Yakir Yang <ykk@rock-chips.com>, enric.balletbo@collabora.com,
 dgreid@chromium.org, kuankuan.y@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] drm: bridge/dw_hdmi: add audio sample
 channel status setting
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

SGksCgpMZSAwMy8wOS8yMDE5IMOgIDExOjUzLCBOZWlsIEFybXN0cm9uZyBhIMOpY3JpdCA6Cj4g
SGksCj4gCj4gT24gMDMvMDkvMjAxOSAwNzo1MSwgQ2hlbmctWWkgQ2hpYW5nIHdyb3RlOgo+PiBG
cm9tOiBZYWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Cj4+Cj4+IFdoZW4gdHJhbnNtaXR0
aW5nIElFQzYwOTg1IGxpbmVhciBQQ00gYXVkaW8sIHdlIGNvbmZpZ3VyZSB0aGUKPj4gQXVkaW8g
U2FtcGxlIENoYW5uZWwgU3RhdHVzIGluZm9ybWF0aW9uIG9mIGFsbCB0aGUgY2hhbm5lbAo+PiBz
dGF0dXMgYml0cyBpbiB0aGUgSUVDNjA5NTggZnJhbWUuCj4+IFJlZmVyIHRvIDYwOTU4LTMgcGFn
ZSAxMCBmb3IgZnJlcXVlbmN5LCBvcmlnaW5hbCBmcmVxdWVuY3ksIGFuZAo+PiB3b3JkbGVuZ3Ro
IHNldHRpbmcuCj4+Cj4+IFRoaXMgZml4IHRoZSBpc3N1ZSB0aGF0IGF1ZGlvIGRvZXMgbm90IGNv
bWUgb3V0IG9uIHNvbWUgbW9uaXRvcnMKPj4gKGUuZy4gTEcgMjJDVjI0MSkKPj4KPj4gU2lnbmVk
LW9mZi1ieTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNocm9taXVtLm9yZz4KPj4gLS0tCj4+ICBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDU5ICsrKysrKysrKysrKysr
KysrKysrKysrCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCB8
IDIwICsrKysrKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPj4gaW5kZXggYmQ2NWQw
NDc5NjgzLi4zNGQ0NmUyNWQ2MTAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jCj4+IEBAIC01ODIsNiArNTgyLDYzIEBAIHN0YXRpYyB1bnNpZ25lZCBp
bnQgaGRtaV9jb21wdXRlX24odW5zaWduZWQgaW50IGZyZXEsIHVuc2lnbmVkIGxvbmcgcGl4ZWxf
Y2xrKQo+PiAgCXJldHVybiBuOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgdm9pZCBoZG1pX3NldF9z
Y2hubChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPj4gK3sKPj4gKwl1OCBhdWRfc2Nobmxfc2FtcGxl
cmF0ZTsKPj4gKwl1OCBhdWRfc2NobmxfODsKPj4gKwo+PiArCS8qIFRoZXNlIHJlZ2lzdGVycyBh
cmUgb24gUkszMjg4IHVzaW5nIHZlcnNpb24gMi4wYS4gKi8KPj4gKwlpZiAoaGRtaS0+dmVyc2lv
biAhPSAweDIwMGEpCj4+ICsJCXJldHVybjsKPiAKPiBBcmUgdGhlc2UgbGltaXRlZCB0byB0aGUg
Mi4wYSB2ZXJzaW9uICppbiogUkszMjg4LCBvciAyLjBhIHZlcnNpb24gb24gYWxsCj4gU29DcyA/
CgpBZnRlciBpbnZlc3RpZ2F0aW9ucywgQW1sb2dpYyBzZXRzIHRoZXNlIHJlZ2lzdGVycyBvbiB0
aGVpciAyLjBhIHZlcnNpb24KYXN3ZWxsLCBhbmQgSmVybmVqIChhZGRlZCBpbiBDYykgcmVwb3J0
ZWQgbWUgQWxsd2lubmVyIHNldHMgdGhlbSBvbiB0aGVpcgo8IDIuMGEgYW5kID4gMi4wYSBJUHMg
dmVyc2lvbnMuCgpDYW4geW91IGNoZWNrIG9uIHRoZSBSb2NrY2hpcCBJUCB2ZXJzaW9ucyBpbiBS
SzMzOTkgPwoKRm9yIHJlZmVyZW5jZSwgdGhlIEhETUkgMS40YSBJUCB2ZXJzaW9uIGFsbHdpbm5l
ciBzZXR1cHMgaXM6Cmh0dHBzOi8vZ2l0aHViLmNvbS9BbGx3aW5uZXItSG9tbGV0L0gzLUJTUDQu
NC1saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnhpL2Rpc3AyL2hkbWkv
aGRtaV9ic3Bfc3VuOGl3Ny5jI0w1MzEtTDUzOQoocmVnaXN0ZXJzIGEgInNjcmFtYmxlZCIgYnV0
IGEgY3VzdG9tIGJpdCBjYW4gcmVzZXQgdG8gdGhlIG9yaWdpbmFsIG1hcHBpbmcsCjB4MTA2NiAu
Li4gMHgxMDZmKQoKTmVpbAoKPiAKPj4gKwo+PiArCXN3aXRjaCAoaGRtaS0+c2FtcGxlX3JhdGUp
IHsKPj4gKwljYXNlIDMyMDAwOgo+PiArCQlhdWRfc2Nobmxfc2FtcGxlcmF0ZSA9IEhETUlfRkNf
QVVEU0NITkxTN19TTVBSQVRFXzMySzsKPj4gKwkJYnJlYWs7Cj4+ICsJY2FzZSA0NDEwMDoKPj4g
KwkJYXVkX3NjaG5sX3NhbXBsZXJhdGUgPSBIRE1JX0ZDX0FVRFNDSE5MUzdfU01QUkFURV80NEsx
Owo+PiArCQlicmVhazsKPj4gKwljYXNlIDQ4MDAwOgo+PiArCQlhdWRfc2Nobmxfc2FtcGxlcmF0
ZSA9IEhETUlfRkNfQVVEU0NITkxTN19TTVBSQVRFXzQ4SzsKPj4gKwkJYnJlYWs7Cj4+ICsJY2Fz
ZSA4ODIwMDoKPj4gKwkJYXVkX3NjaG5sX3NhbXBsZXJhdGUgPSBIRE1JX0ZDX0FVRFNDSE5MUzdf
U01QUkFURV84OEsyOwo+PiArCQlicmVhazsKPj4gKwljYXNlIDk2MDAwOgo+PiArCQlhdWRfc2No
bmxfc2FtcGxlcmF0ZSA9IEhETUlfRkNfQVVEU0NITkxTN19TTVBSQVRFXzk2SzsKPj4gKwkJYnJl
YWs7Cj4+ICsJY2FzZSAxNzY0MDA6Cj4+ICsJCWF1ZF9zY2hubF9zYW1wbGVyYXRlID0gSERNSV9G
Q19BVURTQ0hOTFM3X1NNUFJBVEVfMTc2SzQ7Cj4+ICsJCWJyZWFrOwo+PiArCWNhc2UgMTkyMDAw
Ogo+PiArCQlhdWRfc2Nobmxfc2FtcGxlcmF0ZSA9IEhETUlfRkNfQVVEU0NITkxTN19TTVBSQVRF
XzE5Mks7Cj4+ICsJCWJyZWFrOwo+PiArCWNhc2UgNzY4MDAwOgo+PiArCQlhdWRfc2Nobmxfc2Ft
cGxlcmF0ZSA9IEhETUlfRkNfQVVEU0NITkxTN19TTVBSQVRFXzc2OEs7Cj4+ICsJCWJyZWFrOwo+
PiArCWRlZmF1bHQ6Cj4+ICsJCWRldl93YXJuKGhkbWktPmRldiwgIlVuc3VwcG9ydGVkIGF1ZGlv
IHNhbXBsZSByYXRlICgldSlcbiIsCj4+ICsJCQkgaGRtaS0+c2FtcGxlX3JhdGUpOwo+PiArCQly
ZXR1cm47Cj4+ICsJfQo+PiArCj4+ICsJLyogc2V0IGNoYW5uZWwgc3RhdHVzIHJlZ2lzdGVyICov
Cj4+ICsJaGRtaV9tb2RiKGhkbWksIGF1ZF9zY2hubF9zYW1wbGVyYXRlLCBIRE1JX0ZDX0FVRFND
SE5MUzdfU01QUkFURV9NQVNLLAo+PiArCQkgIEhETUlfRkNfQVVEU0NITkxTNyk7Cj4+ICsKPj4g
KwkvKgo+PiArCSAqIFNldCBvcmlnaW5hbCBmcmVxdWVuY3kgdG8gYmUgdGhlIHNhbWUgYXMgZnJl
cXVlbmN5Lgo+PiArCSAqIFVzZSBvbmUtY29tcGxlbWVudCB2YWx1ZSBhcyBzdGF0ZWQgaW4gSUVD
NjA5NTgtMyBwYWdlIDEzLgo+PiArCSAqLwo+PiArCWF1ZF9zY2hubF84ID0gKH5hdWRfc2Nobmxf
c2FtcGxlcmF0ZSkgPDwKPj4gKwkJCUhETUlfRkNfQVVEU0NITkxTOF9PUklHU0FNUEZSRVFfT0ZG
U0VUOwo+PiArCj4+ICsJLyogVGhpcyBtZWFucyB3b3JkIGxlbmd0aCBpcyAxNiBiaXQuIFJlZmVy
IHRvIElFQzYwOTU4LTMgcGFnZSAxMi4gKi8KPj4gKwlhdWRfc2NobmxfOCB8PSAyIDw8IEhETUlf
RkNfQVVEU0NITkxTOF9XT1JETEVHTlRIX09GRlNFVDsKPj4gKwo+PiArCWhkbWlfd3JpdGViKGhk
bWksIGF1ZF9zY2hubF84LCBIRE1JX0ZDX0FVRFNDSE5MUzgpOwo+PiArfQo+PiArCj4+ICBzdGF0
aWMgdm9pZCBoZG1pX3NldF9jbGtfcmVnZW5lcmF0b3Ioc3RydWN0IGR3X2hkbWkgKmhkbWksCj4+
ICAJdW5zaWduZWQgbG9uZyBwaXhlbF9jbGssIHVuc2lnbmVkIGludCBzYW1wbGVfcmF0ZSkKPj4g
IHsKPj4gQEAgLTYyMCw2ICs2NzcsOCBAQCBzdGF0aWMgdm9pZCBoZG1pX3NldF9jbGtfcmVnZW5l
cmF0b3Ioc3RydWN0IGR3X2hkbWkgKmhkbWksCj4+ICAJaGRtaS0+YXVkaW9fY3RzID0gY3RzOwo+
PiAgCWhkbWlfc2V0X2N0c19uKGhkbWksIGN0cywgaGRtaS0+YXVkaW9fZW5hYmxlID8gbiA6IDAp
Owo+PiAgCXNwaW5fdW5sb2NrX2lycSgmaGRtaS0+YXVkaW9fbG9jayk7Cj4+ICsKPj4gKwloZG1p
X3NldF9zY2hubChoZG1pKTsKPj4gIH0KPj4gIAo+PiAgc3RhdGljIHZvaWQgaGRtaV9pbml0X2Ns
a19yZWdlbmVyYXRvcihzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5oIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmgKPj4gaW5kZXggNjk4OGYxMmQ4OWQ5Li42MTllYmMxYzgz
NTQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5oCj4+
IEBAIC0xNTgsNiArMTU4LDE3IEBACj4+ICAjZGVmaW5lIEhETUlfRkNfU1BEREVWSUNFSU5GICAg
ICAgICAgICAgICAgICAgICAweDEwNjIKPj4gICNkZWZpbmUgSERNSV9GQ19BVURTQ09ORiAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MTA2Mwo+PiAgI2RlZmluZSBIRE1JX0ZDX0FVRFNTVEFUICAg
ICAgICAgICAgICAgICAgICAgICAgMHgxMDY0Cj4+ICsjZGVmaW5lIEhETUlfRkNfQVVEU1YgICAg
ICAgICAgICAgICAgICAgICAgICAgICAweDEwNjUKPj4gKyNkZWZpbmUgSERNSV9GQ19BVURTVSAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDB4MTA2Ngo+PiArI2RlZmluZSBIRE1JX0ZDX0FVRFND
SE5MUzAgICAgICAgICAgICAgICAgICAgICAgMHgxMDY3Cj4+ICsjZGVmaW5lIEhETUlfRkNfQVVE
U0NITkxTMSAgICAgICAgICAgICAgICAgICAgICAweDEwNjgKPj4gKyNkZWZpbmUgSERNSV9GQ19B
VURTQ0hOTFMyICAgICAgICAgICAgICAgICAgICAgIDB4MTA2OQo+PiArI2RlZmluZSBIRE1JX0ZD
X0FVRFNDSE5MUzMgICAgICAgICAgICAgICAgICAgICAgMHgxMDZhCj4+ICsjZGVmaW5lIEhETUlf
RkNfQVVEU0NITkxTNCAgICAgICAgICAgICAgICAgICAgICAweDEwNmIKPj4gKyNkZWZpbmUgSERN
SV9GQ19BVURTQ0hOTFM1ICAgICAgICAgICAgICAgICAgICAgIDB4MTA2Ywo+PiArI2RlZmluZSBI
RE1JX0ZDX0FVRFNDSE5MUzYgICAgICAgICAgICAgICAgICAgICAgMHgxMDZkCj4+ICsjZGVmaW5l
IEhETUlfRkNfQVVEU0NITkxTNyAgICAgICAgICAgICAgICAgICAgICAweDEwNmUKPj4gKyNkZWZp
bmUgSERNSV9GQ19BVURTQ0hOTFM4ICAgICAgICAgICAgICAgICAgICAgIDB4MTA2Zgo+PiAgI2Rl
ZmluZSBIRE1JX0ZDX0RBVEFDSDBGSUxMICAgICAgICAgICAgICAgICAgICAgMHgxMDcwCj4+ICAj
ZGVmaW5lIEhETUlfRkNfREFUQUNIMUZJTEwgICAgICAgICAgICAgICAgICAgICAweDEwNzEKPj4g
ICNkZWZpbmUgSERNSV9GQ19EQVRBQ0gyRklMTCAgICAgICAgICAgICAgICAgICAgIDB4MTA3Mgo+
PiBAQCAtNzA2LDYgKzcxNywxNSBAQCBlbnVtIHsKPj4gIC8qIEhETUlfRkNfQVVEU0NITkxTNyBm
aWVsZCB2YWx1ZXMgKi8KPj4gIAlIRE1JX0ZDX0FVRFNDSE5MUzdfQUNDVVJBQ1lfT0ZGU0VUID0g
NCwKPj4gIAlIRE1JX0ZDX0FVRFNDSE5MUzdfQUNDVVJBQ1lfTUFTSyA9IDB4MzAsCj4+ICsJSERN
SV9GQ19BVURTQ0hOTFM3X1NNUFJBVEVfTUFTSyA9IDB4MGYsCj4+ICsJSERNSV9GQ19BVURTQ0hO
TFM3X1NNUFJBVEVfMTkySyA9IDB4ZSwKPj4gKwlIRE1JX0ZDX0FVRFNDSE5MUzdfU01QUkFURV8x
NzZLNCA9IDB4YywKPj4gKwlIRE1JX0ZDX0FVRFNDSE5MUzdfU01QUkFURV85NksgPSAweGEsCj4+
ICsJSERNSV9GQ19BVURTQ0hOTFM3X1NNUFJBVEVfNzY4SyA9IDB4OSwKPj4gKwlIRE1JX0ZDX0FV
RFNDSE5MUzdfU01QUkFURV84OEsyID0gMHg4LAo+PiArCUhETUlfRkNfQVVEU0NITkxTN19TTVBS
QVRFXzMySyA9IDB4MywKPj4gKwlIRE1JX0ZDX0FVRFNDSE5MUzdfU01QUkFURV80OEsgPSAweDIs
Cj4+ICsJSERNSV9GQ19BVURTQ0hOTFM3X1NNUFJBVEVfNDRLMSA9IDB4MCwKPj4gIAo+PiAgLyog
SERNSV9GQ19BVURTQ0hOTFM4IGZpZWxkIHZhbHVlcyAqLwo+PiAgCUhETUlfRkNfQVVEU0NITkxT
OF9PUklHU0FNUEZSRVFfTUFTSyA9IDB4ZjAsCj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
