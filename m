Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C37F387C5D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 17:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24271720;
	Tue, 18 May 2021 17:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24271720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621351380;
	bh=OsCTScxfIEe33FPHbARKHEK7DDeLX2a1M/ug5qf5Lv0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b6UvF4BihomO2+oZfRIvYA+QMuyj5gzs3Ci+AaLLZOdL6rGZrsCtEDJS/4cOAydo4
	 U9fagT+6+ikR9pWhnOGuu8bSjdRz59BxUo+RyCU5wmALDxs4Dr/IyVtLcztRk1cZZY
	 SZ4LrLH7ROs+50L/bj8pPHJAjykkvNB9DkBWgnRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13F85F80272;
	Tue, 18 May 2021 17:21:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99D75F80257; Tue, 18 May 2021 17:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E039EF80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 17:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E039EF80139
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A95E0AF21
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:21:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: usb-audio: clock setup code refactoring
Date: Tue, 18 May 2021 17:21:10 +0200
Message-Id: <20210518152112.8016-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

Hi,

this is a couple of patches for refactoring and improvements on
USB-audio clock setup code.  By replacing with unions, we can handle
both UAC2 and UAC3 equivalently.


Takashi

===

Takashi Iwai (2):
  ALSA: usb-audio: Refactoring UAC2/3 clock setup code
  ALSA: usb-audio: Handle error for the current selector gracefully

 sound/usb/clock.c | 298 +++++++++++++++-------------------------------
 1 file changed, 95 insertions(+), 203 deletions(-)

-- 
2.26.2

