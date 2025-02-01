Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDBCA24811
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Feb 2025 10:58:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB3A060184;
	Sat,  1 Feb 2025 10:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB3A060184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738403905;
	bh=M8WhRNDsnmtlQ56xtsY/3UMq8hIUwYaVaIa6IRjYMQY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pEhBXBf44bon+BpKJfRG7qOIhISNk92IEWXn/if3G3+lmd7eO9wfl+7rR05xcXwWr
	 oE+yVRxRCugaenizZomiZCIldtHaXIgOhMNGtxq8ATmBicdHnCjIgVxJQmP4A5KK6G
	 lVKSaxJECcY00opc5r1OaZBFjAXSSrEdE8b7LXjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E9ACF805BB; Sat,  1 Feb 2025 10:57:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A16F805BF;
	Sat,  1 Feb 2025 10:57:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82BEEF8051F; Sat,  1 Feb 2025 10:57:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D7BF8019B
	for <alsa-devel@alsa-project.org>; Sat,  1 Feb 2025 10:57:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1D7BF8019B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1738403847078052521-webhooks-bot@alsa-project.org>
References: <1738403847078052521-webhooks-bot@alsa-project.org>
Subject: ALC4082 - Asrock B850 Steel Legend
Message-Id: <20250201095731.82BEEF8051F@alsa1.perex.cz>
Date: Sat,  1 Feb 2025 10:57:31 +0100 (CET)
Message-ID-Hash: A6CQ5C4ASTQNEEDTOYI3HWK3PSDGZWHJ
X-Message-ID-Hash: A6CQ5C4ASTQNEEDTOYI3HWK3PSDGZWHJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6CQ5C4ASTQNEEDTOYI3HWK3PSDGZWHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #505 was opened from ct85msi:

Hello,

ALC4082 isn`t functioning properly, please add the needed support. Here is the output of alsa-info.sh:

http://alsa-project.org/db/?f=212e4da6e5c545eeb6d105b17a769202aff651a7

Thanks in advance,

Sorin

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/505
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
