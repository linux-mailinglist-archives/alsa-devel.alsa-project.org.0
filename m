Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28901A3523E
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2025 00:36:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0BFF6025E;
	Fri, 14 Feb 2025 00:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0BFF6025E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739489801;
	bh=essvWTaaW6dHa4NwAyTKmauWHpwmsO/VOBZoAWU/PHg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GdLFoqAow/RhCGmjMdKWFSySKkZhH9oQbW1GEVQ7JBDzaz+dRgSkVoUJZasdHjykb
	 XyR1ht4/2hiNaiUM6XqxRhwbk4EvlHgJGje4o3WdSoteHA/QzBeq99rUY1FMi/Xdwn
	 bsHfN+xdAvAJ/9F1BUTfp7qhZrpxNJgBO6etk5D4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB74EF805C3; Fri, 14 Feb 2025 00:36:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2202DF805B4;
	Fri, 14 Feb 2025 00:36:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 830D7F8016E; Fri, 14 Feb 2025 00:36:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_00,DOS_BODY_HIGH_NO_MID,
	MISSING_DATE,MISSING_MID,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B40EF800BF
	for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2025 00:36:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B40EF800BF
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739489760198934078-webhooks-bot@alsa-project.org>
References: <1739489760198934078-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add support for RME Fireface UCX II
Message-Id: <20250213233602.830D7F8016E@alsa1.perex.cz>
Date: Fri, 14 Feb 2025 00:36:02 +0100 (CET)
Message-ID-Hash: OPGAV4UWOBABNCCAK2IBFHVD6CYZEEDV
X-Message-ID-Hash: OPGAV4UWOBABNCCAK2IBFHVD6CYZEEDV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPGAV4UWOBABNCCAK2IBFHVD6CYZEEDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgcHVsbCByZXF1ZXN0ICM1MDkgd2FzIGVkaXRlZCBm
cm9tIGlsbGRlZmluZWQ6CgpUaGlzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFJNRSBGaXJlZmFjZSBV
Q1ggSUkgaW50ZXJmYWNlLg0KDQpVc2VyIG1hbnVhbDogPGh0dHBzOi8vcm1lLWF1ZGlvLmRlL2Rv
d25sb2Fkcy9mZmFjZV91Y3gyX2UucGRmPg0KDQpUaGUgaW50ZXJmYWNlIHByb3ZpZGVzIDIwIHBs
YXliYWNrIGFuZCBjYXB0dXJlIGNoYW5uZWxzIGVhY2g6DQotIGNoYW5uZWxzICAwICB0byAgNyBh
cmUgYW5hbG9nIGlucHV0cyBhbmQgb3V0cHV0cw0KLSBjaGFubmVscyAgOCBhbmQgIDkgYXJlIFMv
UERJRiB2aWEgY29heA0KLSBjaGFubmVscyAxMCBhbmQgMTEgYXJlIEFFUy9FQlUgb3IgUy9QRElG
IHZpYSBYTFINCi0gY2hhbm5lbHMgMTIgIHRvIDE5IGFyZSBBREFUICg4IGNoYW5uZWxzKSBvciBT
L1BESUYgKDEyIGFuZCAxMykgdmlhIFRPU0xJTksNCg0KVGhlIGludGVyZmFjZSBzdXBwb3J0cyB0
aHJlZSBfQ2xhc3MgQ29tcGxpYW50XyBwbGF5YmFjayBtb2RlczoNCg0KLSBfOCBDaC4gKyBQaG9u
ZXNfOg0KICAtIGNoYW5uZWxzIDArMSBhcmUgbWlycm9yZWQgdG8gNis3IChoZWFkcGhvbmVzIEwr
UiksIDgrOSAoUy9QRElGIEwrUikgYW5kIDEyKzEzIChBREFUIDEvMikNCiAgLSBjaGFubmVscyAy
KzMgYXJlIG1pcnJvcmVkIHRvIDEwKzExIChBRVMvRUJVIEwrUikgYW5kIDE0KzE1IChBREFUIDMv
NCkNCiAgLSBjaGFubmVscyA0KzUgYXJlIG1pcnJvcmVkIHRvIDE2KzE3IChBREFUIDUvNikNCiAg
LSBjaGFubmVscyA2KzcgYXJlIG1pcnJvcmVkIHRvIDE4KzE5IChBREFUIDcvOCkNCi0gXzggQ2gu
IFBsYXliYWNrXzoNCiAgLSBjaGFubmVscyAwKzEgYXJlIG1pcnJvcmVkIHRvIDgrOSAoUy9QRElG
IEwrUikgYW5kIDEyKzEzIChBREFUIDEvMikNCiAgLSBjaGFubmVscyAyKzMgYXJlIG1pcnJvcmVk
IHRvIDEwKzExIChBRVMvRUJVIEwrUikgYW5kIDE0KzE1IChBREFUIDMvNCkNCiAgLSBjaGFubmVs
cyA0KzUgYXJlIG1pcnJvcmVkIHRvIDE2KzE3IChBREFUIDUvNikNCiAgLSBjaGFubmVscyA2Kzcg
YXJlIG1pcnJvcmVkIHRvIDE4KzE5IChBREFUIDcvOCkNCi0gXzIwIENoLiBQbGF5YmFja186IG5v
IGNoYW5uZWwgbWlycm9yaW5nDQoNCiMjIyBQaHlzaWNhbCBjb25uZWN0b3IgbGF5b3V0DQoNCiMj
IyMgRnJvbnQNCg0KLSBfMSBNSUMgLyBMSU5FXzogIFhMUiAvIFRSUyDCvCIgY29tYm8sIGJhbGFu
Y2VkIG1vbm8gaW5wdXQsIDQ44oCvViBwaGFudG9tIHBvd2VyDQotIF8yIE1JQyAvIExJTkVfOiAg
WExSIC8gVFJTIMK8IiBjb21ibywgYmFsYW5jZWQgbW9ubyBpbnB1dCwgNDjigK9WIHBoYW50b20g
cG93ZXINCi0gXzMgTElORSAvIElOU1RSLl86IFRSUyDCvCIsIGJhbGFuY2VkIG1vbm8gaW5wdXQN
Ci0gXzQgTElORSAvIElOU1RSLl86IFRSUyDCvCIsIGJhbGFuY2VkIG1vbm8gaW5wdXQNCi0gX/Cf
jqfvuI5fIChoZWFkcGhvbmVzIHN5bWJvbCk6IFRSUyDCvCIsIHVuYmFsYW5jZWQgc3RlcmVvIG91
dHB1dA0KDQojIyMjIEJhY2sNCg0KLSBfTElORSBJTlBVVFMgKEJBTEFOQ0VEKV8gIFtfNV8sIF82
XzsgXzdfLCBfOF9dOiBUUlMgwrwiLCBiYWxhbmNlZCBtb25vIGlucHV0cw0KLSBfTElORSBPVVRQ
VVRTIChCQUxBTkNFRClfIFtfMV8sIF8yXzsgXzNfLCBfNF87IF81XywgXzZfXTogVFJTIMK8Iiwg
YmFsYW5jZWQgbW9ubyBvdXRwdXRzDQotIF9BREFUIElOXzogVE9TTElOSw0KLSBfQURBVCBPVVRf
OiBUT1NMSU5LDQotIF9BRVMvRUJVICYgU1BESUZfOiA54oCQcGluIEQtU3ViIHdpdGggYnJlYWtv
dXQgY2FibGUgKDLigK/DlyBSQ0EgYW5kIDLigK/DlyBYTFIpDQoNClthbHNhLWluZm8udHh0XSho
dHRwczovL2dpdGh1Yi5jb20vdXNlci1hdHRhY2htZW50cy9maWxlcy8xODc5MDk3OC9hbHNhLWlu
Zm8udHh0KQoKUmVxdWVzdCBVUkwgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3Qv
YWxzYS11Y20tY29uZi9wdWxsLzUwOQpQYXRjaCBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIuY29t
L2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1jb25mL3B1bGwvNTA5LnBhdGNoClJlcG9zaXRvcnkgVVJM
OiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYK
