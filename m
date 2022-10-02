Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0A45F266C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 00:53:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E8A12900;
	Mon,  3 Oct 2022 00:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E8A12900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664751197;
	bh=cP8iZQW+GANxcdQXd1eRU4DsQZikYhpQ9Lwu6Y6BBZA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+XAQcuM5FIH9wDYmlj2e3jfb0dzrYdBmcoNuQVM2qbDILo/r1nYftdTX6921Wzpb
	 HgDrWtDzzJYTl8gPzIYMZy5YOG9fEIs+LpMffIf/FxbFS1kqOLEgghnmcC0mEFQ7vV
	 eBT5tO/aD5UQ4Ccli055eGY8pB7pxHa0RMf6v/I8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9863F804B0;
	Mon,  3 Oct 2022 00:52:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4979BF80246; Mon,  3 Oct 2022 00:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 776E4F800A7
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 00:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 776E4F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V1cRNOMY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3EC760F23;
 Sun,  2 Oct 2022 22:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C1BC433C1;
 Sun,  2 Oct 2022 22:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664751136;
 bh=cP8iZQW+GANxcdQXd1eRU4DsQZikYhpQ9Lwu6Y6BBZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V1cRNOMYXu9f9RndpmXW4fJcMlO5L/Vu7K6XyjiMHmGHJhMJEXlOPMX0pFwflbi1I
 fE6B1Uz6xGcZmB31n0gDwfHjRElpcODnKTXa++7HwkAjEdzEOXi4LpdFYaz3utQEtN
 vXL7Nj9bvz1nQyaXXWmZBLhMBraWbcfNYIC7lQ+4LP9JHufsxODzN/Z+plv8o2LL7o
 FJk9Mv55d9NSaG7apWMje2ULrSfvE3GO9m7GWWW3l/M6AGKlNXQClA3GRieOSw0Kev
 H8JZU6ySbdvtRR7vFwO/xlWeZI7uI3i8+I8GMS+w60x/zBX6vNLtmKuB63fFrh2BlW
 V6BYHyHIo9gCg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/14] ALSA: hda/hdmi: Fix the converter reuse
 for the silent stream
Date: Sun,  2 Oct 2022 18:51:49 -0400
Message-Id: <20221002225155.239480-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221002225155.239480-1-sashal@kernel.org>
References: <20221002225155.239480-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com, kai.heng.feng@canonical.com,
 mkumard@nvidia.com, ville.syrjala@linux.intel.com
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

From: Jaroslav Kysela <perex@perex.cz>

[ Upstream commit 5f80d6bd2b01de4cafac3302f58456bf860322fc ]

When the user space pcm stream uses the silent stream converter,
it is no longer allocated for the silent stream. Clear the appropriate
flag in the hdmi_pcm_open() function. The silent stream setup may
be applied in hdmi_pcm_close() (and the error path - open fcn) again.

If the flag is not cleared, the reuse conditions for the silent
stream converter in hdmi_choose_cvt() may improperly share
this converter.

Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Link: https://lore.kernel.org/r/20220913070216.3233974-1-perex@perex.cz
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 71e11481ba41..64f5192bcff8 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1257,6 +1257,7 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 	set_bit(pcm_idx, &spec->pcm_in_use);
 	per_pin = get_pin(spec, pin_idx);
 	per_pin->cvt_nid = per_cvt->cvt_nid;
+	per_pin->silent_stream = false;
 	hinfo->nid = per_cvt->cvt_nid;
 
 	/* flip stripe flag for the assigned stream if supported */
-- 
2.35.1

