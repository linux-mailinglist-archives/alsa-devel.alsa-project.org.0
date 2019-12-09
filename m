Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11427117BF0
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 00:57:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F7415F9;
	Tue, 10 Dec 2019 00:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F7415F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575935841;
	bh=ZoYoRuesN/RyAeSAWlC1dneY6FgsI9faa+dzFVT4oAw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YbxkBHSN6NmRHjG93V6XCUtHMnwA/YOpjq2qd2eWD7VLgQObfcOCrsQgRZigvFuEu
	 r+hnM+KhEiAFtx02vHXwmEXgrfEh7oq2+O7oxrbXzAMSL9N2QIRkZQX+MbtbeiQWqw
	 UhJ0E2HAgz3C/ZyHRkfS5QaqH/wMPvaXT0C1DCqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA498F80240;
	Tue, 10 Dec 2019 00:55:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41C08F800C4; Tue, 10 Dec 2019 00:55:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00589F800C4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 00:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00589F800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 15:55:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="210273596"
Received: from bbower-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.65.172])
 by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 15:55:25 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 17:55:08 -0600
Message-Id: <20191209235520.18727-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v4 00/11] soundwire: update ASoC interfaces
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

V2UgbmVlZCBuZXcgZmllbGRzIGluIGV4aXN0aW5nIHN0cnVjdHVyZXMgdG8KYSkgZGVhbCB3aXRo
IHJhY2UgY29uZGl0aW9ucyBvbiBjb2RlYyBwcm9iZS9lbnVtZXJhdGlvbgpiKSBhbGxvdyBmb3Ig
bXVsdGktc3RlcCBBQ1BJIHNjYW4vcHJvYmUvc3RhcnR1cCBvbiBJbnRlbCBwbGFmb3JtcwpjKSBk
ZWFsIHdpdGggTVNJIGlzc3VlcyB1c2luZyBhIHNpbmdsZSBoYW5kbGVyL3RocmVhZHMgZm9yIGFs
bCBhdWRpbwppbnRlcnJ1cHRzCmQpIGRlYWwgd2l0aCBhY2Nlc3MgdG8gcmVnaXN0ZXJzIHNoYXJl
ZCBhY3Jvc3MgbXVsdGlwbGUgbGlua3Mgb24gSW50ZWwKcGxhdGZvcm1zCgpUaGVzZSBzdHJ1Y3R1
cmVzIGZvciBhKSB3aWxsIGJlIHVzZWQgYnkgdGhlIFNPRiBkcml2ZXIgYXMgd2VsbCBhcwpjb2Rl
YyBkcml2ZXJzLiBUaGUgYikgYykgYW5kIGQpIGNhc2VzIGFyZSBvbmx5IGZvciB0aGUgSW50ZWwt
c3BlY2lmaWMKaW1wbGVtZW50YXRpb24uCgpUbyBhdm9pZCBjb25mbGljdHMgYmV0d2VlbiBBU29D
IGFuZCBTb3VuZHdpcmUgdHJlZXMsIHRoZXNlIDExIHBhdGNoZXMKYXJlIHByb3ZpZGVkIG91dC1v
Zi1vcmRlciwgYmVmb3JlIHRoZSBmdW5jdGlvbmFsaXR5IGVuYWJsZWQgaW4gdGhlc2UKaGVhZGVy
IGZpbGVzIGlzIGFkZGVkIGluIGZvbGxvdy11cCBwYXRjaCBzZXJpZXMgd2hpY2ggY2FuIGJlIGFw
cGxpZWQKc2VwYXJhdGVseSBpbiB0aGUgQVNvQyBhbmQgU291bmR3aXJlIHRyZWVzLiBBcyBkaXNj
dXNzZWQgZWFybGllciwKVmlub2Qgd291bGQgbmVlZCB0byBwcm92aWRlIGFuIGltbXV0YWJsZSB0
YWcgZm9yIE1hcmsgQnJvd24sIGFuZCB0aGUKaW50ZWdyYXRpb24gb24gdGhlIEFTb0Mgc2lkZSBv
ZiBTT0YgY2hhbmdlcyBhbmQgbmV3IGNvZGVjcyBkcml2ZXJzIGNhbgpwcm9jZWVkIGluIHBhcmFs
bGVsIHdpdGggU291bmRXaXJlIGNvcmUgY2hhbmdlcy4KCkkgaGFkIG11bHRpcGxlIG9mZmxpbmUg
ZGlzY3Vzc2lvbnMgd2l0aCBWaW5vZC9NYXJrL1Rha2FzaGkgb24gaG93IHRvCnByb2NlZWQgd2l0
aGUgdm9sdW1lIG9mIFNvdW5kV2lyZSBjaGFuZ2VzLiBOb3cgdGhhdCB2NS41LXJjMSBpcyBvdXQg
d2UKc2hvdWxkIGdvIGFoZWFkIHdpdGggdGhlc2UgaW50ZXJmYWNlIGNoYW5nZXMuIFRoZSBuZXh0
IHBhdGNoc2V0IGhhcwpub3QgY2hhbmdlZCwgdGhlIHNlcmllcyAiW1BBVENIIHYzIDAwLzE1XSBz
b3VuZHdpcmU6IGludGVsOiBpbXBsZW1lbnQKbmV3IEFTb0MgaW50ZXJmYWNlc+KAiyIgY2FuIHN0
aWxsIGJlIHJldmlld2VkLgoKQW4gdXBkYXRlIGZvciB0aGUgc2VyaWVzICJbUEFUQ0ggdjMgMDAv
MjJdIHNvdW5kd2lyZTogY29kZSBoYXJkZW5pbmcKYW5kIHN1c3BlbmQtcmVzdW1lIHN1cHBvcnQi
IHdpbGwgYmUgcHJvdmlkZWQgbGF0ZXIgdGhpcyB3ZWVrIChvbmUgbGFzdAptaW51dGUgaXNzdWUg
dG8gZml4KQoKQ29tbWVudHMgYW5kIGZlZWRiYWNrIHdlbGNvbWUKflBpZXJyZQoKQ2hhbmdlcyBz
aW5jZSB2MzoKUmVvcmRlcmVkIGNvZGUgYW5kIGFkZGVkIGtlcm5lbCBkb2MgY29tbWVudHMKQWRk
ZWQgcHJvdG90eXBlcyBhbmQgZmllbGRzIG5lZWRlZCB0byBkZWFsIHdpdGggU291bmRXaXJlIGlu
dGVycnVwdHMKaW4gYSBzaW5nbGUgaGFuZGxlci90aHJlYWQsIGZvbGxvd2luZyB3aGF0IGlzIGFs
cmVhZHkgZG9uZSBvbiB0aGUgRFNQCnNpZGUuCkFkZGVkIG11dGV4IHRvIGNvbnRyb2wgYWNjZXNz
IHRvIHJlZ2lzdGVycyBzaGFyZWQgYWNyb3NzIGxpbmtzCkFkZGVkIGluaXRpYWwgZGVmaW5pdGlv
bnMgZm9yIGNsb2NrIHN0b3Agc3VwcG9ydCBvbiBJbnRlbApwbGF0Zm9ybXMuIERlcGVuZGluZyBv
biBwb3dlciBhbmQgbGF0ZW5jeSByZXF1aXJlbWVudHMsIGRpZmZlcmVudAoicXVpcmtzIiBjYW4g
YmUgc3VwcG9ydGVkLgoKQ2hhbmdlcyBzaW5jZSB2MjoKQWRkZWQgbmV3IGZpZWxkIHRvIGRlYWwg
d2l0aCBhIHJhY2UgY29uZGl0aW9uIGxlYWRpbmcgdG8gYSB0aW1lb3V0CndoZW4gdGhlIGNvZGVj
IGdvZXMgdGhyb3VnaCBhIHBtX3J1bnRpbWUgc3VzcGVuZC9yZXN1bWUgdHJhbnNpdGlvbgp3aGls
ZSB0aGUgTWFzdGVyIHJlbWFpbnMgYWN0aXZlLgpDbGFyaWZpZWQgY29tbWl0IG1lc3NhZ2VzIHdp
dGggZGV0YWlsZWQgZXhwbGFuYXRpb25zIHdoYXQgdGhvc2UgcmFjZQpjb25kaXRpb25zIGFyZSBh
bmQgd2h5IHRoZSBjaGFuZ2VzIHdlcmUgaW50cm9kdWNlZC4KUmVvcmRlcmVkIGZpZWxkcyBmb3Ig
SW50ZWwgcm91dGluZXMKQWRkZWQga2VybmVsLWRvYyBkZWZpbml0aW9ucyBmb3Igc3RydWN0dXJl
cwpNb2RpZmllZCB0aGUgcGF0Y2ggc3ViamVjdHMgdG8gbWFrZSB0aGUgbWFwcGluZyBiZXR3ZWVu
IGludGVyZmFjZSBkZWZpbml0aW9uCmFuZCBpbXBsZW1lbnRhdGlvbiBzdHJhaWdodGZvcndhcmQu
CgpDaGFuZ2VzIHNpbmNlIHYxIChubyBmZWVkYmFjayByZWNlaXZlZCBzaW5jZSBPY3RvYmVyIDIz
KQphZGRpdGlvbmFsIGluaXRpYWxpemF0aW9uX2NvbXBsZXRlIHV0aWxpdHkgdG8gaGVscCBjb2Rl
YyBkcml2ZXJzIHdpdGgKdGhlaXIgcmVzdW1lIG9wZXJhdGlvbiwgd2FpdGluZyBmb3IgdGhlIGVu
dW1lcmF0aW9uIHRvIGNvbXBsZXRlIGlzIG5vdAphbHdheXMgZW5vdWdoLgoKQmFyZCBMaWFvICgy
KToKICBzb3VuZHdpcmU6IGludGVsOiB1cGRhdGUgaGVhZGVycyBmb3IgaW50ZXJydXB0cwogIHNv
dW5kd2lyZTogaW50ZWw6IGFkZCBsaW5rX2xpc3QgdG8gaGFuZGxlIGludGVycnVwdHMgd2l0aCBh
IHNpbmdsZQogICAgdGhyZWFkCgpQaWVycmUtTG91aXMgQm9zc2FydCAoNyk6CiAgc291bmR3aXJl
OiBzZHdfc2xhdmU6IGFkZCBwcm9iZV9jb21wbGV0ZSBzdHJ1Y3R1cmUgYW5kIG5ldyBmaWVsZHMK
ICBzb3VuZHdpcmU6IHNkd19zbGF2ZTogYWRkIGVudW1lcmF0aW9uX2NvbXBsZXRlIHN0cnVjdHVy
ZQogIHNvdW5kd2lyZTogc2R3X3NsYXZlOiBhZGQgaW5pdGlhbGl6YXRpb25fY29tcGxldGUgZGVm
aW5pdGlvbgogIHNvdW5kd2lyZTogc2R3X3NsYXZlOiB0cmFjayB1bmF0dGFjaF9yZXF1ZXN0IHRv
IGhhbmRsZSBhbGwgaW5pdAogICAgc2VxdWVuY2VzCiAgc291bmR3aXJlOiBpbnRlbDogdXBkYXRl
IGludGVyZmFjZXMgYmV0d2VlbiBBU29DIGFuZCBTb3VuZFdpcmUKICBzb3VuZHdpcmU6IGludGVs
OiBhZGQgbXV0ZXggZm9yIHNoYXJlZCBTSElNIHJlZ2lzdGVyIGFjY2VzcwogIHNvdW5kd2lyZTog
aW50ZWw6IGFkZCBjbG9jayBzdG9wIHF1aXJrcwoKUmFuZGVyIFdhbmcgKDIpOgogIHNvdW5kd2ly
ZTogaW50ZWw6IHVwZGF0ZSBzdHJlYW0gY2FsbGJhY2tzIGZvciBod3BhcmFtcy9mcmVlIHN0cmVh
bQogICAgb3BlcmF0aW9ucwogIHNvdW5kd2lyZTogaW50ZWw6IGFkZCBwcm90b3R5cGUgZm9yIFdB
S0VFTiBpbnRlcnJ1cHQgcHJvY2Vzc2luZwoKIGRyaXZlcnMvc291bmR3aXJlL2ludGVsLmMgICAg
ICAgICAgIHwgIDIwICsrLS0KIGRyaXZlcnMvc291bmR3aXJlL2ludGVsLmggICAgICAgICAgIHwg
IDEzICsrLQogZHJpdmVycy9zb3VuZHdpcmUvaW50ZWxfaW5pdC5jICAgICAgfCAgMzEgKystLS0t
CiBpbmNsdWRlL2xpbnV4L3NvdW5kd2lyZS9zZHcuaCAgICAgICB8ICAxOSArKysrCiBpbmNsdWRl
L2xpbnV4L3NvdW5kd2lyZS9zZHdfaW50ZWwuaCB8IDE1NCArKysrKysrKysrKysrKysrKysrKysr
KysrKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDE5NCBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMo
LSkKCgpiYXNlLWNvbW1pdDogZTQyNjE3YjgyNWY4MDczNTY5ZGE3NmRjNDUxMGJmYTAxOWIxYzM1
YQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
