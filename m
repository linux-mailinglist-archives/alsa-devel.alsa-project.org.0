Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7813076B
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 11:55:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2256D1764;
	Sun,  5 Jan 2020 11:55:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2256D1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578221755;
	bh=WXeNOVF+HRfW2WgYqxUqJOw25nVe/0bop+3+foKBkZ4=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p2UBO4y3Gc69ITlcDb2YvQ9f2fUOVSCDMndtjLlFeXKA0LEz/eiF14AcRV6DQEuBj
	 hvgh+wkPuRpv7BbAhiOev13zRGQ1MLLvL7N6G/Hnh8TxNlVixUFA3ZFiuIMfYfz5fy
	 0CjbKtFaOp4UFFV7DwWWX8DDvS7ykqY3f8cCMfNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C74F80140;
	Sun,  5 Jan 2020 11:54:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8188CF80140; Sun,  5 Jan 2020 11:54:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5634F8013F
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 11:54:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5634F8013F
Received: from [78.40.148.177] (helo=localhost)
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1io3Xg-0007jP-TJ; Sun, 05 Jan 2020 10:53:57 +0000
MIME-Version: 1.0
Date: Sun, 05 Jan 2020 10:53:56 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
User-Agent: Roundcube Webmail/1.4.2
Message-ID: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
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

CgpPbiAyMDIwLTAxLTA1IDAxOjQ4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDUuMDEuMjAy
MCAwMzowNCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+IFtzbmlwXQo+PiAKPj4gSSd2ZSBqdXN0
IGdvbmUgdGhyb3VnaCB0ZXN0aW5nLgo+PiAKPj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93
IDE2IGFuZCAzMi1iaXRzIHdvcmsuCj4+IAo+PiBUaGUgMjQgYml0IGNhc2Ugc2VlbXMgdG8gYmUg
d2VpcmQsIGl0IGxvb2tzIGxpa2UgdGhlIDI0LWJpdCBleHBlY3RzCj4+IDI0IGJpdCBzYW1wbGVz
IGluIDMyIGJpdCB3b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+PiBk
byAyNCBiaXQgaW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUgMjQgYml0IHNhbXBs
ZSBzdXBwb3J0Cj4+ICh3aGljaCBpcyBhIHNoYW1lKQo+PiAKPj4gTXkgcHJlZmVyZW5jZSBpcyB0
byByZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0IGFuZCBrZWVwIHRoZSAzMiBiaXQgaW4uCj4+IAo+
IAo+IEludGVyZXN0aW5nLi4gSm9uLCBjb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gdGhhdCAyNGJp
dCBmb3JtYXQgaXNuJ3QKPiB1c2FibGUgb24gVDMwPwoKSWYgdGhlcmUgaXMgYW4gb3B0aW9uIG9m
IDI0IHBhY2tlZCBpbnRvIDMyLCB0aGVuIEkgdGhpbmsgdGhhdCB3b3VsZCAKd29yay4KCkkgY2Fu
IHRyeSB0ZXN0aW5nIHRoYXQgd2l0aCByYXcgZGF0YSBvbiBNb25kYXkuCgotLSAKQmVuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
