Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5161DD0FD09
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jan 2026 21:38:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEBC660204;
	Sun, 11 Jan 2026 21:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEBC660204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1768163896;
	bh=W/prNO9uW9eUHGlndPvrd4AADkrCkoyltmzLsSdyS5E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VhUAZPjQ3XyMoJneD1Qgh7nm5a3dACmg5NWA7SZjHluMGKUL+aRFihrgDhRvxoaEn
	 b5ckw/34N1g4qE2fYGqbVxh7Kw9w369fS85WgGsJsLHz/wSDWkSHqXhpmY8XHMQSbY
	 tpDviGemkhcFVUiTSCUCNKy+9Ptz3bDrAUQEdD7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E359F805EC; Sun, 11 Jan 2026 21:37:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86800F8055C;
	Sun, 11 Jan 2026 21:37:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94F5DF80149; Sun, 11 Jan 2026 21:36:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id C47FDF80038
	for <alsa-devel@alsa-project.org>; Sun, 11 Jan 2026 21:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C47FDF80038
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1889c797070a9000-webhooks-bot@alsa-project.org>
In-Reply-To: <1889c797054d9c00-webhooks-bot@alsa-project.org>
References: <1889c797054d9c00-webhooks-bot@alsa-project.org>
Subject: Laptop built-in speakers not detected after c8b5541
Date: Sun, 11 Jan 2026 21:36:29 +0100 (CET)
Message-ID-Hash: PX5T7MSR2YGLSCFP5OGFYCQJ3DXRFGPO
X-Message-ID-Hash: PX5T7MSR2YGLSCFP5OGFYCQJ3DXRFGPO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PX5T7MSR2YGLSCFP5OGFYCQJ3DXRFGPO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzY4NSB3YXMgb3BlbmVkIGZyb20gWGVs
dGFsbGl2OgoKVXBkYXRpbmcgZnJvbSB2MS4yLjE1LjEgdG8gdjEuMi4xNS4yIGJyb2tlIHNvdW5k
IG9uIEFTVVMgWmVuYm9vayAxNCBVTTQyNVVBIGxhcHRvcC4gSXQgaGFzIG5vIGV4dGVybmFsIGhl
YWRwaG9uZSBqYWNrcy4KSSBuYXJyb3dlZCBpdCBkb3duIHRoZSBjYXVzZSB0byB0aGUgY29tbWl0
IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9jb21taXQvYzhi
NTU0MThmZjM2MDM2ZmM5NjA3MzExOTFhZTA5MjJiZjZmMWRhZQpXaXRoIHYxLjIuMTUuMSBgd3Bj
dGwgc3RhdHVzYCBzaG93czoKYGBgCkF1ZGlvCiDilJzilIAgRGV2aWNlczoKIOKUgiAgICAgIDQ4
LiBSZW5vaXIvQ2V6YW5uZSBIRE1JL0RQIEF1ZGlvIENvbnRyb2xsZXIgW2Fsc2FdCiDilIIgICAg
ICA0OS4gUnl6ZW4gSEQgQXVkaW8gQ29udHJvbGxlciAgICAgICAgICAgW2Fsc2FdCiDilIIKIOKU
nOKUgCBTaW5rczoKIOKUgiAgKiAgIDU2LiBSeXplbiBIRCBBdWRpbyBDb250cm9sbGVyIEhlYWRw
aG9uZXMgW3ZvbDogMC40MF0KIOKUggog4pSc4pSAIFNvdXJjZXM6CiDilIIgICogICA1Ny4gUnl6
ZW4gSEQgQXVkaW8gQ29udHJvbGxlciBTdGVyZW8gTWljcm9waG9uZSBbdm9sOiAxLjAwXQog4pSC
ICAgICAgNTguIFJ5emVuIEhEIEF1ZGlvIENvbnRyb2xsZXIgRGlnaXRhbCBNaWNyb3Bob25lIFt2
b2w6IDEuMDBdCiDilIIKIOKUnOKUgCBGaWx0ZXJzOgog4pSCCiDilJTilIAgU3RyZWFtczoKYGBg
CldpdGggdjEuMi4xNS4yIGB3cGN0bCBzdGF0dXNgIHNob3dzOgpgYGAKQXVkaW8KIOKUnOKUgCBE
ZXZpY2VzOgog4pSCICAgICAgNDguIFJlbm9pci9DZXphbm5lIEhETUkvRFAgQXVkaW8gQ29udHJv
bGxlciBbYWxzYV0KIOKUgiAgICAgIDQ5LiBSeXplbiBIRCBBdWRpbyBDb250cm9sbGVyICAgICAg
ICAgICBbYWxzYV0KIOKUggog4pSc4pSAIFNpbmtzOgog4pSCICAqICAgMzQuIER1bW15IE91dHB1
dCAgICAgICAgIFt2b2w6IDEuMDBdCiDilIIKIOKUnOKUgCBTb3VyY2VzOgog4pSCICAqICAgNTYu
IFJ5emVuIEhEIEF1ZGlvIENvbnRyb2xsZXIgRGlnaXRhbCBNaWNyb3Bob25lIFt2b2w6IDAuOTdd
CiDilIIKIOKUnOKUgCBGaWx0ZXJzOgog4pSCCiDilJTilIAgU3RyZWFtczoKYGBgCk5vdCBzdXJl
IGlmIGFueSBvZiB0aGUgZm9sbG93aW5nIGhlbHBzOgpJbiBib3RoIGNhc2VzIGBkbWVzZyB8IGdy
ZXAgLWlFICdzbmR8YWxzYXxwaXBld2lyZSdgIHNob3dzOgpgYGAKWyAgICA4LjIzNTc2NF0gc25k
X3JuX3BjaV9hY3AzeCAwMDAwOjA0OjAwLjU6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAy
KQpbICAgIDguMzgzMzkzXSBzbmRfaGRhX2ludGVsIDAwMDA6MDQ6MDAuMTogSGFuZGxlIHZnYV9z
d2l0Y2hlcm9vIGF1ZGlvIGNsaWVudApbICAgIDguNDA0Mjg2XSBzbmRfaGRhX2ludGVsIDAwMDA6
MDQ6MDAuMTogYm91bmQgMDAwMDowNDowMC4wIChvcHMgYW1kZ3B1X2RtX2F1ZGlvX2NvbXBvbmVu
dF9iaW5kX29wcyBbYW1kZ3B1XSkKWyAgICA4LjQzNDI3MF0gc25kX2hkYV9jb2RlY19hbGMyNjkg
aGRhdWRpb0MxRDA6IGF1dG9jb25maWcgZm9yIEFMQzI5NDogbGluZV9vdXRzPTEgKDB4MTcvMHgw
LzB4MC8weDAvMHgwKSB0eXBlOnNwZWFrZXIKWyAgICA4LjQzNDI4MF0gc25kX2hkYV9jb2RlY19h
bGMyNjkgaGRhdWRpb0MxRDA6ICAgIHNwZWFrZXJfb3V0cz0wICgweDAvMHgwLzB4MC8weDAvMHgw
KQpbICAgIDguNDM0Mjg0XSBzbmRfaGRhX2NvZGVjX2FsYzI2OSBoZGF1ZGlvQzFEMDogICAgaHBf
b3V0cz0wICgweDAvMHgwLzB4MC8weDAvMHgwKQpbICAgIDguNDM0Mjg4XSBzbmRfaGRhX2NvZGVj
X2FsYzI2OSBoZGF1ZGlvQzFEMDogICAgbW9ubzogbW9ub19vdXQ9MHgwClsgICAgOC40MzQyOTBd
IHNuZF9oZGFfY29kZWNfYWxjMjY5IGhkYXVkaW9DMUQwOiAgICBpbnB1dHM6CmBgYApgYXBsYXkg
LWxgIHNob3dzOgpgYGAKKioqKiBMaXN0IG9mIFBMQVlCQUNLIEhhcmR3YXJlIERldmljZXMgKioq
KgpjYXJkIDA6IEdlbmVyaWMgW0hELUF1ZGlvIEdlbmVyaWNdLCBkZXZpY2UgMzogSERNSSAwIFtI
RE1JIDBdCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKY2Fy
ZCAwOiBHZW5lcmljIFtIRC1BdWRpbyBHZW5lcmljXSwgZGV2aWNlIDc6IEhETUkgMSBbSERNSSAx
XQogIFN1YmRldmljZXM6IDEvMQogIFN1YmRldmljZSAjMDogc3ViZGV2aWNlICMwCmNhcmQgMDog
R2VuZXJpYyBbSEQtQXVkaW8gR2VuZXJpY10sIGRldmljZSA4OiBIRE1JIDIgW0hETUkgMl0KICBT
dWJkZXZpY2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMApjYXJkIDE6IEdlbmVy
aWNfMSBbSEQtQXVkaW8gR2VuZXJpY10sIGRldmljZSAwOiBBTEMyOTQgQW5hbG9nIFtBTEMyOTQg
QW5hbG9nXQogIFN1YmRldmljZXM6IDEvMQogIFN1YmRldmljZSAjMDogc3ViZGV2aWNlICMwCmBg
YApgYW1peGVyIC1jIDEgc2NvbnRyb2xzYCBzaG93czoKYGBgClNpbXBsZSBtaXhlciBjb250cm9s
ICdNYXN0ZXInLDAKU2ltcGxlIG1peGVyIGNvbnRyb2wgJ01pYyBBQ1AgTEVEJywwCmBgYAoKSXNz
dWUgVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29u
Zi9pc3N1ZXMvNjg1ClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9q
ZWN0L2Fsc2EtdWNtLWNvbmYK
