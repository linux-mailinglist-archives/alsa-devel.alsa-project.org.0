Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBECE8AD3
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 15:33:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DBB5228A;
	Tue, 29 Oct 2019 15:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DBB5228A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572359632;
	bh=R1V38pPMkisGmUOD9Nrek9SwmlgooKgDORrrtyRb8Vw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=etNrWS5ykXtKCYGjzkbC47gRUBeMgDbC1B/DGKYYqM65sY/NqskCxa6tI/Y0mwjXv
	 MeR0l3oa5wRpVSVXHwNh5tlf8ecLLFd09G1xx/ORcfz3fIW0lDIln//1biT7vUWxeA
	 Nf/eWlaQMsBZK+XBoTpUVyQ/UsFXA9Kvyk4j3Xgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A261AF8044B;
	Tue, 29 Oct 2019 15:21:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AF6FF80392; Tue, 29 Oct 2019 15:21:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED124F80392
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 15:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED124F80392
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 07:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="193618818"
Received: from vtungala-mobl3.amr.corp.intel.com (HELO [10.254.109.225])
 ([10.254.109.225])
 by orsmga008.jf.intel.com with ESMTP; 29 Oct 2019 07:21:17 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
 <20191025224122.7718-2-pierre-louis.bossart@linux.intel.com>
 <27049897-ae9d-49b3-20be-f35429ccb03c@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <23d6197c-76e1-af1a-6016-d4d376210be3@linux.intel.com>
Date: Tue, 29 Oct 2019 09:11:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <27049897-ae9d-49b3-20be-f35429ccb03c@intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Keyon Jie <yang.jie@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 01/26] ASoC: SOF: add a field to store the
 current D0 substate of DSP
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

CgpPbiAxMC8yOS8xOSA1OjIwIEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4gT24gMjAxOS0x
MC0yNiAwMDo0MCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+ICsvKiBEU1AgRDBpeCBz
dWItc3RhdGUgKi8KPj4gK2VudW0gc29mX2QwX3N1YnN0YXRlIHsKPj4gK8KgwqDCoCBTT0ZfRFNQ
X0QwSTAgPSAwLMKgwqDCoCAvKiBEU1AgZGVmYXVsdCBEMCBzdWJzdGF0ZSAqLwo+PiArwqDCoMKg
IFNPRl9EU1BfRDBJMyzCoMKgwqDCoMKgwqDCoCAvKiBEU1AgRDBpMyhsb3cgcG93ZXIpIHN1YnN0
YXRlKi8KPj4gK307Cj4gCj4gTmFtZSBvZiB0aGUgdHlwZSBzdGF0ZXM6ICJkMCBzdWJzdGF0ZSIg
d2hpbGUgZGVzY3JpcHRpb24gIkQwaXggCj4gc3ViLXN0YXRlIi4gV2h5IHdhcyBub3QgdGhpcyBu
YW1lZCBEMGl4IGZyb20gdGhlIGdldC1nbz8gR29lcyBpbnRvIHRoZSAKPiBzYW1lIHRoZSBzYW1l
IG5hbWluZyBidWNrZXQgYXMgUzBpeC4KClRoZSBkZWZpbml0aW9uIGlzIGNvcnJlY3QsIGZyb20g
dGhlIHBtX3J1bnRpbWUgcGVyc3BlY3RpdmUgdGhlIGRldmljZSBpcyAKJ2FjdGl2ZScgaS5lLiBE
MC4gRDBpeCBpcyBhIHN1YnN0YXRlIG9mIEQwLgoKPiAKPiBPbiB0aGUgZnVydGhlciBub3RlLCBh
ZGRpbmcgRDBpeCBwYXRjaCB3aXRoaW4gImVuYWJsZSBTMGl4IHN1cHBvcnQgZm9yIAo+IEludGVs
IHBsYXRmb3JtcyIgaXMgbWlzbGVhZGluZy4gUy1zdGF0ZXMgIT0gRC1zdGF0ZXMuIEQwaXggaXMg
ZXNwZWNpYWxseSAKPiBvcnRob2dvbmFsLiBJdCBpcyB0aGVzZSB0byBmdXJ0aGVyIHJlZHVjZSBw
b3dlciBjb25zdW1wdGlvbiB3aGVuIHN5c3RlbSAKPiBhbmQgZGV2aWNlIGFyZSBpbiBTMCBhbmQg
RDAgcmVzcGVjdGl2ZWx5IGFuZCBpZGxlIHRpbWUgYmV0d2VlbiBJUEMgCj4gY29tbXVuaWNhdGlv
biBpcyBsb25nIGVub3VnaCBmb3IgRFNQIHRvIGJlIHBvd2VyIGdhdGVkLgoKdGhlcmUgYXJlIHdl
bGwtZGVmaW5lZCByZXF1aXJlbWVudHMgYW5kIGRlcGVuZGVuY2llcyBiZXR3ZWVuIFMgYW5kIEQg
c3RhdGVzOgoKUzA6IGRldmljZSBjYW4gYmUgaW4gRDAsIEQwaXgsIEQzClMwaXg6IGRldmljZSBj
YW4gYmUgaW4gRDBpeCwgRDMKUzM6IGRldmljZSBjYW4gYmUgaW4gRDMKClRoYXQncyBoYXJkbHkg
b3J0aG9nb25hbC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
