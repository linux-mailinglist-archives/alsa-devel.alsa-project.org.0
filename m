Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5095194D55
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 00:35:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D4BB1683;
	Fri, 27 Mar 2020 00:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D4BB1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585265704;
	bh=lQb/xXX8zVFoZHn6gU47t5ZizdgR0lyDspWP5kOlTWE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NiFSvT9OInEj8XlKcP928s4PPZVhX8efNvLuJtGFYLh4sg/eSC3yFdPxlGMW2qtXL
	 2RZ8KyGNgPwYjx3K+45QQCPAJYPCQFQKwKLAxyj1OLHhMUC9NwWlvt/nxeIJqzc7nK
	 l0nAyoANAWb3r1vS+PynFkHaRUfZp/pE5plwwD1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D861F80339;
	Fri, 27 Mar 2020 00:25:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E259CF80331; Fri, 27 Mar 2020 00:25:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EC86F80322
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 00:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC86F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UxNPq30g"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5641F20774;
 Thu, 26 Mar 2020 23:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585265128;
 bh=lQb/xXX8zVFoZHn6gU47t5ZizdgR0lyDspWP5kOlTWE=;
 h=From:To:Cc:Subject:Date:From;
 b=UxNPq30ggtP+Thjhe2Em4IXnS/K/S/yje3I3U0xnn6870qq6uwEooBcyE5qpsAbRH
 F1r75U9f8eHLsCjoThNZsyOgeIEmeKVBhqLtDlu/nh1A4a81+w1Kc3rjc74qVMibhQ
 SJqxsWP89ElNDK2gtd0UYf4vsLqHAcL6/26hhVJQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 1/7] ALSA: hda/realtek: Fix pop noise on ALC225
Date: Thu, 26 Mar 2020 19:25:20 -0400
Message-Id: <20200326232526.8349-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Kai-Heng Feng <kai.heng.feng@canonical.com>
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

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

[ Upstream commit 3b36b13d5e69d6f51ff1c55d1b404a74646c9757 ]

Commit 317d9313925c ("ALSA: hda/realtek - Set default power save node to
0") makes the ALC225 have pop noise on S3 resume and cold boot.

So partially revert this commit for ALC225 to fix the regression.

Fixes: 317d9313925c ("ALSA: hda/realtek - Set default power save node to 0")
BugLink: https://bugs.launchpad.net/bugs/1866357
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Link: https://lore.kernel.org/r/20200311061328.17614-1-kai.heng.feng@canonical.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a64612db1f155..d7b33c9c9f40b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6410,6 +6410,8 @@ static int patch_alc269(struct hda_codec *codec)
 		spec->gen.mixer_nid = 0;
 		break;
 	case 0x10ec0225:
+		codec->power_save_node = 1;
+		/* fall through */
 	case 0x10ec0295:
 		spec->codec_variant = ALC269_TYPE_ALC225;
 		break;
-- 
2.20.1

