Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D01F224E2
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 22:35:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D47E1684;
	Sat, 18 May 2019 22:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D47E1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558211743;
	bh=NZuXWoO2kfZGFplWOd/kbmVoNKYO6XM0upAVLV+cTY4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PLIeP4EaPVtFizeGBZ8GejahfYjyiZH7LqkRjRvus3KtXKDan0kk2CewmGzkSgKfV
	 mUc8CLuxchDAfKKaPI8Hk07uMLiYwZu2uFXvtwWZUx/bFsS78TX374njR+W3RXLcOw
	 il7V7y0IR5dUaT5tjrujEEkGlQDZQxvNDzc8eUvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BCA4F89755;
	Sat, 18 May 2019 22:27:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FB2DF806E7; Sat, 18 May 2019 22:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51920F806E7
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 22:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51920F806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 13:27:29 -0700
X-ExtLoop1: 1
Received: from bmaster1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.14])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2019 13:27:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 May 2019 15:27:03 -0500
Message-Id: <20190518202704.7772-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
References: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH 11/12] ALSA: hdac: fix memory release for SST
	and SOF drivers
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

RnJvbTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAbGludXguaW50
ZWwuY29tPgoKRHVyaW5nIHRoZSBpbnRlZ3JhdGlvbiBvZiBIRGF1ZGlvIHN1cHBvcnQsIHdlIGNo
YW5nZWQgdGhlIHdheSBpbiB3aGljaAp3ZSBnZXQgaGRldiBpbiBzbmRfaGRhY19leHRfYnVzX2Rl
dmljZV9pbml0KCkgdG8gdXNlIG9uZSBwcmVhbGxvY2F0ZWQKd2l0aCBkZXZtX2t6YWxsb2MoKSwg
aG93ZXZlciBpdCBzdGlsbCBsZWZ0IGtmcmVlKGhkZXYpIGluCnNuZF9oZGFjX2V4dF9idXNfZGV2
aWNlX2V4aXQoKS4gSXQgbGVhZHMgdG8gb29wc2VzIHdoZW4gdHJ5aW5nIHRvCnJtbW9kIGFuZCBt
b2Rwcm9iZS4gRml4IGl0LCBieSBqdXN0IHJlbW92aW5nIGtmcmVlIGNhbGwuCgpTT0YgYWxzbyB1
c2VzIHNvbWUgb2YgdGhlIHNuZF9oZGFjXyBmdW5jdGlvbnMgZm9yIEhEQXVkaW8gc3VwcG9ydCBi
dXQKYWxsb2NhdGVkIHRoZSBtZW1vcnkgd2l0aCBremFsbG9jLiBBIG1hdGNoaW5nIGZpeCBpcyBw
cm92aWRlZApzZXBhcmF0ZWx5IHRvIGFsaWduIGFsbCB1c2VycyBvZiB0aGUgc25kX2hkYWNfIGxp
YnJhcnkuCgpGaXhlczogNjI5ODU0MmZhMzNiICgiQUxTQTogaGRhYzogcmVtb3ZlIG1lbW9yeSBh
bGxvY2F0aW9uIGZyb20gc25kX2hkYWNfZXh0X2J1c19kZXZpY2VfaW5pdCIpClNpZ25lZC1vZmYt
Ynk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVs
LmNvbT4KU2lnbmVkLW9mZi1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5i
b3NzYXJ0QGxpbnV4LmludGVsLmNvbT4KLS0tCiBzb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5j
IHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5k
L2hkYS9leHQvaGRhY19leHRfYnVzLmMgYi9zb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jCmlu
ZGV4IGVjNzcxNWM2YjBjMC4uYzE0N2ViZTU0MmRhIDEwMDY0NAotLS0gYS9zb3VuZC9oZGEvZXh0
L2hkYWNfZXh0X2J1cy5jCisrKyBiL3NvdW5kL2hkYS9leHQvaGRhY19leHRfYnVzLmMKQEAgLTE3
Miw3ICsxNzIsNiBAQCBFWFBPUlRfU1lNQk9MX0dQTChzbmRfaGRhY19leHRfYnVzX2RldmljZV9p
bml0KTsKIHZvaWQgc25kX2hkYWNfZXh0X2J1c19kZXZpY2VfZXhpdChzdHJ1Y3QgaGRhY19kZXZp
Y2UgKmhkZXYpCiB7CiAJc25kX2hkYWNfZGV2aWNlX2V4aXQoaGRldik7Ci0Ja2ZyZWUoaGRldik7
CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChzbmRfaGRhY19leHRfYnVzX2RldmljZV9leGl0KTsKIAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
