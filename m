Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3663A461
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 10:12:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2937716A4;
	Mon, 28 Nov 2022 10:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2937716A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669626726;
	bh=4IJsRzjRUBmI8ELm76XeH219TKYxoCY1FpvtAWp9NN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kt/O+Vk7wId9lohwyOMnrYLDPNKpM/38ZOeriQIMvs1uVrcNtISXvn2ZKzjRGI1+T
	 rk0QXoFw/Vlz1x89oKxl3zohRmDLfHGqYQIko7YTcbqI7hRilRTpamaUKB1Ps1rXBk
	 yFXLQhlQ5J4QrIA6mV5/5CnLPlXV7yebn1VWPL24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5BF2F804D8;
	Mon, 28 Nov 2022 10:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2826F800B6; Mon, 28 Nov 2022 10:10:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790CDF8016E
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 10:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790CDF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Y7Z/PxFa"
Received: by mail-ej1-x633.google.com with SMTP id ud5so24125361ejc.4
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 01:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0C3tubLwb2GLSH1X3VvRqQXs2H60xiiDuvmjMSeKtSo=;
 b=Y7Z/PxFaD/VnaXhXyOGe1ep7kAm/dknEPXug0yeRdRkaUlQkVv9MCvcaYEiJvLRkry
 lrCXQY1WoeLSJF2Z7gMjS6IbqVD1pg69EtBDV99XqW42zef9KsDOYIqKUd+OeVB9qiVy
 +H1ykGL80zvjtHMdSMcV9/mXB6AqG1c8naFrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0C3tubLwb2GLSH1X3VvRqQXs2H60xiiDuvmjMSeKtSo=;
 b=p0lKdjilc4uonif++8eTb78KsT/d/tt3XnuX2L0m95PZgFofmUcI2N2O+A0wc5GF03
 cTvjFUibMFjUHWvqbnxIWiFDJ0pueZEba8P/nIIRAXymfe2w24z9rb74OImTfI++mXWb
 M9jh4+lZzQ6Lfp/6OwSMs5xmWn9j75rH6AmwotVVJTe5FSBOksXbc4i5TGaHbiU2gfyA
 Vfm68OU/m9XGcYIgLtNIVxCn6UAE/NbB3siuKwdKUmE9TZb92WihUYolhpKiYcziVSOX
 y8UzmLElxls1pnPRw/54ItmYF9A7NtVg+GxCv+opYiKrwIzOMezKGHBH7TPJtHpQBmub
 9m2Q==
X-Gm-Message-State: ANoB5pmbq4xvUkdCzIPmstoAd4MfZbctCn4raQ1o7RQAVSkgMm9eJYdy
 dnVqRNPTgJ8z1vW5NpOGB4J4qQ==
X-Google-Smtp-Source: AA0mqf568e9xybgGK/wRSf+mQyS6fCinnYqI4Pilk6TRGk3gvya6YcaAW/Z72IJuzNUxNiJTm7kIqw==
X-Received: by 2002:a17:906:f189:b0:7ae:3fa3:d7c6 with SMTP id
 gs9-20020a170906f18900b007ae3fa3d7c6mr40230014ejb.494.1669626637275; 
 Mon, 28 Nov 2022 01:10:37 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 p35-20020a056402502300b00463b9d47e1fsm4932346eda.71.2022.11.28.01.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 01:10:36 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 10:10:13 +0100
Subject: [PATCH v3 1/2] freezer: Add processes_frozen()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v3-1-a2eda731ca14@chromium.org>
References: <20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org>
In-Reply-To: <20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org>
To: Takashi Iwai <tiwai@suse.com>, Len Brown <len.brown@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=4IJsRzjRUBmI8ELm76XeH219TKYxoCY1FpvtAWp9NN8=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjhHsGpUmHDy4LbKwnpR9Rk9CtwMEd0pQpdx1IE0fb
 6zgFBL2JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4R7BgAKCRDRN9E+zzrEiO42EA
 CHpbt3xEX9Nc3qtOSj8Ch4ZuO/hdfkPBhyD4C5+ZvwkIovXOt2hSP+891sKUfkvG7jPbx1tB/SgbSI
 6sdu+55LjjUnH2dANbcNuS79O2FpFCYNPpE7Ay2qDBZZuDb+WP27IOBVfrv7L8+ACy2tqqjELzCwnT
 Q/cZViMSJcGnr5llb+IkzVUz3GVqKc3UKyglcwyP+e+McJFKPsxcUUXhniivY1uTPl4I/maBS/zhbq
 JqBbCuNwXr6Ef3ySgmBCEYGWwuNhbray7QfkYId1aJJa/JnGQ9jQyMM8cdB23ByMOtwVXsBCFUxTUa
 pV2JI//mgbwcjyFitY+33Alk8p+CsZw5/sWyW7TXQTH6t0nZyRLCz3zBvQPAi2HaL1w2E+++dpVUNz
 a86ZD49Njb4GiF19mePCzi3LfsNW07Bz/82Y8NAvyip9oOn4tHhyg2og9wav1n+LzgJj9Fem71kBlz
 75EWG3p/2TiX1aZEaHPCDEX6489tafeRTG1taPq/CgRlcPPxrOfQiOu60xgrq5jDxY7kknT/c0sR22
 bZgxjhGx1MwW6PyoDItmvdmEbbPpFnuWZm1THQuvBTpjP+8H6RUt8LvdpbByM41YDFFj/J0qmtyzGX
 eqihKxGfFODDE3f1r8ri8YaQZECqCn/S4KZvPmGqw+WYi2FVvZ9JYmvN0cPQ==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Cc: "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
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

Add a way to let the drivers know if the processes are frozen.

This is needed by drivers that are waiting for processes to end on their
shutdown path.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/linux/freezer.h |  2 ++
 kernel/freezer.c        | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/freezer.h b/include/linux/freezer.h
index b303472255be..ca861ace0689 100644
--- a/include/linux/freezer.h
+++ b/include/linux/freezer.h
@@ -47,6 +47,7 @@ extern int freeze_processes(void);
 extern int freeze_kernel_threads(void);
 extern void thaw_processes(void);
 extern void thaw_kernel_threads(void);
+bool processes_frozen(void);
 
 static inline bool try_to_freeze(void)
 {
@@ -80,6 +81,7 @@ static inline int freeze_processes(void) { return -ENOSYS; }
 static inline int freeze_kernel_threads(void) { return -ENOSYS; }
 static inline void thaw_processes(void) {}
 static inline void thaw_kernel_threads(void) {}
+static inline bool processes_frozen(void) { return false; }
 
 static inline bool try_to_freeze(void) { return false; }
 
diff --git a/kernel/freezer.c b/kernel/freezer.c
index 4fad0e6fca64..08828c4e12fd 100644
--- a/kernel/freezer.c
+++ b/kernel/freezer.c
@@ -233,3 +233,14 @@ bool set_freezable(void)
 	return try_to_freeze();
 }
 EXPORT_SYMBOL(set_freezable);
+
+/**
+ * processes_frozen - Check if the processes are frozen
+ *
+ * Let drivers know if they shall wait for processes.
+ */
+bool processes_frozen(void)
+{
+	return pm_freezing;
+}
+EXPORT_SYMBOL(processes_frozen);

-- 
2.38.1.584.g0f3c55d4c2-goog-b4-0.11.0-dev-696ae
