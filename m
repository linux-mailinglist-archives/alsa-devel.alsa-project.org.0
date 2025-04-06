Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AFAA7D092
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Apr 2025 23:01:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24C3261B89;
	Sun,  6 Apr 2025 23:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24C3261B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743973276;
	bh=DYuzd8liZvs7oRp59+V1cvQBBpK2y10tM+MrAyR3hhk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qFBHTbosSbLErLV/OUBXUF7NDB6mYNjnjjHJdhiQqYMj34S4PIRTC2EOaToUTcOaw
	 ag7g7leLWI4z8pv5idLaQGtZn8Qbjm+g4VNrKq/yCw2V9f5hDhl3CrDSMqYl6jexRY
	 Yn4b01PsHSYYFkIUarQEPpYiUuUQwzKTmOnMfcwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E91B8F805C4; Sun,  6 Apr 2025 23:00:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DF35F80116;
	Sun,  6 Apr 2025 23:00:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D7A7F80116; Sun,  6 Apr 2025 23:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 90C7AF8003C
	for <alsa-devel@alsa-project.org>; Sun,  6 Apr 2025 23:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90C7AF8003C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1833d664faadd100-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/450@alsa-project.org>
References: <alsa-project/alsa-lib/pr/450@alsa-project.org>
Subject: pcm: hw: do not reset tstamp_type in SND_PCM_APPEND mode
Date: Sun,  6 Apr 2025 23:00:17 +0200 (CEST)
Message-ID-Hash: MRNCEMKGXDBNCVKSHFO3UVQXJUCHJZYN
X-Message-ID-Hash: MRNCEMKGXDBNCVKSHFO3UVQXJUCHJZYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MRNCEMKGXDBNCVKSHFO3UVQXJUCHJZYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #450 was opened from kgroeneveld:

When the first client of plugins such as dshare open the hw device they set a default tstamp_type in snd_pcm_direct_initialize_slave based on tstamp_type from the config file. But when subsequent clients open the same plugin the snd_pcm_hw_open_fd function clobbers this default.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/450
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/450.patch
Repository URL: https://github.com/alsa-project/alsa-lib
