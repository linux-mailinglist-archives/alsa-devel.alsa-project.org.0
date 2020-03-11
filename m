Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD4F181081
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 07:16:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CD26846;
	Wed, 11 Mar 2020 07:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CD26846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583907388;
	bh=QDLDyTPXic3+9x8WuFyWnPrArYTgFychuxvUjipk7Vk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r0Vu8gwnlhKAJnpnTrn2So/m/dEdSEUiR+mYFPQb7AHax5MOeISpds0n0C+s+sc+R
	 SGrJ+hXhTCgl3Mls2u/L2Kt74lGCNpLaTC/2LFiVu3a/O1Yex4BEK2EbRNrC4ACBCp
	 6tChOdt1OXwUb/kDfDU+f3Qtf/RZ8byfGIK8h46g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 348C0F8026F;
	Wed, 11 Mar 2020 07:14:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 518BDF8028C; Wed, 11 Mar 2020 02:09:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC2BCF80217
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 02:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC2BCF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rXZlxFI9"
Received: by mail-wr1-x443.google.com with SMTP id s14so416770wrt.8
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 18:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=00GSpkojnx3B4GB0fFMAKFnU+tANLaiUGZgbkObBjO4=;
 b=rXZlxFI9JSzCtp81Ib7ST1kaLR/Xl1OrJ2z46XZY4sBTtm3lREyA9akpIS9lcjwiML
 VYoYR8hLGI5Z+wOOBt7p7W2aTJ/5M/pBoYe0rKUn5gWv3HYP1PSqQSypbszvwaNvmdCz
 kjTqHgsAfKVBgXFea9cHKcd2aURr8Atn5b94jRSfR4IeSgt6yHXxFVCPCcZVmw1K9fz9
 6PLIlVupVklKgjKMLnCPRmPcB5j/UPiF1BKPcq66GPMWM3UkRkJzNucYPExpORpw+xwM
 miIaPGjeP93ijikHj9Hs7ilF5w2j99rKV3ps+Lp+KmYG9JJjxyFyOcYRjXFKw24fYfoH
 XE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=00GSpkojnx3B4GB0fFMAKFnU+tANLaiUGZgbkObBjO4=;
 b=s0yvLOUZwnlKuRVcGd2aYRQZQmpM8ZCWuiff6DPE0gzs27y83k5kVeQSwPP2OaoUZg
 ZjaGSeT+1RD5jAZojUJWF2EH15cUiAWxcq0UfAeUT4cP/Lt9uMCaz6CPG1qwlzfD/iZ5
 jCSOq1lkBTtuvRntpZZNVauhaq2b6RR5RIZcFoYH7UwPF+cPh6qbi/mMLMWjkslEQJ5J
 U0FVJdj8fz9KMk4HcI9WG3DC0T/P8lVCq7xez8agmS9YNn5L5Ai4jJqCa4nKUr6PK7E3
 n0zmCPEkW3wlBMXT6ccRdiDTRMii59Y3oMNrzOyNprcXYy0ti3s8xu8XgggKuGs8g9ZH
 Bo0g==
X-Gm-Message-State: ANhLgQ1YEzpXuAH6IKdFMLlj+w2mwJsUeC8GO/j7rflcK0IC89zxQP2B
 YKt5cUNt/DEAL/t+uqt2iQ==
X-Google-Smtp-Source: ADFU+vuPZB+qEvJlgMjAKNaONJg23VSoTdeJapUHrDxw8mfccmCzR4CYmGDU2ygM1wMZnnyCmheYRQ==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr720116wru.135.1583888983726;
 Tue, 10 Mar 2020 18:09:43 -0700 (PDT)
Received: from ninjahost.lan (host-2-102-15-144.as13285.net. [2.102.15.144])
 by smtp.googlemail.com with ESMTPSA id i6sm36658097wra.42.2020.03.10.18.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 18:09:43 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: boqun.feng@gmail.com
Subject: [PATCH 8/8] ALSA: firewire-tascam: Add missing annotation for
 tscm_hwdep_read_locked()
Date: Wed, 11 Mar 2020 01:09:08 +0000
Message-Id: <20200311010908.42366-9-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200311010908.42366-1-jbi.octave@gmail.com>
References: <0/8>
 <20200311010908.42366-1-jbi.octave@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Mar 2020 07:14:40 +0100
Cc: "moderated list:FIREWIRE AUDIO DRIVERS and IEC 61883-1/6 PACKET..."
 <alsa-devel@alsa-project.org>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>,
 linux-kernel@vger.kernel.org, Alexios Zavras <alexios.zavras@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, bpf@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

Sparse reports a warning at tscm_hwdep_read_locked()

warning: context imbalance in tscm_hwdep_read_locked() - unexpected unlock

The root cause is the missing annotation at tscm_hwdep_read_locked()
Add the missing __releases(&tscm->lock) annotation

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 sound/firewire/tascam/tascam-hwdep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/firewire/tascam/tascam-hwdep.c b/sound/firewire/tascam/tascam-hwdep.c
index 9801e33e7f2a..6f38335fe10b 100644
--- a/sound/firewire/tascam/tascam-hwdep.c
+++ b/sound/firewire/tascam/tascam-hwdep.c
@@ -17,6 +17,7 @@
 
 static long tscm_hwdep_read_locked(struct snd_tscm *tscm, char __user *buf,
 				   long count, loff_t *offset)
+	__releases(&tscm->lock)
 {
 	struct snd_firewire_event_lock_status event = {
 		.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS,
-- 
2.24.1

