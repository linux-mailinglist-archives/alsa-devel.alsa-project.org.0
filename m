Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F00F63A45E
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 10:11:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97031169D;
	Mon, 28 Nov 2022 10:10:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97031169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669626701;
	bh=UZTGU/fsXJEA3ltnq4F2WvDw+A4ygx9FH7eOzblo+pg=;
	h=Subject:From:Date:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NDaHsSBaLIRe4sIJ1BZIlxm7kYNbR+pziY+/fhqkvo4GLCBzgniQLns4hqSvUKk2z
	 OUGeK+w/muHLr65tmJ8Eh4t7371R1shmXAorQZeXpuBnYv0TcubRMIVHOXFP7B2N97
	 G2LuKFJPHoA6TY0v6//GmzsZF+KlXeWCaLHKTFxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45F2BF801D8;
	Mon, 28 Nov 2022 10:10:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B636F8027D; Mon, 28 Nov 2022 10:10:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 708D5F800B6
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 10:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 708D5F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="KdYLxwpX"
Received: by mail-ej1-x636.google.com with SMTP id vv4so24124539ejc.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 01:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=5cvqz+ywjjARQOy84/P5RN8vJ8kenww9UeNxB2Tv1zU=;
 b=KdYLxwpXdB8uvJ4n2TshHf2Pu21znKgV7JScKdk87ufOcEbTMcNSjmEMiM31oG2lUt
 jd2mh7eczTri25hzT4q4SqsLkp4ka+0Bayy5j0iiQupXZAVZXMpU9Y1FjunSiuH/X99B
 MroTL0ZZ1orEDi/OJDbO34fcVNaP42LHfhTPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5cvqz+ywjjARQOy84/P5RN8vJ8kenww9UeNxB2Tv1zU=;
 b=xvsOjiAQYlyFvl5SXE5H4MqkdobrfpG7UGpSDtdTkIXNjaHdP1YYzrkB7IUklukIkv
 BhEmpwFwy8WVC/ZP4+RwtVk+JGySTnxz6o40iSF8NL89Vu8ZzomEbJEyJnRJSOsN8EVr
 5cs8XcF87ztVAqPaeUEBPWtK835y4JhtPZnLi9QwfvcHrm0wJ5dl6NK9mZIpxfyJ/tgo
 x6yoSs+7LS9jqFGaWFhc0LYMm5MBAZ6kxqftrVH7+tp5vtVC9BFtPy0yFwa3SPreiGYm
 rJ7uxf7d5pSCwPT9mM2vaeDICnyvDgeTwHRYJdp76dKfRsal2NzONHu0YR9qxY57KKjq
 aNug==
X-Gm-Message-State: ANoB5pkl/lRWg3Lh4m83c8HIO8kFmrAGoGevGa0xZkbOLZBNzL8NHSsX
 vmYgPYQllUNjlvALNq1l70LEJkXEQcKjsw==
X-Google-Smtp-Source: AA0mqf5/x4GVybL0srHWZCJjOvBilSnilg35I/vv/sjhbQI9fuXErANJsBWW13rn9G6s7CcZe0hqRw==
X-Received: by 2002:a17:906:583:b0:78d:9e18:b8f7 with SMTP id
 3-20020a170906058300b0078d9e18b8f7mr40928913ejn.657.1669626636589; 
 Mon, 28 Nov 2022 01:10:36 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 p35-20020a056402502300b00463b9d47e1fsm4932346eda.71.2022.11.28.01.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 01:10:36 -0800 (PST)
Subject: [PATCH v3 0/2] ALSA: core: Fix deadlock when shutdown a frozen
 userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPR6hGMC/3XNQQrCMBAF0KuUrI10Jm1aXXkPcZGmYxNoE0hsQE
 vv7uBSdDX8D+/PJjIlT1mcq00kKj77GDioQyWsM2Ei6UfOAmtEAOxkDqO8J6IXSSCCRiH2CrVgMJ
 hMckgmWMckrPPMpfP5EdPz86AAn+vPrQKylm3XaDBKa7J4sS7Fxa/LMaZJ3Hip4H+NrMfeNNiSOW
 mtvvS+729I71yB6gAAAA==
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 10:10:12 +0100
Message-Id: <20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org>
To: Takashi Iwai <tiwai@suse.com>, Len Brown <len.brown@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=UZTGU/fsXJEA3ltnq4F2WvDw+A4ygx9FH7eOzblo+pg=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjhHr/j1G48WlxdIEEOXaXpHgUksIaanU3PEzs5LxT
 VFYlDcSJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4R6/wAKCRDRN9E+zzrEiDSND/
 9bYOi0gOQKQUB1Ke/4A1WAaxC+iY9PHPZmeRlE3w3S+DePSWJocIg9/hq+TqgAi2pdJaB4aKXJMsRF
 QHXNNgVQuagnDLL8x/aXINyN0DDcRt2XRJUEc7RcKym5rNFVNm+OnKqq4lINr8mzkoEFZQwHbgMllP
 R2/gr6hy0fUAp9ey/+CgymaNMPc3opkp3bExJH8l1uYcjpPEotNZveVmD13BBBNsseRdJqnBoPdbsD
 GatYAsLiPW1ahZVyqy9O+i1uSUYNlhwTqeR3m+ARMQVMnVR3mGeegtwU82B1IS3Hn77KLe5jShtayi
 aEikqMHEoVNjx0MwkvzIwl+DMPlFc0zHo32W2vmqgKojydVa0Jcz1ZXB52bLjmZTnm4d3H1ua+shv9
 5n0BNFpvpcxSFrcIKSWQsdQOplU88nw0qLKQ009fS1wvKk44vv5TkO8faZd5xspqYh7zSI4xmHHzeo
 76Qak6EHRlI8u0P7uLRxBAcOUSGdgwZTlzZxTsHrIHe7aO27Bc46iLHmBT6cYccRIH1w8322jXlOze
 TZVSTQNw7NsgV2PcQBi2xHd+waL6wUyEwDIzHjXzv7jOhL7iuXEpSSz9C87P/yaUdDaCtpPPNYgmpA
 uWZpfP286KbmC0MIgQSFj0eCZ0BnMwVWxScheBjIrE/XViLZ1nZ5d7RB7JmA==
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

Since 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
we wait for userspace to close its fds.

But that will never occur with a frozen userspace (like during kexec()).

Lets detect the frozen userpace and act accordingly.

To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
To: Len Brown <len.brown@intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Cc: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Wrap pm_freezing in a function
- Link to v2: https://lore.kernel.org/r/20221127-snd-freeze-v2-0-d8a425ea9663@chromium.org

Changes in v2:
- Only use pm_freezing if CONFIG_FREEZER 
- Link to v1: https://lore.kernel.org/r/20221127-snd-freeze-v1-0-57461a366ec2@chromium.org

---
Ricardo Ribalda (2):
      freezer: Add processes_frozen()
      ALSA: core: Fix deadlock when shutdown a frozen userspace

 include/linux/freezer.h |  2 ++
 kernel/freezer.c        | 11 +++++++++++
 sound/core/init.c       | 13 +++++++++++++
 3 files changed, 26 insertions(+)
---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-snd-freeze-1ee143228326

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
