Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2E7A63B48
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Mar 2025 03:19:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFA266030D;
	Mon, 17 Mar 2025 03:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFA266030D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742177951;
	bh=ura/HucCNOgXFDkTUyYys3sQS0iZJY6T0qhp7y3b2o0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=l86GMumB85GFyxe8zCEnKWjxbRGGhnBQq0HcDDWjBdFdcClh4rxtr/k7tZoJ3nuyU
	 5KPLNiJjc7LF8bYLYZP3VxpOgakheYsLSIGQ2QUbQJRpUcgXQdVLvDr2ey7WWogRj1
	 uih1c2vBzI8aiHX4/vwxsB4eAsIrzJZ1Nv3br+r4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA6C2F805B5; Mon, 17 Mar 2025 03:18:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F31F805B5;
	Mon, 17 Mar 2025 03:18:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB76CF8055B; Mon, 17 Mar 2025 03:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B26EFF8001D
	for <alsa-devel@alsa-project.org>; Mon, 17 Mar 2025 03:18:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B26EFF8001D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182d7593ff44b100-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/525@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/525@alsa-project.org>
Subject: sof-soundwire: rt1318: add playback control switch
Date: Mon, 17 Mar 2025 03:18:31 +0100 (CET)
Message-ID-Hash: S2B7L5MAEP65YSO5YCUAZP5NAJBWVYX4
X-Message-ID-Hash: S2B7L5MAEP65YSO5YCUAZP5NAJBWVYX4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S2B7L5MAEP65YSO5YCUAZP5NAJBWVYX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #525 was opened from shumingfan:

rt1318: add playback control switch

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/525
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/525.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
