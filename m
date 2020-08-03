Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD00C239D12
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 02:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BADD15F9;
	Mon,  3 Aug 2020 02:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BADD15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596414755;
	bh=NaKBRizc96t9rnAUVLsNDIUL6VUdcW/tZm14yj3tO88=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3knK1kdRVtZmjH8zv9iS1ppGZYr+hMrIz/qVQoBWZ+hzNIFBNHY5WNsF5WnJa9EL
	 xEN/iRuS6HVqROV+Oj4xOnWepgWyEo3cIsBdZDkv9YIaTgl2qWxT+OR/fz1EJBmJJf
	 Rmaq5vSTxYSwrKSpHHCoPkL4Dwy0zYqbIBQrs/LU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A74CFF802C3;
	Mon,  3 Aug 2020 02:29:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D34CDF80150; Mon,  3 Aug 2020 02:29:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 575A7F8014C
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 02:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 575A7F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fvp68Air"
Received: by mail-qt1-x844.google.com with SMTP id e5so13085311qth.5
 for <alsa-devel@alsa-project.org>; Sun, 02 Aug 2020 17:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2oDXkHoga8CFpulGMHnQLHOpWkVkfgMDqur7ds2Dqg4=;
 b=fvp68AirKtIE2WPpmkrtNexNU0pqxp2MffHcgMRI2XMXiRkKwQuYw5unr3UXL4EHdy
 2mBFPAmQQkAo/IMKfKApD45Kayh0IVhwnAwyC7AaIYQnOAq9TtC17Zhdqicb8W52s3i3
 HGLs/GAmEeF5bOnj6X+McPcRSFrC4ava+Gqxw+NAt7igHx4q8IQvHbC2KypKeHGD/2LS
 xUcwBA83h/BlOWgtwae/LTeQTARl1/psQenlzhBqjthYQybprxzAKIpKx3haniNZkzRl
 V2jxUKrn8ciygpJ8NVenRQM2aOsjrQpcHgqOU7n5TT0GE+4GlcjLzPK5W/+gX5r9yla7
 L+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2oDXkHoga8CFpulGMHnQLHOpWkVkfgMDqur7ds2Dqg4=;
 b=RM5SDaJ/2RQCsCRRqXEcJmScLPsAs9cRERFKKkpUgDRMB8MpaeJWNImREJioOv6Tlz
 Ush2kdmUZecLltF4e34wZg/CEaqWxR4DHaMX2PEmkzLc4C7cQPkHXQgRk62HAxJqivls
 KYpTGyxmTvbbs4AusByxcW9NyDb1SO+N+ZOkXesd6E/lVOWK/7xVO8HHwo9EsQMsGulN
 wWTZ537bUUKz+pJjX2ezPVDLQdy7SEE5qRPXWkPROZjf1x9CyBB2mv6JpCthGoKN4clY
 lyK80vbnB5qMsDm281P42BnYi99EHYZW3zQDr1apQNxrdPxhS3ry/fZ0cEeFSZMlr2Lc
 rYcA==
X-Gm-Message-State: AOAM5325ooCN348I6o4zuNK5P1OsFiEY9vpnME5Pm5GQBZrDu6A7WLkb
 cbJBvP5Hxw3mLq+IAg2A0AI=
X-Google-Smtp-Source: ABdhPJxwQn2dfQG1/MTaE6hRKRGHByyI7Dm6Ezh9RHnplL0UjufYiCFtdY0ZUgze0SuKx7ueRLZssQ==
X-Received: by 2002:ac8:710b:: with SMTP id z11mr14331167qto.64.1596414579713; 
 Sun, 02 Aug 2020 17:29:39 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id e23sm18261614qto.15.2020.08.02.17.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 17:29:39 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 3/3] ALSA: hda/ca0132 - Fix AE-5 microphone selection commands.
Date: Sun,  2 Aug 2020 20:29:27 -0400
Message-Id: <20200803002928.8638-3-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803002928.8638-1-conmanx360@gmail.com>
References: <20200803002928.8638-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 conmanx360@gmail.com, =?UTF-8?q?Pawe=C5=82=20Rekowski?= <p.rekowski@gmail.com>
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

The ca0113 command had the wrong group_id, 0x48 when it should've been
0x30. The front microphone selection should now work.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 40fa9d82ef95..b7dbf2e7f77a 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4672,7 +4672,7 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 			tmp = FLOAT_ONE;
 			break;
 		case QUIRK_AE5:
-			ca0113_mmio_command_set(codec, 0x48, 0x28, 0x00);
+			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
 			tmp = FLOAT_THREE;
 			break;
 		default:
@@ -4718,7 +4718,7 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 			r3di_gpio_mic_set(codec, R3DI_REAR_MIC);
 			break;
 		case QUIRK_AE5:
-			ca0113_mmio_command_set(codec, 0x48, 0x28, 0x00);
+			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
 			break;
 		default:
 			break;
@@ -4757,7 +4757,7 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 			tmp = FLOAT_ONE;
 			break;
 		case QUIRK_AE5:
-			ca0113_mmio_command_set(codec, 0x48, 0x28, 0x3f);
+			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x3f);
 			tmp = FLOAT_THREE;
 			break;
 		default:
-- 
2.20.1

