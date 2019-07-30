Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9E7A5D8
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 12:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2982217ED;
	Tue, 30 Jul 2019 12:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2982217ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564481896;
	bh=XGxWRvlQzvqB77Rgrt5HSWKVXvIK7Z2unKVOn5Iu7Yk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S4EirYSePuYcD88/eu02ceBgXudhM/POZQ/d/O9azO5juyGS++HGapKMlHNtVMNLO
	 L2BSI0ujUYfPQ5PO3gkAVkPStvEebVcmQmZoUplVX03VZW6UjPbvjdQ65KgHpzMgBS
	 uDEO7IqTsSWu2Nj8fLBKoBhX7SRTCKIfp37P6ouk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87FB8F804CA;
	Tue, 30 Jul 2019 12:16:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28B08F804CA; Tue, 30 Jul 2019 12:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 159CBF80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 12:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 159CBF80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 03:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; d="scan'208";a="370902392"
Received: from mrajwa-mobl.ger.corp.intel.com (HELO [10.237.142.227])
 ([10.237.142.227])
 by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2019 03:16:22 -0700
To: marcin.rajwa@intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 ranjani.sridharan@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org
From: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
Message-ID: <9d92551a-fa10-4ecd-47f1-5b3b67824a12@linux.intel.com>
Date: Tue, 30 Jul 2019 12:16:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [alsa-devel] [PATCH v4 1/2] ASoC: SOF: introduce no_stream_position
 so host_period_bytes preserves its data
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

RnJvbTogTWFyY2luIFJhandhIDxtYXJjaW4ucmFqd2FAbGludXguaW50ZWwuY29tPgoKQ2hhbmdl
IHRoZSB1c2Ugb2YgaG9zdF9wZXJpb2RfYnl0ZXMuIFNvIGZhciB0aGlzIGZpZWxkIHdhcyB1c2Vk
CmFzIGFuIGJvb2wgdmFsdWUgaW5kaWNhdGluZyB3aGV0aGVyIEZXIHNob3VsZCBzZW5kIHN0cmVh
bSBwb3NpdGlvbgp1cGRhdGUuIFdpdGggdGhpcyBwYXRjaCB3ZSB1c2UgaG9zdF9wZXJpb2RfYnl0
ZXMgdG8gcHJvdmlkZSBmaXJtd2FyZQppbmZvcm1hdGlvbiBhYm91dCB0aGUgZnJlcXVlbmN5IG9m
IGhvc3QgaW50ZXJydXB0cyBhaW1lZCB0byByZWFkCml0cyBpbnB1dCBidWZmZXIuIFRoaXMgaXMg
YWNjb3JpbmcgdG8gQUxTQSBkZWZpbml0aW9uIG9mICdGcmFtZVBlcmlvZCcuCktub3dpbmcgdGhp
cyBmaXJtd2FyZSBjYW4gc2FmZWx5IGNvcHkgbGFyZ2UvaXJyZWd1bGFyIGNodW5rcyBvZiBkYXRh
CihsaWtlIGRhdGEgY29tbWluZyBmcm9tIGkuZSBkcmFpbmluZyB0YXNrKSB3aXRob3V0IHRoZSBy
aXNrIG9mIGJ1ZmZlcgpvdmVyZmxvdy4KClNpZ25lZC1vZmYtYnk6IE1hcmNpbiBSYWp3YSA8bWFy
Y2luLnJhandhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogS2V5b24gSmllIDx5YW5n
LmppZUBsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFu
amFuaS5zcmlkaGFyYW5AbGludXguaW50ZWwuY29tPgoKLS0tCiDCoGluY2x1ZGUvc291bmQvc29m
L3N0cmVhbS5oIHwgNCArKy0tCiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zb3VuZC9zb2Yvc3RyZWFtLmggYi9p
bmNsdWRlL3NvdW5kL3NvZi9zdHJlYW0uaAppbmRleCA2NDNmMTc1Y2I0NzkuLjA2YWY0ZWNiMjU4
NCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9zb3VuZC9zb2Yvc3RyZWFtLmgKKysrIGIvaW5jbHVkZS9z
b3VuZC9zb2Yvc3RyZWFtLmgKQEAgLTgzLDEwICs4MywxMCBAQCBzdHJ1Y3Qgc29mX2lwY19zdHJl
YW1fcGFyYW1zIHsKIMKgwqDCoMKgIHVpbnQxNl90IHNhbXBsZV92YWxpZF9ieXRlczsKIMKgwqDC
oMKgIHVpbnQxNl90IHNhbXBsZV9jb250YWluZXJfYnl0ZXM7CgotwqDCoMKgIC8qIGZvciBub3Rp
ZnlpbmcgaG9zdCBwZXJpb2QgaGFzIGNvbXBsZXRlZCAtIDAgbWVhbnMgbm8gcGVyaW9kIElSUSAq
LwogwqDCoMKgwqAgdWludDMyX3QgaG9zdF9wZXJpb2RfYnl0ZXM7CivCoMKgwqAgdWludDE2X3Qg
bm9fc3RyZWFtX3Bvc2l0aW9uOyAvKiAxIG1lYW5zIG5vIElQQyBmb3IgcG9zaXRpb24gdXBkYXRl
ICovCgotwqDCoMKgIHVpbnQzMl90IHJlc2VydmVkWzJdOworwqDCoMKgIHVpbnQxNl90IHJlc2Vy
dmVkWzNdOwogwqDCoMKgwqAgdWludDE2X3QgY2htYXBbU09GX0lQQ19NQVhfQ0hBTk5FTFNdO8Kg
wqDCoCAvKio8IGNoYW5uZWwgbWFwIC0gClNPRl9DSE1BUF8gKi8KIMKgfSBfX3BhY2tlZDsKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
