Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BB532827D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 16:31:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9666216C6;
	Mon,  1 Mar 2021 16:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9666216C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614612668;
	bh=s5eAdSp1B09yhUEdBs/ahsI6F6KWyhauDVF1CM5bPVs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jvV7GgFWpl12WIz3AfncrZHpQI6s5ZMEjP7qtuFiKCn5Wv8m9pzpVs53srojeJhI6
	 VMcF43EuFrdAZhlpzjtlAR2ZYAghlpVrABswPRClj+f2dkKupq6enY6w8EHrUzu7df
	 H4nYctSr9LARQQz/MGA5jq5E0jy8jTwSj8IWDRTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80298F802E7;
	Mon,  1 Mar 2021 16:28:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90033F8025E; Mon,  1 Mar 2021 16:28:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 913B3F8010B
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 16:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 913B3F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lZSj8lWu"
Received: by mail-wm1-x334.google.com with SMTP id o16so14926026wmh.0
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 07:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s5eAdSp1B09yhUEdBs/ahsI6F6KWyhauDVF1CM5bPVs=;
 b=lZSj8lWupZPmjKesB2gVMPsT+Fdxff8BSI4toG9WdiG4yXYAhE0MIvnuwtmG9kgrCc
 KWbIv8hkaDT85l8gfebMYRhTzbTfgrNE3sh3Y2npInTx2AnG8TMmn53X7CP7U+sbt+f6
 GH0dPDOdK8bSotWXhITcslwhqAT+0APrfH/CpON1M8dCx8CaPWkpSoyJMdF68IQYJkg+
 D+IS8nTchmlUsORCOJBeJp8szZXhUPrQR5+5JScKzpHTrpIkVhOS7rjElknSfO2L/ra9
 kTpoFLjtcu2lYnwkeGUb7fqTGNOb6obiciRlX6CUkbOslWq402U3v9AKIIr+0N/UVwxY
 i8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s5eAdSp1B09yhUEdBs/ahsI6F6KWyhauDVF1CM5bPVs=;
 b=eywppKGp4zOeyzl+2t6LwWsKnR2CDMUOJ01nKFghBoawFuktfoBEUO1oiNiBf508GR
 CnOC0gneQYNqJctpmdDQqlW1XDmBKQeJ/4w5Pcby2SSp3hLWtx83xas3uZlbRPZkPcww
 x2dCitZO2lGrqSsFkUzcYQJqht9uII0bcqCf7956eQ0Yoq6hVHfceQhDGaTuWtH1/C8C
 Kr9UQI5HLAHNg4l/5lbSjSI32NvsU1LWmLU1qviz1xruBI1ruXCwPZhydwn1khykUoNB
 rMuxthlYjRfLO6P0wkFdIrcFHT735qISaGowUVi7BF7QqFShCfndICD6BFCBAO6HGd83
 w2hw==
X-Gm-Message-State: AOAM530MgYeQg0tBTjcC7YJcUcylHqT5qmn+UaeBhvZ+cdT4uctEMTG7
 8pxAx5xAuTmH3z6F6gY+twg=
X-Google-Smtp-Source: ABdhPJzAofPUvvaapMPVVLxcBfWVoh59h5Y5+5YaAcIbjTSxKv/DHHwuq+M/0gW+j6j2XdMjFwfZPQ==
X-Received: by 2002:a1c:65d6:: with SMTP id z205mr16138111wmb.88.1614612498828; 
 Mon, 01 Mar 2021 07:28:18 -0800 (PST)
Received: from localhost.localdomain (176-171-138-112.abo.bbox.fr.
 [176.171.138.112])
 by smtp.googlemail.com with ESMTPSA id c128sm201771wme.3.2021.03.01.07.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 07:28:17 -0800 (PST)
From: Nicolas MURE <nicolas.mure2019@gmail.com>
To: tiwai@suse.de
Subject: [PATCH v2 0/4] ALSA: usb-audio: Add Pioneer DJM-850 support
Date: Mon,  1 Mar 2021 16:27:25 +0100
Message-Id: <20210301152729.18094-1-nicolas.mure2019@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <s5hv9abht6w.wl-tiwai@suse.de>
References: <s5hv9abht6w.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, livvy@base.nu
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

Hello,

I updated the patches to consider the request to split patch #3
(c.f. https://mailman.alsa-project.org/pipermail/alsa-devel/2021-March/181275.html ).

The patch #3 now only contains changes related to DJM-850 support as the
fix it was previously containing was applied in linux 5.12
(c.f. https://mailman.alsa-project.org/pipermail/alsa-devel/2021-March/181279.html ).

The patches should be ready to merge into linux 5.13 .


Thank you :)

Patches list :

[PATCH v2 1/4] ALSA: usb-audio: Add Pioneer DJM-850 to quirks-table
[PATCH v2 2/4] ASLA: usb-audio: Declare Pioneer DJM-850 mixer
[PATCH v2 3/4] ALSA: usb-audio: Configure Pioneer DJM-850 samplerate
[PATCH v2 4/4] ASLA: usb-audio: fix Pioneer DJM-850 control label

