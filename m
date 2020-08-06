Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE4523D84D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 11:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88581166C;
	Thu,  6 Aug 2020 11:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88581166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596704776;
	bh=YCcZ0XzFwwmlBlGmUtqQ44yi0kdRmXS4B4ko9YPq75o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M33STy601PmmZ4t8+hYY3d7Phbbhne51aFhlxn96LPdMEI/XhNSVKLZLj2zcLEek1
	 V18hiBBBtNwHBEnGJIWkDj47DlHUOYoC4YsMQPckcWUhX1gl7wE09SEXfQKT/dg60u
	 tg8/yicxOUrfC0IeaUtYLI2FxtYbCS++sTr4Z0JY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B27C7F80086;
	Thu,  6 Aug 2020 11:04:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3258AF80159; Thu,  6 Aug 2020 11:04:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_30,SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7C7FAF800B7
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 11:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C7FAF800B7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1596704665622306108-webhooks-bot@alsa-project.org>
References: <1596704665622306108-webhooks-bot@alsa-project.org>
Subject: Add support for Lenovo ThinkStation P620 Main Audio
Message-Id: <20200806090433.3258AF80159@alsa1.perex.cz>
Date: Thu,  6 Aug 2020 11:04:33 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #42 was opened from khfeng:

This add support for internal speaker and front headset.

We need two separate configs to let PulseAudio understands they are two
different profiles, so the headset's port availability won't affect
speaker's profile availability.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/42
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/42.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
