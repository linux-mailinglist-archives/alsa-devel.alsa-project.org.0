Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE44648F1
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 08:37:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 328942517;
	Wed,  1 Dec 2021 08:36:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 328942517
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638344253;
	bh=8/myr05LK2LoOXphs3EKhcofTN3rSjeTREGp+mG5tuY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ws/u4tvER6dIbTmOmF9ROrqzV9+0uDpZsOIqhFGmJb0Zf3qO5RksGsHuWMceEB3sf
	 KRk56K5VF1Oe/9AwXvgZ7Sje/dLAHIj+pzS9EMLO+IfGMkYz5n+bAmG6Jc1zur0Phm
	 i5BF20HcTb683gsWplSKEb5ej1D8AXky7OZa+0eY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BC8FF80256;
	Wed,  1 Dec 2021 08:36:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6247F80121; Wed,  1 Dec 2021 08:36:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 624FBF80121
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 08:36:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 624FBF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="jawUE7Yi"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="TQOFqEuQ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 33D391FD5B;
 Wed,  1 Dec 2021 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638344169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=20LA+sdJJV19G4/U8oidDyffbMr+SD5DGP5jCxVb8Zk=;
 b=jawUE7YicucNoWlD0/xyM7LLYUxUPT+1V3FO90sUNkT5NX0+uVBObYa2Rdv6Hs0IgsOYfc
 m0CMQPxQDRVCbVcBDTK2pbeSk+Ds7I3pj/Spvhz/J/2/Gq14kLoe3lhfckHpD+XSJWvdEr
 NmNxdBG/f6cCXYT8U9ltDK2lsYrS8T8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638344169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=20LA+sdJJV19G4/U8oidDyffbMr+SD5DGP5jCxVb8Zk=;
 b=TQOFqEuQNRaYsPUFTqAfna3DkjKOL4NJ6U1k2SLlfjScYDVU2yYrzd02YPLEGEczcrHGO/
 Vq1iESb1RkWegRBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id F186BA3E4B;
 Wed,  1 Dec 2021 07:36:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: pcm: oss: various fixes
Date: Wed,  1 Dec 2021 08:36:03 +0100
Message-Id: <20211201073606.11660-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Bixuan Cui <cuibixuan@linux.alibaba.com>
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

here is a patch set to cover several corner-cases that are found
in PCM OSS layer.  Mostly for addressing the missing error handlings,
but also limit the period size to a reasonable value.


Takashi

===

Takashi Iwai (3):
  ALSA: pcm: oss: Fix negative period/buffer sizes
  ALSA: pcm: oss: Limit the period size to 16MB
  ALSA: pcm: oss: Handle missing errors in snd_pcm_oss_change_params*()

 sound/core/oss/pcm_oss.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

-- 
2.31.1

