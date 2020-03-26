Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D714194D3C
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 00:29:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 365D01672;
	Fri, 27 Mar 2020 00:29:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 365D01672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585265398;
	bh=HZKph1vlL2+lbjT545LdjST3edbD4zKJanui7XS+8/I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S0elKqq4fnoZrz4IBvMk4nJZAKf7Mjhci2mh27iLArFz671ApATkzSyi5PIP0SXnx
	 X/XPr/0/t+ZEjGBdHTmGD8HcEcPmVgtPFxiorABTY8ZTwVrTe0vHcajjy0XI/vlELS
	 RC0ERN4Lon5g2wXXiV/RjT7aAJrQI8hYMRHp5/xs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84934F802DD;
	Fri, 27 Mar 2020 00:25:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D79BF802C4; Fri, 27 Mar 2020 00:24:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C6A8F802C2
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 00:24:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C6A8F802C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="awNVImfe"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 797E320409;
 Thu, 26 Mar 2020 23:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585265089;
 bh=HZKph1vlL2+lbjT545LdjST3edbD4zKJanui7XS+8/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=awNVImfem1FjxMDX6/ArD9J0T/EkPE31LyCBS9kNiWvrkLzlIjCIQqdWuhXXn0IsP
 KJUEZZLuh2Jn1f1AcKnfmEFJ1NMS0d12xgo5YSuipSwNpRtvlql6itKm5qX39YvWrG
 TEWdCKYZTxRqb7XlrZtGd33jsZqimch4ZkC9Z+qk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 15/19] ALSA: pcm: oss: Avoid plugin buffer overflow
Date: Thu, 26 Mar 2020 19:24:27 -0400
Message-Id: <20200326232431.7816-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326232431.7816-1-sashal@kernel.org>
References: <20200326232431.7816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 syzbot+e1fe9f44fb8ecf4fb5dd@syzkaller.appspotmail.com,
 alsa-devel@alsa-project.org
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit f2ecf903ef06eb1bbbfa969db9889643d487e73a ]

Each OSS PCM plugins allocate its internal buffer per pre-calculation
of the max buffer size through the chain of plugins (calling
src_frames and dst_frames callbacks).  This works for most plugins,
but the rate plugin might behave incorrectly.  The calculation in the
rate plugin involves with the fractional position, i.e. it may vary
depending on the input position.  Since the buffer size
pre-calculation is always done with the offset zero, it may return a
shorter size than it might be; this may result in the out-of-bound
access as spotted by fuzzer.

This patch addresses those possible buffer overflow accesses by simply
setting the upper limit per the given buffer size for each plugin
before src_frames() and after dst_frames() calls.

Reported-by: syzbot+e1fe9f44fb8ecf4fb5dd@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/000000000000b25ea005a02bcf21@google.com
Link: https://lore.kernel.org/r/20200309082148.19855-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/oss/pcm_plugin.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 31cb2acf8afcc..9b588c6a6f099 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -209,6 +209,8 @@ snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug, snd_p
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		plugin = snd_pcm_plug_last(plug);
 		while (plugin && drv_frames > 0) {
+			if (drv_frames > plugin->buf_frames)
+				drv_frames = plugin->buf_frames;
 			plugin_prev = plugin->prev;
 			if (plugin->src_frames)
 				drv_frames = plugin->src_frames(plugin, drv_frames);
@@ -220,6 +222,8 @@ snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug, snd_p
 			plugin_next = plugin->next;
 			if (plugin->dst_frames)
 				drv_frames = plugin->dst_frames(plugin, drv_frames);
+			if (drv_frames > plugin->buf_frames)
+				drv_frames = plugin->buf_frames;
 			plugin = plugin_next;
 		}
 	} else
@@ -248,11 +252,15 @@ snd_pcm_sframes_t snd_pcm_plug_slave_size(struct snd_pcm_substream *plug, snd_pc
 				if (frames < 0)
 					return frames;
 			}
+			if (frames > plugin->buf_frames)
+				frames = plugin->buf_frames;
 			plugin = plugin_next;
 		}
 	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
 		plugin = snd_pcm_plug_last(plug);
 		while (plugin) {
+			if (frames > plugin->buf_frames)
+				frames = plugin->buf_frames;
 			plugin_prev = plugin->prev;
 			if (plugin->src_frames) {
 				frames = plugin->src_frames(plugin, frames);
-- 
2.20.1

