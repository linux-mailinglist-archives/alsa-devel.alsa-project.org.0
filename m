Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4310F0B96
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:20:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C01D16FE;
	Wed,  6 Nov 2019 02:19:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C01D16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573003236;
	bh=T+vyDZgry1+9ZGI3JmSRYB3QMxlFNLZl0N0RLhWW8P0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJvbl/xLC5IeBNur9xZRQH5MKXGqtFSZqTtLQYYHSmg8lPaJhpjR81tWqnv4xFMSn
	 I9rutAev4VLedSFdG0hUJIrRmi63YqGkOiEkHCuZiqbzzWbTmRVF3ztTIFfQVWl0BB
	 VJMqZDGRFCDATWybWIENFtAOvOentAafzwNRm2b0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2A56F80709;
	Wed,  6 Nov 2019 02:14:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78247F80709; Wed,  6 Nov 2019 02:14:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05BC6F8068A
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05BC6F8068A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="amwUqfMz"
Received: by mail-pg1-x541.google.com with SMTP id e4so15949908pgs.1
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oENrn7iF5Tlx2jdPn2RudelHxpwsKuNEMM5KPm30ynM=;
 b=amwUqfMz7EfzsDNN81sv+gQ/Ylg2UUp4BevyN7Z6fipb4fm2v42Q0wO/d5Tx8js3I3
 03hA5Y5pdEwMd21YK4/UD2yUm9NzjG9ol264zcAlsNtDX8KeeHFegHaOOUusm0viFD26
 UqfOS3HIlqVzJVMSOTzB10OU1tDykxVESDkKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oENrn7iF5Tlx2jdPn2RudelHxpwsKuNEMM5KPm30ynM=;
 b=tkDtGUrTXypblSU94hbRhL/K7d0AaHe/HUONSYoa8OXZQl3GMrrQM6gIR3V2mPN5hM
 k/HxCCAAsqafoWu56+8pRPC0EhZstTkbSimB4EK4G+G1c4R3DbsZfROLBDZ19xuYOwbX
 sFlsEc2w7DxRXbCfujL8bfKa0thCLSuf8bUkO2NwKOXP0D7bDMI0yPKy0P4TYkfX2QIl
 BLexE+MgSvBMutsveCy8N/87HhiqJ6RdNeCu3meqwBDEZOcuse+6f9xhxqvFNIwDBCeR
 fWOZsKtLSQR0Vz4ols9YkO+14CuIfvV/CJLZIQINHkCrUDUbm09+hGXCeR5iTLJLH6aE
 O0tA==
X-Gm-Message-State: APjAAAWzByl981TAIHVdw1oXeRMl+AxaNmM0vokW8qIXs2G8IxVK4hpl
 yhRPNcLtjAQlgKu9oFcEpLZAyz+SuYJF
X-Google-Smtp-Source: APXvYqy7wCRF0DiNesrtpyLR+syRiVtrkKv7bYQCR9RWX0YPRTrEdnOU2UmPxoCCT4MZHFas1LV5gQ==
X-Received: by 2002:a63:d0d:: with SMTP id c13mr39711839pgl.138.1573002849585; 
 Tue, 05 Nov 2019 17:14:09 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id l3sm20116405pff.9.2019.11.05.17.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:14:09 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:34 -0800
Message-Id: <20191106011335.223061-10-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ben Zhang <benzh@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>,
 Steve Winslow <swinslow@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH v3 09/11] ASoC: bdw-rt5677: Turn on MCLK1 for
	DSP via DAPM
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

The RT5677 DSP needs the I2S MCLK1 to run its DSP. Add a dapm route to
SSP0 CODEC IN so the clock is turned on automatically when the DSP is
turned on.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/intel/boards/bdw-rt5677.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index eeb9a11e4e14..b2475e3eff7b 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -75,6 +75,10 @@ static const struct snd_soc_dapm_route bdw_rt5677_map[] = {
 	{"SSP0 CODEC IN", NULL, "AIF1 Capture"},
 	{"AIF1 Playback", NULL, "SSP0 CODEC OUT"},
 	{"DSP Capture", NULL, "DSP Buffer"},
+
+	/* DSP Clock Connections */
+	{ "DSP Buffer", NULL, "SSP0 CODEC IN" },
+	{ "SSP0 CODEC IN", NULL, "DSPTX" },
 };
 
 static const struct snd_kcontrol_new bdw_rt5677_controls[] = {
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
