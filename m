Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0CA74316
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Mar 2025 05:54:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB03601C8;
	Fri, 28 Mar 2025 05:54:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB03601C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743137675;
	bh=1i+8XWWBx91lBxWu9daJalZ12sGoGf1uIKvO1Psl2NQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=e6oz3VEp66QxexcrhLTz+BjCklkmrisYfNnU9jwxxqRIWG0buUFEoNTwUf/10Y7wD
	 16b0xf0YDFb76r1HmEPzfN4OvHFHJizq+8n5Zi4tXm9eyz7ZqJIjFfKltQ2WNFXIhn
	 4S9jjb693JHBn4SO2JaXN8wMCEgfS1eadMQTEDqg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEAD3F805BF; Fri, 28 Mar 2025 05:54:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC238F805BD;
	Fri, 28 Mar 2025 05:54:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD1B0F80548; Fri, 28 Mar 2025 05:53:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D7AEF800E5
	for <alsa-devel@alsa-project.org>; Fri, 28 Mar 2025 05:53:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D7AEF800E5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1830de71ae5b7200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/537@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/537@alsa-project.org>
Subject: Add UCM2 support for ASUS ROG Strix B850-I Gaming WiFi
Date: Fri, 28 Mar 2025 05:53:57 +0100 (CET)
Message-ID-Hash: EINMCBUMGIFJAG4QSQWH4NKQ4QW64V66
X-Message-ID-Hash: EINMCBUMGIFJAG4QSQWH4NKQ4QW64V66
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EINMCBUMGIFJAG4QSQWH4NKQ4QW64V66/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #537 was edited from austinthiel:

Referenced [this guide](https://askubuntu.com/a/1469066) to get SPDIF out working on my ASUS B850-I Gaming WiFi

[alsa-info.txt](https://github.com/user-attachments/files/19499096/alsa-info.txt)

In case it's relevant, using a sample rate of 48kHz is required. I found that other sample rate produces very low quality, garbled audio.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/537
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/537.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
