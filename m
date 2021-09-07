Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ED4402294
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 06:00:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FD401732;
	Tue,  7 Sep 2021 05:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FD401732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630987206;
	bh=ypsYaSQ1ZAsH7t5HtCtXC2U6pR7NP7v35j4r52CQYIE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MAhE6BeeVXAiYz8fmEkgr3JFGOInxqoGMb4aeFkD00ltcKAtZwncAw/loA8ry+F+g
	 EJ+VR0DeqLgTbih8iQT9CmomDalT+EVfgT62oh33LCLPOYpIjrISpoVSDmbqcrmbna
	 auLlEdgsh9ILyGOc9+v+kpQvnZw6daoseBblIaYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0B51F80253;
	Tue,  7 Sep 2021 05:58:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E4CAF80224; Tue,  7 Sep 2021 05:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3C2D2F800BC
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 05:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C2D2F800BC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1630987120328749895-webhooks-bot@alsa-project.org>
References: <1630987120328749895-webhooks-bot@alsa-project.org>
Subject: ucm2: Add UCM support for rockchip_es8316 on Pinebook Pro
Message-Id: <20210907035847.5E4CAF80224@alsa1.perex.cz>
Date: Tue,  7 Sep 2021 05:58:47 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #112 was opened from starnight:

Add UCM config files for Pinebook Pro's audio. The config files are
transformed and tuned from Manjaro ARM's packages:
* pinebookpro-post-install's asound.state [1]
* pinebookpro-audio's audio_jack_plugged_in.sh [2]

By the way, with these config files, the Speaker and Headphones will be
switched according to the (un)plugged state automatically.

[1] https://gitlab.manjaro.org/manjaro-arm/packages/community/pinebookpro-post-install/-/blob/4b4206c57b21044bf9c00848bd1f8b6f710d19eb/asound.state
[2] https://gitlab.manjaro.org/manjaro-arm/packages/community/pinebookpro-audio/-/blob/1f567db09495acc3beb5405c9ef85c3c07b86785/audio_jack_plugged_in.sh

Fixes: https://github.com/alsa-project/alsa-ucm-conf/issues/110
Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/112
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/112.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
