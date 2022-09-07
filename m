Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE725B0153
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:10:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AC481DB;
	Wed,  7 Sep 2022 12:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AC481DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545417;
	bh=yDFW8AeMqaFipLKOg9y/+hg+oMClMQZtYyfb7wl4v6o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N0ynX7zgPo5ANGObPO3MiusAAOoBDLA+6GrBcPYOKYz8H99Pp5TEfqWTgUOGFgHxz
	 Po0ojEd/jzfYyN0oBeiMYuY4K1UXKm1BJR/IXKaMj+r+2darivof1ogvyP40NeHjLv
	 btOvOvVbypMe6bzPuRXMkTNz6xmJgBTMGMQBEF00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7403FF80118;
	Wed,  7 Sep 2022 12:09:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B8A4F8028D; Wed,  7 Sep 2022 08:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 by alsa1.perex.cz (Postfix) with ESMTP id 508B3F8023B
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 08:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 508B3F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="DAAkSiGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gpA8V
 5pVUBWAKuao2rXSBnqg89Sc8Qap5SeGlb1rPH0=; b=DAAkSiGC+7yrIU20vZ8vp
 B9wBbjLsQdyzBOl2g0JLM+jjfphlgE3BmgKhHEtLQDoPf705ABH40eGkAIcb1I6m
 bP4NWmKIWFZjZoHt4qWSuaU4SgZUKq+UQY0yesKko9MyaiDsfESeWs8Yr0FIfien
 xCYalk1PblhX/tXKznZqE4=
Received: from localhost.localdomain (unknown [36.112.3.164])
 by smtp5 (Coremail) with SMTP id HdxpCgB3yRFKQRhj9Mwsag--.49282S4;
 Wed, 07 Sep 2022 14:59:30 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda/ca0132: fix potential memory leak in dspxfr_image()
Date: Wed,  7 Sep 2022 14:59:17 +0800
Message-Id: <20220907065917.55810-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgB3yRFKQRhj9Mwsag--.49282S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1rCFWDGFW7uw43Kw17Wrg_yoW8Jw17pa
 y8KrZ8GrZ7Xr1jyw4rJ34jg3WUW3ykZFyftr4Ykw1fZ3sIgFyDXas8G3sYvF4S9FWvkryU
 XFWkCwn8XayDtF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zilksPUUUUU=
X-Originating-IP: [36.112.3.164]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/1tbiQxJ1jFc7bS461AAAsp
X-Mailman-Approved-At: Wed, 07 Sep 2022 12:09:16 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jianglei Nie <niejianglei2021@163.com>
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

dspxfr_image() allocates DSP ports for the download stream with
dsp_allocate_ports_format(). When gets some error, the allocated
DSP ports are not released, which will lead to a memory leak.

We can fix it by releasing DSP ports with dsp_free_ports() when
getting some error.

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 sound/pci/hda/patch_ca0132.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 208933792787..6b8f45e14075 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -3455,6 +3455,7 @@ static int dspxfr_image(struct hda_codec *codec,
 					&port_map_mask);
 	if (status < 0) {
 		codec_dbg(codec, "alloc ports fail\n");
+		dsp_free_ports(codec);
 		goto exit;
 	}
 
@@ -3463,6 +3464,7 @@ static int dspxfr_image(struct hda_codec *codec,
 			WIDGET_CHIP_CTRL, stream_id, 0, &response);
 	if (status < 0) {
 		codec_dbg(codec, "set stream chan fail\n");
+		dsp_free_ports(codec);
 		goto exit;
 	}
 
@@ -3470,6 +3472,7 @@ static int dspxfr_image(struct hda_codec *codec,
 		if (!is_valid(fls_data)) {
 			codec_dbg(codec, "FLS check fail\n");
 			status = -EINVAL;
+			dsp_free_ports(codec);
 			goto exit;
 		}
 		status = dspxfr_one_seg(codec, fls_data, reloc,
-- 
2.25.1

