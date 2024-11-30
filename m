Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC53B9DF051
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Nov 2024 13:29:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 759CB21B4;
	Sat, 30 Nov 2024 13:29:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 759CB21B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732969765;
	bh=PNGlgbPzmWPCGyV7SFQDCxYutx5tVCarFD8e1njBrMk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WdyZFJIib3EMQ4sd0HzGn8bV63NkKWjuNuHRubnKYykh5Ed+tMatNUqKEgO0w6RWI
	 fp0sxJ/6gmB1++LWDpCfWMYi8gLkV/3mjVZWUrmQPNJONGSsamqM0fcC1+a/uzaOLb
	 V/kdTjp7/BhtCrZOrV43U3m2goEmzLFYAd4zsy38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AF49F805B2; Sat, 30 Nov 2024 13:28:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FCF6F805BD;
	Sat, 30 Nov 2024 13:28:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FE6EF80236; Sat, 30 Nov 2024 13:28:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E143F80073
	for <alsa-devel@alsa-project.org>; Sat, 30 Nov 2024 13:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E143F80073
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732969725839164734-webhooks-bot@alsa-project.org>
References: <1732969725839164734-webhooks-bot@alsa-project.org>
Subject: Linux Mint Cinnamon 22 Soundblaster AE-9 no sound
Message-Id: <20241130122848.2FE6EF80236@alsa1.perex.cz>
Date: Sat, 30 Nov 2024 13:28:48 +0100 (CET)
Message-ID-Hash: IXAQH5PN5CS5EYSVSOP2ILBINOKGPU5L
X-Message-ID-Hash: IXAQH5PN5CS5EYSVSOP2ILBINOKGPU5L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IXAQH5PN5CS5EYSVSOP2ILBINOKGPU5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtbGliIGlzc3VlICM0MjQgd2FzIG9wZW5lZCBmcm9tIFN0YXJmb3hm
czoKCkhpLA0KDQppIGhhdmUgZnJlc2ggaW5zdGFsbGVkIExpbnV4IE1pbnQgQ2lubmFtb24gMjIg
S2VybmVsIDYuOC4wLjQ5LWdlbmVyaWMNCg0KSSBjYW7CtHQgZ2V0IHRoZSBTb3VuZGJsYXN0ZXIg
QUUtOSB0byB3b3JrLiBDcmVhdGl2ZSBMYWJzIGhhcyBubyBEcml2ZXJzIGZvciBMaW51eCBhbmQg
cG9pbnRzIHRvIHRoZSBhbHNhIGNvbW11bml0eS4NCg0KSXMgdGhlcmUgYW55IGNoYW5nZSB0byBn
ZXQgc3VwcG9ydCBmb3IgdGhlIFNvdW5kYmxhc3RlciBBRS05IGluIHRoZSBmdXR1cmUgPw0KDQpJ
IHRoaW5rIHRoZSBiaWcgUHJvYmxlbSBpcyB0aGUgZXh0ZXJuYWwgREFDIGZvciBIZWFkcGhvbmVz
IGZyb20gdGhlIFNvdW5kYmxhc3RlciBBRS05LiBJbiBXaW5kb3dzIHRoaXMgImNsaWNrcyIgb24g
c3RhcnR1cCBhbmQgYWN0aXZhdGVzIHRoZSBEQUMsIGJ1dCBpbiBMaW51eCB0aGlzIGlzIGFsbCBk
ZWFkLgoKSXNzdWUgVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxz
YS1saWIvaXNzdWVzLzQyNApSZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2Et
cHJvamVjdC9hbHNhLWxpYgo=
