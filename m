Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8A7E7BAD
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:46:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 544211F67;
	Mon, 28 Oct 2019 22:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 544211F67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299174;
	bh=SZSAnZH/7p+LeHPIbHusT848P/z/TUIRnRdrOLwAibY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S90ulYPE4a3DKnIei2cY2BgAw0lasXMof4KSGim3Wo+4J1txbbZ3R0kgYHa85A74L
	 GVOBgHek9yc3FanigI0brD6hvsK5EpPJ6ZjKGo9WJO4WTnrnBS1imZ/V9BNw280I4Z
	 Vu6+HLLYY4jGGv5FoPOfSQRsh0FOntFkrUElU1pI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C5C0F805FF;
	Mon, 28 Oct 2019 22:43:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82041F805FE; Mon, 28 Oct 2019 22:42:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89490F805FB
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:42:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89490F805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EQgZ4y+s"
Received: by mail-yb1-xb44.google.com with SMTP id c13so4046383ybq.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yV5ocChfB15i3h3vkFYf66EH5nCtL8JXl6no9YXSWAw=;
 b=EQgZ4y+sSISdWFXBRoVfOS0GDcxErtQKQdrusskioPHXlNOImH7XN/1j7cfyvfwxWW
 NheQOIHdKAbrkumsycQVnfA8w9MJ2yXAA4mDQG763bwUa4w7BQ4m+BBGl5fhdTNR3Cdo
 fcueMP86FXPTiEWPizWqJhWQh6UW/OGSSFgh3DFA9Og1KDPc2Ya+XLnRjslCREvXIryo
 MpEvu7WvSazWzXRqr5zr1HiheWZlIqAV57AqyL+e3mdbnhOS5JEwzcjQBqhad6H66Udr
 DskbcIlDSGLdFj8379xwd5b6vSSdQkrZmqH7H8NltMUYISIzp47ZAhJfQWgXbuHj4/fJ
 ZtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yV5ocChfB15i3h3vkFYf66EH5nCtL8JXl6no9YXSWAw=;
 b=Mv4XfchOjNlzZGTOoVKTia3e/bJRiRcaveUoa6l2uAbZHY4J8YkGT8n6VrmeNZqtAP
 WtdhD43zlzOrkx6FFuu8M3kKVuQ6raf0izpcV1M4C529V1cWtWIbYuAyIZ4Hge7XYa2L
 cZsC9Akm339qhK8tvX8XDWObbGErhQMDxRH8/OMlH8k08EFgHOFMUUGJVimgC1XScq7X
 RTk5269uPOvlOf41OY2rdEeUiQxUdGSIvRQI2+24371XtEd+LiTKLaUEF2ZruNuWKJN4
 5/5+HcNfLFaripf8USLpba9BYM40Cv1dmrItHAqQ81FJ5J7gn/rx0TSHh9oP4oyJdan3
 urlw==
X-Gm-Message-State: APjAAAXPRo1ad3cc96+EElg7u1tiXWS4pOmpDHFdTZvKeINWnRCF1Wor
 1KQjgzEROi7geXK8QxJSihk=
X-Google-Smtp-Source: APXvYqxvUfVjc28XtRXei4FM9SMxthPc7Dx0Zjj/Y7yXvHCOlW2RH0UKlGcBVlGq8AgYLj63MhHMdg==
X-Received: by 2002:a25:2506:: with SMTP id l6mr16148266ybl.220.1572298974876; 
 Mon, 28 Oct 2019 14:42:54 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:42:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:41:57 -0400
Message-Id: <20191028214216.1508370-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 02/21] drm/amdgpu/soc15: move struct definition
	around to align with other soc15 asics
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Move reset_method next to reset callback to match the struct layout and
the other definition in this file.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 741b564b4aa5..f7146011a786 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1007,6 +1007,7 @@ static const struct amdgpu_asic_funcs vega20_asic_funcs =
 	.read_bios_from_rom = &soc15_read_bios_from_rom,
 	.read_register = &soc15_read_register,
 	.reset = &soc15_asic_reset,
+	.reset_method = &soc15_asic_reset_method,
 	.set_vga_state = &soc15_vga_set_state,
 	.get_xclk = &soc15_get_xclk,
 	.set_uvd_clocks = &soc15_set_uvd_clocks,
@@ -1019,7 +1020,6 @@ static const struct amdgpu_asic_funcs vega20_asic_funcs =
 	.get_pcie_usage = &vega20_get_pcie_usage,
 	.need_reset_on_init = &soc15_need_reset_on_init,
 	.get_pcie_replay_count = &soc15_get_pcie_replay_count,
-	.reset_method = &soc15_asic_reset_method
 };
 
 static int soc15_common_early_init(void *handle)
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
