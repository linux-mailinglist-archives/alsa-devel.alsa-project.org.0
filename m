Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92A181080
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 07:16:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 544FE166B;
	Wed, 11 Mar 2020 07:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 544FE166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583907368;
	bh=7yZTlbvNvi45IjGsftSwjLnM8giAagXtQW3thUTN62Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nS1G671Eg42wSzeLvPVbeFeTa07h2AhLlVoZFseDYs6fgoMlX826DNJ1FuItchtfr
	 y1SN8BnQyQt/teJwflwCXTcoUH5chE+s2ex6iJKLjE+lhl+OCbiEPi35tDKn+AuJ2V
	 PuI260jfPBSLuPu98SVkC809OQ1lZxaA/HtnqDAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3DB6F80141;
	Wed, 11 Mar 2020 07:14:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C51DF80217; Wed, 11 Mar 2020 02:09:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4377F80217
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 02:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4377F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="r93FSAoX"
Received: by mail-wm1-x341.google.com with SMTP id m3so303602wmi.0
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 18:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rM3cbsU55xJlyKmK7QwcQylOwbs8Tma9Iu3Kufv/e4E=;
 b=r93FSAoX3d3rZQcJ/3HADdXXtRixoWxZEGpdEuNh0YacpT4Ty8mUDyVxEXd8TyYAtj
 LKVik9H7txixvdX862XIkrjHwM1wrTzq1MWIMARCGXuI1sfYt6D3TbZn9bJcziwFzylW
 QkQ/5WyQTgdqlBkehnSHgYQAWLjnZaHvq/Psc+ZSjzU/FjJxMzNASkz3Wy9d3p8rzVTK
 9OzIcb5VGOsWocOu9tiURVX+ew1NIko8nZChiBDq1v01xXMRPTbl7pkv/o+kflW3Fk9L
 v2kaH0GAh1KA7FtRSKVkqo68xL0Ij7MsGl8w+LDDZSd9znw+IrbTXc/5P6le7RihJVqV
 zA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rM3cbsU55xJlyKmK7QwcQylOwbs8Tma9Iu3Kufv/e4E=;
 b=uKeF5vXVNZUd1q6WEmBDENw/2TlnbDC0/SddX5/o4ziEYGSuiO/8AjbqA22znwrmn3
 XLY1X3xV4YM7XB5Pw86AbbdZDKIti4xym1ca4JK9CoD/YYvOf3I8LyTvp0hIxyUnhyWE
 lkQmpsbWO3UJUr+NqpCRc3TpMjBsvpFlypCkCQJEz7aFOghwtvik7SQ3NUrhe2aMO9MO
 IUGuvUt4eFd54aSY7hFAFlqmol1k9OdNJ1TccRSYEYyxXfXVwlF4XLn/NKp6v/WXctvq
 qeu3Z6/AgsBtSWxXFHQkjN+lceEFDRGRse232v5ttcs1MTz9OSNFJEyBeP91i/3Ff69B
 wjtg==
X-Gm-Message-State: ANhLgQ12HGcSqCz34puim4dab/9BxZw4bbbaFOmPFZnPVAcfDbIqm4Qk
 y3YUBxmhyU8eucSufpRWVw==
X-Google-Smtp-Source: ADFU+vtjoWA4bkISywodXaBjpthXQzuAc5Q6v2tqYQpfmLp+cZN2g+BrSyNtymI7EZ5aVbUmOg6z2Q==
X-Received: by 2002:a05:600c:294a:: with SMTP id
 n10mr433928wmd.11.1583888979445; 
 Tue, 10 Mar 2020 18:09:39 -0700 (PDT)
Received: from ninjahost.lan (host-2-102-15-144.as13285.net. [2.102.15.144])
 by smtp.googlemail.com with ESMTPSA id i6sm36658097wra.42.2020.03.10.18.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 18:09:39 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: boqun.feng@gmail.com
Subject: [PATCH 7/8] ALSA: firewire-tascam: Add missing annotation for
 tscm_hwdep_read_queue()
Date: Wed, 11 Mar 2020 01:09:07 +0000
Message-Id: <20200311010908.42366-8-jbi.octave@gmail.com>
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

Sparse reports a warning at tscm_hwdep_read_queue()

warning: context imbalance in tscm_hwdep_read_queue() - unexpected unlock

The root cause is the missing annotation at tscm_hwdep_read_queue()
Add the missing __releases(&tscm->lock) annotation

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 sound/firewire/tascam/tascam-hwdep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/firewire/tascam/tascam-hwdep.c b/sound/firewire/tascam/tascam-hwdep.c
index c29a97f6f638..9801e33e7f2a 100644
--- a/sound/firewire/tascam/tascam-hwdep.c
+++ b/sound/firewire/tascam/tascam-hwdep.c
@@ -36,6 +36,7 @@ static long tscm_hwdep_read_locked(struct snd_tscm *tscm, char __user *buf,
 
 static long tscm_hwdep_read_queue(struct snd_tscm *tscm, char __user *buf,
 				  long remained, loff_t *offset)
+	__releases(&tscm->lock)
 {
 	char __user *pos = buf;
 	unsigned int type = SNDRV_FIREWIRE_EVENT_TASCAM_CONTROL;
-- 
2.24.1

