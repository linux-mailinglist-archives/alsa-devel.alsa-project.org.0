Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B114418B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 17:05:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 070FF166F;
	Tue, 21 Jan 2020 17:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 070FF166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579622756;
	bh=E2Zt16yWdQEroYNLP3O2RCrpvX2w5uP6eSh92DBw3KY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lcGTclCJzJW7TdH9h+LYcXcdRXz6ktoKdTM9RuvqQh9ap27/EJ+6AN2MZ21K/Kcv6
	 TNMFYG8BgRnJwjvn9RzwGiLNNMSV12qYZ8DhfNA9xoOTRuhG8Zr2M14EY3W2gGXB+d
	 Bi5auLm0u69/D4gjpL/SpP9YjvlvhvftMEGhp424=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8637F8021C;
	Tue, 21 Jan 2020 17:04:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A4B7F801ED; Tue, 21 Jan 2020 17:04:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E126F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 17:04:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E126F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RIR8TO7s"
Received: by mail-lf1-x141.google.com with SMTP id 203so2683709lfa.12
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 08:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4QElD4aLgqnxIJYOw+6hd85zSf1XDYHPFQQs8FVOpM4=;
 b=RIR8TO7sH4q9qS6/bFOYNX7/b+ZDX2vFNdHP/g+lQB6/t8sLVO/BG/dOQK5bd4YkS9
 3xUOVihE7L7weX1mW9pVZHpPTX8Khtm0hc+BXfTytT5F6A9ZEuKkwliKQoxHbgU87YJz
 eX0bCZH4JjFHyBoGPnUoH4r8Sjk6zc8Xe0dqe1P8OzP2eqyNAV8wSMLwz6Rbw03UBNxZ
 mUv81d8q3O1kvCcYE0pKMEnUypCOUgKMrAVfIIOHRyM3drDIDLC1lXDWx0jwKYQMnxIl
 CyOrsEwX5FoRyQGI29X3DrN31rN3VnpxB2XPF1kT0orssRzlu3C6xD4QruxVxdNql7V5
 Oj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4QElD4aLgqnxIJYOw+6hd85zSf1XDYHPFQQs8FVOpM4=;
 b=dLIs1mdSt4ULKqqj5vUm1qUUCi6mCM2ioVSBr7L3DqEWV4esF4lAsaVGtL7yZJBhpy
 tmtQTv2W7H1rLG6XsR5JoGSWHq+gjMEhd5ucRWXdbSRwXdHN4NhWz5DxR2D4hhZ0BoGl
 3orRPam1A9DGUp/CXOmIW1tMNKTx2lHzrFSyO+lVcrdN/gemytcNRjkt/9wEs5Okymym
 4ElRDHBdE0EWICLBACHXcKHpBXnBT8M/1NS+jVww6yWiZqKyz6hwFsaH731fPRgGG7dC
 ozcau9oL9WiCIDINn5n64cREJXxMnsBY1ramaujndjRR4H3nEPwP/BygeCVe1j6MKC4s
 pMUw==
X-Gm-Message-State: APjAAAXjAQPlNnYYE2DUYTvrNUBemwWCrpk0FExIa933M+OP+wRcomqw
 yMz89nj1THj4R5znaJPIgYo=
X-Google-Smtp-Source: APXvYqy7EtDOd9lxlMN59AeictrAoxR0wB9a8lavz+2thaHFgaRugWz3ll5Ecy/t12c/eutcaI9siw==
X-Received: by 2002:a19:550d:: with SMTP id n13mr2212655lfe.48.1579622661898; 
 Tue, 21 Jan 2020 08:04:21 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id f8sm1936176lfc.22.2020.01.21.08.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 08:04:21 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-3-git-send-email-spujar@nvidia.com>
 <d01ed171-d949-19b2-3390-ee30eada2779@gmail.com>
 <a8409b81-7c6b-37a9-81fd-772eb2eca185@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <229def08-6bd4-30d7-056b-92329e48c699@gmail.com>
Date: Tue, 21 Jan 2020 19:04:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <a8409b81-7c6b-37a9-81fd-772eb2eca185@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 2/9] ASoC: tegra: add support for CIF
 programming
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

