Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16239300606
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 15:51:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D4B51F20;
	Fri, 22 Jan 2021 15:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D4B51F20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611327077;
	bh=lmMYJoXvcyL112ISqcMXipc50g0JGKiMRofulWEYzjE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oXraF361P5d9ZlNnbLhxru/uAdY2xLxFrg2BqC3WeDqRtcOeMqhh/86ee4wkqpIq7
	 f+8VkP7qepzJAPYx+pBhnlYFePmvHt7kc40o15FY6WEzG4rip7sfj7CXtDVhc5mH0b
	 Zqn6LW/J+tydjF95zdWbs4+fQ3s5O76qzGqePQOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6480F804C2;
	Fri, 22 Jan 2021 15:48:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BDBEF80227; Fri, 22 Jan 2021 15:48:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF3BF8019B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 15:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF3BF8019B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FDC5AD2B;
 Fri, 22 Jan 2021 14:48:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 0/4] pcm: Fix missing appl_ptr and hw_ptr updates in
 snd_pcm_status()
Date: Fri, 22 Jan 2021 15:48:38 +0100
Message-Id: <20210122144842.8843-1-tiwai@suse.de>
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

here is the fixes for a crash with dmix plugin and co, as well as the
missing appl_ptr/hw_ptr updates that are found on other plugins.


Takashi

===

Takashi Iwai (4):
  pcm: direct: Fix the missing appl_ptr update
  pcm: ioplug: Pass appl_ptr and hw_ptr in snd_pcm_status()
  pcm: null: Pass appl_ptr and hw_ptr in snd_pcm_status()
  pcm: share: Pass appl_ptr and hw_ptr in snd_pcm_status()

 src/pcm/pcm_dmix.c   | 1 +
 src/pcm/pcm_dshare.c | 1 +
 src/pcm/pcm_dsnoop.c | 1 +
 src/pcm/pcm_ioplug.c | 2 ++
 src/pcm/pcm_null.c   | 2 ++
 src/pcm/pcm_share.c  | 2 ++
 6 files changed, 9 insertions(+)

-- 
2.26.2

