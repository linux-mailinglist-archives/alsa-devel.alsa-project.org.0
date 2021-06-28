Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D863B5AED
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 11:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24C19169A;
	Mon, 28 Jun 2021 11:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24C19169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624871379;
	bh=dbizctBF386oHj1ON1F7O0xdu9gzNHaG5uZscK84K3g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i+a9Mj/Uwt1zLd+K7WG6qfW/65lLFnOkUjVkIkJWILD5+wU4/I0m083FwS9qzMmgH
	 zIcW08wsAhkr3d4PbRjmifsOO8d8t4kNh/8taommd0sDtLktNqg4UGFjMLs7fdtBO8
	 pGdmdWQhOQ6ustronYwRFJum47dYkPbnXxC/DFdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AA59F80217;
	Mon, 28 Jun 2021 11:08:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BB4BF80229; Mon, 28 Jun 2021 11:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0966EF8020C
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 11:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0966EF8020C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1624871276362214088-webhooks-bot@alsa-project.org>
References: <1624871276362214088-webhooks-bot@alsa-project.org>
Subject: Dell platform adding ucm2 conf with generic mic-mute LEDs feature
Message-Id: <20210628090808.5BB4BF80229@alsa1.perex.cz>
Date: Mon, 28 Jun 2021 11:08:08 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #105 was opened from GoPerry:

As the post-patch did, I would need to add one patch for the dell platform which has enabled the generic mic mute feature.
But I did not see the below paths. 

/sys/class/sound/ctl-led/speaker
/sys/class/sound/ctl-led/mic

https://www.spinics.net/lists/alsa-devel/msg125821.html

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/105
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
