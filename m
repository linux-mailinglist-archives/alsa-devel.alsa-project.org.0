Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0C07B3EE2
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 09:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A14DAE72;
	Sat, 30 Sep 2023 09:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A14DAE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696060473;
	bh=UwQWIh9SOaYteIOPVSkDxn6jTGF3KGJHmr91uS/4MeE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sGQXRQBshd7ewiC+2ClZlCeHVPwBl7QFOKc6imW4dV4ZI6lQSh/1s9Z9e9hBjBGg2
	 YdoQeO+1yEjmQZySBXlcSn7FF4cMcuRdA2+Rcu4cI9MbQVkNCVZYEE483zKrOqTbKh
	 d17aV3+eq+vQEvu6OpKK7Ru9GJOHoXj45TsyIp7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC030F805A1; Sat, 30 Sep 2023 09:52:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 800E1F80580;
	Sat, 30 Sep 2023 09:52:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2BC4F801F5; Sat, 23 Sep 2023 11:12:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by alsa1.perex.cz (Postfix) with ESMTP id D9125F80124;
	Sat, 23 Sep 2023 11:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9125F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=GnLHGbsO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ZUc8rH3JH24hVz72L8
	JLGGyF3jsgN3UUrwoBzdxOYYU=; b=GnLHGbsO5jBxAcTI2j/nQYDX+XUV0sJgnr
	zYPehDskxe4z3xY+brbLfQjJNAeQtbcAjYahFe6HTcJW4/0J9yu/DPIi+1ujqmyb
	ljkJ4uQKmnOgLrsOdo2Do9Nq/yI5Ry8RcfNi/9UtoZpCuYXpKSqJuY+nU/ATcxxv
	Cu74ej9Fo=
Received: from localhost.localdomain (unknown [223.104.131.178])
	by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id
 _____wAXQADzqw5lGKWdAg--.46891S2;
	Sat, 23 Sep 2023 17:12:20 +0800 (CST)
From: liuhaoran <liuhaoran14@163.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org,
	liuhaoran <liuhaoran14@163.com>
Subject: [PATCH] ASoC: SOF: Intel: Add error handling in hda_dsp_trace_release
Date: Sat, 23 Sep 2023 17:12:16 +0800
Message-Id: <20230923091216.26325-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wAXQADzqw5lGKWdAg--.46891S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKryfWr17ury5Jr13Cw1kAFb_yoWDCFbEyw
	4I93yrWFyqkrZ5tr1Ykr9ay39xWrs2gFykA3WUtF9rG34UA3ykC3WDXrsrWrWDWryfX3W8
	Gr9Fg348Aa4fXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjasj7UUUUU==
X-Originating-IP: [223.104.131.178]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiThXzgmNh-Pwp-gAAs-
X-MailFrom: liuhaoran14@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XEHAQSEYH4Z4FROXQAUHSKTF4EXVC5JO
X-Message-ID-Hash: XEHAQSEYH4Z4FROXQAUHSKTF4EXVC5JO
X-Mailman-Approved-At: Sat, 30 Sep 2023 07:52:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XEHAQSEYH4Z4FROXQAUHSKTF4EXVC5JO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds error-handling for the hda_dsp_stream_put() inside
the hda_dsp_trace_release function in the hda-trace.c file.

Signed-off-by: liuhaoran <liuhaoran14@163.com>
---
 sound/soc/sof/intel/hda-trace.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
index cbb9bd7770e6..5dcd43b9cbe4 100644
--- a/sound/soc/sof/intel/hda-trace.c
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -73,13 +73,22 @@ int hda_dsp_trace_release(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_stream *hstream;
+	int ret;
 
 	if (hda->dtrace_stream) {
 		hstream = &hda->dtrace_stream->hstream;
-		hda_dsp_stream_put(sdev,
+		ret = hda_dsp_stream_put(sdev,
 				   SNDRV_PCM_STREAM_CAPTURE,
 				   hstream->stream_tag);
+
 		hda->dtrace_stream = NULL;
+
+		if (ret < 0) {
+			dev_dbg(sdev->dev,
+				"stream put failed: %d\n", ret);
+			return ret;
+		}
+
 		return 0;
 	}
 
-- 
2.17.1

