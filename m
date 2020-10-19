Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA58B293223
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 01:52:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18E831673;
	Tue, 20 Oct 2020 01:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18E831673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603151538;
	bh=yx9nOctFFFm1dMN27KMlOUBsUNbY6vnza5PuYV06bVQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LNAnBt6OvCk3DHx0HaJJfb5IAj6OnKr1jgUrfdX5FomYgMcfikKOOO6coTm1kLAAZ
	 qVqKbO6TweEI8uFz59obdy5z+hD6dJvdr96xJTDqQEfViiQA5jBrIQGTVW8XmqpSDI
	 2LiNKX86fnnkstacQvdbkY3c0VgGgADEYOY9cC3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90B37F8010F;
	Tue, 20 Oct 2020 01:50:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAC7DF80247; Tue, 20 Oct 2020 01:50:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E8457F801A3
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 01:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8457F801A3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603151427982718945-webhooks-bot@alsa-project.org>
References: <1603151427982718945-webhooks-bot@alsa-project.org>
Subject: ASoC: error at snd_soc_pcm_dai_trigger on acp_rn_pdm_dma.0
Message-Id: <20201019235034.EAC7DF80247@alsa1.perex.cz>
Date: Tue, 20 Oct 2020 01:50:34 +0200 (CEST)
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

alsa-project/alsa-lib issue #88 was opened from JcdeA:

I am on Artix and this has been an issue for a while. Pauvcontrol shows Dummy Output as the only output available.

https://www.reddit.com/r/archlinux/comments/e73u68/dummy_audio_output_after_update/  
I saw this post and downgraded alsa-lib-1.2.4 to alsa-lib-1.2.3 and it works perfectly now. 

 I tried all of the solutions on the fourms, but none worked except downgrading. Seems like a issue with the latest version.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/88
Repository URL: https://github.com/alsa-project/alsa-lib
