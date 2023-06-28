Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5E3740D36
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 11:40:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B85B37F4;
	Wed, 28 Jun 2023 11:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B85B37F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687945201;
	bh=4bZbBCvN/d1JjfkJNV8ZZp8nXyGHJ4qFIn3ZF2pwl6g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=miSlYssAXFwwLTuDT3jccHnOnODDotk9B1aP6e0XupfNdfKpbFz6FpCZQ3xEial9q
	 n2wioPy2EDA8O3oqcBTNIDwpkk8mwjulsXpaJlPX72hyhlJdyF3SYHUMXyJJhP0xPo
	 8ojS7sy/LsvM5zudYxSZKxMA4FeeQbjmN/+FLgUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F13EF80535; Wed, 28 Jun 2023 11:38:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61271F80212;
	Wed, 28 Jun 2023 11:38:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA197F8027B; Wed, 28 Jun 2023 11:38:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B00C7F80169
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 11:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B00C7F80169
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687945108028671980-webhooks-bot@alsa-project.org>
References: <1687945108028671980-webhooks-bot@alsa-project.org>
Subject: acp62: add initial support for AMD ACP v6.2 RPL
Message-Id: <20230628093842.BA197F8027B@alsa1.perex.cz>
Date: Wed, 28 Jun 2023 11:38:42 +0200 (CEST)
Message-ID-Hash: NENK6XBKUVDMNGLGH2BV6I57IJL3NH27
X-Message-ID-Hash: NENK6XBKUVDMNGLGH2BV6I57IJL3NH27
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NENK6XBKUVDMNGLGH2BV6I57IJL3NH27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #332 was edited from pseudocc:

See also: [config SND_SOC_AMD_RPL_ACP6x](https://github.com/torvalds/linux/commit/4fb35936a374758d5065b0a015c565436685c378#diff-456b8a7915f68714b35e16be618944ffa6c1daabe3ff20ac21474612b018523dR121)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/332
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/332.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
