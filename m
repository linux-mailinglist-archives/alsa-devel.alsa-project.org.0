Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE61C2988
	for <lists+alsa-devel@lfdr.de>; Sun,  3 May 2020 05:35:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1E516B8;
	Sun,  3 May 2020 05:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1E516B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588476908;
	bh=25YupAkKSiw8eYc7imaqek9WH37QY2j5OjJH3OlSPwY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZJQBQhfgQbTGGWUaegPTZaYkCYruRJIMvAmjSVxW0sHySK7bEDOHDx88+JnLSQA2
	 LQrPpH7t/AxzGH7d4smHgWF1MrvBYPyGbbiLJYt1QqRFsZZs4VKzChmnSpUWvT5mo9
	 5luMgqyBaBYdZ7TsIT0zF+dpEwWnjdI0K7GuDCxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2024FF800EE;
	Sun,  3 May 2020 05:33:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21C8FF8015F; Sun,  3 May 2020 05:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BEFB0F800EE
 for <alsa-devel@alsa-project.org>; Sun,  3 May 2020 05:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEFB0F800EE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1588476778387389898-webhooks-bot@alsa-project.org>
References: <1588476778387389898-webhooks-bot@alsa-project.org>
Subject: missing snd_pcm_drain() in alsa-lib/test/pcm_min.c
Message-Id: <20200503033319.21C8FF8015F@alsa1.perex.cz>
Date: Sun,  3 May 2020 05:33:19 +0200 (CEST)
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

alsa-project/alsa-lib issue #46 was opened from robert-rozee:

hi,
   the example pcm_min.c located in alsa-lib/test/ is missing a "snd_pcm_drain(handle);" before the handle is closed.

while the example works as is, the lack of calling ...drain before ...close means that the end of the sample being played is truncated. when expanding the example to play actual content (rather than random noise) this becomes an issue.

i took this example and used it as the basis of my own routine that played a sine wave tone (with the volume feathered at the start and end). many hours were spent trying to work around this problem of truncated output, before one of the developers pointed out that i needed to drain before closing. as i am a beginner with ALSA and working from scant information, i didn't know that snd_pcm_drain() even existed.


cheers,
rob   :-)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/46
Repository URL: https://github.com/alsa-project/alsa-lib
