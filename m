Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE235A568A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 23:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB0D163D;
	Mon, 29 Aug 2022 23:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB0D163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661810000;
	bh=SLuDKCSxqiHHDmnwI3+58YA9f0120J1/hz6TFh+Tap4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kizYt4/CJhQPMUeSJvSn0+qyvvtR/XlCF05DgUsGubBZ3ud6xffhPLRrACo7wZ4ie
	 3rpFE+IgzLF4v6j//fOYelRyu4O55a4ldw3Az5FJtRYoarEGgx3/L6N1//6hb2hotB
	 34bs6TMlg90icmLrRIK1S9aepdHC7RFj6MBXc5VM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 925FFF800AA;
	Mon, 29 Aug 2022 23:52:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5196EF801F7; Mon, 29 Aug 2022 23:52:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E2C3F8012A
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 23:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E2C3F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A63hqZQ7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 810F361277;
 Mon, 29 Aug 2022 21:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3DEC43147;
 Mon, 29 Aug 2022 21:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661809929;
 bh=SLuDKCSxqiHHDmnwI3+58YA9f0120J1/hz6TFh+Tap4=;
 h=Date:From:To:Cc:Subject:From;
 b=A63hqZQ7KTiL4okMhc6hTVpb6ErLGiUIk4+WN4Nphl6T64TEAGF+8dqUIhP27Gbih
 hZv0pfr+ZoFWsA/39vyd80zby7RFugYSA75SfVP0YOLs/qALtf9EOc4N9STMXCKwLB
 uwlUuEFvEfP2L9Rypr5tVY3uuZ8tiHluuho4EUvzSn67qZ/rAneVlJlnFPWNPbNqBt
 xK0bJSN1+ZeR6DbIGQ6oEhNozVcFqTJ1h0kU1ZU/AM3acPUw5qoVjx9ig8cl3NpOod
 bNWRrtZCHYYEhSKkE8iugEKc37PIungBP7bsoh1LkSrYWN6YmTFUJqgqZR5DcmZI5x
 QItokQItp8okA==
Date: Mon, 29 Aug 2022 16:52:03 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH][next] ALSA: hda/hdmi: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Yw01A+TvF1FWQ588@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

Zero-length arrays are deprecated and we are moving towards adopting
C99 flexible-array members, instead. So, replace zero-length array
declaration in union audio_infoframe with the new DECLARE_FLEX_ARRAY()
helper macro.

This helper allows for a flexible-array member in a union.

Link: https://github.com/KSPP/linux/issues/193
Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/pci/hda/patch_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 6c209cd26c0c..2191d445d74e 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -229,7 +229,7 @@ struct dp_audio_infoframe {
 union audio_infoframe {
 	struct hdmi_audio_infoframe hdmi;
 	struct dp_audio_infoframe dp;
-	u8 bytes[0];
+	DECLARE_FLEX_ARRAY(u8, bytes);
 };
 
 /*
-- 
2.34.1

