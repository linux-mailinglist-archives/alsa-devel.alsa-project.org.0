Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C66CE36C464
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 12:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5816516F6;
	Tue, 27 Apr 2021 12:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5816516F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619520716;
	bh=Ei6Pjni+1XRtGlg6sBVwCCbsTOF2NK3+L+j3PMaOdoE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGZCvRjgcN4I58qk+bJTNBtc32NwjrLnhnWXm4AODTVH1mIedHhHa8Quzd/SzUtcn
	 xKmSwehL+fDXya7ACPdsrhtL45pw+BZRNhEX8E1Eh6HPKavh+jnJa1nL2JxUEWzHtu
	 iKbTk9a4tp7SFqQLt3uRq8hkKRiEpSceQFVt7kLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AEE5F801D8;
	Tue, 27 Apr 2021 12:50:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B357DF8026C; Tue, 27 Apr 2021 12:50:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7CAAF801D8
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 12:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7CAAF801D8
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BA02F1A0A59;
 Tue, 27 Apr 2021 12:49:58 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 72C7E1A0A89;
 Tue, 27 Apr 2021 12:49:56 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0468140287;
 Tue, 27 Apr 2021 12:49:52 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: [PATCH 2/2] ALSA: pcm: Extend the constraint table for 705.6kHz and
 768KHz rate
Date: Tue, 27 Apr 2021 18:34:23 +0800
Message-Id: <1619519663-10406-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619519663-10406-1-git-send-email-shengjiu.wang@nxp.com>
References: <1619519663-10406-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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

Some high resolution codecs support 705.6KHz and 768KHz rates
so extend the constraint table for 705.6kHz and 768KHz rate

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/core/pcm_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 17a85f4815d5..3e03f34cf3e2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2370,7 +2370,8 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 
 static const unsigned int rates[] = {
 	5512, 8000, 11025, 16000, 22050, 32000, 44100,
-	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000
+	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000,
+	705600, 768000
 };
 
 const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {
-- 
2.27.0

