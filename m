Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F29116AC3
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:19:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C31916AC;
	Mon,  9 Dec 2019 11:18:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C31916AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886744;
	bh=eQR73q7P63Jk60Dm3ZBO3wgpU+swVGkc7AX2NZYUfoI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AiJQxVB6xQsBdWrVAhE7SIkEaogmzmVXBKK965yQcnK0SQOzFmjWtt1tfOpSKCFF9
	 4nM5kPHIMJPHurf+2AvKxwkjwz1cpNDmfSLvHjdskC1prMvgbcizRiBdWfIqX2Zwo+
	 VmjNeOUpZIL5O+7ol1yggAZpe7vn4If66YPFjfqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E791FF8045E;
	Mon,  9 Dec 2019 10:52:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72D6DF801F7; Sat,  7 Dec 2019 15:26:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45721F8010F
 for <alsa-devel@alsa-project.org>; Sat,  7 Dec 2019 15:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45721F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qIF9CxEQ"
Received: by mail-lj1-x241.google.com with SMTP id c19so10685020lji.11
 for <alsa-devel@alsa-project.org>; Sat, 07 Dec 2019 06:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y2jLemfM6NAa2htdvtNYO/Blymq/6is+o20B/osA9Ro=;
 b=qIF9CxEQ6k1EF/wqZtxvEai9mTLlsDwyNz++ooTbsAS9QwTtkSqRAk+YvNmtXp9QPe
 k/4V29MeSX3PW7cKFz65qoEa3W9fgRweWAYOFYYc3WpCESIC9euKFqMe1lVW2EOievFt
 3/h1JzjIiU5M1miTi/jx+eUuQ/seDVanFdxnI0cxiEDdSutLkFFP/cCVb8Er3+3eEmaX
 dztGrSqarJD18XnypryEKxayizmfQISw/uRsHZk89Hoj9j8aOXNNOogX3tpCbVqBLtXt
 Eya6SEryR9plGqUKupDB8B3lHDzo2dO4p6ZAphHrhZWb58dO2mbfMR5jJRPBX60n/2Gc
 KtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y2jLemfM6NAa2htdvtNYO/Blymq/6is+o20B/osA9Ro=;
 b=nbEbzdqbnho/HSP5Jezvw8dcbvg4eDzIjRN2z0taXfBqlvld7gz1Kkb5pBQl0eeMic
 SRtXaejS40N0pDGg/jcvBOamWFTJc/xYZe0GRAyy42PxBPPxL5m7czd4PvlW3O22IiY0
 SPP52KPwqLJC8EePyJjrmoTyfbzmE4LGEfH921z0byQbX11Vg59cm85T3ylM98Sislt6
 WOrlhxpFldKhM9qOlbfRbWa65kUKlUwC/GzKzTCdHYZE2Qx/sIxtol1+EbA0VQUy7o4U
 98YIGfXWPDh9xRE6b59RQnevaIsQf0/a4uWZj5jpTV0PJbPY7JLcRwHYcr3FUubOI58D
 FZvw==
X-Gm-Message-State: APjAAAU/WUUJSCz1bjVtdqc1oZ+bah0/F30RoUQCcp696mjxHvaAeY5a
 ep7avScoD2dlywnlRAmsFqCBA7VU
X-Google-Smtp-Source: APXvYqz1YRFRFNxLt0h0j6p1bp3b8kcTYDbdTpKf1RHHQ0N+EIL0IYrF/JF8vAisr83u1gPfUooNgg==
X-Received: by 2002:a05:651c:1139:: with SMTP id
 e25mr11792174ljo.200.1575728777693; 
 Sat, 07 Dec 2019 06:26:17 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id d16sm8147955lfa.16.2019.12.07.06.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2019 06:26:16 -0800 (PST)
To: Sowjanya Komatineni <skomatineni@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dfda896d-27f3-7185-146e-4f697d823471@gmail.com>
Date: Sat, 7 Dec 2019 17:26:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Dec 2019 10:51:21 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 lgirdwood@gmail.com, spujar@nvidia.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, josephl@nvidia.com, linux-clk@vger.kernel.org,
 mmaddireddy@nvidia.com, daniel.lezcano@linaro.org, krzk@kernel.org,
 jonathanh@nvidia.com, mturquette@baylibre.com, devicetree@vger.kernel.org,
 arnd@arndb.de, markz@nvidia.com, alexios.zavras@intel.com, robh+dt@kernel.org,
 tiwai@suse.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au,
 tglx@linutronix.de, allison@lohutok.net, sboyd@kernel.org,
 gregkh@linuxfoundation.org, pdeschrijver@nvidia.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com, Jisheng.Zhang@synaptics.com,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 00/15] Move PMC clocks into Tegra PMC
	driver
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

