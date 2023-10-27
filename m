Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D77DA1AA
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 22:16:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE96FA4C;
	Fri, 27 Oct 2023 22:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE96FA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698437817;
	bh=5BGmWDst9Aoz+OtA4E1y82rnWz81p6RC+QHyEhre5hI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qBgpiIYicldrkA7T4oLzZJ4x/hGoGjqznB3GYY62HdZEC+2frussGBm4qI9o1D3uR
	 oxiqrfVpORYbzto5KL4O6E5ajM6R4RLP9pM2y4L+FnSfiogUeSiXMbUXBp8RGHjlbK
	 FGo6E+0e76Y7B2Psh8Ira/qHfFhdYGdzCNSlZTrI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44DD3F8012B; Fri, 27 Oct 2023 22:16:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CFF1F8014B;
	Fri, 27 Oct 2023 22:16:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36CA1F80165; Fri, 27 Oct 2023 22:16:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 41BDCF8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 22:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41BDCF8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1698437759059802771-webhooks-bot@alsa-project.org>
References: <1698437759059802771-webhooks-bot@alsa-project.org>
Subject: aplay: improve xrun logs
Message-Id: <20231027201602.36CA1F80165@alsa1.perex.cz>
Date: Fri, 27 Oct 2023 22:16:02 +0200 (CEST)
Message-ID-Hash: 7QRTFUCCMUILBL44RZNQYITGSYQRK3RU
X-Message-ID-Hash: 7QRTFUCCMUILBL44RZNQYITGSYQRK3RU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QRTFUCCMUILBL44RZNQYITGSYQRK3RU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #242 was opened from plbossart:

Add a pcm_status on xrun and a non-zero timestamp.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/242
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/242.patch
Repository URL: https://github.com/alsa-project/alsa-utils
