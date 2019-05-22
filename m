Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 296BB26844
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:30:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0654165E;
	Wed, 22 May 2019 18:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0654165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558542620;
	bh=QZqfqpcLMWPF8HLGC3FdgLE6MZ2zKMro2Dn5MvJWwBM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jlTLdseBF1XJ2OV+hEz6jnLp718kXeMLlSQ8TcOBb+6dTDfdFZTTUYFdSs0uRMIuv
	 NZDOKAlLm9X0Ql4ODbt9FO84HGtERq+0tqx7t7T0mF5FIG79lb8WJ+TcroX2HpYo1e
	 PS7QtRIAgKwxtM1185kpG9NBoFalIZ75rLyg0U2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B7DF8975B;
	Wed, 22 May 2019 18:22:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12C2CF89738; Wed, 22 May 2019 18:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7576F8972A
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7576F8972A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 09:21:59 -0700
X-ExtLoop1: 1
Received: from avcaesar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.140.52])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2019 09:21:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 11:21:41 -0500
Message-Id: <20190522162142.11525-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 11/12] ALSA: hdac: fix memory release for
	SST and SOF drivers
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
bGxvY2F0aW9uIGZyb20gc25kX2hkYWNfZXh0X2J1c19kZXZpY2VfaW5pdCIpClJldmlld2VkLWJ5
OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+ClNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPF
gmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9m
Zi1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiBzb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jIHwgMSAtCiAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL2hkYS9leHQvaGRhY19l
eHRfYnVzLmMgYi9zb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jCmluZGV4IGVjNzcxNWM2YjBj
MC4uYzE0N2ViZTU0MmRhIDEwMDY0NAotLS0gYS9zb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5j
CisrKyBiL3NvdW5kL2hkYS9leHQvaGRhY19leHRfYnVzLmMKQEAgLTE3Miw3ICsxNzIsNiBAQCBF
WFBPUlRfU1lNQk9MX0dQTChzbmRfaGRhY19leHRfYnVzX2RldmljZV9pbml0KTsKIHZvaWQgc25k
X2hkYWNfZXh0X2J1c19kZXZpY2VfZXhpdChzdHJ1Y3QgaGRhY19kZXZpY2UgKmhkZXYpCiB7CiAJ
c25kX2hkYWNfZGV2aWNlX2V4aXQoaGRldik7Ci0Ja2ZyZWUoaGRldik7CiB9CiBFWFBPUlRfU1lN
Qk9MX0dQTChzbmRfaGRhY19leHRfYnVzX2RldmljZV9leGl0KTsKIAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
