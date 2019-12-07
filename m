Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84474116AE8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:24:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18E1816E1;
	Mon,  9 Dec 2019 11:23:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18E1816E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887056;
	bh=j6K//z3+kpv2lY5l+VFONxo68ieLbx96+S4uPAAN6fk=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L6DXKymjMXy52WJBxQ/5xqenmUreT965PpKjcK9AMYs/TIjjlRqBFbpOR3hGyuFGs
	 zcSJ0iW2axQen+29Xr4AOH+J1zZXsQKSY03zdxTBJuvvunsZzR/YbuuuLumwH58+u/
	 JyaKB9TYKu9iN6djadVn2/6Cj5d+fCUV/7nEcQmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74955F804D2;
	Mon,  9 Dec 2019 10:52:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CE00F801F7; Sat,  7 Dec 2019 17:00:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD17CF8011E
 for <alsa-devel@alsa-project.org>; Sat,  7 Dec 2019 17:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD17CF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="banbk1xN"
Received: by mail-lf1-x143.google.com with SMTP id n12so7550834lfe.3
 for <alsa-devel@alsa-project.org>; Sat, 07 Dec 2019 08:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pSsGyhYusNn14wX08kX5/yw/DF7mNGeSPkIRQpam7uQ=;
 b=banbk1xNMgoJqtduf9/tQnrZW6RfkzY2RZjMWOjvZxKRjhSdLd938FvZPUdLHO5sSq
 DBqr2QBpVNMi4vwNo9UP9wGoUlC1vIyPMqEMPcpC9xdGWy3pWjlemyD4C7eNU8gp0MS1
 iPoY4tLaRQ2W9217Ellr/M0KOFY5nB2iSBGBN2Q5h+tQ6ZVJCqK9xx3f+EiGRG06MIca
 l3FjObPGkiAKva8uQJhYZA7orHbXQo11oMxZQAe9efP3zSXvJ7ik54tx1pt3Dc/NFN6F
 lfmMGC29oLWVVygPc9141xT0EwilkyiJc+xYKKpnhtRr7pGUamgsmCgwG+zbsHBHDDsq
 iYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pSsGyhYusNn14wX08kX5/yw/DF7mNGeSPkIRQpam7uQ=;
 b=sEp/09ADLh8P4hX3sCU2FXCKfEsLYKv3BM6Fs/KdNO8sOHdhFcISu67mdQPFDnzpg9
 WGKAgcgjlvro4rfxi6NTiFJW5MV8W/LLuw8ndA37uCWg1SMjV4HbZCftY/SXgCm6L5bm
 Za+3iZVvPkqaB+dho8e8j8Lk+L6HMI+QlS1zYaHx95f+Itc1TRPDGl17fDSp965CYr0k
 lzUwnIhbRo7gaTxthvd+fzS8BtUS+zwgjYQfuMOJ3yAqLCQTvxmD/M+XnEgFo6zAhpun
 L+HzEwkyHqZsgGyZcwx6Z+6JJT6eMzS7I/FdcDuLg5p3N2oJHs5OJMjrzyAt19LPKWQR
 425A==
X-Gm-Message-State: APjAAAW1M/FmBYRdzsPGDmcJAaS2FgmJe6MxJg3uoyKC4d5rZnWLibOI
 3O4f5csXIoHk/+U/81fV2YZqJh76
X-Google-Smtp-Source: APXvYqwgRepgXYD+Wsz26E3mZp/qWEn6slPq81tn70PkFLJrEpU7//YodsoJauhAhVXPZX5wfQRVog==
X-Received: by 2002:a19:5007:: with SMTP id e7mr11211683lfb.153.1575734406686; 
 Sat, 07 Dec 2019 08:00:06 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id z5sm8268779lji.32.2019.12.07.08.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2019 08:00:06 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-4-git-send-email-skomatineni@nvidia.com>
 <7cf4ff77-2f33-4ee5-0e09-5aa6aef3e8be@gmail.com>
 <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
 <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
Message-ID: <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
Date: Sat, 7 Dec 2019 19:00:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
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

