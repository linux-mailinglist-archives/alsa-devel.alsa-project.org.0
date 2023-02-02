Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C96687A4D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 11:33:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14817832;
	Thu,  2 Feb 2023 11:33:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14817832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675334036;
	bh=SFAiI9Z41+K/0TTJpl6qj2Kl7Zrp/jha4IDaciCWcgo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MTkNTodDiQXF8PPmvCVpFcyElL/h0YDxH4zc6kFtUZ6yUBnwW+Hr8csJaA6nzrhU4
	 oUaRF36H0mZ7iAnH4JmbKSkkuKFchLTbP61HpRo32LLmzCQsVuw5by0GPSwzLDksBW
	 x0ag7osqaagHXn9NlHSw+5qWtmrwCEVoIjy6dEEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E734F804DF;
	Thu,  2 Feb 2023 11:32:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFB03F804C2; Thu,  2 Feb 2023 11:32:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E69A7F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 11:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E69A7F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lkaOghGg
Received: by mail-wr1-x430.google.com with SMTP id a2so973793wrd.6
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 02:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EejFREaRcGB12MROc0EjjXorli5U5zGmeKKwC+PD69Y=;
 b=lkaOghGgKEQfqkgsXwmtwNQu620B8HWmBvHbt38srdgUNTDNN05Th8aLCqnBgb6VAx
 ua3g8NumFJ08kJCBV0N0auJgpyo2Ffg7eNGBbDVcTIrq4jrgLp85fG2Xeb31asM3TY1l
 q+TpSafFUrp0VhfvO0Vxx8r/JXY25T6ZFLFMILS6LVaMGBCFsR7ozAfKqwGpXdzFDVjO
 it2+korIam7YnPh0UMeXmgAzG7r2YeaYZ6OB2J44ieMxlWhY0QlrCaxPVqIHh8ykkkx4
 ikYVQNH46nff01C71lhV9E8qavSMde/Yd2940+5AoHarT41x1KG6U2TRDU/zxKdFprOh
 q9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EejFREaRcGB12MROc0EjjXorli5U5zGmeKKwC+PD69Y=;
 b=7NSasEDpWBhyJu8S+sucFp1O/crFzBBme9Im9FWOkxCjVCh6BZkeUkp7GY1QJ0LgMY
 9Peokul1KKCp6C1YVTtDAz8FgvcgASnF4yIFsJhGf/3C9Jc9l/xHe1KOa3hhw4/YgNLf
 VMFdyeVa7j0vdObwj0D4e8e2E82OjC33TmPVYYYq9CEuk34rA32HTbvDjT9aaLVetPE/
 M/6intgrl+794Wp4A/9qyM1X/yOUuR64L4OcCk9pUSKb7JrUvylwPOpp4GMHdu4lRe9x
 Bj+QDG0r+gYupi+ezq32g0YaYNztiHKZKLWQNnp13kX3Hx7UmcpmgrMRrsxCXaIrzFXi
 8XNQ==
X-Gm-Message-State: AO0yUKVP1NJp3dv8WZcSwV3NYpE9P1r8ciDiBv+YLwRJqB6JJ0ePSg/o
 NyH9+jCR5J0G71/Sq23aJTk=
X-Google-Smtp-Source: AK7set8HdyNKLMuUjW2H8YE/xzHf42PoOyS1nBg2jpeu/DVWNlu8unfSe9+oQS4qNg3TDRb9x0a4og==
X-Received: by 2002:a5d:5984:0:b0:2c3:bbfa:d509 with SMTP id
 n4-20020a5d5984000000b002c3bbfad509mr4366725wri.61.1675333957908; 
 Thu, 02 Feb 2023 02:32:37 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 h4-20020adfaa84000000b002bfbf4c3f9fsm19533001wrc.17.2023.02.02.02.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:32:37 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bruce zhao <zhaolei@awinic.com>, Weidong Wang <wangweidong.a@awinic.com>,
 Nick Li <liweilei@awinic.com>, alsa-devel@alsa-project.org
Subject: [PATCH][next] ASoC: codecs: aw88395: Fix spelling mistake "cersion"
 -> "version"
Date: Thu,  2 Feb 2023 10:32:36 +0000
Message-Id: <20230202103236.270057-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There are spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index 34ae405bb43d..64dde972f3f0 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -890,7 +890,7 @@ int aw88395_dev_cfg_load(struct aw_device *aw_dev, struct aw_container *aw_cfg)
 	case AW88395_CFG_HDR_VER:
 		ret = aw_dev_load_cfg_by_hdr(aw_dev, cfg_hdr);
 		if (ret < 0) {
-			dev_err(aw_dev->dev, "hdr_cersion[0x%x] parse failed",
+			dev_err(aw_dev->dev, "hdr_version[0x%x] parse failed",
 						cfg_hdr->hdr_version);
 			return ret;
 		}
@@ -898,7 +898,7 @@ int aw88395_dev_cfg_load(struct aw_device *aw_dev, struct aw_container *aw_cfg)
 	case AW88395_CFG_HDR_VER_V1:
 		ret = aw_dev_load_cfg_by_hdr_v1(aw_dev, aw_cfg);
 		if (ret < 0) {
-			dev_err(aw_dev->dev, "hdr_cersion[0x%x] parse failed",
+			dev_err(aw_dev->dev, "hdr_version[0x%x] parse failed",
 						cfg_hdr->hdr_version);
 			return ret;
 		}
-- 
2.30.2

