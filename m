Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7A663DAAF
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 17:31:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B85D1700;
	Wed, 30 Nov 2022 17:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B85D1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669825885;
	bh=1Eimjbcycq7qNsawd2rnV+J25oc3+SKoshi04EAzFkY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vqvdcCmsATTwTLr2TgCvtFji6sZim65+kDX7Td713X8LsDQBBKcy1NGys2dq+1p4S
	 4BV6VyPhv0PhRYjRbkXhhOVIfXgxz6Slw1xRDn0KNeziwVYIfE0wL+ilvdaB2E5MtR
	 HtPGkm7+ZXw79VTZKWe6LxvN2zoDHgeOdJLfa2jM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDBC5F80570;
	Wed, 30 Nov 2022 17:29:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C33A8F80567; Wed, 30 Nov 2022 17:29:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FC10F804FF
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 17:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FC10F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="n0aRt/pd"
Received: by mail-ej1-x633.google.com with SMTP id b2so26370375eja.7
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 08:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j66AM6yEw+h2e5Qpe0Paz47YsLXnYSCCs7ToLjEkFbE=;
 b=n0aRt/pdbaNOD5yGncwAgWDPkLo4jlUKxpzjr6sOKj98U8h4lH/BuCf4E3aibhIRBJ
 mgsFuYISxGomjVjanltzfkXr0OmE8zIMPNJVZmWtULUGeuvNnWRKvfo7UYAzQrT/XiKP
 pFNUvT7rXmw2LZ9GHzQ1Ro0ndCmzNOfulp4PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j66AM6yEw+h2e5Qpe0Paz47YsLXnYSCCs7ToLjEkFbE=;
 b=Ei7aK3gJKWd0OI789hDUXmGrsDuFjkPgSqxyfmzeBI83mkprEzIPh1rP953Fl0ZKjL
 6tUHmv2rl7wVY8AOJvaS7TrJKmu9lHK3DKwaQMvX8aHcwjXIxQi0mvqepBHFbz3HhS38
 sHAwaNZ1YRYIQ6JkBPgWDawKd4a9nka1Ryj6e0MVQWL1A6S6vnYpOa1Mj2QMQ51yGGuF
 Mv7I6PbTG4H12t3Rvh2JchLhOPVSx47xXV3cTCmImx4Oqh9omHOzOa1WLfivpbkS3rT3
 b3Iu2dRqyBI1lgcTDadkQM4CW6UmfnGMxELlS4bAJBjLGQz+BqyBBI49kOmzxSFhvJKD
 UFfg==
X-Gm-Message-State: ANoB5pmlDve74izXr3+TQMPOO86baEp+JzV5LZNOAWW9SNBtMRq1dqrv
 u2iNfNSLrPXn/wbot21dAKKlDA==
X-Google-Smtp-Source: AA0mqf5t+AxtPgn9XE9oAuO13iEBvxrVJRUaFve2VxlhVUExpKerWrweeRvgV18uCHkh3j71qtM0WA==
X-Received: by 2002:a17:906:d281:b0:782:7790:f132 with SMTP id
 ay1-20020a170906d28100b007827790f132mr36684458ejb.649.1669825783467; 
 Wed, 30 Nov 2022 08:29:43 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 cz15-20020a0564021caf00b004589da5e5cesm786114edb.41.2022.11.30.08.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 08:29:43 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Nov 2022 17:29:20 +0100
Subject: [PATCH v7 1/2] kexec: Introduce kexec_with_frozen_processes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v7-1-127c582f1ca4@chromium.org>
References: <20221127-snd-freeze-v7-0-127c582f1ca4@chromium.org>
In-Reply-To: <20221127-snd-freeze-v7-0-127c582f1ca4@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Chromeos Kdump <chromeos-kdump@google.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=1Eimjbcycq7qNsawd2rnV+J25oc3+SKoshi04EAzFkY=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjh4Tx9PZMNMSbqgT4Zoi7Sgxh6fRc9tbmVbCyGYlc
 GC5OS5KJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4eE8QAKCRDRN9E+zzrEiGYkD/
 92N9Y4V14IUNRrC8n+NTCv5nr0Wh9MTAk9THEm+4TIUCb3UqoCmq2H9bF+N8XEN7J+RjxcUMQ0l/xe
 eA1eVXygt0w07oYoesMwZ8P7LTlvhN2Jkm9ePDQAcWLVFjgGixsThZokKgDa52sWE+eccR9biUr/Mu
 C4mLr7I+i1qYzVsANymbClIuaNEJPCGeHNqRSGCBOocwyqSWkSZEqHGIifb6LBHiecliMPwC4p36F0
 yAhSh//F1oavhYQ/FQ2LMRG2/JMI6bTknYSGNyH/fTctVslP9foINRXJ3hAChrfxKlytpyG9mDWxfk
 UVN/LaV9JBwmwyJ2qwiqUB+l4s9LYU9QV+lwwOHZX15hcCfmZyB0AtcroP6Z48I6ERTbXa7Ng1Y5jJ
 V2A9QJAeZat9nfEwQsxpJxi1TLPsmQgBcjuTUZaYWxbjymLBC7u+4RWeJDjvSi0m29D8XhOgD+igKV
 aswBMZwtgA6SkzeIY/fP3el9EjPT8GQTYKoK2b//ArUC0pW5UCPiJ1OK4JzJkkF9E6P20/8dvtJk9h
 2hFLnUS8s8iJ7aTazJ2WGGRPmRzzaDaK/YPbNZOiz7fbHWMbEB+spCGEX25Dgajb/qft6Ed3s1Aphi
 Fw++kttBHt8qnh2ZGuWwVaNdTPJY6vGashuAdgbrvcW/Pj/Jis2FalTkK9qA==
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

Cc: stable@vger.kernel.org
Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
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
