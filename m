Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBF010089C
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 16:47:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6EBA166D;
	Mon, 18 Nov 2019 16:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6EBA166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574092079;
	bh=SCfAi9ih1Va0jOOeVg1pjM0WnO0MX1k+jJyzOeQyl6E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sdJXy3IrBeADPJBOxKz3DtRS4SeCy9pysQO0rLJjhS23dc9NUDanSbDib+2ZEpBNh
	 kOW9imWko7x3FlmYo+VZoQg6oS8UqxiLQe1xrJEygsoCeX9qGsGsBL7yqSD+wwBTsr
	 SzYciDWtgKPW7UX56KXrFvbZUBmoC58MUJFbAAdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7735F80146;
	Mon, 18 Nov 2019 16:45:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19D5EF80147; Mon, 18 Nov 2019 16:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA12EF80100
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 16:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA12EF80100
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 07:45:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; d="scan'208";a="289292860"
Received: from nmdeliwa-mobl1.amr.corp.intel.com (HELO [10.251.155.92])
 ([10.251.155.92])
 by orsmga001.jf.intel.com with ESMTP; 18 Nov 2019 07:45:21 -0800
To: kbuild test robot <lkp@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <201911171006.F2M4BSQx%lkp@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0d89e1df-81e7-ce5f-0709-add84ecf6295@linux.intel.com>
Date: Mon, 18 Nov 2019 09:31:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <201911171006.F2M4BSQx%lkp@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@lists.01.org
Subject: Re: [alsa-devel] [asoc:for-5.4 438/441]
 sound/soc/sof/sof-pci-dev.c:136:15: error:
 'snd_soc_acpi_intel_cml_machines' undeclared here (not in a function);
 did you mean 'snd_soc_acpi_intel_cnl_machines'?
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

