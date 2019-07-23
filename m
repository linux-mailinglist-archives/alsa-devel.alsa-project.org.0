Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A871AFB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 17:01:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F45918BD;
	Tue, 23 Jul 2019 17:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F45918BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563894060;
	bh=KilHmIBA+dWbW68C65sDb0Tcv/9jEQSF+qDNCuI2zI4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kZJjXXgAtirbSAgDilh9wVA3el5cX9qrkfdu8trg5bP0/sQ8GB5vRfr5SdCTQloU2
	 GlXS4rxP5sKA+UBaDV06Qd6PFY+Lv6262x7/1+INg0qfmOyqTexBUTrap+Puh9nlqI
	 znty9BeEI2PsUEGwWbHuzVzOQ4fIMUySZetU3yMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A45E6F80448;
	Tue, 23 Jul 2019 16:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D902F80447; Tue, 23 Jul 2019 16:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E39E1F800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 16:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E39E1F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 07:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="171977180"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 23 Jul 2019 07:59:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 23 Jul 2019 16:58:47 +0200
Message-Id: <20190723145854.8527-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [RESEND PATCH v2 0/7] ASoC: Intel: Skylake: Driver
	fundaments overhaul
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

U2t5bGFrZSBkcml2ZXIgaXMgZGl2aWRlZCBpbnRvIHR3byBtb2R1bGVzOgotIHNuZF9zb2Nfc2ts
Ci0gc25kX3NvY19za2xfaXBjCgphbmQgbm90aGluZyB3b3VsZCBiZSB3cm9uZyBpZiBub3QgZm9y
IHRoZSBmYWN0IHRoYXQgYm90aCBjYW5ub3QgZXhpc3QKd2l0aG91dCBvbmUgYW5vdGhlci4gSVBD
IG1vZHVsZSBpcyBub3Qgc29tZSBraW5kIG9mIGV4dGVuc2lvbiwgYXMgaXQgaXMKdGhlIGNhc2Ug
Zm9yIHNuZF9oZGFfZXh0X2NvcmUgd2hpY2ggaXMgc2VwYXJhdGVkIGZyb20gc25kX2hkYV9jb3Jl
IC0KbGVnYWN5IGhkYSBpbnRlcmZhY2UuIEl0J3MgYXMgbXVjaCBjb3JlIFNreWxha2UgbW9kdWxl
IGFzIHNuZF9zb2Nfc2tsCmlzLgoKU3RhdGVtZW50IGJhY2t1cCBieSBleGlzdGVuY2Ugb2YgY2ly
Y3VsYXIgZGVwZW5kZW5jeSBiZXR3ZWVuIHRoaXMgdHdvLgpUbyBlbGltaW5hdGUgc2FpZCBwcm9i
bGVtLCBzdHJ1Y3Qgc2tsX3NzdCBoYXMgYmVlbiBjcmVhdGVkLiBGcm9tIHRoYXQKbW9tbWVudCwg
U2t5bGFrZSBoYXMgYmVlbiBwbGFndWVkIGJ5IGhlYWRlciBlcnJvcnMgKGluY29tcGxldGUgc3R1
cmN0cywKdW5rbm93biByZWZlcmVuY2VzIGV0Yy4pIHdoZW5ldmVyIHNvbWV0aGluZyBuZXcgaXMg
dG8gYmUgYWRkZWQgb3IgY29kZQppcyBjbGVhbmVkIHVwLgoKRml4IHRoaXMgZmxhd2VkIGRlc2ln
biBieSBtZXJnaW5nIHNuZF9zb2Nfc2tsIGFuZCBzbmRfc29jX3NrbF9pcGMuCkFsc28sIGRvIG5v
dCBmb3JnZXQgYWJvdXQgc3RydWN0IHNrbF9zc3QgcmVkdW5kYW5jeS4KRm9sbG93dXAgY2hhbmdl
cyBhZGRyZXNzIGhhcm1mdWwgYXNzdW1wdGlvbnMgYW5kIGZhbHNlIGxvZ2ljIHdoaWNoCmRyaXZl
ciBjdXJyZW50bHkgaW1wbGVtZW50cyBlLmcuOiBhdHRlbXB0IHRvIHRha2Ugcm9sZSBvZiBtYXN0
ZXIgZm9yCkRTUCBzY2hlZHVsaW5nIHdoZW4gaW4gZmFjdCBlbnRpcmUgY29udHJvbCB0YWtlcyBw
bGFjZSBpbiBEU1AuCgpDaGFuZ2VzIHNpbmNlIHYxOgotIFJlYmFzZWQgb250byA1LjQKCkFtYWRl
dXN6IFPFgmF3acWEc2tpICgyKToKICBBU29DOiBJbnRlbDogU2t5bGFrZTogQ29tYmluZSBzbmRf
c29jX3NrbF9pcGMgYW5kIHNuZF9zb2Nfc2tsCiAgQVNvQzogSW50ZWw6IFNreWxha2U6IERvIG5v
dCBkaXNhYmxlIEZXIG5vdGlmaWNhdGlvbnMKCkNlemFyeSBSb2pld3NraSAoNSk6CiAgQVNvQzog
SW50ZWw6IFNreWxha2U6IE1lcmdlIHNrbF9zc3QgYW5kIHNrbCBpbnRvIHNrbF9kZXYgc3RydWN0
CiAgQVNvQzogSW50ZWw6IFNreWxha2U6IFJlbW92ZSBNQ1BTIGF2YWlsYWJsZSBjaGVjawogIEFT
b0M6IEludGVsOiBTa3lsYWtlOiBSZW1vdmUgbWVtb3J5IGF2YWlsYWJsZSBjaGVjawogIEFTb0M6
IEludGVsOiBTa3lsYWtlOiBNYWtlIE1DUFMgYW5kIENQUyBwYXJhbXMgb2Jzb2xldGUKICBBU29D
OiBJbnRlbDogU2t5bGFrZTogQ2xlYW51cCBza2xfbW9kdWxlX2NmZyBkZWNsYXJhdGlvbgoKIHNv
dW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWlwYy5oICAgICAgICB8ICAgMSArCiBzb3VuZC9zb2Mv
aW50ZWwvc2t5bGFrZS9NYWtlZmlsZSAgICAgICAgfCAgMTIgKy0KIHNvdW5kL3NvYy9pbnRlbC9z
a3lsYWtlL2J4dC1zc3QuYyAgICAgICB8ICA1MCArLS0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtl
L2NubC1zc3QtZHNwLmggICB8ICAgNyArLQogc291bmQvc29jL2ludGVsL3NreWxha2UvY25sLXNz
dC5jICAgICAgIHwgIDM3ICstCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtZGVidWcuYyAg
ICAgfCAgMTQgKy0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1tZXNzYWdlcy5jICB8IDI0
NSArKysrKystLS0tLS0tCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtbmhsdC5jICAgICAg
fCAgMTggKy0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYyAgICAgICB8ICA3NCAr
Ky0tCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3NwLWNsay5jICAgfCAgIDQgKy0KIHNv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3QtZHNwLmMgICB8ICAxMCArLQogc291bmQvc29j
L2ludGVsL3NreWxha2Uvc2tsLXNzdC1kc3AuaCAgIHwgIDI5ICstCiBzb3VuZC9zb2MvaW50ZWwv
c2t5bGFrZS9za2wtc3N0LWlwYy5jICAgfCAgIDggKy0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtl
L3NrbC1zc3QtaXBjLmggICB8ICA1MiArLS0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1z
c3QtdXRpbHMuYyB8ICAzNyArLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXNzdC5jICAg
ICAgIHwgIDUxICstLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmMgIHwg
NDQxICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2ts
LXRvcG9sb2d5LmggIHwgIDQzICstLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmMgICAg
ICAgICAgIHwgIDU0ICstLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmggICAgICAgICAg
IHwgMTAyICsrKystLQogMjAgZmlsZXMgY2hhbmdlZCwgNTQ2IGluc2VydGlvbnMoKyksIDc0MyBk
ZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
