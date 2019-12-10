Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5175B11A49C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 07:40:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9991655;
	Wed, 11 Dec 2019 07:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9991655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576046424;
	bh=T6I9Gy5Gb8AmicnQDObWUX2nbyzHO102JHV0GSY6w1c=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QxJCk+BT+QR2heX0Z7EWHEKdbZuaFJR2JeyDItRxVLtu2LbePFTkgpE6cxGesB5hR
	 1BIqV7A9uhzJ/QE6k3qd11z1TVyHLKYR1YLdeuVy7anx3QRWGx0NOvApJYWOSmCAuQ
	 6z/bAmC6SC6BOMZuXt36UeC4PXRUBd83LxnZDTaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD7CF80234;
	Wed, 11 Dec 2019 07:38:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0C1EF8020C; Tue, 10 Dec 2019 18:41:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D423BF800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 18:41:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D423BF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fLDyIZk1"
Received: by mail-lf1-x143.google.com with SMTP id m30so14387187lfp.8
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 09:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3+B2jsEG74M+bv+PYUqftLVPNrTmVzE0e8dGC2xmTQ4=;
 b=fLDyIZk1YtooaLHuAwE6RNMigynuza97Qr0GM6mWVJ5WAe7blUd5FC9YzNyoidabdE
 GgoeYL+JY+W10x+mXdiPR8VKsiqk2fcREEuIyQAJjYRwrIwWd71Up1yt1+8gkeiLB4op
 xXVWURcXWcqW7C769t/EgHOcurlyhvRDVr8d4A0C69JCRgUOP7eWoy7k+L7xM4AqsA+R
 ImtFOIHMDM9eMJCjMLbzceTBOKaEwhhaPX02jIM8pvfy+UYT0aqwJCAu/4d/ccF9H4dM
 68q+/lVm/9hleyPnnFduuuijPjquniyaxbReiQ2sf9x+ljNEflEhCW1rR0um8DGQ9SGq
 P36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3+B2jsEG74M+bv+PYUqftLVPNrTmVzE0e8dGC2xmTQ4=;
 b=YwLT++mNdNRVoXgr8juzSazUXqMQX6RBDCCn7r2QsD4lCgncJwaqqbfNu6+EMv5jc+
 T72RVg06IDb8rvPhV6EJs1EsGWIOo37D00EUeg/O1QTqN+nYDb4mE405kSTDQS7arXyo
 VMc3EgphHjw9/Y5fWCBsA12d9Y5oJTatTcTFW9J3H4emxnlG2X3QhztkveRDbv31WuJs
 /mgEyQoXWJ3sffY6bu+FUovRciIA/FQ8CTo4aWzjIMJj6koS/p3imBshhW5gd+PCbFCa
 szw8/kEtfxMyf0NXjGSL6oIVtI7YDr2sQ9y7ICRgH0YSQndFm/E+gfkzUSfrdI5lEM1J
 M2zg==
X-Gm-Message-State: APjAAAVPbpE3CiqFzIpKcdIQKct0u2vv7/yMTRY/6Pm+VePwC+tjYC8R
 gRhPUfQMnc4C/dvItDMBBEM4ZKRf
X-Google-Smtp-Source: APXvYqxd7RtI80cT+3KyoeeXllEMvlPv8l8eMoVj/w4I+uc/UAEIX14Rx4eO+mHhSnaiFZIEeHSd8Q==
X-Received: by 2002:ac2:465e:: with SMTP id s30mr16821470lfo.134.1575999702037; 
 Tue, 10 Dec 2019 09:41:42 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id x84sm1995477lfa.97.2019.12.10.09.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 09:41:41 -0800 (PST)
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
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db3bee1e-1bfa-2f9e-9ed1-91b98554556a@gmail.com>
Date: Tue, 10 Dec 2019 20:41:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Dec 2019 07:38:39 +0100
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

