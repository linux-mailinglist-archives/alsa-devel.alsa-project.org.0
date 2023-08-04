Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4D976FC26
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 10:41:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 102FD83E;
	Fri,  4 Aug 2023 10:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 102FD83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691138486;
	bh=/6TLvOUgjYeupLMfHTivvgUvLO//DWOmPUfha+M472E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oq28/4F/u8gXYuH4HSuBaLYU8dTDt04gdZ8En8/GLHFdqrLYCacE2kP4Mx54/kMrC
	 MjBkjnKa1+Ydw/G02Mp/A4N7KMUqcsR6faCz+QLDdzOoEaIrW2DaIAqEbnmveEej5v
	 a4mVwbuYKlOdVovHL9aBl283Q4DPjM1EJn3+o7Bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B364F8055A; Fri,  4 Aug 2023 10:40:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3437F801D5;
	Fri,  4 Aug 2023 10:40:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97858F80552; Fri,  4 Aug 2023 10:40:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EA8EF80425
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 10:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EA8EF80425
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1691138427554973125-webhooks-bot@alsa-project.org>
References: <1691138427554973125-webhooks-bot@alsa-project.org>
Subject: [RFC] aplay: Add option for specifying subformat
Message-Id: <20230804084030.97858F80552@alsa1.perex.cz>
Date: Fri,  4 Aug 2023 10:40:30 +0200 (CEST)
Message-ID-Hash: 2JM4Q4QOALUW6ES6NEYKL2WHNK7DCRS5
X-Message-ID-Hash: 2JM4Q4QOALUW6ES6NEYKL2WHNK7DCRS5
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2JM4Q4QOALUW6ES6NEYKL2WHNK7DCRS5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #228 was opened from crojewsk-intel:

Make subformat first-class citizen by allowing users to specify it just like it is the case for the format. Default to SND_PCM_SUBFORMAT_STD so they are no surprises.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/228
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/228.patch
Repository URL: https://github.com/alsa-project/alsa-utils
