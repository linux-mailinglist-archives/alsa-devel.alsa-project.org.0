Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5991D9EAAD
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0E31676;
	Tue, 27 Aug 2019 16:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0E31676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566915438;
	bh=/yJI5qlgwflRSbG46qBXMnlXoQFJgi7P7ZyZlhqiFc4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TUd8IiPKOoLdi7FKX6xnwra61PzcjZGbNZR1jTMKxcGXSvcCNGillS9ht7ec8CPdh
	 uCkF0bYgk1qHW8/CqCtfs3mQNMgb4VPqqJ4TaHKkaa634qgU7Uv9dNcyOquKYqQwcV
	 dLywZ2VWxcYfYOK0RsQmQRZyDdGOGznHf21OadGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6DB2F805FE;
	Tue, 27 Aug 2019 16:13:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49BD5F805F5; Tue, 27 Aug 2019 16:13:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0C84F802A0
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C84F802A0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="264282459"
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Aug 2019 07:13:00 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 27 Aug 2019 16:17:10 +0200
Message-Id: <20190827141712.21015-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827141712.21015-1-amadeuszx.slawinski@linux.intel.com>
References: <20190827141712.21015-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@intel.com>
Subject: [alsa-devel] [PATCH 4/6] ASoC: Intel: Skylake: Print module type
	instead of id
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
PgoKV2hlbiB3ZSBhcmUgcHJpbnRpbmcgbW9kdWxlIHBhcmFtcywgd2Ugd2VyZSBhY3R1YWxseSBw
cmludGluZyBtb2R1bGUgaWQKaW5zdGVhZCBvZiB0eXBlLCBidXQgZGVidWcgbWVzc2FnZSB3YXMg
c2F5aW5nIHRoYXQgbnVtYmVyIHdlIGdldCBpcyB0eXBlLgpTbyBwcmludCBtb2R1bGUgdHlwZSwg
YXMgaXQgaXMgdXNlZnVsIHdoZW4gZGVidWdnaW5nIHBhdGhzLCBidXQgYWxzbwprZWVwIHByaW50
aW5nIG1vZHVsZSBpZCwgYXMgaXQgaXMgdXNlZCBpbiBhbGwgb3RoZXIgbG9ncy4KClNpZ25lZC1v
ZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGludGVsLmNv
bT4KLS0tCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtbWVzc2FnZXMuYyB8IDUgKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLW1lc3NhZ2VzLmMgYi9zb3VuZC9zb2Mv
aW50ZWwvc2t5bGFrZS9za2wtbWVzc2FnZXMuYwppbmRleCBkNDM0OTZjNWYyOWUuLjQ3NmVmMTg5
Nzk2MSAxMDA2NDQKLS0tIGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLW1lc3NhZ2VzLmMK
KysrIGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLW1lc3NhZ2VzLmMKQEAgLTg2Nyw4ICs4
NjcsOSBAQCBzdGF0aWMgaW50IHNrbF9zZXRfbW9kdWxlX2Zvcm1hdChzdHJ1Y3Qgc2tsX2RldiAq
c2tsLAogCiAJfQogCi0JZGV2X2RiZyhza2wtPmRldiwgIk1vZHVsZSB0eXBlPSVkIGNvbmZpZyBz
aXplOiAlZCBieXRlc1xuIiwKLQkJCW1vZHVsZV9jb25maWctPmlkLm1vZHVsZV9pZCwgcGFyYW1f
c2l6ZSk7CisJZGV2X2RiZyhza2wtPmRldiwgIk1vZHVsZSB0eXBlPSVkIGlkPSVkIGNvbmZpZyBz
aXplOiAlZCBieXRlc1xuIiwKKwkJCW1vZHVsZV9jb25maWctPm1fdHlwZSwgbW9kdWxlX2NvbmZp
Zy0+aWQubW9kdWxlX2lkLAorCQkJcGFyYW1fc2l6ZSk7CiAJcHJpbnRfaGV4X2R1bXBfZGVidWco
Ik1vZHVsZSBwYXJhbXM6IiwgRFVNUF9QUkVGSVhfT0ZGU0VULCA4LCA0LAogCQkJKnBhcmFtX2Rh
dGEsIHBhcmFtX3NpemUsIGZhbHNlKTsKIAlyZXR1cm4gMDsKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
