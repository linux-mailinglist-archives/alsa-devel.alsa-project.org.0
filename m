Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C37699835
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 16:01:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64113F31;
	Thu, 16 Feb 2023 16:00:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64113F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559664;
	bh=ULSWie6OmYtTqWpFXDO0V4VcfhXu0u9dEOwEaKPbuEU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hLbqef3950SpHy9j+FJqK74/ONEjzZvvhLKuq/e5Aeem5fuRz93TuS7ZiLFhfdISZ
	 P3XfVkjPsJqzAexsOUndx4XWQMjbRC9sTRq5TPHY6Lm2qIU6WOzDCAuiFBTzz9UAf1
	 d09jxtmoWpGDDao6XkOzWwU0LpIptGl8CKysh8CA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1977F805EA;
	Thu, 16 Feb 2023 15:55:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 511D8F800B8; Fri, 10 Feb 2023 05:50:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19E3BF8018A
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 05:50:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19E3BF8018A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Om+u/6Vn
Received: by mail-pf1-x430.google.com with SMTP id y4so2764476pfe.4
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 20:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqShi3EgLDtgztLIgW/MuPsWv2vSLPgVWXrp/LobXww=;
        b=Om+u/6VnAJG9TE8AtmP7qvhlFAe++DibsHxfnKB/uw1rT0M0wwXXptoFr0Xv+20ydo
         eakNNTYlCCk2g+ALxRE6kmjCfzNbNOYJFbMBHqWvHvIm2k/uZfv6KIo0xugx3nQig2py
         J1no3BHk6c8ezYo6oWs4KfkhLQOu7YRb0G1aFzEpM6YreNPESvbQ4vwbkdQg1ll66Mfa
         qmCJAD9lIdQ09n5BrE3kzDSLu8s0jx5ZJ2hqM233WpFqKrLUDc8SXFgEQ8iWwYwFo7zR
         SkcsIvSD7qiSPHhO2o5OR47wO55x0ECXZiVlRFfBnNKUyj1V+gZQOOhi2rAshPHtOKDE
         yP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqShi3EgLDtgztLIgW/MuPsWv2vSLPgVWXrp/LobXww=;
        b=oXDeKi05byC3Mw+8w00KtmNAjVUSUjwpA1IMu/18X5SSvnj8DQr7ZBXJFdu0smq/UH
         LmhtlKCxjWikEFc8roB6EsGZRbZaRS/p6SidkVkXauGuOZcuYJ95Y4DpZaEahE4dHYAv
         OawDiw6rA4Jk0BSiZoISHtYjtemwNylLbNmpMqgfwheQKQ+whgCbjsdcaArlt3miQr6B
         O5UvX/49KfSHaNL/N4NPCQ4AuXQ6eZgmUs1NldI3k7+B9s7bnt03xx2cLH8FnKJX3ztM
         u883TW+cjVMqaA+byiGQuf3QUNH53WOhj0PI88QmcdfSw0ZCO5fS/O0qEFRcBcJPNyAT
         u4Aw==
X-Gm-Message-State: AO0yUKVyngRmre5wO+fwvBba8dKp0/6xD4ew5mrAQ9r6qbrNFoxLbAg3
	lXZA3eiXLUe6ntEw/4xrX47ubqFHC10YpA==
X-Google-Smtp-Source: 
 AK7set//ZS0OEdNcYuTp0DRJ59S0YHaU7AVoVK7clC6F+urpcBjbK1/I7g8ZJg3rnX+smO5B0TtQfg==
X-Received: by 2002:a62:6458:0:b0:5a8:6bb7:5fc5 with SMTP id
 y85-20020a626458000000b005a86bb75fc5mr1170747pfb.19.1676004628485;
        Thu, 09 Feb 2023 20:50:28 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 t13-20020a62ea0d000000b0057fec210d33sm2269218pfh.152.2023.02.09.20.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 20:50:28 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [RFC PATCH 3/9] apple-gmux: use first bit to check switch state
Date: Fri, 10 Feb 2023 15:48:20 +1100
Message-Id: <20230210044826.9834-4-orlandoch.dev@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210044826.9834-1-orlandoch.dev@gmail.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: orlandoch.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PPMRIDQ3PGVHF33OJD7ZACJ2VV4P5VS4
X-Message-ID-Hash: PPMRIDQ3PGVHF33OJD7ZACJ2VV4P5VS4
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:55:23 +0000
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Kerem Karabay <kekrby@gmail.com>,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPMRIDQ3PGVHF33OJD7ZACJ2VV4P5VS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On T2 Macs with MMIO gmux, when GMUX_PORT_SWITCH_DISPLAY is read, it can
have values of 2, 3, 4, and 5. Odd values correspond to the discrete gpu,
and even values correspond to the integrated gpu. The current logic is
that only 2 corresponds to IGD, but this doesn't work for T2 Macs.
Instead, check the first bit to determine the connected gpu.

As T2 Macs with gmux only can switch the internal display, it is
untested if this change (or a similar change) would be applicable
to GMUX_PORT_SWITCH_DDC and GMUX_PORT_SWITCH_EXTERNAL.

Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 67628104f31a..6109f4c2867c 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -332,10 +332,10 @@ static void gmux_read_switch_state(struct apple_gmux_data *gmux_data)
 	else
 		gmux_data->switch_state_ddc = VGA_SWITCHEROO_DIS;
 
-	if (gmux_read8(gmux_data, GMUX_PORT_SWITCH_DISPLAY) == 2)
-		gmux_data->switch_state_display = VGA_SWITCHEROO_IGD;
-	else
+	if (gmux_read8(gmux_data, GMUX_PORT_SWITCH_DISPLAY) & 1)
 		gmux_data->switch_state_display = VGA_SWITCHEROO_DIS;
+	else
+		gmux_data->switch_state_display = VGA_SWITCHEROO_IGD;
 
 	if (gmux_read8(gmux_data, GMUX_PORT_SWITCH_EXTERNAL) == 2)
 		gmux_data->switch_state_external = VGA_SWITCHEROO_IGD;
-- 
2.39.1

