Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 625BD11CFAA
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:22:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E770416E2;
	Thu, 12 Dec 2019 15:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E770416E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160571;
	bh=buwgsgaZP9KT3tvh12V7YiVjdB5AVpQU9+oSmDXi9/g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Es3odIvJgrXnggX5a+afHRZKWscRtDRPlAUQFbHq5dJ6SXjSslK3Ry1a05S4Q7eeQ
	 bdpS5QdNiQBRQFPzOC2jItyv7pGp3X4hJZ3OakSx9ZxE3Npfa+KcseOIvPFNBxO1IQ
	 jhqCFS3hH9Feuq1edNcVi4uBi/95wNhPp/2j2YkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74278F80259;
	Thu, 12 Dec 2019 15:19:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 336DFF801F4; Thu, 12 Dec 2019 02:39:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_30, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4504AF800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 02:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4504AF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="czfeMlbA"
Received: by mail-lj1-x243.google.com with SMTP id e28so329179ljo.9
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bqxzhgdGZNhkxunyYQSbh59QLtmloCd3WtfRiMYQPto=;
 b=czfeMlbAEYXz0vXlbVuxjrr8ubv4YllExI80yT2QzsMEhV2uFBBEoeHfovOHINDCeG
 k469H0iJdV3K/cifYPToJF+dp8cuyiKTVujK6Qd9oIstv/b5YIYD89LrVyQoTAY1cRwl
 gsNbAqJXOXP5hkPm/tVB2bPbfmQnvRUtM9uYgysLmKyATf4Mogg9Hs19J1FZJL7FP9mi
 pHLHlyT5wFGjE/Ke0FidgJfc2KG3mzPUNDsHCSwyznK6UWXnz1MhRnCx8etNt1Od+S/b
 ujeK4L+aXeoO0tdy/eeL00sPH6vZK9b7o10bLXukpiWmJsPE4C1kS+AodU3GPyAfET3c
 rxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bqxzhgdGZNhkxunyYQSbh59QLtmloCd3WtfRiMYQPto=;
 b=TDk8Br76RNJ0QpYaBgt00eJT8Z9tGB/T4nGAGMEZvx9zwIaYxOB8ZRYIwVeARTS7sD
 lGKNZaODwnWvsDOm052ByM2SO+9mfuaEsNFueVS55yEzRy7Mk1+rHnfjgMOh/SDWtmrb
 OgMqswkiMXIOHGwNDCDVST4TrjrqZyjlvJP+WgKenrRRTnS7IqgPYGWv8a2nZgHemvQl
 my2qqrN5CUGPk6XFfpOwCgtZ1nVw+iiJqzocDHzRRoQC9exyRzMQInyIc8PLnAon9ON6
 eYQ86ke3iMwGc/ywIdg/crJG0a+Bs9pO/p4An2kX1ZkTh8mpf5XqGPzZv2ikSQxy8o1D
 BHkQ==
X-Gm-Message-State: APjAAAXE6LnjyxrQpVXAPwgEvICSSIwckaH0E9VCFBvdqltUAyLmu2NP
 Cd6ZTsi/ax5534+ACuxBtecRFNM8
X-Google-Smtp-Source: APXvYqycflaulLJPW1gce2m3mrKE/XyE11yqkOAzLcbpcf5sIe3xLgXDDn9ICItxJURgoMhBxRGf4A==
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr3592515ljg.3.1576114750634;
 Wed, 11 Dec 2019 17:39:10 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id c8sm1959778lfm.65.2019.12.11.17.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 17:39:09 -0800 (PST)
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
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
 <8eb792ad-cded-05cc-93fc-763be7ee66aa@nvidia.com>
 <bb966cf2-50f6-6729-7644-54d71d55bbcb@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <02109d70-2747-c246-5401-69a2d5c84771@gmail.com>
