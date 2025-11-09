Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EF7C43D6E
	for <lists+alsa-devel@lfdr.de>; Sun, 09 Nov 2025 13:26:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648FE601F7;
	Sun,  9 Nov 2025 13:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648FE601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762691165;
	bh=0B3N7Z+J602MaobapevCBHRzL9OrLaraQ2Tc1fP5PVc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rntY76oe4W7ZbNW33rIAskvPTYgTkRvvFowqBxBbXBFpFo31wqFVIIdgjpVEJGJ6N
	 I+orYbljHfukxUOO+F9EADuwWFTqX9SfyAb9OeDbIXxHSoSn7rQv8aIYm+K+pYGnd0
	 CWk5XUs4TpdT9D46ax5bnf8962h9ZlOi2kX/vzkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B389F805CB; Sun,  9 Nov 2025 13:25:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6632F805CA;
	Sun,  9 Nov 2025 13:25:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1447F8028B; Sun,  9 Nov 2025 13:22:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 643B0F800E4
	for <alsa-devel@alsa-project.org>; Sun,  9 Nov 2025 13:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 643B0F800E4
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187656106ab0a400-webhooks-bot@alsa-project.org>
In-Reply-To: <187656106718e100-webhooks-bot@alsa-project.org>
References: <187656106718e100-webhooks-bot@alsa-project.org>
Subject: Regression on Lenovo Yoga 7i Aura Slim 14ILL10
Date: Sun,  9 Nov 2025 13:22:29 +0100 (CET)
Message-ID-Hash: BOGU5OHGPA7STYRA6ZTEEQNGF4SR64FN
X-Message-ID-Hash: BOGU5OHGPA7STYRA6ZTEEQNGF4SR64FN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOGU5OHGPA7STYRA6ZTEEQNGF4SR64FN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzYzOSB3YXMgb3BlbmVkIGZyb20gbmlr
b2xhLW1hcmljLWF1bGE6CgpJIGRpZCBhIGJpc2VjdCBhbmQgZm91bmQgdGhhdCBhZnRlciBodHRw
czovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYvcHVsbC82MjggbXkgYXVk
aW8gY29uZmlndXJhdGlvbiB3b3VsZG4ndCByZWNvZ25pemUgdGhlIGF1ZGlvIGNvbnRyb2xsZXIg
cHJvcGVybHkuIExldCBtZSBrbm93IHdoYXQgb3RoZXIgZGV0YWlscyB5b3Ugd2FudCBtZSB0byBp
bmNsdWRlLgoKSSdtIG9uIFplbiBrZXJuZWwgbW9zdGx5LCBidXQgaGF2ZSBhbHNvIHRyaWVkIExU
UyBhbmQgbWFpbmxpbmUuCgpCZWZvcmU6CmBgYGJhc2gKzrsg4oC6IHdwY3RsIHN0YXR1cyB8IGdy
ZXAgLUExNSAnQXVkaW8kJwpBdWRpbwog4pSc4pSAIERldmljZXM6CiDilIIgICAgICA0Ni4gTHVu
YXIgTGFrZS1NIEhEIEF1ZGlvIENvbnRyb2xsZXIgICAgW2Fsc2FdCiDilIIgIAog4pSc4pSAIFNp
bmtzOgog4pSCICAgICAgNTcuIEx1bmFyIExha2UtTSBIRCBBdWRpbyBDb250cm9sbGVyIEhETUkg
LyBEaXNwbGF5UG9ydCAzIE91dHB1dCBbdm9sOiAxLjAwXQog4pSCICAgICAgNTguIEx1bmFyIExh
a2UtTSBIRCBBdWRpbyBDb250cm9sbGVyIEhETUkgLyBEaXNwbGF5UG9ydCAyIE91dHB1dCBbdm9s
OiAxLjAwXQog4pSCICAgICAgNTkuIEx1bmFyIExha2UtTSBIRCBBdWRpbyBDb250cm9sbGVyIEhE
TUkgLyBEaXNwbGF5UG9ydCAxIE91dHB1dCBbdm9sOiAxLjAwXQog4pSCICAqICAgNjAuIEx1bmFy
IExha2UtTSBIRCBBdWRpbyBDb250cm9sbGVyIFNwZWFrZXIgW3ZvbDogMC40OF0KIOKUgiAgCiDi
lJzilIAgU291cmNlczoKIOKUgiAgICAgIDYxLiBMdW5hciBMYWtlLU0gSEQgQXVkaW8gQ29udHJv
bGxlciBIZWFkc2V0IE1pY3JvcGhvbmUgW3ZvbDogMS4wMF0KIOKUgiAgKiAgIDYyLiBMdW5hciBM
YWtlLU0gSEQgQXVkaW8gQ29udHJvbGxlciBEaWdpdGFsIE1pY3JvcGhvbmUgW3ZvbDogMC40OF0K
IOKUgiAgCiDilJzilIAgRmlsdGVyczoKIOKUgiAgCs67IOKAuiBhcGxheSAtbAoqKioqIExpc3Qg
b2YgUExBWUJBQ0sgSGFyZHdhcmUgRGV2aWNlcyAqKioqCmNhcmQgMDogc29mc291bmR3aXJlIFtz
b2Ytc291bmR3aXJlXSwgZGV2aWNlIDA6IEphY2sgT3V0ICgqKSBbXQogIFN1YmRldmljZXM6IDEv
MQogIFN1YmRldmljZSAjMDogc3ViZGV2aWNlICMwCmNhcmQgMDogc29mc291bmR3aXJlIFtzb2Yt
c291bmR3aXJlXSwgZGV2aWNlIDI6IFNwZWFrZXIgKCopIFtdCiAgU3ViZGV2aWNlczogMS8xCiAg
U3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKY2FyZCAwOiBzb2Zzb3VuZHdpcmUgW3NvZi1zb3Vu
ZHdpcmVdLCBkZXZpY2UgNTogSERNSTEgKCopIFtdCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2
aWNlICMwOiBzdWJkZXZpY2UgIzAKY2FyZCAwOiBzb2Zzb3VuZHdpcmUgW3NvZi1zb3VuZHdpcmVd
LCBkZXZpY2UgNjogSERNSTIgKCopIFtdCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNlICMw
OiBzdWJkZXZpY2UgIzAKY2FyZCAwOiBzb2Zzb3VuZHdpcmUgW3NvZi1zb3VuZHdpcmVdLCBkZXZp
Y2UgNzogSERNSTMgKCopIFtdCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNlICMwOiBzdWJk
ZXZpY2UgIzAKY2FyZCAwOiBzb2Zzb3VuZHdpcmUgW3NvZi1zb3VuZHdpcmVdLCBkZXZpY2UgMzE6
IERlZXBidWZmZXIgSmFjayBPdXQgKCopIFtdCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNl
ICMwOiBzdWJkZXZpY2UgIzAKzrsg4oC6IGxzcGNpIC1zIDAwOjFmLjMgLWtubiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+CjAw
OjFmLjMgTXVsdGltZWRpYSBhdWRpbyBjb250cm9sbGVyIFswNDAxXTogSW50ZWwgQ29ycG9yYXRp
b24gTHVuYXIgTGFrZS1NIEhEIEF1ZGlvIENvbnRyb2xsZXIgWzgwODY6YTgyOF0gKHJldiAxMCkK
CVN1YnN5c3RlbTogTGVub3ZvIERldmljZSBbMTdhYTozODM4XQoJS2VybmVsIGRyaXZlciBpbiB1
c2U6IHNvZi1hdWRpby1wY2ktaW50ZWwtbG5sCglLZXJuZWwgbW9kdWxlczogc25kX3NvZl9wY2lf
aW50ZWxfbG5sLCBzbmRfaGRhX2ludGVsCmBgYAoKPGltZyB3aWR0aD0iNDAwIiBzcmM9Imh0dHBz
Oi8vZ2l0aHViLmNvbS91c2VyLWF0dGFjaG1lbnRzL2Fzc2V0cy82YmFjNzhiYy1mZmFkLTQ3YTQt
YTQwZi01YmM4OWEwMzFjNTEiIC8+CgpBZnRlcjoKYGBgYmFzaApqdXN0IGEgbW9tZW50LCByZWJv
b3RpbmcKYGBgCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVj
dC9hbHNhLXVjbS1jb25mL2lzc3Vlcy82MzkKUmVwb3NpdG9yeSBVUkw6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZgo=
