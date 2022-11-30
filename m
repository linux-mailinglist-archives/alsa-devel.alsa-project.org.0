Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9867663D9DB
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 16:49:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F54716E3;
	Wed, 30 Nov 2022 16:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F54716E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669823375;
	bh=8KNJHp4bIWX3457t5aVwfPrimmRsszM5ZU7XjdRn1bo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RReIanh7H4g17KczhS09RIZhfEaoBtQj2vDwSDei2QQzh2Q9k5lS7VP3KFdJdCizi
	 QgZhNsXDBrgGVXepSp8EUIhnACgqaIK6TMN1C7YBt7AvjKGg1gYBWFjKwCK7XOlkXj
	 8LKsWKs529du+XncRyAbeZup1HRrWBDfaFYEENUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B6DF8055A;
	Wed, 30 Nov 2022 16:48:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3AC9F80557; Wed, 30 Nov 2022 16:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5C7AF803DD
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 16:47:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5C7AF803DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="f6hF3vFs"
Received: by mail-ej1-x633.google.com with SMTP id td2so28228270ejc.5
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PpwU6lO07Wd5+RTLzDaFrlMeJKtxn3n7JzQ4dKSGqkc=;
 b=f6hF3vFsxSnGCy9wCKWuHFT0WJZyRYdEltOsfQYOfxdVzNYA56H5+kI6SDsG8Jv8iP
 xpMthqB2d9L+tvEU+8mmi4lIjO4ZSwm3TkU6BjYGKxkfEgyV/Y1KWwmQJzZXLLRuOccr
 jLgTTdIqz4gsM+g+psj9xMSLrrxOY19iAPPkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PpwU6lO07Wd5+RTLzDaFrlMeJKtxn3n7JzQ4dKSGqkc=;
 b=EXlAdictSSp80L5FYp4712KFRHMurQZpAV+klcL6UtNajK5nFUIIA+0S72/T5eZP0m
 EhIgZVw3j3RVfEbvmUA+wEwYiLe5h7f6O+zIFuOIX+6nDYSZKAXv37N3VqxmQ6v6Dys1
 TVlqnwmWoP59c9VJAzI1wS706aglqSqKhsJiKATnnXa/RSMySa+6L/x4nyQKL1BK1AhA
 Bf6FPcFba/I3Qg6ZJK8vx0JvNzUAB3N9KPNVjdesYh689rC4iGVr7Ic5ksnv6KJpt4nl
 EKcjlb7lutCgksgdRa2qyGJB5xYF2s6tTEmjZ2oka9/0ujRBaqljZHSVE5GqTu5UQe6L
 EVow==
X-Gm-Message-State: ANoB5pl48bgOpGXFwCRKMV7hfcGLeQi1jH4BeONbOT12vY26PM8o0d4m
 LAO0/DH6BtYIaTNN42rHElfFrA==
X-Google-Smtp-Source: AA0mqf7DwqNEHgiWsouxEwORa56y6/ebKwumRyswcDnFFZOeUNCe+tAd3MtXuHm+kPXx5zdP5k9qsg==
X-Received: by 2002:a17:906:7d50:b0:79e:4880:dd83 with SMTP id
 l16-20020a1709067d5000b0079e4880dd83mr42393283ejp.166.1669823264990; 
 Wed, 30 Nov 2022 07:47:44 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:5b33:e3f2:6a0b:dcdd])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a17090623e900b007bf24b8f80csm775075ejg.63.2022.11.30.07.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 07:47:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Nov 2022 16:47:15 +0100
