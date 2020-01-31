Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB614F072
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 17:10:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41B4B1679;
	Fri, 31 Jan 2020 17:09:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41B4B1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580487012;
	bh=K/Umyzgory3/3ahoIBSAsnGGCgamm2+VtBgnq2gwljE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oj8SJuw7+RI1RREAsg2f7MlprbuHxZzTVhfhqqmu1bwS2jJ5fJe+CJVPmNNzvNqyd
	 RjtahHSkwhnJe8aixj2VXKPRukZWAATHTg2wAKotrK8I8k/RXPvLFTykZ2PaWZL9P3
	 uX80A4/LJizztfYGoPMOMs/YitWcN6g1gSZUbmDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40D3DF80229;
	Fri, 31 Jan 2020 17:08:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48796F8021E; Fri, 31 Jan 2020 17:08:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 757F7F80082
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 17:08:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 757F7F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="iH4ZZfGZ"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3450e20000>; Fri, 31 Jan 2020 08:08:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 31 Jan 2020 08:08:23 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 31 Jan 2020 08:08:23 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jan
 2020 16:08:20 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks
 <ben.dooks@codethink.co.uk>
References: <20200131091901.13014-1-jonathanh@nvidia.com>
 <2bb53d7d-2d36-e16e-5858-24360b19f936@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7fafb8d2-8754-e5c0-8952-0253ba8b656a@nvidia.com>
Date: Fri, 31 Jan 2020 16:08:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2bb53d7d-2d36-e16e-5858-24360b19f936@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580486882; bh=vjVTrlbwSymcOfbnfHt1GCkOMf6AQ7FxsbKWPEoP0Yc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=iH4ZZfGZMTm9UMvyjN9G3vnTaBhURSOyEL+B0fFGDKJogY2P9qSTaAZLQkyzuo5QH
 Qxps5Wt/JCiW2VPPPEGbjIqnu7SsgyF8RShVivMc6NFDObggDJ7Aa9E7VBDEXhLva+
 6ERWIsvhTQzmNiRlYHDmwV4cC9BMObCVkefclTjXkqhXnRnNshuR75RLyD7RV6KHEK
 PoMuI6+gR1uShSMKmNYskuUtcy10eZQa2zPDIXa9mY7jF2LltP+EjDWRhbXNJjTAgh
 nzsTaBGSWhj+LOCKuOfHFE7aBGENOMoKkwuIPn/NQRfq0VaJgv8znNbpBfM2/35rkJ
 IPOURsN1IYSoQ==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] Revert "ASoC: tegra: Allow 24bit and 32bit
	samples"
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

Ck9uIDMxLzAxLzIwMjAgMTU6MzgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAzMS4wMS4yMDIw
IDEyOjE5LCBKb24gSHVudGVyINC/0LjRiNC10YI6Cj4+IENvbW1pdCBmM2VlOTkwODdjOGNhMGVj
ZmRkNTQ5ZWY1YTk0ZjU1N2M0MmQ1NDI4ICgiQVNvQzogdGVncmE6IEFsbG93Cj4+IDI0Yml0IGFu
ZCAzMmJpdCBzYW1wbGVzIikgYWRkZWQgMjQtYml0IGFuZCAzMi1iaXQgc3VwcG9ydCBmb3IgdG8g
dGhlCj4+IFRlZ3JhMzAgSTJTIGRyaXZlci4gSG93ZXZlciwgdGhlcmUgYXJlIHR3byBhZGRpdGlv
bmFsIGNvbW1pdHMgdGhhdCBhcmUKPj4gYWxzbyBuZWVkZWQgdG8gZ2V0IDI0LWJpdCBhbmQgMzIt
Yml0IHN1cHBvcnQgdG8gd29yayBjb3JyZWN0bHkuIFRoZXNlCj4+IGNvbW1pdHMgYXJlIG5vdCB5
ZXQgYXBwbGllZCBiZWNhdXNlIHRoZXJlIGFyZSBzdGlsbCBzb21lIHJldmlldyBjb21tZW50cwo+
PiB0aGF0IG5lZWQgdG8gYmUgYWRkcmVzc2VkLiBXaXRoIG9ubHkgdGhpcyBjaGFuZ2UgYXBwbGll
ZCwgMjQtYml0IGFuZAo+PiAzMi1iaXQgc3VwcG9ydCBpcyBhZHZlcnRpc2VkIGJ5IHRoZSBJMlMg
ZHJpdmVyLCBidXQgaXQgZG9lcyBub3Qgd29yayBhbmQKPj4gdGhlIGF1ZGlvIGlzIGRpc3RvcnRl
ZC4gVGhlcmVmb3JlLCByZXZlcnQgdGhpcyBwYXRjaCBmb3Igbm93IHVudGlsIHRoZQo+PiBvdGhl
ciBjaGFuZ2VzIGFyZSBhbHNvIHJlYWR5Lgo+Pgo+PiBGdXJ0aGVybW9yZSwgYSBjbG9jayBpc3N1
ZSB3aXRoIDI0LWJpdCBzdXBwb3J0IGhhcyBiZWVuIGlkZW50aWZpZWQgd2l0aAo+PiB0aGlzIGNo
YW5nZSBhbmQgc28gaWYgd2UgcmV2ZXJ0IHRoaXMgbm93LCB3ZSBjYW4gYWxzbyBmaXggdGhhdCBp
biB0aGUKPj4gdXBkYXRlZCB2ZXJzaW9uLgo+Pgo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+Pgo+PiBSZXBvcnRlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KPj4gLS0t
Cj4gCj4gVGhhbmtzLCBKb24hCj4gCj4gVGVzdGVkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0
eEBnbWFpbC5jb20+CgpUaGFua3MuIEkganVzdCByZWFsaXNlZCBJIGZvcmdvdCB0aGUgZml4ZXMt
dGFnIC4uLgoKRml4ZXM6IGYzZWU5OTA4N2M4YyAoIkFTb0M6IHRlZ3JhOiBBbGxvdyAyNGJpdCBh
bmQgMzJiaXQgc2FtcGxlcyIpCgpNYXJrLCBsZXQgbWUga25vdyBpZiB5b3Ugd2FudCBtZSB0byBy
ZXNlbmQuCgpKb24KCi0tIApudnB1YmxpYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
