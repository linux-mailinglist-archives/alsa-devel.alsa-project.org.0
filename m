Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D23B3791977
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 16:11:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7BB4827;
	Mon,  4 Sep 2023 16:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7BB4827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693836697;
	bh=W751oSsYQNtHXtgv2spPiHstBq6wv8BLPtrA8O3rVvU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Keu/FD+Bu00sAvgpZIsaVeFQc+oD/GA/l4XqdXxEPEA8cLoRk6ro/qt3AvQYIYeyH
	 s3CvGk7+swugmpMatZyAFsHSmEFJDBCiuKvuPqIN+0kXQs2kTzzC/J3fiQlJFRKb4l
	 hGzSstz1Hx6dGYEVUwiaebYMz+7uaXW9CGSbrqg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A42CFF80549; Mon,  4 Sep 2023 16:10:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6298DF80431;
	Mon,  4 Sep 2023 16:10:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A118BF80494; Mon,  4 Sep 2023 16:10:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id ED650F80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 16:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED650F80236
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693836616350933552-webhooks-bot@alsa-project.org>
References: <1693836616350933552-webhooks-bot@alsa-project.org>
Subject: Motu M4 missing profiles since 1.2.10
Message-Id: <20230904141021.A118BF80494@alsa1.perex.cz>
Date: Mon,  4 Sep 2023 16:10:21 +0200 (CEST)
Message-ID-Hash: 5NUV55CD3JCHNQOMAK3KNTRYFMBGGVDJ
X-Message-ID-Hash: 5NUV55CD3JCHNQOMAK3KNTRYFMBGGVDJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NUV55CD3JCHNQOMAK3KNTRYFMBGGVDJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #346 was opened from freswa:

When updating t 1.2.10 the profile `Analog Stereo Output + Inputs` is gone. Instead I get a `Surround ...` profile, which doesn't work at all.

Downgrading alsa, alsa-ucm-conf and alsa-lib from 1.2.10 to 1.2.9 fixes the issue.

I'm on Kernel 6.5.1 with Pipewire backend.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/346
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
