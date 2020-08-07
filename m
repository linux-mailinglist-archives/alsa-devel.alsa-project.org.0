Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B423F0BA
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 18:11:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B78B15F2;
	Fri,  7 Aug 2020 18:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B78B15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596816672;
	bh=i5K07QnuacoFqR7pWPmdUOSUstu7vPDmjxCYpdktMsc=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XDAQDGrMkRS9dUcOL6I1kXlL4TZy9DKDHu97hBkSw4rauJiuqnMIVHe44Y8+H17E1
	 hHM7DiNjlCcQO5bvvuZ8HY134YsKmghESWjceLv8KZjEl5QMfg5jjtBRZcAn7wnKO9
	 dqfVITPWNs9Box1JBcCpeDo9zXNqCMPDyVDAQVrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2495F800AB;
	Fri,  7 Aug 2020 18:09:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB287F80218; Fri,  7 Aug 2020 18:09:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AED05F800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 18:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AED05F800AB
IronPort-SDR: 7s3WEM/t+mP4UijmiC8qSNrnc8skBSrsGr3h1gEt1t01Ppb/WifxCWd8QldmqHaKLEYb99l+ZI
 yicn6Wuo3M1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="217449319"
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="217449319"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 09:09:22 -0700
IronPort-SDR: klqv0EAKrf3jgoLs/6VUJWqG9xSETez8aX3Kcp0sK/RpMeovXDAaXkg61Xkp9cJ81uk8Kna2QR
 Z+2XeF7oLN9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="323794947"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 07 Aug 2020 09:09:22 -0700
Received: from [10.213.30.220] (mrajwa-mobl1.ger.corp.intel.com
 [10.213.30.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 46C7458066D;
 Fri,  7 Aug 2020 09:09:21 -0700 (PDT)
To: alsa-devel@alsa-project.org, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org
From: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
Subject: [PATCH] Aplay: pcm_readv(): return read samples instead of requested
 upon abort
Message-ID: <c6f45adf-776d-4ce5-783f-1be1b8d7eb29@linux.intel.com>
Date: Fri, 7 Aug 2020 18:09:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

aplay: pcm_readv(): return read samples instead of requested upon abort

     This patch changes the logic of pcm_readv() when abort signal has been
     detected. During such condition we should return the amount of frames
     actually read instead of the size requested by caller.

     Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>

diff --git a/aplay/aplay.c b/aplay/aplay.c
index e8714d8..5d4b56e 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -2174,7 +2174,9 @@ static ssize_t pcm_readv(u_char **data, unsigned 
int channels, size_t rcount)
                 count = chunk_size;
         }

-       while (count > 0 && !in_aborting) {
+       while (count > 0) {
+               if (in_aborting)
+                       return result;
                 unsigned int channel;
                 void *bufs[channels];
                 size_t offset = result;

