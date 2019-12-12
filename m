Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7611DE60
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 08:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97746175D;
	Fri, 13 Dec 2019 08:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97746175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576220651;
	bh=Q9k6M7aTfiajxh6vbfy/upxYVrGaIN0rCSMpxMo8CjI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ei/TaY4wNmTdsoYVZ3NuJ4NUbzfK+KKhUS2DdThWhsZjM0iRVyTJe4ow5MMuFshwV
	 A44Q6JgrigcQR4ZNpXFc7/PgAiWGsCp2uKXgLsJx2ctK/+b0ckJUQcECWuu2bOWthi
	 M0h/NrgmE4sp3vDyO4oTW4nufTevMq40JQWAi5Lo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC6DF801F4;
	Fri, 13 Dec 2019 08:02:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8907F8020C; Thu, 12 Dec 2019 23:13:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_30, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F822F800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 23:13:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F822F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CDQ4V+Qq"
Received: by mail-lf1-x144.google.com with SMTP id y19so431685lfl.9
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 14:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lfsX3+pBp7PlVs+Ii6Rv5bMHyLo1TADBK6q0ZUFAL3Y=;
 b=CDQ4V+QqgTM98ql7RHXtN2+QtxqZGqds1WR+8uPjNS97fmPk1ZVro9Ups2CzIrq2lE
 jsdIVo3wYsRpkHdCtavC/NZX5lwNSYePJaTLQdKxhTabCedCJYHFKaZ2mD48A6FNYwHL
 1/JK2bbmVwyBQkH08uwr+jarlrWtYy8cKCKuKNz+TfEBeLhM96uhmv6x6Aek8RHEJmMW
 4q5dODP+6WaD9Sq09pgD7nA3iGpvbJO2bXhRNRLDeYUBK/0yIZU3OQvUe4QTtBQDfMHO
 pwd2ys1viSsqTV0NcQgGc14jABFcgYGPMBx4VFF8GmIhL4V7GOHqtkqK5uQ67BytiHA3
 ehUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lfsX3+pBp7PlVs+Ii6Rv5bMHyLo1TADBK6q0ZUFAL3Y=;
 b=oouYUxv67ADbJIaMJ10RzTUhVyx6QFapE8uOkeY9Yb5vlp2yEdxDyWujw/vZ8IUXEc
 6iqpFpF93uMe9E72MjokY0BnpO7i8cFUw0Ft4fIyzpeiW/Cfn3Tyi2WO0EvwjZqDr14L
 Z5uFXjR80arzFTCw0DbUL+wMiZWLwcdLSVgZdsWw+8iVIojDusyvQlMyfmbR4Du3UUjH
 O4sSauUcrErQ6pCn0nNNJ//cmn6Wf8zsEmtQlsNVEVsrJLhSp3/iap+AjSZ2F9/HKCKo
 irUpttcxEtMyb5kQiiSNM9Xh/t4LtikejB06U1ob8fq3RyRq4+TROAqEdN9Zca0Os7aC
 UVkw==
X-Gm-Message-State: APjAAAVZIlV/cfnMZ+eLO6K9VNYEzhOwi7oUcdKUqLKJHEruz4ejVQsP
 qy2M3nIeEzzvWgxTDuqN8iqFhPXb
X-Google-Smtp-Source: APXvYqzUFE2+eWrIDwPYrUSyGdFcvr8mcTa6QEr9LNtlA29ypj178O9suinGlyab1H643vTGNNQNCA==
X-Received: by 2002:a19:c80a:: with SMTP id y10mr6881489lff.177.1576188825724; 
 Thu, 12 Dec 2019 14:13:45 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id y25sm3537019lfy.59.2019.12.12.14.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 14:13:44 -0800 (PST)
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
 <02109d70-2747-c246-5401-69a2d5c84771@gmail.com>
 <01bf40ae-393d-3cb1-9ba2-acdd10385cb8@nvidia.com>
 <56b7d160-6156-59e5-66ec-712d64e1927a@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ec3c1f1-228d-31a6-a432-fd39e91b2baa@gmail.com>
Date: Fri, 13 Dec 2019 01:13:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <56b7d160-6156-59e5-66ec-712d64e1927a@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:02:25 +0100
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

