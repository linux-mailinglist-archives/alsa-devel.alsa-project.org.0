Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29043F98AF
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 19:33:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 926B1165E;
	Tue, 12 Nov 2019 19:32:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 926B1165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573583590;
	bh=HU24Jfiwh+UVbAXfDpLZTt2PVL3eR1ZJmuyzcVcZIWY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y6i2jbO1C2Zd3mbBH+wumFFPeujMvVSYfUICQtQtxyvmsq5et0IROWtyjioOaTyoR
	 R/7dmCCw/VMhwWqlI4uPZZeW+/OzIKA5JsPyntQi16zR/3v8REUHOL7YOXEqPZosBz
	 NbqcOekC+ltZeLvrbC9osNaNOCwfOPobiDBd95MA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D732EF8044C;
	Tue, 12 Nov 2019 19:31:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18092F806F0; Tue, 12 Nov 2019 18:17:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15EE7F805FC
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 18:17:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15EE7F805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="J0RswMfv"
Received: by mail-pg1-x543.google.com with SMTP id h4so12261880pgv.8
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 09:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BY2Sx9ycP7suPutbppdg5ksZUAM56wjTk+wkOIX8bxA=;
 b=J0RswMfv3hSYMIY4PupyeNnJOXTmOF/hflLEhM63BB4SxANPvZMllCXwqDmtKwfh2O
 Nv98XUlfJmZtwniy5LMmt7n0dL9CLu/Z0Lrq8ttC2JMwKnxRGv/sgTDd2XbDwnFf/rFN
 BlXsVrC4QoI5gKd4jon3L0PEYiY/BEeMihelw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BY2Sx9ycP7suPutbppdg5ksZUAM56wjTk+wkOIX8bxA=;
 b=VQSoKtEzNEcRIprrB+u2d50SPI/hMSH+fdD/Y1E9DbEhS278KOupT+XVY7KtM+/pUU
 0fquswxAXCg3vroUIpTFdIUKswMKADHl50HRfJQv52vX++YrpL8xI6HKZN7PjCRIKW/C
 jgQ02l93qLlxocHvrigz89vhycAIkyKoow4QO6ZnDq2TiljpMf8sJSoy/+pSK86BHhDy
 7GusCMfryLtIfQ8y0zRzSWT1OsZyaC0nbti+icqxqtn5W/AJ5yVhznoVFuO4eZJgSluZ
 AM0USFUTC6vTwqm/VTRobfvV1MIhJss/F7TuHerrieT+AkAt90dxmhk+RWTA6btCwMYW
 HG2Q==
X-Gm-Message-State: APjAAAXHjFBFZFAN8KiVkJP04QaqIEYbFnCmcP6sg/zgTLX1eu6x2ayK
 V2FWJwPKjNhm9p6KNfgIAaz3wA==
X-Google-Smtp-Source: APXvYqwsFUEGHYnOEtTfEDmiH6CoWp6u32EsFAXEL2oDavPytkste0r9mjvK96qhQR5sO4eKKy4mDg==
X-Received: by 2002:a17:90b:d85:: with SMTP id bg5mr8211033pjb.5.1573579040053; 
 Tue, 12 Nov 2019 09:17:20 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:521e:3469:803b:9ad6])
 by smtp.gmail.com with ESMTPSA id d22sm2432660pjd.2.2019.11.12.09.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2019 09:17:19 -0800 (PST)
From: paulhsia <paulhsia@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 13 Nov 2019 01:17:13 +0800
Message-Id: <20191112171715.128727-1-paulhsia@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Nov 2019 19:31:23 +0100
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 paulhsia <paulhsia@chromium.org>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH 0/2] ALSA: pcm: Fix race condition in runtime
	access
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

Since
- snd_pcm_detach_substream sets runtime to null without stream lock and
- snd_pcm_period_elapsed checks the nullity of the runtime outside of
  stream lock.

This will trigger null memory access in snd_pcm_running() call in
snd_pcm_period_elapsed.

paulhsia (2):
  ALSA: pcm: Fix stream lock usage in snd_pcm_period_elapsed()
  ALSA: pcm: Use stream lock in snd_pcm_detach_substream()

 sound/core/pcm.c     | 8 +++++++-
 sound/core/pcm_lib.c | 8 ++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
