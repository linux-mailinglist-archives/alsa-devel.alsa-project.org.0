Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDE41EBCDC
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 15:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C86A1674;
	Tue,  2 Jun 2020 15:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C86A1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591103789;
	bh=9KxOLlluPq4qhlOeAcber6SPypPP6AjBrJQ46LKI+nQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKdI7EqNfAblYLyabPNVZ2gc2RGPZTJSGF05rqDnEMvXGVLKnRsHRh6LPDq88bKPF
	 oFMay7EtpPeZLL0j8Z9j2cUFO7wvu9swSnQ/XMZixf3GAw8/KWQL0aKcMul+Bebzta
	 16kaYJGZ/k3vUqbW7xLzkPfmH30PdQt2VvT1wwM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3D11F802E0;
	Tue,  2 Jun 2020 15:10:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F73F8026F; Tue,  2 Jun 2020 07:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D668F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 07:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D668F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kdnedtkU"
Received: by mail-pj1-x1041.google.com with SMTP id m2so892891pjv.2
 for <alsa-devel@alsa-project.org>; Mon, 01 Jun 2020 22:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SxRa6VcY2LMBz3zcWZQ3W5R2LRvt5t09mwNFn3RdLfA=;
 b=kdnedtkUWGH0EgiiSkOM6lz6ez0QnNlc8zFGS7E1FXfVPHfLGSWGwMOnK4MTDMgets
 49gpArFoPZY7hatliqTT9EBVVETbW/eUQgLO/MxWMlqiG1otNOmKV8PkRGZ5kbBjNKCt
 kYU+8WfieLU8FeTewg7zVMqcqqjl/d+eisprHQAveG+vgAhTZgONgmVeFXZwrBFdwQi0
 iVhvgadIyJGh9PVswSu+cJOMvzUKESCQJhXKEUvfc9/fx/+eIuWpoNXrrYqcj/Ph0MT4
 +C+zrdrcExdLdysSWFXC+ikhjahhSGBLqXVJmdMuhH7+MA8bQGZYmdWxfq6WSCYyd6Jb
 eLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SxRa6VcY2LMBz3zcWZQ3W5R2LRvt5t09mwNFn3RdLfA=;
 b=KtNSd0T8O1/hTWS/Y91Ys/hcs/2pcOMo3ns6Ns8B4fhCHroUli0AYZw0p7wjwDphEB
 x88d+sJnjUY9uWZP53YtKD91fBHP8NKSQdBDfDJ4baNwJSGnizpqKGe4mHG+7bHWeGgl
 K1EPnlyArpwEYAKtyxYLvHxWS4Pmqhv/uH2Uzx4dZkbePtYLEz31woKBZsbFJiZ06Lm+
 8WfBgpUuV4qEd1lPPCeBch7A/uzrHVUs5F6DZ7/WmasXlsHTFoQMq02INLlDq/c4iQXy
 VCE1egL9udW/7UVVIITZ+2r25Em76r6J2EK0P8wzxMQ3oYP1iOlWoQsGof1LR0fmnBob
 m/VQ==
X-Gm-Message-State: AOAM532aTYSF5ogSvZ9N6gNzqK+HVHW6spYaNhKSappJtZIcNhMdQ50R
 kBPNxdbsZfQlOyj77VbSzS5kuS67er6KKnF6
X-Google-Smtp-Source: ABdhPJyvOPpNZ5sQza/sxtxZPtqR21/AwrWkuze4ajZeTe84L9t4Y1EK8depRG0U3GJcQvnI7YurYg==
X-Received: by 2002:a17:90a:32ee:: with SMTP id
 l101mr3564174pjb.213.1591075362317; 
 Mon, 01 Jun 2020 22:22:42 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id f18sm1004764pga.75.2020.06.01.22.22.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 22:22:41 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [RESEND PATCH v1 6/6] staging: greybus: audio: Enable GB codec,
 audio module compilation.
Date: Tue,  2 Jun 2020 10:51:15 +0530
Message-Id: <77cfc355b87ee21636430f787764700de1983f38.1591040859.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591040859.git.vaibhav.sr@gmail.com>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 Jun 2020 15:10:44 +0200
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
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

Currently, GB codec and audio module is conditionally compiled based on
GREYBUS_AUDIO_MSM8994. However, audio module is not dependent on MSM8994
platform and can be used generically with any platform that follows
GB Audio class specification.

Also, GB codec driver corresponds to dummy codec represented by I2S port
available on Toshiba AP Bridge. Added config option for the same in
kconfig file and accordingly updated Makefile.

Signed-off-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>
---
 drivers/staging/greybus/Kconfig  | 14 +++++++++++++-
 drivers/staging/greybus/Makefile |  4 ++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index d4777f5a8b90..cbcfcbba239b 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -3,7 +3,7 @@ if GREYBUS
 
 config GREYBUS_AUDIO
 	tristate "Greybus Audio Class driver"
-	depends on SOUND
+	depends on SOUND && SND_SOC
 	---help---
 	  Select this option if you have a device that follows the
 	  Greybus Audio Class specification.
@@ -11,6 +11,18 @@ config GREYBUS_AUDIO
 	  To compile this code as a module, chose M here: the module
 	  will be called gb-audio.ko
 
+config GREYBUS_AUDIO_APB_CODEC
+	tristate "Greybus APBridge Audio codec driver"
+	depends on SND_SOC && GREYBUS_AUDIO
+	help
+	  Select this option if you have a Toshiba APB device that has I2S
+          ports and acts as a Greybus "Dummy codec". This device is a
+          bridge from an APB-I2S port to a Unipro network.
+
+	  To compile this code as a module, chose M here: the module
+	  will be called gb-audio-codec.ko
+
+
 config GREYBUS_BOOTROM
 	tristate "Greybus Bootrom Class driver"
 	---help---
diff --git a/drivers/staging/greybus/Makefile b/drivers/staging/greybus/Makefile
index 3b4b6cabff19..7c5e89622334 100644
--- a/drivers/staging/greybus/Makefile
+++ b/drivers/staging/greybus/Makefile
@@ -40,8 +40,8 @@ gb-audio-manager-y	:= audio_manager.o audio_manager_module.o
 #ccflags-y += -DGB_AUDIO_MANAGER_SYSFS
 #endif
 
-obj-$(CONFIG_GREYBUS_AUDIO_MSM8994)	+= gb-audio-codec.o
-obj-$(CONFIG_GREYBUS_AUDIO_MSM8994)	+= gb-audio-module.o
+obj-$(CONFIG_GREYBUS_AUDIO_APB_CODEC)  	+= gb-audio-codec.o
+obj-$(CONFIG_GREYBUS_AUDIO_APB_CODEC)	+= gb-audio-module.o
 obj-$(CONFIG_GREYBUS_AUDIO)		+= gb-audio-gb.o
 obj-$(CONFIG_GREYBUS_AUDIO)		+= gb-audio-apbridgea.o
 obj-$(CONFIG_GREYBUS_AUDIO)		+= gb-audio-manager.o
-- 
2.26.2

