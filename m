Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DA1461C15
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:47:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 370EF1F23;
	Mon, 29 Nov 2021 17:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 370EF1F23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638204424;
	bh=yO1u/PRU9OVYfASovannxYd+Z1v+fw1Cxg2rsPPqkxY=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=asLpvnnZNDm+krqf3/IjiJnEkj8/edM3cYOeC+BUT+yl601eeQGBmWPcZq8DWIY5i
	 kSIem6NtaEERKoGBvCUNKkP9+864wrBEZRL+zUBVLZ69wexkmu92MBF9s357Yu4DKP
	 i+g8XNSg+lNlRBQiz9sk1hoRWrU9uSFV1Rm56F2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C789FF804E6;
	Mon, 29 Nov 2021 17:44:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99FF7F8028D; Sun, 28 Nov 2021 15:32:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11E97F80149
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 15:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E97F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name
 header.b="QPA0L+9n"
Received: by mail-wm1-x330.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso14708440wms.3
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 06:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chrisdown.name; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=ItTd/4w+dybTRXGG7gej3HA5Fv4/5+j9oxFEaLUf0MU=;
 b=QPA0L+9nGKCnrPxnK6Ml62LUNwSpbInWGuj56wwxNoY4wg1qI3LCeEVYz1zBizJV9g
 BgIfzKDJazbNFOuv2agk2jN73wBJ1owwxyu8N6XnE3pqRb77eJr9LVvFuNaE6kz97DND
 wn2xrNmlMBaCSROaVgFGPxmJvY57UvsVkOGiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ItTd/4w+dybTRXGG7gej3HA5Fv4/5+j9oxFEaLUf0MU=;
 b=qvIjZpwRefKyperqCESpDmlvNzOHr9Bswb6m1b8hZ9Yfc5bHcf1DSjDQTKjMCyZ5XJ
 XZskkIEkIMjMFhX4nnAr7ePR+iU5TNqo12Jgo5TGqeLELv7Tfes7gEVmT0+V4o7WKDt1
 Ho0UCQ4BCK7EFAZnFj7IpBrLoja3XaHxsU57HSDw0Q0r5DY+PCaMRbiC/I7NaOVS772P
 Rb/tx/s1I6FFfrQnbgqqvBOiIeiSLNbS4lPAh4p51iuLfzendT8mZ7YMYhoalgD1qjFm
 sraTZoN8xVC3HlIDWw2j0FCpijho3/zGyyXAdlDu3Hip1xQwvJUl3Zd+c6SFBRER7EZ3
 nivQ==
X-Gm-Message-State: AOAM5304STeaVKdLvH6n9UmfVMdLhcKQQ0lebYn/7tnboXGSNlUF40sM
 wrssIjPqjXStbqOSNmdb0750ax7BurNxMsEjlnI=
X-Google-Smtp-Source: ABdhPJz/0jrGatDLnn0anKT7I/wUu4Fvf0MXRczf4mDLScmDq+lNsP1bLh6EP7kkZo2RmaNsPU3tkA==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr29305671wmg.86.1638109907835; 
 Sun, 28 Nov 2021 06:31:47 -0800 (PST)
Received: from localhost ([2a01:4b00:8432:8a00:5ee4:2aff:fe50:f48d])
 by smtp.gmail.com with ESMTPSA id b13sm7523154wrh.32.2021.11.28.06.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 06:31:47 -0800 (PST)
Date: Sun, 28 Nov 2021 14:31:46 +0000
From: Chris Down <chris@chrisdown.name>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: hda_dsp_common: don't multiline PCM topology
 warning
Message-ID: <YaOS0sBueAfApwOx@chrisdown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
X-Mailman-Approved-At: Mon, 29 Nov 2021 17:44:54 +0100
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On my T14s Gen2 I saw the following:

    [   16.057258] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3

    [   16.057261] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 4

    [   16.057263] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 5

    [...and so on.]

It looks like the double newline is a mistake, so remove one.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 sound/soc/intel/boards/hda_dsp_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
index efdc4bc4bb1f..5c31ddc0884a 100644
--- a/sound/soc/intel/boards/hda_dsp_common.c
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -68,7 +68,7 @@ int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
 			hpcm->pcm = NULL;
 			hpcm->device = SNDRV_PCM_INVALID_DEVICE;
 			dev_warn(card->dev,
-				 "%s: no PCM in topology for HDMI converter %d\n\n",
+				 "%s: no PCM in topology for HDMI converter %d\n",
 				 __func__, i);
 		}
 		i++;
-- 
2.34.1

