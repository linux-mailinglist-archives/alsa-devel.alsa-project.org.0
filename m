Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B634152EFEA
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 18:03:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E0611725;
	Fri, 20 May 2022 18:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E0611725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653062581;
	bh=rM6VKiymD49vXeV5sbZ3ChUDuhFRJdqQsvx2KfDg0Kw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O5ONJ467kawT9NadxlvIHVqE4RYlx7Ne5Zrj1pKIs/bEIDdcZ827e1VlXjQIYQXlx
	 1LfAT6LI1AuuGMoIXWTV1oJKQkzVKkn+0EYqFuwDvDBnjXQ5Pj88SSJXN9aoAO7InE
	 uNpOTH1k+JZySwHeMegX26QHN2+VDS6+clhLnajo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB836F801F5;
	Fri, 20 May 2022 18:02:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E337EF8019D; Fri, 20 May 2022 18:02:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BD9BF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 18:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD9BF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q0fpGkIG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4AE8B82892;
 Fri, 20 May 2022 16:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D171FC385A9;
 Fri, 20 May 2022 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653062515;
 bh=rM6VKiymD49vXeV5sbZ3ChUDuhFRJdqQsvx2KfDg0Kw=;
 h=From:To:Cc:Subject:Date:From;
 b=Q0fpGkIGkk1PrN1yfD/CTMXkXk4C5H00QxytoHAdl5/SHIInNGofGBc/whn4cmlBc
 InqoOA8yf/qb3ab6N/dsUSAbA5vSStYL3Pp2lMBv1VNbPpIMlArevcyVOs4yhBMbNx
 vvYDWPibjPIfQ2J89L0QwBmQvTHq/dEfMnLSpvX0Kv0Fa5LtUro2s6zr46yP1GSZMg
 XfItZDTH3BT7bOIWPiLEoQAh2UhCY5W+e69SDNazdlAh8cMN6nv6pkkU2xhtOAqxTQ
 /yOcN49U20e/hslMVdPb5X0Cb+KhB9afKUGCRpqBJlQQyYQEzAVrM+1vzOy88Oti5J
 wNNn0aNLEzdcw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.18-rc7
Date: Fri, 20 May 2022 17:01:40 +0100
Message-Id: <20220520160154.D171FC385A9@smtp.kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

The following changes since commit 5e02fb590e83684f63217f93a9cdeabd6a925f9c:

  ASoC: cs35l41: Fix DSP mbox start command and global enable order (2022-03-07 13:12:38 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.18-rc7

for you to fetch changes up to 353bb6a5f2ac495f289b7c7a528c7d134c9a8ec4:

  ASoC: wm_adsp: Compressed stream DSP memory structs should be __packed (2022-03-09 17:50:26 +0000)

----------------------------------------------------------------
ASoC: Fix for v5.17

This is rather late and at this point I'm expecting it to get merged in
the merge window rather than as a fix but if we get a -rc8 it's a small,
driver specific fix which should be fine to send.

----------------------------------------------------------------
Simon Trimmer (1):
      ASoC: wm_adsp: Compressed stream DSP memory structs should be __packed

 sound/soc/codecs/wm_adsp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
