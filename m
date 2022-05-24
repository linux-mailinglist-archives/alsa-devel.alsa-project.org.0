Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D83532E0D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 18:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 253BF1709;
	Tue, 24 May 2022 17:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 253BF1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653408042;
	bh=6Cm8N7iGoLf4zRP7xWJkH3JlP5PHe89qcww/m1kqHZs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DBxw57NJNK5EP/ykmWw97J26mCUfUF8ZrXm28BfzIFSk8A17GooXmbKYix4hu6iPv
	 a4wpyRteSr4j5528W6KYJVi5eqoiaU81gIgxqIDBa+4ZA3o8G/R/nfqt21w746Mx63
	 xodHFz0tXZvfQ2wBFRCt7rS4wVZat3l6A94AYCfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E7F8F804D9;
	Tue, 24 May 2022 17:59:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99E5DF804D1; Tue, 24 May 2022 17:59:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 754F0F800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 17:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 754F0F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="URDTsRze"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EA256175A;
 Tue, 24 May 2022 15:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F988C34113;
 Tue, 24 May 2022 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653407972;
 bh=6Cm8N7iGoLf4zRP7xWJkH3JlP5PHe89qcww/m1kqHZs=;
 h=From:To:Cc:Subject:Date:From;
 b=URDTsRzelaNOFmufVi6YgY3zXPK+Cn8jiLnGR6rISyeMGcDhVrdG086GYeaGLcsSJ
 PVchyXowSh9904nsJwcuXrf2ERHNT09W/6waB3rt3M4bB3Rfq4axscsADt3qf7s/r2
 QmwYFt+WCf4yEk6v3x/L1PMmaNymCIQjg+CtLJkYMDqLZkvIBPPX7mH4LMNUF74H67
 LXAM90Kr8vI9SF5NP2sZNK73nwoYdPHT6m7oEd0iTEAmE8TlFPcSRaTEXjTfXFbpik
 qYcEKT0Y1Wo6tcqENmuhn6j0/vichiV2L+uRQd+rHSw8VeMzWVM6tJCuNNwA9DDEda
 rZJn3Fr6wf9RQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 01/12] ALSA: usb-audio: Don't get sample rate for
 MCT Trigger 5 USB-to-HDMI
Date: Tue, 24 May 2022 11:59:15 -0400
Message-Id: <20220524155929.826793-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Forest Crossman <cyrozap@gmail.com>,
 tiwai@suse.com, alexander@tsoy.me
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

From: Forest Crossman <cyrozap@gmail.com>

[ Upstream commit d7be213849232a2accb219d537edf056d29186b4 ]

This device doesn't support reading the sample rate, so we need to apply
this quirk to avoid a 15-second delay waiting for three timeouts.

Signed-off-by: Forest Crossman <cyrozap@gmail.com>
Link: https://lore.kernel.org/r/20220504002444.114011-2-cyrozap@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index ab9f3da49941..fbbe59054c3f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1822,6 +1822,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x0711, 0x5800, /* MCT Trigger 5 USB-to-HDMI */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
-- 
2.35.1

