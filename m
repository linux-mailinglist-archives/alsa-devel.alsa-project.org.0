Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F99B8DBAF
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Sep 2025 15:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 081BF601FE;
	Sun, 21 Sep 2025 15:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 081BF601FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758461054;
	bh=SauT7zQBiQvnciFswXu6nhUKgPGXMSDxAzhVLYLarzI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VrguWfOmCgmA2Gl6F6/Tuk6awsV9EzkFATKrzCpSAUHyCHgXRnboKuQAgENH4rxBO
	 asIxdtINSwuSRAhnSLWNDLAS5TuFvd+1UitJUAUangN8y7G1fNWqo6kxHxc9gmueQ3
	 MWXbnpz0NWI42KtnxI/lvDy9HyYzvDEMXbxAfDtM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82C15F805C6; Sun, 21 Sep 2025 15:23:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23BC7F805C6;
	Sun, 21 Sep 2025 15:23:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 741EFF80526; Sun, 21 Sep 2025 15:23:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DA78F8016E
	for <alsa-devel@alsa-project.org>; Sun, 21 Sep 2025 15:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DA78F8016E
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18674ef8aff3c300-webhooks-bot@alsa-project.org>
In-Reply-To: <18674ef8afbd0900-webhooks-bot@alsa-project.org>
References: <18674ef8afbd0900-webhooks-bot@alsa-project.org>
Subject: ASUS Proart P16 - Realtek ALC245 not detected properly after kernel
 6.15 - worked perfectly with earlier kernels
Date: Sun, 21 Sep 2025 15:23:31 +0200 (CEST)
Message-ID-Hash: JAUL33YYTBPIZTYSZK4SAUKTPP5VWBEX
X-Message-ID-Hash: JAUL33YYTBPIZTYSZK4SAUKTPP5VWBEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAUL33YYTBPIZTYSZK4SAUKTPP5VWBEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzYxNSB3YXMgZWRpdGVkIGZyb20gU25l
YWt5TGl0dGxlbWFuOgoKSGV5IHRoZXJlLCBhcyBbcmVwb3J0ZWQgaW4gdGhlIGFyY2ggZm9ydW1z
XShodHRwczovL2Jicy5hcmNobGludXgub3JnL3ZpZXd0b3BpYy5waHA/aWQ9MzA3NTQwKSwgdGhl
IEFMQzI0NSAoYW5kIENpcnJ1cyBMb2dpYyBhbXAgQ1MzNUw1NikgYXJlIG5vdCBkZXRlY3RlZCBw
cm9wZXJseSBhZnRlciBrZXJuZWwgNi4xNS4gQW55dGhpbmcgYmVsb3cgNi4xNC45IHdvcmtzIHBl
cmZlY3RseSBmaW5lLgoKVGhlIGNoaXAgcmV2ZXJ0cyB0byB0aGUgInByb2F1ZGlvIiBwcm9maWxl
LCB3aXRoIG5vIG90aGVyIG9wdGlvbiwgYW5kIHRoZSBjb21tYW5kICJhbHNhdWNtIGxpc3RjYXJk
cyIgcmV0dXJucyBhbiBlbXB0eSBsaXN0LgoKV2l0aCBvbGRlciBrZXJuZWxzLCB0aGUgY29tbWFu
ZCByZXR1cm5lZDoKYCAwOiBodzoxCiAgICBIREEgTlZpZGlhIGF0IDB4ZGQwODAwMDAgaXJxIDE0
MwogIDE6IGh3OjIKICAgIEhELUF1ZGlvIEdlbmVyaWMgYXQgMHhkZDdjODAwMCBpcnEgMTQ0CiAg
MjogaHc6MwogICAgSEQtQXVkaW8gR2VuZXJpYyBhdCAweGRkN2MwMDAwIGlycSAxNDUKICAzOiBo
dzo0CiAgICBBU1VTVGVLQ09NUFVURVJJTkMuLVByb0FydFAxNkg3NjA2V0lfSDc2MDZXSS0xLjAt
SDc2MDZXSWAKCmFuZCBJIGhhZCBhY2Nlc3MgdG8gdGhlIGNvcnJlY3QgYXVkaW8gcHJvZmlsZXMg
d2l0aCBwaXBld2lyZS4KCldpbGxpbmcgdG8gc3VibWl0IGFueXRoaW5nIHRoYXQgbWlnaHQgaGVs
cCwgdG8gZml4IHRoaXMuIENoZWVycy4KCkhlcmUncyB0aGUgY2hpcCBpbmZvIGluIHRoYXQgc3Bl
Y2lmaWMgbGFwdG9wOgpgNjY6MDAuNiBBdWRpbyBkZXZpY2UgWzA0MDNdOiBBZHZhbmNlZCBNaWNy
byBEZXZpY2VzLCBJbmMuIFtBTURdIEZhbWlseSAxN2gvMTloLzFhaCBIRCBBdWRpbyBDb250cm9s
bGVyIFsxMDIyOjE1ZTNdIArCoMKgwqDCoMKgwqDCoERldmljZU5hbWU6IFJlYWx0ZWsgQUxDMjQ1
IArCoMKgwqDCoMKgwqDCoFN1YnN5c3RlbTogQVNVU1RlSyBDb21wdXRlciBJbmMuIERldmljZSBb
MTA0MzoxZTYzXWAKCklzc3VlIFVSTCAgICAgOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9q
ZWN0L2Fsc2EtdWNtLWNvbmYvaXNzdWVzLzYxNQpSZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRo
dWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1jb25mCg==
