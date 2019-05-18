Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B050B224D5
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 22:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B7A31681;
	Sat, 18 May 2019 22:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B7A31681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558211355;
	bh=qdCFYuENCXNVhS2cjmjBG3v7bzRc8hDkAZGk/saWz2k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a3Tk7y0cTiBYgXw109oylQWbI6VxitG69qATNtJKfZOzg4HmnPj3R4jV2xg6/JZDF
	 /zvOIl7WF1XC+QQeNktQiG5/O2KpefsV80GvoPxPEpZ/x+McZHRQI4Hf2WDV34DS6l
	 7aD0clp8286arxpPMHUDywGSH8Ge7b659d9YzZq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0171F8972B;
	Sat, 18 May 2019 22:27:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE0C4F896CB; Sat, 18 May 2019 22:27:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76C00F806E7
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 22:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76C00F806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 13:27:20 -0700
X-ExtLoop1: 1
Received: from bmaster1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.14])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2019 13:27:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 May 2019 15:26:52 -0500
Message-Id: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 00/12] ASoC: SOF: stability fixes
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
LgoKVGhhbmtzIQoKQW1hZGV1c3ogU8WCYXdpxYRza2kgKDEpOgogIEFMU0E6IGhkYWM6IGZpeCBt
ZW1vcnkgcmVsZWFzZSBmb3IgU1NUIGFuZCBTT0YgZHJpdmVycwoKR3Vlbm5hZGkgTGlha2hvdmV0
c2tpICgxKToKICBBU29DOiBTT0Y6IGlwYzogZml4IGEgcmFjZSwgbGVhZGluZyB0byBJUEMgdGlt
ZW91dHMKCktleW9uIEppZSAoMSk6CiAgQVNvQzogU09GOiBjb250cm9sOiBjb3JyZWN0IHRoZSBj
b3B5IHNpemUgZm9yIGJ5dGVzIGtjb250cm9sIHB1dAoKTGliaW4gWWFuZyAoMik6CiAgQVNvQzog
U09GOiBwY206IGNsZWFyIGh3X3BhcmFtc191cG9uX3Jlc3VtZSBmbGFnIGNvcnJlY3RseQogIEFT
b0M6IFNPRjogSW50ZWw6IGhkYS1jb2RlYzogZml4IG1lbW9yeSBhbGxvY2F0aW9uCgpQaWVycmUt
TG91aXMgQm9zc2FydCAoMik6CiAgQVNvQzogU09GOiBjb3JlOiBmaXggZXJyb3IgaGFuZGxpbmcg
d2l0aCB0aGUgcHJvYmUgd29ya3F1ZXVlCiAgQVNvQzogU09GOiBwY206IHJlbW92ZSB3YXJuaW5n
IC0gaW5pdGlhbGl6ZSB3b3JrcXVldWUgb24gb3BlbgoKUmFuamFuaSBTcmlkaGFyYW4gKDMpOgog
IEFTb0M6IFNPRjogY29yZTogcmVtb3ZlIERTUCBhZnRlciB1bnJlZ2lzdGVyaW5nIG1hY2hpbmUg
ZHJpdmVyCiAgQVNvQzogU09GOiBjb3JlOiByZW1vdmUgc25kX3NvY191bnJlZ2lzdGVyX2NvbXBv
bmVudCBpbiBjYXNlIG9mIGVycm9yCiAgQVNvQzogU09GOiBwY206IHJlbW92ZSBydW50aW1lIFBN
IGNhbGxzIGR1cmluZyBwY20gb3Blbi9jbG9zZQoKWmh1IFlpbmdqaWFuZyAoMik6CiAgQVNvQzog
U09GOiBJbnRlbDogaGRhOiBmaXggdGhlIGhkYSBpbml0IGNoaXAKICBBU29DOiBTT0Y6IEludGVs
OiBoZGE6IHVzZSB0aGUgZGVmaW5lZCBwcGNhcCBmdW5jdGlvbnMKCiBzb3VuZC9oZGEvZXh0L2hk
YWNfZXh0X2J1cy5jICAgIHwgICAxIC0KIHNvdW5kL3NvYy9zb2YvY29udHJvbC5jICAgICAgICAg
fCAgIDkgKy0tCiBzb3VuZC9zb2Mvc29mL2NvcmUuYyAgICAgICAgICAgIHwgIDI5ICsrKysrKyst
LQogc291bmQvc29jL3NvZi9pbnRlbC9iZHcuYyAgICAgICB8ICAxMSArKy0tCiBzb3VuZC9zb2Mv
c29mL2ludGVsL2J5dC5jICAgICAgIHwgIDEyICsrLS0KIHNvdW5kL3NvYy9zb2YvaW50ZWwvY25s
LmMgICAgICAgfCAgIDYgKysKIHNvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLWNvZGVjLmMgfCAgIDYg
Ky0KIHNvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLWN0cmwuYyAgfCAxMDIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tCiBzb3VuZC9zb2Mvc29mL2ludGVsL2hkYS1pcGMuYyAgIHwgIDE5ICsr
KysrLQogc291bmQvc29jL3NvZi9pbnRlbC9oZGEuYyAgICAgICB8IDEwOSArKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogc291bmQvc29jL3NvZi9pcGMuYyAgICAgICAgICAgICB8ICAx
MyAtLS0tCiBzb3VuZC9zb2Mvc29mL3BjbS5jICAgICAgICAgICAgIHwgIDM3ICsrLS0tLS0tLS0t
CiAxMiBmaWxlcyBjaGFuZ2VkLCAxODggaW5zZXJ0aW9ucygrKSwgMTY2IGRlbGV0aW9ucygtKQoK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
