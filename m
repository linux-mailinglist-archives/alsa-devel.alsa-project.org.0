Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0D343338
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Mar 2021 16:40:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87C1B829;
	Sun, 21 Mar 2021 16:39:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87C1B829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616341228;
	bh=Wg8/qtCW8C2iuJ7A4ucdwk7+jC8dpzTNwA6OhEgeVKc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MVyfs24tA8tqIq4fA1FWzNVOH4ZIxALDP+Bw2uhSGUhb9gztbSqgo0InnZlJWc2RP
	 MJYLkM5j5gOwSvTKwRV0PJ77ITjmxFdZ+EGipxSWnBWQDm1oowmPYJnNvw+QbJPV6Z
	 DZY/oYUgsmEd3nhgJFzAZWHlFzeLjpppEY+hz1lQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA623F80268;
	Sun, 21 Mar 2021 16:39:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92C1FF80254; Sun, 21 Mar 2021 16:39:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFF90F80118
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 16:38:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF90F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U8oQ/Xu+"
Received: by mail-qv1-xf2b.google.com with SMTP id g8so7521000qvx.1
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0pewC4NLVkrzHJtpkPlyz+hRs/mv7dEXjipPB7HV5Qw=;
 b=U8oQ/Xu+HrCJcE3AErjsrkX/1a7EZaDn8c/OzoFdXzUJcJIDw6VMt3qHLwYnp2MfE2
 i1b2oGARSq055n/rkEAgO81ub62ZdIE4FVbh0hTYdzifETv2u43AfuwyLk7ca0e3cOp0
 RXin7+YqHUhpI6K6c1FUbr5diue6acJJ9espBCFYpAvmE8z2U7hItrAG9HPxKGt95fx3
 YFPMysZkMyzP3MVzyHoVBqMSud6aTm6x0hXSrqPye/WAxsCzheqWxKpn0X12GLDl7EHk
 ZeUV0MvV0oOmtbHGZrecievcq/xis1VS98YUMxAiFnAms9f5aY+WoxHDH3sig5p8Xh4/
 9Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0pewC4NLVkrzHJtpkPlyz+hRs/mv7dEXjipPB7HV5Qw=;
 b=IP5xqeCrTKML/4EkpVjEK4gK8Pw7OUVmWDzK/YoRJtWLBfRFrNbbrbOYPWjQqbPSrj
 POiKzf61IRSgGqWKaBQXawoKi4dtvXW/8dHKQreodzuospYirKP3FF9/ywtfY4FTvRnu
 7pmwPwEeBqjcHh6CuUyoun/O92FQJoKQEZqfM+g2uNgcMeJ0h4lgWa2UHJnULhtDVHrA
 LhxHicYkLt68c/PMrJjGBYIZ0XfPe3lToiKhdhXKPbsKseINxOObyEIF1kTpwT6VtHgE
 uy82rR0ZSdu0KQRTAvyF7DnwTCxW1MVeQjnFK59/gxHIxLXWIXG3lWEKVhhxukbtQ2kU
 OisQ==
X-Gm-Message-State: AOAM531sVepF0Ius8nKT1NvDe3KVVXBqPJs0Eu+ICaoBF5tpXvdsLEor
 08kvSlMyNZtYmGIiuSirlOI=
X-Google-Smtp-Source: ABdhPJzk7eAyvxjVUaT9Olw5L1o7rrI8BwAGtajFX3oov2oK0Rtg/ME9/G4CJpBuViS3V2Ehhs6DyQ==
X-Received: by 2002:a05:6214:945:: with SMTP id
 dn5mr17509531qvb.3.1616341135432; 
 Sun, 21 Mar 2021 08:38:55 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id y19sm8976317qky.111.2021.03.21.08.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 08:38:55 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Tong Zhang <ztong0001@gmail.com>, Jasmin Fazlic <superfassl@gmail.com>,
 Leon Romanovsky <leon@kernel.org>, Romain Perier <romain.perier@gmail.com>,
 Allen Pais <allen.lkml@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>, Tom Rix <trix@redhat.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>
Subject: [PATCH v3 0/3] ALSA: rme9652 don't disable device if not enabled
Date: Sun, 21 Mar 2021 11:38:37 -0400
Message-Id: <20210321153840.378226-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <s5htup4exbl.wl-tiwai@suse.de>
References: <s5htup4exbl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series fixes issues in hdsp and hdspm. The drivers in question want
to disable a device that is not enabled on error path.

v2: add fix to rme9652
v3: change checks to pci_is_enabled()

Tong Zhang (3):
  ALSA: hdsp: don't disable if not enabled
  ALSA: hdspm: don't disable if not enabled
  ALSA: rme9652: don't disable if not enabled

 sound/pci/rme9652/hdsp.c    | 3 ++-
 sound/pci/rme9652/hdspm.c   | 3 ++-
 sound/pci/rme9652/rme9652.c | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.25.1

