Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6BF8A41CA
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Apr 2024 12:17:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18209162E;
	Sun, 14 Apr 2024 12:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18209162E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713089860;
	bh=I3i4gzh29/3PQb0K39DbIYKITdGdKGKI7OcwGGKy0go=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ioVgb1pwRlNF46f1xc0Ql42susq8hUjYXNe1lcn5oDpO93YuYDKC5npFX1B0ad68b
	 8O7gx8/XYvj02tGT7TnD686LdLfX0E8puEMUxdB/KDDvPYkE9awnXTPAxaECzD1UF7
	 qBCoojL916joH09DH8cqvZw7HDatwoXe2aMry9d8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63F25F8057A; Sun, 14 Apr 2024 12:17:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50757F805A0;
	Sun, 14 Apr 2024 12:17:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D5B2F8025A; Sun, 14 Apr 2024 12:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 35491F8001F
	for <alsa-devel@alsa-project.org>; Sun, 14 Apr 2024 12:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35491F8001F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1713089687947017908-webhooks-bot@alsa-project.org>
References: <1713089687947017908-webhooks-bot@alsa-project.org>
Subject: Compatibility with FFMPEG 7.0
Message-Id: <20240414101452.3D5B2F8025A@alsa1.perex.cz>
Date: Sun, 14 Apr 2024 12:14:52 +0200 (CEST)
Message-ID-Hash: F3TRIYEQKIQPAR2YZLHNBW5HH7G2244U
X-Message-ID-Hash: F3TRIYEQKIQPAR2YZLHNBW5HH7G2244U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3TRIYEQKIQPAR2YZLHNBW5HH7G2244U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-plugins pull request #58 was opened from eclipseo:

channel_layout has been replace with ch_layout

avcodec_close has been deprecated in favor of avcodec_free_context

Fix #57

Request URL   : https://github.com/alsa-project/alsa-plugins/pull/58
Patch URL     : https://github.com/alsa-project/alsa-plugins/pull/58.patch
Repository URL: https://github.com/alsa-project/alsa-plugins
