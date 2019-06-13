Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C306444BAE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C6E11834;
	Thu, 13 Jun 2019 21:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C6E11834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560452824;
	bh=SjL0wSvlaJVSRfal2A5yzXwvNSUK4VsZropHJX/h/9Y=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rhGcmWGcQbVFTJW/7DDlwL0kF++ThDd3ZdQhrPq6uM2+noT/9kbMIZLSFkIVVe2Mn
	 TPCVAfuozyMwns5fp9/XkASTIKlPGCnLDVanJRJqOfVFKEe9jX0OBwtEgqUygvPTll
	 7f+oRuqJ3h8OrPOLM/jPBIqNp6xY9FZtxA+rsZn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC26DF89728;
	Thu, 13 Jun 2019 21:05:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FD6BF89714; Thu, 13 Jun 2019 21:05:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3B24F896F1
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3B24F896F1
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 12:05:23 -0700
X-ExtLoop1: 1
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2019 12:05:22 -0700
From: cezary.rojewski@intel.com
To: alsa-devel@alsa-project.org
Date: Thu, 13 Jun 2019 21:04:29 +0200
Message-Id: <20190613190436.20156-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 0/7] ASoC: Intel: Skylake: Critical IPC fixes
	and flow adjustments
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

RnJvbTogQ2V6YXJ5IFJvamV3c2tpIDxjZXphcnkucm9qZXdza2lAaW50ZWwuY29tPgoKVGhpcyBz
ZXQgb2YgY2hhbmdlcyBjb250YWlucyBjcml0aWNhbCBJUEMgZml4ZXM6Ci0gQVNvQzogSW50ZWw6
IFNreWxha2U6IFJlYWQgSElQQ1QgZXh0ZW5zaW9uIGJlZm9yZSBjbGVhcmluZyBET05FIGJpdAot
IEFTb0M6IEludGVsOiBGaXggcmFjZSBjb25kaXRpb24gaW4gSVBDIHJ4IGxpc3QKCmFzIHdlbGwg
YXMgdXBkYXRlcyB0byBjb21tb24gbWVjaGFuaXNtcyB0byB1c2UgcmVjb21tZW5kZWQgZmxvd3Ms
IG1vc3QKbm90YWJseToKLSBBU29DOiBJbnRlbDogU2t5bGFrZTogVXNlIHJlY29tbWVuZGVkIFNE
eEZNVCBwcm9ncmFtbWluZyBzZXF1ZW5jZQotIEFTb0M6IEludGVsOiBTa3lsYWtlOiBGaXggaW5j
b3JyZWN0IGNhcHR1cmUgcG9zaXRpb24gcmVwb3J0aW5nCgpXaGlsZSBmbG93IGFkanVzdG1lbnRz
IGZpeCBpc3N1ZXMgd2l0aCAxMDAlIHJlcHJvZHVjdGlvbiByYXRlLCB0aGUgbW9zdApjcnVjaWFs
IGNoYW5nZXMgYWRkcmVzcyBpc3N1ZXMgb2NjdXJyaW5nIHJhcmVseSAtIHVzdWFsbHkgb25seSB1
bmRlcgpzdHJlc3MgY29uZGl0aW9ucy4gVGhlc2UsIGhvd2V2ZXIsIGNhbiBlYXNpbHkgY2F1c2Ug
dW5leHBlY3RlZCBiZWhhdmlvcgpvbiBEU1AgbGV2ZWwuCgpBbWFkZXVzeiBTxYJhd2nFhHNraSAo
MSk6CiAgQVNvQzogSW50ZWw6IFNreWxha2U6IFJlc2V0IHBpcGVsaW5lIGJlZm9yZSBpdHMgZGVs
ZXRpb24KCkNlemFyeSBSb2pld3NraSAoMyk6CiAgQVNvQzogSW50ZWw6IFNreWxha2U6IEZpeCBp
bmNvcnJlY3QgY2FwdHVyZSBwb3NpdGlvbiByZXBvcnRpbmcKICBBU29DOiBJbnRlbDogU2t5bGFr
ZTogUmVhZCBISVBDVCBleHRlbnNpb24gYmVmb3JlIGNsZWFyaW5nIERPTkUgYml0CiAgQVNvQzog
SW50ZWw6IENvbW1vbjogRml4IE5VTEwgZGVyZWZlcmVuY2UgaW4gdHhfd2FpdF9kb25lCgpHdXN0
YXcgTGV3YW5kb3dza2kgKDEpOgogIEFTb0M6IEludGVsOiBGaXggcmFjZSBjb25kaXRpb24gaW4g
SVBDIHJ4IGxpc3QKCkthbWlsIEx1bGtvICgxKToKICBBU29DOiBJbnRlbDogU2t5bGFrZTogU3Ry
aXAgVCBhbmQgTCBmcm9tIFRMViBJUENzCgpQYXdlxYIgSGFyxYJvemnFhHNraSAoMSk6CiAgQVNv
QzogSW50ZWw6IFNreWxha2U6IFVzZSByZWNvbW1lbmRlZCBTRHhGTVQgcHJvZ3JhbW1pbmcgc2Vx
dWVuY2UKCiBpbmNsdWRlL3NvdW5kL2hkYV9jb2RlYy5oICAgICAgICAgICAgICB8ICAzICsrKwog
c291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYyAgICAgICAgICAgICAgfCAgMyAtLS0KIHNvdW5kL3Nv
Yy9pbnRlbC9jb21tb24vc3N0LWlwYy5jICAgICAgIHwgIDIgKy0KIHNvdW5kL3NvYy9pbnRlbC9z
a3lsYWtlL2NubC1zc3QuYyAgICAgIHwgIDIgKy0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3Nr
bC1tZXNzYWdlcy5jIHwgMjMgKysrKysrKysrKysrKysrKy0tLS0tLS0KIHNvdW5kL3NvYy9pbnRl
bC9za3lsYWtlL3NrbC1wY20uYyAgICAgIHwgMTQgKysrKysrKysrKysrKy0KIHNvdW5kL3NvYy9p
bnRlbC9za3lsYWtlL3NrbC1zc3QtaXBjLmMgIHwgIDQgKystLQogc291bmQvc29jL2ludGVsL3Nr
eWxha2Uvc2tsLXRvcG9sb2d5LmMgfCAyMiArKysrKysrKystLS0tLS0tLS0tLS0tCiBzb3VuZC9z
b2MvaW50ZWwvc2t5bGFrZS9za2wuYyAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysr
Kwogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmggICAgICAgICAgfCAgMSArCiAxMCBmaWxl
cyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
