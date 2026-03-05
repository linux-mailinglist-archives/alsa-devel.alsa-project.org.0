Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFTHNiEIqmmVJwEAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 23:48:01 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 719D421910A
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 23:48:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84847602BA;
	Thu,  5 Mar 2026 23:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84847602BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772750880;
	bh=vk4vbsFXT6KEhwUIJzJGEIjwbT+2lQlL8+pM80nEsNo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MWfrYLEscJdhiyNGeltXmJB5zOm3m1jxrP4Q6jpDMnE/QiAkrX21Ny1duUvbO5Vfv
	 T1V+RNGe+CUX6BGkkVFGC6mFk7hBxpQ5qRTbrYxa59NUfWLTG6sl/gjy3jrBEn/47j
	 LqJStHY82L1kT7oQphq3k6SFGhIJqDPqPbF+2H8E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E53FEF805F0; Thu,  5 Mar 2026 23:47:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6788DF80224;
	Thu,  5 Mar 2026 23:47:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDC67F8025A; Thu,  5 Mar 2026 23:47:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A6CFF800F3
	for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2026 23:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A6CFF800F3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <189a137dff66e500-webhooks-bot@alsa-project.org>
In-Reply-To: <189a137dff3bd600-webhooks-bot@alsa-project.org>
References: <189a137dff3bd600-webhooks-bot@alsa-project.org>
Subject: sofhdadsp: missing conf.d symlink causes DMIC invisible on Raptor
 Lake SOF HDA DSP laptops
Date: Thu,  5 Mar 2026 23:47:18 +0100 (CET)
Message-ID-Hash: UTQQDZGBZIWY42P72FWYVSJZLUYTAB22
X-Message-ID-Hash: UTQQDZGBZIWY42P72FWYVSJZLUYTAB22
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation;
 nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size;
 news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UTQQDZGBZIWY42P72FWYVSJZLUYTAB22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 719D421910A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alsa-project.org,none];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Action: no action

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzcxNCB3YXMgb3BlbmVkIGZyb20gYnVu
YWVuOgoKIyMgSGFyZHdhcmUKLSBMZW5vdm8gVGhpbmtQYWQgWDEgQ2FyYm9uIEdlbiAxMSAoMjFI
TTAwMkNVUykKLSBLZXJuZWw6IDYuMTkuNS0xLWRlZmF1bHQgKG9wZW5TVVNFIFR1bWJsZXdlZWQp
Ci0gU09GIGRyaXZlcjogc29mLWF1ZGlvLXBjaS1pbnRlbC10Z2wKLSBTT0YgZmlybXdhcmU6IGlu
dGVsL3NvZi9zb2YtcnBsLnJpLCB2ZXJzaW9uIDI6MjowLTU3ODY0Ci0gYWxzYS11Y20tY29uZjog
MS4yLjE1LjMKCiMjIFByb2JsZW0KSW50ZXJuYWwgRE1JQyBpcyBjb21wbGV0ZWx5IGludmlzaWJs
ZSB0byBQaXBlV2lyZS9XaXJlUGx1bWJlci4KTm8gbWljcm9waG9uZSBpbnB1dCBhcHBlYXJzIGlu
IHNvdW5kIHNldHRpbmdzLgoKVGhlIERNSUMgaGFyZHdhcmUgaXMgcHJlc2VudCBhbmQgZnVuY3Rp
b25hbCBhdCB0aGUgcmF3IEFMU0EgbGV2ZWw6CgogICAgJCBhcmVjb3JkIC1sCiAgICBjYXJkIDA6
IHNvZmhkYWRzcCBbc29mLWhkYS1kc3BdLCBkZXZpY2UgNjogRE1JQyAoKikgW10KICAgIGNhcmQg
MDogc29maGRhZHNwIFtzb2YtaGRhLWRzcF0sIGRldmljZSA3OiBETUlDMTZrSHogKCopIFtdCgpC
dXQgd3BjdGwgc3RhdHVzIHNob3dlZCBubyBkaWdpdGFsIG1pY3JvcGhvbmUgc291cmNlIGF0IGFs
bC4KCiMjIFJvb3QgQ2F1c2UKVGhlIGNhcmQgcmVwb3J0cyBpdHMgQUxTQSBJRCB3aXRob3V0IGh5
cGhlbnM6CgogICAgJCBjYXQgL3Byb2MvYXNvdW5kL2NhcmQwL2lkCiAgICBzb2ZoZGFkc3AKClVD
TTIgY29uZi5kIGxvb2t1cCBpcyBhbiBleGFjdCBzdHJpbmcgbWF0Y2ggb24gY2FyZCBJRC4gVGhl
IHJlcG8Kc2hpcHMgY29uZi5kL3NvZi1oZGEtZHNwLyAod2l0aCBoeXBoZW5zKSBidXQgdGhlcmUg
aXMgbm8KY29uZi5kL3NvZmhkYWRzcC8gKHdpdGhvdXQgaHlwaGVucykgZW50cnkuIFRoZSBsb29r
dXAgc2lsZW50bHkKZmFpbHMsIFdpcmVQbHVtYmVyIGxvYWRzIG5vIFVDTSBwcm9maWxlLCBhbmQg
dGhlIERNSUMgaXMgbmV2ZXIKYWN0aXZhdGVkLgoKIyMgRml4CiAgICBzdWRvIGxuIC1zIC91c3Iv
c2hhcmUvYWxzYS91Y20yL2NvbmYuZC9zb2YtaGRhLWRzcCBcCiAgICAgICAgICAgICAgIC91c3Iv
c2hhcmUvYWxzYS91Y20yL2NvbmYuZC9zb2ZoZGFkc3AKICAgIHN5c3RlbWN0bCAtLXVzZXIgcmVz
dGFydCB3aXJlcGx1bWJlcgoKQWZ0ZXIgdGhpcywgd3BjdGwgc3RhdHVzIGNvcnJlY3RseSBzaG93
czoKLSBSYXB0b3IgTGFrZS1QL1UvSCBjQVZTIERpZ2l0YWwgTWljcm9waG9uZSDinJMKLSBSYXB0
b3IgTGFrZS1QL1UvSCBjQVZTIFN0ZXJlbyBNaWNyb3Bob25lIOKckwoKIyMgU3VnZ2VzdGVkIEZp
eApBZGQgdG8gdGhlIHJlcG86CiAgICB1Y20yL2NvbmYuZC9zb2ZoZGFkc3AgLT4gc29mLWhkYS1k
c3AvCgpUaGlzIGxpa2VseSBhZmZlY3RzIGFsbCBSYXB0b3IgTGFrZSBsYXB0b3BzIHdoZXJlIHRo
ZSBrZXJuZWwKcmVwb3J0cyB0aGUgY2FyZCBJRCBhcyBzb2ZoZGFkc3AgcmF0aGVyIHRoYW4gc29m
LWhkYS1kc3AuCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVj
dC9hbHNhLXVjbS1jb25mL2lzc3Vlcy83MTQKUmVwb3NpdG9yeSBVUkw6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZgo=