MDcuMTIuMjAxOSAxODo1MywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDcuMTIuMjAx
OSAxODo0NywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+IDA3LjEyLjIwMTkgMTc6Mjgs
IERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4gMDYuMTIuMjAxOSAwNTo0OCwgU293amFu
eWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+Pj4+IFRlZ3JhMjEwIGFuZCBwcmlvciBUZWdyYSBQ
TUMgaGFzIGNsa19vdXRfMSwgY2xrX291dF8yLCBjbGtfb3V0XzMgd2l0aAo+Pj4+IG11eCBhbmQg
Z2F0ZSBmb3IgZWFjaCBvZiB0aGVzZSBjbG9ja3MuCj4+Pj4KPj4+PiBDdXJyZW50bHkgdGhlc2Ug
UE1DIGNsb2NrcyBhcmUgcmVnaXN0ZXJlZCBieSBUZWdyYSBjbG9jayBkcml2ZXIgdXNpbmcKPj4+
PiBjbGtfcmVnaXN0ZXJfbXV4IGFuZCBjbGtfcmVnaXN0ZXJfZ2F0ZSBieSBwYXNzaW5nIFBNQyBi
YXNlIGFkZHJlc3MKPj4+PiBhbmQgcmVnaXN0ZXIgb2Zmc2V0cyBhbmQgUE1DIHByb2dyYW1taW5n
IGZvciB0aGVzZSBjbG9ja3MgaGFwcGVucwo+Pj4+IHRocm91Z2ggZGlyZWN0IFBNQyBhY2Nlc3Mg
YnkgdGhlIGNsb2NrIGRyaXZlci4KPj4+Pgo+Pj4+IFdpdGggdGhpcywgd2hlbiBQTUMgaXMgaW4g
c2VjdXJlIG1vZGUgYW55IGRpcmVjdCBQTUMgYWNjZXNzIGZyb20gdGhlCj4+Pj4gbm9uLXNlY3Vy
ZSB3b3JsZCBkb2VzIG5vdCBnbyB0aHJvdWdoIGFuZCB0aGVzZSBjbG9ja3Mgd2lsbCBub3QgYmUK
Pj4+PiBmdW5jdGlvbmFsLgo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaCBhZGRzIHRoZXNlIGNsb2NrcyBy
ZWdpc3RyYXRpb24gd2l0aCBQTUMgYXMgYSBjbG9jayBwcm92aWRlcgo+Pj4+IGZvciB0aGVzZSBj
bG9ja3MuIGNsa19vcHMgY2FsbGJhY2sgaW1wbGVtZW50YXRpb25zIGZvciB0aGVzZSBjbG9ja3MK
Pj4+PiB1c2VzIHRlZ3JhX3BtY19yZWFkbCBhbmQgdGVncmFfcG1jX3dyaXRlbCB3aGljaCBzdXBw
b3J0cyBQTUMgcHJvZ3JhbW1pbmcKPj4+PiBpbiBzZWN1cmUgbW9kZSBhbmQgbm9uLXNlY3VyZSBt
b2RlLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogU293amFueWEgS29tYXRpbmVuaSA8c2tvbWF0
aW5lbmlAbnZpZGlhLmNvbT4KPj4+PiAtLS0KPj4KPj4gW3NuaXBdCj4+Cj4+Pj4gKwo+Pj4+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgcG1jX2Nsa19nYXRlX29wcyA9IHsKPj4+PiArCS5p
c19lbmFibGVkID0gcG1jX2Nsa19pc19lbmFibGVkLAo+Pj4+ICsJLmVuYWJsZSA9IHBtY19jbGtf
ZW5hYmxlLAo+Pj4+ICsJLmRpc2FibGUgPSBwbWNfY2xrX2Rpc2FibGUsCj4+Pj4gK307Cj4+Pgo+
Pj4gV2hhdCdzIHRoZSBiZW5lZml0IG9mIHNlcGFyYXRpbmcgR0FURSBmcm9tIHRoZSBNVVg/Cj4+
Pgo+Pj4gSSB0aGluayBpdCBjb3VsZCBiZSBhIHNpbmdsZSBjbG9jay4KPj4KPj4gQWNjb3JkaW5n
IHRvIFRSTToKPj4KPj4gMS4gR0FURSBhbmQgTVVYIGFyZSBzZXBhcmF0ZSBlbnRpdGllcy4KPj4K
Pj4gMi4gR0FURSBpcyB0aGUgcGFyZW50IG9mIE1VWCAoc2VlIFBNQydzIENMS19PVVQgcGF0aHMg
ZGlhZ3JhbSBpbiBUUk0pLgo+Pgo+PiAzLiBQTUMgZG9lc24ndCBnYXRlIEVYVFBFUklQSCBjbG9j
ayBidXQgY291bGQgImZvcmNlLWVuYWJsZSIgaXQsIGNvcnJlY3Q/Cj4gCj4gNC4gY2xrX21fZGl2
Mi80IGFyZSBpbnRlcm5hbCBQTUMgT1NDIGRpdmlkZXJzIGFuZCB0aHVzIHRoZXNlIGNsb2Nrcwo+
IHNob3VsZCBiZWxvbmcgdG8gUE1DLgoKQWxzbywgaXQgc2hvdWxkIGJlICJvc2MiIGFuZCBub3Qg
ImNsa19tIi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
