Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F9A6C66D
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Mar 2025 00:24:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB51D6033A;
	Sat, 22 Mar 2025 00:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB51D6033A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742599459;
	bh=3qq7j+mHHRn0s1NB8PxpQqMJfgQF2cUWMk6oQKFpUlc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=M6YDoN+WIihfN2yUf4Dq6wdgYDN2mOBjCwLFavkGsKrJsou0DLHYMemNq4NwZ0Efe
	 P0Tw5Me8IrMDc/hbCWmbI/wTIrnZSLmfzT6+xbB7R3KASq/7KZTxbLA+s+zNAk6LO8
	 sxAKUvcLvmsAPqgjxfpsHKnw3/ZsRZhiTS8jafSc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13A29F805B1; Sat, 22 Mar 2025 00:23:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0444BF805BA;
	Sat, 22 Mar 2025 00:23:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE98CF8025A; Sat, 22 Mar 2025 00:23:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 1602CF800BD
	for <alsa-devel@alsa-project.org>; Sat, 22 Mar 2025 00:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1602CF800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182ef4f0bd524500-webhooks-bot@alsa-project.org>
In-Reply-To: <182ef4f0bc499e00-webhooks-bot@alsa-project.org>
References: <182ef4f0bc499e00-webhooks-bot@alsa-project.org>
Subject: arecord --max-file-time behavior
Date: Sat, 22 Mar 2025 00:23:42 +0100 (CET)
Message-ID-Hash: AW5I3X6JBHHCVH3GE7N57BAGH4TI2QQN
X-Message-ID-Hash: AW5I3X6JBHHCVH3GE7N57BAGH4TI2QQN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AW5I3X6JBHHCVH3GE7N57BAGH4TI2QQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #296 was opened from thk686:

I do environmental sound recordings where arecord runs for months to years with --max-file-time set to something like 15 minutes. It is very nice to have this feature, yet there is one aspect that is problematic. It is not simple to know which file is currently being written. One can time stamp the file names and ignore the most recent, which is probably the simplest. Nonetheless, I wonder if it could be the case that the current write file could be named something else, such as the file name but preceded by a . or other indicator, and have it renamed to its intended name once it is closed and arecord has moved on to another file.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/296
Repository URL: https://github.com/alsa-project/alsa-utils
