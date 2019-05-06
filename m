Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840041538F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 20:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E20DB18E0;
	Mon,  6 May 2019 20:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E20DB18E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557167046;
	bh=kbbzlcaJwsHsLNH+oKrI9Nah9z2QeucD2ARP3uVW72c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3XgCgRQkJaalEW/q6j+pdNrdLJbUElNXIW1hcZcTkHHrD3JJpvjwTKAZf7QeAaiP
	 /f46vjixp69Dg+gp3pwD5h21o2gpu3eKxrh4jZctxGnz+UN5w9QbUDdkOLgBjnifuy
	 LjiXRNfAQYDbjLsP7QSbjmlCJUf2Rpv8deCJnd9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF293F896FF;
	Mon,  6 May 2019 20:22:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B56B5F896F0; Mon,  6 May 2019 20:22:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69A95F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 20:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69A95F80C07
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 11:22:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,439,1549958400"; d="scan'208";a="344092198"
Received: from hmthomax-mobl.amr.corp.intel.com ([10.251.153.192])
 by fmsmga005.fm.intel.com with ESMTP; 06 May 2019 11:21:57 -0700
Message-ID: <b8f759f63a64b7e9ea21ae8b659a5e1d5ff294df.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Date: Mon, 06 May 2019 11:21:57 -0700
In-Reply-To: <20190506150224.1394-3-tiwai@suse.de>
References: <20190506150224.1394-1-tiwai@suse.de>
 <20190506150224.1394-3-tiwai@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: SOF: Fix a compile warning with
 CONFIG_PCI=n
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

T24gTW9uLCAyMDE5LTA1LTA2IGF0IDE3OjAyICswMjAwLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4g
QSB0cml2aWFsIGZpeCBmb3IgdGhlIHJhbmRjb25maWcgYnVpbGQgZXJyb3I6Cj4gICBzb3VuZC9z
b2Mvc29mL29wcy5jOjIwOjY6IHdhcm5pbmc6IOKAmHJldOKAmSBpcyB1c2VkIHVuaW5pdGlhbGl6
ZWQgaW4KPiB0aGlzIGZ1bmN0aW9uIFstV3VuaW5pdGlhbGl6ZWRdCkxvb2tzIGdvb2QuIFRoYW5r
cywgVGFrYXNoaS4KClJhbmphbmkKPiAKPiBGaXhlczogZDFkOTVmY2I2M2UzICgiQVNvQzogU09G
OiBBZGQgRFNQIEhXIGFic3RyYWN0aW9uIG9wZXJhdGlvbnMiKQo+IFNpZ25lZC1vZmYtYnk6IFRh
a2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4KPiAtLS0KPiAgc291bmQvc29jL3NvZi9vcHMuYyB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2Yvb3BzLmMgYi9zb3VuZC9zb2Mvc29mL29wcy5j
Cj4gaW5kZXggODBmOTA3NzQwYjgyLi43YTI3YzNiNzE5ZTcgMTAwNjQ0Cj4gLS0tIGEvc291bmQv
c29jL3NvZi9vcHMuYwo+ICsrKyBiL3NvdW5kL3NvYy9zb2Yvb3BzLmMKPiBAQCAtMTcsNyArMTcs
NyBAQCBib29sIHNuZF9zb2ZfcGNpX3VwZGF0ZV9iaXRzX3VubG9ja2VkKHN0cnVjdAo+IHNuZF9z
b2ZfZGV2ICpzZGV2LCB1MzIgb2Zmc2V0LAo+ICB7Cj4gIAlzdHJ1Y3QgcGNpX2RldiAqcGNpID0g
dG9fcGNpX2RldihzZGV2LT5kZXYpOwo+ICAJdW5zaWduZWQgaW50IG9sZCwgbmV3Owo+IC0JdTMy
IHJldDsKPiArCXUzMiByZXQgPSAwOwo+ICAKPiAgCXBjaV9yZWFkX2NvbmZpZ19kd29yZChwY2ks
IG9mZnNldCwgJnJldCk7Cj4gIAlvbGQgPSByZXQ7CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVs
QGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbHNhLWRldmVsCg==
