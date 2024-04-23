Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1B58ADE03
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 09:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7525414E7;
	Tue, 23 Apr 2024 09:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7525414E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713856273;
	bh=R+pBUw7I4eGOW5nJpf+/w9P/vUz+rbADJwBxD3PGYkI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jjB91wLpYHhK9+LdTZ5L4cYr++snSkHcReF2jyrDsq9//lJQtxNP6XhcLX+WvFYwm
	 X6ai8yhJ3NXAJHH4YZms+swjupVyv+0P4tNZT8GEWOnW40FkLtAWKiTNi/4A2eqmq3
	 weX/D4qFCe0QHtkcTzfinCOEGWmgrfXXrg4nG+Mk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D97E1F80570; Tue, 23 Apr 2024 09:10:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25DB0F8057A;
	Tue, 23 Apr 2024 09:10:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD8E3F80423; Tue, 23 Apr 2024 09:10:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 23702F8003C
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 09:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23702F8003C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1713856231875884771-webhooks-bot@alsa-project.org>
References: <1713856231875884771-webhooks-bot@alsa-project.org>
Subject: conf: aliases: hdmi: Include unconditionally the pcm/hdmi.conf
Message-Id: <20240423071037.DD8E3F80423@alsa1.perex.cz>
Date: Tue, 23 Apr 2024 09:10:37 +0200 (CEST)
Message-ID-Hash: QQSJ3OMLJPIGSERTPTOM6SSDU4QEW6PM
X-Message-ID-Hash: QQSJ3OMLJPIGSERTPTOM6SSDU4QEW6PM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQSJ3OMLJPIGSERTPTOM6SSDU4QEW6PM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #393 was opened from ujfalusi:

The hdmi.conf contains the high level macro to be used by cards to create the hdmi: device.
Instead of including it in different config files, include it in the main aliases.conf and remove it's inclusion by other config files.

This change is needed to add support for the hdmi: device mapping via UCM.

Suggested-by: Jaroslav Kysela <perex@perex.cz>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/393
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/393.patch
Repository URL: https://github.com/alsa-project/alsa-lib
