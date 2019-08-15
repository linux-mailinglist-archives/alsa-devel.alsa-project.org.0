Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F68E3B6
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 06:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19DE91662;
	Thu, 15 Aug 2019 06:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19DE91662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565843883;
	bh=vfyJO7jJwya6qMp5F4HUb51VDLLNsMlHc3iLeR3gFAo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dy7iiS4RT2WCOICe6AaMbWvxYefrfjGKCxTTfvRjRtcPEeA9dhYQcNXyK4i1UsrVL
	 Ff2hnTWsNYV38fSPXrj1AxX7FLyMBzAy5Jg5PyyprE7GNYC0VQ53XZqm+sUW/FpyE5
	 k77aomaA1CyWZOQT/+0SsTnmR9WLoTk43ga0220w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3512EF80273;
	Thu, 15 Aug 2019 06:36:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6806F80274; Thu, 15 Aug 2019 06:36:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14127F801DF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 06:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14127F801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jc3nvB5Z"
Received: by mail-ot1-x344.google.com with SMTP id c34so3355668otb.7
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 21:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gkJ9/4CSZ9hO3Aj7FMNUqCua5NIMc7cNOEioWbqpfI=;
 b=jc3nvB5ZcIMMeb6t6pAdfEPR/JjjJNIg96nvPsRhj4dIOm7MGut0NoL1JUoIPGZHWz
 bYhyQ3L9iEEOlzZiI4mdJl7HjUJfwvarE8hUaWtM5YeVFOOAy7qRQVxgvYNRUEkGCrJS
 ZV6RNLwR9AhVNkq36qN3CyOSMBX0C/6lSrenUS97WZTP8xlH1PxNvBinkZXw7qVqUlf4
 Xzx+roJWChURtCs2yeBDJrVKDlzMavbmR1tOFMzhWNc1BG5wOGSDEqGayFvT5sZuhaf3
 AxDfRh0PJ9SvV3PENcOdcuPouLsEeWM5iRHvvOsIPCVbMz8eQxHIHcxzTtCcTFFvVRk+
 Z2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gkJ9/4CSZ9hO3Aj7FMNUqCua5NIMc7cNOEioWbqpfI=;
 b=KT93NjT8rOoCi2xECBSbC9/Zh6qg7SuG4X3C14mTiAbbmORuP0aKgmpQhppKRsbyuy
 ntajFL2T9xBnsMEkNvLsRvoXAU0I/A46TrNJdkLe+Nsz3l29zJA07dfPngh97A8IS6T3
 5nljVmO4BXNI/DKY5EB0wBIbi2ygAC2FZ3zHwENmGXqR0jLYi7W9xkESOYT31uTH9NvY
 ShEQwogusw1yhgozEtJH3jNo/50yz62vCQ85rQZntT4MzST+TwyLRf+XNd4JHI6Apo+3
 TBuJ51DJo3MfZrlD3AOW7wY9c6jWfpLQfubKA7AASkt3gd2IK49NwhNTPsK3pT2TvkGo
 e4hg==
X-Gm-Message-State: APjAAAUYHpyDreoz5lJ0ZrXNbJhtgaq93HDLz1nwmxCH04Edons6Vv2v
 kjTUoHnT5ElusvNq6HEJVLA=
X-Google-Smtp-Source: APXvYqx6ut8hlUWZSU2LFZIuV11ddpYwSGIcPG/5VDT7er30Sm7CgTv9xqhl75MNKGUVrcRRZZQZ3A==
X-Received: by 2002:a5d:9d43:: with SMTP id k3mr3259887iok.111.1565843771651; 
 Wed, 14 Aug 2019 21:36:11 -0700 (PDT)
Received: from peng.science.purdue.edu (cos-128-210-107-27.science.purdue.edu.
 [128.210.107.27])
 by smtp.googlemail.com with ESMTPSA id x11sm3643219ioh.87.2019.08.14.21.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 21:36:11 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: security@kernel.org
Date: Thu, 15 Aug 2019 00:35:49 -0400
Message-Id: <20190815043554.16623-1-benquike@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Wenwen Wang <wang6495@umn.edu>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hui Peng <benquike@gmail.com>,
 Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH] Fix a stack buffer overflow bug
	check_input_term
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

`check_input_term` recursively calls itself with input
from device side (e.g., uac_input_terminal_descriptor.bCSourceID)
as argument (id). In `check_input_term`, if `check_input_term`
is called with the same `id` argument as the caller, it triggers
endless recursive call, resulting kernel space stack overflow.

This patch fixes the bug by adding a bitmap to `struct mixer_build`
to keep track of the checked ids by `check_input_term` and stop
the execution if some id has been checked (similar to how
parse_audio_unit handles unitid argument).

Reported-by: Hui Peng <benquike@gmail.com>
Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 sound/usb/mixer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ea487378be17..1f6c8213df82 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -68,6 +68,7 @@ struct mixer_build {
 	unsigned char *buffer;
 	unsigned int buflen;
 	DECLARE_BITMAP(unitbitmap, MAX_ID_ELEMS);
+	DECLARE_BITMAP(termbitmap, MAX_ID_ELEMS);
 	struct usb_audio_term oterm;
 	const struct usbmix_name_map *map;
 	const struct usbmix_selector_map *selector_map;
@@ -782,6 +783,8 @@ static int check_input_term(struct mixer_build *state, int id,
 	int err;
 	void *p1;
 
+	if (test_and_set_bit(id, state->termbitmap))
+		return 0;
 	memset(term, 0, sizeof(*term));
 	while ((p1 = find_audio_control_unit(state, id)) != NULL) {
 		unsigned char *hdr = p1;
-- 
2.22.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
