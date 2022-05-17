Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B0E52A4DA
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 16:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49007847;
	Tue, 17 May 2022 16:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49007847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652797797;
	bh=g4q/1qca0h5pnsOodcR/g58gQUO6cZYv/JspfVd85js=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jshuySMJeJ0ctPd0/KXeiIcjUOYdANQ2Gxaik1bOCqzntBAoVLK8vngibdF0ZZJGk
	 QGJIZBYXkoqMlpcJMrdMzHeKmdkMntxbUfj+0KJK7nK8x1ADS6QbztwbvkMFumLPNo
	 DVDDATNEd7sUd6IzDiOY8bBfUGYF3jwSmctlt768=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C38A1F800D8;
	Tue, 17 May 2022 16:28:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60D8DF802DB; Tue, 17 May 2022 16:28:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B5AB9F800D8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 16:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5AB9F800D8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1652797725783672094-webhooks-bot@alsa-project.org>
References: <1652797725783672094-webhooks-bot@alsa-project.org>
Subject: vc4-hdmi.conf: use a proper hdmi pcm, fix broken default pcm
Message-Id: <20220517142853.60D8DF802DB@alsa1.perex.cz>
Date: Tue, 17 May 2022 16:28:53 +0200 (CEST)
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

alsa-project/alsa-lib issue #229 was opened from macmpi:

referring https://github.com/raspberrypi/linux/issues/4662#issuecomment-1114000673 and assorted [patch](https://mailman.alsa-project.org/pipermail/alsa-devel/2022-April/200025.html) from @HiassofT
Thanks for consideration.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/229
Repository URL: https://github.com/alsa-project/alsa-lib
