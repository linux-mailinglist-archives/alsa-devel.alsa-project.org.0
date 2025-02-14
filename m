Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1560A35B6F
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2025 11:21:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9F260259;
	Fri, 14 Feb 2025 11:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9F260259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739528485;
	bh=yVcvmu9bjtbdlSSUe2Xnfw4GHjCh7irX0dMQ67ctMTc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=q9tPlI0DxY8H0uDuxkhbGe6HICI36Y6vGVXzpraNxptAZmcdFsNM9kl+B6lmZKJqI
	 0LHBfzwZSPkSQmUsoMIMENpxoBL3FwqvZrM0dXF9jAyRuZ2fc3vJWmm0L61JE6AT3D
	 e8R0TxX3pKsD7xr7gfse5GaYUe2lUMZCpQsjquDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87922F805C3; Fri, 14 Feb 2025 11:20:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D563F805B6;
	Fri, 14 Feb 2025 11:20:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A482AF804B0; Fri, 14 Feb 2025 11:20:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_00,DOS_BODY_HIGH_NO_MID,
	MISSING_DATE,MISSING_MID,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EB13F80095
	for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2025 11:20:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EB13F80095
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739528444630229950-webhooks-bot@alsa-project.org>
References: <1739528444630229950-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add support for RME Fireface UCX II
Message-Id: <20250214102047.A482AF804B0@alsa1.perex.cz>
Date: Fri, 14 Feb 2025 11:20:47 +0100 (CET)
Message-ID-Hash: AZVKOBBDPKYQWIGC3OVEZRCVP4SMORYJ
X-Message-ID-Hash: AZVKOBBDPKYQWIGC3OVEZRCVP4SMORYJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZVKOBBDPKYQWIGC3OVEZRCVP4SMORYJ/>
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
IHZpYSBYTFINCi0gY2hhbm5lbHMgMTIgIHRvIDE5IGFyZSBBREFUIE9wdGljYWwgSW50ZXJmYWNl
ICg4IGNoYW5uZWxzKSBvciBTL1BESUYgKDEyIGFuZCAxMykgdmlhIFRPU0xJTksNCg0KVGhlIGlu
dGVyZmFjZSBzdXBwb3J0cyB0aHJlZSBfQ2xhc3MgQ29tcGxpYW50XyBwbGF5YmFjayBtb2RlczoN
Cg0KLSBfOCBDaC4gKyBQaG9uZXNfOg0KICAtIGNoYW5uZWxzIDArMSBhcmUgbWlycm9yZWQgdG8g
Nis3IChoZWFkcGhvbmVzIEwrUiksIDgrOSAoUy9QRElGIEwrUikgYW5kIDEyKzEzIChBREFUIDEv
MikNCiAgLSBjaGFubmVscyAyKzMgYXJlIG1pcnJvcmVkIHRvIDEwKzExIChBRVMvRUJVIEwrUikg
YW5kIDE0KzE1IChBREFUIDMvNCkNCiAgLSBjaGFubmVscyA0KzUgYXJlIG1pcnJvcmVkIHRvIDE2
KzE3IChBREFUIDUvNikNCiAgLSBjaGFubmVscyA2KzcgYXJlIG1pcnJvcmVkIHRvIDE4KzE5IChB
REFUIDcvOCkNCi0gXzggQ2guIFBsYXliYWNrXzoNCiAgLSBjaGFubmVscyAwKzEgYXJlIG1pcnJv
cmVkIHRvIDgrOSAoUy9QRElGIEwrUikgYW5kIDEyKzEzIChBREFUIDEvMikNCiAgLSBjaGFubmVs
cyAyKzMgYXJlIG1pcnJvcmVkIHRvIDEwKzExIChBRVMvRUJVIEwrUikgYW5kIDE0KzE1IChBREFU
IDMvNCkNCiAgLSBjaGFubmVscyA0KzUgYXJlIG1pcnJvcmVkIHRvIDE2KzE3IChBREFUIDUvNikN
CiAgLSBjaGFubmVscyA2KzcgYXJlIG1pcnJvcmVkIHRvIDE4KzE5IChBREFUIDcvOCkNCi0gXzIw
IENoLiBQbGF5YmFja186IG5vIGNoYW5uZWwgbWlycm9yaW5nDQoNCiMjIyBQaHlzaWNhbCBjb25u
ZWN0b3IgbGF5b3V0DQoNCnRvcCB0byBib3R0b20sIGxlZnQgdG8gcmlnaHQsIHZpZXdlZCBmcm9t
IGRldmljZSBmcm9udA0KDQojIyMjIEZyb250DQoNCi0gXzEgTUlDIC8gTElORV86ICBYTFIgLyBU
UlMgwrwiIGNvbWJvLCBiYWxhbmNlZCBtb25vIGlucHV0LCA0OOKAr1YgcGhhbnRvbSBwb3dlcg0K
LSBfMiBNSUMgLyBMSU5FXzogIFhMUiAvIFRSUyDCvCIgY29tYm8sIGJhbGFuY2VkIG1vbm8gaW5w
dXQsIDQ44oCvViBwaGFudG9tIHBvd2VyDQotIF8zIExJTkUgLyBJTlNUUi5fOiBUUlMgwrwiLCBi
YWxhbmNlZCBtb25vIGlucHV0DQotIF80IExJTkUgLyBJTlNUUi5fOiBUUlMgwrwiLCBiYWxhbmNl
ZCBtb25vIGlucHV0DQotIF/wn46n77iOXyAoaGVhZHBob25lcyBzeW1ib2wpOiBUUlMgwrwiLCB1
bmJhbGFuY2VkIHN0ZXJlbyBvdXRwdXQNCg0KIyMjIyBCYWNrDQoNCi0gX0xJTkUgSU5QVVRTIChC
QUxBTkNFRClfICBbXzVfLCBfNl87IF83XywgXzhfXTogVFJTIMK8IiwgYmFsYW5jZWQgbW9ubyBp
bnB1dHMNCi0gX0xJTkUgT1VUUFVUUyAoQkFMQU5DRUQpXyBbXzFfLCBfMl87IF8zXywgXzRfOyBf
NV8sIF82X106IFRSUyDCvCIsIGJhbGFuY2VkIG1vbm8gb3V0cHV0cw0KLSBfQURBVCBJTl86IFRP
U0xJTksNCi0gX0FEQVQgT1VUXzogVE9TTElOSw0KLSBfQUVTL0VCVSAmIFNQRElGXzogOeKAkHBp
biBELVN1YiB3aXRoIGJyZWFrb3V0IGNhYmxlICgy4oCvw5cgUkNBIGFuZCAy4oCvw5cgWExSKQ0K
DQpbYWxzYS1pbmZvLnR4dF0oaHR0cHM6Ly9naXRodWIuY29tL3VzZXItYXR0YWNobWVudHMvZmls
ZXMvMTg3OTA5NzgvYWxzYS1pbmZvLnR4dCkKClJlcXVlc3QgVVJMICAgOiBodHRwczovL2dpdGh1
Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYvcHVsbC81MDkKUGF0Y2ggVVJMICAgICA6
IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9wdWxsLzUwOS5w
YXRjaApSZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNh
LXVjbS1jb25mCg==
