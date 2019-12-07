Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9054116AE4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:22:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A8F16D8;
	Mon,  9 Dec 2019 11:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A8F16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886977;
	bh=4HsrsVZgp7F5YPnP0voq30LaUiUaxnAXLjJv1VNsH50=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tN1Mz3emzpiNvDG3QqRueQVrz4dwKlMdLdcKi/J1qCGjpN5Yf1uDGNydwO+SbNM/e
	 lbUAeyAkEL18R7s62qUHCMIcHjKVBTiHC/zpB2TxGMalBlhelN4cEczO/fX2lhHOIy
	 kwD8W5eEGQpPUWR1N+rrgoGm9OiaCM7n2SsOIxaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 073F6F804AF;
	Mon,  9 Dec 2019 10:52:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 306FEF801F7; Sat,  7 Dec 2019 16:47:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B886F80108
 for <alsa-devel@alsa-project.org>; Sat,  7 Dec 2019 16:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B886F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G9ArH6XS"
Received: by mail-lj1-x242.google.com with SMTP id e10so10872525ljj.6
 for <alsa-devel@alsa-project.org>; Sat, 07 Dec 2019 07:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cgXqxnQNU1KfFpmIH+l98eU9BRN3KG1bcuyxtlJ2Sto=;
 b=G9ArH6XS3kkAJ444AD/6nMO2JlGQXBaRpaNbcSJTkxT8qruObCDonZqvDrTWcYsFUz
 f+tdjKmVMMiOxPZp3Fonwg5u4+K+JVaCdoziAsTORCqTB7Tf3UXtbt1ehWRz1b06ZOAi
 RzKY4sB1gJjOPcu4YZ5wdy1UaikSzskUWkY3TLwLQNQIH+38s48XKCYY0AI0NZgnVQyN
 lcQ+Mh9ebt+uiKRj4EJVfYKBHR87d8HKum7xBcNzrzbM0+Mp1vUmCgfgyk3gNjxQjsgX
 j2ExgRNvdq4WdH3bQL7LyMQlU9yw9AVLBTBaBgM7gvBmDXTzsSW47Kr3VDm553ySyBJJ
 RVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cgXqxnQNU1KfFpmIH+l98eU9BRN3KG1bcuyxtlJ2Sto=;
 b=Hu7TtpSIDwMcQTw7uGl5UUkqzkecMkkKBVS4iDhxmR+S8/bx4vYb+B0ZlnKy8WJuki
 5WccgEdOZ5y0JPbPBAP2ds55SDz7dHeMcQikULemgyjEmK/UBlt8mQQMF3sRjopgVwmc
 fia5gqAsTiErN7p4zedXa7aio6SOV9zPmhRDcL9qQ04kJJCYYq5pDLB74DSiHtZZRsoT
 +W4VDrsJ2pKUYJN0Gc4gtLEdQdhmGhdDvXTzLBGdtpeCVlTK7uD3PM86Qb6HQ8VoknBF
 0xKld9ZrilufbqI1OycPY+RBbiAsXVhgRw4UFABhSvNe/gRKM1D0EjbcaAv3dRIuBG/c
 6/eA==
X-Gm-Message-State: APjAAAVKd7RbF06aNpLSYInf7mc5c3YmDYNcQHf+YE2Zx7iy30luZkqz
 uyQ1670Nuh5qFcBfZ4IRE5WsKYMe
X-Google-Smtp-Source: APXvYqzuRtjp1TNY2b/7foipfb48ltiMBODXYMY3RNu5TTuhDLO59LuRTWCEhwpkpHeb5auvUtSZgw==
X-Received: by 2002:a2e:91cb:: with SMTP id u11mr9513889ljg.82.1575733671384; 
 Sat, 07 Dec 2019 07:47:51 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id a27sm8159790lfo.38.2019.12.07.07.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2019 07:47:50 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-4-git-send-email-skomatineni@nvidia.com>
 <7cf4ff77-2f33-4ee5-0e09-5aa6aef3e8be@gmail.com>
Message-ID: <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
Date: Sat, 7 Dec 2019 18:47:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7cf4ff77-2f33-4ee5-0e09-5aa6aef3e8be@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Dec 2019 10:51:21 +0100
Cc: alsa-devel@alsa-project.org, pgaikwad@nvidia.com, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, josephl@nvidia.com, linux-clk@vger.kernel.org,
 arnd@arndb.de, daniel.lezcano@linaro.org, krzk@kernel.org,
 mturquette@baylibre.com, devicetree@vger.kernel.org, mmaddireddy@nvidia.com,
 markz@nvidia.com, alexios.zavras@intel.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, tiwai@suse.com,
 allison@lohutok.net, pdeschrijver@nvidia.com, lgirdwood@gmail.com,
 vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
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

