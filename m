Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE73529DC
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 12:39:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DA0A16B0;
	Fri,  2 Apr 2021 12:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DA0A16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617359984;
	bh=D+pqFKahtiztNA8b+SrZiNzYCbhehtCwYdO2Vvz3iT8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A7QkpnkvKOllLAURln0FpCxA2DPBB8Rv8uCQn7y/PAGIWEvlJ1fLBHw8OAbeiDOFT
	 JDTN/Nw6VctD19Nx9LgAEmZlaoWD5NRnkQXK7CtJuW3PooLQgTRjogdUzf9GpIo+wY
	 E3VAOnxDmD8JGpf7SoP+rHKD+Szz7gQeYFhEZzZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A4EAF80259;
	Fri,  2 Apr 2021 12:38:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 824CAF801DB; Fri,  2 Apr 2021 12:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EF59F800F5;
 Fri,  2 Apr 2021 12:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EF59F800F5
IronPort-SDR: IWFPiL5E4KfeUqNHXCTVwQnAqWBsp6iizgRxto+1ZFZEwG08C+uKhzbD7RbLl9PLEULKVwWneL
 pv2HnaYLTCjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="191929342"
X-IronPort-AV: E=Sophos;i="5.81,299,1610438400"; d="scan'208";a="191929342"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 03:38:17 -0700
IronPort-SDR: ufWDD5NXoaWih1877xFix69/TkrymFOYilAWdr8NmJlVUbvFnUpsHr4d71JRX13ifVtp3+IQvV
 trDWrfAiAlNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,299,1610438400"; d="scan'208";a="528568198"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by orsmga004.jf.intel.com with ESMTP; 02 Apr 2021 03:38:16 -0700
Received: from irsmsx602.ger.corp.intel.com (163.33.146.8) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 2 Apr 2021 11:38:16 +0100
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8]) by
 irsmsx602.ger.corp.intel.com ([163.33.146.8]) with mapi id 15.01.2106.013;
 Fri, 2 Apr 2021 11:38:16 +0100
From: "Girdwood, Liam R" <liam.r.girdwood@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
Subject: [ANNOUNCE] SOF v1.7 released
Thread-Topic: [ANNOUNCE] SOF v1.7 released
Thread-Index: AQHXJ6xKDB1wrolGwESVp0gH/dXcsg==
Date: Fri, 2 Apr 2021 10:38:16 +0000
Message-ID: <6edbafe2ba2b50219eed3ac0ec2c00380c28701e.camel@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDECD06D5A5BC649936EF92DA4BAFD20@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

VGhlIFNPRiBkZXZlbG9wZXJzIGFyZSBwbGVhc2VkIHRvIGFubm91bmNlIHRoYXQgdmVyc2lvbiAx
LjcgaGFzIGJlZW4NCnJlbGVhc2VkIGFuZCBiaW5hcmllcyBhdmFpbGFibGUgZm9yIEludGVsIGFu
ZCBOWFAgcGxhdGZvcm1zWzFdLg0KDQpUaGUgbWFpbiBmb2N1cyBvZiB2MS43IHdhcyBhcm91bmQg
YWRkaW5nIHN1cHBvcnQgZm9yIG5ldyBhdWRpbw0KcHJvY2Vzc2luZyBhbGdvcml0aG1zLCBjb250
aW51ZWQgWmVwaHlyIGludGVncmF0aW9uIGFuZCBnZW5lcmFsDQpzdGFiaWxpc2F0aW9uLg0KDQpS
ZWxlYXNlIG5vdGVzIGFyZSBoZXJlLg0KDQpodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVj
dC9zb2YvcmVsZWFzZXMvdGFnL3YxLjcNCg0KQmluYXJpZXMgYXJlIGhlcmUuDQoNCmh0dHBzOi8v
Z2l0aHViLmNvbS90aGVzb2Zwcm9qZWN0L3NvZi1iaW4NCg0KRmlybXdhcmUgaXNzdWVzIGNhbiBi
ZSByZXBvcnRlZCBoZXJlIChhbmQgZmVhdHVyZSByZXF1ZXN0cyB0b28pLg0KDQpodHRwczovL2dp
dGh1Yi5jb20vdGhlc29mcHJvamVjdC9zb2YvaXNzdWVzDQoNCmFuZCBrZXJuZWwgaXNzdWVzIGhl
cmUNCg0KaHR0cHM6Ly9naXRodWIuY29tL3RoZXNvZnByb2plY3QvbGludXgvaXNzdWVzDQoNClRo
ZSBuZXh0IHZlcnNpb24gd2lsbCBiZSB2MS44IGR1ZSBieSB0aGUgZW5kIG9mIEp1bmUuDQoNClRo
YW5rcw0KDQpMaWFtDQoNClsxXSBQcmVsaW1pbmFyeSBzdXBwb3J0IGZvciBvdGhlciBwbGF0Zm9y
bXMgY2FuIGJlIGVuYWJsZWQgYnkgdXNpbmcgU09GDQphcyBhIFplcGh5ciBtb2R1bGUgKGZvciBa
ZXBoeXIgc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMgYW5kIHBsYXRmb3JtcykuIA0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCkludGVsIENvcnBvcmF0aW9uIChVSykgTGltaXRlZApSZWdpc3RlcmVkIE5vLiAxMTM0OTQ1
IChFbmdsYW5kKQpSZWdpc3RlcmVkIE9mZmljZTogUGlwZXJzIFdheSwgU3dpbmRvbiBTTjMgMVJK
ClZBVCBObzogODYwIDIxNzMgNDcKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5
IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGlu
dGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJz
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNp
cGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgo=

