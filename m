Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3D9A84F0D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Apr 2025 23:09:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBBFE69380;
	Thu, 10 Apr 2025 23:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBBFE69380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744319370;
	bh=DlQABFIPmH9wHwFO5pd55GRT4Z9e33lnDlJlf9exdtU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hidYp9IiOWCpepp4U6DB0gXNV/BYP+KhtE6yhZ39iOiQMAh29zmpH890JgWToq1K/
	 Z23ybvbBH12ymlF/btUx3IGA+1H3u2kGpP07VsXOKDDh0DpR0um1xYBgdIrVvg/bE/
	 puRsZc5KCrefde5hLn2aohGe5kfVzMR9FXipTaX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4D9AF805C1; Thu, 10 Apr 2025 23:08:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF3BF805BF;
	Thu, 10 Apr 2025 23:08:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F21FAF8028B; Thu, 10 Apr 2025 23:08:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id E4CF8F80124
	for <alsa-devel@alsa-project.org>; Thu, 10 Apr 2025 23:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4CF8F80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1835112f548cca00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/545@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/545@alsa-project.org>
Subject: Add support of HyperX SoloCast
Date: Thu, 10 Apr 2025 23:08:48 +0200 (CEST)
Message-ID-Hash: 5D6MZ6XOL42Y7DS6WRGZFYNA342AVL5R
X-Message-ID-Hash: 5D6MZ6XOL42Y7DS6WRGZFYNA342AVL5R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5D6MZ6XOL42Y7DS6WRGZFYNA342AVL5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #545 was opened from serhii-nakon:

Support of
- volume control
- un/mute control

PS: About un/mute control - only from PC to Mic, vise versa does not work - like when you un/mute Mic on PC it works as expected (even LED show actual status) but when you click button on Mic side it does not reflect on PC side.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/545
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/545.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
