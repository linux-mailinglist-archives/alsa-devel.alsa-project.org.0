Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 597F2118077
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:31:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E47C716A4;
	Tue, 10 Dec 2019 07:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E47C716A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575959476;
	bh=6KbrymLQ6Kk6EXfuxjJqXjj75A57mR9C2la1PRdwpNI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E2cIoc/ADIWR8SUMj/HyugmHRf4PGpkiHeE3Ri/POxMeIqUR7zK+g52YB8frQ1ifE
	 M23BpKcxlEP23zlGTT8cBm/mByMz3Wyzh5qIYO6K3B35qdh64/DDV0Pk6l80IRumko
	 vGG+ZbuMlGSWXYvaJ+rtv/VgKLREY8N3msKPB1M0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD4C9F8025A;
	Tue, 10 Dec 2019 07:28:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51A57F80234; Mon,  9 Dec 2019 21:12:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 456EDF800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 21:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 456EDF800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oyNHS4Vl"
Received: by mail-lj1-x243.google.com with SMTP id z17so17081148ljk.13
 for <alsa-devel@alsa-project.org>; Mon, 09 Dec 2019 12:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=toXARQVeazduKdMBcjZ4AH+zKbnIDWRz3fBlo89SsY8=;
 b=oyNHS4VlNQIeO8uN4MTz5mnnSbKmtqbZwyZ5dC7UpkgqBEwuGlmOIN0+RPkkDpEMOa
 vCZXz7sr6AVN0zyHTNBcclHbuWsYc+4eO5xAzAjB7nTQhnuaqs6H0E95/9FyprYS6Nxh
 3OghsnDtsPF72u6J9DOE11wxG0welgCE3mwMUMQ92BAWyHTsOzblUWF+kON4av1oX12Q
 hOMQyJbCrvt01M4XYMXodNBql795RbFgyYevszJWpwRaNVe4cqSgfpvlCPZUekti4onD
 K/cYJA/cZnHYMIxm7WENW7bOSBDY956QC5jk6f0MHTqVhPl5cJAAmU+rKjlIUgVhgB76
 HMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=toXARQVeazduKdMBcjZ4AH+zKbnIDWRz3fBlo89SsY8=;
 b=FY+k/WwucXOVESRGM9EkS0A/2WN/6TGIqRh51FE4uTFgNma+dETVNyvVNO4wLI/yDN
 2sshN9r3S5KPogNxNHbtamMUn6JlXJaqwC+b1p6Z02NFjdJr7YYVwchfKAMFEo8nvAlz
 Naif80f4w1mH1QYj5jt0os7rKygWaeucSFZmNk1Uoa4eo9Bj/vZl1E8wXMkxliFhIfmg
 Abnm7CWlIVloLbr2DVCzLvQFjaM1iUpAssFixS11ecCXfuAXEoBrjh6rQtc3R4pTODod
 GkyIwB9ugZ11MF1oLmkJW74lABaSY4gaIXeMTPVK8JlRabFDuiUNjdJnmD/t0lCWJ7/S
 kILQ==
X-Gm-Message-State: APjAAAWRYUwr6Ijb1KSQMCegd63O1DtZYLO8+8xF9m+UW7j0Mbmzn/lz
 nBrfmnQmH0ugGZU5ufeJoqcIQXej
X-Google-Smtp-Source: APXvYqzFJzecx4/IUoPCD798bOm5o7OiSgWA4hOkXHCqKz5R/DTqwq7ycwmvKJ9TE7el6GO2a/JYvA==
X-Received: by 2002:a2e:9741:: with SMTP id f1mr17084867ljj.123.1575922357865; 
 Mon, 09 Dec 2019 12:12:37 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id k25sm453452lji.42.2019.12.09.12.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 12:12:36 -0800 (PST)
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-4-git-send-email-skomatineni@nvidia.com>
 <7cf4ff77-2f33-4ee5-0e09-5aa6aef3e8be@gmail.com>
 <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
 <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
 <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
Date: Mon, 9 Dec 2019 23:12:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Dec 2019 07:28:27 +0100
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

MDguMTIuMjAxOSAwMDozNiwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IAo+IE9u
IDEyLzcvMTkgMTE6NTkgQU0sIFNvd2phbnlhIEtvbWF0aW5lbmkgd3JvdGU6Cj4+Cj4+IE9uIDEy
LzcvMTkgODowMCBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMDcuMTIuMjAxOSAxODo1
MywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+Pj4gMDcuMTIuMjAxOSAxODo0NywgRG1p
dHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+Pj4+IDA3LjEyLjIwMTkgMTc6MjgsIERtaXRyeSBP
c2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+Pj4gMDYuMTIuMjAxOSAwNTo0OCwgU293amFueWEgS29t
YXRpbmVuaSDQv9C40YjQtdGCOgo+Pj4+Pj4+IFRlZ3JhMjEwIGFuZCBwcmlvciBUZWdyYSBQTUMg
aGFzIGNsa19vdXRfMSwgY2xrX291dF8yLCBjbGtfb3V0XzMKPj4+Pj4+PiB3aXRoCj4+Pj4+Pj4g
bXV4IGFuZCBnYXRlIGZvciBlYWNoIG9mIHRoZXNlIGNsb2Nrcy4KPj4+Pj4+Pgo+Pj4+Pj4+IEN1
cnJlbnRseSB0aGVzZSBQTUMgY2xvY2tzIGFyZSByZWdpc3RlcmVkIGJ5IFRlZ3JhIGNsb2NrIGRy
aXZlcgo+Pj4+Pj4+IHVzaW5nCj4+Pj4+Pj4gY2xrX3JlZ2lzdGVyX211eCBhbmQgY2xrX3JlZ2lz
dGVyX2dhdGUgYnkgcGFzc2luZyBQTUMgYmFzZSBhZGRyZXNzCj4+Pj4+Pj4gYW5kIHJlZ2lzdGVy
IG9mZnNldHMgYW5kIFBNQyBwcm9ncmFtbWluZyBmb3IgdGhlc2UgY2xvY2tzIGhhcHBlbnMKPj4+
Pj4+PiB0aHJvdWdoIGRpcmVjdCBQTUMgYWNjZXNzIGJ5IHRoZSBjbG9jayBkcml2ZXIuCj4+Pj4+
Pj4KPj4+Pj4+PiBXaXRoIHRoaXMsIHdoZW4gUE1DIGlzIGluIHNlY3VyZSBtb2RlIGFueSBkaXJl
Y3QgUE1DIGFjY2VzcyBmcm9tIHRoZQo+Pj4+Pj4+IG5vbi1zZWN1cmUgd29ybGQgZG9lcyBub3Qg
Z28gdGhyb3VnaCBhbmQgdGhlc2UgY2xvY2tzIHdpbGwgbm90IGJlCj4+Pj4+Pj4gZnVuY3Rpb25h
bC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGVzZSBjbG9ja3MgcmVnaXN0cmF0
aW9uIHdpdGggUE1DIGFzIGEgY2xvY2sKPj4+Pj4+PiBwcm92aWRlcgo+Pj4+Pj4+IGZvciB0aGVz
ZSBjbG9ja3MuIGNsa19vcHMgY2FsbGJhY2sgaW1wbGVtZW50YXRpb25zIGZvciB0aGVzZSBjbG9j
a3MKPj4+Pj4+PiB1c2VzIHRlZ3JhX3BtY19yZWFkbCBhbmQgdGVncmFfcG1jX3dyaXRlbCB3aGlj
aCBzdXBwb3J0cyBQTUMKPj4+Pj4+PiBwcm9ncmFtbWluZwo+Pj4+Pj4+IGluIHNlY3VyZSBtb2Rl
IGFuZCBub24tc2VjdXJlIG1vZGUuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTb3dq
YW55YSBLb21hdGluZW5pIDxza29tYXRpbmVuaUBudmlkaWEuY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+
PiBbc25pcF0KPj4+Pj4KPj4+Pj4+PiArCj4+Pj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xr
X29wcyBwbWNfY2xrX2dhdGVfb3BzID0gewo+Pj4+Pj4+ICvCoMKgwqAgLmlzX2VuYWJsZWQgPSBw
bWNfY2xrX2lzX2VuYWJsZWQsCj4+Pj4+Pj4gK8KgwqDCoCAuZW5hYmxlID0gcG1jX2Nsa19lbmFi
bGUsCj4+Pj4+Pj4gK8KgwqDCoCAuZGlzYWJsZSA9IHBtY19jbGtfZGlzYWJsZSwKPj4+Pj4+PiAr
fTsKPj4+Pj4+IFdoYXQncyB0aGUgYmVuZWZpdCBvZiBzZXBhcmF0aW5nIEdBVEUgZnJvbSB0aGUg
TVVYPwo+Pj4+Pj4KPj4+Pj4+IEkgdGhpbmsgaXQgY291bGQgYmUgYSBzaW5nbGUgY2xvY2suCj4+
Pj4+IEFjY29yZGluZyB0byBUUk06Cj4+Pj4+Cj4+Pj4+IDEuIEdBVEUgYW5kIE1VWCBhcmUgc2Vw
YXJhdGUgZW50aXRpZXMuCj4+Pj4+Cj4+Pj4+IDIuIEdBVEUgaXMgdGhlIHBhcmVudCBvZiBNVVgg
KHNlZSBQTUMncyBDTEtfT1VUIHBhdGhzIGRpYWdyYW0gaW4gVFJNKS4KPj4+Pj4KPj4+Pj4gMy4g
UE1DIGRvZXNuJ3QgZ2F0ZSBFWFRQRVJJUEggY2xvY2sgYnV0IGNvdWxkICJmb3JjZS1lbmFibGUi
IGl0LAo+Pj4+PiBjb3JyZWN0Pwo+IAo+IFdhcyBmb2xsb3dpbmcgZXhpc3RpbmcgY2xrLXRlZ3Jh
LXBtYyBhcyBJIGFtIG5vdCBzdXJlIG9mIHJlYXNvbiBmb3IKPiBoYXZpbmcgdGhlc2UgY2xvY2tz
IHJlZ2lzdGVyZWQgYXMgc2VwYXJhdGUgbXV4IGFuZCBnYXRlIGNsb2Nrcy4KPiAKPiBZZXMsIFBN
QyBjbG9ja3MgY2FuIGJlIHJlZ2lzdGVyZWQgYXMgc2luZ2xlIGNsb2NrIGFuZCBjYW4gdXNlIGNs
a19vcHMKPiBmb3Igc2V0L2dldCBwYXJlbnQgYW5kIGVuYWJsZS9kaXNhYmxlLgo+IAo+IGVuYWJs
ZS9kaXNhYmxlIG9mIFBNQyBjbG9ja3MgaXMgZm9yIGZvcmNlLWVuYWJsZSB0byBmb3JjZSB0aGUg
Y2xvY2sgdG8KPiBydW4gcmVnYXJkbGVzcyBvZiBBQ0NFUFRfUkVRIG9yIElOVkVSVF9SRVEuCj4g
Cj4+Pj4gNC4gY2xrX21fZGl2Mi80IGFyZSBpbnRlcm5hbCBQTUMgT1NDIGRpdmlkZXJzIGFuZCB0
aHVzIHRoZXNlIGNsb2Nrcwo+Pj4+IHNob3VsZCBiZWxvbmcgdG8gUE1DLgo+Pj4gQWxzbywgaXQg
c2hvdWxkIGJlICJvc2MiIGFuZCBub3QgImNsa19tIi4KPj4KPj4gSSBmb2xsb3dlZCB0aGUgc2Ft
ZSBwYXJlbnRzIGFzIGl0IHdlcmUgaW4gZXhpc3RpbmcgY2xrLXRlZ3JhLXBtYyBkcml2ZXIuCj4+
Cj4+IFllYWggdGhleSBhcmUgd3JvbmcgYW5kIHRoZXkgc2hvdWxkIGJlIGZyb20gb3NjIGFuZCBu
b3QgY2xrX20uCj4+Cj4+IFdpbGwgZml4IGluIG5leHQgdmVyc2lvbi4KPj4KCkNvdWxkIHlvdSBw
bGVhc2UgZGVzY3JpYmUgdGhlIGZ1bGwgRVhUUEVSSVBIIGNsb2NrIHRvcG9sb2d5IGFuZCBob3cg
dGhlCnBpbm11eCBjb25maWd1cmF0aW9uIGlzIHJlbGF0ZWQgdG8gaXQgYWxsPwoKV2hhdCBpcyBp
bnRlcm5hbCB0byB0aGUgVGVncmEgY2hpcCBhbmQgd2hhdCBhcmUgdGhlIGV4dGVybmFsIG91dHB1
dHM/CgpJcyBpdCBwb3NzaWJsZSB0byBieXBhc3MgUE1DIG9uIFQzMCsgZm9yIHRoZSBFWFRQRVJJ
UEggY2xvY2tzPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
