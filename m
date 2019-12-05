Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A42FF113D96
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 10:10:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D9971661;
	Thu,  5 Dec 2019 10:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D9971661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575537032;
	bh=XJUMdXzY96BFnId1Pu0zmv9uhocn5H/oVDW4JZn1i7E=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tOH6E0P0Y859xYeZRtmDx9xwF/WJrrAKQop1HsCyunAwYUmSOmCIx2Q8KinQ1fYmZ
	 kVUz7cjVqomoPRuPXSWjDV/aQhIMzJViv28+wklw+C5GkljqOnXcvG3ffvt7PD5UuX
	 NDfPd0JK9G7Ykbt2cLMoa+GahCQFFK7Ck85asr3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D3A4F800B4;
	Thu,  5 Dec 2019 10:08:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED008F801F8; Thu,  5 Dec 2019 10:08:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3FE32F800B4
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 10:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE32F800B4
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1575536922572119951-webhooks-bot@alsa-project.org>
References: <1575536922572119951-webhooks-bot@alsa-project.org>
Message-Id: <20191205090845.ED008F801F8@alsa1.perex.cz>
Date: Thu,  5 Dec 2019 10:08:45 +0100 (CET)
Subject: [alsa-devel] fcplay: initial addition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/tinycompress pull request #3 was opened from vinodkoul:

This tool was forked from tinycompress cplay. The fork was required due
to this linking against libavcodec which is GPL. This uses libav APIs to
parse the compressed files and send the audio stream to compressed
device using tinycompress APIs

Right now it supports only playback on MP3 (no problems now not finding
sync word) and flac files.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>

Request URL   : https://github.com/alsa-project/tinycompress/pull/3
Patch URL     : https://github.com/alsa-project/tinycompress/pull/3.patch
Repository URL: https://github.com/alsa-project/tinycompress
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
