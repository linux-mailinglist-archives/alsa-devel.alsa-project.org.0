Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF35565E4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 11:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F9671614;
	Wed, 26 Jun 2019 11:47:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F9671614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561542518;
	bh=91GP0qiUtwPVvLsNuFUHmu1fyw9UUQIm4rNQiOgWQkk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jU51nP/f1GCG5vABxx5zCJZoz7Je5QaYSNXda99i4kD/b1WuXNmqKt1baj2TSMt4M
	 TSvUI/2nC9ipwbv/XUw0ny5ghfLjV4vyfs4SnqZeoF5BrMplOImRrN1WDc/NEQWfbj
	 YTATn9EWOJ8eO9C9ziBmgpfd5ylKF1dy4A1kq6lA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31C7EF896B7;
	Wed, 26 Jun 2019 11:46:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9C4BF896B9; Wed, 26 Jun 2019 11:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9A78F806F0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 11:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9A78F806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="nQeuJjRi"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d133f070000>; Wed, 26 Jun 2019 02:46:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 26 Jun 2019 02:46:45 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 26 Jun 2019 02:46:45 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 09:46:43 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>
References: <878stpyvky.wl-kuninori.morimoto.gx@renesas.com>
 <8291b20f-8926-8089-0507-36b8b1025b35@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c4587ef2-0cec-ddad-f3ae-2b271505569c@nvidia.com>
Date: Wed, 26 Jun 2019 10:46:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <8291b20f-8926-8089-0507-36b8b1025b35@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1561542407; bh=kOuHvF4pFuFql+uak+NdzZIhDUvLPSYVA2iwgAPBa4A=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=nQeuJjRis+7fHfAF1qy2MQUg5yfCmmM4vi/ylcuFz7pFkuEeUOSgbG1s06ymueho7
 P1qsxtSlh61UDNrC5j9XxeVe+kef80Zyg/IdcMVQaXMa81KPOK565NM/WJKqYjej0i
 qlz5C4hheCceOwejJP4tz2s3nTxQNlf2BqY83ysAVw8OEkayKS9Mdo1Prn8EKxFXkQ
 tS8kFm703GyyL0PnLAZe11GcsNFvd2gyMP2YXMoRtWfvtLZsRSOoQDeTw2JcAYz/Gp
 6/xETyhb11+VT45b0H3FgpnNU2RgEdIP7WUUzhgmDoLeFCPa5SESSH6KdVa/UUxNL7
 +VgrzScgXR2YQ==
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: don't use
 soc_find_component() at snd_soc_find_dai()
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

