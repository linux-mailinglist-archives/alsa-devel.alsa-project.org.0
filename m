Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD2977950E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 18:48:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A852210;
	Fri, 11 Aug 2023 18:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A852210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691772501;
	bh=nqNd+PSfregerNbXABYCHUCBcu1SGcyeinSQ/RA32Ls=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=E1PF7A9Su6DCfMJZSY2JvvQUNPJoOfNoSqjHI0daVRCToU1UBc2PRPg1qk+DM8Fr4
	 WNJrZG2wlZiWBDP+Rc2ntH/yTJXDcjZnKn41rH+7lz58tkcFJgTr/haJN0bjgIIpXM
	 VpdYK5mFb2ggaSt6qDG0OQUWZC2sQjJgtH/5fGec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11F2AF80552; Fri, 11 Aug 2023 18:47:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60E3AF80134;
	Fri, 11 Aug 2023 18:47:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C37BF80166; Fri, 11 Aug 2023 18:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A6512F800F4
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 18:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6512F800F4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1691772430670207500-webhooks-bot@alsa-project.org>
References: <1691772430670207500-webhooks-bot@alsa-project.org>
Subject: [RFC] pcm: Add MSBITS subformat options
Message-Id: <20230811164717.5C37BF80166@alsa1.perex.cz>
Date: Fri, 11 Aug 2023 18:47:17 +0200 (CEST)
Message-ID-Hash: SXHJXBW4PZMSFRFMOK3MGJABJJVS2SSH
X-Message-ID-Hash: SXHJXBW4PZMSFRFMOK3MGJABJJVS2SSH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SXHJXBW4PZMSFRFMOK3MGJABJJVS2SSH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #342 was edited from crojewsk-intel:

Improve granularity of format selection for S32/U32 formats by adding masks representing 20 and 24 most significant bits. As a preparation step introduce `snd_pcm_subformat_value()` for easy name-to-subformat conversions.

While at it, fix few warnings that pop up in subformat-related code during compilation.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/342
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/342.patch
Repository URL: https://github.com/alsa-project/alsa-lib
