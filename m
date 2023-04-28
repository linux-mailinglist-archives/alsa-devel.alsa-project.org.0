Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA4B6F213C
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Apr 2023 01:42:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB13D1560;
	Sat, 29 Apr 2023 01:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB13D1560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682725329;
	bh=09SA56Xb9xf4ofzhkRvXUYoaiNoLJ7JZOJ2PAtpXC90=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=V3zu6BMBc+damav3iq8B0Sc/IMhu90A+r6ID+2eVPeePOYeGxnyBeo7/BomyVG+oL
	 3Sn3m/uKQdWrSqMNH8BhaE590evO1/jtZT4/VKgqP/nEL5DQP58VW67/X33dPVYqey
	 mHjOZokNS/ngxHQoaFuZ2mtTjZdkza9obCsO8Bj4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34760F80236;
	Sat, 29 Apr 2023 01:41:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68EB2F8025E; Sat, 29 Apr 2023 01:41:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DFD9F80137
	for <alsa-devel@alsa-project.org>; Sat, 29 Apr 2023 01:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DFD9F80137
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1682725268687541485-webhooks-bot@alsa-project.org>
References: <1682725268687541485-webhooks-bot@alsa-project.org>
Subject: Updated single and double quotes throughout
Message-Id: <20230428234114.68EB2F8025E@alsa1.perex.cz>
Date: Sat, 29 Apr 2023 01:41:14 +0200 (CEST)
Message-ID-Hash: DS3TJX6Q4AZPDKHG4BVUVLG3YQTBXJC3
X-Message-ID-Hash: DS3TJX6Q4AZPDKHG4BVUVLG3YQTBXJC3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DS3TJX6Q4AZPDKHG4BVUVLG3YQTBXJC3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #203 was opened from wileyhy:

Added double quotes to common expansions; removed quotes from strings; changed REQUIRES to an indexed array and changed the corresponding `for` loop; added curly braces where feasibly necessary; removed a few unnecessary trailing semi-colons; and put URL's in single quotes to prevent any possible expansions, except for within the `sed` command.  Some logic structures depend on word splitting, so I left those as-is for this commit.  Double exclamation marks in double quotes allow history expansion which is usually disabled in non-interactive shells, so I left those as-is also.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/203
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/203.patch
Repository URL: https://github.com/alsa-project/alsa-utils
