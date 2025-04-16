Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A9A90A62
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Apr 2025 19:47:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8719762EA7;
	Wed, 16 Apr 2025 19:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8719762EA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744825618;
	bh=ddnEygVHQbt4rJXSWSbewq/sGNKs7ENJWC7NeAziJ7I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=i5mWMvMD3JPyQf1qxay0fcrC6BAjPhMKEIviINmx/OORFbQQftH/LgvARGHVatelC
	 i2obHaTJR4Xjhg8Aw7xk+c5C1xvAanH5nUANvf7MAV0bBaZ3a/lQb00FOHHl2gVLZ0
	 rNt2OG/948+7nQvrCYKvoVwGZRp1/4gqnKaFw9Fg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAC99F805E5; Wed, 16 Apr 2025 19:45:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2584F805EF;
	Wed, 16 Apr 2025 19:45:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3F3FF805E0; Wed, 16 Apr 2025 19:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 69167F80224
	for <alsa-devel@alsa-project.org>; Wed, 16 Apr 2025 19:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69167F80224
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1836dd943c6d2b00-webhooks-bot@alsa-project.org>
In-Reply-To: <1836dd943c6a8900-webhooks-bot@alsa-project.org>
References: <1836dd943c6a8900-webhooks-bot@alsa-project.org>
Subject: No audio on Lenovo Yoga Slim 7 14ILL10
Date: Wed, 16 Apr 2025 19:45:35 +0200 (CEST)
Message-ID-Hash: 3SR5DOLQATE3WTUPIJCBI2VCACL4GV5Y
X-Message-ID-Hash: 3SR5DOLQATE3WTUPIJCBI2VCACL4GV5Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SR5DOLQATE3WTUPIJCBI2VCACL4GV5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #548 was edited from miguel1117:

Only "Dummy Output" is available as an output device on the Lenovo Yoga Slim 7 14ILL10. I'm not absolutely sure if this is the right place to report this so apologies if it's not.

[ALSA information](https://alsa-project.org/db/?f=71342ec47d52681c81335d75d2947d89691f3c77)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/548
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
