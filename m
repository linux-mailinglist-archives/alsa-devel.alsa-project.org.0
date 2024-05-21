Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 451EC8CE524
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 14:19:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB694826;
	Fri, 24 May 2024 14:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB694826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716553166;
	bh=77IIIYYB5dIZuoNBgHxsCQxabhvSaEsGCFX7oP+yh4Y=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ax6pfi1qsODYa5YwIoYt/MwNGt9zE6MKzXrRyu7m8S+AgQFeR8Dwi2oU1NCKMEZEt
	 pS7SUFv2DFQEPaKIQBNW8W5NebER3Ip3gu9s/OiwiYJqTUrrZKnD1c1SzfMq7wCLSz
	 N0Y6jpach9RoNlMWP10/TRsuikU3PUOOjHp3XmJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A243DF80619; Fri, 24 May 2024 14:18:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2EB7F80608;
	Fri, 24 May 2024 14:18:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D85F1F8026A; Tue, 21 May 2024 23:44:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch
 [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0401F80051
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 23:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0401F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=pmqFS5XL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716327833; x=1716587033;
	bh=LChz5Z0iHy2fcOPSqS31L3D+6t74n/rbRBmYiSy94JU=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=pmqFS5XLShyve1hxurfv0q2xKoAMj9GI+trAoZb+WugF+/q5SZJu95Brdoumqo/MG
	 DVExFI+DNTVj0u86uw++ra0vPv9WYBuuxv9qkiswlGtex6aHVT7jqfEeZUAWE1XGx9
	 2c4aux6gwbY895/TKCvDgsnmojYAMVuXyqUUkiRJGTC2BQqnbWgaj+FfDf57VBcSX7
	 OpemBdHoCRvT4fCxj+KEJzeeNclUlU6Y+cLF2MzSbUDRsQxPqvs2UwdzR8SZbbpBw2
	 5xt5DHMhKpYIF3qABKr6+mcVVa+jGZFEEAYC5IbWfxomaDUB8Y8M0cqMVWsEZijAwk
	 KtPHCx3XNVqhw==
Date: Tue, 21 May 2024 21:43:48 +0000
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Mika Kilpi <sojuzstudio@protonmail.com>
Subject: Burst in sound UFX+ AVLinux MXE and Ubuntu studio
Message-ID: 
 <XeL42uj5cKjATYCpnTVdIPdpGbSBboq15zu-j5mb1hLQUL-QdYm1LDN4pN_Q1cGmmIbwrmF2fFE_PI4cm9alNH4GnMdZg9mdh9QlL61Sev8=@protonmail.com>
Feedback-ID: 10859013:user:proton
X-Pm-Message-ID: 64aca939eaf841b0c1ba4cd9a62e6de14f017614
MIME-Version: 1.0
X-MailFrom: sojuzstudio@protonmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7NX7HSWFVTRZIM3KBVQLTM2QLH3DYTSV
X-Message-ID-Hash: 7NX7HSWFVTRZIM3KBVQLTM2QLH3DYTSV
X-Mailman-Approved-At: Fri, 24 May 2024 12:17:03 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=utf-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NX7HSWFVTRZIM3KBVQLTM2QLH3DYTSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8sCgpDYW4geW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCBteSBwcm9ibGVtIHRoYXQgSSBo
YXZlIHdyaXR0ZW4gYWJvdXQgb24gdGhlIFJNRSBmb3J1bT8KCmh0dHBzOi8vZm9ydW0ucm1lLWF1
ZGlvLmRlL3ZpZXd0b3BpYy5waHA/aWQ9MzkzODUKCktpbmQgUmVnYXJkcwpNaWthIEtpbHBpCgpT
ZW50IHdpdGggW1Byb3RvbiBNYWlsXShodHRwczovL3Byb3Rvbi5tZS8pIHNlY3VyZSBlbWFpbC4=