MDYuMTIuMjAxOSAwNTo0OCwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IFRlZ3Jh
IFBNQyBoYXMgY2xrX291dF8xLCBjbGtfb3V0XzIsIGNsa19vdXRfMyBhbmQgYmxpbmsgY29udHJv
bHMgd2hpY2gKPiBhcmUgY3VycmVudGx5IHJlZ2lzdGVyZWQgYnkgVGVncmEgY2xvY2sgZHJpdmVy
IHVzaW5nIGNsa19yZWdpc2VyX211eCBhbmQKPiBjbGtfcmVnaXN0ZXJfZ2F0ZSB3aGljaCBwZXJm
b3JtcyBkaXJlY3QgVGVncmEgUE1DIHJlZ2lzdGVyIGFjY2Vzcy4KPiAKPiBXaGVuIFRlZ3JhIFBN
QyBpcyBpbiBzZWN1cmUgbW9kZSwgYW55IGFjY2VzcyBmcm9tIG5vbi1zZWN1cmUgd29ybGQgd2ls
bAo+IG5vdCBnbyB0aHJvdWdoLgo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgdGhlc2UgVGVn
cmEgUE1DIGNsb2NrcyBhbmQgYmxpbmsgY29udHJvbHMgdG8gVGVncmEKPiBQTUMgZHJpdmVyIHdp
dGggUE1DIGFzIGNsb2NrIHByb3ZpZGVyIGFuZCByZW1vdmVkIHRoZW0gZnJvbSBUZWdyYSBjbG9j
awo+IGRyaXZlci4gVGhpcyBhbHNvIGFkZHMgUE1DIHNwZWNpZmljIGNsb2NrIGlkJ3MgdG8gdXNl
IGluIGRldmljZSB0cmVlIGFuZAo+IHJlbW92ZWQgY2xvY2sgaWRzIG9mIFBNQyBjbG9jayBmcm9t
IFRlZ3JhIGNsb2NrIGRyaXZlci4KPiAKPiBjbGtfb3V0XzEgaXMgZGVkaWNhdGVkIGZvciBhdWRp
byBtY2xrIGFuZCBjdXJyZW50IEFTb0MgZHJpdmVyIGRvZXMgbm90Cj4gc2V0dGluZyBleHRlcm4x
IGFzIHBhcmVudCBmb3IgY2xrX291dF8xIGFuZCBlbmFibGluZyBjbGtfb3V0XzEgYW5kCj4gY3Vy
cmVudGx5IHRoaXMgaXMgdGFrZW4gY2FyZSBieSBUZWdyYSBjbG9jayBkcml2ZXIgZHVyaW5nIGNs
b2NrIGluaXRzCj4gYW5kIHRoZXJlIGlzIG5vIG5lZWQgdG8gZW5hYmxlIHRoaXMgZHVyaW5nIGNs
b2NrIGluaXQuCj4gCj4gU28sIHRoaXMgc2VyaWVzIGFsc28gaW5jbHVkZXMgcGF0Y2ggdGhhdCB1
cGRhdGVzIEFTb0MgZHJpdmVyIHRvIHRha2UKPiBjYXJlIG9mIGNvbmZpZ3VyaW5nIHBhcmVudCBv
ZiBtY2xrIGFuZCBlbmFibGluZyBtY2xrIHVzaW5nIGJvdGggZXh0ZXJuMQo+IGFuZCBjbGtfb3V0
XzEgYW5kIHVwZGF0ZXMgYWxsIGRldmljZSB0cmVlcyB0byB1c2UgY2xrX291dF8xIGZyb20gcG1j
IGFzCj4gbWNsayBpbmNhc2UgaWYgZGV2aWNlIHRyZWUgZG9uJ3Qgc3BlY2lmeSBhc3NpZ25lZC1j
bG9jay1wYXJlbnRzLgo+IAo+IFRoaXMgc2VyaWVzIGFsc28gaW5jbHVkZXMgYSBwYXRjaCBmb3Ig
bWNsayBmYWxsYmFjayB0byB1c2UgZXh0ZXJuMQo+IHdoZW4gcmV0cmlldmluZyBtY2xrIGZhaWxz
IHdpdGggbmV3IGRldmljZSB0cmVlIHdoaWNoIHVzZXMgcG1jIHByb3ZpZGVyCj4gdG8gaGF2ZSB0
aGlzIGJhY2t3YXJkIGNvbXBhdGlibGUgb2YgbmV3IERUIHdpdGggb2xkIGtlcm5lbHMuCj4gCj4g
VGhpcyBzZXJpZXMgYWxzbyBpbmNsdWRlcyBhIHBhdGNoIHRvIHJlbW92ZSBjbG9jayBpZHMgZm9y
IHRoZXNlIGNsb2Nrcwo+IGZyb20gY2xvY2sgZHQtYmluZGluZyBhcyB0aGVzZSBjbG9ja3MgYXJl
IG5vdCB1c2VkIGluIGFueSBvZiB0aGUgZXhpc3RpbmcKPiBkZXZpY2UgdHJlZSBleGNlcHQgaW4g
dGVncmEyMTAtc21hdWcuZHRzIGFuZCB0aGlzIHNlcmllcyBpbmNsdWRlcyBhIHBhdGNoCj4gdG8g
dXBkYXRlIGNsb2NrIHByb3ZpZGVyIGZyb20gdGVncmFfY2FyIHRvIHBtYyBpbiB0ZWdyYTIxMC1z
bWF1Zy5kdHMgZm9yCj4gY2xrX291dF8yLgo+IAo+IFt2M106CUNoYW5nZXMgYmV0d2VlbiB2MiBh
bmQgdjMgYXJlCj4gCS0gUmVtb3ZlcyBzZXQgcGFyZW50IG9mIGNsa19vdXRfMV9tdXggdG8gZXh0
ZXJuMSBhbmQgZW5hYmxpbmcKPiAJICBleHRlcm4xIGZyb20gdGhlIGNsb2NrIGRyaXZlci4KPiAJ
LSBEb2Vzbid0IGVuYWJsZSBjbGtfb3V0XzEgYW5kIGJsaW5rIGJ5IGRlZmF1bHQgaW4gcG1jIGRy
aXZlcgo+IAktIFVwZGF0ZXMgQVNvQyBkcml2ZXIgdG8gdGFrZSBjYXJlIG9mIGF1ZGlvIG1jbGsg
cGFyZW50Cj4gCSAgY29uZmlndXJhdGlvbiBpbmNhc2UgaWYgZGV2aWNlIHRyZWUgZG9uJ3Qgc3Bl
Y2lmeSBhc3NpZ25lZAo+IAkgIGNsb2NrIHBhcmVudCBwcm9wZXJ0aWVzIGFuZCBlbmFibGVzIG1j
bGsgdXNpbmcgYm90aCBjbGtfb3V0XzEKPiAJICBhbmQgZXh0ZXJuMS4KPiAJLSB1cGRhdGVzIGFs
bCBkZXZpY2UgdHJlZXMgdXNpbmcgZXh0ZXJuMSBhcyBtY2xrIGluIHNvdW5kIG5vZGUKPiAJICB0
byB1c2UgY2xrX291dF8xIGZyb20gcG1jLgo+IAktIHBhdGNoIGZvciBZQU1MIGZvcm1hdCBwbWMg
ZHQtYmluZGluZwo+IAktIEluY2x1ZGVzIHYyIGZlZWRiYWNrCj4gCj4gW3YyXToJQ2hhbmdlcyBi
ZXR3ZWVuIHYxIGFuZCB2MiBhcmUKPiAJLSB2MiBpbmNsdWRlcyBwYXRjaGVzIGZvciBhZGRpbmcg
Y2xrX291dF8xLCBjbGtfb3V0XzIsIGNsa19vdXRfMywKPiAJICBibGluayBjb250cm9scyB0byBU
ZWdyYSBQTUMgZHJpdmVyIGFuZCByZW1vdmluZyBjbGstdGVncmEtcG1jLgo+IAktIGZlZWRiYWNr
IHJlbGF0ZWQgdG8gcG1jIGNsb2NrcyBpbiBUZWdyYSBQTUMgZHJpdmVyIGZyb20gdjEKPiAJLSBS
ZW1vdmVkIHBhdGNoZXMgZm9yIFdCMCBQTExNIG92ZXJyaWRlcyBhbmQgUExMRSBJRERRIFBNQyBw
cm9ncmFtbWluZwo+IAkgIGJ5IHRoZSBjbG9jayBkcml2ZXIgdXNpbmcgaGVscGVyIGZ1bmN0aW9u
cyBmcm9tIFRlZ3JhIFBNQy4KPiAKPiAgCSAgTm90ZToKPiAJICBUbyB1c2UgaGVscGVyIGZ1bmN0
aW9ucyBmcm9tIFBNQyBkcml2ZXIsIFBNQyBlYXJseSBpbml0IG5lZWQgdG8KPiAJICBoYXBwZW4g
cHJpb3IgdG8gdXNpbmcgaGVscGVyIGZ1bmN0aW9ucyBhbmQgdGhlc2UgaGVscGVyIGZ1bmN0aW9u
cyBhcmUKPiAJICBmb3IgUExMTSBPdmVycmlkZSBhbmQgUExMRSBJRERRIHByb2dyYW1taW5nIGlu
IFBNQyBkdXJpbmcgUExMTS9QTExFCj4gCSAgY2xvY2sgcmVnaXN0cmF0aW9uIHdoaWNoIGhhcHBl
biBpbiBjbG9ja19pbml0IHByaW9yIHRvIFRlZ3JhIFBNQwo+IAkgIHByb2JlLgo+IAkgIE1vdmlu
ZyBQTExNL1BMTEUgY2xvY2tzIHJlZ2lzdHJhdGlvbiB0byBoYXBwZW4gYWZ0ZXIgVGVncmEgUE1D
Cj4gCSAgaW1wYWN0cyBvdGhlciBjbG9ja3MgRU1DLCBNQyBhbmQgY29ycmVzcG9uZGluZyB0ZWdy
YV9lbWNfaW5pdCBhbmQKPiAJICB0ZWdyYV9tY19pbml0Lgo+IAkgIFRoaXMgaW1wbGVtZW50YXRp
b24gb2YgY29uZmlndXJpbmcgUE1DIHJlZ2lzdGVycyB0aHJ1IGhlbHBlcgo+IAkgIGZ1bmN0aW9u
cyBpbiBjbG9jayBkcml2ZXIgbmVlZHMgcHJvcGVyIGNoYW5nZXMgYWNyb3NzIFBNQywgQ2xvY2ss
Cj4gCSAgRU1DIGFuZCBNQyBpbml0cyB0byBoYXZlIGl0IHdvcmsgYWNyb3NzIGFsbCBUZWdyYSBw
bGF0Zm9ybXMuCj4gCj4gCSAgQ3VycmVudGx5IFBMTE0gT3ZlcnJpZGUgaXMgbm90IGVuYWJsZWQg
aW4gdGhlIGJvb3Rsb2FkZXIgc28gcHJvcGVyCj4gCSAgcGF0Y2hlcyBmb3IgdGhpcyBmaXggd2ls
bCBiZSB0YWtlbiBjYXJlIHNlcGFyYXRlbHkuCj4gCj4gW3YxXToJdjEgaW5jbHVkZXMgcGF0Y2hl
cyBmb3IgYmVsb3cgZml4ZXMuCj4gCS0gYWRkaW5nIGNsa19vdXRfMSwgY2xrX291dF8yLCBjbGtf
b3V0XzMsIGJsaW5rIGNvbnRyb2xzIHRvIFRlZ3JhIFBNQwo+IAkgIGRyaXZlciBhbmQgcmVtb3Zp
bmcgY2xrLXRlZ3JhLXBtYy4KPiAJLSB1cGRhdGVkIGNsb2NrIHByb3ZpZGVyIGZyb20gdGVncmFf
Y2FyIHRvIHBtYyBpbiB0aGUgZGV2aWNlIHRyZWUKPiAJICB0ZWdyYTIxMC1zbWF1Zy5kdHMgdGhh
dCB1c2VzIGNsa19vdXRfMi4KPiAJLSBBZGRlZCBoZWxwZXIgZnVuY3Rpb25zIGluIFBNQyBkcml2
ZXIgZm9yIFdCMCBQTExNIG92ZXJyaWRlcyBhbmQgUExMRQo+IAkgIElERFEgcHJvZ3JhbW1pbmcg
dG8gdXNlIGJ5IGNsb2NrIGRyaXZlciBhbmQgdXBkYXRlZCBjbG9jayBkcml2ZXIgdG8KPiAJICB1
c2UgdGhlc2UgaGVscGVyIGZ1bmN0aW9ucyBhbmQgcmVtb3ZlZCBkaXJlY3QgUE1DIGFjY2VzcyBm
cm9tIGNsb2NrCj4gCSAgZHJpdmVyIGFuZCBhbGwgcG1jIGJhc2UgYWRkcmVzcyByZWZlcmVuY2Vz
IGluIGNsb2NrIGRyaXZlci4KPiAKPiAKPiBTb3dqYW55YSBLb21hdGluZW5pICgxNSk6Cj4gICBk
dC1iaW5kaW5nczogc29jOiB0ZWdyYS1wbWM6IEFkZCBUZWdyYSBQTUMgY2xvY2sgYmluZGluZ3MK
PiAgIGR0LWJpbmRpbmdzOiB0ZWdyYTogQ29udmVydCBUZWdyYSBQTUMgYmluZGluZ3MgdG8gWUFN
TAo+ICAgc29jOiB0ZWdyYTogQWRkIFRlZ3JhIFBNQyBjbG9jayByZWdpc3RyYXRpb25zIGludG8g
UE1DIGRyaXZlcgo+ICAgZHQtYmluZGluZ3M6IHNvYzogdGVncmEtcG1jOiBBZGQgaWQgZm9yIFRl
Z3JhIFBNQyBibGluayBjb250cm9sCj4gICBzb2M6IHBtYzogQWRkIGJsaW5rIG91dHB1dCBjbG9j
ayByZWdpc3RyYXRpb24gdG8gVGVncmEgUE1DCj4gICBjbGs6IHRlZ3JhOiBSZW1vdmUgdGVncmFf
cG1jX2Nsa19pbml0IGFsb25nIHdpdGggY2xrIGlkcwo+ICAgZHQtYmluZGluZ3M6IGNsb2NrOiB0
ZWdyYTogUmVtb3ZlIHBtYyBjbG9jayBpZHMgZnJvbSBjbG9jayBkdC1iaW5kaW5ncwo+ICAgQVNv
QzogdGVncmE6IEFkZCBhdWRpbyBtY2xrIGNvbnRyb2wgdGhyb3VnaCBjbGtfb3V0XzEgYW5kIGV4
dGVybjEKPiAgIEFTb0M6IHRlZ3JhOiBBZGQgZmFsbGJhY2sgZm9yIGF1ZGlvIG1jbGsKPiAgIGNs
azogdGVncmE6IFJlbW92ZSBleHRlcm4xIGFuZCBjZGV2MSBmcm9tIGNsb2NrcyBpbml0dGFibGUK
PiAgIEFSTTogZHRzOiB0ZWdyYTogQWRkIGNsb2NrLWNlbGxzIHByb3BlcnR5IHRvIHBtYwoKCj4g
ICBhcm02NDogdGVncmE6IEFkZCBjbG9jay1jZWxscyBwcm9wZXJ0eSB0byBUZWdyYSBQTUMgbm9k
ZQo+ICAgQVJNOiB0ZWdyYTogVXBkYXRlIHNvdW5kIG5vZGUgY2xvY2tzIGluIGRldmljZSB0cmVl
Cj4gICBhcm02NDogdGVncmE6IHNtYXVnOiBDaGFuZ2UgY2xrX291dF8yIHByb3ZpZGVyIHRvIHBt
Ywo+ICAgQVNvQzogbmF1ODgyNTogY2hhbmdlIFRlZ3JhIGNsa19vdXRfMiBwcm92aWRlciBmcm9t
IHRlZ3JhX2NhciB0byBwbWMKCkhlbGxvIFNvd2phbnlhLAoKU29tZXRoaW5nIGdvbmUgd3Jvbmcg
d2l0aCB0aGVzZSBwYXRjaGVzIGJlY2F1c2UgSSBkaWRuJ3QgcmVjZWl2ZSB0aGVtCmFuZCBkb24n
dCBzZWUgdGhlbSBvbiB0aGUgTUwgZWl0aGVyLgoKQWxzbywgdGhlIGxpc3Qgb2YgZW1haWwgY29y
cmVzcG9uZGVudHMgbG9va3MgYSBiaXQgdG9vIGxhcmdlci4gSSdtCnByZXR0eSBzdXJlIHNvbWUg
b2YgdGhlIHBlb3BsZSBkbyBub3QgY2FyZSBtdWNoIGFib3V0IHRoaXMgc2VyaWVzLiBJCnRlbmQg
dG8gdXNlIHNjcmlwdC9nZXRfbWFpbnRhaW5lci5wbCBhbmQgdGhlbiBtYW51YWxseSBwaWNrIHRo
ZSByZWxldmFudApwZW9wbGUgZm9yIHBhdGNoZXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
