Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC4F58CA40
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 16:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8CAD85D;
	Mon,  8 Aug 2022 16:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8CAD85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659968140;
	bh=oPU0DLUkxdK8Emxv+//8HM0A8E6lB2CiTQ9FK//iHTk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f9bL/kpvns/7QLJlqwFH6VGLTsF+hhcF0nDLlAcyDIIn0QrIMn5iFDvvBFbgUEowT
	 2zkmoL/oLiY5EIU1tTmyDyI6MmeBokBaMUTvgrH5lDK8eT+51o/KV+Fj4wF9DjaWLl
	 hRMzuaeRxBzdlD+HONUXDZMtxDc3WYKIdk2TROvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA3A1F80548;
	Mon,  8 Aug 2022 16:14:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61517F80510; Mon,  8 Aug 2022 16:13:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF4F3F80430
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 16:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF4F3F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="GGUn9Xxh"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1659968028; bh=tKWeu11aeXQ63OTvc9oUPZOVNW4tJ0tCoIcgd5/QzcY=;
 h=From:To:Cc:Subject:Date;
 b=GGUn9Xxh2AOR8fCPJgCDChOVNwKnSOyuiqs3uIgw/vAXBqML5KNhp08xKmHIplmbG
 u+1g3fkMUTJoNwJlKhId87MCk28tPqAaCnv7TxQerQ8+pOUV+hrvEqO2Gx/b0HYI8E
 9plHX3cuKzWMlrjbVBdJaOYFSg4UL2HW3uKGKUzM=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/4] TAS2770 fixes
Date: Mon,  8 Aug 2022 16:12:42 +0200
Message-Id: <20220808141246.5749-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 linux-kernel@vger.kernel.org, Frank Shi <shifu0704@thundersoft.com>,
 asahi@lists.linux.dev,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

The first two fixes should be straightforward.

The latter two clean up what looks to me like a mess in the setting of
power levels. However we settle it, we should then do the same changes
to TAS2764, which has the same template (and maybe there are other
drivers).

Martin Povišer (4):
  ASoC: tas2770: Set correct FSYNC polarity
  ASoC: tas2770: Allow mono streams
  ASoC: tas2770: Drop conflicting set_bias_level power setting
  ASoC: tas2770: Fix handling of mute/unmute

 sound/soc/codecs/tas2770.c | 98 +++++++++++++++++---------------------
 sound/soc/codecs/tas2770.h |  5 ++
 2 files changed, 48 insertions(+), 55 deletions(-)

-- 
2.33.0

