Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CD7B03A57
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jul 2025 11:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0F8F6020B;
	Mon, 14 Jul 2025 11:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0F8F6020B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752484080;
	bh=J7mAYsiNfmqkTuZdUlI4k6Swtsy2yTEIRXXZOCQA6ro=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TyuUrgfGPs1AL0uWyUR3awbd+XdopBVDLJk6llxzUOb28P+B3tPlyWhQN7hPcm98n
	 O9TXX4bmApSYARoQbgkSV3MSLrlgfnFSJlwjIJ9zuiC3aX/VrVGbyG2FVwg7j7qgKw
	 WsLVP5m4aBZv5/jFiXTqyY5+c1J2oesC0sQKJKK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B503F805F3; Mon, 14 Jul 2025 11:07:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63E0DF805E5;
	Mon, 14 Jul 2025 11:07:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DF7BF804E5; Mon, 14 Jul 2025 11:07:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 2506BF800F8
	for <alsa-devel@alsa-project.org>; Mon, 14 Jul 2025 11:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2506BF800F8
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185212eff29e8d00-webhooks-bot@alsa-project.org>
In-Reply-To: <185212efefa23200-webhooks-bot@alsa-project.org>
References: <185212efefa23200-webhooks-bot@alsa-project.org>
Subject: Feature request: Add native support for CS8409 codec
Date: Mon, 14 Jul 2025 11:07:08 +0200 (CEST)
Message-ID-Hash: GV673455RDAW2JNUQMIGJSQESNUMYIQK
X-Message-ID-Hash: GV673455RDAW2JNUQMIGJSQESNUMYIQK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GV673455RDAW2JNUQMIGJSQESNUMYIQK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzU5MyB3YXMgb3BlbmVkIGZyb20gTWFy
ZWstbWFoYXY6CgpJJ3ZlIHRlc3RlZCB0aGUgQ1M4NDA5IGRyaXZlciBvbiBVYnVudHUgMjQuMDQu
MiB3aXRoIFdheWxhbmTigKYgW2NlbMO9IHRleHQgdHVdCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6
Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1jb25mL2lzc3Vlcy81OTMKUmVwb3Np
dG9yeSBVUkw6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZgo=
