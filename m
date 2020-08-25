Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B752521B1
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:12:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA69016A2;
	Tue, 25 Aug 2020 22:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA69016A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386367;
	bh=LGM2koyDrWILjPHsW94Tw5e57FXUhbvtUvQXbCGPlPA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZO/eZPjuuw1kajllkIUF8TLRa8t37LjRXh+sBluiMgZOlAJyDdFSZBvKa0MSr2XMw
	 6VcCYedVKnw72UummzAWRCm4h1p7GtcaXXbsPu/9/dEWlEybKQDmMhSQKkPkflRfLb
	 o+q4hsOTcKZFlhBSZvzEVln4FfwJkPMbD41DlaBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B53F80260;
	Tue, 25 Aug 2020 22:11:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED71BF8025A; Tue, 25 Aug 2020 22:11:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C435F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C435F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z6gxX5XA"
Received: by mail-qk1-x744.google.com with SMTP id p25so12331896qkp.2
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anJ6TO8IF7oTrWX6oY0NrEzQ43dkonEIWniqSuGEw7k=;
 b=Z6gxX5XAKrY7ka/Z1pfQY6IKhNJvCTGLjtwD6vFCE+OMhO+nbMF6yvvogcDOYY9YBR
 tBMvAU2tV0eAviS+VKwmbmdIQ3AsLh+21lnUQdRynUTQL2pJneUvy4qO3eIrhyYfYmaq
 JyfZUqe9f5bzLDpvHYbmk2HF6ywjaAWSYxEoMFXrjOHHINsgG5xfv31tlvWZiOH9SEr4
 pXL/3LuMJgejwbfG+UkJpAMLvKNsvbfeJf46/8Bi2iRWm0oSzcZwnuLrKSMKGNSbmmtj
 348fGan9+a/EIuuPTYLPEJX9TC+nEeqXJHiLIsOrPUv7uO3vmsBNLOpN3UE2Mjyaggyo
 6SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anJ6TO8IF7oTrWX6oY0NrEzQ43dkonEIWniqSuGEw7k=;
 b=Nh/Mm2fu00zkyoVvxhF9PD/mJi5/ksBNKGc1nE39hOLQrNYJEIHErXsIZLdGK822d8
 3/pBHYG5CaEbCgoCWMOPioD3sV6Et+lQeSjKmd1hIiGPfZtnaVtgvMyzO7roaBBeUbCy
 EN8jbwjPi5lO/VcQeVTNwUfEB8Eha/jwGJy8RNcnqQvDAAt2zFWhEhLJHNUx4FuI++EW
 V4Sa1cwuJTc0BJocusaUD1U/evJAVHBErqchkfkACQIK/jazurtiM0ANgZjCaXFK9taK
 0Leanzs5LPdZKPgAAUcBbCCPVqfdJgY0A6ZVlpl1a2EPJFw8rd5Ozp7cQpSJQNxkNug/
 yYGw==
X-Gm-Message-State: AOAM530igSZ90Snr8TZ9KPlaP/gv7BGntvPi1qgcvhGQW8zbn3HHm7gS
 G1Ry/gapxUsNCFR+UXRWBfwhmPtXcf0=
X-Google-Smtp-Source: ABdhPJxyCscw1gPTxYOvCaAOCWN2I2GU+PLFxjx9g7Jmishi7MajeY/cgiqo1v1Sdex0/PAl89qC4g==
X-Received: by 2002:a37:64d7:: with SMTP id
 y206mr10565741qkb.133.1598386258281; 
 Tue, 25 Aug 2020 13:10:58 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:10:57 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 00/20] ALSA: hda/ca0132 - Add AE-7 support/Control cleanup.
Date: Tue, 25 Aug 2020 16:10:19 -0400
Message-Id: <20200825201040.30339-1-conmanx360@gmail.com>
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

---
v2: Change control names to omit unnecessary information.

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

