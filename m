Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53688976F08
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 18:47:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99452A4A;
	Thu, 12 Sep 2024 18:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99452A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726159639;
	bh=24Q/pExp/SAKBbIMMNymXG3SLwvHPJvqOPEJqhqmS10=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YlwYrCDXdGk6vwxdTUQcNTVrq9VobdiVR8truItEk/6xdqYs6fOIadbmx4FsToavO
	 92cX3Av57TwrwNeTRn9atZePG8Z4HDAAkdear6BTgvpLhlpToj4QYhSqeEvKCbcd4v
	 YshHBuSdQyAonozXknsABdIoWst7d/8aONfp9Nmk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F426F8026D; Thu, 12 Sep 2024 18:46:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C16CCF805AE;
	Thu, 12 Sep 2024 18:46:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57F5CF801F5; Thu, 12 Sep 2024 18:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D7C1F800E9
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 18:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D7C1F800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1726159600903726816-webhooks-bot@alsa-project.org>
References: <1726159600903726816-webhooks-bot@alsa-project.org>
Subject: aseqsend getopt_long variable should be int instead of char
Message-Id: <20240912164643.57F5CF801F5@alsa1.perex.cz>
Date: Thu, 12 Sep 2024 18:46:43 +0200 (CEST)
Message-ID-Hash: D4LSFP6GASJZLEVIYYXMBOWHFVCULBFK
X-Message-ID-Hash: D4LSFP6GASJZLEVIYYXMBOWHFVCULBFK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4LSFP6GASJZLEVIYYXMBOWHFVCULBFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #274 was opened from sadguitarius:

Hi, just wanted to point out that aseqsend is failing because the value returned by getopt_long can never be -1 since it's a char.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/274
Repository URL: https://github.com/alsa-project/alsa-utils
