Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB630EB1F
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 04:47:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72ED816B0;
	Thu,  4 Feb 2021 04:46:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72ED816B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612410441;
	bh=zlq2nwu9GNNqbfLC0ShxtL3pOr7/xL/ULA5jQ3UqbhM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rNJ/ilFSde89dYO+Zjv7ljfry/oOexyNbLPUGQXd+gq62a7UmCmCZxmXcl5gWklSj
	 5u1YGL1nF2dI3dGEOOI62nk5soHB4QSvxDWVvfKm0TlK9Oi9Q/Xaehzb4JdTonWjuj
	 Lzpkkwmb2VKNKIH0zkTZwf7jMCIDKG+Oex41FVmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB71FF8023C;
	Thu,  4 Feb 2021 04:45:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F756F8021C; Thu,  4 Feb 2021 04:45:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8236F80154
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 04:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8236F80154
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id c9fdef0e;
 Thu, 4 Feb 2021 03:45:41 +0000 (UTC)
Received: from baphomet.hell (localhost [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id d1743cc3;
 Thu, 4 Feb 2021 03:45:41 +0000 (GMT)
Received: from localhost.localdomain ([192.168.178.2])
 by baphomet.hell with ESMTPSA id pG6rCeVtG2AqYAAAnQSWfg
 (envelope-from <livvy@base.nu>); Thu, 04 Feb 2021 03:45:41 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] Add DJM-750 and simplify
Date: Thu,  4 Feb 2021 03:44:30 +0000
Message-Id: <20210204034432.15504-1-livvy@base.nu>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128160338.dac4vrj7wjiykcxm@base.nu>
References: <20210128160338.dac4vrj7wjiykcxm@base.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Olivia Mackintosh <livvy@base.nu>,
 Fabian Lesniak <fabian@lesniak-it.de>
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

This is a re-roll of my last patch with the addition of some
improvements. Hopefully it reduces the noise a little and simplifies the
adding of new devices. One thing I haven't done here is replace the
arrays of values for each channel with a named definition. In order to
do this, the actual wValue would need to include the channel mask.

Olivia Mackintosh (2):
  ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk
  ALSA: usb-audio: Simplify DJM mixer quirks

 sound/usb/mixer_quirks.c | 333 ++++++++++++++++++++++++---------------
 1 file changed, 210 insertions(+), 123 deletions(-)

-- 
2.30.0

