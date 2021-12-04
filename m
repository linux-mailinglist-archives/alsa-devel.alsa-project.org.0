Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63082468779
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 21:34:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D327C1FF5;
	Sat,  4 Dec 2021 21:33:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D327C1FF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638650043;
	bh=KdY0jnkk1fwNwPoe750do7aN31jd5niKbHMA+pDZnRc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a4iTjsMVZfrnqPs/2MnhjDCzHw8j2Z0hkUVikISSM6T4Uk6sRPKTcOBNANwUUzJo6
	 cBjLi/N4i2Jeh0yWqNGVYH8aWG3yhSm3Btfa2ME2uPv++QXW3YWCTxFcQSFLxDwSr0
	 1JRAjQyKa8VWdWC2XAq8gu1NV26ThniGQ6RXZp6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 288B8F8024C;
	Sat,  4 Dec 2021 21:32:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95411F8023B; Sat,  4 Dec 2021 21:32:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 752D2F80085;
 Sat,  4 Dec 2021 21:32:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 752D2F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qTWmTPzr"
Received: by mail-lf1-x132.google.com with SMTP id u3so15227163lfl.2;
 Sat, 04 Dec 2021 12:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VbnObieNhN4HWcKCIDaKmm9vJMYD6S4kiEivj9DQbno=;
 b=qTWmTPzr5SZINLiFebGd1GKy5SqScFEc8DpbfZiPUh2HEwK+4unFEYZ37E+6TFOx4P
 auJ+RrOHY32Ozud0AmRiv2iIo+FdMdHkt+Ke/jiXg7C+WOuUA3b9+iUHb82EhiD0BnIB
 2xuuBEvbgqFbjqo2SFmNxZX704fMAGRH1zmVNIir+3Yho9Se/MYVhSvF2G5gNTFWNaH+
 ZhjT6KcCNA5mdbV3Fh/E5UU4dabez87RLIBHvyeu0Gt8EhFQux2UnIjRu0NU1rucSHWU
 NeaUxM5k4UxkVWGE+zm6/3zo3N5TZAJPsIlKNxrfJgWDk4shZBYF9IcIkVvW5KLOZ9V1
 FzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VbnObieNhN4HWcKCIDaKmm9vJMYD6S4kiEivj9DQbno=;
 b=xf9Hc0aek0D+if7XJK26PI/wLQoUHGTw2JyPf8nLFukEepC722yKvzZ+lLUpwsgGHJ
 fj+1bZ7yfUo636xESoDkFqK/k4/rwgdeEL65WCjnD9ScDYTmudc9jJGTqFS2ukYYdDFh
 Zf7OePAEvdNH6nBr5xEr0H0Q6erTDoOHZJtw+7NwaBEaXvYpS0dYZZbhS5PvFIcudOls
 d9oIYa9u/1C3wmeC09I6S/zaQGVhEKCDpkXCh8Y/Ul+nncrj/MVNGF8jglDqigRiaZ08
 lUROmuRpX0Sb9AOPKDJsTtFaNZW1ssef1rRi9+2iu6LLEKi7i8yYL51dpTHgtoqOaBPm
 RhrA==
X-Gm-Message-State: AOAM5315KrXzqfBF5LEU1oVI5bwvAbxkZFzh8eHecdJs8Ft1xyxt5Pbb
 FyVItgxa0fuPFdLgqDNUH5yUd3JQ4uqYCQ==
X-Google-Smtp-Source: ABdhPJxer4cUDJ8cf408x7zVsz6ZxrHKFF+7H9r9tcHCQgYBt6n3/uKuWJULjhyVKQLscMciNUdSCw==
X-Received: by 2002:a05:6512:2101:: with SMTP id
 q1mr24570781lfr.663.1638649959603; 
 Sat, 04 Dec 2021 12:32:39 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id s4sm861049lfp.198.2021.12.04.12.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 12:32:38 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: SOF: sof-probes: Constify sof_probe_compr_ops
Date: Sat,  4 Dec 2021 21:32:20 +0100
Message-Id: <20211204203220.54712-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org
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

The only usage of sof_probe_compr_ops is to assign its address to the
cops field in the snd_soc_dai_driver struct (in
sound/soc/sof/intel/hda-dai.c). Make it const to allow the compiler to
put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/sof/sof-probes.c | 2 +-
 sound/soc/sof/sof-probes.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-probes.c b/sound/soc/sof/sof-probes.c
index 5586af9f1a25..c79026cdb8c7 100644
--- a/sound/soc/sof/sof-probes.c
+++ b/sound/soc/sof/sof-probes.c
@@ -321,7 +321,7 @@ static int sof_probe_compr_pointer(struct snd_compr_stream *cstream,
 	return snd_sof_probe_compr_pointer(sdev, cstream, tstamp, dai);
 }
 
-struct snd_soc_cdai_ops sof_probe_compr_ops = {
+const struct snd_soc_cdai_ops sof_probe_compr_ops = {
 	.startup	= sof_probe_compr_startup,
 	.shutdown	= sof_probe_compr_shutdown,
 	.set_params	= sof_probe_compr_set_params,
diff --git a/sound/soc/sof/sof-probes.h b/sound/soc/sof/sof-probes.h
index 35e1dd8d9e03..4a1ed2942d28 100644
--- a/sound/soc/sof/sof-probes.h
+++ b/sound/soc/sof/sof-probes.h
@@ -32,7 +32,7 @@ int sof_ipc_probe_points_add(struct snd_sof_dev *sdev,
 int sof_ipc_probe_points_remove(struct snd_sof_dev *sdev,
 				unsigned int *buffer_id, size_t num_buffer_id);
 
-extern struct snd_soc_cdai_ops sof_probe_compr_ops;
+extern const struct snd_soc_cdai_ops sof_probe_compr_ops;
 extern const struct snd_compress_ops sof_probe_compressed_ops;
 
 #endif
-- 
2.34.1

