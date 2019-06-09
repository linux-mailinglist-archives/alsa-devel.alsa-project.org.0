Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C053A561
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Jun 2019 14:18:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F7191683;
	Sun,  9 Jun 2019 14:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F7191683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560082739;
	bh=bHl9tVL+iAnQt2Yxf7qgGHskGpXidgvOwMLGvxfLakQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGlPQ1kNI7FgRsM1FpX6pSZ6ANMCtNFd6JMsIiP/pfTzb7n88qWookidUFbFQPXY4
	 TbKvKLX0UFEwDNotdGjV99iaDJqjELAsSs0HW13HkineeYk01R3JwpKOmGN7WcgBoC
	 7F8gjZn3x+8ycIdxXtN9TAdNm9nPeK+49Xxn79YM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07A01F89739;
	Sun,  9 Jun 2019 14:16:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F930F89737; Sun,  9 Jun 2019 14:16:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04DA6F89732
 for <alsa-devel@alsa-project.org>; Sun,  9 Jun 2019 14:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04DA6F89732
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="j6uxcaoa"
Received: by mail-wm1-x341.google.com with SMTP id 22so5700527wmg.2
 for <alsa-devel@alsa-project.org>; Sun, 09 Jun 2019 05:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EEIVK1Eriab7DfTys4fv9a6X+JgT7Ww4XuNFF08fezk=;
 b=j6uxcaoaKCapNqqp5pQ9ML3LEuvXv1L3nZmhRq3LFKy1gEbKnEBzNv7Fe+5GbsIg0w
 HxHdYHudjlSPUPc6C/waBTmPiwCW0TqQlgEGr7mrdlVpHjpcerO3uAqr49Q/3Vajesso
 Ppqzpo2aFO31OanB9cYzZuSu++GBEqxR+fh1vi7V+I9ZlBJtLBtpY2xpXlOP2a22wnlT
 Y0qNlfpikAO3pFmpjtrqwBooYM3By7/cvRo3joQcrajuQtPiasKuOv7YoB+sXB7swaH+
 nnoeim3adrEzqOOReKYq2+ib59zzEWaKwRNlx+Ua3K1bgo7GNrOgQGWconv6IpolU14L
 flDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EEIVK1Eriab7DfTys4fv9a6X+JgT7Ww4XuNFF08fezk=;
 b=pjD6nXPIeucRyz0K/V3urG35+F6QV/o1GFXB0wUkafK7grjQPWDvF6ye2CR1YL/zuJ
 RBFkNlOjlAjAfFaNVaaCULNWcpEYmgfwGh0dI8/5ffkc8I9WqKU47wqg6tfQpoFuwNc6
 3WHJQOVM6OttwZv0MouxGQSJZSq5IUnTH2vLxM1gJrkuzN6XAu9BZi7kqPllrk8Dakkg
 +YZmyIVIZp9vx7lfZr/dzj8Bl675nYWwzF5C1q/06NfOC2Y7QSBUKDydOrRFwPhhabEr
 AlIJsa+RXES0KO4MtIZ1a89KX6xTM79pKtCJ6Gky3NPbhPcYMYSiLmwiU9A2U22M0f0U
 XmJg==
X-Gm-Message-State: APjAAAX+FqfGLVMIJ78iwaxwVt4SpWNrjuzs1R+g/XwxlcQGDnUd5oVQ
 WL440lXqSs9fEL8fsDi5D5U4jA==
X-Google-Smtp-Source: APXvYqzS5FT4ul4wt6NNZJuc6Ovby2vtZ6Ue5SHYemoOi2SUcSOC1UMQrdBs0n3M43l90j00aEgZ1g==
X-Received: by 2002:a7b:c018:: with SMTP id c24mr7567870wmb.37.1560082570895; 
 Sun, 09 Jun 2019 05:16:10 -0700 (PDT)
Received: from [192.168.86.29]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t6sm7526665wmb.29.2019.06.09.05.16.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jun 2019 05:16:10 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, vkoul@kernel.org
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-6-srinivas.kandagatla@linaro.org>
 <f2ea97b2-935d-0c7d-cb55-6e16a19c2060@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7cde3f3b-5b42-5939-1ee8-8e1d57e9ec9f@linaro.org>
