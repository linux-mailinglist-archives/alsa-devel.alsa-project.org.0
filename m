Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 548CA71AFE
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 17:01:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D976A18CC;
	Tue, 23 Jul 2019 17:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D976A18CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563894104;
	bh=NPc/WJas6dAaXlHKg6SwYzWPfgjF/Ai0tYstyKVVJqQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JosYo+gRAUFfgHtEhwIUTZLiGXhLLluSdCZY6Ev9DYNb7zvRxrVGiCI3okyqWRGDv
	 SZPUjrOIG9dfNdTtizTIegIA/Li4Jdg/1azyn4bSKLCAvqrkUeMB6R3NGaHlH88KLR
	 vGVpXKTGWXB4y4pbEjhsGthlXPgTSg/eybsERL50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4964AF8048F;
	Tue, 23 Jul 2019 16:59:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6EC9F80482; Tue, 23 Jul 2019 16:59:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7288F8011C
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 16:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7288F8011C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 07:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="171977203"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 23 Jul 2019 07:59:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 23 Jul 2019 16:58:49 +0200
Message-Id: <20190723145854.8527-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723145854.8527-1-cezary.rojewski@intel.com>
References: <20190723145854.8527-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@intel.com>
Subject: [alsa-devel] [RESEND PATCH v2 2/7] ASoC: Intel: Skylake: Combine
	snd_soc_skl_ipc and snd_soc_skl
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

RnJvbTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAaW50ZWwuY29t
PgoKQXMgYm90aCBtb2R1bGVzIGFyZSBjb3JlIHBhcnQgb2YgU2t5bGFrZSBkcml2ZXIgYW5kIG5v
bmUgY2FuIGxpdmUKd2l0aG91dCB0aGUgb3RoZXIsIGNvbWJpbmUgc25kX3NvY19za2xfaXBjIGFu
ZCBzbmRfc29jX3NrbC4KCkl0J3MgaGlnaGx5IHByb2JhYmxlIElQQyBtb2R1bGUgd2FzIHRvIGJl
IHRyZWF0ZWQgYXMgYW4gaW50ZXJmYWNlIGZvcgpwbGF0Zm9ybSBzcGVjaWZpYyBjb2RlIGltcGxl
bWVudGF0aW9ucyBlLmcuOiBwb3NzaWJpbGl0eSBvZiBleGlzdGVuY2Ugb2YKQlhUIHNwZWNpZmlj
IGNvZGUgd2l0aG91dCBTS0wgb25lLiBIb3dldmVyLCBtb3N0IGZ1bnRpb25hbGl0aWVzIGFyZQpi
ZWluZyBpbmhlcml0ZWQgZnJvbSBvbmUgRFNQIGZpcm13YXJlIHRvIGFub3RoZXIsIGFuZCB0aHVz
IHRoaXMKYXNzdW1wdGlvbiBmYWlscy4KCnNrbC1zc3QsIGJ4dC1zc3QgYW5kIGNubC1zc3QgYXJl
IG5vdCBpbmRpdmlkdWFscyBwb2ludGluZyByZXNwZWN0aXZlbHkKdG8gU0tMIChjQVZTIDEuNSks
IEJYVCAoY0FWUyAxLjUrKSAmIENOTCAoY0FWUyAxLjgpIHN0YW5kYWxvbmUKaW1wbGVtZW50YXRp
b25zLiBDb2RlIGZvdW5kIHdpdGhpbiB0aGVzZSBpcyBzaGFyZWQgYW1vbmcgYWxsIHBsYXRmb3Jt
cwp3aGVuZXZlciBuZWNlc3NhcnkgdG8gYXZvaWQgY29kZSBkdXBsaWNhdGlvbiBhbmQgcmVkdWNl
IGRldmVsb3BtZW50CmJ1cmRlbi4KCk1lcmdlIGFsc28gaGVscHMgaW4gY2xlYW5pbmcgdXAgaW50
ZXJuYWwgY29kZSBpbiBmdXR1cmUgY2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPF
gmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTog
Q2V6YXJ5IFJvamV3c2tpIDxjZXphcnkucm9qZXdza2lAaW50ZWwuY29tPgotLS0KIHNvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL01ha2VmaWxlIHwgMTIgKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL01ha2VmaWxlIGIvc291bmQvc29jL2ludGVsL3NreWxha2UvTWFrZWZp
bGUKaW5kZXggODZmNmUxZDgwMWFmLi40ODU0NGZmMWEzZTYgMTAwNjQ0Ci0tLSBhL3NvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL01ha2VmaWxlCisrKyBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL01h
a2VmaWxlCkBAIC0xLDYgKzEsNyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAotc25kLXNvYy1za2wtb2JqcyA6PSBza2wubyBza2wtcGNtLm8gc2tsLW5obHQubyBza2wtbWVz
c2FnZXMubyBcCi1za2wtdG9wb2xvZ3kubworc25kLXNvYy1za2wtb2JqcyA6PSBza2wubyBza2wt
cGNtLm8gc2tsLW5obHQubyBza2wtbWVzc2FnZXMubyBza2wtdG9wb2xvZ3kubyBcCisJCXNrbC1z
c3QtaXBjLm8gc2tsLXNzdC1kc3AubyBjbmwtc3N0LWRzcC5vIHNrbC1zc3QtY2xkbWEubyBcCisJ
CXNrbC1zc3QubyBieHQtc3N0Lm8gY25sLXNzdC5vIHNrbC1zc3QtdXRpbHMubwogCiBpZmRlZiBD
T05GSUdfREVCVUdfRlMKICAgc25kLXNvYy1za2wtb2JqcyArPSBza2wtZGVidWcubwpAQCAtOCwx
MyArOSw2IEBAIGVuZGlmCiAKIG9iai0kKENPTkZJR19TTkRfU09DX0lOVEVMX1NLWUxBS0UpICs9
IHNuZC1zb2Mtc2tsLm8KIAotIyBTa3lsYWtlIElQQyBTdXBwb3J0Ci1zbmQtc29jLXNrbC1pcGMt
b2JqcyA6PSBza2wtc3N0LWlwYy5vIHNrbC1zc3QtZHNwLm8gY25sLXNzdC1kc3AubyBcCi0JCXNr
bC1zc3QtY2xkbWEubyBza2wtc3N0Lm8gYnh0LXNzdC5vIGNubC1zc3QubyBcCi0JCXNrbC1zc3Qt
dXRpbHMubwotCi1vYmotJChDT05GSUdfU05EX1NPQ19JTlRFTF9TS1lMQUtFKSArPSBzbmQtc29j
LXNrbC1pcGMubwotCiAjU2t5bGFrZSBDbG9jayBkZXZpY2Ugc3VwcG9ydAogc25kLXNvYy1za2wt
c3NwLWNsay1vYmpzIDo9IHNrbC1zc3AtY2xrLm8KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
