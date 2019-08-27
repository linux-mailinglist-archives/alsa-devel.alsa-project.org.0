Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A79EAB8
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:18:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D07B81669;
	Tue, 27 Aug 2019 16:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D07B81669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566915535;
	bh=Sj/MwfDj+UFQJzQUDdZKJhnJcSESr58vWDXpCgrA+lk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9/RyaYH2NgY+fp8C7xbaMUrWFGYNMoBDetVf/swlxqcfQ7KkLFqHfhqr9KptjfWM
	 uOvItc8NEyH+JJUZAaKQJLITciQw6Z2nF3WyuYxJFtlHkUk96dB1jNlrhpY8PlYKOV
	 273KbfH4r7v/HOvjGnqzl/c+MMT3TPpWn/7f6HWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72BD5F80637;
	Tue, 27 Aug 2019 16:13:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E6E8F805FE; Tue, 27 Aug 2019 16:13:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04520F802A0
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04520F802A0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="264282517"
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Aug 2019 07:13:05 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 27 Aug 2019 16:17:12 +0200
Message-Id: <20190827141712.21015-7-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH 6/6] ASoC: Intel: NHLT: Fix debug print format
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
PgoKb2VtX3RhYmxlX2lkIGlzIDggY2hhcnMgbG9uZywgc28gd2UgbmVlZCB0byBsaW1pdCBpdCwg
b3RoZXJ3aXNlIGl0Cm1heSBwcmludCBzb21lIHVucHJpbnRhYmxlIGNoYXJhY3RlcnMgaW50byBk
bWVzZy4KClNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xh
d2luc2tpQGludGVsLmNvbT4KLS0tCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtbmhsdC5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLW5obHQuYyBiL3NvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC1uaGx0LmMKaW5kZXggYWIzZDIzYzdiZDY1Li4xOWYzMjhkNzFm
MjQgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1uaGx0LmMKKysrIGIv
c291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLW5obHQuYwpAQCAtMTM2LDcgKzEzNiw3IEBAIGlu
dCBza2xfbmhsdF91cGRhdGVfdG9wb2xvZ3lfYmluKHN0cnVjdCBza2xfZGV2ICpza2wpCiAJc3Ry
dWN0IGhkYWNfYnVzICpidXMgPSBza2xfdG9fYnVzKHNrbCk7CiAJc3RydWN0IGRldmljZSAqZGV2
ID0gYnVzLT5kZXY7CiAKLQlkZXZfZGJnKGRldiwgIm9lbV9pZCAlLjZzLCBvZW1fdGFibGVfaWQg
JThzIG9lbV9yZXZpc2lvbiAlZFxuIiwKKwlkZXZfZGJnKGRldiwgIm9lbV9pZCAlLjZzLCBvZW1f
dGFibGVfaWQgJS44cyBvZW1fcmV2aXNpb24gJWRcbiIsCiAJCW5obHQtPmhlYWRlci5vZW1faWQs
IG5obHQtPmhlYWRlci5vZW1fdGFibGVfaWQsCiAJCW5obHQtPmhlYWRlci5vZW1fcmV2aXNpb24p
OwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
