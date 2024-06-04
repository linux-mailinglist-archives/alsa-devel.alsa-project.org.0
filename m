Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E78FBBF8
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 20:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 853C683B;
	Tue,  4 Jun 2024 20:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 853C683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717527498;
	bh=Cbl7x7R8uJkeeR0a9CJCAZu7XBJY86nLtHbNyfMabYI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=k2XO6aWchLHh1cnYXmCKCIO5sT3YP0QhOZDGPtSwSGhVPyygSnxGs6SjnHnrMMTzJ
	 jmMptNZiVjz6j6ML2tPnZVuoHDRkb5+E++GCREbIVUSe6Ssgb7ni0X5xVsA2vR0B9D
	 pTj49qwrskAmm2soJGEGQLm7VBIl6LykKZ2uzDb4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22399F8059F; Tue,  4 Jun 2024 20:57:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8B8CF8059F;
	Tue,  4 Jun 2024 20:57:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E00DF802DB; Tue,  4 Jun 2024 20:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id EBD41F8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 20:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBD41F8003A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1717527424680150986-webhooks-bot@alsa-project.org>
References: <1717527424680150986-webhooks-bot@alsa-project.org>
Subject: Using amixer to reduce right speaker volume to zero(and leave left
 unchanged)
Message-Id: <20240604185711.5E00DF802DB@alsa1.perex.cz>
Date: Tue,  4 Jun 2024 20:57:11 +0200 (CEST)
Message-ID-Hash: EJ6AQ46FOPWZV3OIMKEBXKOQT5XOQNVZ
X-Message-ID-Hash: EJ6AQ46FOPWZV3OIMKEBXKOQT5XOQNVZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJ6AQ46FOPWZV3OIMKEBXKOQT5XOQNVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #269 was opened from sierret:

I'm trying to right a script to reduce my right speaker volume to 0. I know the code:

`amixer -D pulse sset Master -,0`

sets the LEFT speaker to zero and leaves the right unchanged. However, for the life of me I can't manage to modify this code to do the opposite. And there don't seem to be adequate resources directing how to do so floating around the interwebs.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/269
Repository URL: https://github.com/alsa-project/alsa-utils