CgoKT24gMTEvMTYvMTkgODowMiBQTSwga2J1aWxkIHRlc3Qgcm9ib3Qgd3JvdGU6Cj4gdHJlZTog
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmll
L3NvdW5kLmdpdCBmb3ItNS40Cj4gaGVhZDogICBmZTIzYmUyZDg1YjA1ZjU2MTQzMWQ3NWFjZGRl
YzcyNmVhODA3ZDJhCj4gY29tbWl0OiAxMzBkM2U5MDc3N2ZlOTc0ZTRiOGZhMTAwY2VjOGZhZjE5
Y2FjOTk4IFs0MzgvNDQxXSBBU29DOiBTT0Y6IEludGVsOiBGaXggQ0ZMIGFuZCBDTUwgRlcgbm9j
b2RlYyBiaW5hcnkgbmFtZXMuCj4gY29uZmlnOiBpMzg2LXJhbmRjb25maWctYzAwMi0yMDE5MTEx
NyAoYXR0YWNoZWQgYXMgLmNvbmZpZykKPiBjb21waWxlcjogZ2NjLTcgKERlYmlhbiA3LjQuMC0x
NCkgNy40LjAKPiByZXByb2R1Y2U6Cj4gICAgICAgICAgZ2l0IGNoZWNrb3V0IDEzMGQzZTkwNzc3
ZmU5NzRlNGI4ZmExMDBjZWM4ZmFmMTljYWM5OTgKPiAgICAgICAgICAjIHNhdmUgdGhlIGF0dGFj
aGVkIC5jb25maWcgdG8gbGludXggYnVpbGQgdHJlZQo+ICAgICAgICAgIG1ha2UgQVJDSD1pMzg2
Cj4gCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZwo+IFJl
cG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiAKPiBBbGwgZXJy
b3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6Cj4gCj4+PiBzb3VuZC9zb2Mvc29mL3NvZi1w
Y2ktZGV2LmM6MTM2OjE1OiBlcnJvcjogJ3NuZF9zb2NfYWNwaV9pbnRlbF9jbWxfbWFjaGluZXMn
IHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ3NuZF9z
b2NfYWNwaV9pbnRlbF9jbmxfbWFjaGluZXMnPwo+ICAgICAgIC5tYWNoaW5lcyAgPSBzbmRfc29j
X2FjcGlfaW50ZWxfY21sX21hY2hpbmVzLAo+ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICAgICAgICAgICAgICAgICAgIHNuZF9zb2NfYWNwaV9p
bnRlbF9jbmxfbWFjaGluZXMKCkxvb2tzIGxpa2UgdGhlIGZvci01LjQgYnJhbmNoIGRpZCBub3Qg
cGljayB1cCBhbGwgdGhlIHBhdGNoZXMgZnJvbSB0aGUgCnNlcmllcyBbUEFUQ0ggMC8zXSBBU29D
OiBJbnRlbC9TT0Y6IHNwbGl0IENGTCwgQ05MLCBDTUwgZmlybXdhcmUgbmFtZXPigIsKCml0J3Mg
bWlzc2luZzoKW1BBVENIIDEvM10gQVNvQzogSW50ZWw6IGFjcGktbWF0Y2g6IHNwbGl0IENOTCB0
YWJsZXMgaW4gdGhyZWUKW1BBVENIIDMvM10gQVNvQzogU09GOiBJbnRlbDogaGRhOiB1c2UgZmFs
bGJhY2sgZm9yIGZpcm13YXJlIG5hbWUKCgo+IAo+IHZpbSArMTM2IHNvdW5kL3NvYy9zb2Yvc29m
LXBjaS1kZXYuYwo+IAo+ICAgICAxMzEJCj4gICAgIDEzMgkjaWYgSVNfRU5BQkxFRChDT05GSUdf
U05EX1NPQ19TT0ZfQ09NRVRMQUtFX0xQKSB8fCBcCj4gICAgIDEzMwkJSVNfRU5BQkxFRChDT05G
SUdfU05EX1NPQ19TT0ZfQ09NRVRMQUtFX0gpCj4gICAgIDEzNAkKPiAgICAgMTM1CXN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc29mX2Rldl9kZXNjIGNtbF9kZXNjID0gewo+ICAgPiAxMzYJCS5tYWNoaW5l
cwkJPSBzbmRfc29jX2FjcGlfaW50ZWxfY21sX21hY2hpbmVzLAo+ICAgICAxMzcJCS5yZXNpbmRl
eF9scGVfYmFzZQk9IDAsCj4gICAgIDEzOAkJLnJlc2luZGV4X3BjaWNmZ19iYXNlCT0gLTEsCj4g
ICAgIDEzOQkJLnJlc2luZGV4X2ltcl9iYXNlCT0gLTEsCj4gICAgIDE0MAkJLmlycWluZGV4X2hv
c3RfaXBjCT0gLTEsCj4gICAgIDE0MQkJLnJlc2luZGV4X2RtYV9iYXNlCT0gLTEsCj4gICAgIDE0
MgkJLmNoaXBfaW5mbyA9ICZjbmxfY2hpcF9pbmZvLAo+ICAgICAxNDMJCS5kZWZhdWx0X2Z3X3Bh
dGggPSAiaW50ZWwvc29mIiwKPiAgICAgMTQ0CQkuZGVmYXVsdF90cGxnX3BhdGggPSAiaW50ZWwv
c29mLXRwbGciLAo+ICAgICAxNDUJCS5ub2NvZGVjX2Z3X2ZpbGVuYW1lID0gInNvZi1jbWwucmki
LAo+ICAgICAxNDYJCS5ub2NvZGVjX3RwbGdfZmlsZW5hbWUgPSAic29mLWNubC1ub2NvZGVjLnRw
bGciLAo+ICAgICAxNDcJCS5vcHMgPSAmc29mX2NubF9vcHMsCj4gICAgIDE0OAkJLmFyY2hfb3Bz
ID0gJnNvZl94dGVuc2FfYXJjaF9vcHMKPiAgICAgMTQ5CX07Cj4gICAgIDE1MAkjZW5kaWYKPiAg
ICAgMTUxCQo+IAo+IC0tLQo+IDAtREFZIGtlcm5lbCB0ZXN0IGluZnJhc3RydWN0dXJlICAgICAg
ICAgICAgICAgICBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlcgo+IGh0dHBzOi8vbGlzdHMu
MDEub3JnL2h5cGVya2l0dHkvbGlzdC9rYnVpbGQtYWxsQGxpc3RzLjAxLm9yZyBJbnRlbCBDb3Jw
b3JhdGlvbgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
