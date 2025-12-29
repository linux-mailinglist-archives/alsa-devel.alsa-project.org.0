Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7163CE832B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Dec 2025 22:15:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C16C8601F8;
	Mon, 29 Dec 2025 22:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C16C8601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767042951;
	bh=3O5gsO1zQ/tjEAW3b9LiMmGr2ifX7psQ8HbKFLbRhAw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=h1aiCVaqt2NNkFxqd64/xgU3FavEXvAQMCurUWJjt6qwEo1XGQlz/XE8/JdbVLWGv
	 eJQeIYV+f396k9m7B3oYzfCLsqEv+KDVvVpt0lJq90xHG6zxO+mn1X7uLtaBNyNqu6
	 Bh0sF5zT8NKWRqFio1/p7ndHe2jmeUWduMSDt8DY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 188B4F805E2; Mon, 29 Dec 2025 22:15:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81713F805D4;
	Mon, 29 Dec 2025 22:15:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27567F80533; Mon, 29 Dec 2025 22:15:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A1344F80185
	for <alsa-devel@alsa-project.org>; Mon, 29 Dec 2025 22:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1344F80185
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1885cc25e2e17000-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/669@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/669@alsa-project.org>
Subject: Add support for the Behringer ULM200D wireless microphones.
Date: Mon, 29 Dec 2025 22:15:03 +0100 (CET)
Message-ID-Hash: 773YDJ6UMB5XQ2F4FVKYHPHDIMFWL3WQ
X-Message-ID-Hash: 773YDJ6UMB5XQ2F4FVKYHPHDIMFWL3WQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/773YDJ6UMB5XQ2F4FVKYHPHDIMFWL3WQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #669 was opened from kevincox:

This is a USB receiver for two wireless microphones. Each microphone appears on a different channel. By default these would be detected as left and right.

Just a disclaimer, I don't know what I am doing here. I used the UMC202HD as a reference and changed the values where it seemed reasonable. This device also has no output so I deleted everything that seemed output related. Seems to work.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/669
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/669.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
