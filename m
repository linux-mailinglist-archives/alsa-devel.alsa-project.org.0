Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 196EC11A49E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 07:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93B55165F;
	Wed, 11 Dec 2019 07:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93B55165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576046468;
	bh=Fa4BGPdrGNe93H0ECVAGiMBkybdgUp3LQ++N++5Am9g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PTepyoEeC1QmMWcPIMbPfPKxmMbFQxCezEdscnahbIQN+mKT8m00niq28P37b2mDp
	 i7rF2PjW/4xdELESRnd9cXdQI9JlOfourZfHWQjS6Z7zuraA9whIyLsNgEAQPgt976
	 pjtj/QJuaERsBNwIwBszAY0wUSODuC8rTT9Xp/tQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE898F80240;
	Wed, 11 Dec 2019 07:38:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A086F8020C; Tue, 10 Dec 2019 18:42:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1689F8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 18:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1689F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="guhLgbks"
Received: by mail-lj1-x241.google.com with SMTP id c19so20801920lji.11
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 09:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QfJTKVdfbIy1QvA+crqjL/pZ+t72s8W0hogs96+o5qs=;
 b=guhLgbks/0Dffx9yG++K/APuJa0GiTUODnARKWEjQlrtff0bNQ4fps8W5gqhSA4S+M
 /jJ7inz4GrvMt7YtWaHmmh35YYv0/2DPkB5Fs1xhpdSjv+muAXdyyeYlxRiECqqzfDP1
 BKAo467YedEEwzsAwPwfUmBZ268AiJJyd4qU8hSrpuPlxylwAqLeDvRKSF4FFcM9MHRk
 2gMJMyfG8KM1EP/ocaXF7oGxGFB8DqbfLKZjzM7+Va1hgxQ7Ok7skqo1vR0RjVYXWzul
 WJS59rI3zyRWnMx4Ah19JBTnsp6wcZAxV9cVfH+nTE+RZovrNjtKssNWj7+XRofoO6VK
 Cyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QfJTKVdfbIy1QvA+crqjL/pZ+t72s8W0hogs96+o5qs=;
 b=aDkAfDZgUiKxADtEuFmIGRdTMwnPWHrkZG3C+AYME4zcj1feBbBzxGo09M1B8O5sEA
 9exvDeNtGGYOhynUCmi+TTcxyfIndhhtWdjr7bTxPIt2ZHpZY2jiyLbs0X2LGyM73Kju
 nUc8zHnjVewbg7kn4yjVmUsMlGsDBQEvLV9JSa8DjBgtUK++hReT71IHlAN8S9c5u6Rl
 E9AJD0HzAxBlZjdVFl3Vj+lYkKjW4p1mmXom42u5gqTZ5J/VlSal3bL0NqxfXUnCGaXC
 sMHpnAJUJcM+YOX9T5g5bBV2GJhim9LphcS9KJrHHbRprDjW4WnEJqmxEljsqYoKkkby
 myXw==
X-Gm-Message-State: APjAAAXe1Huc+2TGqZbq5ZGtGJ8SnP9JKJKFbXUIfrE+kBENasWVPFzA
 QNmTIpAQV6Ga7KizGed00uIGQvVj
X-Google-Smtp-Source: APXvYqylMr6Wle/q9f4QHc5wvwewu9vXCNgcbAHDny/NQFx/kBCZ735EOS5N4YgckKoIp8tomb6KTQ==
X-Received: by 2002:a2e:5751:: with SMTP id r17mr21566317ljd.254.1575999718425; 
 Tue, 10 Dec 2019 09:41:58 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id e8sm2586832ljb.45.2019.12.10.09.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 09:41:57 -0800 (PST)
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, sboyd@kernel.org,
 pdeschrijver@nvidia.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-4-git-send-email-skomatineni@nvidia.com>
 <7cf4ff77-2f33-4ee5-0e09-5aa6aef3e8be@gmail.com>
 <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
 <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
 <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
Date: Tue, 10 Dec 2019 20:41:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Dec 2019 07:38:39 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 mturquette@baylibre.com, lgirdwood@gmail.com, josephl@nvidia.com,
 linux-clk@vger.kernel.org, arnd@arndb.de, daniel.lezcano@linaro.org,
 krzk@kernel.org, spujar@nvidia.com, devicetree@vger.kernel.org,
 mmaddireddy@nvidia.com, markz@nvidia.com, alexios.zavras@intel.com,
 robh+dt@kernel.org, tiwai@suse.com, linux-tegra@vger.kernel.org,
 horms+renesas@verge.net.au, tglx@linutronix.de, allison@lohutok.net,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 Jisheng.Zhang@synaptics.com, broonie@kernel.org
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

