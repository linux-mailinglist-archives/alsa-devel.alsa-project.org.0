Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B72C3AB7F77
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:59:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDF4D61D08;
	Thu, 15 May 2025 09:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDF4D61D08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747294777;
	bh=OXMUwTDxYWCpszkHpXHDfFgzEeXCN2NwNcbG5zoSqgk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Re287b4ft+Z49t4HN/ydyajUe8P0dw6ATgvcB6euB+mAk/x3GDcBlj7UM8YG04Edb
	 /tZF3OGofDuCbW1qjRC0uPTiGyNwmWahPNfn3ISgfeJg584nmsLY2HiOzMtqGadGFl
	 RyrgoZw4NKK4hPmBPdiyzNbBFxNHRkNf+ns1BwQI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41E6FF8077B; Sun, 11 May 2025 11:53:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DC03F8078F;
	Sun, 11 May 2025 11:53:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42869F80766; Sun, 11 May 2025 11:53:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 88806F805B2
	for <alsa-devel@alsa-project.org>; Sun, 11 May 2025 11:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88806F805B2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <183e704e760bb600-webhooks-bot@alsa-project.org>
In-Reply-To: <183e704e7601a200-webhooks-bot@alsa-project.org>
References: <183e704e7601a200-webhooks-bot@alsa-project.org>
Subject: Internal Microphone Not Working on Lenovo Yoga Slim 7 Pro with Linux
 Mint 22.1
