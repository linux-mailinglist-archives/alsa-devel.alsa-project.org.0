Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 037923389C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6F883E;
	Mon,  3 Jun 2019 20:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6F883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559588051;
	bh=VK4PM4T2H9jJCqD1/CPFhMMVgS0fS3cg7fs3/4TE8ck=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUvSj3TkOKlMa2VB+EIqxttnGBi0S7T9yqr8k5mhu7UQWL8A8dbhe2slajn+sacvo
	 7fWO0rUSNROK9a5dXKRUHVYOBhGGWKcRvykUsGsHFn3EXEgGQD3ObGXxPtnaJbjYxu
	 tHIs+e7ndHoQ83rFVyaazDtKakaq2kjDfnSSPrQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB240F897CC;
	Mon,  3 Jun 2019 20:35:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66D23F8979E; Mon,  3 Jun 2019 20:34:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 510CBF89793
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 510CBF89793
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="jzLnNqUS"
Received: by mail-pl1-x641.google.com with SMTP id x7so6318405plr.12
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gs3RkhSChaOfEUoWHB9Wz2G7G555U9/P3rBO605JBRM=;
 b=jzLnNqUS1j/McakM7dg5wqpGsZjd5lvealKhrH4q5I1IIhBtPcIlxlaBPTEedX6adW
 GzH72gNQOZ1KJE6gr2mbOcPyeW7bR/sY5i/w9aBB4ooOFORL6rKUprtreKDSfkwOgBi5
 voW3FV0wNq8EN/qc3z2pFHS2adS7OmK0zyQH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gs3RkhSChaOfEUoWHB9Wz2G7G555U9/P3rBO605JBRM=;
 b=WNC1sRUaAyAeH48oRONhWt3Q8cIQsl1W4Z2P+z+dpu12NpwcKKFTNobH48TOMrSfX5
 R3bbbF/lAjjLCI4gq1g0xAAPnYeYtd8P+xknun4UpY8wS6lLfqHJtTOe1jR9wewupRL/
 2G4VJOjjCVi9DMqEJWBhLlyxLu30a/FN9I0gDJgRzj1KPP8LgsDyYQJKurBt6Iz6iC9l
 Bek+AQZGdwio2vJYBxr+vsrcBZvlrdQGkOYUN8rj+ErjuLjsoqDPlX/ahRqdi5+GMp9v
 VjjQG+kJ05AnR3h6iIVB5b0ig4hB9lXzmw3ad3oiSXhyNhQ7BtZ8EtjiL5FzWwKA3sAf
 7cmA==
X-Gm-Message-State: APjAAAXdZAd4NFNb1OKFimeOS9FxmDjRsweW+gEUswOf69LY2nY+pgxY
 jgglwmpHSMAq0i3HXpQdDv6Vog==
X-Google-Smtp-Source: APXvYqxq8uujpPU3jbwev5Ux1pYfEvT9ZB98ctNiwsVil0Ysy3tky345FtKg8p3JCm6w7b44q+kQqw==
X-Received: by 2002:a17:902:934b:: with SMTP id
 g11mr18872897plp.245.1559586889595; 
 Mon, 03 Jun 2019 11:34:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id g9sm12570406pgs.78.2019.06.03.11.34.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:49 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:33:58 -0700
Message-Id: <20190603183401.151408-28-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 27/30] mfd: cros_ec: Add API for rwsig
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

Add command to retrieve signature of image stored in the RW memory
slot(s).

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 4a9ac3861bdd..3d3a37b11002 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -5043,6 +5043,32 @@ struct ec_response_pd_chip_info_v1 {
 	};
 } __ec_align2;
 
+/* Run RW signature verification and get status */
+#define EC_CMD_RWSIG_CHECK_STATUS	0x011C
+
+struct ec_response_rwsig_check_status {
+	uint32_t status;
+} __ec_align4;
+
+/* For controlling RWSIG task */
+#define EC_CMD_RWSIG_ACTION	0x011D
+
+enum rwsig_action {
+	RWSIG_ACTION_ABORT = 0,		/* Abort RWSIG and prevent jumping */
+	RWSIG_ACTION_CONTINUE = 1,	/* Jump to RW immediately */
+};
+
+struct ec_params_rwsig_action {
+	uint32_t action;
+} __ec_align4;
+
+/* Run verification on a slot */
+#define EC_CMD_EFS_VERIFY	0x011E
+
+struct ec_params_efs_verify {
+	uint8_t region;		/* enum ec_flash_region */
+} __ec_align1;
+
 /*****************************************************************************/
 /* Fingerprint MCU commands: range 0x0400-0x040x */
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
