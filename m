Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CC84D20D9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:01:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B5A1878;
	Tue,  8 Mar 2022 20:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B5A1878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646766093;
	bh=l8BprZhCcY0+1FGTt1yYzXDD/HdN7Q07+i4mMB1L//E=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TGWcTzq8Y965HiwePXyOYLcFSjpdzYjCHilWcj1IFGqvLN77MShamSTBnUotWaYZI
	 73UOiTEkD0eCvlO42wEjsaRMgT9m5s9iqPzT6qeOEBYr1FTYUSqI07YwpVjS8EuUDG
	 sIzdI9sgg1AaWMhiSBmvUpO9+LgTQwAGgZalE8qA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB5F2F80121;
	Tue,  8 Mar 2022 20:00:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 211B6F80121; Tue,  8 Mar 2022 20:00:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96764F80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96764F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e9JIQtEI"
Received: by mail-wr1-x430.google.com with SMTP id x15so30009820wru.13
 for <alsa-devel@alsa-project.org>; Tue, 08 Mar 2022 11:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=BrK7bDjpNNfbNfWHDDgIDYJgMsjhI5oc67ZcgDStByU=;
 b=e9JIQtEI5R4Pw82Q7GiVcSHmHvhDspmi4O1tsaetcGCtBaN9BUMuTL0z538e8pqnl9
 hje6B0n35FNnVNbO8c1yQ/4qJntF4bC6QPq+y07wI7/owtgOXtdhcdXqpz/T5Qle1Mbv
 0WBI/UkQhynUHbLKCECq/xsmRsGpJGrX2nS0/hnc4RJ+8ipn+cwTL9kd5x1mONvAg5SI
 5oOozD4a2Cm1XEswO+kYbOJM+XI/p52kx3DI4fAbepQpzqUy3GMMSSbaozBW833ia7+e
 mOSWmQhSdija5mSXTYwI6S+p1T7+iU3ZwyH7L9r23RVBkprBehPkNuMRzDAzPlhQJYeV
 trDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=BrK7bDjpNNfbNfWHDDgIDYJgMsjhI5oc67ZcgDStByU=;
 b=Vg0/wlujGHyYeu0LDQyE4CF4dBJUt0h4HOPB/k8gopmLr0wFnqF7bYiUH61C89FUfT
 4WO3aiO9R0UND8B8OKi7lyTB73fjG0t8NU+1WJZZ0PnvyRpjB+lHpTCtDDxwGLMdvv9Q
 otBZMqjVOa5aXoYOkb3MuBNhPTPEtlaRzmUbwCiDwYQCkh/EOzlm3WspTdJFUWb+2LHz
 q7IsIq+KjX60Ue7rFL/2zTv320Ira6JEDszCgKrFbJV1uVWiU0L1/Cu6t3OnMJdy0RyB
 gKz6xioCo1vDIyEQXsQrpeuJUiFF1uRYSxFAFe2/t5dhunid0AP+lArEbEhBnYbsqzqr
 SZBg==
X-Gm-Message-State: AOAM5333we8de35ThH+q8gKp7/snJRQ+wWdblTDzOVZOrXn2yGix19Yc
 6MbdSHKMYU3sqhXm2nXlJc4=
X-Google-Smtp-Source: ABdhPJyG5uJSpcng8hHCapbm6cigma4b5tpf8v55ugHdYhR+9V6enUL/sDZaOk/SQs3ypuqYOBp1KQ==
X-Received: by 2002:adf:dc91:0:b0:1f0:728c:8faf with SMTP id
 r17-20020adfdc91000000b001f0728c8fafmr13673390wrj.287.1646766020389; 
 Tue, 08 Mar 2022 11:00:20 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b54:500:3175:f9ac:af86:a778?
 (dynamic-2a01-0c22-7b54-0500-3175-f9ac-af86-a778.c22.pool.telefonica.de.
 [2a01:c22:7b54:500:3175:f9ac:af86:a778])
 by smtp.googlemail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm3516970wmb.1.2022.03.08.11.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:00:19 -0800 (PST)
Message-ID: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
Date: Tue, 8 Mar 2022 20:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] ASoC: meson: aiu: fix duplicate debugfs directory error
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alsa-devel@alsa-project.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On a S905W-based system I get the following error:
debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!

Turned out that multiple components having the same name triggers this
error in soc_init_component_debugfs(). With the patch the error is
gone and that's the debugfs entries.

/sys/kernel/debug/asoc/P230-Q200/aiu_acodec:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/aiu_hdmi:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/aiu_cpu:c1105400.audio-controller

Because debugfs is affected only, this may not be something for stable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 sound/soc/meson/aiu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index d299a70db..c1a2aea5f 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -68,6 +68,20 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 
 	*dai_name = dai->driver->name;
 
+	switch (component_id) {
+	case AIU_CPU:
+		component->debugfs_prefix = "aiu_cpu";
+		break;
+	case AIU_HDMI:
+		component->debugfs_prefix = "aiu_hdmi";
+		break;
+	case AIU_ACODEC:
+		component->debugfs_prefix = "aiu_acodec";
+		break;
+	default:
+		break;
+	}
+
 	return 0;
 }
 
-- 
2.35.1

