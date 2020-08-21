Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB0424E014
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 20:55:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 373F41689;
	Fri, 21 Aug 2020 20:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 373F41689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036132;
	bh=3acBYzPJQFFIlOET0djmRKFKZh5eY9uTW5a4pNQNb1E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gZdUEYcsxazMkXzGtQZS4YSo0BV5Pd/xIiEcc1+K9+jxfAhEz8ouyz/Zmj5/U23Nq
	 v6vVr+qGRMhhN63jlzXHJnka13xhpDoSLEqgLeqvtxL9mstXsYF6JtaDf0D35WtkKA
	 r+2RfHs5N0/cXJAvp+UM4iOh9Rg9HKIpU7mLXc1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D406F80216;
	Fri, 21 Aug 2020 20:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93F18F80253; Fri, 21 Aug 2020 20:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A0E7F800C0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A0E7F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IHn3Pdrj"
Received: by mail-qt1-x842.google.com with SMTP id w9so1937892qts.6
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6fEk5o+JtGsEMi+t1XipTCOzTB4EYy5u5pAnjhPn+tc=;
 b=IHn3PdrjjkxPkH4x22lOEh8mz7SNlFAtCTdUqXGkJQNcr2zYGRLUIhWPChaEStztrQ
 fC/X4a4IPpXC+NY6PV3e13wwGSXbSutrgBvEH73X2uTEg6Xexsr19AGU9QjZhTNFNv9x
 NdqMYitYDpykv2AWPTiK4bJrpYsjuc4oSaSL9WWNnMA3QzMNEwiRbL44QUpyJpuBnP5d
 xJdHOFyVMWGVxmdu0QhU8ph4AOeofUo9QO2a8SJma2sX6/7ZSpMj1KUYJDrFphbiyCtK
 qD+CYmbFsLahWwV05hIQgi6XNJ+eYkuoJBqWoH2lTf1YqXyOjVnj6GpNSzTI3//xx9tY
 pl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6fEk5o+JtGsEMi+t1XipTCOzTB4EYy5u5pAnjhPn+tc=;
 b=S5EgJWxKkENbw6I2a4dmDN7Tvtao0+EeNrCEh8DeYqWrm33+XDc4HUSv2HAGy3Qd4d
 92ky4zQwe4Taff6h+RvwzHDL3AIqUN6aeQ7uQnsnw/CmacE3xZ0L4txaspJmhxz9HJ8t
 lfBvGVuhObi4l18qkv8/8hIkjNqGhHeZ2J5xekxALAOtiC+rqEv9KCQub+uw6UwitKdL
 jU6zwMXOpZ18aj9Rm7YRatxXB+mtLWYVtlIftVyXHN+2rX+YdG/9XrkMOlq95Ey+hdVn
 O/ei6jlPpm04Xx2YP5bpfekNyT6o0uedd3mfwvcIEjgN6HVhnpWIPcFJHR/iFTF1vPhT
 ZUPQ==
X-Gm-Message-State: AOAM531vQ7sHjpq5FyqlSvFAmdPb5MT4ECD1X0OUU+X8QEKNtoda2aOY
 W2DhWFkCioouNnw0PhaASTo=
X-Google-Smtp-Source: ABdhPJxqidkPRdoAqeh12zWutA108nXj9dr2/WKtZ5kYfsIuy56E6pDiDC5ku6o7yafxKR14Hb7DfA==
X-Received: by 2002:ac8:4117:: with SMTP id q23mr4029550qtl.186.1598036019416; 
 Fri, 21 Aug 2020 11:53:39 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:53:38 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 00/20] ALSA: hda/ca0132 - Add AE-7 support/Control cleanup.
Date: Fri, 21 Aug 2020 14:52:17 -0400
Message-Id: <20200821185239.26133-1-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

This patch series adds support for the Sound Blaster AE-7 along with
adding new controls and cleaning up the old ones. I have personally
tested the Recon3D, Recon3Di, Sound Blaster Z/ZxR, and AE-5 cards to
confirm they work with these patches. Another user has confirmed that
they work on the AE-7.

Connor McAdams (20):
  ALSA: hda/ca0132 - Cleanup ca0132_mmio_init function.
  ALSA: hda/ca0132 - Add speaker tuning initialization commands.
  ALSA: hda/ca0132 - Add surround channel config control.
  ALSA: hda/ca0132 - Add full-range speaker selection controls.
  ALSA: hda/ca0132 - Add bass redirection controls.
  ALSA: hda/ca0132 - Remove surround output selection.
  ALSA: hda/ca0132 - Clean up ca0132_alt_out_select.
  ALSA: hda/ca0132 - Add quirk output selection structures.
  ALSA: hda/ca0132 - Fix Recon3D Center/LFE output.
  ALSA: hda/ca0132 - Add new quirk ID for SoundBlaster AE-7.
  ALSA: hda/ca0132 - Add SoundBlaster AE-7 pincfg.
  ALSA: hda/ca0132 - Set AE-7 bools and select mixer.
  ALSA: hda/ca0132 - Add ca0132_mmio_init data for SoundBlaster AE-7.
  ALSA: hda/ca0132 - Add pre-init function for SoundBlaster AE-7.
  ALSA: hda/ca0132 - Add init data for SoundBlaster AE-7.
  ALSA: hda/ca0132 - Add DSP setup functions for AE-7.
  ALSA: hda/ca0132 - Add output selection for SoundBlaster AE-7.
  ALSA: hda/ca0132 - Add AE-7 microphone selection commands.
  ALSA: hda/ca0132 - Add AE-7 custom controls.
  ALSA: hda/ca0132 - Add AE-7 exit commands.

 sound/pci/hda/patch_ca0132.c | 1794 +++++++++++++++++++++++++++-------
 1 file changed, 1430 insertions(+), 364 deletions(-)

-- 
2.20.1

