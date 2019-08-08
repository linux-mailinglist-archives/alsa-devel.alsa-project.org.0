Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8A86A70
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 21:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF98852;
	Thu,  8 Aug 2019 21:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF98852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565291830;
	bh=tXJ/+9Thwy9uZDNd+o0lkVh73lmNefuBR/g7C+bxdlY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l9n6etGO+f8KAK5MWkJrMkxawb7/5foDGES36kysNVh14EeSQa8Hged2y/xWTPmg6
	 9QWuITcsc/fZ4DzH0uMtbmYtdYZeVaA2y80GIEqgTvRgOPNHtHxpDr+fWxF/N3f62e
	 0QJU33hIHxAybGZXHefkVdr8XsKvI+n6/Nx3ZWfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5831DF800E3;
	Thu,  8 Aug 2019 21:15:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B684F80534; Thu,  8 Aug 2019 21:15:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D21C0F803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 21:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D21C0F803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 12:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; d="scan'208";a="199157461"
Received: from jmikitka-mobl2.amr.corp.intel.com (HELO [10.252.204.174])
 ([10.252.204.174])
 by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2019 12:15:15 -0700
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 Chiang Mac <mac.chiang@intel.com>
References: <1565251120-13082-1-git-send-email-mac.chiang@intel.com>
 <CAFQqKeXO5XHTrgTvXDRtqPDZZNrb24GB9ps3L=7WYadW0nYuKA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <555a5469-a49b-92fa-cf8a-d379c2f46b05@linux.intel.com>
Date: Thu, 8 Aug 2019 14:15:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFQqKeXO5XHTrgTvXDRtqPDZZNrb24GB9ps3L=7WYadW0nYuKA@mail.gmail.com>
Content-Language: en-US
Cc: "M R, Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: Add Cometlake machine
 driver support
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

Cj4gICAgICvCoCDCoCDCoCDCoH0gZWxzZSBpZiAoc29jX2ludGVsX2lzX2NtbCgpKSB7Cj4gICAg
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuc2lnbmVkIGludCBpOwo+ICAgICArCj4gICAgICsg
YnJveHRvbl9hdWRpb19jYXJkLm5hbWUgPGh0dHA6Ly9icm94dG9uX2F1ZGlvX2NhcmQubmFtZT4g
PQo+ICAgICAiY21sZGE3MjE5bWF4IjsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShicm94dG9uX2RhaXMpOyBpKyspIHsKPiAg
ICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogTUFYSU1fQ09ERUMgaXMg
Y29ubmVjdGVkIHRvIFNTUDEuICovCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGlmICghc3RyY21wKGJyb3h0b25fZGFpc1tpXS5jb2RlY3MtPmRhaV9uYW1lLAo+ICAg
ICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBCWFRfTUFYSU1fQ09ERUNfREFJKSkgewo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicm94dG9uX2RhaXNbaV0uaWQgPSAxOwo+ICAgICAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicm94dG9uX2Rh
aXNbaV0ubmFtZSA9ICJTU1AxLUNvZGVjIjsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJveHRvbl9kYWlzW2ldLmNwdXMtPmRhaV9uYW1lID0K
PiAgICAgIlNTUDEgUGluIjsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfQo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBESUFMT0df
Q09ERUMgaXMgY29ubmVjdGVkIHRvIFNTUDAgKi8KPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZWxzZSBpZgo+ICAgICAoIXN0cmNtcChicm94dG9uX2RhaXNbaV0uY29k
ZWNzLT5kYWlfbmFtZSwKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQlhUX0RJQUxPR19DT0RFQ19EQUkpKSB7Cj4gICAgICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyb3h0b25fZGFp
c1tpXS5pZCA9IDA7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGJyb3h0b25fZGFpc1tpXS5uYW1lID0gIlNTUDAtQ29kZWMiOwo+ICAgICArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicm94dG9uX2RhaXNb
aV0uY3B1cy0+ZGFpX25hbWUgPQo+ICAgICAiU1NQMCBQaW4iOwo+ICAgICArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0K
PiAgICAgIMKgIMKgIMKgIMKgIH0KPiAKPiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBrZWVwIHRo
ZSBJRCdzIHVuY2hhbmdlZD8gSXRzIHF1aXRlIGNvbmZ1c2luZyAKPiB3aXRoIHNvIG1hbnkgcGxh
dGZvcm1zIHJldXNpbmcgdGhlIG1hY2hpbmUgZHJpdmVyIHNvIGl0IHdvdWxkIGhlbHAgaWYgCj4g
dGhlIGNoYW5nZXMgYXJlIG1pbmltYWwuCj4gSSB1bmRlcnN0YW5kIHdoeSB5b3Ugd2FudCB0byBj
aGFuZ2UgdGhlIElEJ3MgYnV0IGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8gCj4ganVzdCB1c2UgdGhl
IGV4aXN0aW5nIElEJ3MgaW4gdG9wb2xvZ3kgSSB0aGluay4KClJhbmphbmksIGp1c3QgdG8gYXZv
aWQgY29uZnVzaW9uIGhlcmUsIHdoYXQgJ0lEJyBhcmUgeW91IHJlZmVycmluZyB0bz8KCkkgY2Fu
IHNlZSB0aGF0IGluIHRoZSBleGlzdGluZyBHTEsgY29kZSAoY29waWVkIGJlbG93KSB0aGUgLmlk
IGZpZWxkIGlzIApub3QgdG91Y2hlZCwgb25seSB0aGUgbmFtZSBhbmQgZGFpX25hbWUgYXJlIGNo
YW5nZWQsIGlzIHRoaXMgd2hhdCB5b3UgCndlcmUgaGludGluZyBhdD8KCglpZiAoc29jX2ludGVs
X2lzX2dsaygpKSB7CgkJdW5zaWduZWQgaW50IGk7CgoJCWJyb3h0b25fYXVkaW9fY2FyZC5uYW1l
ID0gImdsa2RhNzIxOW1heCI7CgkJLyogRml4dXAgdGhlIFNTUCBlbnRyaWVzIGZvciBnZW1pbmls
YWtlICovCgkJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoYnJveHRvbl9kYWlzKTsgaSsrKSB7
CgkJCS8qIE1BWElNX0NPREVDIGlzIGNvbm5lY3RlZCB0byBTU1AxLiAqLwoJCQlpZiAoIXN0cmNt
cChicm94dG9uX2RhaXNbaV0uY29kZWNzLT5kYWlfbmFtZSwKCQkJCSAgICBCWFRfTUFYSU1fQ09E
RUNfREFJKSkgewoJCQkJYnJveHRvbl9kYWlzW2ldLm5hbWUgPSAiU1NQMS1Db2RlYyI7CgkJCQli
cm94dG9uX2RhaXNbaV0uY3B1cy0+ZGFpX25hbWUgPSAiU1NQMSBQaW4iOwoJCQl9CgkJCS8qIERJ
QUxPR19DT0RFIGlzIGNvbm5lY3RlZCB0byBTU1AyICovCgkJCWVsc2UgaWYgKCFzdHJjbXAoYnJv
eHRvbl9kYWlzW2ldLmNvZGVjcy0+ZGFpX25hbWUsCgkJCQkJIEJYVF9ESUFMT0dfQ09ERUNfREFJ
KSkgewoJCQkJYnJveHRvbl9kYWlzW2ldLm5hbWUgPSAiU1NQMi1Db2RlYyI7CgkJCQlicm94dG9u
X2RhaXNbaV0uY3B1cy0+ZGFpX25hbWUgPSAiU1NQMiBQaW4iOwoJCQl9CgkJfQoJfQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
