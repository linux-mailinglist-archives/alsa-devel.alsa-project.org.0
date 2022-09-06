Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53055AEA70
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 15:53:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6384A852;
	Tue,  6 Sep 2022 15:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6384A852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662472407;
	bh=+WT8Z490yiIfJnFog5FiCBl6kQdFNMHSR+U6wrguVvc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NE7kSPY8HXiTOA9sZC95x9EAnd+EgBSCaPu3I7ED6hts1XxyUYHFom8nKzSJ73OOG
	 FsAbZBQBRXN13JLb0gmDK2Sn0MorXZwCbbpta+SOA7axv0zUiv2wMF4F+znG+BXfz+
	 yjeOn1vAHIuwbqvGfGseRufIN6DkUvIVWooeZ5Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA0D0F800E9;
	Tue,  6 Sep 2022 15:52:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 743BDF80249; Tue,  6 Sep 2022 15:52:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AF490F80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 15:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF490F80165
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1662472342932301044-webhooks-bot@alsa-project.org>
References: <1662472342932301044-webhooks-bot@alsa-project.org>
Subject: snd_pcm_readi() takes to much time.
Message-Id: <20220906135226.743BDF80249@alsa1.perex.cz>
Date: Tue,  6 Sep 2022 15:52:26 +0200 (CEST)
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

alsa-project/alsa-lib issue #270 was opened from coder0201200:

I am using alsa open source library for my project to read and write audio data.

For that I am using snd_pcm_readi function to read audio data. I am able to read audio data.

But issue is that sometimes it will take so much time to read data.(200-230 msec).
Normally this function executed in 1-3 ms that is normal case, but after every 2-4 frames it is taking 200-300 msec.
So this is affecting my whole application process.

I have also try to set this call as nonblock with the help of snd_pcm_nonblock function. With that I have observed some improvements but still after 2-3 frames it is taking 100msec time to get a data.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/270
Repository URL: https://github.com/alsa-project/alsa-lib
