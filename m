Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB5055B7A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 00:44:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AFA4166A;
	Wed, 26 Jun 2019 00:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AFA4166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561502693;
	bh=S++TjcyMQkxR+dLOsT5Jr0XobUT5gymppgyzxv9/Boc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQofnVVurVRlGiDtWXxplhoNhw6uic5GWiK1Ip2sX0D+L7weZNw9mwHZk+9KDCuqw
	 UPUX4hl65ewBk1U4lDGWdQQPCqEmib46bUNosdQfy0WLs/LQliN5AE8rrTObveYMlV
	 RorMhoPgr6/hG2NBu6XGrrXXx8IteBrvUgh8GUOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3CEAF896FC;
	Wed, 26 Jun 2019 00:43:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47F84F896F9; Wed, 26 Jun 2019 00:43:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A2C1F896EA
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 00:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A2C1F896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NvS/nY4i"
Received: by mail-lf1-x141.google.com with SMTP id y198so173506lfa.1
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ogc1aznWWJW4qc/ayPmND9XlH+FKEUMjKTQB0hejDRk=;
 b=NvS/nY4iQy3U0gk55FJiIsuN/Xr1Ll6O63deLQePbfSZTc0ltnFqGRm6bxTskY06Pt
 9mALWYLEfiiWdi5xqW2mqReztLaDPUmkpC+t+EHFM1xUNIBU5ZjQfeeB43KikuQwUCqm
 GNNTpEM/bycydlfsfWXKKwB1uuRhmZklntmWEQjs3NWzRsfhaMeXlsl2d14ZIKhn8mWF
 vy0Bmo6Z68KM1AoIqXTs/bQH04uYmIEO4vQT3z/ZAgds/nUr4FEwPzEHn7xOUxPMFusw
 Nmz4m2D5pSQkTx+p+xAecRKJKjvkw1wc9p27j9ThfwZtfqZzv5xP6whGYFeXjL6T0Z+5
 +e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ogc1aznWWJW4qc/ayPmND9XlH+FKEUMjKTQB0hejDRk=;
 b=c1JlE0CNVX/8firVf37ehG44gU/9onAnm+oYVZSt3nnPwflWRn+VNDV7qKz7kFEzxm
 BjX9zyQKNm9rwVi2f6LSe6/RBHSf6J909Skrh5pzUrXbp2iGLFb8JYERMwOVBMQ9S99M
 NiL+8BxldekUr+JI4kkqAvPskdDIgzxzFz7BI/u6HCPS4x5MiRvR3W7r05r5Obnnfo0a
 tgNQ0x3SvEjyFUt+KaRezYBCJHs0dpSubS/k3x9K3XglFdNSNttQrcfoEeZ3JFgjkFE1
 dEFgZUBpQ5VtH4itcVXMc4qhyAvPwJGD69TpzS2DjHwmMFqkVN1A+zl5aFMeR3Ta5i/b
 vH2Q==
X-Gm-Message-State: APjAAAW7NjcZhrH/QY3aJvVLQV5cPctUGanVa61DEQApsndpz8u2TpTX
 UrLwo6oDAn0wkOK3K8d+Qt8=
X-Google-Smtp-Source: APXvYqytbOwn5GHpnmtD+S8cGjXXmmluhSybeleHIcpVYS4Vr/wemWSbJmHebmUybVjqhrey/0B1SQ==
X-Received: by 2002:ac2:5981:: with SMTP id w1mr660485lfn.48.1561502582379;
 Tue, 25 Jun 2019 15:43:02 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru.
 [91.79.162.197])
 by smtp.googlemail.com with ESMTPSA id b25sm2119717lff.42.2019.06.25.15.43.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 15:43:01 -0700 (PDT)
To: Jon Hunter <jonathanh@nvidia.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87y33aaluu.wl-kuninori.morimoto.gx@renesas.com>
 <87r292alro.wl-kuninori.morimoto.gx@renesas.com>
 <cb3a6d0a-ca7b-d6b6-72db-5dff520acfc9@gmail.com>
 <374e71f7-b49c-ec79-f3ca-ae630a383521@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cf87d0d0-8e73-adec-4097-83652dfedb7a@gmail.com>
Date: Wed, 26 Jun 2019 01:43:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <374e71f7-b49c-ec79-f3ca-ae630a383521@nvidia.com>
Content-Language: en-US
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: soc-core: use
 soc_find_component() at snd_soc_get_dai_id()
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