Date: Sun, 11 May 2025 11:53:10 +0200 (CEST)
Message-ID-Hash: CPB4J7KERXVSUPRGXJU2SSURTAR72CMP
X-Message-ID-Hash: CPB4J7KERXVSUPRGXJU2SSURTAR72CMP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPB4J7KERXVSUPRGXJU2SSURTAR72CMP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzU2MCB3YXMgb3BlbmVkIGZyb20gYXBp
cmtlbGFtOgoKSSBhbSBhIHBhc3Npb25hdGUgYW5kIGdyYXRlZnVsIG5ldyB1c2VyIG9mIExpbnV4
IE1pbnQuIEkgcmVjZW50bHkgc3dpdGNoZWQgZnJvbSBXaW5kb3dzIGFuZCBoYXZlIGJlZW4gZW5q
b3lpbmcgdGhlIHN5c3RlbSBzdGFiaWxpdHkgYW5kIHVzZXItZnJpZW5kbHkgZXhwZXJpZW5jZS4g
QXMgYSBuZXdjb21lciB0byBMaW51eCwgSSBtYW5hZ2UgdG8gaGFuZGxlIG1hbnkgdGFza3Mgd2l0
aCB0aGUgaGVscCBvZiB0aGUgdGVybWluYWwgYW5kIENoYXRHUFQuCgpIb3dldmVyLCBJIGFtIGZh
Y2luZyBhIHBlcnNpc3RlbnQgaXNzdWUgdGhhdCBoYXMgc2lnbmlmaWNhbnRseSBhZmZlY3RlZCBt
eSB3b3JrZmxvdzoKCk15IGludGVybmFsIG1pY3JvcGhvbmUgaXMgbm90IHdvcmtpbmcgb24gbXkg
TGVub3ZvIFlvZ2EgU2xpbSA3IFBybyAoQU1EIFJ5emVuIDUgNjYwMEhTICsgUmVhbHRlayBBTEMy
NTcgY29kZWMpLgoKSSBoYXZlIHRlc3RlZCBtdWx0aXBsZSBhcHByb2FjaGVzLCBpbmNsdWRpbmc6
CgpTd2l0Y2hpbmcgYmV0d2VlbiBQdWxzZUF1ZGlvIGFuZCBQaXBlV2lyZQoKTW9kaWZ5aW5nIC9l
dGMvbW9kcHJvYmUuZC9hbHNhLWJhc2UuY29uZiB3aXRoIHZhcmlvdXMgbW9kZWwgcGFyYW1ldGVy
czoKCm1vZGVsPWxlbm92bwoKbW9kZWw9aWRlYXBhZAoKbW9kZWw9ZHVhbC1jb2RlY3MKCm1vZGVs
PWF1dG8KClZlcmlmeWluZyB3aXRoIGFsc2FtaXhlciB0aGF0IE1pYyBBQ1AgTEVEIHJlbWFpbnMg
b2ZmIChkaXNhYmxlZCkKClVzaW5nIHBhdnVjb250cm9sLCBidXQgdGhlIGlucHV0IGRldmljZSBz
aG93cyBhcyAiTWljcm9waG9uZSAodW5wbHVnZ2VkKSIKClRoZSBtaWNyb3Bob25lIHdvcmtzIHBl
cmZlY3RseSB1bmRlciBXaW5kb3dzLgoKRHVlIHRvIHRoaXMgbGltaXRhdGlvbiwgSSBhbSBmb3Jj
ZWQgdG8gY2FycnkgYW5kIHVzZSBhbiBleHRlcm5hbCBVU0IgbWljcm9waG9uZSBkdXJpbmcgbXkg
b25saW5lIG1lZXRpbmdzLiBXaGlsZSB0aGlzIHdvcmthcm91bmQgaGVscHMsIGl04oCZcyBpbmNv
bnZlbmllbnQsIGFuZCBJIGhvcGUgdGhpcyBpc3N1ZSBjYW4gYmUgcmVzb2x2ZWQgYXQgdGhlIGRy
aXZlci9maXJtd2FyZS9rZXJuZWwgbGV2ZWwgZm9yIEFNRCArIFJlYWx0ZWstYmFzZWQgbGFwdG9w
cyBsaWtlIG1pbmUuCgpOb3RlOiBOb3QgbG9uZyBhZ28sIEkgd2FzIGFibGUgdG8gdXNlIHRoaXMg
c2FtZSBpbnRlcm5hbCBtaWNyb3Bob25lIHVuZGVyIExpbnV4IE1pbnQgb24gdGhpcyB2ZXJ5IGxh
cHRvcCwgaW5jbHVkaW5nIGluIFpvb20tbGlrZSBhcHBsaWNhdGlvbnMuIFRoaXMgc3VnZ2VzdHMg
dGhhdCBlaXRoZXIgYSBrZXJuZWwsIGRyaXZlciwgb3IgUGlwZVdpcmUgdXBkYXRlIG1pZ2h0IGhh
dmUgYnJva2VuIHN1cHBvcnQgcmVjZW50bHkuCgpTeXN0ZW0gRGV0YWlsczoKCkRpc3RybzogTGlu
dXggTWludCAyMi4xIFhpYSAoYmFzZWQgb24gVWJ1bnR1IDI0LjA0IE5vYmxlKQoKS2VybmVsOiA2
LjguMC01OS1nZW5lcmljCgpEZXNrdG9wOiBDaW5uYW1vbiA2LjQuOCAoTXVmZmluIDYuNC4xKQoK
TGFwdG9wOiBMZW5vdm8gWW9nYSBTbGltIDcgUHJvIDE0QVJINwoKQ1BVOiBBTUQgUnl6ZW4gNSA2
NjAwSFMgQ3JlYXRvciBFZGl0aW9uCgpBdWRpbyBDb2RlYzogUmVhbHRlayBBTEMyNTcgKHdpdGgg
QUNQL0FDUDZ4IHN1cHBvcnQpCgpTb3VuZCBiYWNrZW5kcyB0ZXN0ZWQ6IFB1bHNlQXVkaW8sIFBp
cGVXaXJlCgpBdWRpbyBkZXZpY2VzIGRldGVjdGVkOgoKQU1EIFJlbWJyYW5kdCBIRCBBdWRpbyAo
c25kX2hkYV9pbnRlbCkKCkFNRCBBQ1AvQUNQNnggQXVkaW8gQ29wcm9jZXNzb3IgKHNuZF9wY2lf
YWNwNngpCgpBTUQgRmFtaWx5IDE3aC8xOWggSEQgQXVkaW8gKHNuZF9oZGFfaW50ZWwpCgpDdXJy
ZW50IHdvcmthcm91bmQ6IEJPWUEgTTEgdmlhIFVTQi1DIERBQyAocmVjb2duaXplZCBhcyBVU0Ig
QXVkaW8pCgpQbGVhc2UgY29uc2lkZXIgaW1wcm92aW5nIHN1cHBvcnQgZm9yIHRoaXMgaGFyZHdh
cmUgY29tYmluYXRpb24uIEkgcmVhbGx5IGxvdmUgTGludXggTWludCBhbmQgd2FudCB0byBzdGlj
ayB3aXRoIGl0IGxvbmctdGVybS4KClRoYW5rIHlvdSBmb3IgeW91ciB3b3JrIQoKQmVzdCByZWdh
cmRzLApBbGkgRnVhdAoKSXNzdWUgVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXBy
b2plY3QvYWxzYS11Y20tY29uZi9pc3N1ZXMvNTYwClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dp
dGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYK
