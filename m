Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B00AAEB8CA
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:23:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC59601D3;
	Fri, 27 Jun 2025 15:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC59601D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030608;
	bh=oPxXECP0vNLTdF8XjPYSrtRdqASq+EAnlOof4UdMjt0=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VxYH9Lov1g52NH6Afr0Ps5yLm0dIMyzLWuiTF+oOevc8XgWZ4h792FQA34DQ9UREg
	 DqxHgr2pXlY63wEwvO30/VAcsS5DLsS6iF5N6O2D9fMMmMN7B22Wtm2dXlp/6d/10/
	 C/1CPQBJBaqGkwa/gV01fOncF5vuw3+FaMR7opU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42477F805E9; Fri, 27 Jun 2025 15:22:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 335B0F805EB;
	Fri, 27 Jun 2025 15:22:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81034F804B2; Fri, 20 Jun 2025 10:16:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com
 [207.171.188.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B16F7F800D2
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 10:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B16F7F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256
 header.s=amazoncorp2 header.b=CCbYROYY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1750407391; x=1781943391;
  h=from:to:subject:date:message-id:mime-version;
  bh=Axpn+quSX5I5k8PaXB5rtkLN1aa74KTMBZZuHqOXewY=;
  b=CCbYROYYEZ9Pe/vgpUnlbdGcugPeIIKIe6P7VHJKD/MG7olF+7+xDGpt
   Yrmd+A4EDFW551j8iEnj6hRAPdJBRhayFcszdh1Xgq07TnzQumEdrcJwZ
   TIWXu43VxWeKPoczf8nwuRTlievOxqG9ED3/765d/E4gLTyRfG4DHB+Mb
   N9FBpCquL+kE/jqu2UkiGtPvZRLHCKUYAkUzohghkl4lpckMqvts6zbKX
   aTBGupMw62jAHr8BMDrwQp3M/Bb1uvwwEjFqspB4nMVZAKGJF4E3883tE
   wlLEwu5HjcfPhthx7woHb65sQpttl5sUBL9MhhBNiyPd1F8RzecVWdQoA
   g==;
X-IronPort-AV: E=Sophos;i="6.16,251,1744070400";
   d="scan'208,217";a="32833802"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9105.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 08:16:15 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.10.100:9055]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.15.147:2525]
 with esmtp (Farcaster)
 id a2c85cc1-6c90-48ae-b202-f80b33b63166;
 Fri, 20 Jun 2025 08:16:14 +0000 (UTC)