MjYuMDYuMjAxOSAxOjM4LCBKb24gSHVudGVyINC/0LjRiNC10YI6Cj4gCj4gT24gMjUvMDYvMjAx
OSAyMTo0NywgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAxMy4wNS4yMDE5IDEwOjA3LCBLdW5p
bm9yaSBNb3JpbW90byDQv9C40YjQtdGCOgo+Pj4gRnJvbTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1
bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+Pj4KPj4+IHNvYy1jb3JlIGNvcmUgYWxy
ZWFkeSBoYXMgc29jX2ZpbmRfY29tcG9uZW50KCkgd2hpY2ggZmluZAo+Pj4gY29tcG9uZW50IGZy
b20gZGV2aWNlIG5vZGUuCj4+PiBMZXQncyB1c2UgZXhpc3RpbmcgZnVuY3Rpb24gdG8gZmluZCBj
b21wb25lbnQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlu
b3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+Pj4gLS0tCj4+PiAgc291bmQvc29jL3NvYy1j
b3JlLmMgfCAxNyArKysrKy0tLS0tLS0tLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
c29jLWNvcmUuYyBiL3NvdW5kL3NvYy9zb2MtY29yZS5jCj4+PiBpbmRleCBlNTUxNzBjLi5lODNl
ZGJlIDEwMDY0NAo+Pj4gLS0tIGEvc291bmQvc29jL3NvYy1jb3JlLmMKPj4+ICsrKyBiL3NvdW5k
L3NvYy9zb2MtY29yZS5jCj4+PiBAQCAtMzc1MSw3ICszNzUxLDcgQEAgRVhQT1JUX1NZTUJPTF9H
UEwoc25kX3NvY19vZl9wYXJzZV9kYWlmbXQpOwo+Pj4gIAo+Pj4gIGludCBzbmRfc29jX2dldF9k
YWlfaWQoc3RydWN0IGRldmljZV9ub2RlICplcCkKPj4+ICB7Cj4+PiAtCXN0cnVjdCBzbmRfc29j
X2NvbXBvbmVudCAqcG9zOwo+Pj4gKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVu
dDsKPj4+ICAJc3RydWN0IGRldmljZV9ub2RlICpub2RlOwo+Pj4gIAlpbnQgcmV0Owo+Pj4gIAo+
Pj4gQEAgLTM3NjUsMTcgKzM3NjUsMTAgQEAgaW50IHNuZF9zb2NfZ2V0X2RhaV9pZChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmVwKQo+Pj4gIAkgKi8KPj4+ICAJcmV0ID0gLUVOT1RTVVBQOwo+Pj4gIAlt
dXRleF9sb2NrKCZjbGllbnRfbXV0ZXgpOwo+Pj4gLQlmb3JfZWFjaF9jb21wb25lbnQocG9zKSB7
Cj4+PiAtCQlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNvbXBvbmVudF9vZl9ub2RlID0gc29jX2NvbXBv
bmVudF90b19ub2RlKHBvcyk7Cj4+PiAtCj4+PiAtCQlpZiAoY29tcG9uZW50X29mX25vZGUgIT0g
bm9kZSkKPj4+IC0JCQljb250aW51ZTsKPj4+IC0KPj4+IC0JCWlmIChwb3MtPmRyaXZlci0+b2Zf
eGxhdGVfZGFpX2lkKQo+Pj4gLQkJCXJldCA9IHBvcy0+ZHJpdmVyLT5vZl94bGF0ZV9kYWlfaWQo
cG9zLCBlcCk7Cj4+PiAtCj4+PiAtCQlicmVhazsKPj4+IC0JfQo+Pj4gKwljb21wb25lbnQgPSBz
b2NfZmluZF9jb21wb25lbnQobm9kZSwgTlVMTCk7Cj4+PiArCWlmIChjb21wb25lbnQgJiYKPj4+
ICsJICAgIGNvbXBvbmVudC0+ZHJpdmVyLT5vZl94bGF0ZV9kYWlfaWQpCj4+PiArCQlyZXQgPSBj
b21wb25lbnQtPmRyaXZlci0+b2ZfeGxhdGVfZGFpX2lkKGNvbXBvbmVudCwgZXApOwo+Pj4gIAlt
dXRleF91bmxvY2soJmNsaWVudF9tdXRleCk7Cj4+PiAgCj4+PiAgCW9mX25vZGVfcHV0KG5vZGUp
Owo+Pj4KPj4KPj4gSGksCj4+Cj4+IFRoaXMgcGF0Y2ggY2F1c2VzIGNyYXNoIG9uIHRvZGF5J3Mg
bGludXgtbmV4dCBhcHBhcmVudGx5IGJlY2F1c2UgIkNQVSBEQUkiIGlzIG5vdAo+PiByZWdpc3Rl
cmVkIG5vdywgYW55IGlkZWFzPwo+IAo+IEZXSVcgSSBhbSBzZWVpbmcgdGhlIHNhbWUgY3Jhc2gv
cmVncmVzc2lvbiwgaG93ZXZlciwgdGhlIGJpc2VjdCBpcwo+IHBvaW50aW5nIHRvIGNvbW1pdCBi
OWYyZTI1YzU5OWJiYmYwNjQ2OTU3ZTA3ZWJiNzJiOTQyYzI4NmNjICgiQVNvQzoKPiBzb2MtY29y
ZTogdXNlIHNvY19maW5kX2NvbXBvbmVudCgpIGF0IHNuZF9zb2NfZmluZF9kYWkoKSIpIGFuZCBy
ZXZlcnRpbmcKPiB0aGlzIGNvbW1pdCBmaXhlcyB0aGUgcHJvYmxlbSBmb3IgbWUuCj4gCj4gRG1p
dHJ5LCBhcmUgeW91IHN1cmUgaXQgaXMgdGhpcyBjb21taXQ/IFRoZXkgZG8gaGF2ZSBhIHNpbWls
YXIgbmFtZS4KCkluZGVlZCEgSSBhY2NpZGVudGFsbHkgcmVwbGllZCB0byBhIHdyb25nIGVtYWls
LCB0aGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUKY2xhcmlmaWNhdGlvbi4gQW5kIGdvb2QgdG8g
a25vdyB0aGF0IGl0J3MgYSBnbG9iYWwgcHJvYmxlbSBhbmQgbm90IG15IGxvY2FsIHNldHVwIGlz
c3VlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
