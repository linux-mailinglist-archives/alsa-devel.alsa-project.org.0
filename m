Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66931A6D7EF
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Mar 2025 11:01:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B74E601C7;
	Mon, 24 Mar 2025 11:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B74E601C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742810472;
	bh=pKeSCioy/MLM0L4ljKK+pe16/iH0BZ7vi5YYI+FB+dg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uPn+pQzRtW1vbgKZjKvVhMDSimL2ZUGeEERRkLTgj947IP1jRK/BzcrqQRxwkJnJQ
	 MNcQFDkURIaH8RYMWpPRiD+piR4yz5qWXRqrATlK9F8cxglURO3cHxJ4YgOobsu7u/
	 GOc11jMJMFZB3qZg/NsOXlvO8og4oMf8EHw1tb4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC03DF804CC; Mon, 24 Mar 2025 11:00:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 494BFF805AF;
	Mon, 24 Mar 2025 11:00:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A596F80424; Mon, 24 Mar 2025 10:58:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id F31B5F800B6
	for <alsa-devel@alsa-project.org>; Mon, 24 Mar 2025 10:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F31B5F800B6
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182fb4bffee3d200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/531@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/531@alsa-project.org>
Subject: ucm2: Qualcomm: add HP Omnibook X14  support
Date: Mon, 24 Mar 2025 10:58:45 +0100 (CET)
Message-ID-Hash: V5UTRGWAKAT6H34CSZ5KUPQHHR5AB52T
X-Message-ID-Hash: V5UTRGWAKAT6H34CSZ5KUPQHHR5AB52T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5UTRGWAKAT6H34CSZ5KUPQHHR5AB52T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #531 was opened from jglathe:

assume same as T14s (2 speakers)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/531
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/531.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
