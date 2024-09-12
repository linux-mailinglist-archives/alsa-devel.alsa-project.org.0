Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42A976F85
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 19:28:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E05852;
	Thu, 12 Sep 2024 19:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E05852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726162138;
	bh=yCE+iCM7ULti+MG2mb30mNLb3WuXnAjZxsEeGgr0PJw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lCEgokZxXzv0sF2FughYdUOhrE5gXd1YzK5UAs/3+0PldO7632Kb5pjzWuHzJEVVi
	 v5uLuA+0C75dS790WmqHiD3OjBTGc11R46s4aMPNhZfCuT+GlPZe3VDwzp3xqKi8pi
	 Jo7fYkDMmjDO35xoX3UIeOWso0HHG9mn9ZONlnEk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52688F805B3; Thu, 12 Sep 2024 19:28:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E18FCF805B0;
	Thu, 12 Sep 2024 19:28:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11538F801F5; Thu, 12 Sep 2024 19:28:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D0E2F800E9
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 19:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D0E2F800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1726162100634046316-webhooks-bot@alsa-project.org>
References: <1726162100634046316-webhooks-bot@alsa-project.org>
Subject: change getopt_long return variable from char to int
Message-Id: <20240912172823.11538F801F5@alsa1.perex.cz>
Date: Thu, 12 Sep 2024 19:28:23 +0200 (CEST)
Message-ID-Hash: 76XUCKTTCZ744LEEJZMIKE36FERLPVZP
X-Message-ID-Hash: 76XUCKTTCZ744LEEJZMIKE36FERLPVZP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76XUCKTTCZ744LEEJZMIKE36FERLPVZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #275 was opened from sadguitarius:

fixes #274

Request URL   : https://github.com/alsa-project/alsa-utils/pull/275
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/275.patch
Repository URL: https://github.com/alsa-project/alsa-utils
