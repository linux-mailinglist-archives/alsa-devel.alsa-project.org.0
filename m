Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19169A37470
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Feb 2025 14:04:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37AF26024F;
	Sun, 16 Feb 2025 14:04:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37AF26024F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739711092;
	bh=JA8bNV9APmXC3+c3JfZfPPLhxB5fxfBdAsu1GHVdZrk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bzSIaC/+LEvsSna2QrS+bqJLfv0eieg7lbipltdME2FAJlrNekjJjocVS6JdmQu/x
	 S9Eent5SrJurbRMtJ5h+AqFityvMy059ZZamAtoZsARj5T/GzpnCp5KHQllRz4qp1/
	 C6qcZJGSuG7hRyF86fk0+9FtcZ9mxsMeq/V3cCRA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2063AF805B3; Sun, 16 Feb 2025 14:04:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB3FF805B0;
	Sun, 16 Feb 2025 14:04:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B8A2F801F5; Sun, 16 Feb 2025 14:04:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_00,DOS_BODY_HIGH_NO_MID,
	MISSING_DATE,MISSING_MID,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 103D1F800E5
	for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2025 14:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 103D1F800E5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739711036694934607-webhooks-bot@alsa-project.org>
References: <1739711036694934607-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add support for RME Fireface UCX II
Message-Id: <20250216130406.1B8A2F801F5@alsa1.perex.cz>
Date: Sun, 16 Feb 2025 14:04:06 +0100 (CET)
Message-ID-Hash: LCFYYVWIZEYPDCNPADBHJUDLGAY7UKMF
X-Message-ID-Hash: LCFYYVWIZEYPDCNPADBHJUDLGAY7UKMF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCFYYVWIZEYPDCNPADBHJUDLGAY7UKMF/>
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
LzgpDQotIF8yMCBDaC4gUGxheWJhY2tfOiBubyBjaGFubmVsIG1pcnJvcmluZw0KDQpUaGUgZGV2
aWNlIGV4cG9zZXMgYWxsIDIwIGNoYW5uZWxzIGluIGFsbCB0aHJlZSBwbGF5YmFjayBtb2Rlcy4N
Cg0KTm8gaGFyZHdhcmUgY29udHJvbHMgYXJlIGF2YWlsYWJsZSB3aXRoIHRoZSBjdXJyZW50IGRy
aXZlci4NCg0KIyMjIFBoeXNpY2FsIGNvbm5lY3RvciBsYXlvdXQNCg0KdG9wIHRvIGJvdHRvbSwg
bGVmdCB0byByaWdodCwgdmlld2VkIGZyb20gZGV2aWNlIGZyb250DQoNCiMjIyMgRnJvbnQNCg0K
LSBfMSBNSUMgLyBMSU5FXzogIFhMUiAvIFRSUyDCvCIgY29tYm8sIGJhbGFuY2VkIG1vbm8gaW5w
dXQsIDQ44oCvViBwaGFudG9tIHBvd2VyDQotIF8yIE1JQyAvIExJTkVfOiAgWExSIC8gVFJTIMK8
IiBjb21ibywgYmFsYW5jZWQgbW9ubyBpbnB1dCwgNDjigK9WIHBoYW50b20gcG93ZXINCi0gXzMg
TElORSAvIElOU1RSLl86IFRSUyDCvCIsIGJhbGFuY2VkIG1vbm8gaW5wdXQNCi0gXzQgTElORSAv
IElOU1RSLl86IFRSUyDCvCIsIGJhbGFuY2VkIG1vbm8gaW5wdXQNCi0gX/CfjqfvuI5fIChoZWFk
cGhvbmVzIHN5bWJvbCk6IFRSUyDCvCIsIHVuYmFsYW5jZWQgc3RlcmVvIG91dHB1dA0KDQojIyMj
IEJhY2sNCg0KLSBfTElORSBJTlBVVFMgKEJBTEFOQ0VEKV8gIFtfNV8sIF82XzsgXzdfLCBfOF9d
OiBUUlMgwrwiLCBiYWxhbmNlZCBtb25vIGlucHV0cw0KLSBfTElORSBPVVRQVVRTIChCQUxBTkNF
RClfIFtfMV8sIF8yXzsgXzNfLCBfNF87IF81XywgXzZfXTogVFJTIMK8IiwgYmFsYW5jZWQgbW9u
byBvdXRwdXRzDQotIF9BREFUIElOXzogVE9TTElOSywgQURBVCBPcHRpY2FsIEludGVyZmFjZQ0K
LSBfQURBVCBPVVRfOiBUT1NMSU5LLCBBREFUIE9wdGljYWwgSW50ZXJmYWNlIG9yICBvciBTL1BE
SUYNCi0gX0FFUy9FQlUgJiBTUERJRl86IDnigJBwaW4gRC1TdWIgd2l0aCBicmVha291dCBjYWJs
ZSAoMuKAr8OXIFJDQSBhbmQgMuKAr8OXIFhMUikNCiAgLSBSQ0EgaW46IEFFUzMgb3IgUy9QRElG
IChhdXRvbWF0aWMgZGV0ZWN0aW9uKQ0KICAtIFJDQSBvdXQ6IGNvbmZpZ3VyYWJsZSBmb3IgQUVT
MyAoX1Byb2Zlc3Npb25hbF8pIG9yIFMvUERJRiAoX0NvbnN1bWVyXykNCiAgLSBYTFIgaW46IEFF
UzMgb3IgUy9QRElGIChhdXRvbWF0aWMgZGV0ZWN0aW9uKQ0KICAtIFhMUiBvdXQ6IEFFUzMgb25s
eQ0KDQojIyMgQ2hhbm5lbCBjb25maWd1cmF0aW9ucw0KDQpUaGUgX0hpRmlfIHVzZSBjYXNlIG9u
bHkgZXhwb3NlcyB0aGUgbW9zdCBjb21tb24gY2hhbm5lbCBjb25maWd1cmF0aW9ucyB0byBsaW1p
dCBjb21iaW5hdG9yaWFsIGNvbXBsZXhpdHk6DQoNCi0gQW5hbG9nIGxpbmUgb3V0cHV0cyBpbiBz
dGVyZW8gYXMgd2VsbCBhcyA0LjAgYW5kIDUuMSBzdXJyb3VuZCwNCi0gYW5hbG9nIG1pY3JvcGhv
bmUgYW5kIGluc3RydW1lbnQgaW5wdXRzIGluIG1vbm8gb25seSwNCi0gQURBVCBPcHRpY2FsIG91
dHB1dHMgYW5kIGlucHV0cyBpbiBkaXJlY3QgOOKAkGNoYW5uZWwgbWFwcGluZywgYW5kDQotIGFs
bCBvdGhlciBvdXRwdXRzIGFuZCBpbnB1dHMgaW4gc3RlcmVvLg0KDQpbYWxzYS1pbmZvLnR4dF0o
aHR0cHM6Ly9naXRodWIuY29tL3VzZXItYXR0YWNobWVudHMvZmlsZXMvMTg3OTA5NzgvYWxzYS1p
bmZvLnR4dCkKClJlcXVlc3QgVVJMICAgOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0
L2Fsc2EtdWNtLWNvbmYvcHVsbC81MDkKUGF0Y2ggVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNv
bS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9wdWxsLzUwOS5wYXRjaApSZXBvc2l0b3J5IFVS
TDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1jb25mCg==
