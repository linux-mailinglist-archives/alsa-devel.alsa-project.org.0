Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B23751249C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 23:37:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97CC382C;
	Wed, 27 Apr 2022 23:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97CC382C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651095427;
	bh=S8aA3w8iCvlP5xuSHPj2CdcrtIpMGO+/5jUXt8Odelg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nl3/mTntiM7EPLxPrs4c2vTsORB/PzpY+/UL4CuBZEMS3Cqj0SkBH3Rfz0GhzkbWE
	 M+LRfrjAPGsFAtJNLqJkLaOlLMBeayv3VGJGP0qQqM2gozcyTmqv5DDbM9VGVZeXJ/
	 a/WVb16AJSOacxJ+ARvxkpeAE5eqOJt7hfHqtCUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05B24F80253;
	Wed, 27 Apr 2022 23:36:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEDE9F8016E; Wed, 27 Apr 2022 23:36:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33590F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 23:36:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33590F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oYrLxV0Y"
Received: by mail-io1-xd2a.google.com with SMTP id z26so4632137iot.8
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S8aA3w8iCvlP5xuSHPj2CdcrtIpMGO+/5jUXt8Odelg=;
 b=oYrLxV0YV3rde7eAUyo1braSxFOs0xHB7P6HFT6VcVOnmqdkPtRilxbv027NKarXpw
 HCD9TvH/weOFRGsEb8boNQCcxFQ23qcJ1Rg464xY5l6ygQ8QVmbWFG8O649cGb46wjRt
 TAukZyeI1sxpITeBci+xdQb5FRiKsSbY1lJWakMFGZp0bK7ZRp5KipsQvkvrFisdaOCz
 F5jMSEYnBv3QyPh/2FKiazckyOwNXowMc32Vjptmjr2vvX78e94JYXW7zaT8jJH1xlUx
 SpbEQR6QGj822Hp33oh7+c2nNOViV/GRzilM3j1xxrg+9b+ZH0fPe1k8ic4jZ1j78ULh
 rOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S8aA3w8iCvlP5xuSHPj2CdcrtIpMGO+/5jUXt8Odelg=;
 b=qII0b3IZfX0iNKFV4u6c9l1LqGlpsVkw/WHeSpK4WHuJESr0wYwuvLyOEFzCgh//4w
 xeoJU+TKELLH9qlQqiipS10evdIEBPvzpTxy2RWoHQDKoJ9NLc3eG3Ur3Vg6n+aC/quZ
 0TqGrJVBqESCCtDxFr5kc2qbtL77JjNbfJ7JgG+SUq99ls/JJfViWsRE0Pt/vZruwDHk
 bHSWJw+ZGxFnfhBLTZefDloTYZJ+jYVEjURocaITETJWM5HgUF21oDsjqc6A7iJfdcWe
 yAzuSnkEOj9gpHXVSlNldOPEt7koVP1NZROnHr4qRIoxYNjQdVgV3sq0bQhV2qdrlGKs
 B5yg==
X-Gm-Message-State: AOAM533PuMuhoJtPq6/o4/m3qbc5cHNtiugp0tX5xvaE9eF/Y/10KXbo
 cSocVuV8+P7Ym4fs18Ybi5Q=
X-Google-Smtp-Source: ABdhPJykQeUgxF3pjE3vRwOxOMRXpRkCuj4hz+vhBi7WOeaK0VBpIC4/s4zsJO1uByLpljhwO6fipQ==
X-Received: by 2002:a05:6638:3e99:b0:32b:2a00:5b2e with SMTP id
 ch25-20020a0566383e9900b0032b2a005b2emr401414jab.112.1651095358836; 
 Wed, 27 Apr 2022 14:35:58 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 y4-20020a92d0c4000000b002cd8a7db5f5sm7396313ila.11.2022.04.27.14.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 14:35:58 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com
Subject: [PATCH v4 2/2] Add generic serial MIDI driver using serial bus API
Date: Wed, 27 Apr 2022 16:35:34 -0500
Message-Id: <20220427213534.163097-1-kaehndan@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <0220425191602.770932-3-kaehndan@gmail.com>
References: <0220425191602.770932-3-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Daniel Kaehn <kaehndan@gmail.com>
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

Just discovered a fairly severe concurrency bug with the MIDI output
in this version of the driver - write_wakeup and output_write
can end in a deadlock with the serial device. Replying here just to
ensure this isn't merged before I send a fix.

Daniel Kaehn
