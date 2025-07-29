Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 608F7B14A36
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Jul 2025 10:37:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF206021B;
	Tue, 29 Jul 2025 10:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF206021B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753778265;
	bh=pWTnWhQ+3/12+BdTL1iSN+HwQw5TH34LJSNXovHG1PY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qrgIWDXUX9hMgopTeaAQMKd/Fe96raTXNQlNNueecBEJAJ/yE6ony72vl2nzF8uYv
	 vrlmhe+gvqZQb+bGdBAREI+ZbKEYh5rcultLNRc59Vk1WzdF948r/SrVT+SqByefUS
	 PxrZvGKeLdp083Hfgrose4aDvbRhFdD8cgtEXNUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC552F805C2; Tue, 29 Jul 2025 10:37:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5676F805C2;
	Tue, 29 Jul 2025 10:37:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D0C8F80254; Tue, 29 Jul 2025 10:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B11DCF80124
	for <alsa-devel@alsa-project.org>; Tue, 29 Jul 2025 10:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B11DCF80124
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1856abf8d5691700-webhooks-bot@alsa-project.org>
In-Reply-To: <1856abf8d2fd4900-webhooks-bot@alsa-project.org>
References: <1856abf8d2fd4900-webhooks-bot@alsa-project.org>
Subject: Support ohos build
Date: Tue, 29 Jul 2025 10:36:33 +0200 (CEST)
Message-ID-Hash: 27A6KR37AVPS6AHGWZH4KI3N5FWOITMH
X-Message-ID-Hash: 27A6KR37AVPS6AHGWZH4KI3N5FWOITMH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27A6KR37AVPS6AHGWZH4KI3N5FWOITMH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtbGliIGlzc3VlICM0NjYgd2FzIG9wZW5lZCBmcm9tIHd5anN0cm9u
ZzoKCkhlbGxvLAoKQUxTQSBpcyBhbiBpbXBvcnRhbnQgYXVkaW8gYXJjaGl0ZWN0dXJlIGluIHRo
ZSBMaW51eCBzeXN0ZW0uIFdpdGggaXQsIGRldmVsb3BlcnMgY2FuIGNhbGwgTGludXggc3lzdGVt
IGludGVyZmFjZXMgaW4gdGhlaXIgcHJvZ3JhbXMgdG8gY29udHJvbCBhbmQgbWFuYWdlIHRoZSB1
bmRlcmx5aW5nIG9wZXJhdGluZyBzeXN0ZW0uIFRoYW5rcyB0byBpdHMgY29tYmluYXRpb24gb2Yg
aGlnaCBlZmZpY2llbmN5IGFuZCBlYXNlIG9mIHVzZSwgQUxTQSBpcyBhbHNvIHN1aXRhYmxlIGZv
ciBlbWJlZGRlZCBkZXZpY2VzLCB3aGljaCBoaWdobHkgYWxpZ25zIHdpdGggT3Blbkhhcm1vbnkn
cyBwaGlsb3NvcGh5IG9mIHN1cHBvcnRpbmcgZGl2ZXJzZSBkZXZpY2VzIOKAlCBjdXJyZW50bHks
IGl0IGhhcyBiZWVuIHdpZGVseSB1c2VkIGluIHRoZSBmaWVsZCBvZiBtb2JpbGUgYXBwbGljYXRp
b24gZGV2ZWxvcG1lbnQgZm9yIE9wZW5IYXJtb255LgoKV2Ugd2lsbCBzdWJtaXQgdGhlIGFkYXB0
YXRpb24gY29kZSB2aWEgYSBQdWxsIFJlcXVlc3QgKFBSKSBhcyBzb29uIGFzIHBvc3NpYmxlLiBU
aGlzIGlzc3VlIGlzIGNyZWF0ZWQgdG8gY29uZHVjdCBpbi1kZXB0aCBkaXNjdXNzaW9ucyB3aXRo
IHRoZSBjb21tdW5pdHkgb24gdGhlIGludGVncmF0aW9uIG9mIHRoZSBhZGFwdGF0aW9uIGNvZGUu
IFdlIHNpbmNlcmVseSB3ZWxjb21lIHlvdXIgdmFsdWFibGUgc3VnZ2VzdGlvbnMuIFRoYW5rIHlv
dS4KCklzc3VlIFVSTCAgICAgOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2Et
bGliL2lzc3Vlcy80NjYKUmVwb3NpdG9yeSBVUkw6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXBy
b2plY3QvYWxzYS1saWIK
