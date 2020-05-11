Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FBE1CDD78
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 16:42:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C537950;
	Mon, 11 May 2020 16:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C537950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589208147;
	bh=NcP3a5K+AdsE/vp4QNeQm7Zm5n5Zq8T+/YrnkD5A560=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f7twKxPzEpC9wPCTWNTHokbQkLGi4Ry0IRAB2YyGMZElv0o4cU9p79FGsbmz31y+A
	 vD8Bpm30mp4CmVg3BvERtrlszz4DKDE4aZJnLLP2jyd1P4FYbGUV5WtHKRZuATGDUO
	 nCzc8mjxEPjBBeskqVIJLmndwpShPxFgJVrlJarU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40FBAF8028F;
	Mon, 11 May 2020 16:39:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48A2EF8027B; Mon, 11 May 2020 16:39:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27CD6F801F2
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 16:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27CD6F801F2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 525CEAEF7
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:39:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 0/3] Trivial compile warning fixes
Date: Mon, 11 May 2020 16:39:28 +0200
Message-Id: <20200511143931.31528-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

here is a few patches to shut up trivial compile warnings that have
been introduced recently.


Takashi

===

Takashi Iwai (3):
  pcm: rate: Fix compile warning wrt bit ops and comparison
  pcm: rate: Fix uninitialized variable warning
  topology: Add missing ATTRIBUTE_UNUSED

 src/pcm/pcm_rate.c |  4 ++--
 src/topology/pcm.c | 18 ++++++++++--------
 2 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.16.4

