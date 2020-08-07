Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3253623F0D3
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 18:18:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C85471663;
	Fri,  7 Aug 2020 18:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C85471663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596817133;
	bh=0AOvu9/6yVptLtonDH1XeuIA3WTi9Lc+gy9JFDOuOhU=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MQN1oZ+YNS5/Pio0wxWTQPn6oEUCRlS267rgWv5zi/IMepGmKkk/ldLhs9gOa6K3x
	 +Nj5CFN48l9l6cZYGn8ysZdq55Z9XqfLmS/nnJh4x+ggpR0VghseAzYL/n5bkDrOew
	 LVN994GIaZZemQ2+dJs+iCwjTCZVC1MUS/eeYl9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1132F8020B;
	Fri,  7 Aug 2020 18:17:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDCDFF80218; Fri,  7 Aug 2020 18:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5E0AF800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 18:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5E0AF800AB
IronPort-SDR: Y3/M4ZXSzfSxRk6Z2fWmMbcfohuu6Oh939+hST66Dih/JM+Ijx03v4jhtLpfjuT6N05mKlo9sA
 8XF2eYM+nhLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="153095042"
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="153095042"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 09:17:31 -0700
IronPort-SDR: hiDRxuFJtS5Uwi4+SCj9eR9+3PAF+fCAEp2xszj87GHAKUOr3sjQJfnyf3b1EmW1biaWtRVGVc
 POq8wDadjkcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="275410561"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2020 09:17:30 -0700
Received: from [10.213.30.220] (mrajwa-mobl1.ger.corp.intel.com
 [10.213.30.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D51E0580765;
 Fri,  7 Aug 2020 09:17:29 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
Subject: [PATCH] aplay: capture: write only the amount of read frames
Message-ID: <b3d38cf3-e2c9-6f91-0e55-1389fe38920a@linux.intel.com>
Date: Fri, 7 Aug 2020 18:17:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com
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

This patch changes the way aborted stream is being saved. Currently when
     abort signal happens the write back of read samples is skipped but 
there
     is no reason to not save them. Also, we need to know how much 
frames have
     been read and write only those.

     Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>

diff --git a/aplay/aplay.c b/aplay/aplay.c
index 6836558..f5010dc 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -3204,11 +3204,12 @@ static void capture(char *orig_name)
                         size_t c = (rest <= (off64_t)chunk_bytes) ?
                                 (size_t)rest : chunk_bytes;
                         size_t f = c * 8 / bits_per_frame;
-                       if (pcm_read(audiobuf, f) != f) {
+                       size_t read = pcm_read(audiobuf, f);
+                       size_t save;
+                       if (read != f)
                                 in_aborting = 1;
-                               break;
-                       }
-                       if (xwrite(fd, audiobuf, c) != c) {
+                       save = read / 8 * bits_per_frame;
+                       if (xwrite(fd, audiobuf, save) != save) {
                                 perror(name);
                                 in_aborting = 1;
                                 break;