MjEuMDEuMjAyMCAwNzo0MSwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gCj4gT24gMS8yMC8y
MDIwIDk6MjggUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gRXh0ZXJuYWwgZW1haWw6IFVz
ZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4KPj4KPj4gSGVsbG8gU2Ft
ZWVyLAo+Pgo+PiAyMC4wMS4yMDIwIDE3OjIzLCBTYW1lZXIgUHVqYXIg0L/QuNGI0LXRgjoKPj4K
Pj4gW3NuaXBdCj4+Cj4+PiBUZWdyYTMwIGFuZCBUZWdyYTEyNCBoYXZlIGFuIGlkZW50aWNhbCBD
SUYgcHJvZ3JhbW1pbmcgaGVscGVyIGZ1bmN0aW9uLgo+PiBbc25pcF0KPj4KPj4+IC0jZGVmaW5l
IFRFR1JBMTI0X0FVRElPQ0lGX0NUUkxfRklGT19USFJFU0hPTERfU0hJRlTCoCAyNAo+Pj4gLSNk
ZWZpbmUgVEVHUkExMjRfQVVESU9DSUZfQ1RSTF9GSUZPX1RIUkVTSE9MRF9NQVNLX1VTwqDCoMKg
wqDCoMKgwqAgMHgzZgo+Pj4gLSNkZWZpbmUgVEVHUkExMjRfQVVESU9DSUZfQ1RSTF9GSUZPX1RI
UkVTSE9MRF9NQVNLwqDCoAo+Pj4gKFRFR1JBMTI0X0FVRElPQ0lGX0NUUkxfRklGT19USFJFU0hP
TERfTUFTS19VUyA8PAo+Pj4gVEVHUkExMjRfQVVESU9DSUZfQ1RSTF9GSUZPX1RIUkVTSE9MRF9T
SElGVCkKPj4+IC0KPj4+IC0vKiBDaGFubmVsIGNvdW50IG1pbnVzIDEgKi8KPj4+IC0jZGVmaW5l
IFRFR1JBMzBfQVVESU9DSUZfQ1RSTF9BVURJT19DSEFOTkVMU19TSElGVMKgwqAgMjQKPj4+IC0j
ZGVmaW5lIFRFR1JBMzBfQVVESU9DSUZfQ1RSTF9BVURJT19DSEFOTkVMU19NQVNLX1VTIDcKPj4+
IC0jZGVmaW5lIFRFR1JBMzBfQVVESU9DSUZfQ1RSTF9BVURJT19DSEFOTkVMU19NQVNLwqDCoMKg
Cj4+PiAoVEVHUkEzMF9BVURJT0NJRl9DVFJMX0FVRElPX0NIQU5ORUxTX01BU0tfVVMgPDwKPj4+
IFRFR1JBMzBfQVVESU9DSUZfQ1RSTF9BVURJT19DSEFOTkVMU19TSElGVCkKPj4gVGhlIEFVRElP
Q0lGX0NUUkwgYml0ZmllbGRzIGFyZSBub3QgdGhlIHNhbWUgb24gVDMwIGFuZCBUMTI0LCB3aHkg
YXJlCj4+IHlvdSBjbGFpbWluZyB0aGF0IHByb2dyYW1taW5nIGlzIGlkZW50aWNhbD8gSGF2ZSB5
b3UgYWN0dWFsbHkgdHJpZWQgdG8KPj4gdGVzdCB0aGVzZSBwYXRjaGVzIG9uIFQzMD8KPiAKPiBP
aCB5ZXMhIHNlZW1zIGxpa2UgSSBvdmVybG9va2VkIHRoZSBtYWNybyB2YWx1ZXMuIFRoYW5rcyBm
b3IgcG9pbnRpbmcKPiB0aGlzLiBJIHdpbGwgcmV0YWluIHNlcGFyYXRlIENJRiBmdW5jdGlvbiBm
b3IgVGVncmEzMC4KPiBJIGRvIG5vdCBoYXZlIGEgVGVncmEzMCBib2FyZCB3aXRoIG1lIGFuZCBo
ZW5jZSBjb3VsZCBub3QgdGVzdCBhbnl0aGluZwo+IHNwZWNpZmljIHRvIGl0IGFwYXJ0IGZyb20g
YnVpbGQgc2FuaXR5Lgo+IElmIHNvbWVvbmUgY2FuIGhlbHAgbWUgdGVzdCBJIHdvdWxkIHJlYWxs
eSBhcHByZWNpYXRlLgo+IAoKSSdsbCBoZWxwIHdpdGggdGhlIHRlc3Rpbmcgb25jZSBhbGwgb2J2
aW91cyBwcm9ibGVtcyB3aWxsIGJlIGZpeGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbHNhLWRldmVsCg==
