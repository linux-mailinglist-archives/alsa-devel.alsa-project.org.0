Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF526822
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:23:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF22B1664;
	Wed, 22 May 2019 18:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF22B1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558542224;
	bh=o0w8zIEIJZS2LC4c79wc0gfZ1kAhfIl7kch/SG1Gp1U=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QxLOS1Knq97IN4/Vo/LSZkRLFIxkyDx8ZNJJ3C9LoQGQJ3pxeuYARSkxawge40Io8
	 NRAidaen/2FERz4p13jEIx2Ity/0tbw92Jw6qzajLA/0uz8PzN26mG/wbV0L/Nji9p
	 Kgnly+JSZzF0pY4cchl6GOFCW1QqZKTCsAVXh/9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7F49F8962C;
	Wed, 22 May 2019 18:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BED0F89625; Wed, 22 May 2019 18:21:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2E40F8079B
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E40F8079B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 09:21:49 -0700
X-ExtLoop1: 1
Received: from avcaesar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.140.52])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2019 09:21:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 11:21:30 -0500
Message-Id: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 00/12] ASoC: SOF: stability fixes
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

Tm8gbmV3IGZ1bmN0aW9uYWxpdHkgaGVyZSBidXQgZml4ZXMgdG8gdGhlIElQQywgbWVtb3J5IGFs
bG9jYXRpb24sCndvcmtxdWV1ZXMsIGNvbnRyb2wsIHJ1bnRpbWVfcG0gYW5kIEhEYXVkaW8gc3Vw
cG9ydC4gVGhlc2UgaXNzdWVzIHdlcmUKaWRlbnRpZmllZCBkdXJpbmcgdGhlIGludGVncmF0aW9u
L3Byb2R1Y3RpemF0aW9uIG9mIG5ldyBwbGF0Zm9ybXMuCgpJIGFkZGVkIGEgJ0ZpeGVzJyB0YWcg
dG8gbWFrZSBzdXJlIGJhY2twb3J0cy9zdGFibGUgY2FuIHBpY2sgdXAgdGhlc2UKcGF0Y2hlcywg
aW4gY2FzZSBpdCdzIHRvbyBsYXRlIGZvciB0aGVtIHRvIGxhbmQgaW4gNS4yCgpUaGUgbmV4dCBi
YXRjaCBmb3IgU09GIHdpbGwgYmUgYSBzZXQgb2YgbmV3IGNhcGFiaWxpdGllcyBmb3IgdHJhY2Us
CklQQyB0ZXN0LCBIZGF1ZGlvIHN1cHBvcnQsIHRoZXkgd2lsbCBiZSBzdWJtaXR0ZWQgYWZ0ZXIg
YWRkaXRpb25hbAp0ZXN0cyBhbmQgb25jZSB0aGVzZSBmaXhlcyBhcmUgcmV2aWV3ZWQvbWVyZ2Vk
LgoKVGhhbmtzIQoKQ2hhbmdlcyBzaW5jZSB2MToKRmVlZGJhY2sgZnJvbSBUYWthc2hpOiB1c2Ug
c3Bpbl9sb2NrX2lycSBpbnN0ZWFkIG9mIHNwaW5fbG9ja19pcnFfc2F2ZQpBZGRlZCBUYWthc2hp
J3MgUmV2aWV3ZWQtYnkgdGFnCgpBbWFkZXVzeiBTxYJhd2nFhHNraSAoMSk6CiAgQUxTQTogaGRh
YzogZml4IG1lbW9yeSByZWxlYXNlIGZvciBTU1QgYW5kIFNPRiBkcml2ZXJzCgpHdWVubmFkaSBM
aWFraG92ZXRza2kgKDEpOgogIEFTb0M6IFNPRjogaXBjOiBmaXggYSByYWNlLCBsZWFkaW5nIHRv
IElQQyB0aW1lb3V0cwoKS2V5b24gSmllICgxKToKICBBU29DOiBTT0Y6IGNvbnRyb2w6IGNvcnJl
Y3QgdGhlIGNvcHkgc2l6ZSBmb3IgYnl0ZXMga2NvbnRyb2wgcHV0CgpMaWJpbiBZYW5nICgyKToK
ICBBU29DOiBTT0Y6IHBjbTogY2xlYXIgaHdfcGFyYW1zX3Vwb25fcmVzdW1lIGZsYWcgY29ycmVj
dGx5CiAgQVNvQzogU09GOiBJbnRlbDogaGRhLWNvZGVjOiBmaXggbWVtb3J5IGFsbG9jYXRpb24K
ClBpZXJyZS1Mb3VpcyBCb3NzYXJ0ICgyKToKICBBU29DOiBTT0Y6IGNvcmU6IGZpeCBlcnJvciBo
YW5kbGluZyB3aXRoIHRoZSBwcm9iZSB3b3JrcXVldWUKICBBU29DOiBTT0Y6IHBjbTogcmVtb3Zl
IHdhcm5pbmcgLSBpbml0aWFsaXplIHdvcmtxdWV1ZSBvbiBvcGVuCgpSYW5qYW5pIFNyaWRoYXJh
biAoMyk6CiAgQVNvQzogU09GOiBjb3JlOiByZW1vdmUgRFNQIGFmdGVyIHVucmVnaXN0ZXJpbmcg
bWFjaGluZSBkcml2ZXIKICBBU29DOiBTT0Y6IGNvcmU6IHJlbW92ZSBzbmRfc29jX3VucmVnaXN0
ZXJfY29tcG9uZW50IGluIGNhc2Ugb2YgZXJyb3IKICBBU29DOiBTT0Y6IHBjbTogcmVtb3ZlIHJ1
bnRpbWUgUE0gY2FsbHMgZHVyaW5nIHBjbSBvcGVuL2Nsb3NlCgpaaHUgWWluZ2ppYW5nICgyKToK
ICBBU29DOiBTT0Y6IEludGVsOiBoZGE6IGZpeCB0aGUgaGRhIGluaXQgY2hpcAogIEFTb0M6IFNP
RjogSW50ZWw6IGhkYTogdXNlIHRoZSBkZWZpbmVkIHBwY2FwIGZ1bmN0aW9ucwoKIHNvdW5kL2hk
YS9leHQvaGRhY19leHRfYnVzLmMgICAgfCAgIDEgLQogc291bmQvc29jL3NvZi9jb250cm9sLmMg
ICAgICAgICB8ICAgOSArLS0KIHNvdW5kL3NvYy9zb2YvY29yZS5jICAgICAgICAgICAgfCAgMjkg
KysrKysrKy0tCiBzb3VuZC9zb2Mvc29mL2ludGVsL2Jkdy5jICAgICAgIHwgIDEwICstLQogc291
bmQvc29jL3NvZi9pbnRlbC9ieXQuYyAgICAgICB8ICAxMSArKy0tCiBzb3VuZC9zb2Mvc29mL2lu
dGVsL2NubC5jICAgICAgIHwgICA1ICsrCiBzb3VuZC9zb2Mvc29mL2ludGVsL2hkYS1jb2RlYy5j
IHwgICA2ICstCiBzb3VuZC9zb2Mvc29mL2ludGVsL2hkYS1jdHJsLmMgIHwgMTAyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLQogc291bmQvc29jL3NvZi9pbnRlbC9oZGEtaXBjLmMgICB8
ICAxOCArKysrKy0KIHNvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLmMgICAgICAgfCAxMDkgKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHNvdW5kL3NvYy9zb2YvaXBjLmMgICAgICAgICAg
ICAgfCAgMTMgLS0tLQogc291bmQvc29jL3NvZi9wY20uYyAgICAgICAgICAgICB8ICAzNyArKy0t
LS0tLS0tLQogMTIgZmlsZXMgY2hhbmdlZCwgMTg0IGluc2VydGlvbnMoKyksIDE2NiBkZWxldGlv
bnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
