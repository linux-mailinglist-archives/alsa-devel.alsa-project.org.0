Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB61B19B69
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Aug 2025 08:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F01560243;
	Mon,  4 Aug 2025 08:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F01560243
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754288057;
	bh=KJM8i5kC+apt1M4ClhgJKh1KK5ayGOEzU/4lv9rRT7Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Mj3VjyZ+viEf4d9urb9aiTV1NH1zOduensqpGUHONhe6QDhEneCsCBQzxVN7QSNOb
	 ilP84HQKWkAib0UjcKRvSlm0a5IKua2qbUdkrTgtzzmw4sMy9uWiG1eeokvE4tM+ld
	 ISbYRSwGrFKRIobKIszOs95HwOWzzkbP5T218yMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC790F805C6; Mon,  4 Aug 2025 08:13:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E216F805C0;
	Mon,  4 Aug 2025 08:13:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73D5EF804CF; Mon,  4 Aug 2025 08:13:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 036F0F8003C
	for <alsa-devel@alsa-project.org>; Mon,  4 Aug 2025 08:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 036F0F8003C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18587ba097f67b00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/597@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/597@alsa-project.org>
Subject: Qualcomm: Add QCS8275-IQ8-EVK HiFi config
Date: Mon,  4 Aug 2025 08:13:15 +0200 (CEST)
Message-ID-Hash: ZSVX4MARSOZJD2QJGMA4TGO77TT5PZ67
X-Message-ID-Hash: ZSVX4MARSOZJD2QJGMA4TGO77TT5PZ67
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSVX4MARSOZJD2QJGMA4TGO77TT5PZ67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #597 was opened from mohsRafi:

Add UCM2 configs for the Qualcomm QCS9075-IQ8-EVK Board to handle:
	- I2S Speaker Amplifier
	- I2S Mic

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/597
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/597.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
