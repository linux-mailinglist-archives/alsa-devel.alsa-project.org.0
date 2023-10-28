Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5E97DA702
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Oct 2023 14:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5349FA4C;
	Sat, 28 Oct 2023 14:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5349FA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698496817;
	bh=5DFRZ4mkakyrajGVj24Y+ob1tJBbO+a6fJKY8wqF2+8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=goqV6ibdYF8Cpg4Qi86xS4JrLOJE2Zk21t5zTWc4GRE083iGenkZmHLhvazaytJ2b
	 g3+qsv0nbcFIi1x1lN1T2OuyXttuN18QzW+ZCobp2EG0DmoVG9X30bZa4ZfJ2wCgaR
	 QsFW0uel40+TVFlNjOhkWRc2q5XiXWa3Vcpl3zKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F113F80558; Sat, 28 Oct 2023 14:38:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 034FBF80165;
	Sat, 28 Oct 2023 14:38:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FE0DF8019B; Sat, 28 Oct 2023 14:38:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 67830F80152
	for <alsa-devel@alsa-project.org>; Sat, 28 Oct 2023 14:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67830F80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1698496731242286444-webhooks-bot@alsa-project.org>
References: <1698496731242286444-webhooks-bot@alsa-project.org>
Subject: mixer: simple: Support dB TLVs for CTL_SINGLE controls
Message-Id: <20231028123855.5FE0DF8019B@alsa1.perex.cz>
Date: Sat, 28 Oct 2023 14:38:55 +0200 (CEST)
Message-ID-Hash: YIJOSIN2ZWNOATJWZOO5E267UJC7TXAI
X-Message-ID-Hash: YIJOSIN2ZWNOATJWZOO5E267UJC7TXAI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIJOSIN2ZWNOATJWZOO5E267UJC7TXAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #358 was opened from marcan:

dB mappings do not work for controls not named "* Volume", since we do not fall back to CTL_SINGLE in get_selem_ctl. Add that branch to make it work.

Fixes dB ranges for e.g. controls named "* Gain".

Request URL   : https://github.com/alsa-project/alsa-lib/pull/358
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/358.patch
Repository URL: https://github.com/alsa-project/alsa-lib
