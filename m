Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3410582246D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 23:05:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4CBBED0;
	Tue,  2 Jan 2024 23:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4CBBED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704233119;
	bh=QX/YU5KwlMoB7Uz4qewXRqiNNKwMUD/w9KcneFSdDTs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Y6+ZRnEdowCtwnBz4GNL2ukYGLlCGSE7UumLh0zo8qZzAEu4NjhVVpLK5RfcaPTti
	 z3YUg1xcq8brQIDJp12nAebCxnwGeZwYXshSEU7H7Fm4AJQcvU3M/HXX29865wVqmX
	 7+GfN4tk04tdZDaYbUSytrJamq58LQSUy3LVLTdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86656F805B4; Tue,  2 Jan 2024 23:04:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 266E9F805AC;
	Tue,  2 Jan 2024 23:04:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F7FBF80568; Tue,  2 Jan 2024 23:04:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B585AF80086
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 23:02:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B585AF80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1704232932692472458-webhooks-bot@alsa-project.org>
References: <1704232932692472458-webhooks-bot@alsa-project.org>
Subject: topology: Fix dmic nhlt blob building,
 and fix $[] attribute value resolving
Message-Id: <20240102220438.6F7FBF80568@alsa1.perex.cz>
Date: Tue,  2 Jan 2024 23:04:38 +0100 (CET)
Message-ID-Hash: JJIHMLIXMK3EYSZYC32HK6NMTBZXBMXN
X-Message-ID-Hash: JJIHMLIXMK3EYSZYC32HK6NMTBZXBMXN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJIHMLIXMK3EYSZYC32HK6NMTBZXBMXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #250 was edited from jsarha:

This PR fixes two issues. FIrst it fixes https://github.com/thesofproject/sof/issues/8670 and then it adds to $[] expressions define handling in object attribute, so that we can use DMIC frequency defines in format objects, wihout ibs and obs attributes referring to those attributes breaking it.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/250
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/250.patch
Repository URL: https://github.com/alsa-project/alsa-utils
