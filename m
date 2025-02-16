Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7FA3748E
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Feb 2025 14:32:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AB6260202;
	Sun, 16 Feb 2025 14:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AB6260202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739712779;
	bh=rKxZsVjSYwxlXzzfFQgZH0zGv4t2iwe/RnvALYlEOJU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jGEAuhPIlOLKX/lii7dKj+8aAJOJ49ssX/VceQddddK5XuLLTg/3kkDTvoBQ0Htcj
	 PFAoLFfMRHCfZ8jwsC2TK5wgK4j01VA88wS5MAhsR+e6RxlbbK7VZgTiAOuQszLL5a
	 hVexCmTCzXsRuHD5vqun8thi93naJr+3ch4r6LBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D26CF805C2; Sun, 16 Feb 2025 14:32:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04324F805B1;
	Sun, 16 Feb 2025 14:32:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A914F801F5; Sun, 16 Feb 2025 14:32:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_00,DOS_BODY_HIGH_NO_MID,
	MISSING_DATE,MISSING_MID,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D7FCF800BD
	for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2025 14:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D7FCF800BD
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739712738902598858-webhooks-bot@alsa-project.org>
References: <1739712738902598858-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add support for RME Fireface UCX II
Message-Id: <20250216133221.4A914F801F5@alsa1.perex.cz>
Date: Sun, 16 Feb 2025 14:32:21 +0100 (CET)
Message-ID-Hash: SDRRQIH6YDUBT43L6M3QZGR7TATPAH3D
X-Message-ID-Hash: SDRRQIH6YDUBT43L6M3QZGR7TATPAH3D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SDRRQIH6YDUBT43L6M3QZGR7TATPAH3D/>
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
bCB0aHJlZSBwbGF5YmFjayBtb2Rlcy4NCg0KTm8gbWl4ZXIgY29udHJvbHMgYXJlIGF2YWlsYWJs
ZSB3aXRoIHRoZSBjdXJyZW50IGRyaXZlci4NCg0KIyMjIFBoeXNpY2FsIGNvbm5lY3RvciBsYXlv
dXQNCg0KdG9wIHRvIGJvdHRvbSwgbGVmdCB0byByaWdodCwgdmlld2VkIGZyb20gZGV2aWNlIGZy
b250DQoNCiMjIyMgRnJvbnQNCg0KLSBfMSBNSUMgLyBMSU5FXzogIFhMUiAvIFRSUyDCvCIgY29t
Ym8sIGJhbGFuY2VkIG1vbm8gaW5wdXQsIDQ44oCvViBwaGFudG9tIHBvd2VyDQotIF8yIE1JQyAv
IExJTkVfOiAgWExSIC8gVFJTIMK8IiBjb21ibywgYmFsYW5jZWQgbW9ubyBpbnB1dCwgNDjigK9W
IHBoYW50b20gcG93ZXINCi0gXzMgTElORSAvIElOU1RSLl86IFRSUyDCvCIsIGJhbGFuY2VkIG1v
bm8gaW5wdXQNCi0gXzQgTElORSAvIElOU1RSLl86IFRSUyDCvCIsIGJhbGFuY2VkIG1vbm8gaW5w
dXQNCi0gX/CfjqfvuI5fIChoZWFkcGhvbmVzIHN5bWJvbCk6IFRSUyDCvCIsIHVuYmFsYW5jZWQg
c3RlcmVvIG91dHB1dA0KDQojIyMjIEJhY2sNCg0KLSBfTElORSBJTlBVVFMgKEJBTEFOQ0VEKV8g
IFtfNV8sIF82XzsgXzdfLCBfOF9dOiBUUlMgwrwiLCBiYWxhbmNlZCBtb25vIGlucHV0cw0KLSBf
TElORSBPVVRQVVRTIChCQUxBTkNFRClfIFtfMV8sIF8yXzsgXzNfLCBfNF87IF81XywgXzZfXTog
VFJTIMK8IiwgYmFsYW5jZWQgbW9ubyBvdXRwdXRzDQotIF9BREFUIElOXzogVE9TTElOSywgQURB
VCBPcHRpY2FsIEludGVyZmFjZQ0KLSBfQURBVCBPVVRfOiBUT1NMSU5LLCBBREFUIE9wdGljYWwg
SW50ZXJmYWNlIG9yICBvciBTL1BESUYNCi0gX0FFUy9FQlUgJiBTUERJRl86IDnigJBwaW4gRC1T
dWIgd2l0aCBicmVha291dCBjYWJsZSAoMuKAr8OXIFJDQSBhbmQgMuKAr8OXIFhMUikNCiAgLSBS
Q0EgaW46IEFFUzMgb3IgUy9QRElGIChhdXRvbWF0aWMgZGV0ZWN0aW9uKQ0KICAtIFJDQSBvdXQ6
IGNvbmZpZ3VyYWJsZSBmb3IgQUVTMyAoX1Byb2Zlc3Npb25hbF8pIG9yIFMvUERJRiAoX0NvbnN1
bWVyXykNCiAgLSBYTFIgaW46IEFFUzMgb3IgUy9QRElGIChhdXRvbWF0aWMgZGV0ZWN0aW9uKQ0K
ICAtIFhMUiBvdXQ6IEFFUzMgb25seQ0KDQojIyMgQ2hhbm5lbCBjb25maWd1cmF0aW9ucw0KDQpU
aGUgX0hpRmlfIHVzZSBjYXNlIG9ubHkgZXhwb3NlcyB0aGUgbW9zdCBjb21tb24gY2hhbm5lbCBj
b25maWd1cmF0aW9ucyB0byBsaW1pdCBjb21iaW5hdG9yaWFsIGNvbXBsZXhpdHk6DQoNCi0gQW5h
bG9nIGxpbmUgb3V0cHV0cyBpbiBzdGVyZW8gYXMgd2VsbCBhcyA0LjAgYW5kIDUuMSBzdXJyb3Vu
ZCwNCi0gYW5hbG9nIG1pY3JvcGhvbmUgYW5kIGluc3RydW1lbnQgaW5wdXRzIGluIG1vbm8gb25s
eSwNCi0gQURBVCBPcHRpY2FsIG91dHB1dHMgYW5kIGlucHV0cyBpbiBkaXJlY3QgOOKAkGNoYW5u
ZWwgbWFwcGluZywgYW5kDQotIGFsbCBvdGhlciBvdXRwdXRzIGFuZCBpbnB1dHMgaW4gc3RlcmVv
Lg0KDQpbYWxzYS1pbmZvLnR4dF0oaHR0cHM6Ly9naXRodWIuY29tL3VzZXItYXR0YWNobWVudHMv
ZmlsZXMvMTg4MTQ4MTUvYWxzYS1pbmZvLnR4dCkKClJlcXVlc3QgVVJMICAgOiBodHRwczovL2dp
dGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYvcHVsbC81MDkKUGF0Y2ggVVJMICAg
ICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9wdWxsLzUw
OS5wYXRjaApSZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9h
bHNhLXVjbS1jb25mCg==