Date: Sun, 9 Jun 2019 13:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f2ea97b2-935d-0c7d-cb55-6e16a19c2060@linux.intel.com>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 5/6] dt-bindings: soundwire: add
 bindings for Qcom controller
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

VGhhbmtzIGZvciB0YWtpbmcgdGltZSB0byByZXZpZXcsCgpPbiAwNy8wNi8yMDE5IDEzOjUwLCBQ
aWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiBPbiA2LzcvMTkgMzo1NiBBTSwgU3Jpbml2YXMg
S2FuZGFnYXRsYSB3cm90ZToKPj4gVGhpcyBwYXRjaCBhZGRzIGJpbmRpbmdzIGZvciBRdWFsY29t
bSBzb3VuZHdpcmUgY29udHJvbGxlci4KPj4KPj4gUXVhbGNvbW0gU291bmRXaXJlIE1hc3RlciBj
b250cm9sbGVyIGlzIHByZXNlbnQgaW4gbW9zdCBRdWFsY29tbSBTb0NzCj4+IGVpdGhlciBpbnRl
Z3JhdGVkIGFzIHBhcnQgb2YgV0NEIGF1ZGlvIGNvZGVjcyB2aWEgc2xpbWJ1cyBvcgo+PiBhcyBw
YXJ0IG9mIFNPQyBJL08uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNyaW5pdmFzIEthbmRhZ2F0bGEg
PHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KPj4gLS0tCj4+IMKgIC4uLi9iaW5kaW5n
cy9zb3VuZHdpcmUvcWNvbSxzd3IudHh0wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2MiArKysrKysr
KysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspCj4+IMKg
IGNyZWF0ZSBtb2RlIDEwMDY0NCAKPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NvdW5kd2lyZS9xY29tLHN3ci50eHQKPiAKPiB5b3Ugc2VlbSB0byB1c2UgdGhlICdzd3InIHBy
ZWZpeCBpbiB0aGlzIHBhdGNoLiBNb3N0IGltcGxlbWVudGVycyB1c2UgCj4gJ3NkdycsIGFuZCB0
aGF0J3MgdGhlIGRlZmF1bHQgYWxzbyB1c2VkIGluIHRoZSBNSVBJIERpc0NvIHNwZWMgZm9yIAo+
IHByb3BlcnRpZXMuIENhbiB3ZSBhbGlnbiBvbiB0aGUgc2FtZSBuYW1pbmcgY29udmVudGlvbnM/
Cj4gCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmR3aXJlL3Fjb20sc3dyLnR4dCAKPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc291bmR3aXJlL3Fjb20sc3dyLnR4dAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLmViODRkMGY0ZjM2Zgo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZHdpcmUvcWNvbSxzd3IudHh0
Cj4+IEBAIC0wLDAgKzEsNjIgQEAKPj4gK1F1YWxjb21tIFNvdW5kV2lyZSBDb250cm9sbGVyCj4+
ICsKPj4gK1RoaXMgYmluZGluZyBkZXNjcmliZXMgdGhlIFF1YWxjb21tIFNvdW5kV2lyZSBDb250
cm9sbGVyIEJpbmRpbmdzLgo+PiArCj4+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+PiArCj4+ICst
IGNvbXBhdGlibGU6wqDCoMKgwqDCoMKgwqAgTXVzdCBiZSAicWNvbSxzb3VuZHdpcmUtdjxNQUpP
Uj4uPE1JTk9SPi48U1RFUD4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4YW1wbGU6
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJxY29tLHNvdW5kd2lyZS12MS4zLjAiCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJxY29tLHNvdW5kd2lyZS12MS41LjAiCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJxY29tLHNvdW5kd2lyZS12MS42LjAiCj4+ICstIHJlZzrCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFNvdW5kV2lyZSBjb250cm9sbGVyIGFkZHJlc3Mgc3BhY2UuCj4+ICst
IGludGVycnVwdHM6wqDCoMKgwqDCoMKgwqAgU291bmRXaXJlIGNvbnRyb2xsZXIgaW50ZXJydXB0
Lgo+PiArLSBjbG9jay1uYW1lczrCoMKgwqDCoMKgwqDCoCBNdXN0IGNvbnRhaW4gImlmYWNlIi4K
Pj4gKy0gY2xvY2tzOsKgwqDCoMKgwqDCoMKgIEludGVyZmFjZSBjbG9ja3MgbmVlZGVkIGZvciBj
b250cm9sbGVyLgo+PiArLSAjc291bmQtZGFpLWNlbGxzOsKgwqDCoCBNdXN0IGJlIDEgZm9yIGRp
Z2l0YWwgYXVkaW8gaW50ZXJmYWNlcyBvbiB0aGUgCj4+IGNvbnRyb2xsZXJzLgo+PiArLSAjYWRk
cmVzcy1jZWxsczrCoMKgwqAgTXVzdCBiZSAxIGZvciBTb3VuZFdpcmUgZGV2aWNlczsKPj4gKy0g
I3NpemUtY2VsbHM6wqDCoMKgwqDCoMKgwqAgTXVzdCBiZSA8MD4gYXMgU291bmRXaXJlIGFkZHJl
c3NlcyBoYXZlIG5vIHNpemUgCj4+IGNvbXBvbmVudC4KPj4gKy0gcWNvbSxkb3V0LXBvcnRzOsKg
wqDCoMKgIE11c3QgYmUgY291bnQgb2YgZGF0YSBvdXQgcG9ydHMKPj4gKy0gcWNvbSxkaW4tcG9y
dHM6wqDCoMKgwqAgTXVzdCBiZSBjb3VudCBvZiBkYXRhIGluIHBvcnRzCj4+ICstIHFjb20scG9y
dHMtb2Zmc2V0MTrCoMKgwqAgTXVzdCBiZSBmcmFtZSBvZmZzZXQxIG9mIGVhY2ggZGF0YSBwb3J0
Lgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBPdXQgZm9sbG93ZWQgYnkgSW4uIFVzZWQgZm9y
IEJsb2NrIHNpemUgY2FsY3VsYXRpb24uCj4+ICstIHFjb20scG9ydHMtb2Zmc2V0MjrCoMKgwqDC
oCBNdXN0IGJlIGZyYW1lIG9mZnNldDIgb2YgZWFjaCBkYXRhIHBvcnQuCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIE91dCBmb2xsb3dlZCBieSBJbi4gVXNlZCBmb3IgQmxvY2sgc2l6ZSBjYWxj
dWxhdGlvbi4KPj4gKy0gcWNvbSxwb3J0cy1zaW50ZXJ2YWwtbG93OiBNdXN0IGJlIHNhbXBsZSBp
bnRlcnZhbCBsb3cgb2YgZWFjaCBkYXRhIAo+PiBwb3J0Lgo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBPdXQgZm9sbG93ZWQgYnkgSW4uIFVzZWQgZm9yIFNhbXBsZSBJbnRlcnZhbCBjYWxjdWxh
dGlvbi4KPiAKPiBUaGVzZSBkZWZpbml0aW9ucyBhcmUgdmFsaWQgb25seSBmb3Igc3BlY2lmaWMg
dHlwZXMgb2YgcG9ydHMsIEkgYmVsaWV2ZSAKPiBoZXJlIGl0J3MgYSAncmVkdWNlZCcgcG9ydCBz
aW5jZSBvZmZzZXQyIGlzIG5vdCByZXF1aXJlZCBmb3Igc2ltcGxlciAKPiBwb3J0cyBhbmQgeW91
IGRvbid0IGhhdmUgSHN0YXJ0L0hzdG9wLgo+IApZZXMsIHRoaXMgdmVyc2lvbiBvZiB0aGUgY29u
dHJvbGxlciB3aGljaCBhbSB3b3JraW5nIG9uIGRvZXMgbm90IGhhdmUgCkRQTl9TYW1wbGVDdHJs
MiByZWdpc3RlciBmb3IgU2FtcGxlSW50ZXJ2YWxIaWdoIEZpZWxkIGFuZCBoYXMgcmVnaXN0ZXJz
IApmb3IgcHJvZ3JhbW1pbmcgb2Zmc2V0MiBkb2VzIGluZGVlZCBpbmRpY2F0ZSB0aGF0IHRoZXNl
IHBvcnRzIGFyZSAKcmVkdWNlZCBwb3J0cy4KCkhvd2V2ZXIgbG9va3MgbGlrZSBuZXcgdmVyc2lv
bnMgb2YgdGhlIHRoaXMgY29udHJvbGxlciBkb2VzIHN1cHBvcnQgZnVsbCAKZGF0YSBwb3J0cy4K
CkkgY2FuIGFkZCBtb3JlIGZsZXhpYmlsaXR5IGluIGJpbmRpbmdzIGJ5IGFkZGluZyBxY29tLGRw
b3J0LXR5cGUgZmllbGQgCmluZGljYXRpbmcgdGhpcyBpbiBuZXh0IHZlcnNpb24uCgo+IHNvIGlm
IHlvdSBzdGF0ZSB0aGF0IGFsbCBvZiB0aGVzZSBwcm9wZXJ0aWVzIGFyZSByZXF1aXJlZCwgeW91
IGFyZSAKPiBleHBsaWNpdGx5IHJ1bGluZyBvdXQgZnV0dXJlIGltcGxlbWVudGF0aW9ucyBvZiBz
aW1wbGUgcG9ydHMgb3Igd2lsbCAKPiBoYXZlIHRvIHJlZGVmaW5lIHRoZW0gbGF0ZXIuCj4gCj4g
QWxzbyB0aGUgZGVmaW5pdGlvbiAnZnJhbWUgb2Zmc2V0MS8yJyBpcyBpbmNvcnJlY3QuIHRoZSBv
ZmZzZXQgaXMgCj4gZGVmaW5lZCB3aXRoaW4gZWFjaCBQYXlsb2FkIFRyYW5zcG9ydCBXaW5kb3cg
LSBub3QgZWFjaCBmcmFtZSAtIGFuZCBpdHMgCj4gZGVmaW5pdGlvbiBkZXBlbmRzIG9uIHRoZSBw
YWNraW5nIG1vZGUgdXNlZCwgd2hpY2ggaXNuJ3QgZGVmaW5lZCBvciAKPiBzdGF0ZWQgaGVyZS4K
ClllcCwgQmxvY2tQYWNraW5nTW9kZSBpcyBtaXNzaW5nLiAxLjMgdmVyc2lvbiBvZiB0aGlzIGNv
bnRyb2xsZXIgb25seSAKc3VwcG9ydHMgQmxvY2sgUGVyIFBvcnQgQmxvY2sgbW9kZS4KCkkgZ3Vl
c3MgdGhpcyBjYW4gYmUgZGVyaXZlZCB3aXRoIGluIHRoZSBkcml2ZXIgYnkgdXNpbmcgY29tcGF0
aWJsZSAKc3RyaW5nLCBJIGNhbiBhZGQgc29tZSBub3RlcyBpbiB0aGUgYmluZGluZyB0byBtYWtl
IHRoaXMgbW9yZSBleHBsaWNpdC4KSSB3aWxsIGFsc28gcmV3b3JkIG9mZnNldDEvMiBkZXNjcmlw
dGlvbiB0byBpbmNsdWRlIHRyYW5zcG9ydCB3aW5kb3cgCndpdGhpbiBmcmFtZQoKPiAKPiBBbmQg
bGFzdCBpdCBsb29rcyBsaWtlIHlvdSBhc3N1bWUgYSBmaXhlZCBmcmFtZSBzaGFwZSAtIGxpa2Vs
eSA1MCByb3dzIAo+IGJ5IDggY29sdW1ucywgaXQgbWlnaHQgYmUgd29ydGggYWRkaW5nIGEgbm90
ZSBvbiB0aGUgbWF4IHZhbHVlcyBmb3IgCj4gb2Zmc2V0MS8yIGltcGxpZWQgYnkgdGhpcyBmcmFt
ZSBzaGFwZS4KCkl0cyA0OHgxNiBpbiB0aGlzIGNhc2UuCgoKVGhhbmtzLApzcmluaQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
