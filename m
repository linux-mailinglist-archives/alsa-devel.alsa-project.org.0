Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B898569
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 22:19:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EA7586F;
	Wed, 21 Aug 2019 22:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EA7586F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566418763;
	bh=mVz/HZdUwu0p3o7BuQvBjq4EhofuYjwRc5gEVj+2gII=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lGIRpVshfCY2OUNGBdnUYwwkuKRL3ZLdJcaVDt/hKHiQbD/QmlKONYK+k1qkqJ6MU
	 JRAjHThw3rWvxr+xy12hseSkeEkVX6WGPAiMLPiHOyQsmNFYIylIAS7lfvLrfwAnCx
	 zT9pnrqObVmQUJiVLmGIe2u/nKx8UJpliHh4YlgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E316F80306;
	Wed, 21 Aug 2019 22:17:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBA44F80306; Wed, 21 Aug 2019 22:17:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3174CF800BF
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 22:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3174CF800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 13:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="186344083"
Received: from smasango-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.100])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2019 13:17:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 21 Aug 2019 15:17:15 -0500
Message-Id: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 0/5] ASoC: SOF: Intel: SoundWire initial
	integration
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

VGhpcyBSRkMgaXMgdGhlIGNvbXBhbmlvbiBvZiB0aGUgb3RoZXIgUkZDICdzb3VuZHdpcmU6IGlu
dGVsOiBzaW1wbGlmeQpEQUkvUERJIGhhbmRsaW5n4oCLJy4gT3VyIHB1cnBvc2UgYXQgdGhpcyBw
b2ludCBpcyB0byBnYXRoZXIgZmVlZGJhY2sgb24KdGhlIGludGVyZmFjZXMgYmV0d2VlbiB0aGUg
SW50ZWwgU09GIHBhcnRzIGFuZCB0aGUgU291bmRXaXJlIGNvZGUuCgpUaGUgc3VnZ2VzdGVkIHNv
bHV0aW9uIGlzIGEgc2ltcGxlIGluaXQvcmVsZWFzZSBpbnNlcnRlZCBhdApwcm9iZS9yZW1vdmUg
YW5kIHJlc3VtZS9zdXNwZW5kLCBhcyB3ZWxsIGFzIHR3byBjYWxsYmFja3MgZm9yIHRoZSBTT0YK
ZHJpdmVyIHRvIGdlbmVyYXRlIElQQyBjb25maWd1cmF0aW9ucyB3aXRoIHRoZSBmaXJtd2FyZS4g
VGhhdCBsZXZlbCBvZgpzZXBhcmF0aW9uIGNvbXBsZXRlbHkgaGlkZXMgdGhlIGRldGFpbHMgb2Yg
dGhlIFNvdW5kV2lyZSBEQUlzIGFuZCB3aWxsCmFsbG93IGZvciAndHJhbnNwYXJlbnQnIG11bHRp
LWNwdSBEQUkgc3VwcG9ydCwgd2hpY2ggd2lsbCBiZSBoYW5kbGVkCmluIHRoZSBtYWNoaW5lIGRy
aXZlciBhbmQgdGhlIHNvdW5kd2lyZSBEQUlzLgoKVGhpcyBzb2x1dGlvbiB3YXMgdGVzdGVkIG9u
IEljZUxha2UgYW5kIENvbWV0TGFrZSwgYW5kIGNhcHR1cmVzIHRoZQpmZWVkYmFjayBmcm9tIFNP
RiBjb250cmlidXRvcnMgb24gYW4gaW5pdGlhbCBpbnRlZ3JhdGlvbiB0aGF0IHdhcwpkZWVtZWQg
dG9vIGNvbXBsaWNhdGVkIChhbmQgcmlnaHRseSBzbykuCgpQaWVycmUtTG91aXMgQm9zc2FydCAo
NSk6CiAgQVNvQzogU09GOiBJUEM6IGRhaS1pbnRlbDogbW92ZSBBTEggZGVjbGFyYXRpb25zIGlu
IGhlYWRlciBmaWxlCiAgQVNvQzogU09GOiBJbnRlbDogaGRhOiBhZGQgaGVscGVyIHRvIGluaXRp
YWxpemUgU291bmRXaXJlIElQCiAgQVNvQzogU09GOiBJbnRlbDogaGRhOiBhZGQgU291bmRXaXJl
IElQIHN1cHBvcnQKICBBU29DOiBTT0Y6IEludGVsOiBoZGE6IGFkZCBTb3VuZFdpcmUgc3RyZWFt
IGNvbmZpZy9mcmVlIGNhbGxiYWNrcwogIEFTb0M6IFNPRjogSW50ZWw6IGFkZCBzdXBwb3J0IGZv
ciBTb3VuZFdpcmUgc3VzcGVuZC9yZXN1bWUKCiBpbmNsdWRlL3NvdW5kL3NvZi9kYWktaW50ZWwu
aCB8ICAxOCArKy0tCiBzb3VuZC9zb2Mvc29mL2ludGVsL2hkYS1kc3AuYyB8ICAxMSArKysKIHNv
dW5kL3NvYy9zb2YvaW50ZWwvaGRhLmMgICAgIHwgMTU3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIHNvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLmggICAgIHwgIDExICsrKwogNCBm
aWxlcyBjaGFuZ2VkLCAxODggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCgpiYXNlLWNv
bW1pdDogM2IzYWFhMDE3ZTgwNzJiMWJmZGRkYTkyYmUyOTZiMzQ2M2Q4NzBiZQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
