Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37045A2CA29
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 18:29:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754AB60216;
	Fri,  7 Feb 2025 18:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754AB60216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738949380;
	bh=rcy50YwFvWJQs+8D8hU2F29wJfnOzpLDP3QDT2bVTEY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HTGW0oJKyHwNTI3o8TLtSRJlnygrsfZ2Wnsev33wuD4YOEcfjRF7akmbDoH/O6jeo
	 iW1w3zXrLEe9MVgKzo67mgPIUwZqs7wb6b6yfQjYxOudixRo6PePD67a5TwQYjWZny
	 deikzpRiEvf70kUGIGs6gqAPCkPAqiZKGsFwNNss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D03EF805BA; Fri,  7 Feb 2025 18:29:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4795F805BB;
	Fri,  7 Feb 2025 18:29:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 088D7F8021D; Fri,  7 Feb 2025 18:28:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 64B3CF8013D
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 18:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64B3CF8013D
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1738949323455163956-webhooks-bot@alsa-project.org>
References: <1738949323455163956-webhooks-bot@alsa-project.org>
Subject: Soundblaster G8 USB Audio not working correctly
Message-Id: <20250207172856.088D7F8021D@alsa1.perex.cz>
Date: Fri,  7 Feb 2025 18:28:56 +0100 (CET)
Message-ID-Hash: WJSTQJOIAVHUTKHQPNGH3CFERBCWXYAI
X-Message-ID-Hash: WJSTQJOIAVHUTKHQPNGH3CFERBCWXYAI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJSTQJOIAVHUTKHQPNGH3CFERBCWXYAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtbGliIGlzc3VlICM0Mzcgd2FzIG9wZW5lZCBmcm9tIFN0YXJmb3hm
czoKClNvdW5kYmxhc3RlciBHOCB3b3JrcyBwYXJ0bHkgdW5kZXIgTGludXggTWludCAyMi4xIENp
bm5hbW9uLgoKQXVkaW8gcGxheWJhY2sgd29ya3MgaW4gQW5hbG9nIHN0ZXJlbyBvciBEdXBsZXgg
bW9kZSB3aXRoIGhlYWRwaG9uZXMgYW5kIHRoZXNlIGFyZSBkaXNwbGF5ZWQgYXMgU3BlYWtlcnMu
CgpEaWdpdGFsIFNQRElGIE91dCB3b3JrcyBhbmQgYWxzbyB0aGUgc3dpdGNoIGJ1dHRvbiBiZXR3
ZWVuIGhlYWRwaG9uZXMgYW5kIERpZ2l0YWwgb3V0IHRvIGV4dGVybmFsIFNwZWFrZXJzIChvbmx5
IHdpdGggcGlwZXdpcmUgbm90IHdpdGggUHVsc2VhdWRpbykuCgpXaGF0IGRvZXNuJ3Qgd29yayBp
cyB0aGUgRGlyZWN0IE1vZGUgYW5kIGFsbCB0aGUgQ3J5c3RhbGl6ZXIgc3Vycm91bmQgc2V0dGlu
Z3MgYXMgd2VsbCBhcyBvdXRwdXQgaW4gdmlydHVhbCA1LjEgb3IgNy4xIHNvdW5kLgoKTWljcm9w
aG9uZSBkb2VzbsK0dCB3b3JrLCBpZiBpdCBwbHVnZ2VkIGluIGkgaGF2ZSBubyBzb3VuZCBhdCBh
bGwuCgoKW2Fsc2EtaW5mby50eHRdKGh0dHBzOi8vZ2l0aHViLmNvbS91c2VyLWF0dGFjaG1lbnRz
L2ZpbGVzLzE4NzEwMTEyL2Fsc2EtaW5mby50eHQpCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9n
aXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLWxpYi9pc3N1ZXMvNDM3ClJlcG9zaXRvcnkgVVJM
OiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtbGliCg==