Subject: [PATCH v6 1/2] kexec: Introduce kexec_with_frozen_processes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v6-1-3e90553f64a5@chromium.org>
References: <20221127-snd-freeze-v6-0-3e90553f64a5@chromium.org>
In-Reply-To: <20221127-snd-freeze-v6-0-3e90553f64a5@chromium.org>
To: Chromeos Kdump <chromeos-kdump@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Eric Biederman <ebiederm@xmission.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Steven Rostedt <rostedt@goodmis.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=8KNJHp4bIWX3457t5aVwfPrimmRsszM5ZU7XjdRn1bo=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjh3sY6zR75vurA7LbZ/y+DlMy3+LOHJvYsQBT5ZNe
 OrXrGryJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4d7GAAKCRDRN9E+zzrEiGE7D/
 42IsMvDeI6JrkcVeMw7Hlfq60ybXBrbBYP6z6lfI2McsZDckIPRHulAy1YaBGvwleMujpo8QR/zGrv
 mQVQYgRmSc/2j1YZq+QAOeY3qRY0FBGqtTaoHMfhOUkHVWWxYzK1oltg2HO43+cIyylRYtSCfOLY5Y
 w53p26AsgVTDQ4fxK/O8jrjIkW13Jbt5WH3L37A+QIIs+kYAXvmpPtzhP9EHsAb6rSD641jnBqRWBN
 gbRcoyer/rWDxvP3MvKiV4I9ZNjo3aikeI+quK7XKCDXM1cQrDeDfqCfASH4iKEcwlNvutYUARz8Cn
 T6Cz2A8fhHfYiC2zgz9H7jkg6DbSnFtm2Qug08WDdUHpVlsEuv/RjNNNkVM3OZ2IucOUqqCnIgXyxv
 t0Q1FJf6kMOV7Ro0xS3QAYlKrKX/3qKHTvhHpzzJjTl3dGv+MDaTKiJ1gS2SEQlpTNiyMoZ9GPlHMK
 CQ/VXwvDyESv6ppBKX/2vD5RkxySkE9xFNbVCW8EhvZPTgBpROM1bBm0AMhea5nSN5WlHi43N35JXE
 JWQV0jbgACSFhMdc1LxqiQhXKKpZNV2M7draG29cUlIVxJ5ofMLzLBFWk4AykI+eXVMeXzrY515t8R
 5B0mNX5S0bm/nLJ9+PeTGx6CTZ2XUspcyg7KtBfwXj1O/SeVQeoo5rmGgVEg==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Cc: alsa-devel@alsa-project.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>, sound-open-firmware@alsa-project.org
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

Drivers running .shutdown() might want to wait for userspace to complete
before exiting.

If userspace is frozen and we are running kexec they will stall the
computer.

Add a way for them to figure out if they should just skip waiting for
userspace.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/linux/kexec.h | 3 +++
 kernel/kexec_core.c   | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 41a686996aaa..c22711e0f7b5 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -426,6 +426,8 @@ extern int kexec_load_disabled;
 /* flag to track if kexec reboot is in progress */
 extern bool kexec_in_progress;
 
+bool kexec_with_frozen_processes(void);
+
 int crash_shrink_memory(unsigned long new_size);
 ssize_t crash_get_memory_size(void);
 
@@ -507,6 +509,7 @@ static inline void __crash_kexec(struct pt_regs *regs) { }
 static inline void crash_kexec(struct pt_regs *regs) { }
 static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 static inline int kexec_crash_loaded(void) { return 0; }
+static inline bool kexec_with_frozen_processes(void) { return false; }
 #define kexec_in_progress false
 #endif /* CONFIG_KEXEC_CORE */
 
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index ca2743f9c634..8bc8257ee7ca 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -54,6 +54,11 @@ note_buf_t __percpu *crash_notes;
 /* Flag to indicate we are going to kexec a new kernel */
 bool kexec_in_progress = false;
 
+bool kexec_with_frozen_processes(void)
+{
+	return kexec_in_progress && pm_freezing;
+}
+EXPORT_SYMBOL(kexec_with_frozen_processes);
 
 /* Location of the reserved area for the crash kernel */
 struct resource crashk_res = {

-- 
2.38.1.584.g0f3c55d4c2-goog-b4-0.11.0-dev-696ae