Ck9uIDI2LzA2LzIwMTkgMDI6NTQsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAyNi4wNi4yMDE5
IDQ6NDAsIEt1bmlub3JpIE1vcmltb3RvINC/0LjRiNC10YI6Cj4+IEZyb206IEt1bmlub3JpIE1v
cmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KPj4KPj4gY29tbWl0IGI5
ZjJlMjVjNTk5YmIgKCJBU29DOiBzb2MtY29yZTogdXNlIHNvY19maW5kX2NvbXBvbmVudCgpIGF0
Cj4+IHNuZF9zb2NfZmluZF9kYWkoKSIpIHVzZWQgc29jX2ZpbmRfY29tcG9uZW50KCkgYXQgc25k
X3NvY19maW5kX2RhaSgpLAo+PiBidXQsIHNvbWUgQ1BVIGRyaXZlciBoYXMgQ1BVIGNvbXBvbmVu
dCBmb3IgREFJIGFuZCBQbGF0Zm9ybSBjb21wb25lbnQsCj4+IGZvciBleGFtcGxlIGdlbmVyaWMg
RE1BRW5naW5lIGNvbXBvbmVudC4KPj4gSW4gc3VjaCBjYXNlLCBDUFUgY29tcG9uZW50IGFuZCBQ
bGF0Zm9ybSBjb21wb25lbnQgaGF2ZSBzYW1lCj4+IG9mX25vZGUgLyBuYW1lLgo+Pgo+PiBIZXJl
IHNvY19maW5kX2NvbXBvbmVudCgpIHJldHVybnMgKjFzdCogZm91bmQgY29tcG9uZW50Lgo+PiBU
aHVzLCB3ZSBzaG91bGRuJ3QgdXNlIHNvY19maW5kX2NvbXBvbmVudCgpIGF0IHNuZF9zb2NfZmlu
ZF9kYWkoKS4KPj4gVGhpcyBwYXRjaCBmaXh1cCB0aGlzIGl0LCBhbmQgYWRkIGNvbW1lbnQgdG8g
aW5kaWNhdGUgdGhpcyBsaW1pdGF0aW9uLgo+Pgo+PiBGaXhlczogY29tbWl0IGI5ZjJlMjVjNTk5
YmIgKCJBU29DOiBzb2MtY29yZTogdXNlIHNvY19maW5kX2NvbXBvbmVudCgpIGF0IHNuZF9zb2Nf
ZmluZF9kYWkoKSIpCj4+IFJlcG9ydGVkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFp
bC5jb20+Cj4+IFJlcG9ydGVkLWJ5OiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4
QHJlbmVzYXMuY29tPgo+PiAtLS0KPj4gIHNvdW5kL3NvYy9zb2MtY29yZS5jIHwgMTMgKysrKysr
KysrKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29jLWNvcmUuYyBiL3NvdW5kL3NvYy9z
b2MtY29yZS5jCj4+IGluZGV4IDM1OGYxZmIuLjhjY2FmNjMgMTAwNjQ0Cj4+IC0tLSBhL3NvdW5k
L3NvYy9zb2MtY29yZS5jCj4+ICsrKyBiL3NvdW5kL3NvYy9zb2MtY29yZS5jCj4+IEBAIC03ODYs
NiArNzg2LDE0IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKnNvY19maW5kX2Nv
bXBvbmVudCgKPj4gIAo+PiAgCWxvY2tkZXBfYXNzZXJ0X2hlbGQoJmNsaWVudF9tdXRleCk7Cj4+
ICAKPj4gKwkvKgo+PiArCSAqIE5PVEUKPj4gKwkgKgo+PiArCSAqIEl0IHJldHVybnMgKjFzdCog
Zm91bmQgY29tcG9uZW50LCBidXQgc29tZSBkcml2ZXIKPj4gKwkgKiBoYXMgZmV3IGNvbXBvbmVu
dHMgYnkgc2FtZSBvZl9ub2RlL25hbWUKPj4gKwkgKiBleCkKPj4gKwkgKglDUFUgY29tcG9uZW50
IGFuZCBnZW5lcmljIERNQUVuZ2luZSBjb21wb25lbnQKPj4gKwkgKi8KPj4gIAlmb3JfZWFjaF9j
b21wb25lbnQoY29tcG9uZW50KQo+PiAgCQlpZiAoc25kX3NvY19pc19tYXRjaGluZ19jb21wb25l
bnQoZGxjLCBjb21wb25lbnQpKQo+PiAgCQkJcmV0dXJuIGNvbXBvbmVudDsKPj4gQEAgLTgxMyw4
ICs4MjEsOSBAQCBzdHJ1Y3Qgc25kX3NvY19kYWkgKnNuZF9zb2NfZmluZF9kYWkoCj4+ICAJbG9j
a2RlcF9hc3NlcnRfaGVsZCgmY2xpZW50X211dGV4KTsKPj4gIAo+PiAgCS8qIEZpbmQgQ1BVIERB
SSBmcm9tIHJlZ2lzdGVyZWQgREFJcyAqLwo+PiAtCWNvbXBvbmVudCA9IHNvY19maW5kX2NvbXBv
bmVudChkbGMpOwo+PiAtCWlmIChjb21wb25lbnQpIHsKPj4gKwlmb3JfZWFjaF9jb21wb25lbnQo
Y29tcG9uZW50KSB7Cj4+ICsJCWlmICghc25kX3NvY19pc19tYXRjaGluZ19jb21wb25lbnQoZGxj
LCBjb21wb25lbnQpKQo+PiArCQkJY29udGludWU7Cj4+ICAJCWZvcl9lYWNoX2NvbXBvbmVudF9k
YWlzKGNvbXBvbmVudCwgZGFpKSB7Cj4+ICAJCQlpZiAoZGxjLT5kYWlfbmFtZSAmJiBzdHJjbXAo
ZGFpLT5uYW1lLCBkbGMtPmRhaV9uYW1lKQo+PiAgCQkJICAgICYmICghZGFpLT5kcml2ZXItPm5h
bWUKPj4KPiAKPiBUaGFuayB5b3UgdmVyeSBtdWNoIQo+IAo+IFRlc3RlZC1ieTogRG1pdHJ5IE9z
aXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgoKVGVzdGVkLWJ5OiBKb24gSHVudGVyIDxqb25hdGhh
bmhAbnZpZGlhLmNvbT4KClRoYW5rcyEKSm9uCgotLSAKbnZwdWJsaWMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