MTIuMTIuMjAxOSAwNjo1NCwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IAo+IE9u
IDEyLzExLzE5IDc6NDUgUE0sIFNvd2phbnlhIEtvbWF0aW5lbmkgd3JvdGU6Cj4+Cj4+IE9uIDEy
LzExLzE5IDU6MzkgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDExLjEyLjIwMTkgMjE6
NTAsIFNvd2phbnlhIEtvbWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+PiBPbiAxMi8xMC8xOSA1OjA2
IFBNLCBTb3dqYW55YSBLb21hdGluZW5pIHdyb3RlOgo+Pj4+PiBPbiAxMi8xMC8xOSA5OjQxIEFN
LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+PiAxMC4xMi4yMDE5IDE5OjUzLCBTb3dqYW55
YSBLb21hdGluZW5pINC/0LjRiNC10YI6Cj4+Pj4+Pj4gT24gMTIvOS8xOSAzOjAzIFBNLCBTb3dq
YW55YSBLb21hdGluZW5pIHdyb3RlOgo+Pj4+Pj4+PiBPbiAxMi85LzE5IDEyOjQ2IFBNLCBTb3dq
YW55YSBLb21hdGluZW5pIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMTIvOS8xOSAxMjoxMiBQTSwgRG1p
dHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4+Pj4+IDA4LjEyLjIwMTkgMDA6MzYsIFNvd2phbnlh
IEtvbWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+Pj4gT24gMTIvNy8xOSAxMTo1OSBBTSwg
U293amFueWEgS29tYXRpbmVuaSB3cm90ZToKPj4+Pj4+Pj4+Pj4+IE9uIDEyLzcvMTkgODowMCBB
TSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4+IDA3LjEyLjIwMTkgMTg6NTMs
IERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4+Pj4+PiAwNy4xMi4yMDE5IDE4
OjQ3LCBEbWl0cnkgT3NpcGVua28g0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+Pj4+Pj4+IDA3LjEyLjIw
MTkgMTc6MjgsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4+Pj4+Pj4+IDA2
LjEyLjIwMTkgMDU6NDgsIFNvd2phbnlhIEtvbWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+
Pj4+Pj4+Pj4gVGVncmEyMTAgYW5kIHByaW9yIFRlZ3JhIFBNQyBoYXMgY2xrX291dF8xLCBjbGtf
b3V0XzIsCj4+Pj4+Pj4+Pj4+Pj4+Pj4+IGNsa19vdXRfMwo+Pj4+Pj4+Pj4+Pj4+Pj4+PiB3aXRo
Cj4+Pj4+Pj4+Pj4+Pj4+Pj4+IG11eCBhbmQgZ2F0ZSBmb3IgZWFjaCBvZiB0aGVzZSBjbG9ja3Mu
Cj4+Pj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+Pj4+IEN1cnJlbnRseSB0aGVzZSBQTUMg
Y2xvY2tzIGFyZSByZWdpc3RlcmVkIGJ5IFRlZ3JhIGNsb2NrCj4+Pj4+Pj4+Pj4+Pj4+Pj4+IGRy
aXZlcgo+Pj4+Pj4+Pj4+Pj4+Pj4+PiB1c2luZwo+Pj4+Pj4+Pj4+Pj4+Pj4+PiBjbGtfcmVnaXN0
ZXJfbXV4IGFuZCBjbGtfcmVnaXN0ZXJfZ2F0ZSBieSBwYXNzaW5nIFBNQyBiYXNlCj4+Pj4+Pj4+
Pj4+Pj4+Pj4+IGFkZHJlc3MKPj4+Pj4+Pj4+Pj4+Pj4+Pj4gYW5kIHJlZ2lzdGVyIG9mZnNldHMg
YW5kIFBNQyBwcm9ncmFtbWluZyBmb3IgdGhlc2UgY2xvY2tzCj4+Pj4+Pj4+Pj4+Pj4+Pj4+IGhh
cHBlbnMKPj4+Pj4+Pj4+Pj4+Pj4+Pj4gdGhyb3VnaCBkaXJlY3QgUE1DIGFjY2VzcyBieSB0aGUg
Y2xvY2sgZHJpdmVyLgo+Pj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4+PiBXaXRoIHRo
aXMsIHdoZW4gUE1DIGlzIGluIHNlY3VyZSBtb2RlIGFueSBkaXJlY3QgUE1DCj4+Pj4+Pj4+Pj4+
Pj4+Pj4+IGFjY2Vzcwo+Pj4+Pj4+Pj4+Pj4+Pj4+PiBmcm9tIHRoZQo+Pj4+Pj4+Pj4+Pj4+Pj4+
PiBub24tc2VjdXJlIHdvcmxkIGRvZXMgbm90IGdvIHRocm91Z2ggYW5kIHRoZXNlIGNsb2NrcyB3
aWxsCj4+Pj4+Pj4+Pj4+Pj4+Pj4+IG5vdCBiZQo+Pj4+Pj4+Pj4+Pj4+Pj4+PiBmdW5jdGlvbmFs
Lgo+Pj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgdGhl
c2UgY2xvY2tzIHJlZ2lzdHJhdGlvbiB3aXRoIFBNQyBhcyBhCj4+Pj4+Pj4+Pj4+Pj4+Pj4+IGNs
b2NrCj4+Pj4+Pj4+Pj4+Pj4+Pj4+IHByb3ZpZGVyCj4+Pj4+Pj4+Pj4+Pj4+Pj4+IGZvciB0aGVz
ZSBjbG9ja3MuIGNsa19vcHMgY2FsbGJhY2sgaW1wbGVtZW50YXRpb25zIGZvcgo+Pj4+Pj4+Pj4+
Pj4+Pj4+PiB0aGVzZQo+Pj4+Pj4+Pj4+Pj4+Pj4+PiBjbG9ja3MKPj4+Pj4+Pj4+Pj4+Pj4+Pj4g
dXNlcyB0ZWdyYV9wbWNfcmVhZGwgYW5kIHRlZ3JhX3BtY193cml0ZWwgd2hpY2gKPj4+Pj4+Pj4+
Pj4+Pj4+Pj4gc3VwcG9ydHMgUE1DCj4+Pj4+Pj4+Pj4+Pj4+Pj4+IHByb2dyYW1taW5nCj4+Pj4+
Pj4+Pj4+Pj4+Pj4+IGluIHNlY3VyZSBtb2RlIGFuZCBub24tc2VjdXJlIG1vZGUuCj4+Pj4+Pj4+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNvd2phbnlhIEtvbWF0
aW5lbmkKPj4+Pj4+Pj4+Pj4+Pj4+Pj4gPHNrb21hdGluZW5pQG52aWRpYS5jb20+Cj4+Pj4+Pj4+
Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+Pj4+Pj4gW3NuaXBdCj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+Pj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNs
a19vcHMgcG1jX2Nsa19nYXRlX29wcyA9IHsKPj4+Pj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCAuaXNf
ZW5hYmxlZCA9IHBtY19jbGtfaXNfZW5hYmxlZCwKPj4+Pj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCAu
ZW5hYmxlID0gcG1jX2Nsa19lbmFibGUsCj4+Pj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgLmRpc2Fi
bGUgPSBwbWNfY2xrX2Rpc2FibGUsCj4+Pj4+Pj4+Pj4+Pj4+Pj4+ICt9Owo+Pj4+Pj4+Pj4+Pj4+
Pj4+IFdoYXQncyB0aGUgYmVuZWZpdCBvZiBzZXBhcmF0aW5nIEdBVEUgZnJvbSB0aGUgTVVYPwo+
Pj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+Pj4gSSB0aGluayBpdCBjb3VsZCBiZSBhIHNp
bmdsZSBjbG9jay4KPj4+Pj4+Pj4+Pj4+Pj4+IEFjY29yZGluZyB0byBUUk06Cj4+Pj4+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gMS4gR0FURSBhbmQgTVVYIGFyZSBzZXBhcmF0ZSBlbnRpdGll
cy4KPj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+PiAyLiBHQVRFIGlzIHRoZSBwYXJlbnQg
b2YgTVVYIChzZWUgUE1DJ3MgQ0xLX09VVCBwYXRocwo+Pj4+Pj4+Pj4+Pj4+Pj4gZGlhZ3JhbQo+
Pj4+Pj4+Pj4+Pj4+Pj4gaW4gVFJNKS4KPj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+PiAz
LiBQTUMgZG9lc24ndCBnYXRlIEVYVFBFUklQSCBjbG9jayBidXQgY291bGQgImZvcmNlLWVuYWJs
ZSIKPj4+Pj4+Pj4+Pj4+Pj4+IGl0LAo+Pj4+Pj4+Pj4+Pj4+Pj4gY29ycmVjdD8KPj4+Pj4+Pj4+
Pj4gV2FzIGZvbGxvd2luZyBleGlzdGluZyBjbGstdGVncmEtcG1jIGFzIEkgYW0gbm90IHN1cmUg
b2YKPj4+Pj4+Pj4+Pj4gcmVhc29uIGZvcgo+Pj4+Pj4+Pj4+PiBoYXZpbmcgdGhlc2UgY2xvY2tz
IHJlZ2lzdGVyZWQgYXMgc2VwYXJhdGUgbXV4IGFuZCBnYXRlIGNsb2Nrcy4KPj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4gWWVzLCBQTUMgY2xvY2tzIGNhbiBiZSByZWdpc3RlcmVkIGFzIHNpbmdsZSBj
bG9jayBhbmQgY2FuIHVzZQo+Pj4+Pj4+Pj4+PiBjbGtfb3BzCj4+Pj4+Pj4+Pj4+IGZvciBzZXQv
Z2V0IHBhcmVudCBhbmQgZW5hYmxlL2Rpc2FibGUuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IGVu
YWJsZS9kaXNhYmxlIG9mIFBNQyBjbG9ja3MgaXMgZm9yIGZvcmNlLWVuYWJsZSB0byBmb3JjZSB0
aGUKPj4+Pj4+Pj4+Pj4gY2xvY2sgdG8KPj4+Pj4+Pj4+Pj4gcnVuIHJlZ2FyZGxlc3Mgb2YgQUND
RVBUX1JFUSBvciBJTlZFUlRfUkVRLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiA0LiBjbGtf
bV9kaXYyLzQgYXJlIGludGVybmFsIFBNQyBPU0MgZGl2aWRlcnMgYW5kIHRodXMgdGhlc2UKPj4+
Pj4+Pj4+Pj4+Pj4gY2xvY2tzCj4+Pj4+Pj4+Pj4+Pj4+IHNob3VsZCBiZWxvbmcgdG8gUE1DLgo+
Pj4+Pj4+Pj4+Pj4+IEFsc28sIGl0IHNob3VsZCBiZSAib3NjIiBhbmQgbm90ICJjbGtfbSIuCj4+
Pj4+Pj4+Pj4+PiBJIGZvbGxvd2VkIHRoZSBzYW1lIHBhcmVudHMgYXMgaXQgd2VyZSBpbiBleGlz
dGluZwo+Pj4+Pj4+Pj4+Pj4gY2xrLXRlZ3JhLXBtYwo+Pj4+Pj4+Pj4+Pj4gZHJpdmVyLgo+Pj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFllYWggdGhleSBhcmUgd3JvbmcgYW5kIHRoZXkgc2hvdWxk
IGJlIGZyb20gb3NjIGFuZCBub3QgY2xrX20uCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gV2ls
bCBmaXggaW4gbmV4dCB2ZXJzaW9uLgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4gUmVnIGNsa19tX2Rp
djIvMywgdGhleSBhcmUgZGl2aWRlcnMgYXQgT1NDIHBhZCBhbmQgbm90IHJlYWxseQo+Pj4+Pj4+
PiBpbnRlcm5hbAo+Pj4+Pj4+PiB0byBQTUMgYmxvY2suCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGN1cnJl
bnQgY2xvY2sgZHJpdmVyIGNyZWF0ZXMgY2xrX21fZGl2IGNsb2NrcyB3aGljaCBzaG91bGQKPj4+
Pj4+Pj4gYWN0dWFsbHkgYmUKPj4+Pj4+Pj4gb3NjX2RpdjIvb3NjX2RpdjQgY2xvY2tzIHdpdGgg
b3NjIGFzIHBhcmVudC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhlcmUgYXJlIG5vIGNsa19tX2RpdjIg
YW5kIGNsa19tX2RpdjQgZnJvbSBjbGtfbQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBXaWxsIGZpeCB0aGlz
IGluIG5leHQgdmVyc2lvbi4KPj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBDb3VsZCB5b3UgcGxlYXNlIGRl
c2NyaWJlIHRoZSBmdWxsIEVYVFBFUklQSCBjbG9jayB0b3BvbG9neSBhbmQKPj4+Pj4+Pj4+PiBo
b3cgdGhlCj4+Pj4+Pj4+Pj4gcGlubXV4IGNvbmZpZ3VyYXRpb24gaXMgcmVsYXRlZCB0byBpdCBh
bGw/Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBXaGF0IGlzIGludGVybmFsIHRvIHRoZSBUZWdyYSBj
aGlwIGFuZCB3aGF0IGFyZSB0aGUgZXh0ZXJuYWwKPj4+Pj4+Pj4+PiBvdXRwdXRzPwo+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4gSXMgaXQgcG9zc2libGUgdG8gYnlwYXNzIFBNQyBvbiBUMzArIGZvciB0
aGUgRVhUUEVSSVBIIGNsb2Nrcz8KPj4+Pj4+Pj4+IFBNQyBDTEsxLzIvMyBwb3NzaWJsZSBzb3Vy
Y2VzIGFyZSBPU0NfRElWMSwgT1NDX0RJVjIsIE9TQ19ESVY0LAo+Pj4+Pj4+Pj4gRVhUUEVSSVBI
IGZyb20gQ0FSLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE9TQ19ESVYxLzIvNCBhcmUgd2l0aCBpbnRl
cm5hbCBkaXZpZGVycyBhdCB0aGUgT1NDIFBhZHMKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBFWFRQRVJJ
UEggaXMgZnJvbSBDQVIgYW5kIGl0IGhhcyByZXNldCBhbmQgZW5hYmxlIGNvbnRyb2xzCj4+Pj4+
Pj4+PiBhbG9uZyB3aXRoCj4+Pj4+Pj4+PiBjbG9jayBzb3VyY2Ugc2VsZWN0aW9ucyB0byBjaG9v
c2Ugb25lIG9mIHRoZSBQTExBX09VVDAsIENMS19TLAo+Pj4+Pj4+Pj4gUExMUF9PVVQwLCBDTEtf
TSwgUExMRV9PVVQwCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU28sIFBNQyBDTEsxLzIvNCBwb3NzaWJs
ZSBwYXJlbnRzIGFyZSBPU0NfRElWMSwgT1NDX0RJVjIsCj4+Pj4+Pj4+PiBPU0NfRElWNCwKPj4+
Pj4+Pj4+IEVYVEVSTi4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQ0xLMS8yLzMgYWxz
byBoYXMgUGlubXV4IHRvIHJvdXRlIEVYVFBFUklQSCBvdXRwdXQgb24gdG8gdGhlc2UKPj4+Pj4+
Pj4+IHBpbnMuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdoZW4gRVhURVJOIG91dHB1
dCBjbG9jayBpcyBzZWxlY3RlZCBmb3IgdGhlc2UgUE1DIGNsb2NrcyB0aHJ1Cj4+Pj4+Pj4+PiBD
TEt4X1NSQ19TRUwsIG91dHB1dCBjbG9jayBpcyBmcm9tIGRyaXZlciBieSBFWFRQRVJJUEggZnJv
bSBDQVIKPj4+Pj4+Pj4+IHZpYQo+Pj4+Pj4+Pj4gUGlubXV4IGxvZ2ljIG9yIGRyaXZlbiBhcyBw
ZXIgQ0xLeF9TUkNfU0VMIGJ5cGFzc2luZyBwaW5tdXgKPj4+Pj4+Pj4+IGJhc2VkIG9uCj4+Pj4+
Pj4+PiBDTEt4X0FDQ0VQVF9SRVEgYml0Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBQ
TUMgQ2xvY2sgY29udHJvbCByZWdpc3RlciBoYXMgYml0IENMS3hfQUNDRVBUX1JFUQo+Pj4+Pj4+
Pj4gV2hlbiBDTEt4X0FDQ0VQVF9SRVEgPSAwLCBvdXRwdXQgY2xvY2sgZHJpdmVyIGlzIGZyb20g
YnkgRVhUUEVSSVBICj4+Pj4+Pj4+PiB0aHJvdWdoIHRoZSBwaW5tdXgKPj4+Pj4+Pj4+IFdoZW4g
Q0xLeF9BQ0NFUFRfUkVRID0gMSwgb3V0cHV0IGNsb2NrIGlzIGJhc2VkIG9uIENMS3hfU1JDX1NF
TAo+Pj4+Pj4+Pj4gYml0cwo+Pj4+Pj4+Pj4gKE9TQ19ESVYxLzIvNCBhbmQgRVhUUEVSSVBIIGNs
b2NrIGJ5cGFzc2luZyB0aGUgcGlubXV4KQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEZPUkNFX0VOIGJp
dCBpbiBQTUMgQ0xvY2sgY29udHJvbCByZWdpc3RlciBmb3JjZXMgdGhlIGNsb2NrIHRvIHJ1bgo+
Pj4+Pj4+Pj4gcmVnYXJkbGVzcyBvZiB0aGlzLgo+Pj4+Pj4+IFBNQyBjbG9jayBnYXRlIGlzIGJh
c2VkIG9uIHRoZSBzdGF0ZSBvZiBDTEt4X0FDQ0VQVF9SRVEgYW5kIEZPUkNFX0VOCj4+Pj4+Pj4g
bGlrZSBleHBsYWluZWQgYWJvdmUuCj4+Pj4+Pj4KPj4+Pj4+PiBDTEt4X0FDQ0VQVF9SRVEgaXMg
MCBkZWZhdWx0IGFuZCBGT1JDRV9FTiBhY3RzIGFzIGdhdGUgdG8KPj4+Pj4+PiBlbmFibGUvZGlz
YWJsZQo+Pj4+Pj4+IEVYVFBFUklQSCBjbG9jayBvdXRwdXQgdG8gUE1DIENMS19PVVRfMS8yLzMu
Cj4+Pj4+PiBbYW5kIHRvIGVuYWJsZSBPU0MgYXMgd2VsbF0KPj4+Pj4+Cj4+Pj4+Pj4gU28gSSBi
ZWxpZXZlIHdlIG5lZWQgdG8gcmVnaXN0ZXIgYXMgTVVYIGFuZCBHYXRlIHJhdGhlciB0aGFuIGFz
IGEKPj4+Pj4+PiBzaW5nbGUKPj4+Pj4+PiBjbG9jay4gUGxlYXNlIGNvbmZpcm0uCj4+Pj4+PiAx
LiBUaGUgZm9yY2UtZW5hYmxpbmcgaXMgYXBwbGllZCB0byBib3RoIE9TQyBhbmQgRVhURVJOIHNv
dXJjZXMgb2YKPj4+Pj4+IFBNQ19DTEtfT1VUX3ggYnkgUE1DIGF0IG9uY2UuCj4+Pj4+Pgo+Pj4+
Pj4gMi4gQm90aCBvZiBQTUMncyBmb3JjZS1lbmFibGluZyBhbmQgT1NDL0VYVEVSTiBzZWxlY3Rp
b24gaXMgaW50ZXJuYWwKPj4+Pj4+IHRvIFBNQy4KPj4+Pj4+Cj4+Pj4+PiBTaG91bGQgYmUgYmV0
dGVyIHRvIGRlZmluZSBpdCBhcyBhIHNpbmdsZSAicG1jX2Nsa19vdXRfeCIuIEkgZG9uJ3QKPj4+
Pj4+IHNlZQo+Pj4+Pj4gYW55IGdvb2QgcmVhc29ucyBmb3IgZGlmZmVyZW50aWF0aW5nIFBNQydz
IEdhdGUgZnJvbSB0aGUgTVVYLCBpdCdzIGEKPj4+Pj4+IHNpbmdsZSBoYXJkd2FyZSB1bml0IGZy
b20gYSBwb2ludCBvZiB2aWV3IG9mIHRoZSByZXN0IG9mIHRoZSBzeXN0ZW0uCj4+Pj4+Pgo+Pj4+
Pj4gUGV0ZXIsIGRvIHlvdSBoYXZlIGFueSBvYmplY3Rpb25zPwo+Pj4+PiBXZSBhZGRlZCBmYWxs
YmFjayBvcHRpb24gZm9yIGF1ZGlvIG1jbGsgYW5kIGFsc28gYWRkZWQgY2hlY2sgZm9yCj4+Pj4+
IGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgZHQgcHJvcGVydHkgaW4gYXVkaW8gZHJpdmVyIGFuZCBp
ZiBpdHMgbm90IHRoZW4KPj4+Pj4gd2UgZG8gcGFyZW50IGluaXQgY29uZmlndXJhdGlvbiBpbiBh
dWRpbyBkcml2ZXIuCj4+Pj4+Cj4+Pj4+IEN1cnJlbnQgY2xvY2sgZHJpdmVyIGNyZWF0ZXMgMiBz
ZXBhcmF0ZSBjbG9ja3MgY2xrX291dF8xX211eCBhbmQKPj4+Pj4gY2xrX291dF8xIGZvciBlYWNo
IHBtYyBjbG9jayBpbiBjbG9jayBkcml2ZXIgYW5kIHVzZXMgZXh0ZXJuMSBhcwo+Pj4+PiBwYXJl
bnQgdG8gY2xrX291dF8xX211eCBhbmQgY2xrX291dF8xX211eCBpcyBwYXJlbnQgdG8gY2xrX291
dF8xLgo+Pj4+Pgo+Pj4+PiBXaXRoIGNoYW5nZSBvZiByZWdpc3RlcmluZyBlYWNoIHBtYyBjbG9j
ayBhcyBhIHNpbmdsZSBjbG9jaywgd2hlbiB3ZQo+Pj4+PiBkbyBwYXJlbnQgaW5pdCBhc3NpZ25t
ZW50IGluIGF1ZGlvIGRyaXZlciB3aGVuCj4+Pj4+IGFzc2lnbmVkLWNsb2NrLXByb3BlcnRpZXMg
YXJlIG5vdCB1c2VkIGluIERUIChhcyB3ZSByZW1vdmVkIHBhcmVudAo+Pj4+PiBpbml0cyBmb3Ig
ZXh0ZXJuIGFuZCBjbGtfb3V0cyBmcm9tIGNsb2NrIGRyaXZlciksIHdlIHNob3VsZCBzdGlsbCB0
cnkKPj4+Pj4gdG8gZ2V0IGNsb2NrIGJhc2VkIG9uIGNsa19vdXRfMV9tdXggYXMgcGFyZW50IGFz
c2lnbm1lbnQgb2YgZXh0ZXJuMSBpcwo+Pj4+PiBmb3IgY2xrX291dF8xX211eCBhcyBwZXIgZXhp
c3RpbmcgY2xvY2sgdHJlZS4KPj4+Pj4KPj4+Pj4gY2xrX291dF8xX211eCBjbG9jayByZXRyaWV2
ZSB3aWxsIGZhaWwgd2l0aCB0aGlzIGNoYW5nZSBvZiBzaW5nbGUKPj4+Pj4gY2xvY2sgd2hlbiBh
bnkgbmV3IHBsYXRmb3JtIGRldmljZSB0cmVlIGRvZXNuJ3Qgc3BlY2lmeQo+Pj4+PiBhc3NpZ25l
ZC1jbG9jay1wYXJlbnRzIHByb3BlcnRpZXMgYW5kIHRlZ3JhX2Fzb2NfdXRpbHNfaW5pdCBmYWls
cy4KPj4+IFlvdSBtYWRlIHRoZSBQTUMvQ2FSIGNoYW5nZXMgYmVmb3JlIHRoZSBhdWRpbyBjaGFu
Z2VzLCB0aGUgY2xrX291dF8xX211eAo+Pj4gd29uJ3QgZXhpc3QgZm9yIHRoZSBhdWRpbyBkcml2
ZXIgcGF0Y2hlcy4KPj4+Cj4+PiBJZiB5b3UgY2FyZSBhYm91dCBiaXNlY3QtYWJpbGl0eSBvZiB0
aGUgcGF0Y2hlcywgdGhlbiB0aGUgY2xvY2sgYW5kCj4+PiBhdWRpbyBjaGFuZ2VzIG5lZWQgdG8g
YmUgZG9uZSBpbiBhIHNpbmdsZSBwYXRjaC4gQnV0IEkgZG9uJ3QgdGhpbmsgdGhhdAo+Pj4gaXQn
cyB3b3J0aHdoaWxlLgo+Pj4KPj4+Pj4gV2l0aCBzaW5nbGUgY2xvY2ssIGV4dGVybjEgaXMgdGhl
IHBhcmVudCBmb3IgY2xrX291dF8xIGFuZCB3aXRoCj4+Pj4+IHNlcGFyYXRlIGNsb2NrcyBmb3Ig
bXV4IGFuZCBnYXRlLCBleHRlcm4xIGlzIHRoZSBwYXJlbnQgZm9yCj4+Pj4+IGNsa19vdXRfMV9t
dXguCj4+Pj4gSWYgd2UgbW92ZSB0byBzaW5nbGUgY2xvY2sgbm93LCBpdCBuZWVkIG9uZSBtb3Jl
IGFkZGl0aW9uYWwgZmFsbGJhY2sKPj4+PiBpbXBsZW1lbnRhdGlvbiBpbiBhdWRpbyBkcml2ZXIg
ZHVyaW5nIHBhcmVudCBjb25maWd1cmF0aW9uIGFzCj4+Pj4gY2xrX291dF8xX211eCB3aWxsIG5v
dCBiZSB0aGVyZSB3aXRoIHNpbmdsZSBjbG9jayBjaGFuZ2UgYW5kCj4+Pj4gb2xkL2N1cnJlbnQK
Pj4+PiBrZXJuZWwgaGFzIGl0IGFzIGl0IHVzZXMgc2VwYXJhdGUgY2xvY2tzIGZvciBwbWMgbXV4
IGFuZCBnYXRlLgo+Pj4gV2h5IGFkZGl0aW9uYWwgZmFsbGJhY2s/IEFkZGl0aW9uYWwgdG8gd2hh
dD8KPj4+Cj4+Pj4gQWxzbywgd2l0aCBzaW5nbGUgY2xvY2sgZm9yIGJvdGggUE1DIG11eCBhbmQg
Z2F0ZSBub3csIG5ldyBEVCBzaG91bGQKPj4+PiB1c2UKPj4+PiBleHRlcm4xIGFzIHBhcmVudCB0
byBDTEtfT1VUXzEgYXMgQ0xLX09VVF8xX01VWCB3aWxsIG5vdCBiZSB0aGVyZSBvbGQKPj4+PiBQ
TUMgZHQtYmluZGluZ3MgaGFzIHNlcGFyYXRlIGNsb2NrcyBmb3IgTVVYIChDTEtfT1VUXzFfTVVY
KSBhbmQgZ2F0ZQo+Pj4+IChDTEtfT1VUXzEpCj4+Pj4KPj4+PiBEVCBiaW5kaW5ncyB3aWxsIG5v
dCBiZSBjb21wYXRpYmxlIGIvdyBvbGQgYW5kIG5ldyBjaGFuZ2VzIGlmIHdlCj4+Pj4gbW92ZSB0
bwo+Pj4+IFNpbmdsZSBQTUMgY2xvY2sgbm93Lgo+Pj4gU29ycnksIEkgZG9uJ3QgdW5kZXJzdGFu
ZCB3aGF0IHlvdSdyZSBtZWFuaW5nIGJ5IHRoZSAibmV3IGNoYW5nZXMiLgo+Pj4KPj4+PiBTaG91
bGQgd2UgZ28gd2l0aCBzYW1lIHNlcGFyYXRlIGNsb2NrcyB0byBoYXZlIGl0IGNvbXBhdGlibGUg
dG8gYXZvaWQKPj4+PiBhbGwgdGhpcz8KPj4+Pgo+PiBUaGUgcmVhc29uIHdlIGFkZGVkIG1jbGsg
ZmFsbGJhY2sgYW5kIGFsc28gZm9yIGRvaW5nIHBhcmVudAo+PiBjb25maWd1cmF0aW9uIGJhc2Vk
IG9uIHByZXNlbmNlIG9mIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgcHJvcGVydHkgaXMKPj4gdG8g
aGF2ZSBvbGQgZHQgY29tcGF0aWJsZSB3aXRoIG5ldyBrZXJuZWwgYW5kIGFsc28gdG8gaGF2ZSBu
ZXcgZHQKPj4gY29tcGF0aWJsZSB3aXRoIG9sZCBrZXJuZWwuCj4+Cj4+IFNvIHRoZSBwb2ludCBJ
IHdhcyBtZW50aW9uaW5nIGlzIHRvIGhhdmUgbmV3IERUIHRvIHdvcmsgd2l0aCBvbGQKPj4ga2Vy
bmVsLCBzZXR0aW5nIGV4dGVybjEgYXMgcGFyZW50IHRvIGNsa19vdXRfMSAod2l0aCBzaW5nbGUg
cG1jIGNsb2NrKQo+PiB0aHJvdWdoIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgaW4gRFQgd2lsbCBm
YWlsIGFzIG9sZCBrZXJuZWwgaGFzIG11eAo+PiBhbmQgZ2F0ZSBhcyBzZXBhcmF0ZSBjbG9ja3Mg
YW5kIHBhcmVudCBjb25maWd1cmF0aW9uIGlzIGZvciBtdXggY2xvY2sKPj4gKGNsa19vdXRfMV9t
dXgpCj4+Cj4gU29ycnkgbmV2ZXIgbWluZCwgd2l0aCBvbGQga2VybmVsIGNsb2NrIGRyaXZlciBk
b2VzIGFsbCBwYXJlbnQKPiBjb25maWd1cmF0aW9uIHNvIHNob3VsZCBiZSBvay4gU28gbm8gYWRk
aXRpb25hbCBmYWxsYmFja3MgYXJlIG5lZWRlZAo+IGV4Y2VwdCB0byB0aGUgb25lIHdlIGFscmVh
ZHkgYWRkZWQuCj4gCj4gT0ssIFNvIGl0cyBqdXN0IHRoYXQgY2hhbmdlcyBhcmUgc2xpZ2h0bHkg
bW9yZSB0byBzd2l0Y2ggdG8gc2luZ2xlIGNsb2NrCj4gY29tcGFyZWQgdG8gdXNpbmcgc2VwYXJh
dGUgY2xvY2tzIGFzIGdhdGUgY2xrX29wcyAod2hpY2ggYXJlIG5lZWRlZAo+IGFueXdheSBmb3Ig
YmxpbmsgY29udHJvbCkgb2YgY2xvY2sgZW5hYmxlIGFuZCBkaXNhYmxlIGNhbid0IGJlIHVzZWQg
Zm9yCj4gY2xrX291dF8xIGVuYWJsZS9kaXNhYmxlIGFuZCBuZWVkIGFkZGl0aW9uYWwgY2xrX2Vu
YWJsZSBhbmQgZGlzYWJsZQo+IGNhbGxiYWNrcy4KPiAKPiBXaWxsIG1ha2UgY2hhbmdlcyB0byB1
c2Ugc2luZ2xlIGNsb2NrLi4KClBsZWFzZSB3YWl0IGZvciB0aGUgUGV0ZXIncyByZXBseS4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
