Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 669E16C2B4D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 08:24:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C2D41F3;
	Tue, 21 Mar 2023 08:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C2D41F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679383465;
	bh=YPCo0iY5BHXvzXfw7f5/j5QwUDI4VQHsjfqi2FAUzN8=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HMokH6aN4pjL+d9G32imuddkTbDImMnCXbfKSevlR190wr38/O+/iDgYk6/OxjSrZ
	 TE8mxPQVeEFU9V9wIzkH9YOeiGfCLBXpEEe6irCZroPrLJlSPonMnKBBhJkFnkBXYT
	 NrtOc124XT/jpbfExz/F0CABrciRYyP/gPjtPebI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E3CF800C9;
	Tue, 21 Mar 2023 08:23:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34EBDF8027B; Tue, 21 Mar 2023 08:22:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5714F8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 08:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5714F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oeCY7i+z
Received: by mail-wm1-x333.google.com with SMTP id
 t17-20020a05600c451100b003edc906aeeaso294514wmo.1
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Mar 2023 00:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679383306;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqQoaSqzd4syveyvgm4G7Rn0mXIJHXUYufAGCrxktrA=;
        b=oeCY7i+z6JxzlYCCfs8bZIkhq92yhIri7gVEtzK25nvGUePeeCdauLq41Uk295JfR8
         YoSaa7aRicNzdIdDPA8RsVpM18tY6U/jlQxQeSiZV3u1wiIEhtuck9XSZD2NyLkpjNW6
         DnFUt22yCrBb2gO68KvlWeSUh20+SkiqDeio+I85UG18Fkrkrt725wUwB+18gDDo4xIi
         9vEV5PEhd1Ur7apzgSUV4C9szQDiLNrRgmF7Z6N984DkQPbfcLNxPE9raairi81O8ART
         UeOhWNs3sdxEvUkPeWCNcIsLi5Llxb9KKaT+pquWuhCiioI2adpoDws8UmIxQ9EySiLz
         jePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679383306;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqQoaSqzd4syveyvgm4G7Rn0mXIJHXUYufAGCrxktrA=;
        b=k8/Pp19sFAdnne2bmW3XaZBueSKVPyoEVHfM5tS6Ahow3QklVgIJfsl/CQwsPx7MuN
         jvgBqhTchOQaEv0mbva2T7/AmdgzVH1IrrcgFOJ0uBS9Fw/NEYnAFwJN4PhQhKaj7Dqx
         qOXihw8/G9u10+Lfg9z4Kcijw0WG2E55vW/JSTPa00jsAVr6JqtPCvtl6VVVt5bebJHv
         gGtP9dfnPH+33looqXb/Mql4I7SeRntAzkiPgheyzvFKGxGGBXYM0+hfLjG0n/frs6IM
         5g3ezqg3RxJfRKK/Rqt7NfaLhhEVoK5NPfQzMblU6K+ObgyyF79czUgDeJLUH01sd9Sq
         uOCQ==
X-Gm-Message-State: AO0yUKWtpWmswmo67VK6lc0CycXTttwGZrtDc1vGLv1UUdjqJfKzAlTT
	N1C5ogdu62ieHywMA/3V+Mc=
X-Google-Smtp-Source: 
 AK7set/zy6tMVTFrOWJJ+4NDfr8MLCXlE1RlUIRNObj0/DCpPKbTDaBt7+2bw2I9KdKM2ERWF7EvIw==
X-Received: by 2002:a05:600c:2199:b0:3ed:1fa1:9030 with SMTP id
 e25-20020a05600c219900b003ed1fa19030mr1410530wme.29.1679383306175;
        Tue, 21 Mar 2023 00:21:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c440100b003e209186c07sm18338207wmn.19.2023.03.21.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 00:21:45 -0700 (PDT)
Date: Tue, 21 Mar 2023 10:21:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: peter.ujfalusi@linux.intel.com
Subject: [bug report] ASoC: SOF: ipc4-control: Add support for bytes control
 get and put
Message-ID: <4c3570c3-67fe-4b58-baaf-455f69bdfc6b@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: A35TVWZRY4E3UAUO35LLWNSHNXTHP7EZ
X-Message-ID-Hash: A35TVWZRY4E3UAUO35LLWNSHNXTHP7EZ
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A35TVWZRY4E3UAUO35LLWNSHNXTHP7EZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Peter Ujfalusi,

The patch a062c8899fed: "ASoC: SOF: ipc4-control: Add support for
bytes control get and put" from Mar 13, 2023, leads to the following
Smatch static checker warning:

	sound/soc/sof/ipc4-control.c:436 sof_ipc4_widget_kcontrol_setup()
	warn: iterator used outside loop: 'scontrol'

sound/soc/sof/ipc4-control.c
    411 static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
    412 {
    413         struct snd_sof_control *scontrol;
    414         int ret = 0;
    415 
    416         list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
    417                 if (scontrol->comp_id == swidget->comp_id) {
    418                         switch (scontrol->info_type) {
    419                         case SND_SOC_TPLG_CTL_VOLSW:
    420                         case SND_SOC_TPLG_CTL_VOLSW_SX:
    421                         case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
    422                                 ret = sof_ipc4_set_volume_data(sdev, swidget,
    423                                                                scontrol, false);
    424                                 break;
    425                         case SND_SOC_TPLG_CTL_BYTES:
    426                                 ret = sof_ipc4_set_get_bytes_data(sdev, scontrol,
    427                                                                   true, false);
    428                                 break;

This breaks out of the switch statement and not the loop.  So that means
that it will continue through the loop and ret is reset.

    429                         default:
    430                                 break;
    431                         }
    432                 }
    433         }
    434 
    435         if (ret < 0)
--> 436                 dev_err(sdev->dev, "kcontrol %d set up failed for widget %s\n",
    437                         scontrol->comp_id, swidget->widget->name);
                                ^^^^^^^^^^^^^^^^^
"scontrol" cannot be a valid pointer at this stage.  It is always an
offset off the &sdev->kcontrol_list because of the above issue.

    438 
    439         return ret;
    440 }

regards,
dan carpenter
