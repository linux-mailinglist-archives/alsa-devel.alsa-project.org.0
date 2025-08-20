Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003DB2E828
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Aug 2025 00:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67F626020A;
	Thu, 21 Aug 2025 00:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67F626020A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755728764;
	bh=ZaP7XxuguDCdIa6AEOp4RVkYDnGk5sXDCSAoRWVYVCw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sWA9pbJFase57NMDD4HEj4p9ExtScD7nr3uS/iru0xoUc9leZXyAKnd1YisvmJdql
	 CZ78hcvzL4E2RkBzzST+AqPBA3bfLdMfK7tkFQ1xNn4tWZHJFdvZVARV4OmX9w1upY
	 RAm9VVbZfKxPfuQ3NqunVbaTp00AmzBa9U0CXQ5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9760EF805CB; Thu, 21 Aug 2025 00:25:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 186E5F805C9;
	Thu, 21 Aug 2025 00:25:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E2ADF80518; Thu, 21 Aug 2025 00:25:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A579F80152
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 00:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A579F80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185d99f876c2d600-webhooks-bot@alsa-project.org>
In-Reply-To: <185d99f875f80700-webhooks-bot@alsa-project.org>
References: <185d99f875f80700-webhooks-bot@alsa-project.org>
Subject: Audio garbled when using Multi plugin to record from 2+ USB
 soundcards on Raspberry Pi
Date: Thu, 21 Aug 2025 00:25:24 +0200 (CEST)
Message-ID-Hash: PTV3Z7ZV3B5BQJ5C24IS4QS76J4DR3DX
X-Message-ID-Hash: PTV3Z7ZV3B5BQJ5C24IS4QS76J4DR3DX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PTV3Z7ZV3B5BQJ5C24IS4QS76J4DR3DX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #472 was opened from TommyKaneko:

I have been trying to use the multi plugin to record multiple channels from mutliple soundcards on the Raspberry Pi.  The results are a garbled mess.

I have diagnosed the reasons as thus:
- current raspberry Pi OS uses alsa v1.2.8+rpt1
- the "fix" for the multi plugin was implemented in v1.2.9 : https://github.com/alsa-project/alsa-lib/commit/369df322577034ea872978d6470edbadf30d81a9

I am aware that the multi plugin was not meant to be used on multiple soundcards that are not in sync, however if the clock drifts over time, this is ok for my application.

I am here to seek advice on how I should go about creating a workaround.  The limitations are that I need to use cheap USB microphones (it is a weight issue).

Without going along the microcontroller route, I thought one way was to make an [external plugin](https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_external_plugins.html), based on the newly patched pcm_multi plugin.  I am working on this, while climbing the steep learning curve.  Perhaps I can contribute an external plugin for the project...

In the meantime, does a developer have a better suggestion that I might have success with?  Or any tips if you are familiar with the pcm_multi plugin? @perexg ?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/472
Repository URL: https://github.com/alsa-project/alsa-lib
