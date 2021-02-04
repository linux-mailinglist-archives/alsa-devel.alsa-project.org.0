Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEEA30FD13
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 20:42:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D9231665;
	Thu,  4 Feb 2021 20:41:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D9231665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612467732;
	bh=XJw4uVlczv1e2cBs4BcNrATZW31oSMPcdT0bUk8NEu8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dnMt40P1uQnPBw+kJbR+Ppwy5xcCf0qXGRrYLNdd/b/5QYdurSXRV2xhi6QFJ7cxk
	 +waG+1YJRCkdJL/s5C+WZotmV5Jpbq4eccs/9vU9e0t/ZNeyJMeTvl8McpxUVU/bQo
	 grr1n3n0hCDRrALJSIYVTuae7mAEIQ0rfHN7CC2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7068EF801F7;
	Thu,  4 Feb 2021 20:40:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44EFAF80171; Thu,  4 Feb 2021 20:40:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0757F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 20:40:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0757F80152
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id e3286ca7;
 Thu, 4 Feb 2021 19:40:33 +0000 (UTC)
Received: from baphomet.hell (localhost [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id e29ce8bc;
 Thu, 4 Feb 2021 19:40:33 +0000 (GMT)
Received: from localhost.localdomain ([192.168.178.2])
 by baphomet.hell with ESMTPSA id 5ZuVMLBNHGBC/gAAnQSWfg
 (envelope-from <livvy@base.nu>); Thu, 04 Feb 2021 19:40:32 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: tiwai@suse.de
Subject: [PATCH v3 0/1]  Add DJM-750 and simplify
Date: Thu,  4 Feb 2021 19:39:05 +0000
Message-Id: <20210204193906.20716-1-livvy@base.nu>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <s5hft2c8gbq.wl-tiwai@suse.de>
References: <s5hft2c8gbq.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Olivia Mackintosh <livvy@base.nu>,
 fabian@lesniak-it.de
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

Hi Takashi,

I have corrected the various issues raised by checkpatch and also have
just merged the two patches together because they seem to be two
iterations of the same thing. Hopefully it will make it easier to check
and review. I'll check Patchwork and make sure it looks obvious that
I've done this.

Kindest regards,
Olivia

Olivia Mackintosh (1):
  ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk

 sound/usb/mixer_quirks.c | 336 +++++++++++++++++++++++++--------------
 1 file changed, 214 insertions(+), 122 deletions(-)

-- 
2.30.0

