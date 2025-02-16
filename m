Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 425D3A37475
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Feb 2025 14:09:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 937126025D;
	Sun, 16 Feb 2025 14:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 937126025D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739711350;
	bh=IFUvO29PLfDVKi5EMDCtDXnNgdeehH8+2GwXW5m5o/8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=C7wLeHLpKAm+WDRe8Xo3evUnKRZHiCOAadrcbceTdWI6pRLv0/1R9l87bJNEhuxqd
	 UXU/cN+gjhIRDbE73mY0Fc5GYQ7yWrelEurAOWUcBGbCb5OVmhJR8UE7ykdaKa12e8
	 7tXojKiIG3PamU4BL5ZcSGjYvYiNULlhxgbRuecI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 918F0F805BD; Sun, 16 Feb 2025 14:08:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E09F805BA;
	Sun, 16 Feb 2025 14:08:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97E38F801F5; Sun, 16 Feb 2025 14:08:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_00,DOS_BODY_HIGH_NO_MID,
	MISSING_DATE,MISSING_MID,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id E1060F80100
	for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2025 14:08:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1060F80100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739711304401101351-webhooks-bot@alsa-project.org>
References: <1739711304401101351-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add support for RME Fireface UCX II
Message-Id: <20250216130828.97E38F801F5@alsa1.perex.cz>
Date: Sun, 16 Feb 2025 14:08:28 +0100 (CET)
Message-ID-Hash: 36IAZTA4KFAMWF3QT2YAFZOBB6FZV4WB
X-Message-ID-Hash: 36IAZTA4KFAMWF3QT2YAFZOBB6FZV4WB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36IAZTA4KFAMWF3QT2YAFZOBB6FZV4WB/>
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
d25sb2Fkcy9mZmFjZV91Y3gyX2UucGRmPg0KDQojIyMgRGV2aWNlIGludGVyZmFjZQ0KDQpUaGUg
aW50ZXJmYWNlIHByb3ZpZGVzIDIwIHBsYXliYWNrIGFuZCBjYXB0dXJlIGNoYW5uZWxzIGVhY2g6
DQotIGNoYW5uZWxzICAwICB0byAgNyBhcmUgYW5hbG9nIGlucHV0cyBhbmQgb3V0cHV0cw0KLSBj
aGFubmVscyAgOCBhbmQgIDkgYXJlIEFFUzMgKFMvUERJRikgdmlhIGNvYXgNCi0gY2hhbm5lbHMg
MTAgYW5kIDExIGFyZSBBRVMzIChTL1BESUYpIHZpYSBYTFINCi0gY2hhbm5lbHMgMTIgIHRvIDE5
IGFyZSBBREFUIE9wdGljYWwgSW50ZXJmYWNlICg4IGNoYW5uZWxzKSBvciBTL1BESUYgKG91dHB1
dCBvbmx5LCAxMiBhbmQgMTMpIHZpYSBUT1NMSU5LDQoNClRoZSBpbnRlcmZhY2Ugc3VwcG9ydHMg
dGhyZWUgX0NsYXNzIENvbXBsaWFudF8gcGxheWJhY2sgbW9kZXM6DQoNCi0gXzggQ2guICsgUGhv
bmVzXzoNCiAgLSBjaGFubmVscyAwKzEgYXJlIG1pcnJvcmVkIHRvIDYrNyAoaGVhZHBob25lcyBM
K1IpLCA4KzkgKFMvUERJRiBMK1IpIGFuZCAxMisxMyAoQURBVCAxLzIpDQogIC0gY2hhbm5lbHMg
MiszIGFyZSBtaXJyb3JlZCB0byAxMCsxMSAoQUVTMyBMK1IpIGFuZCAxNCsxNSAoQURBVCAzLzQp
DQogIC0gY2hhbm5lbHMgNCs1IGFyZSBtaXJyb3JlZCB0byAxNisxNyAoQURBVCA1LzYpDQogIC0g
Y2hhbm5lbHMgNis3IGFyZSBtaXJyb3JlZCB0byAxOCsxOSAoQURBVCA3LzgpDQotIF84IENoLiBQ
bGF5YmFja186DQogIC0gY2hhbm5lbHMgMCsxIGFyZSBtaXJyb3JlZCB0byA4KzkgKFMvUERJRiBM
K1IpIGFuZCAxMisxMyAoQURBVCAxLzIpDQogIC0gY2hhbm5lbHMgMiszIGFyZSBtaXJyb3JlZCB0
byAxMCsxMSAoQUVTMyBMK1IpIGFuZCAxNCsxNSAoQURBVCAzLzQpDQogIC0gY2hhbm5lbHMgNCs1
IGFyZSBtaXJyb3JlZCB0byAxNisxNyAoQURBVCA1LzYpDQogIC0gY2hhbm5lbHMgNis3IGFyZSBt
aXJyb3JlZCB0byAxOCsxOSAoQURBVCA3LzgpDQotIF8yMCBDaC4gUGxheWJhY2tfOiBubyBjaGFu
bmVsIG1pcnJvcmluZw0KDQpUaGUgZGV2aWNlIGV4cG9zZXMgYWxsIDIwIGNoYW5uZWxzIGluIGFs
bCB0aHJlZSBwbGF5YmFjayBtb2Rlcy4NCg0KTm8gaGFyZHdhcmUgY29udHJvbHMgYXJlIGF2YWls
YWJsZSB3aXRoIHRoZSBjdXJyZW50IGRyaXZlci4NCg0KIyMjIFBoeXNpY2FsIGNvbm5lY3RvciBs
YXlvdXQNCg0KdG9wIHRvIGJvdHRvbSwgbGVmdCB0byByaWdodCwgdmlld2VkIGZyb20gZGV2aWNl
IGZyb250DQoNCiMjIyMgRnJvbnQNCg0KLSBfMSBNSUMgLyBMSU5FXzogIFhMUiAvIFRSUyDCvCIg
Y29tYm8sIGJhbGFuY2VkIG1vbm8gaW5wdXQsIDQ44oCvViBwaGFudG9tIHBvd2VyDQotIF8yIE1J
QyAvIExJTkVfOiAgWExSIC8gVFJTIMK8IiBjb21ibywgYmFsYW5jZWQgbW9ubyBpbnB1dCwgNDji
gK9WIHBoYW50b20gcG93ZXINCi0gXzMgTElORSAvIElOU1RSLl86IFRSUyDCvCIsIGJhbGFuY2Vk
IG1vbm8gaW5wdXQNCi0gXzQgTElORSAvIElOU1RSLl86IFRSUyDCvCIsIGJhbGFuY2VkIG1vbm8g
aW5wdXQNCi0gX/CfjqfvuI5fIChoZWFkcGhvbmVzIHN5bWJvbCk6IFRSUyDCvCIsIHVuYmFsYW5j
ZWQgc3RlcmVvIG91dHB1dA0KDQojIyMjIEJhY2sNCg0KLSBfTElORSBJTlBVVFMgKEJBTEFOQ0VE
KV8gIFtfNV8sIF82XzsgXzdfLCBfOF9dOiBUUlMgwrwiLCBiYWxhbmNlZCBtb25vIGlucHV0cw0K
LSBfTElORSBPVVRQVVRTIChCQUxBTkNFRClfIFtfMV8sIF8yXzsgXzNfLCBfNF87IF81XywgXzZf
XTogVFJTIMK8IiwgYmFsYW5jZWQgbW9ubyBvdXRwdXRzDQotIF9BREFUIElOXzogVE9TTElOSywg
QURBVCBPcHRpY2FsIEludGVyZmFjZQ0KLSBfQURBVCBPVVRfOiBUT1NMSU5LLCBBREFUIE9wdGlj
YWwgSW50ZXJmYWNlIG9yICBvciBTL1BESUYNCi0gX0FFUy9FQlUgJiBTUERJRl86IDnigJBwaW4g
RC1TdWIgd2l0aCBicmVha291dCBjYWJsZSAoMuKAr8OXIFJDQSBhbmQgMuKAr8OXIFhMUikNCiAg
LSBSQ0EgaW46IEFFUzMgb3IgUy9QRElGIChhdXRvbWF0aWMgZGV0ZWN0aW9uKQ0KICAtIFJDQSBv
dXQ6IGNvbmZpZ3VyYWJsZSBmb3IgQUVTMyAoX1Byb2Zlc3Npb25hbF8pIG9yIFMvUERJRiAoX0Nv
bnN1bWVyXykNCiAgLSBYTFIgaW46IEFFUzMgb3IgUy9QRElGIChhdXRvbWF0aWMgZGV0ZWN0aW9u
KQ0KICAtIFhMUiBvdXQ6IEFFUzMgb25seQ0KDQojIyMgQ2hhbm5lbCBjb25maWd1cmF0aW9ucw0K
DQpUaGUgX0hpRmlfIHVzZSBjYXNlIG9ubHkgZXhwb3NlcyB0aGUgbW9zdCBjb21tb24gY2hhbm5l
bCBjb25maWd1cmF0aW9ucyB0byBsaW1pdCBjb21iaW5hdG9yaWFsIGNvbXBsZXhpdHk6DQoNCi0g
QW5hbG9nIGxpbmUgb3V0cHV0cyBpbiBzdGVyZW8gYXMgd2VsbCBhcyA0LjAgYW5kIDUuMSBzdXJy
b3VuZCwNCi0gYW5hbG9nIG1pY3JvcGhvbmUgYW5kIGluc3RydW1lbnQgaW5wdXRzIGluIG1vbm8g
b25seSwNCi0gQURBVCBPcHRpY2FsIG91dHB1dHMgYW5kIGlucHV0cyBpbiBkaXJlY3QgOOKAkGNo
YW5uZWwgbWFwcGluZywgYW5kDQotIGFsbCBvdGhlciBvdXRwdXRzIGFuZCBpbnB1dHMgaW4gc3Rl
cmVvLg0KDQpbYWxzYS1pbmZvLnR4dF0oaHR0cHM6Ly9naXRodWIuY29tL3VzZXItYXR0YWNobWVu
dHMvZmlsZXMvMTg3OTA5NzgvYWxzYS1pbmZvLnR4dCkKClJlcXVlc3QgVVJMICAgOiBodHRwczov
L2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYvcHVsbC81MDkKUGF0Y2ggVVJM
ICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9wdWxs
LzUwOS5wYXRjaApSZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVj
dC9hbHNhLXVjbS1jb25mCg==