MDcuMTIuMjAxOSAxNzoyOCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDYuMTIuMjAx
OSAwNTo0OCwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+PiBUZWdyYTIxMCBhbmQg
cHJpb3IgVGVncmEgUE1DIGhhcyBjbGtfb3V0XzEsIGNsa19vdXRfMiwgY2xrX291dF8zIHdpdGgK
Pj4gbXV4IGFuZCBnYXRlIGZvciBlYWNoIG9mIHRoZXNlIGNsb2Nrcy4KPj4KPj4gQ3VycmVudGx5
IHRoZXNlIFBNQyBjbG9ja3MgYXJlIHJlZ2lzdGVyZWQgYnkgVGVncmEgY2xvY2sgZHJpdmVyIHVz
aW5nCj4+IGNsa19yZWdpc3Rlcl9tdXggYW5kIGNsa19yZWdpc3Rlcl9nYXRlIGJ5IHBhc3Npbmcg
UE1DIGJhc2UgYWRkcmVzcwo+PiBhbmQgcmVnaXN0ZXIgb2Zmc2V0cyBhbmQgUE1DIHByb2dyYW1t
aW5nIGZvciB0aGVzZSBjbG9ja3MgaGFwcGVucwo+PiB0aHJvdWdoIGRpcmVjdCBQTUMgYWNjZXNz
IGJ5IHRoZSBjbG9jayBkcml2ZXIuCj4+Cj4+IFdpdGggdGhpcywgd2hlbiBQTUMgaXMgaW4gc2Vj
dXJlIG1vZGUgYW55IGRpcmVjdCBQTUMgYWNjZXNzIGZyb20gdGhlCj4+IG5vbi1zZWN1cmUgd29y
bGQgZG9lcyBub3QgZ28gdGhyb3VnaCBhbmQgdGhlc2UgY2xvY2tzIHdpbGwgbm90IGJlCj4+IGZ1
bmN0aW9uYWwuCj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGVzZSBjbG9ja3MgcmVnaXN0cmF0aW9u
IHdpdGggUE1DIGFzIGEgY2xvY2sgcHJvdmlkZXIKPj4gZm9yIHRoZXNlIGNsb2Nrcy4gY2xrX29w
cyBjYWxsYmFjayBpbXBsZW1lbnRhdGlvbnMgZm9yIHRoZXNlIGNsb2Nrcwo+PiB1c2VzIHRlZ3Jh
X3BtY19yZWFkbCBhbmQgdGVncmFfcG1jX3dyaXRlbCB3aGljaCBzdXBwb3J0cyBQTUMgcHJvZ3Jh
bW1pbmcKPj4gaW4gc2VjdXJlIG1vZGUgYW5kIG5vbi1zZWN1cmUgbW9kZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogU293amFueWEgS29tYXRpbmVuaSA8c2tvbWF0aW5lbmlAbnZpZGlhLmNvbT4KPj4g
LS0tCgpbc25pcF0KCj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29wcyBwbWNfY2xr
X2dhdGVfb3BzID0gewo+PiArCS5pc19lbmFibGVkID0gcG1jX2Nsa19pc19lbmFibGVkLAo+PiAr
CS5lbmFibGUgPSBwbWNfY2xrX2VuYWJsZSwKPj4gKwkuZGlzYWJsZSA9IHBtY19jbGtfZGlzYWJs
ZSwKPj4gK307Cj4gCj4gV2hhdCdzIHRoZSBiZW5lZml0IG9mIHNlcGFyYXRpbmcgR0FURSBmcm9t
IHRoZSBNVVg/Cj4gCj4gSSB0aGluayBpdCBjb3VsZCBiZSBhIHNpbmdsZSBjbG9jay4KCkFjY29y
ZGluZyB0byBUUk06CgoxLiBHQVRFIGFuZCBNVVggYXJlIHNlcGFyYXRlIGVudGl0aWVzLgoKMi4g
R0FURSBpcyB0aGUgcGFyZW50IG9mIE1VWCAoc2VlIFBNQydzIENMS19PVVQgcGF0aHMgZGlhZ3Jh
bSBpbiBUUk0pLgoKMy4gUE1DIGRvZXNuJ3QgZ2F0ZSBFWFRQRVJJUEggY2xvY2sgYnV0IGNvdWxk
ICJmb3JjZS1lbmFibGUiIGl0LCBjb3JyZWN0PwoKW3NuaXBdCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
