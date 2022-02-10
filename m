Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921A4B0D9A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 13:35:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C5CD18C9;
	Thu, 10 Feb 2022 13:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C5CD18C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644496502;
	bh=ooDiEjX3Cknd6+enlufW4F72hQhRmnaf19IgSvze6to=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sQD+2Q7Z7XhP3BJq5MzVSyCynpePU77lNweApLtLREXhdcdoTt1bYUP7piKijkbv8
	 BoISD+2/p/itI3+qDak/RVWvGx9xEbfv6ZbcvebMKUKrUjTZ6OMreZgl1AI9O+AUX1
	 KwWv13jd0sOwYLLwEjNObpxuOtnjBLztbXqMbxeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D709F804AC;
	Thu, 10 Feb 2022 13:33:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9483F80302; Thu, 10 Feb 2022 13:33:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE4A7F800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 13:33:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE4A7F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="wDjtSyVA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Gm4+1/LH"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E8A931F391
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644496426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4c2zX+5YQMX/JW2ZprE07CtHd8un3pRscrmg3dc4CNU=;
 b=wDjtSyVAziKjkQQy5Y+5YeV/NTXjVPR3y6+uqucnjTcwx5XjadJHMjhPkRX+HwUVEEzUjH
 D0hzT369hGTa/kkDH2VtJehLgsxuiFZ/xfV1YS62HdAlitjcjXm0kHzx9VATZUDg61fFKf
 1a4UgAE4mtJmUOFBPdGmdudvOvOF7g0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644496426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4c2zX+5YQMX/JW2ZprE07CtHd8un3pRscrmg3dc4CNU=;
 b=Gm4+1/LHG8zZvZ5Ptn038AQOJNK8OqC6x3/FbRAzg6icFtbqhSW6ufBUkFLC4se200/Qc3
 ZKiZZavCOd4qb6Bg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D746EA3B85;
 Thu, 10 Feb 2022 12:33:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: memalloc: Fixes for sync check and SG helper
Date: Thu, 10 Feb 2022 13:33:42 +0100
Message-Id: <20220210123344.8756-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The recent changes and additions in ALSA core memalloc helpers had
incorrect usages of dma_need_sync() and the order of SG page
invalidation.  This patch corrects those.


Takashi

===

Takashi Iwai (2):
  ALSA: memalloc: Fix dma_need_sync() checks
  ALSA: memalloc: invalidate SG pages before sync

 sound/core/memalloc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.31.1

