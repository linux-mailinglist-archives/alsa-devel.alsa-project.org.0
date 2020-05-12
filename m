Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 699D31CF11A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 11:08:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BE37167C;
	Tue, 12 May 2020 11:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BE37167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589274516;
	bh=+S5K/72UGcJ1GwSHjrWc5XaEHUJHN7Y6T7l+5cbVgvc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nPCh7X8G12cf5IoP73dYNpG2DZOsAjGZRuyHd9s10R3kJeuJQsU6SnOq0EcxATpNS
	 LKE9P2FZpU0aEUnnh5/47L3O3cDRlzPejPUOA6v2FERO5OZfOT19TWwTebjkXX+Whp
	 pIX4eQXweZiLm9m/oPFt9cCwvcUiRuIn0MdwgWP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE8E1F800AA;
	Tue, 12 May 2020 11:06:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E619FF800AA; Tue, 12 May 2020 11:06:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by alsa1.perex.cz (Postfix) with ESMTP id EE77FF800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 11:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE77FF800AA
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.52 with ESMTP; 12 May 2020 18:06:39 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: changjoon.lee@lge.com
Received: from unknown (HELO MacBookPro.local.net) (10.157.161.30)
 by 156.147.1.125 with ESMTP; 12 May 2020 18:06:39 +0900
X-Original-SENDERIP: 10.157.161.30
X-Original-MAILFROM: changjoon.lee@lge.com
From: changjoon.lee@lge.com
To: tiwai@suse.de
Subject: [PATCH 0/1] Documentation update
Date: Tue, 12 May 2020 18:05:46 +0900
Message-Id: <20200512090547.76991-1-changjoon.lee@lge.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ChangJoon Lee <changjoon.lee@lge.com>, alsa-devel@alsa-project.org,
 linux@endlessm.com, linux-kernel@vger.kernel.org
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

From: ChangJoon Lee <changjoon.lee@lge.com>

ChangJoon Lee (1):
  Updated negative return values for documentation update.

 src/pcm/pcm.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

-- 
2.26.2

