Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC64E8356
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 09:39:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B6BB21F6;
	Tue, 29 Oct 2019 09:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B6BB21F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572338351;
	bh=fGzwk6m4oyWhl09BsAo7uq46ql+TNPhYyIwhW3dEe3U=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uxkwy/f76VFcs2uwy0+fBNycilkgBpsB/2LoVIYqAWNNvmynNYunF1VjdkK3w+dIN
	 VPmMo7qlNhca1zhP6ykEzzO2drufcrqC984R9ifGk6PcAgjn/lTcFvMSmqH1Rrqo+t
	 AI9qEF2LbP6h2Wlpm9LYHao19UZnbQ20uo6VtVsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D34F803CF;
	Tue, 29 Oct 2019 09:37:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93C21F80392; Tue, 29 Oct 2019 09:35:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3617F8015A
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 09:35:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3617F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N478fBlO"
Received: by mail-pg1-x542.google.com with SMTP id j22so3003289pgh.3
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 01:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=lf5s6Fz7leqrQMKj0V75R9m9lTLSurFPPz+2KwV5ePI=;
 b=N478fBlO32UC62rsQLpqYQg4ISJscCpnddi7FsAoBSPy9+yzNYdJrPT7MIUkMBikZN
 jrRS23f1wxXWb4MlnpX0rfF6wRl5UtCkmMK7O2afrn9esHONx7RaSn5GiaLYrFoCj0Zf
 b3ZqgIoJcFsu4Fm45xrGvPC/qlQTH3hgOI+I+/FsmNhndFingDZPDSDLSQqpfTTKwoRD
 QoJLpwdwLtj/7/nA+7XzHEp8+W3Rzl0byPBmiCmoW25t5RtxxoIwUd6LTadK4Uflbbmh
 kdqEwvfSyYrnscOPd3dcssaCW/SoQrkRrtKb9673BtUfsGM9c1c2cnjBU85TsdpqVSov
 BcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=lf5s6Fz7leqrQMKj0V75R9m9lTLSurFPPz+2KwV5ePI=;
 b=tq/FoCxECn3/2nmSOcpsRFzY3nEQqKNztnn20GKVZbH8F4fS1f9orH9v3jJcECtxP2
 M0ZKEsVoAptbn6uVW0442rVkAPHU3/oionV3CfUBeFUvF70l6J1Bz/ZlBeFu72bFwJ0i
 AT1ApbdmZWqQl9gQWcRA9YY8miWAq3qBJwMpQ1e/RUIjzd8JQ6hAjLtgh6bSd2IG4tz1
 cHDtk6veh8sn/xN87YxNgfmtrqOVmdzZ5JOL8VFAgUkBoOYNei6D1DmsmqaUKvZG2s21
 v5P8I7/7GPiiXRmF38HHHKY5NWM2r+yg21pB58Jlak9FYewAwnzdnVtE/C4JApqwJltU
 d6iA==
X-Gm-Message-State: APjAAAWO9DVHOSmQvDwbezxgtbGODImWQ1vyueRVmxP6edKANDgWjWgT
 QfIdxp/fAWkjhAZY90Ggfk4=
X-Google-Smtp-Source: APXvYqxHvyzfdMzTQ+OctWZ3zxXIPKkxBy6EqVnmpCrpy6kXaaZ/n0qKELoChdao34GKE6IFxkMnIA==
X-Received: by 2002:a62:3896:: with SMTP id f144mr2610163pfa.254.1572338118506; 
 Tue, 29 Oct 2019 01:35:18 -0700 (PDT)
Received: from saurav ([27.62.167.137])
 by smtp.gmail.com with ESMTPSA id c6sm11830289pfj.59.2019.10.29.01.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 01:35:17 -0700 (PDT)
Date: Tue, 29 Oct 2019 14:05:11 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: perex@perex.cz, tiwai@suse.com, rfontana@redhat.com,
 saurav.girepunje@gmail.com, gregkh@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Message-ID: <20191029083509.GA8293@saurav>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 29 Oct 2019 09:37:26 +0100
Cc: saurav.girepunje@hotmail.com
Subject: [alsa-devel] [PATCH] usb: clock.c : usb true/false for bool return
	type
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

Use true/false for bool type return in uac_clock_source_is_valid().

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 sound/usb/clock.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 6b8c14f9b5d4..8b8ab83fac0d 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -165,21 +165,21 @@ static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
 			snd_usb_find_clock_source_v3(chip->ctrl_intf, source_id);
 
 		if (!cs_desc)
-			return 0;
+			return false;
 		bmControls = le32_to_cpu(cs_desc->bmControls);
 	} else { /* UAC_VERSION_1/2 */
 		struct uac_clock_source_descriptor *cs_desc =
 			snd_usb_find_clock_source(chip->ctrl_intf, source_id);
 
 		if (!cs_desc)
-			return 0;
+			return false;
 		bmControls = cs_desc->bmControls;
 	}
 
 	/* If a clock source can't tell us whether it's valid, we assume it is */
 	if (!uac_v2v3_control_is_readable(bmControls,
 				      UAC2_CS_CONTROL_CLOCK_VALID))
-		return 1;
+		return true;
 
 	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), UAC2_CS_CUR,
 			      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_IN,
@@ -191,10 +191,10 @@ static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
 		dev_warn(&dev->dev,
 			 "%s(): cannot get clock validity for id %d\n",
 			   __func__, source_id);
-		return 0;
+		return false;
 	}
 
-	return !!data;
+	return !!data ? true :  false;
 }
 
 static int __uac_clock_find_source(struct snd_usb_audio *chip, int entity_id,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
