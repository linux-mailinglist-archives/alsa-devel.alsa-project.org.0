Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643D52E127C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 03:26:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9B7A1816;
	Wed, 23 Dec 2020 03:25:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9B7A1816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608690377;
	bh=WBqDuayCV7bHc0003FRT9fRU1+cexu0VCublrK+YFW4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvHfDWPQ6evJohMnm8Jp4oZP+uR9axrq+kEfKIlPjI+IJF9FStI+HBLAeZw2Qp79i
	 MmPTLC07QGdHsV4I2CFEllQPo1NGdj/qc5DECVkSuCxgXkmFGkFDCaY+XftcaMWMrr
	 PwocdOZi+1hj/A/nuwSiD0oS+uaYA0u3oIfdWS/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA63BF804BD;
	Wed, 23 Dec 2020 03:25:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20640F804BD; Wed, 23 Dec 2020 03:25:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EE20F8013F
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 03:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EE20F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GPZhS1+V"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC4E52333E;
 Wed, 23 Dec 2020 02:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608690314;
 bh=WBqDuayCV7bHc0003FRT9fRU1+cexu0VCublrK+YFW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GPZhS1+VsAFIEN4PHwWgxIkjx1gco/r6obo2QiAvlQ0CnuJiIlq5WagUMlEDlD8d3
 8Qts1ZgFsoM4hL9fUjRK++ibqYiTuibx5HzLRvs7+x5JmMFloWSPIl6Zxck7rM33CU
 8RhznfB0YtoofUZ0a3mAVgmc/O32TK2G+E9v+TpJCJQvUihNB6Jcjk8bXjFMGDWRJm
 9NIUPrWDmYpmSTSWfdZ5v57AJQArnLHMZj7NOxNCYU9HS29Pnuye2VZdhrOIx61Olw
 l5/EejxQRbDR32GV+eh/BE1SxyyZcdpd0z2eGu4ZorF9+oQT+FoC3oNhdF9XFGde68
 c5BuCRDdSyMOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 47/48] ALSA: hda/hdmi: packet buffer index must be
 set before reading value
Date: Tue, 22 Dec 2020 21:24:15 -0500
Message-Id: <20201223022417.2794032-47-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223022417.2794032-1-sashal@kernel.org>
References: <20201223022417.2794032-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit 46c3bbd9827952f92e250fa6ee30a797a4c4e17e ]

The check for infoframe transmit status in hdmi_infoframe_uptodate()
makes the assumption that packet buffer index is set to zero.

Align code with specification and explicitly set the index before
AC_VERB_GET_HDMI_DIP_XMIT. The packet index setting affects both
DIP-Data and DIP-XmitCtrl verbs.

There are no known cases where the old implementation has caused driver
to work incorrectly. This change is purely based on code review against
the specification (HDA spec rev1.0a).

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20201211131613.3271407-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index ba0c3a381933e..53eb05d0722b0 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -610,11 +610,11 @@ static bool hdmi_infoframe_uptodate(struct hda_codec *codec, hda_nid_t pin_nid,
 	u8 val;
 	int i;
 
+	hdmi_set_dip_index(codec, pin_nid, 0x0, 0x0);
 	if (snd_hda_codec_read(codec, pin_nid, 0, AC_VERB_GET_HDMI_DIP_XMIT, 0)
 							    != AC_DIPXMIT_BEST)
 		return false;
 
-	hdmi_set_dip_index(codec, pin_nid, 0x0, 0x0);
 	for (i = 0; i < size; i++) {
 		val = snd_hda_codec_read(codec, pin_nid, 0,
 					 AC_VERB_GET_HDMI_DIP_DATA, 0);
-- 
2.27.0

