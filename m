Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED83A78804
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Apr 2025 08:18:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A71601BB;
	Wed,  2 Apr 2025 08:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A71601BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743574718;
	bh=xxvkgKTr400paha/SPxLZ+d4Oplkfzf3zy8hj16xcWU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EHfVrBVjmZEuuS0445cSzPO3KuxTr4jNmtD0ZkTYxyaWM27A5+V21zibZA03iNqSt
	 KwmuTyzXldTuSXxey/OtFBSf9wI4cjnjFM05NnR2+U0X0+ZXnsKw4pYUNyxWFY39vw
	 HuAAZSxOArA3tCQWwx+Br9LgVurARdNS2YewhZjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D5A9F805B0; Wed,  2 Apr 2025 08:18:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B8E4F805BE;
	Wed,  2 Apr 2025 08:18:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4F8BF80301; Wed,  2 Apr 2025 08:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 10313F800D2
	for <alsa-devel@alsa-project.org>; Wed,  2 Apr 2025 08:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10313F800D2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18326beea16a7400-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-utils/pr/297@alsa-project.org>
References: <alsa-project/alsa-utils/pr/297@alsa-project.org>
Subject: aplay: add support for G.711 A_LAW enconding in AU file format
Date: Wed,  2 Apr 2025 08:18:00 +0200 (CEST)
Message-ID-Hash: P74WCN3I6MASXYCFUR2AFQOOQSEEUI6S
X-Message-ID-Hash: P74WCN3I6MASXYCFUR2AFQOOQSEEUI6S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P74WCN3I6MASXYCFUR2AFQOOQSEEUI6S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMgcHVsbCByZXF1ZXN0ICMyOTcgd2FzIG9wZW5lZCBmcm9t
IGNobGVyb3k6CgpBdCB0aGUgdGltZSBiZWluZywgYXBsYXkgb25seSBzdXBwb3J0cyBHLjcxMSDC
tS1sYXcsIDgtYml0cyBQQ00gYW5kIDE2LWJpdHMgUENNIGVuY29kaW5ncyBmb3IgdGhlIEFVIGZv
cm1hdCB3aGlsZSB0aGUgQVUgZm9ybWF0IHN1cHBvcnRzIG1hbnkgbW9yZS4NCg0KSW4gRXVyb3Bl
IHRoZSBtb3N0IEcuNzExIHVzZWQgZW5jb2RpbmcgaXMgdGhlIEEtbGF3LCB3aGljaCBpcyBhbHNv
IHBhcnQgb2YgdGhlIGVuY29kaW5ncyBzdXBwb3J0ZWQgYnkgdGhlIEFVIGZpbGUgZm9ybWF0Lg0K
DQpBZGQgc3VwcG9ydCBmb3IgdGhhdCBlbmNvZGluZyBpbiBhcGxheS4KClJlcXVlc3QgVVJMICAg
OiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMvcHVsbC8yOTcKUGF0
Y2ggVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11dGlscy9w
dWxsLzI5Ny5wYXRjaApSZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJv
amVjdC9hbHNhLXV0aWxzCg==
