Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3952A90A60
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Apr 2025 19:46:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A37A60278;
	Wed, 16 Apr 2025 19:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A37A60278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744825560;
	bh=5ySA7NW4dJU6oElR2DtLk5XaHSYZ9MzzEAI6shNtC3U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FfCIixgVuI+arBjZAIiYBV4AG1uwlVSvAFAwOAJFFfXz9oIqi74rkd6PHSJnsJUxL
	 LzAn6rHWDJq6rvRFi7JacS+A1/evSuAK0qK2Fz5XR5bae52Ed/DZ/0ZQmRUOG4T7Cq
	 4uH4yqG23fmdCDRMy2XjhzpeWqhuMsIp6sYUifsY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D980F8053D; Wed, 16 Apr 2025 19:45:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FDE3F8053D;
	Wed, 16 Apr 2025 19:45:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52F5EF80224; Wed, 16 Apr 2025 19:45:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DD03F80027
	for <alsa-devel@alsa-project.org>; Wed, 16 Apr 2025 19:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DD03F80027
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1836dd91536ccc00-webhooks-bot@alsa-project.org>
In-Reply-To: <1836dd9152fe7900-webhooks-bot@alsa-project.org>
References: <1836dd9152fe7900-webhooks-bot@alsa-project.org>
Subject: No audio on Lenovo Yoga Slim 7 14ILL10
Date: Wed, 16 Apr 2025 19:45:24 +0200 (CEST)
Message-ID-Hash: M2RQ4DY6DZJWQKP6XSWGBBYS5KJ65T24
X-Message-ID-Hash: M2RQ4DY6DZJWQKP6XSWGBBYS5KJ65T24
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2RQ4DY6DZJWQKP6XSWGBBYS5KJ65T24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #548 was edited from miguel1117:

Only "Dummy Output" is available as an output device on the Lenovo Yoga Slim 7 14ILL1. I'm not absolutely sure if this is the right place to report this so apologies if it's not.

[ALSA information](https://alsa-project.org/db/?f=71342ec47d52681c81335d75d2947d89691f3c77)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/548
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