Date: Thu, 12 Dec 2019 04:39:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <bb966cf2-50f6-6729-7644-54d71d55bbcb@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:28 +0100
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

MTEuMTIuMjAxOSAyMTo1MCwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IAo+IE9u
IDEyLzEwLzE5IDU6MDYgUE0sIFNvd2phbnlhIEtvbWF0aW5lbmkgd3JvdGU6Cj4+Cj4+IE9uIDEy
LzEwLzE5IDk6NDEgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDEwLjEyLjIwMTkgMTk6
NTMsIFNvd2phbnlhIEtvbWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+PiBPbiAxMi85LzE5IDM6MDMg
UE0sIFNvd2phbnlhIEtvbWF0aW5lbmkgd3JvdGU6Cj4+Pj4+IE9uIDEyLzkvMTkgMTI6NDYgUE0s
IFNvd2phbnlhIEtvbWF0aW5lbmkgd3JvdGU6Cj4+Pj4+PiBPbiAxMi85LzE5IDEyOjEyIFBNLCBE
bWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+Pj4gMDguMTIuMjAxOSAwMDozNiwgU293amFueWEg
S29tYXRpbmVuaSDQv9C40YjQtdGCOgo+Pj4+Pj4+PiBPbiAxMi83LzE5IDExOjU5IEFNLCBTb3dq
YW55YSBLb21hdGluZW5pIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMTIvNy8xOSA4OjAwIEFNLCBEbWl0
cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+Pj4+Pj4gMDcuMTIuMjAxOSAxODo1MywgRG1pdHJ5IE9z
aXBlbmtvINC/0LjRiNC10YI6Cj4+Pj4+Pj4+Pj4+IDA3LjEyLjIwMTkgMTg6NDcsIERtaXRyeSBP
c2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4+Pj4gMDcuMTIuMjAxOSAxNzoyOCwgRG1pdHJ5
IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+Pj4+Pj4+Pj4+Pj4gMDYuMTIuMjAxOSAwNTo0OCwgU293
amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4+Pj4+PiBUZWdyYTIxMCBhbmQg
cHJpb3IgVGVncmEgUE1DIGhhcyBjbGtfb3V0XzEsIGNsa19vdXRfMiwKPj4+Pj4+Pj4+Pj4+Pj4g
Y2xrX291dF8zCj4+Pj4+Pj4+Pj4+Pj4+IHdpdGgKPj4+Pj4+Pj4+Pj4+Pj4gbXV4IGFuZCBnYXRl
IGZvciBlYWNoIG9mIHRoZXNlIGNsb2Nrcy4KPj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4g
Q3VycmVudGx5IHRoZXNlIFBNQyBjbG9ja3MgYXJlIHJlZ2lzdGVyZWQgYnkgVGVncmEgY2xvY2sK
Pj4+Pj4+Pj4+Pj4+Pj4gZHJpdmVyCj4+Pj4+Pj4+Pj4+Pj4+IHVzaW5nCj4+Pj4+Pj4+Pj4+Pj4+
IGNsa19yZWdpc3Rlcl9tdXggYW5kIGNsa19yZWdpc3Rlcl9nYXRlIGJ5IHBhc3NpbmcgUE1DIGJh
c2UKPj4+Pj4+Pj4+Pj4+Pj4gYWRkcmVzcwo+Pj4+Pj4+Pj4+Pj4+PiBhbmQgcmVnaXN0ZXIgb2Zm
c2V0cyBhbmQgUE1DIHByb2dyYW1taW5nIGZvciB0aGVzZSBjbG9ja3MKPj4+Pj4+Pj4+Pj4+Pj4g
aGFwcGVucwo+Pj4+Pj4+Pj4+Pj4+PiB0aHJvdWdoIGRpcmVjdCBQTUMgYWNjZXNzIGJ5IHRoZSBj
bG9jayBkcml2ZXIuCj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+IFdpdGggdGhpcywgd2hl
biBQTUMgaXMgaW4gc2VjdXJlIG1vZGUgYW55IGRpcmVjdCBQTUMgYWNjZXNzCj4+Pj4+Pj4+Pj4+
Pj4+IGZyb20gdGhlCj4+Pj4+Pj4+Pj4+Pj4+IG5vbi1zZWN1cmUgd29ybGQgZG9lcyBub3QgZ28g
dGhyb3VnaCBhbmQgdGhlc2UgY2xvY2tzIHdpbGwKPj4+Pj4+Pj4+Pj4+Pj4gbm90IGJlCj4+Pj4+
Pj4+Pj4+Pj4+IGZ1bmN0aW9uYWwuCj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+IFRoaXMg
cGF0Y2ggYWRkcyB0aGVzZSBjbG9ja3MgcmVnaXN0cmF0aW9uIHdpdGggUE1DIGFzIGEgY2xvY2sK
Pj4+Pj4+Pj4+Pj4+Pj4gcHJvdmlkZXIKPj4+Pj4+Pj4+Pj4+Pj4gZm9yIHRoZXNlIGNsb2Nrcy4g
Y2xrX29wcyBjYWxsYmFjayBpbXBsZW1lbnRhdGlvbnMgZm9yIHRoZXNlCj4+Pj4+Pj4+Pj4+Pj4+
IGNsb2Nrcwo+Pj4+Pj4+Pj4+Pj4+PiB1c2VzIHRlZ3JhX3BtY19yZWFkbCBhbmQgdGVncmFfcG1j
X3dyaXRlbCB3aGljaCBzdXBwb3J0cyBQTUMKPj4+Pj4+Pj4+Pj4+Pj4gcHJvZ3JhbW1pbmcKPj4+
Pj4+Pj4+Pj4+Pj4gaW4gc2VjdXJlIG1vZGUgYW5kIG5vbi1zZWN1cmUgbW9kZS4KPj4+Pj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogU293amFueWEgS29tYXRpbmVuaSA8
c2tvbWF0aW5lbmlAbnZpZGlhLmNvbT4KPj4+Pj4+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+Pj4+PiBb
c25pcF0KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4+Pj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgY2xrX29wcyBwbWNfY2xrX2dhdGVfb3BzID0gewo+Pj4+Pj4+Pj4+Pj4+
PiArwqDCoMKgIC5pc19lbmFibGVkID0gcG1jX2Nsa19pc19lbmFibGVkLAo+Pj4+Pj4+Pj4+Pj4+
PiArwqDCoMKgIC5lbmFibGUgPSBwbWNfY2xrX2VuYWJsZSwKPj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDC
oCAuZGlzYWJsZSA9IHBtY19jbGtfZGlzYWJsZSwKPj4+Pj4+Pj4+Pj4+Pj4gK307Cj4+Pj4+Pj4+
Pj4+Pj4gV2hhdCdzIHRoZSBiZW5lZml0IG9mIHNlcGFyYXRpbmcgR0FURSBmcm9tIHRoZSBNVVg/
Cj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBJIHRoaW5rIGl0IGNvdWxkIGJlIGEgc2luZ2xl
IGNsb2NrLgo+Pj4+Pj4+Pj4+Pj4gQWNjb3JkaW5nIHRvIFRSTToKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4+PiAxLiBHQVRFIGFuZCBNVVggYXJlIHNlcGFyYXRlIGVudGl0aWVzLgo+Pj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Pj4+IDIuIEdBVEUgaXMgdGhlIHBhcmVudCBvZiBNVVggKHNlZSBQTUMncyBD
TEtfT1VUIHBhdGhzIGRpYWdyYW0KPj4+Pj4+Pj4+Pj4+IGluIFRSTSkuCj4+Pj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+Pj4gMy4gUE1DIGRvZXNuJ3QgZ2F0ZSBFWFRQRVJJUEggY2xvY2sgYnV0IGNvdWxk
ICJmb3JjZS1lbmFibGUiCj4+Pj4+Pj4+Pj4+PiBpdCwKPj4+Pj4+Pj4+Pj4+IGNvcnJlY3Q/Cj4+
Pj4+Pj4+IFdhcyBmb2xsb3dpbmcgZXhpc3RpbmcgY2xrLXRlZ3JhLXBtYyBhcyBJIGFtIG5vdCBz
dXJlIG9mIHJlYXNvbiBmb3IKPj4+Pj4+Pj4gaGF2aW5nIHRoZXNlIGNsb2NrcyByZWdpc3RlcmVk
IGFzIHNlcGFyYXRlIG11eCBhbmQgZ2F0ZSBjbG9ja3MuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFllcywg
UE1DIGNsb2NrcyBjYW4gYmUgcmVnaXN0ZXJlZCBhcyBzaW5nbGUgY2xvY2sgYW5kIGNhbiB1c2UK
Pj4+Pj4+Pj4gY2xrX29wcwo+Pj4+Pj4+PiBmb3Igc2V0L2dldCBwYXJlbnQgYW5kIGVuYWJsZS9k
aXNhYmxlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBlbmFibGUvZGlzYWJsZSBvZiBQTUMgY2xvY2tzIGlz
IGZvciBmb3JjZS1lbmFibGUgdG8gZm9yY2UgdGhlCj4+Pj4+Pj4+IGNsb2NrIHRvCj4+Pj4+Pj4+
IHJ1biByZWdhcmRsZXNzIG9mIEFDQ0VQVF9SRVEgb3IgSU5WRVJUX1JFUS4KPj4+Pj4+Pj4KPj4+
Pj4+Pj4+Pj4gNC4gY2xrX21fZGl2Mi80IGFyZSBpbnRlcm5hbCBQTUMgT1NDIGRpdmlkZXJzIGFu
ZCB0aHVzIHRoZXNlCj4+Pj4+Pj4+Pj4+IGNsb2Nrcwo+Pj4+Pj4+Pj4+PiBzaG91bGQgYmVsb25n
IHRvIFBNQy4KPj4+Pj4+Pj4+PiBBbHNvLCBpdCBzaG91bGQgYmUgIm9zYyIgYW5kIG5vdCAiY2xr
X20iLgo+Pj4+Pj4+Pj4gSSBmb2xsb3dlZCB0aGUgc2FtZSBwYXJlbnRzIGFzIGl0IHdlcmUgaW4g
ZXhpc3RpbmcgY2xrLXRlZ3JhLXBtYwo+Pj4+Pj4+Pj4gZHJpdmVyLgo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+IFllYWggdGhleSBhcmUgd3JvbmcgYW5kIHRoZXkgc2hvdWxkIGJlIGZyb20gb3NjIGFuZCBu
b3QgY2xrX20uCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gV2lsbCBmaXggaW4gbmV4dCB2ZXJzaW9uLgo+
Pj4+Pj4+Pj4KPj4+Pj4gUmVnIGNsa19tX2RpdjIvMywgdGhleSBhcmUgZGl2aWRlcnMgYXQgT1ND
IHBhZCBhbmQgbm90IHJlYWxseSBpbnRlcm5hbAo+Pj4+PiB0byBQTUMgYmxvY2suCj4+Pj4+Cj4+
Pj4+IGN1cnJlbnQgY2xvY2sgZHJpdmVyIGNyZWF0ZXMgY2xrX21fZGl2IGNsb2NrcyB3aGljaCBz
aG91bGQgYWN0dWFsbHkgYmUKPj4+Pj4gb3NjX2RpdjIvb3NjX2RpdjQgY2xvY2tzIHdpdGggb3Nj
IGFzIHBhcmVudC4KPj4+Pj4KPj4+Pj4gVGhlcmUgYXJlIG5vIGNsa19tX2RpdjIgYW5kIGNsa19t
X2RpdjQgZnJvbSBjbGtfbQo+Pj4+Pgo+Pj4+PiBXaWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lv
bi4KPj4+Pj4KPj4+Pj4+PiBDb3VsZCB5b3UgcGxlYXNlIGRlc2NyaWJlIHRoZSBmdWxsIEVYVFBF
UklQSCBjbG9jayB0b3BvbG9neSBhbmQKPj4+Pj4+PiBob3cgdGhlCj4+Pj4+Pj4gcGlubXV4IGNv
bmZpZ3VyYXRpb24gaXMgcmVsYXRlZCB0byBpdCBhbGw/Cj4+Pj4+Pj4KPj4+Pj4+PiBXaGF0IGlz
IGludGVybmFsIHRvIHRoZSBUZWdyYSBjaGlwIGFuZCB3aGF0IGFyZSB0aGUgZXh0ZXJuYWwKPj4+
Pj4+PiBvdXRwdXRzPwo+Pj4+Pj4+Cj4+Pj4+Pj4gSXMgaXQgcG9zc2libGUgdG8gYnlwYXNzIFBN
QyBvbiBUMzArIGZvciB0aGUgRVhUUEVSSVBIIGNsb2Nrcz8KPj4+Pj4+IFBNQyBDTEsxLzIvMyBw
b3NzaWJsZSBzb3VyY2VzIGFyZSBPU0NfRElWMSwgT1NDX0RJVjIsIE9TQ19ESVY0LAo+Pj4+Pj4g
RVhUUEVSSVBIIGZyb20gQ0FSLgo+Pj4+Pj4KPj4+Pj4+IE9TQ19ESVYxLzIvNCBhcmUgd2l0aCBp
bnRlcm5hbCBkaXZpZGVycyBhdCB0aGUgT1NDIFBhZHMKPj4+Pj4+Cj4+Pj4+PiBFWFRQRVJJUEgg
aXMgZnJvbSBDQVIgYW5kIGl0IGhhcyByZXNldCBhbmQgZW5hYmxlIGNvbnRyb2xzIGFsb25nIHdp
dGgKPj4+Pj4+IGNsb2NrIHNvdXJjZSBzZWxlY3Rpb25zIHRvIGNob29zZSBvbmUgb2YgdGhlIFBM
TEFfT1VUMCwgQ0xLX1MsCj4+Pj4+PiBQTExQX09VVDAsIENMS19NLCBQTExFX09VVDAKPj4+Pj4+
Cj4+Pj4+PiBTbywgUE1DIENMSzEvMi80IHBvc3NpYmxlIHBhcmVudHMgYXJlIE9TQ19ESVYxLCBP
U0NfRElWMiwgT1NDX0RJVjQsCj4+Pj4+PiBFWFRFUk4uCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IENM
SzEvMi8zIGFsc28gaGFzIFBpbm11eCB0byByb3V0ZSBFWFRQRVJJUEggb3V0cHV0IG9uIHRvIHRo
ZXNlIHBpbnMuCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFdoZW4gRVhURVJOIG91dHB1dCBjbG9jayBp
cyBzZWxlY3RlZCBmb3IgdGhlc2UgUE1DIGNsb2NrcyB0aHJ1Cj4+Pj4+PiBDTEt4X1NSQ19TRUws
IG91dHB1dCBjbG9jayBpcyBmcm9tIGRyaXZlciBieSBFWFRQRVJJUEggZnJvbSBDQVIgdmlhCj4+
Pj4+PiBQaW5tdXggbG9naWMgb3IgZHJpdmVuIGFzIHBlciBDTEt4X1NSQ19TRUwgYnlwYXNzaW5n
IHBpbm11eCBiYXNlZCBvbgo+Pj4+Pj4gQ0xLeF9BQ0NFUFRfUkVRIGJpdC4KPj4+Pj4+Cj4+Pj4+
Pgo+Pj4+Pj4gUE1DIENsb2NrIGNvbnRyb2wgcmVnaXN0ZXIgaGFzIGJpdCBDTEt4X0FDQ0VQVF9S
RVEKPj4+Pj4+IFdoZW4gQ0xLeF9BQ0NFUFRfUkVRID0gMCwgb3V0cHV0IGNsb2NrIGRyaXZlciBp
cyBmcm9tIGJ5IEVYVFBFUklQSAo+Pj4+Pj4gdGhyb3VnaCB0aGUgcGlubXV4Cj4+Pj4+PiBXaGVu
IENMS3hfQUNDRVBUX1JFUSA9IDEsIG91dHB1dCBjbG9jayBpcyBiYXNlZCBvbiBDTEt4X1NSQ19T
RUwgYml0cwo+Pj4+Pj4gKE9TQ19ESVYxLzIvNCBhbmQgRVhUUEVSSVBIIGNsb2NrIGJ5cGFzc2lu
ZyB0aGUgcGlubXV4KQo+Pj4+Pj4KPj4+Pj4+IEZPUkNFX0VOIGJpdCBpbiBQTUMgQ0xvY2sgY29u
dHJvbCByZWdpc3RlciBmb3JjZXMgdGhlIGNsb2NrIHRvIHJ1bgo+Pj4+Pj4gcmVnYXJkbGVzcyBv
ZiB0aGlzLgo+Pj4+IFBNQyBjbG9jayBnYXRlIGlzIGJhc2VkIG9uIHRoZSBzdGF0ZSBvZiBDTEt4
X0FDQ0VQVF9SRVEgYW5kIEZPUkNFX0VOCj4+Pj4gbGlrZSBleHBsYWluZWQgYWJvdmUuCj4+Pj4K
Pj4+PiBDTEt4X0FDQ0VQVF9SRVEgaXMgMCBkZWZhdWx0IGFuZCBGT1JDRV9FTiBhY3RzIGFzIGdh
dGUgdG8KPj4+PiBlbmFibGUvZGlzYWJsZQo+Pj4+IEVYVFBFUklQSCBjbG9jayBvdXRwdXQgdG8g
UE1DIENMS19PVVRfMS8yLzMuCj4+PiBbYW5kIHRvIGVuYWJsZSBPU0MgYXMgd2VsbF0KPj4+Cj4+
Pj4gU28gSSBiZWxpZXZlIHdlIG5lZWQgdG8gcmVnaXN0ZXIgYXMgTVVYIGFuZCBHYXRlIHJhdGhl
ciB0aGFuIGFzIGEKPj4+PiBzaW5nbGUKPj4+PiBjbG9jay4gUGxlYXNlIGNvbmZpcm0uCj4+PiAx
LiBUaGUgZm9yY2UtZW5hYmxpbmcgaXMgYXBwbGllZCB0byBib3RoIE9TQyBhbmQgRVhURVJOIHNv
dXJjZXMgb2YKPj4+IFBNQ19DTEtfT1VUX3ggYnkgUE1DIGF0IG9uY2UuCj4+Pgo+Pj4gMi4gQm90
aCBvZiBQTUMncyBmb3JjZS1lbmFibGluZyBhbmQgT1NDL0VYVEVSTiBzZWxlY3Rpb24gaXMgaW50
ZXJuYWwKPj4+IHRvIFBNQy4KPj4+Cj4+PiBTaG91bGQgYmUgYmV0dGVyIHRvIGRlZmluZSBpdCBh
cyBhIHNpbmdsZSAicG1jX2Nsa19vdXRfeCIuIEkgZG9uJ3Qgc2VlCj4+PiBhbnkgZ29vZCByZWFz
b25zIGZvciBkaWZmZXJlbnRpYXRpbmcgUE1DJ3MgR2F0ZSBmcm9tIHRoZSBNVVgsIGl0J3MgYQo+
Pj4gc2luZ2xlIGhhcmR3YXJlIHVuaXQgZnJvbSBhIHBvaW50IG9mIHZpZXcgb2YgdGhlIHJlc3Qg
b2YgdGhlIHN5c3RlbS4KPj4+Cj4+PiBQZXRlciwgZG8geW91IGhhdmUgYW55IG9iamVjdGlvbnM/
Cj4+Cj4+IFdlIGFkZGVkIGZhbGxiYWNrIG9wdGlvbiBmb3IgYXVkaW8gbWNsayBhbmQgYWxzbyBh
ZGRlZCBjaGVjayBmb3IKPj4gYXNzaWduZWQtY2xvY2stcGFyZW50cyBkdCBwcm9wZXJ0eSBpbiBh
dWRpbyBkcml2ZXIgYW5kIGlmIGl0cyBub3QgdGhlbgo+PiB3ZSBkbyBwYXJlbnQgaW5pdCBjb25m
aWd1cmF0aW9uIGluIGF1ZGlvIGRyaXZlci4KPj4KPj4gQ3VycmVudCBjbG9jayBkcml2ZXIgY3Jl
YXRlcyAyIHNlcGFyYXRlIGNsb2NrcyBjbGtfb3V0XzFfbXV4IGFuZAo+PiBjbGtfb3V0XzEgZm9y
IGVhY2ggcG1jIGNsb2NrIGluIGNsb2NrIGRyaXZlciBhbmQgdXNlcyBleHRlcm4xIGFzCj4+IHBh
cmVudCB0byBjbGtfb3V0XzFfbXV4IGFuZCBjbGtfb3V0XzFfbXV4IGlzIHBhcmVudCB0byBjbGtf
b3V0XzEuCj4+Cj4+IFdpdGggY2hhbmdlIG9mIHJlZ2lzdGVyaW5nIGVhY2ggcG1jIGNsb2NrIGFz
IGEgc2luZ2xlIGNsb2NrLCB3aGVuIHdlCj4+IGRvIHBhcmVudCBpbml0IGFzc2lnbm1lbnQgaW4g
YXVkaW8gZHJpdmVyIHdoZW4KPj4gYXNzaWduZWQtY2xvY2stcHJvcGVydGllcyBhcmUgbm90IHVz
ZWQgaW4gRFQgKGFzIHdlIHJlbW92ZWQgcGFyZW50Cj4+IGluaXRzIGZvciBleHRlcm4gYW5kIGNs
a19vdXRzIGZyb20gY2xvY2sgZHJpdmVyKSwgd2Ugc2hvdWxkIHN0aWxsIHRyeQo+PiB0byBnZXQg
Y2xvY2sgYmFzZWQgb24gY2xrX291dF8xX211eCBhcyBwYXJlbnQgYXNzaWdubWVudCBvZiBleHRl
cm4xIGlzCj4+IGZvciBjbGtfb3V0XzFfbXV4IGFzIHBlciBleGlzdGluZyBjbG9jayB0cmVlLgo+
Pgo+PiBjbGtfb3V0XzFfbXV4IGNsb2NrIHJldHJpZXZlIHdpbGwgZmFpbCB3aXRoIHRoaXMgY2hh
bmdlIG9mIHNpbmdsZQo+PiBjbG9jayB3aGVuIGFueSBuZXcgcGxhdGZvcm0gZGV2aWNlIHRyZWUg
ZG9lc24ndCBzcGVjaWZ5Cj4+IGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgcHJvcGVydGllcyBhbmQg
dGVncmFfYXNvY191dGlsc19pbml0IGZhaWxzLgoKWW91IG1hZGUgdGhlIFBNQy9DYVIgY2hhbmdl
cyBiZWZvcmUgdGhlIGF1ZGlvIGNoYW5nZXMsIHRoZSBjbGtfb3V0XzFfbXV4Cndvbid0IGV4aXN0
IGZvciB0aGUgYXVkaW8gZHJpdmVyIHBhdGNoZXMuCgpJZiB5b3UgY2FyZSBhYm91dCBiaXNlY3Qt
YWJpbGl0eSBvZiB0aGUgcGF0Y2hlcywgdGhlbiB0aGUgY2xvY2sgYW5kCmF1ZGlvIGNoYW5nZXMg
bmVlZCB0byBiZSBkb25lIGluIGEgc2luZ2xlIHBhdGNoLiBCdXQgSSBkb24ndCB0aGluayB0aGF0
Cml0J3Mgd29ydGh3aGlsZS4KCj4+IFdpdGggc2luZ2xlIGNsb2NrLCBleHRlcm4xIGlzIHRoZSBw
YXJlbnQgZm9yIGNsa19vdXRfMSBhbmQgd2l0aAo+PiBzZXBhcmF0ZSBjbG9ja3MgZm9yIG11eCBh
bmQgZ2F0ZSwgZXh0ZXJuMSBpcyB0aGUgcGFyZW50IGZvcgo+PiBjbGtfb3V0XzFfbXV4Lgo+IAo+
IElmIHdlIG1vdmUgdG8gc2luZ2xlIGNsb2NrIG5vdywgaXQgbmVlZCBvbmUgbW9yZSBhZGRpdGlv
bmFsIGZhbGxiYWNrCj4gaW1wbGVtZW50YXRpb24gaW4gYXVkaW8gZHJpdmVyIGR1cmluZyBwYXJl
bnQgY29uZmlndXJhdGlvbiBhcwo+IGNsa19vdXRfMV9tdXggd2lsbCBub3QgYmUgdGhlcmUgd2l0
aCBzaW5nbGUgY2xvY2sgY2hhbmdlIGFuZCBvbGQvY3VycmVudAo+IGtlcm5lbCBoYXMgaXQgYXMg
aXQgdXNlcyBzZXBhcmF0ZSBjbG9ja3MgZm9yIHBtYyBtdXggYW5kIGdhdGUuCgpXaHkgYWRkaXRp
b25hbCBmYWxsYmFjaz8gQWRkaXRpb25hbCB0byB3aGF0PwoKPiBBbHNvLCB3aXRoIHNpbmdsZSBj
bG9jayBmb3IgYm90aCBQTUMgbXV4IGFuZCBnYXRlIG5vdywgbmV3IERUIHNob3VsZCB1c2UKPiBl
eHRlcm4xIGFzIHBhcmVudCB0byBDTEtfT1VUXzEgYXMgQ0xLX09VVF8xX01VWCB3aWxsIG5vdCBi
ZSB0aGVyZSBvbGQKPiBQTUMgZHQtYmluZGluZ3MgaGFzIHNlcGFyYXRlIGNsb2NrcyBmb3IgTVVY
IChDTEtfT1VUXzFfTVVYKSBhbmQgZ2F0ZQo+IChDTEtfT1VUXzEpCj4gCj4gRFQgYmluZGluZ3Mg
d2lsbCBub3QgYmUgY29tcGF0aWJsZSBiL3cgb2xkIGFuZCBuZXcgY2hhbmdlcyBpZiB3ZSBtb3Zl
IHRvCj4gU2luZ2xlIFBNQyBjbG9jayBub3cuCgpTb3JyeSwgSSBkb24ndCB1bmRlcnN0YW5kIHdo
YXQgeW91J3JlIG1lYW5pbmcgYnkgdGhlICJuZXcgY2hhbmdlcyIuCgo+IFNob3VsZCB3ZSBnbyB3
aXRoIHNhbWUgc2VwYXJhdGUgY2xvY2tzIHRvIGhhdmUgaXQgY29tcGF0aWJsZSB0byBhdm9pZAo+
IGFsbCB0aGlzPwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
