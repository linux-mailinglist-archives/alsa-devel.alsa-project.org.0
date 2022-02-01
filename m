Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB424A60DC
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 16:59:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4373182F;
	Tue,  1 Feb 2022 16:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4373182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643731141;
	bh=9ZDO1dKDNw9O5jWNY34xTQv5y0vT3/uQHUgt832f6vQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uy3gAb70YOeEdeXQu0xkLr4OBUsKw7AZxRU5mz4G0sD3Wa62puYCU/E2xqtefeJnK
	 gRhRx7Ny4mvLGwmEcLl7Sn4D8leJUOb3OkvwIXJLFr4t+K/KlngQhL9dKtNLSAU+/U
	 PlLKQkMe4H+AfdIX3FauHxEBa5fY1ESP59N0c5gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D334F80517;
	Tue,  1 Feb 2022 16:57:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EE38F80095; Tue,  1 Feb 2022 16:57:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41DB2F80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 16:57:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41DB2F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QCyjiYED"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76AF4616DE;
 Tue,  1 Feb 2022 15:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE0CC340EE;
 Tue,  1 Feb 2022 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643731032;
 bh=9ZDO1dKDNw9O5jWNY34xTQv5y0vT3/uQHUgt832f6vQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QCyjiYEDSQfZ85Yj3Q8WW8b1Urs8kbGBfA8NjlGupGJvYQB0PFQkZiVrJbCiLV1P3
 fv5UQPXspCnAZIRVAfXByAjye+SZcZcGnq8nupw4WUmVP/4l1PMiAP52BrVLYBVkgP
 ARSCOdjNLBuhyfJttoZq79+Riiz19fYNxyNCxXDvlxmmBItVNDqZx7lpxMCA/FKQge
 uyoFmnyt+eg4sKYMRMImFDSXyb8GwG/CydU+ArLhcKIjt2a1YoqWrUDt4gjFj6Ao9E
 ziMSjVPMhwTdBC+br6tTn0Ti9avVJy7meNnwrlJodU8kcTaqmMUYY8PFTZ+Z6U/IMt
 aiWwlfqA1ZVuQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 2/4] ASoC: ops: Fix stereo change notifications in
 snd_soc_put_volsw_sx()
Date: Tue,  1 Feb 2022 15:56:27 +0000
Message-Id: <20220201155629.120510-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201155629.120510-1-broonie@kernel.org>
References: <20220201155629.120510-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; h=from:subject;
 bh=9ZDO1dKDNw9O5jWNY34xTQv5y0vT3/uQHUgt832f6vQ=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsSfEdqm+RcD8nRtZdyy52fv3dQ+NV3XMj/5702/lm2tUs3y
 8ys6GY1ZGBi5GGTFFFnWPstYlR4usXX+o/mvYAaxMoFMYeDiFICJCP5j/6fzT/eMU98ztdT03y+l/t
 S8WV4u1s/6f2+rCsdvLpHFZ4/b5k3XX9YRVuY++fSF0D97cjS00joUI/2at+8y97PJLUt68eCFUEPl
 hNeGgsunu8f/ffwwTcNs/tf4PHl7T9HnvRcKqjQqmtNOshjtcl3VoVac2ZfSIT/t2OuMubWierHJP+
 vbFC1e3I9Ydt38zMY7ZzIb6nc7MRdzrtB65ivzbtW0WqaOwkn7I2Qk7hX6Lcjg+7SRLa18weUtRznn
 3VU21hJ/Xfxqvxnfp+tfutZuZnvM8jmwQMnl8KdDB53yNV5rvPLxuVb45Uy/763eel8d5wc/PwnHr6
 10fpA+WbzqhxxTQ/kivf57qdHMAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
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

When writing out a stereo control we discard the change notification from
the first channel, meaning that events are only generated based on changes
to the second channel. Ensure that we report a change if either channel
has changed.

Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-ops.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 73c9d53de25b..f0d1aeb38346 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -413,6 +413,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	int min = mc->min;
 	unsigned int mask = (1U << (fls(min + max) - 1)) - 1;
 	int err = 0;
+	int ret;
 	unsigned int val, val_mask;
 
 	val_mask = mask << shift;
@@ -422,6 +423,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	err = snd_soc_component_update_bits(component, reg, val_mask, val);
 	if (err < 0)
 		return err;
+	ret = err;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		unsigned int val2;
@@ -432,6 +434,11 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 
 		err = snd_soc_component_update_bits(component, reg2, val_mask,
 			val2);
+
+		/* Don't discard any error code or drop change flag */
+		if (ret == 0 || err < 0) {
+			ret = err;
+		}
 	}
 	return err;
 }
-- 
2.30.2

