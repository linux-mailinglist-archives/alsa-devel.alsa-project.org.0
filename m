Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEBFB0B6D5
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jul 2025 18:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A99601FA;
	Sun, 20 Jul 2025 18:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A99601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753027528;
	bh=qQLDhwjNH2hGrFWnIM6NDC2uVisVCLXPFoqOAbY6Ld8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KVVguM2S80znj+BYtXt0XhVf0+E7ALawiadCBFmz5jNN5uL/w8n6Sx/+Mx28FugtH
	 hQAb+mHK9IbwyPVC+XmqS3uWenlH4vKBz/9bHMbVHR326x7x8YO0K7CySnhY3LoSEP
	 ZY04eq1z5v8LHyG8wN7zcEh80GJUWR+yWmqVuDfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 552DDF805C5; Sun, 20 Jul 2025 18:04:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35C70F805C4;
	Sun, 20 Jul 2025 18:04:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD006F80185; Sun, 20 Jul 2025 18:04:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 15650F80087
	for <alsa-devel@alsa-project.org>; Sun, 20 Jul 2025 18:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15650F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18540135198af000-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/596@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/596@alsa-project.org>
Subject: Rename qcs6490-rb3gen2 and qcs9075-iq-evk ucm2 conf
Date: Sun, 20 Jul 2025 18:04:44 +0200 (CEST)
Message-ID-Hash: MGRUC5LGUYGZWI3N5AJLQOJKIO7ZSVPQ
X-Message-ID-Hash: MGRUC5LGUYGZWI3N5AJLQOJKIO7ZSVPQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGRUC5LGUYGZWI3N5AJLQOJKIO7ZSVPQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #596 was opened from mohsRafi:

Rename the ucm2 conf for Qualcomm qcs6490-rb3gen2 and qcs9075-iq-evk

qcs6490-rb3gen2-snd-card.conf -> QCS6490-RB3Gen2.conf
qcs9075-iq-evk-snd-card.conf -> QCS9075-IQ-EVK.conf

Removed snd-card tags from conf files

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/596
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/596.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
