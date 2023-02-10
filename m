Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB10699838
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 16:01:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AB64F22;
	Thu, 16 Feb 2023 16:00:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AB64F22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559701;
	bh=SIQEkjvUS2UGpnkG+/ifZhF5qui1hbADj39G7KDuw+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=et0jfhkMjQpWi6ZmgQlnTa58cAsulr4XaYGu4dOd4WS3byMg4v7YQOlxzgqoo/yNL
	 aOcIkotzoi64Cm2of6g4Ya/a1Av6AIOkgaaUvmOjdbxqms0YKQn2jH0kxmMUI+gfsZ
	 e2Gpgz4Szz1G6tMQzX5h11PTkbPuET+dcYNWMj+Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E002F805F7;
	Thu, 16 Feb 2023 15:55:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6DBAF800E4; Fri, 10 Feb 2023 05:50:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2027F80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 05:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2027F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=B07TtWs0
Received: by mail-pg1-x529.google.com with SMTP id x31so2972832pgl.6
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 20:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE4704yMcD8OhEtSdIHgmuAh40caq0AjoSbBLrO0PpE=;
        b=B07TtWs0e5YqEoHY0pl9umYy3Y4kVoKOXCI+ufw8+ducRUqCUUMQUAurZt/rS3orVs
         6dBeAs1kD/xQ+1IwMyqIuQxioJjgxJ22r6v6gOOuUdm7xjBjBfkq8rV2dSi4mSGgIlMM
         sVuHKT4hGDGQMumOgK84e1Ek/taIl6gUet2+h56Llgs2XE7NFMm5DhsSpn/NWYlUs3oS
         5N2XN+oORiRhXrMvwPY8ZXJU7S16ovhWn9XyMZSYBSwFbbPG1V71CofozZup4QQw5fQ1
         QgBa5iy3Jjn9FqZGRZlEeGcysIKlzgyZqejaCVTLgUJCFwArmizwgE/Rz9xvhjXZkDwW
         LUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sE4704yMcD8OhEtSdIHgmuAh40caq0AjoSbBLrO0PpE=;
        b=xgt7TADMMPz4v+7FooNU89KLjhAqF0Fg42U2P3M91o7qeGe8GAzrbzHUuzZk1I9cCi
         D56LSDARQhmTUbcd6Z39TNKVJO+mR4IMBc5aGN4vdi0TR8RJZrDwPk4D/AFSHDUX41bc
         ALheBTDL0ZKArmhg0UzxF2J45laQ+vr5dJUD81qWlnzHGTGNgFGyEysSnD/ZFhJ/qFPP
         ahmgNWwPNuI5Nf24IVAglXtGvSJVRRWAF9p3lOzMtDR5ma+gmptaBeYQzNmoNE7bkugc
         lkwFkFEUzRTUf4v5NXsl3DxqaZoVkKPc3EKVF+2+PWvzUTqQjjePgCY67buSQK/SPfqz
         d2SA==
X-Gm-Message-State: AO0yUKUaYDlIsv8qCuJ9+Q9eR6+nl5EEW9MjGTkLYJPQqKlIp/9FnUMT
	aADdCUX2AyVBS9OOSSnREhY=
X-Google-Smtp-Source: 
 AK7set+rB1DzlPtgtx+cW6eKyGGS40W+wG2M3MsKCsoZ+srntvMUHEbQXVftnqI/S8nvQnjv5ylLMg==
X-Received: by 2002:aa7:96c3:0:b0:581:a8dc:8f95 with SMTP id
 h3-20020aa796c3000000b00581a8dc8f95mr12954481pfq.12.1676004647757;
        Thu, 09 Feb 2023 20:50:47 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 t13-20020a62ea0d000000b0057fec210d33sm2269218pfh.152.2023.02.09.20.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 20:50:47 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [RFC PATCH 5/9] apple-gmux: Use GMSP acpi method for interrupt clear
Date: Fri, 10 Feb 2023 15:48:22 +1100
Message-Id: <20230210044826.9834-6-orlandoch.dev@gmail.com>
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
Message-ID-Hash: JAGT7OTJ6XBWHSGQJD6WQHWKXQ2N353Y
X-Message-ID-Hash: JAGT7OTJ6XBWHSGQJD6WQHWKXQ2N353Y
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:55:24 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAGT7OTJ6XBWHSGQJD6WQHWKXQ2N353Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is needed for interrupts to be cleared correctly on MMIO based
gmux's. It is untested if this helps/hinders other gmux types, but I
have seen the GMSP method in the acpi tables of a MacBook with an
indexed gmux.

If this turns out to break support for older gmux's, this can instead
be only done on MMIO gmux's.

There is also a "GMLV" acpi method, and the "GMSP" method can be called
with 1 as its argument, but the purposes of these aren't known and they
don't seem to be needed.

Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 760434a527c1..c605f036ea0b 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -494,8 +494,29 @@ static const struct apple_gmux_config apple_gmux_index = {
  * MCP79, on all following generations it's GPIO pin 6 of the Intel PCH.
  * The GPE merely signals that an interrupt occurred, the actual type of event
  * is identified by reading a gmux register.
+ *
+ * On MMIO gmux's, we also need to call the acpi method GMSP to properly clear
+ * interrupts. TODO: Do other types need this? Does this break other types?
  */
 
+static int gmux_call_acpi_gmsp(struct apple_gmux_data *gmux_data, int arg)
+{
+	acpi_status status = AE_OK;
+	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
+	struct acpi_object_list arg_list = { 1, &arg0 };
+
+	arg0.integer.value = arg;
+
+	status = acpi_evaluate_object(gmux_data->dhandle, "GMSP", &arg_list, NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_err("GMSP call failed: %s\n",
+		       acpi_format_exception(status));
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static inline void gmux_disable_interrupts(struct apple_gmux_data *gmux_data)
 {
 	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_ENABLE,
@@ -519,7 +540,10 @@ static void gmux_clear_interrupts(struct apple_gmux_data *gmux_data)
 
 	/* to clear interrupts write back current status */
 	status = gmux_interrupt_get_status(gmux_data);
-	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS, status);
+	if (status) {
+		gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS, status);
+		gmux_call_acpi_gmsp(gmux_data, 0);
+	}
 }
 
 static void gmux_notify_handler(acpi_handle device, u32 value, void *context)
-- 
2.39.1

