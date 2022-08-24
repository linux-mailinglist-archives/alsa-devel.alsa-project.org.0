Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D96759FF01
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 18:00:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0E66825;
	Wed, 24 Aug 2022 18:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0E66825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661356857;
	bh=1HbFsllxRonjLurPdyEjWHTHLNbPdx5oVKLhIyF9D/A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hS7gYLvXLLGB4Hi+s6jya5J/u777DscXip4T0LyEiNaHP7PJrqNZ9oOR1lPiDA9Vs
	 nGrYUoOZW2Fu5MGKuLKHaGD5fJy4u5hAajwzcHcXysMZNIwIozg01zppZNlqORj1pr
	 y0TA693Nui627zg87MpiR22IKjAttgcbcHPuxZOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6996FF800C8;
	Wed, 24 Aug 2022 17:59:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33380F8014E; Wed, 24 Aug 2022 17:59:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 06288F8014B
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 17:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06288F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661356790538121939-webhooks-bot@alsa-project.org>
References: <1661356790538121939-webhooks-bot@alsa-project.org>
Subject: Have I got a missing ucm files problem ?
Message-Id: <20220824155957.33380F8014E@alsa1.perex.cz>
Date: Wed, 24 Aug 2022 17:59:57 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #204 was opened from xevilstar:

Hello,

this is my alsa-info
http://alsa-project.org/db/?f=cc1f9ff2eb1e223ebf6024aa1605db1d737ff5fa

I am having problems with callaudiod not finding the headset and mic on my audio cards and one of the members on the callaudiod git suggested me I am missing some ucm files ....

This is a raspberrypi4

can you please help me ?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/204
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
