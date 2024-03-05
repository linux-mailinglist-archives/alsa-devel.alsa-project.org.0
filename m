Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494D2872919
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 22:07:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67C8284D;
	Tue,  5 Mar 2024 22:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67C8284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709672846;
	bh=qj/jJ60O26ikR9sI/bZEV4P8he/fWSVDdjinGtaDQoo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Zn4GhjXpzq+gocbcJ/8+OzPBIqnhzYVPQUz2UIy/ClxmlGGotwzEMGM+mDVHRWaZj
	 0KzY28XPt6YVgok2l4h1eYMgAbmbEfezQDOw7rQXyHXnovLg+OHUyNNO09qSp7tS63
	 Q1rzmvyHBm5M398EJzcZ3brqGkuldER0LQLlq4bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1958F804B0; Tue,  5 Mar 2024 22:06:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A5F2F80563;
	Tue,  5 Mar 2024 22:06:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69EF7F8024E; Tue,  5 Mar 2024 22:06:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id CA7C9F80088
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 22:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA7C9F80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1709672807005300999-webhooks-bot@alsa-project.org>
References: <1709672807005300999-webhooks-bot@alsa-project.org>
Subject: Dmic nhlt update
Message-Id: <20240305210650.69EF7F8024E@alsa1.perex.cz>
Date: Tue,  5 Mar 2024 22:06:50 +0100 (CET)
Message-ID-Hash: JUQELGG7Z4ZWWA3MKNBMX5B4XORDWKOI
X-Message-ID-Hash: JUQELGG7Z4ZWWA3MKNBMX5B4XORDWKOI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUQELGG7Z4ZWWA3MKNBMX5B4XORDWKOI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #254 was opened from jsarha:

Driver version 4 update from for DMIC NHLT generator, and some error print improvements.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/254
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/254.patch
Repository URL: https://github.com/alsa-project/alsa-utils
