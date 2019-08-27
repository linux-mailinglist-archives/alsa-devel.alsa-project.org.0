Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD89EA9C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:14:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D9C1668;
	Tue, 27 Aug 2019 16:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D9C1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566915286;
	bh=axJe81QDAuuasvN7ZwrTZqxRdvnTylAPhV6bl/5jznc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=me/E/iVnS1zbVId9lb/ZF2raS9q4MWMn2vvM8YZk239Bi12tRjlHY7m5u/IB9EY6M
	 CUjrxYGkKyw3SdOAJyzA4QeBAJfxbUJ6NTCm/xHtj/m6uP86kIFUU1Tn0O5e5VIf2A
	 pCAFWFIw0+ni89y5hx7PLi1N5TzwMm/1HMRMcBi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88C9CF802BE;
	Tue, 27 Aug 2019 16:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9E23F802A0; Tue, 27 Aug 2019 16:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EA63F800E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:12:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EA63F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="264282374"
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Aug 2019 07:12:48 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 27 Aug 2019 16:17:06 +0200
Message-Id: <20190827141712.21015-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/6] Small fixes
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

U2VyaWVzIG9mIHNtYWxsIGZpeGVzOgoqIGZpeGVzIGZldyBpc3N1ZXMgZm91bmQgZHVyaW5nIGNo
ZWNraW5nIGNvZGUgd2l0aCBzdGF0aWMgY2hlY2tlcnMKKiBmaXggZmV3IHByaW50cwoqIGRlZmlu
ZSBmdW5jdGlvbiBpbiBoZWFkZXIsIGxpa2UgaXQgc2hvdWxkIGJlCiogcmVsZWFzZSB0b3BvbG9n
eSB3aGVuIGRvbmUgd2l0aCBpdAoKQW1hZGV1c3ogU8WCYXdpxYRza2kgKDYpOgogIEFTb0M6IElu
dGVsOiBTa3lsYWtlOiBVc2UgY29ycmVjdCBmdW5jdGlvbiB0byBhY2Nlc3MgaW9tZW0gc3BhY2UK
ICBBU29DOiBJbnRlbDogRml4IHVzZSBvZiBwb3RlbnRpYWxseSB1bmluaXRpYWxpemVkIHZhcmlh
YmxlCiAgQVNvQzogZGFwbTogRXhwb3NlIHNuZF9zb2NfZGFwbV9uZXdfY29udHJvbF91bmxvY2tl
ZCBwcm9wZXJseQogIEFTb0M6IEludGVsOiBTa3lsYWtlOiBQcmludCBtb2R1bGUgdHlwZSBpbnN0
ZWFkIG9mIGlkCiAgQVNvQzogSW50ZWw6IFNreWxha2U6IFJlbGVhc2UgdG9wb2xvZ3kgd2hlbiB3
ZSBhcmUgZG9uZSB3aXRoIGl0CiAgQVNvQzogSW50ZWw6IE5ITFQ6IEZpeCBkZWJ1ZyBwcmludCBm
b3JtYXQKCiBpbmNsdWRlL3NvdW5kL3NvYy1kYXBtLmggICAgICAgICAgICAgICB8ICAzICsrKwog
c291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtaXBjLmMgICAgICAgfCAgMiArKwogc291bmQvc29j
L2ludGVsL3NreWxha2Uvc2tsLWRlYnVnLmMgICAgfCAgMiArLQogc291bmQvc29jL2ludGVsL3Nr
eWxha2Uvc2tsLW1lc3NhZ2VzLmMgfCAgNSArKystLQogc291bmQvc29jL2ludGVsL3NreWxha2Uv
c2tsLW5obHQuYyAgICAgfCAgMiArLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9s
b2d5LmMgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQogc291bmQvc29jL2ludGVsL3NreWxha2Uv
c2tsLmggICAgICAgICAgfCAgMSAtCiBzb3VuZC9zb2Mvc29jLXRvcG9sb2d5LmMgICAgICAgICAg
ICAgICB8ICA2IC0tLS0tLQogOCBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyMSBk
ZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
