Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3E118CF1
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:49:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 404E316AD;
	Tue, 10 Dec 2019 16:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 404E316AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575992942;
	bh=3h8GrDiBWd88oCHcAfkv+KUMtA9g5qlvET0pObduZWM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q1Xjyea9dgNJsYvEiFc4wVvimQk8fQabsd6rzXrE+6TBEDnLGl4plIzq99092BCDd
	 ZyY9qmMo2x9xMboZApLQ1Attv7z6i6yVrNuoHqz3+4E1wwaThkyopy9TvJoy+YoDHo
	 lt5QzL1BCkSeObFoZwO4Yk2hK4QBmPLfItL3u+rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A9E8F80260;
	Tue, 10 Dec 2019 16:45:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF5CDF80248; Tue, 10 Dec 2019 16:45:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 654F0F8020C
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 16:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 654F0F8020C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 04D42B156;
 Tue, 10 Dec 2019 15:45:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Date: Tue, 10 Dec 2019 16:45:34 +0100
Message-Id: <20191210154536.29819-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [alsa-devel] [PATCH for-5.6 0/2] drm/bridge: dw-hdmi: PCM API
	updates
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

this is a patch set for updating ALSA PCM API usages in dw-hdmi
driver.  I already tried to "fix" the driver some time ago but it was
utterly wrong.  So this is a combination of the revised patch and
another cleanup patch.

The first one is to change the buffer allocation mechanism in the
driver to the manual allocation of the h/w buffer and the automatic
allocation of PCM stream buffers via the new standard API.  The
significant change is that size of the h/w buffer isn't no longer
controlled via ALSA preallocation proc file but rather via the new
module option (if any).

The second one is a oneliner patch just to remove the superfluous PCM
ops.

Both need the ALSA PCM core changes in 5.5-rc1, so please apply them
on top of 5.5-rc1 or later.  Or, just let me know if I should apply
them through sound git tree.


thanks,

Takashi

===

Takashi Iwai (2):
  drm/bridge: dw-hdmi: Follow the standard ALSA memalloc way
  drm/bridge: dw-hdmi: Drop superfluous ioctl PCM ops

 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    | 49 ++++++++++++----------
 1 file changed, 26 insertions(+), 23 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
