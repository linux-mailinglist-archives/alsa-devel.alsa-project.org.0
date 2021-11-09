Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D187D44B6FB
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:28:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 775B01685;
	Tue,  9 Nov 2021 23:27:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 775B01685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636496899;
	bh=TIJ+vD1aPoa35CzXFWMlwjwUNUfZNddnOajKeY74Lao=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Be3tn3Xy8EuJvN1zxHA3H1ohtfKet3MW6myWxcUFsgZizF3kdo94GknTswRkV+aGb
	 uGehLEQkERTL3huh1GZEsfQpygvF+/XHxxlHwHN3U7zAIo/otNUZ2baD86/J6zI7Qg
	 2S6E1RYQi5IiBUqUTPTn3GWBwRZyz780v/R7/Rkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6891F80589;
	Tue,  9 Nov 2021 23:21:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B099F8051C; Tue,  9 Nov 2021 23:21:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37BDBF8051B
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37BDBF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cXiVo+6Z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EB4561ACF;
 Tue,  9 Nov 2021 22:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496506;
 bh=TIJ+vD1aPoa35CzXFWMlwjwUNUfZNddnOajKeY74Lao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cXiVo+6ZPIZ/+MJ5AeUOV13LBXE5XWZ01QLpVKtJWUtO+At/CBsyog10uY0y6Tk2x
 4smEYjbMT+HrxkEIp3GFqDaxJ2ll16GA6TSFhDtfnVZZvQA0SJJ3+YekcGTQ3DSPCo
 qvWJ9TCFriKnjbH0Yizc2VTAiMXVe3JrqZIzMzMIFSLF2a2RXZnvOZNj6HiW1Go5ML
 NAQ+FZd1isnkv4CmUZnMDmQJQIJJrhRRqG9DIXnz4+3WdPxC1gAliWn18DxOloXYJ9
 zN+FSYyD3MpovTOY9fL5/iXwyChU4rlbAAJAhGKdujhOrN7dzcB88OBFlJ4VxxwJ8W
 JSvA6xmvKx60w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 25/50] ASoC: SOF: Intel: hda-dai: fix potential
 locking issue
Date: Tue,  9 Nov 2021 17:20:38 -0500
Message-Id: <20211109222103.1234885-25-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109222103.1234885-1-sashal@kernel.org>
References: <20211109222103.1234885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit a20f3b10de61add5e14b6ce4df982f4df2a4cbbc ]

The initial hdac_stream code was adapted a third time with the same
locking issues. Move the spin_lock outside the loops and make sure the
fields are protected on read/write.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20210924192417.169243-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c6cb8c212eca5..ef316311e959a 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -68,6 +68,7 @@ static struct hdac_ext_stream *
 		return NULL;
 	}
 
+	spin_lock_irq(&bus->reg_lock);
 	list_for_each_entry(stream, &bus->stream_list, list) {
 		struct hdac_ext_stream *hstream =
 			stream_to_hdac_ext_stream(stream);
@@ -107,12 +108,12 @@ static struct hdac_ext_stream *
 		 * is updated in snd_hdac_ext_stream_decouple().
 		 */
 		if (!res->decoupled)
-			snd_hdac_ext_stream_decouple(bus, res, true);
-		spin_lock_irq(&bus->reg_lock);
+			snd_hdac_ext_stream_decouple_locked(bus, res, true);
+
 		res->link_locked = 1;
 		res->link_substream = substream;
-		spin_unlock_irq(&bus->reg_lock);
 	}
+	spin_unlock_irq(&bus->reg_lock);
 
 	return res;
 }
-- 
2.33.0

