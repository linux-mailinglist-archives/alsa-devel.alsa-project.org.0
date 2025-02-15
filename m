Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B13D5A37139
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Feb 2025 00:31:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFF0E60258;
	Sun, 16 Feb 2025 00:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFF0E60258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739662272;
	bh=j5ldGfo9LNO8lTKTb16ubGI/OH6CqQ30On/1VN3wI+U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WNIHIYZS/Jy9I6S8kIMVwJfYRN1G7xzAYiiIU++JASJAOCXqSwbxWRSEUxOB8z9jW
	 /UMlrFN/35DVE/JG8IkLOXsKe45K5kCbkt5Ztg/jF6F5PyMDTlfKkbyT38MiDmwT6r
	 kFpCF491prcpiJXBJ90rJB1jtIjG6FA6Dx2Er9+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AA8CF805BD; Sun, 16 Feb 2025 00:30:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14C4AF805BD;
	Sun, 16 Feb 2025 00:30:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3244CF8016D; Sun, 16 Feb 2025 00:30:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_00,DOS_BODY_HIGH_NO_MID,
	MISSING_DATE,MISSING_MID,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 88C34F800BD
	for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2025 00:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88C34F800BD
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739662230129708529-webhooks-bot@alsa-project.org>
References: <1739662230129708529-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add support for RME Fireface UCX II
Message-Id: <20250215233032.3244CF8016D@alsa1.perex.cz>
Date: Sun, 16 Feb 2025 00:30:32 +0100 (CET)
Message-ID-Hash: FMGVJACDJHCKSSL5XDKITDLWLKE7LWTA
X-Message-ID-Hash: FMGVJACDJHCKSSL5XDKITDLWLKE7LWTA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMGVJACDJHCKSSL5XDKITDLWLKE7LWTA/>
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
cmUgYW5hbG9nIGlucHV0cyBhbmQgb3V0cHV0cw0KLSBjaGFubmVscyAgOCBhbmQgIDkgYXJlIEFF
UzMgKFMvUERJRikgdmlhIGNvYXgNCi0gY2hhbm5lbHMgMTAgYW5kIDExIGFyZSBBRVMzIChTL1BE
SUYpIHZpYSBYTFINCi0gY2hhbm5lbHMgMTIgIHRvIDE5IGFyZSBBREFUIE9wdGljYWwgSW50ZXJm
YWNlICg4IGNoYW5uZWxzKSBvciBTL1BESUYgKG91dHB1dCBvbmx5LCAxMiBhbmQgMTMpIHZpYSBU
T1NMSU5LDQoNClRoZSBpbnRlcmZhY2Ugc3VwcG9ydHMgdGhyZWUgX0NsYXNzIENvbXBsaWFudF8g
cGxheWJhY2sgbW9kZXM6DQoNCi0gXzggQ2guICsgUGhvbmVzXzoNCiAgLSBjaGFubmVscyAwKzEg
YXJlIG1pcnJvcmVkIHRvIDYrNyAoaGVhZHBob25lcyBMK1IpLCA4KzkgKFMvUERJRiBMK1IpIGFu
ZCAxMisxMyAoQURBVCAxLzIpDQogIC0gY2hhbm5lbHMgMiszIGFyZSBtaXJyb3JlZCB0byAxMCsx
MSAoQUVTMyBMK1IpIGFuZCAxNCsxNSAoQURBVCAzLzQpDQogIC0gY2hhbm5lbHMgNCs1IGFyZSBt
aXJyb3JlZCB0byAxNisxNyAoQURBVCA1LzYpDQogIC0gY2hhbm5lbHMgNis3IGFyZSBtaXJyb3Jl
ZCB0byAxOCsxOSAoQURBVCA3LzgpDQotIF84IENoLiBQbGF5YmFja186DQogIC0gY2hhbm5lbHMg
MCsxIGFyZSBtaXJyb3JlZCB0byA4KzkgKFMvUERJRiBMK1IpIGFuZCAxMisxMyAoQURBVCAxLzIp
DQogIC0gY2hhbm5lbHMgMiszIGFyZSBtaXJyb3JlZCB0byAxMCsxMSAoQUVTMyBMK1IpIGFuZCAx
NCsxNSAoQURBVCAzLzQpDQogIC0gY2hhbm5lbHMgNCs1IGFyZSBtaXJyb3JlZCB0byAxNisxNyAo
QURBVCA1LzYpDQogIC0gY2hhbm5lbHMgNis3IGFyZSBtaXJyb3JlZCB0byAxOCsxOSAoQURBVCA3
LzgpDQotIF8yMCBDaC4gUGxheWJhY2tfOiBubyBjaGFubmVsIG1pcnJvcmluZw0KDQojIyMgUGh5
c2ljYWwgY29ubmVjdG9yIGxheW91dA0KDQp0b3AgdG8gYm90dG9tLCBsZWZ0IHRvIHJpZ2h0LCB2
aWV3ZWQgZnJvbSBkZXZpY2UgZnJvbnQNCg0KIyMjIyBGcm9udA0KDQotIF8xIE1JQyAvIExJTkVf
OiAgWExSIC8gVFJTIMK8IiBjb21ibywgYmFsYW5jZWQgbW9ubyBpbnB1dCwgNDjigK9WIHBoYW50
b20gcG93ZXINCi0gXzIgTUlDIC8gTElORV86ICBYTFIgLyBUUlMgwrwiIGNvbWJvLCBiYWxhbmNl
ZCBtb25vIGlucHV0LCA0OOKAr1YgcGhhbnRvbSBwb3dlcg0KLSBfMyBMSU5FIC8gSU5TVFIuXzog
VFJTIMK8IiwgYmFsYW5jZWQgbW9ubyBpbnB1dA0KLSBfNCBMSU5FIC8gSU5TVFIuXzogVFJTIMK8
IiwgYmFsYW5jZWQgbW9ubyBpbnB1dA0KLSBf8J+Op++4jl8gKGhlYWRwaG9uZXMgc3ltYm9sKTog
VFJTIMK8IiwgdW5iYWxhbmNlZCBzdGVyZW8gb3V0cHV0DQoNCiMjIyMgQmFjaw0KDQotIF9MSU5F
IElOUFVUUyAoQkFMQU5DRUQpXyAgW181XywgXzZfOyBfN18sIF84X106IFRSUyDCvCIsIGJhbGFu
Y2VkIG1vbm8gaW5wdXRzDQotIF9MSU5FIE9VVFBVVFMgKEJBTEFOQ0VEKV8gW18xXywgXzJfOyBf
M18sIF80XzsgXzVfLCBfNl9dOiBUUlMgwrwiLCBiYWxhbmNlZCBtb25vIG91dHB1dHMNCi0gX0FE
QVQgSU5fOiBUT1NMSU5LLCBBREFUIE9wdGljYWwgSW50ZXJmYWNlDQotIF9BREFUIE9VVF86IFRP
U0xJTkssIEFEQVQgT3B0aWNhbCBJbnRlcmZhY2Ugb3IgIG9yIFMvUERJRg0KLSBfQUVTL0VCVSAm
IFNQRElGXzogOeKAkHBpbiBELVN1YiB3aXRoIGJyZWFrb3V0IGNhYmxlICgy4oCvw5cgUkNBIGFu
ZCAy4oCvw5cgWExSKQ0KICAtIFJDQSBpbjogQUVTMyBvciBTL1BESUYgKGF1dG9tYXRpYykNCiAg
LSBSQ0Egb3V0OiBjb25maWd1cmFibGUgZm9yIEFFUzMgKF9Qcm9mZXNzaW9uYWxfKSBvciBTL1BE
SUYgKF9Db25zdW1lcl8pDQogIC0gWExSIGluOiBBRVMzIG9yIFMvUERJRiAoYXV0b21hdGljKQ0K
ICAtIFhMUiBvdXQ6IEFFUzMgb25seQ0KDQpbYWxzYS1pbmZvLnR4dF0oaHR0cHM6Ly9naXRodWIu
Y29tL3VzZXItYXR0YWNobWVudHMvZmlsZXMvMTg3OTA5NzgvYWxzYS1pbmZvLnR4dCkKClJlcXVl
c3QgVVJMICAgOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYv
cHVsbC81MDkKUGF0Y2ggVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3Qv
YWxzYS11Y20tY29uZi9wdWxsLzUwOS5wYXRjaApSZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRo
dWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1jb25mCg==