MDkuMTIuMjAxOSAyMzo0NiwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IAo+IE9u
IDEyLzkvMTkgMTI6MTIgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDguMTIuMjAxOSAw
MDozNiwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+Pj4gT24gMTIvNy8xOSAxMTo1
OSBBTSwgU293amFueWEgS29tYXRpbmVuaSB3cm90ZToKPj4+PiBPbiAxMi83LzE5IDg6MDAgQU0s
IERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4gMDcuMTIuMjAxOSAxODo1MywgRG1pdHJ5IE9z
aXBlbmtvINC/0LjRiNC10YI6Cj4+Pj4+PiAwNy4xMi4yMDE5IDE4OjQ3LCBEbWl0cnkgT3NpcGVu
a28g0L/QuNGI0LXRgjoKPj4+Pj4+PiAwNy4xMi4yMDE5IDE3OjI4LCBEbWl0cnkgT3NpcGVua28g
0L/QuNGI0LXRgjoKPj4+Pj4+Pj4gMDYuMTIuMjAxOSAwNTo0OCwgU293amFueWEgS29tYXRpbmVu
aSDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4gVGVncmEyMTAgYW5kIHByaW9yIFRlZ3JhIFBNQyBoYXMg
Y2xrX291dF8xLCBjbGtfb3V0XzIsIGNsa19vdXRfMwo+Pj4+Pj4+Pj4gd2l0aAo+Pj4+Pj4+Pj4g
bXV4IGFuZCBnYXRlIGZvciBlYWNoIG9mIHRoZXNlIGNsb2Nrcy4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+
PiBDdXJyZW50bHkgdGhlc2UgUE1DIGNsb2NrcyBhcmUgcmVnaXN0ZXJlZCBieSBUZWdyYSBjbG9j
ayBkcml2ZXIKPj4+Pj4+Pj4+IHVzaW5nCj4+Pj4+Pj4+PiBjbGtfcmVnaXN0ZXJfbXV4IGFuZCBj
bGtfcmVnaXN0ZXJfZ2F0ZSBieSBwYXNzaW5nIFBNQyBiYXNlIGFkZHJlc3MKPj4+Pj4+Pj4+IGFu
ZCByZWdpc3RlciBvZmZzZXRzIGFuZCBQTUMgcHJvZ3JhbW1pbmcgZm9yIHRoZXNlIGNsb2NrcyBo
YXBwZW5zCj4+Pj4+Pj4+PiB0aHJvdWdoIGRpcmVjdCBQTUMgYWNjZXNzIGJ5IHRoZSBjbG9jayBk
cml2ZXIuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gV2l0aCB0aGlzLCB3aGVuIFBNQyBpcyBpbiBzZWN1
cmUgbW9kZSBhbnkgZGlyZWN0IFBNQyBhY2Nlc3MKPj4+Pj4+Pj4+IGZyb20gdGhlCj4+Pj4+Pj4+
PiBub24tc2VjdXJlIHdvcmxkIGRvZXMgbm90IGdvIHRocm91Z2ggYW5kIHRoZXNlIGNsb2NrcyB3
aWxsIG5vdCBiZQo+Pj4+Pj4+Pj4gZnVuY3Rpb25hbC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBUaGlz
IHBhdGNoIGFkZHMgdGhlc2UgY2xvY2tzIHJlZ2lzdHJhdGlvbiB3aXRoIFBNQyBhcyBhIGNsb2Nr
Cj4+Pj4+Pj4+PiBwcm92aWRlcgo+Pj4+Pj4+Pj4gZm9yIHRoZXNlIGNsb2Nrcy4gY2xrX29wcyBj
YWxsYmFjayBpbXBsZW1lbnRhdGlvbnMgZm9yIHRoZXNlCj4+Pj4+Pj4+PiBjbG9ja3MKPj4+Pj4+
Pj4+IHVzZXMgdGVncmFfcG1jX3JlYWRsIGFuZCB0ZWdyYV9wbWNfd3JpdGVsIHdoaWNoIHN1cHBv
cnRzIFBNQwo+Pj4+Pj4+Pj4gcHJvZ3JhbW1pbmcKPj4+Pj4+Pj4+IGluIHNlY3VyZSBtb2RlIGFu
ZCBub24tc2VjdXJlIG1vZGUuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogU293
amFueWEgS29tYXRpbmVuaSA8c2tvbWF0aW5lbmlAbnZpZGlhLmNvbT4KPj4+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+IFtzbmlwXQo+Pj4+Pj4+Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArc3RhdGljIGNvbnN0
IHN0cnVjdCBjbGtfb3BzIHBtY19jbGtfZ2F0ZV9vcHMgPSB7Cj4+Pj4+Pj4+PiArwqDCoMKgIC5p
c19lbmFibGVkID0gcG1jX2Nsa19pc19lbmFibGVkLAo+Pj4+Pj4+Pj4gK8KgwqDCoCAuZW5hYmxl
ID0gcG1jX2Nsa19lbmFibGUsCj4+Pj4+Pj4+PiArwqDCoMKgIC5kaXNhYmxlID0gcG1jX2Nsa19k
aXNhYmxlLAo+Pj4+Pj4+Pj4gK307Cj4+Pj4+Pj4+IFdoYXQncyB0aGUgYmVuZWZpdCBvZiBzZXBh
cmF0aW5nIEdBVEUgZnJvbSB0aGUgTVVYPwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIHRoaW5rIGl0IGNv
dWxkIGJlIGEgc2luZ2xlIGNsb2NrLgo+Pj4+Pj4+IEFjY29yZGluZyB0byBUUk06Cj4+Pj4+Pj4K
Pj4+Pj4+PiAxLiBHQVRFIGFuZCBNVVggYXJlIHNlcGFyYXRlIGVudGl0aWVzLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gMi4gR0FURSBpcyB0aGUgcGFyZW50IG9mIE1VWCAoc2VlIFBNQydzIENMS19PVVQgcGF0
aHMgZGlhZ3JhbSBpbgo+Pj4+Pj4+IFRSTSkuCj4+Pj4+Pj4KPj4+Pj4+PiAzLiBQTUMgZG9lc24n
dCBnYXRlIEVYVFBFUklQSCBjbG9jayBidXQgY291bGQgImZvcmNlLWVuYWJsZSIgaXQsCj4+Pj4+
Pj4gY29ycmVjdD8KPj4+IFdhcyBmb2xsb3dpbmcgZXhpc3RpbmcgY2xrLXRlZ3JhLXBtYyBhcyBJ
IGFtIG5vdCBzdXJlIG9mIHJlYXNvbiBmb3IKPj4+IGhhdmluZyB0aGVzZSBjbG9ja3MgcmVnaXN0
ZXJlZCBhcyBzZXBhcmF0ZSBtdXggYW5kIGdhdGUgY2xvY2tzLgo+Pj4KPj4+IFllcywgUE1DIGNs
b2NrcyBjYW4gYmUgcmVnaXN0ZXJlZCBhcyBzaW5nbGUgY2xvY2sgYW5kIGNhbiB1c2UgY2xrX29w
cwo+Pj4gZm9yIHNldC9nZXQgcGFyZW50IGFuZCBlbmFibGUvZGlzYWJsZS4KPj4+Cj4+PiBlbmFi
bGUvZGlzYWJsZSBvZiBQTUMgY2xvY2tzIGlzIGZvciBmb3JjZS1lbmFibGUgdG8gZm9yY2UgdGhl
IGNsb2NrIHRvCj4+PiBydW4gcmVnYXJkbGVzcyBvZiBBQ0NFUFRfUkVRIG9yIElOVkVSVF9SRVEu
Cj4+Pgo+Pj4+Pj4gNC4gY2xrX21fZGl2Mi80IGFyZSBpbnRlcm5hbCBQTUMgT1NDIGRpdmlkZXJz
IGFuZCB0aHVzIHRoZXNlIGNsb2Nrcwo+Pj4+Pj4gc2hvdWxkIGJlbG9uZyB0byBQTUMuCj4+Pj4+
IEFsc28sIGl0IHNob3VsZCBiZSAib3NjIiBhbmQgbm90ICJjbGtfbSIuCj4+Pj4gSSBmb2xsb3dl
ZCB0aGUgc2FtZSBwYXJlbnRzIGFzIGl0IHdlcmUgaW4gZXhpc3RpbmcgY2xrLXRlZ3JhLXBtYwo+
Pj4+IGRyaXZlci4KPj4+Pgo+Pj4+IFllYWggdGhleSBhcmUgd3JvbmcgYW5kIHRoZXkgc2hvdWxk
IGJlIGZyb20gb3NjIGFuZCBub3QgY2xrX20uCj4+Pj4KPj4+PiBXaWxsIGZpeCBpbiBuZXh0IHZl
cnNpb24uCj4+Pj4KPj4gQ291bGQgeW91IHBsZWFzZSBkZXNjcmliZSB0aGUgZnVsbCBFWFRQRVJJ
UEggY2xvY2sgdG9wb2xvZ3kgYW5kIGhvdyB0aGUKPj4gcGlubXV4IGNvbmZpZ3VyYXRpb24gaXMg
cmVsYXRlZCB0byBpdCBhbGw/Cj4+Cj4+IFdoYXQgaXMgaW50ZXJuYWwgdG8gdGhlIFRlZ3JhIGNo
aXAgYW5kIHdoYXQgYXJlIHRoZSBleHRlcm5hbCBvdXRwdXRzPwo+Pgo+PiBJcyBpdCBwb3NzaWJs
ZSB0byBieXBhc3MgUE1DIG9uIFQzMCsgZm9yIHRoZSBFWFRQRVJJUEggY2xvY2tzPwo+IAo+IFBN
QyBDTEsxLzIvMyBwb3NzaWJsZSBzb3VyY2VzIGFyZSBPU0NfRElWMSwgT1NDX0RJVjIsIE9TQ19E
SVY0LAo+IEVYVFBFUklQSCBmcm9tIENBUi4KPiAKPiBPU0NfRElWMS8yLzQgYXJlIHdpdGggaW50
ZXJuYWwgZGl2aWRlcnMgYXQgdGhlIE9TQyBQYWRzCj4gCj4gRVhUUEVSSVBIIGlzIGZyb20gQ0FS
IGFuZCBpdCBoYXMgcmVzZXQgYW5kIGVuYWJsZSBjb250cm9scyBhbG9uZyB3aXRoCj4gY2xvY2sg
c291cmNlIHNlbGVjdGlvbnMgdG8gY2hvb3NlIG9uZSBvZiB0aGUgUExMQV9PVVQwLCBDTEtfUywK
PiBQTExQX09VVDAsIENMS19NLCBQTExFX09VVDAKCkFyZSB5b3Ugc3VyZSB0aGF0IEVYVFBFUklQ
SCBoYXMgYSByZXNldD8gV2hhdCB3aWxsIGl0IHJlc2V0PyBXaHkgaXQncwpub3QgZG9jdW1lbnRl
ZCBpbiBUUk0/Cgo+IFNvLCBQTUMgQ0xLMS8yLzQgcG9zc2libGUgcGFyZW50cyBhcmUgT1NDX0RJ
VjEsIE9TQ19ESVYyLCBPU0NfRElWNCwgRVhURVJOLgo+IAo+IAo+IENMSzEvMi8zIGFsc28gaGFz
IFBpbm11eCB0byByb3V0ZSBFWFRQRVJJUEggb3V0cHV0IG9uIHRvIHRoZXNlIHBpbnMuCgpDb3Vs
ZCB5b3UgcGxlYXNlIGNsYXJpZnkgd2hhdCBhcmUgInRoZXNlIiBwaW5zPyBQZXJoYXBzIHlvdSBt
ZWFudCB0aGUKRVhURVJOIHBpbiBvZiBQTUM/Cgo+IFdoZW4gRVhURVJOIG91dHB1dCBjbG9jayBp
cyBzZWxlY3RlZCBmb3IgdGhlc2UgUE1DIGNsb2NrcyB0aHJ1Cj4gQ0xLeF9TUkNfU0VMLCBvdXRw
dXQgY2xvY2sgaXMgZnJvbSBkcml2ZXIgYnkgRVhUUEVSSVBIIGZyb20gQ0FSIHZpYQo+IFBpbm11
eCBsb2dpYyBvciBkcml2ZW4gYXMgcGVyIENMS3hfU1JDX1NFTCBieXBhc3NpbmcgcGlubXV4IGJh
c2VkIG9uCj4gQ0xLeF9BQ0NFUFRfUkVRIGJpdC4KPiAKPiAKPiBQTUMgQ2xvY2sgY29udHJvbCBy
ZWdpc3RlciBoYXMgYml0IENMS3hfQUNDRVBUX1JFUQo+IFdoZW4gQ0xLeF9BQ0NFUFRfUkVRID0g
MCwgb3V0cHV0IGNsb2NrIGRyaXZlciBpcyBmcm9tIGJ5IEVYVFBFUklQSAo+IHRocm91Z2ggdGhl
IHBpbm11eAo+IFdoZW4gQ0xLeF9BQ0NFUFRfUkVRID0gMSwgb3V0cHV0IGNsb2NrIGlzIGJhc2Vk
IG9uIENMS3hfU1JDX1NFTCBiaXRzCj4gKE9TQ19ESVYxLzIvNCBhbmQgRVhUUEVSSVBIIGNsb2Nr
IGJ5cGFzc2luZyB0aGUgcGlubXV4KQo+IAo+IEZPUkNFX0VOIGJpdCBpbiBQTUMgQ0xvY2sgY29u
dHJvbCByZWdpc3RlciBmb3JjZXMgdGhlIGNsb2NrIHRvIHJ1bgo+IHJlZ2FyZGxlc3Mgb2YgdGhp
cy4KCk9rYXkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