MTAuMTIuMjAxOSAxOTo1MywgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IAo+IE9u
IDEyLzkvMTkgMzowMyBQTSwgU293amFueWEgS29tYXRpbmVuaSB3cm90ZToKPj4KPj4gT24gMTIv
OS8xOSAxMjo0NiBQTSwgU293amFueWEgS29tYXRpbmVuaSB3cm90ZToKPj4+Cj4+PiBPbiAxMi85
LzE5IDEyOjEyIFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4gMDguMTIuMjAxOSAwMDoz
NiwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+Pj4+PiBPbiAxMi83LzE5IDExOjU5
IEFNLCBTb3dqYW55YSBLb21hdGluZW5pIHdyb3RlOgo+Pj4+Pj4gT24gMTIvNy8xOSA4OjAwIEFN
LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+Pj4gMDcuMTIuMjAxOSAxODo1MywgRG1pdHJ5
IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+Pj4+Pj4+IDA3LjEyLjIwMTkgMTg6NDcsIERtaXRyeSBP
c2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4gMDcuMTIuMjAxOSAxNzoyOCwgRG1pdHJ5IE9z
aXBlbmtvINC/0LjRiNC10YI6Cj4+Pj4+Pj4+Pj4gMDYuMTIuMjAxOSAwNTo0OCwgU293amFueWEg
S29tYXRpbmVuaSDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4+PiBUZWdyYTIxMCBhbmQgcHJpb3IgVGVn
cmEgUE1DIGhhcyBjbGtfb3V0XzEsIGNsa19vdXRfMiwgY2xrX291dF8zCj4+Pj4+Pj4+Pj4+IHdp
dGgKPj4+Pj4+Pj4+Pj4gbXV4IGFuZCBnYXRlIGZvciBlYWNoIG9mIHRoZXNlIGNsb2Nrcy4KPj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gQ3VycmVudGx5IHRoZXNlIFBNQyBjbG9ja3MgYXJlIHJlZ2lz
dGVyZWQgYnkgVGVncmEgY2xvY2sgZHJpdmVyCj4+Pj4+Pj4+Pj4+IHVzaW5nCj4+Pj4+Pj4+Pj4+
IGNsa19yZWdpc3Rlcl9tdXggYW5kIGNsa19yZWdpc3Rlcl9nYXRlIGJ5IHBhc3NpbmcgUE1DIGJh
c2UKPj4+Pj4+Pj4+Pj4gYWRkcmVzcwo+Pj4+Pj4+Pj4+PiBhbmQgcmVnaXN0ZXIgb2Zmc2V0cyBh
bmQgUE1DIHByb2dyYW1taW5nIGZvciB0aGVzZSBjbG9ja3MKPj4+Pj4+Pj4+Pj4gaGFwcGVucwo+
Pj4+Pj4+Pj4+PiB0aHJvdWdoIGRpcmVjdCBQTUMgYWNjZXNzIGJ5IHRoZSBjbG9jayBkcml2ZXIu
Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFdpdGggdGhpcywgd2hlbiBQTUMgaXMgaW4gc2VjdXJl
IG1vZGUgYW55IGRpcmVjdCBQTUMgYWNjZXNzCj4+Pj4+Pj4+Pj4+IGZyb20gdGhlCj4+Pj4+Pj4+
Pj4+IG5vbi1zZWN1cmUgd29ybGQgZG9lcyBub3QgZ28gdGhyb3VnaCBhbmQgdGhlc2UgY2xvY2tz
IHdpbGwKPj4+Pj4+Pj4+Pj4gbm90IGJlCj4+Pj4+Pj4+Pj4+IGZ1bmN0aW9uYWwuCj4+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGVzZSBjbG9ja3MgcmVnaXN0cmF0aW9u
IHdpdGggUE1DIGFzIGEgY2xvY2sKPj4+Pj4+Pj4+Pj4gcHJvdmlkZXIKPj4+Pj4+Pj4+Pj4gZm9y
IHRoZXNlIGNsb2Nrcy4gY2xrX29wcyBjYWxsYmFjayBpbXBsZW1lbnRhdGlvbnMgZm9yIHRoZXNl
Cj4+Pj4+Pj4+Pj4+IGNsb2Nrcwo+Pj4+Pj4+Pj4+PiB1c2VzIHRlZ3JhX3BtY19yZWFkbCBhbmQg
dGVncmFfcG1jX3dyaXRlbCB3aGljaCBzdXBwb3J0cyBQTUMKPj4+Pj4+Pj4+Pj4gcHJvZ3JhbW1p
bmcKPj4+Pj4+Pj4+Pj4gaW4gc2VjdXJlIG1vZGUgYW5kIG5vbi1zZWN1cmUgbW9kZS4KPj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogU293amFueWEgS29tYXRpbmVuaSA8c2tv
bWF0aW5lbmlAbnZpZGlhLmNvbT4KPj4+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+PiBbc25pcF0KPj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xr
X29wcyBwbWNfY2xrX2dhdGVfb3BzID0gewo+Pj4+Pj4+Pj4+PiArwqDCoMKgIC5pc19lbmFibGVk
ID0gcG1jX2Nsa19pc19lbmFibGVkLAo+Pj4+Pj4+Pj4+PiArwqDCoMKgIC5lbmFibGUgPSBwbWNf
Y2xrX2VuYWJsZSwKPj4+Pj4+Pj4+Pj4gK8KgwqDCoCAuZGlzYWJsZSA9IHBtY19jbGtfZGlzYWJs
ZSwKPj4+Pj4+Pj4+Pj4gK307Cj4+Pj4+Pj4+Pj4gV2hhdCdzIHRoZSBiZW5lZml0IG9mIHNlcGFy
YXRpbmcgR0FURSBmcm9tIHRoZSBNVVg/Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBJIHRoaW5rIGl0
IGNvdWxkIGJlIGEgc2luZ2xlIGNsb2NrLgo+Pj4+Pj4+Pj4gQWNjb3JkaW5nIHRvIFRSTToKPj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiAxLiBHQVRFIGFuZCBNVVggYXJlIHNlcGFyYXRlIGVudGl0aWVzLgo+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IDIuIEdBVEUgaXMgdGhlIHBhcmVudCBvZiBNVVggKHNlZSBQTUMn
cyBDTEtfT1VUIHBhdGhzIGRpYWdyYW0KPj4+Pj4+Pj4+IGluIFRSTSkuCj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4gMy4gUE1DIGRvZXNuJ3QgZ2F0ZSBFWFRQRVJJUEggY2xvY2sgYnV0IGNvdWxkICJmb3Jj
ZS1lbmFibGUiIGl0LAo+Pj4+Pj4+Pj4gY29ycmVjdD8KPj4+Pj4gV2FzIGZvbGxvd2luZyBleGlz
dGluZyBjbGstdGVncmEtcG1jIGFzIEkgYW0gbm90IHN1cmUgb2YgcmVhc29uIGZvcgo+Pj4+PiBo
YXZpbmcgdGhlc2UgY2xvY2tzIHJlZ2lzdGVyZWQgYXMgc2VwYXJhdGUgbXV4IGFuZCBnYXRlIGNs
b2Nrcy4KPj4+Pj4KPj4+Pj4gWWVzLCBQTUMgY2xvY2tzIGNhbiBiZSByZWdpc3RlcmVkIGFzIHNp
bmdsZSBjbG9jayBhbmQgY2FuIHVzZSBjbGtfb3BzCj4+Pj4+IGZvciBzZXQvZ2V0IHBhcmVudCBh
bmQgZW5hYmxlL2Rpc2FibGUuCj4+Pj4+Cj4+Pj4+IGVuYWJsZS9kaXNhYmxlIG9mIFBNQyBjbG9j
a3MgaXMgZm9yIGZvcmNlLWVuYWJsZSB0byBmb3JjZSB0aGUgY2xvY2sgdG8KPj4+Pj4gcnVuIHJl
Z2FyZGxlc3Mgb2YgQUNDRVBUX1JFUSBvciBJTlZFUlRfUkVRLgo+Pj4+Pgo+Pj4+Pj4+PiA0LiBj
bGtfbV9kaXYyLzQgYXJlIGludGVybmFsIFBNQyBPU0MgZGl2aWRlcnMgYW5kIHRodXMgdGhlc2Ug
Y2xvY2tzCj4+Pj4+Pj4+IHNob3VsZCBiZWxvbmcgdG8gUE1DLgo+Pj4+Pj4+IEFsc28sIGl0IHNo
b3VsZCBiZSAib3NjIiBhbmQgbm90ICJjbGtfbSIuCj4+Pj4+PiBJIGZvbGxvd2VkIHRoZSBzYW1l
IHBhcmVudHMgYXMgaXQgd2VyZSBpbiBleGlzdGluZyBjbGstdGVncmEtcG1jCj4+Pj4+PiBkcml2
ZXIuCj4+Pj4+Pgo+Pj4+Pj4gWWVhaCB0aGV5IGFyZSB3cm9uZyBhbmQgdGhleSBzaG91bGQgYmUg
ZnJvbSBvc2MgYW5kIG5vdCBjbGtfbS4KPj4+Pj4+Cj4+Pj4+PiBXaWxsIGZpeCBpbiBuZXh0IHZl
cnNpb24uCj4+Pj4+Pgo+PiBSZWcgY2xrX21fZGl2Mi8zLCB0aGV5IGFyZSBkaXZpZGVycyBhdCBP
U0MgcGFkIGFuZCBub3QgcmVhbGx5IGludGVybmFsCj4+IHRvIFBNQyBibG9jay4KPj4KPj4gY3Vy
cmVudCBjbG9jayBkcml2ZXIgY3JlYXRlcyBjbGtfbV9kaXYgY2xvY2tzIHdoaWNoIHNob3VsZCBh
Y3R1YWxseSBiZQo+PiBvc2NfZGl2Mi9vc2NfZGl2NCBjbG9ja3Mgd2l0aCBvc2MgYXMgcGFyZW50
Lgo+Pgo+PiBUaGVyZSBhcmUgbm8gY2xrX21fZGl2MiBhbmQgY2xrX21fZGl2NCBmcm9tIGNsa19t
Cj4+Cj4+IFdpbGwgZml4IHRoaXMgaW4gbmV4dCB2ZXJzaW9uLgo+Pgo+Pj4+IENvdWxkIHlvdSBw
bGVhc2UgZGVzY3JpYmUgdGhlIGZ1bGwgRVhUUEVSSVBIIGNsb2NrIHRvcG9sb2d5IGFuZCBob3cg
dGhlCj4+Pj4gcGlubXV4IGNvbmZpZ3VyYXRpb24gaXMgcmVsYXRlZCB0byBpdCBhbGw/Cj4+Pj4K
Pj4+PiBXaGF0IGlzIGludGVybmFsIHRvIHRoZSBUZWdyYSBjaGlwIGFuZCB3aGF0IGFyZSB0aGUg
ZXh0ZXJuYWwgb3V0cHV0cz8KPj4+Pgo+Pj4+IElzIGl0IHBvc3NpYmxlIHRvIGJ5cGFzcyBQTUMg
b24gVDMwKyBmb3IgdGhlIEVYVFBFUklQSCBjbG9ja3M/Cj4+Pgo+Pj4gUE1DIENMSzEvMi8zIHBv
c3NpYmxlIHNvdXJjZXMgYXJlIE9TQ19ESVYxLCBPU0NfRElWMiwgT1NDX0RJVjQsCj4+PiBFWFRQ
RVJJUEggZnJvbSBDQVIuCj4+Pgo+Pj4gT1NDX0RJVjEvMi80IGFyZSB3aXRoIGludGVybmFsIGRp
dmlkZXJzIGF0IHRoZSBPU0MgUGFkcwo+Pj4KPj4+IEVYVFBFUklQSCBpcyBmcm9tIENBUiBhbmQg
aXQgaGFzIHJlc2V0IGFuZCBlbmFibGUgY29udHJvbHMgYWxvbmcgd2l0aAo+Pj4gY2xvY2sgc291
cmNlIHNlbGVjdGlvbnMgdG8gY2hvb3NlIG9uZSBvZiB0aGUgUExMQV9PVVQwLCBDTEtfUywKPj4+
IFBMTFBfT1VUMCwgQ0xLX00sIFBMTEVfT1VUMAo+Pj4KPj4+IFNvLCBQTUMgQ0xLMS8yLzQgcG9z
c2libGUgcGFyZW50cyBhcmUgT1NDX0RJVjEsIE9TQ19ESVYyLCBPU0NfRElWNCwKPj4+IEVYVEVS
Ti4KPj4+Cj4+Pgo+Pj4gQ0xLMS8yLzMgYWxzbyBoYXMgUGlubXV4IHRvIHJvdXRlIEVYVFBFUklQ
SCBvdXRwdXQgb24gdG8gdGhlc2UgcGlucy4KPj4+Cj4+Pgo+Pj4gV2hlbiBFWFRFUk4gb3V0cHV0
IGNsb2NrIGlzIHNlbGVjdGVkIGZvciB0aGVzZSBQTUMgY2xvY2tzIHRocnUKPj4+IENMS3hfU1JD
X1NFTCwgb3V0cHV0IGNsb2NrIGlzIGZyb20gZHJpdmVyIGJ5IEVYVFBFUklQSCBmcm9tIENBUiB2
aWEKPj4+IFBpbm11eCBsb2dpYyBvciBkcml2ZW4gYXMgcGVyIENMS3hfU1JDX1NFTCBieXBhc3Np
bmcgcGlubXV4IGJhc2VkIG9uCj4+PiBDTEt4X0FDQ0VQVF9SRVEgYml0Lgo+Pj4KPj4+Cj4+PiBQ
TUMgQ2xvY2sgY29udHJvbCByZWdpc3RlciBoYXMgYml0IENMS3hfQUNDRVBUX1JFUQo+Pj4gV2hl
biBDTEt4X0FDQ0VQVF9SRVEgPSAwLCBvdXRwdXQgY2xvY2sgZHJpdmVyIGlzIGZyb20gYnkgRVhU
UEVSSVBICj4+PiB0aHJvdWdoIHRoZSBwaW5tdXgKPj4+IFdoZW4gQ0xLeF9BQ0NFUFRfUkVRID0g
MSwgb3V0cHV0IGNsb2NrIGlzIGJhc2VkIG9uIENMS3hfU1JDX1NFTCBiaXRzCj4+PiAoT1NDX0RJ
VjEvMi80IGFuZCBFWFRQRVJJUEggY2xvY2sgYnlwYXNzaW5nIHRoZSBwaW5tdXgpCj4+Pgo+Pj4g
Rk9SQ0VfRU4gYml0IGluIFBNQyBDTG9jayBjb250cm9sIHJlZ2lzdGVyIGZvcmNlcyB0aGUgY2xv
Y2sgdG8gcnVuCj4+PiByZWdhcmRsZXNzIG9mIHRoaXMuCj4gCj4gUE1DIGNsb2NrIGdhdGUgaXMg
YmFzZWQgb24gdGhlIHN0YXRlIG9mIENMS3hfQUNDRVBUX1JFUSBhbmQgRk9SQ0VfRU4KPiBsaWtl
IGV4cGxhaW5lZCBhYm92ZS4KPiAKPiBDTEt4X0FDQ0VQVF9SRVEgaXMgMCBkZWZhdWx0IGFuZCBG
T1JDRV9FTiBhY3RzIGFzIGdhdGUgdG8gZW5hYmxlL2Rpc2FibGUKPiBFWFRQRVJJUEggY2xvY2sg
b3V0cHV0IHRvIFBNQyBDTEtfT1VUXzEvMi8zLgoKW2FuZCB0byBlbmFibGUgT1NDIGFzIHdlbGxd
Cgo+IFNvIEkgYmVsaWV2ZSB3ZSBuZWVkIHRvIHJlZ2lzdGVyIGFzIE1VWCBhbmQgR2F0ZSByYXRo
ZXIgdGhhbiBhcyBhIHNpbmdsZQo+IGNsb2NrLiBQbGVhc2UgY29uZmlybS4KCjEuIFRoZSBmb3Jj
ZS1lbmFibGluZyBpcyBhcHBsaWVkIHRvIGJvdGggT1NDIGFuZCBFWFRFUk4gc291cmNlcyBvZgpQ
TUNfQ0xLX09VVF94IGJ5IFBNQyBhdCBvbmNlLgoKMi4gQm90aCBvZiBQTUMncyBmb3JjZS1lbmFi
bGluZyBhbmQgT1NDL0VYVEVSTiBzZWxlY3Rpb24gaXMgaW50ZXJuYWwgdG8gUE1DLgoKU2hvdWxk
IGJlIGJldHRlciB0byBkZWZpbmUgaXQgYXMgYSBzaW5nbGUgInBtY19jbGtfb3V0X3giLiBJIGRv
bid0IHNlZQphbnkgZ29vZCByZWFzb25zIGZvciBkaWZmZXJlbnRpYXRpbmcgUE1DJ3MgR2F0ZSBm
cm9tIHRoZSBNVVgsIGl0J3MgYQpzaW5nbGUgaGFyZHdhcmUgdW5pdCBmcm9tIGEgcG9pbnQgb2Yg
dmlldyBvZiB0aGUgcmVzdCBvZiB0aGUgc3lzdGVtLgoKUGV0ZXIsIGRvIHlvdSBoYXZlIGFueSBv
YmplY3Rpb25zPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
