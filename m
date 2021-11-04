Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A3445A82
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Nov 2021 20:21:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B491688;
	Thu,  4 Nov 2021 20:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B491688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636053675;
	bh=Ykl3Lj+NwMWsYNjI5/APA0oCq8H84jWzemcD5ccJM/4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c/qPv0Hj7WDQXCQvmdVszfM4HO4/6pzcScljBXYFCa182kA+LyuociAXkDt12wQpU
	 WgC46SpG2zqq8nThrcUuKNSravD2FO8gVSJp9v39ChIOmsrzT5S/YHP/Q9qQuN9YlS
	 80h95YzFACQI6VPYO9WUBuZB42fxRxeX8+nX29MA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1B90F80229;
	Thu,  4 Nov 2021 20:19:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD43CF8025D; Thu,  4 Nov 2021 20:19:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CABC1F80224
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 20:19:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CABC1F80224
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636053578088563919-webhooks-bot@alsa-project.org>
References: <1636053578088563919-webhooks-bot@alsa-project.org>
Subject: topology: Add option to pass pre-processor definitions
Message-Id: <20211104191946.BD43CF8025D@alsa1.perex.cz>
Date: Thu,  4 Nov 2021 20:19:46 +0100 (CET)
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

alsa-project/alsa-utils pull request #117 was opened from ranj063:

Add a -D switch to be able to pass pre-processor definitions that will
be used to expand arguments in the input config file. This will be
useful to generate multiple topology binaries from the same input config
file with different argument values.

For example: if we had a pipeline config as follows:

Object.Pipeline {
	volume-playback.1 {
		dynamic_pipeline $DYNAMIC_PIPELINE
	}
}

We can define an argument for DYNAMIC_PIPELINE as:

@args [ DYNAMIC_PIPELINE ]
@args.DYNAMIC_PIPELINE {
	type integer
	default 0
}

And when pre-processin the conf file pass "-D DYNAMIC_PIPELINE=1" to enable
dynamic pipeline in the topology.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/117
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/117.patch
Repository URL: https://github.com/alsa-project/alsa-utils
