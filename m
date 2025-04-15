Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C64A894B8
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Apr 2025 09:18:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CCAD69634;
	Tue, 15 Apr 2025 09:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CCAD69634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744701515;
	bh=i7cRjZzxpJZXlfj8qnkXBARk1RJQG4ccLJ4CDQl/Pak=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kmp7N447G6eAfdNeetbRhNII4/rH6q0urYivZUKATnmUd2m1xONIYHsNoD63NZrLA
	 zsn9k9ON2hKmI/S5Pm0TQf6Xx009fTlGQmpKyrdiGbP1+uTfpOMYFY05oK7mk1Y/47
	 o9q3l2Oe2KHJJcZ492WIh0gZ1OXB82O22yPoxnlA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8209FF805D4; Tue, 15 Apr 2025 09:18:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB15F805CA;
	Tue, 15 Apr 2025 09:18:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ADA0F8021D; Tue, 15 Apr 2025 09:18:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EFEBF80075
	for <alsa-devel@alsa-project.org>; Tue, 15 Apr 2025 09:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EFEBF80075
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18366cc26eb87000-webhooks-bot@alsa-project.org>
In-Reply-To: <18366cc26db3cf00-webhooks-bot@alsa-project.org>
References: <18366cc26db3cf00-webhooks-bot@alsa-project.org>
Subject: 1.2.14: SetuptoolsDeprecationWarning due to the use of `sys.exit(0)`
Date: Tue, 15 Apr 2025 09:18:10 +0200 (CEST)
Message-ID-Hash: EWVUT5HMJVJZQ2OJ72EALIL37VNX32JN
X-Message-ID-Hash: EWVUT5HMJVJZQ2OJ72EALIL37VNX32JN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWVUT5HMJVJZQ2OJ72EALIL37VNX32JN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtcHl0aG9uIGlzc3VlICMxOCB3YXMgb3BlbmVkIGZyb20gZHZ6cnY6
CgpIaSEg8J+RiyAKCkkgcGFja2FnZSB0aGlzIHByb2plY3QgZm9yIEFyY2ggTGludXguCgpEdXJp
bmcgdXBkYXRlIHRvIDEuMi4xNCBJIG5vdGljZWQgdGhhdCBzZXR1cHRvb2xzIG5vdyByYWlzZXMg
dGhlIGZvbGxvd2luZyB3YXJuaW5nOgoKYGBgCi91c3IvbGliL3B5dGhvbjMuMTMvc2l0ZS1wYWNr
YWdlcy9zZXR1cHRvb2xzL2J1aWxkX21ldGEucHk6NTIyOiBTZXR1cHRvb2xzRGVwcmVjYXRpb25X
YXJuaW5nOiBSdW5uaW5nIGBzZXR1cC5weWAgZGlyZWN0bHkgYXMgQ0xJIHRvb2wgaXMgZGVwcmVj
YXRlZC4KISEKCiAgICAgICAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKICAgICAgICBQbGVhc2Ug
YXZvaWQgdXNpbmcgYHN5cy5leGl0KDApYCBvciBzaW1pbGFyIHN0YXRlbWVudHMgdGhhdCBkb24n
dCBmaXQgaW4gdGhlIHBhcmFkaWdtIG9mIGEgY29uZmlndXJhdGlvbiBmaWxlLgoKICAgICAgICBT
ZWUgaHR0cHM6Ly9ibG9nLmdhbnNzbGUuaW8vYXJ0aWNsZXMvMjAyMS8xMC9zZXR1cC1weS1kZXBy
ZWNhdGVkLmh0bWwgZm9yIGRldGFpbHMuCiAgICAgICAgKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioK
CiEhCiAgc3VwZXIoKS5ydW5fc2V0dXAoc2V0dXBfc2NyaXB0PXNldHVwX3NjcmlwdCkKYGBgCgpU
aGlzIGFwcGVhcnMgdG8gYmUgdHJpZ2dlcmVkIGJ5IHRoZSBgc3lzLmV4aXQoMClgIGNhbGwgaW4g
c2V0dXAucHk6Cmh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS1weXRob24vYmxv
Yi8yMGIyYjM5OTlmMjRhZjQ2MjgxNWI5Yzg2ZTk2NzY0M2NjZDMwMDM3L3NldHVwLnB5I0w3NC1M
NzUKCihTZXR1cHRvb2xzIG5vdyBvZmZlcnMgb25lIG9mIHRoZSB2YXJpb3VzIFBFUDUxNyBidWls
ZCBiYWNrZW5kcyBhbmQgY2FsbGluZyBzZXR1cC5weSBkaXJlY3RseSBhcyBhIHNjcmlwdCBpcyBk
ZXByZWNhdGVkKS4KCkxvb2tpbmcgYXQgdGhlIGZpbGUgSSBub3RpY2VkIHRoYXQgdGhlcmUgYXJl
IHN0aWxsIGNvbmRpdGlvbmFscyB0aGF0IGFjY29tbW9kYXRlIFB5dGhvbjI6CgpodHRwczovL2dp
dGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtcHl0aG9uL2Jsb2IvMjBiMmIzOTk5ZjI0YWY0NjI4
MTViOWM4NmU5Njc2NDNjY2QzMDAzNy9zZXR1cC5weSNMNzctTDgwCgpUaG9zZSBzaG91bGQgYmUg
cmVtb3ZlZCwgYXMgdGhlIHNjcmlwdCBpdHNlbGYgaXMgbWFya2VkIGFzIFB5dGhvbjMgKGFuZCB3
ZWxsIG9mIGNvdXJzZSBiZWNhdXNlIFB5dGhvbjIgaXMgbG9uZyBkaXNjb250aW51ZWQg8J+YhSku
CgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXB5
dGhvbi9pc3N1ZXMvMTgKUmVwb3NpdG9yeSBVUkw6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXBy
b2plY3QvYWxzYS1weXRob24K