X-Farcaster-Flow-ID: a2c85cc1-6c90-48ae-b202-f80b33b63166
Received: from EX19D022EUA002.ant.amazon.com (10.252.50.201) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 20 Jun 2025 08:16:14 +0000
Received: from EX19D022EUA002.ant.amazon.com (10.252.50.201) by
 EX19D022EUA002.ant.amazon.com (10.252.50.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 20 Jun 2025 08:16:14 +0000
Received: from EX19D022EUA002.ant.amazon.com ([fe80::7f87:7d63:def0:157d]) by
 EX19D022EUA002.ant.amazon.com ([fe80::7f87:7d63:def0:157d%3]) with mapi id
 15.02.1544.014; Fri, 20 Jun 2025 08:16:13 +0000
From: "Verma, Sandeep" <sandpver@amazon.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Handling Lost Audio IRQs in ALSA: Triggering XRUN on Timer Detection?
Thread-Topic: Handling Lost Audio IRQs in ALSA: Triggering XRUN on Timer
 Detection?
Thread-Index: AQHb4buWON1/XMhJLU6cA98NWJHOZg==
Date: Fri, 20 Jun 2025 08:16:13 +0000
Message-ID: <C37A90C9-7879-4BCC-AD70-3CFC36F595B5@amazon.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.95.26.46]
MIME-Version: 1.0
X-MailFrom: prvs=259a9facd=sandpver@amazon.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4AL224J4MOW367DKST7QMDWZZWVE2KMS
X-Message-ID-Hash: 4AL224J4MOW367DKST7QMDWZZWVE2KMS
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:22:30 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4AL224J4MOW367DKST7QMDWZZWVE2KMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgYWxsLA0KDQpJ4oCZbSBjdXJyZW50bHkgaW52ZXN0aWdhdGluZyBhIHNwb3JhZGljIGlzc3Vl
IGluIG91ciBzeXN0ZW0gd2hlcmUgYW4gYXVkaW8gaW50ZXJydXB0IGlzIG9jY2FzaW9uYWxseSBs
b3N0LiBXaGVuIHRoaXMgaGFwcGVucywgQUxTQSBkZXRlY3RzIHRoZSBhbm9tYWx5IChwcmVzdW1h
Ymx5IHRocm91Z2ggaXRzIGludGVybmFsIHRpbWVzdGFtcCBvciBkZWxheSBkZXRlY3Rpb24pLCBi
dXQgaXQgZG9lc27igJl0IGFwcGVhciB0byB0YWtlIGNvcnJlY3RpdmUgYWN0aW9u4oCUbGVhZGlu
ZyB0byBwZXJzaXN0ZW50IGF1ZGlvIGppdHRlciBhZnRlcndhcmQuIFRvIGFkZHJlc3MgdGhpcywg
SeKAmW0gY29uc2lkZXJpbmcgaW1wbGVtZW50aW5nIGEgbWVjaGFuaXNtIGluIG91ciBkcml2ZXIg
b3IgcGxhdGZvcm0gbGF5ZXIgdGhhdCB1c2VzIGEgdGltZXIgdG8gY2hlY2sgaWYgdGhlIGV4cGVj
dGVkIGF1ZGlvIGludGVycnVwdCBoYXNu4oCZdCBhcnJpdmVkIHdpdGhpbiBhIGNlcnRhaW4gdGlt
ZWZyYW1lIChlLmcuLCAyeCB0aGUgcGVyaW9kIHNpemUpLiBJZiB0aGlzIGNvbmRpdGlvbiBpcyBt
ZXQsIEkgcGxhbiB0byBleHBsaWNpdGx5IHRyaWdnZXIgYW4gWFJVTiB0byByZXNldCB0aGUgcGlw
ZWxpbmUgYW5kIHJlY292ZXIgY2xlYW5seS4NCg0KTXkgcXVlc3Rpb25zIGFyZToNCmEuICAgIElz
IHRoaXMgYW4gYWNjZXB0YWJsZSBhbmQg4oCcQUxTQS1mcmllbmRseeKAnSB3YXkgdG8gaGFuZGxl
IGxvc3QgSVJRcz8NCmIuICAgIElmIHRoaXMgaXMgYSByZWFzb25hYmxlIGFwcHJvYWNoLCB3aHkg
ZG9lc27igJl0IEFMU0EgZG8gdGhpcyBieSBkZWZhdWx0Pw0KYy4gICAgSXMgdGhlcmUgYSBiZXR0
ZXIgb3IgcmVjb21tZW5kZWQgd2F5IHdpdGhpbiB0aGUgQUxTQSBmcmFtZXdvcmsgdG8gZGV0ZWN0
IGFuZCByZWNvdmVyIGZyb20gc3VjaCBtaXNzZWQgaW50ZXJydXB0cz8NCg0KSeKAmWQgYXBwcmVj
aWF0ZSBhbnkgZ3VpZGFuY2Ugb3Igc3VnZ2VzdGlvbnMuIElmIHRoaXMga2luZCBvZiB0aW1lci1i
YXNlZCByZWNvdmVyeSB3b3VsZCBiZSBicm9hZGx5IHVzZWZ1bCwgSeKAmWQgYWxzbyBiZSBoYXBw
eSB0byBleHBsb3JlIHdoZXRoZXIgaXQgY291bGQgYmUgcHJvcG9zZWQgdXBzdHJlYW0uDQoNClRo
YW5rcywNClNhbmRlZXANCg0KDQo=
