Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF08A5A2639
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 12:57:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 200EF1687;
	Fri, 26 Aug 2022 12:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 200EF1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661511433;
	bh=J2lrFo60kGgO6FH+DLvyV3H2fJXllOcuw86C/9wybs0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GaFVRdxVb60Pj+pHSdKjIer1IC0FuN4acA0wSN0W+gl6gCFz7szmAywhLzcHq9wK1
	 lufrCUwXt4jAC8X+MrAVv8GlsO12ShCuwoRwKqXA3uK+ocyI3sGC67sbSl2VJ2PEZH
	 xFL3y+IuDDbU6bj4dlCb4VlvFMVGZXf/ZAGhPbJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A01E1F80105;
	Fri, 26 Aug 2022 12:56:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F64FF80238; Fri, 26 Aug 2022 12:56:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 117ADF80105
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 12:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 117ADF80105
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661511370267873049-webhooks-bot@alsa-project.org>
References: <1661511370267873049-webhooks-bot@alsa-project.org>
Subject: Add interactive pause/resume functionality
Message-Id: <20220826105613.8F64FF80238@alsa1.perex.cz>
Date: Fri, 26 Aug 2022 12:56:13 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/tinycompress pull request #14 was edited from LaurentiuM1234:

We want to be able to interactively pause and resume the stream

Request URL   : https://github.com/alsa-project/tinycompress/pull/14
Patch URL     : https://github.com/alsa-project/tinycompress/pull/14.patch
Repository URL: https://github.com/alsa-project/tinycompress
