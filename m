Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFFDB47991
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Sep 2025 10:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E777760211;
	Sun,  7 Sep 2025 10:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E777760211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757233094;
	bh=CoAlFnvlpedN7xvpGnNE3sDSxYqAbrD21LxIdZdpxPk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IQLHNtbu80oMCWABpMmiVawZazy9MVWZxTztxyr+a7m6qtDrthaCc76oORAyLhVmW
	 S+B4yLapvcyGmQFHtl/USGtAKiWwSvOYa7F+cu61PEetj+jYWCZOYq2AAjtwQgYl2K
	 lRZ1rQaN87VF+11vVXB9BMr1sc6IB49M2psX0LYs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1314BF805D2; Sun,  7 Sep 2025 10:17:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45DF3F80548;
	Sun,  7 Sep 2025 10:17:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEF3DF80548; Sun,  7 Sep 2025 10:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D4E70F80153
	for <alsa-devel@alsa-project.org>; Sun,  7 Sep 2025 10:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4E70F80153
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1862f22591d6c600-webhooks-bot@alsa-project.org>
In-Reply-To: <1862f22590f9a900-webhooks-bot@alsa-project.org>
References: <1862f22590f9a900-webhooks-bot@alsa-project.org>
Subject: Mic from audio jack not work on Dell Precision M4800. Please add mic
 drivers
Date: Sun,  7 Sep 2025 10:17:29 +0200 (CEST)
Message-ID-Hash: FINRKXR6TJ7PPULZQWYHL7TYJGCJ6KCE
X-Message-ID-Hash: FINRKXR6TJ7PPULZQWYHL7TYJGCJ6KCE
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FINRKXR6TJ7PPULZQWYHL7TYJGCJ6KCE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtbGliIGlzc3VlICM0NzYgd2FzIGVkaXRlZCBmcm9tIFNsYXZvbWly
OToKCkhlbGxvLApvbiBteSBEZWxsIFByZWNpc2lvbiBNNDgwMCBub3Qgd29yayBtaWMgb24gaGVh
ZHNldCBLb3NzIENTMTAwIGF1ZGlvIGphY2sgKG5vbiBVU0IpIHZlcnNpb24uClBsZWFzZSBhZGQg
bWljIGRyaXZlcnMuCgpbRGVsbCBQcmVjaXNpb24gTTQ4MDAgXShodHRwczovL3d3dy5nb29nbGUu
Y29tL3NlYXJjaD9xPSUwRCUwQURlbGwrUHJlY2lzaW9uK000ODAwJTBEJTBBJnNjYV9lc3Y9ZTYx
OGU1ZTQzNDFmYjlmNCYpCgpbSGVhZHNldCBLb3NzIENTMTAwXShodHRwczovL3d3dy5rYXVmbGFu
ZC5zay9wcm9kdWN0LzUzNzMwOTEvKQoKSSB1c2UgZHVhbCBib290LiBPbiBXaW5kb3dzIDExIHdv
cmsgbWljIG9ubHkgYWZ0ZXIgaW5zdGFsbCBkcml2ZXJzIGZyb20gRGVsbCB3ZWJzaXRlLgoKT24g
RGVsbCB3ZWJzaXRlIGFyZSBkcml2ZXJzIGZvciBMaW51eCBmb3IgZXh0cmVtZWx5IG9sZCB2ZXJz
aW9uIG9mIFVidW50dTogVWJ1bnR1wq4gMTIuMDQKCk1vcmUgaW5mb3JtYXRpb24gYWJvdXQgYnVn
IGhlcmUKaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2UvYWxzYS1kcml2
ZXIvK2J1Zy8yMTIyMjY5CgpQbGVhc2UgYWRkIG1pYyBkcml2ZXJzLgpUaGFua3MKCklzc3VlIFVS
TCAgICAgOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtbGliL2lzc3Vlcy80
NzYKUmVwb3NpdG9yeSBVUkw6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS1s
aWIK
