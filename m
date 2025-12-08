Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C76CACF94
	for <lists+alsa-devel@lfdr.de>; Mon, 08 Dec 2025 12:18:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6440560184;
	Mon,  8 Dec 2025 12:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6440560184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765192723;
	bh=Bcp2PKCl/Monhf10C+fBOW0dGZ84ppb+rJDVd/jjiIM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gn8pjfgz4E4rPiwqB17+JTYTuiYrqlAVmkQc/3pHcVUC08/yYG4iej8WFFJjgjKRc
	 u3FG7L+a6K0Z9e5FzwKuoFzHh8Ra0z/N1vibJeTo3lb9/JmRHTBxAHFUsukqSdqnjN
	 mgMZe1lrjlrjNnC6aPDJXp+VYdQEtyPWmPqj5Gr0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0127F805DF; Mon,  8 Dec 2025 12:18:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 903FFF80568;
	Mon,  8 Dec 2025 12:18:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CDD7F80525; Mon,  8 Dec 2025 12:18:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 82E00F804B2
	for <alsa-devel@alsa-project.org>; Mon,  8 Dec 2025 12:17:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82E00F804B2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187f39630c66bb00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-utils/pr/311@alsa-project.org>
References: <alsa-project/alsa-utils/pr/311@alsa-project.org>
Subject: alsactl: fix build when in subdirectory
Date: Mon,  8 Dec 2025 12:18:00 +0100 (CET)
Message-ID-Hash: Z6ZTNLQ47YT7TREN37EUWSQ6HTYDWXGF
X-Message-ID-Hash: Z6ZTNLQ47YT7TREN37EUWSQ6HTYDWXGF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6ZTNLQ47YT7TREN37EUWSQ6HTYDWXGF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #311 was opened from heitbaum:

create the conf directory as part of the edit recipe

fixes: https://github.com/alsa-project/alsa-utils/commit/f047a8a66917960ef5a9ff0e41de507f0e58f381

Request URL   : https://github.com/alsa-project/alsa-utils/pull/311
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/311.patch
Repository URL: https://github.com/alsa-project/alsa-utils
