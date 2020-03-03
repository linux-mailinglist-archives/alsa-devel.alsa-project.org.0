Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB5177A9C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 16:38:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B59C1670;
	Tue,  3 Mar 2020 16:37:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B59C1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583249893;
	bh=m+g9pFmIaY8Fdv0iu9CettftxZ49JHWwcjrfazECk0U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MHuxxu4Wc3QY5+P9Wb5cnVIzGAX4VApThsdlO8lj04Sv6Q0weRfFr5d0JUmZqtsFn
	 4pmu+D37EwihQCy619ur0QpUsFxNCNtXAqPWpmU0svCUqKpF5Zjf+ZV4V9esYEG1Ft
	 SRw6tiud/GBHq/YCApJLMGI/BZB9AGLne0KnzyuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 314C6F80131;
	Tue,  3 Mar 2020 16:36:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 201B6F80266; Tue,  3 Mar 2020 16:36:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BACFAF80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 16:36:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BACFAF80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L5H461ug"
Received: by mail-wm1-x336.google.com with SMTP id u9so3303160wml.3
 for <alsa-devel@alsa-project.org>; Tue, 03 Mar 2020 07:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aGKNXO2BWgeom0bCH2tYdg6tsQW8HHocMyiO5+IQE7c=;
 b=L5H461ugdYwSFJRxHcuVQMsbpFEnXWBbPxJ1lWWy9eOQXu/bu2Fx03AsSVVgIUFsbB
 S5PY17IO0kwVsMqlFH55Li3ZGS1liY9lgsAKrMSh5i+OXbA3Sdpb3/c4gpos/YZR24g8
 OpT/wzNKWyRgoYAzqtKJEbfLC/LgIdoeYwSeHXBsJ9NJhr4K3yxlF8jF9jESzPV67UnQ
 /PphD+CZ3JnCVn1v+oJK3x2vqxoRcN2WHz/aSeIPNxaIudk5KKnueU/jEjzVq9LSjoXh
 ZHipfECL86aK6bS7nvll+rAilFDV+Xx/ch7U/Clb94afbkQwLKGFsF9CYbrC4LeiQf+7
 OYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aGKNXO2BWgeom0bCH2tYdg6tsQW8HHocMyiO5+IQE7c=;
 b=WQi2TEWA4/v3FFpzn1bnmYRaySgCQHwasR2UOlFZ+mFmutip5ABUneAD9+q7IhW3rR
 qJgI1peI7j6taKtGjzA/rRWftprToWsl1EFYyr0ri8Mn0mqPpyotfvnABMSu3HvWbYHS
 +LIF5NzTFlancdXQL16O8/v5opoWcNk4bNYDRF49z9PRWB/2rNvVE6KxLiJZTT9ycsVS
 gHkq1QfYtVdfCjdn1B73Ac7y0TrD2Gw4FD0qgVbU61lseHt/hZc6YVNIRbYJskrSIVkU
 SOyXlYv3j0vr0k7A7F8H+47A2zAXIS7EO3GqYbpD7xUmAj2HsrQdqQpcxwkYfoT27dVe
 t95w==
X-Gm-Message-State: ANhLgQ0+T1SZxvgYhJoSEN7kC+jwE5Eja2X66zke41b4HBLaTFsFBVa8
 GXlnMtHXLzAEMrxcbl9H4p8=
X-Google-Smtp-Source: ADFU+vs3tiVDakQ0yCrCRUzE8Q0TuKVQPnnaQ3CAWxWSdBWj+/DUQ1YVcM4sYB+2I3K9zqI7SCz2eQ==
X-Received: by 2002:a1c:e206:: with SMTP id z6mr4554361wmg.141.1583249783400; 
 Tue, 03 Mar 2020 07:36:23 -0800 (PST)
Received: from cosmos.lan (84-114-134-91.cable.dynamic.surfer.at.
 [84.114.134.91])
 by smtp.gmail.com with ESMTPSA id n8sm32836331wrm.46.2020.03.03.07.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 07:36:22 -0800 (PST)
From: Christian Lachner <gladiac@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH v2 0/1] Fix silent output on Gigabyte X570 Aorus Master
Date: Tue,  3 Mar 2020 16:36:18 +0100
Message-Id: <20200303153619.24720-1-gladiac@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christian Lachner <gladiac@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

The Gigabyte X570 Aorus Master motherboard with ALC1220 codec
requires a similar workaround for Clevo laptops to enforce the
DAC/mixer connection path. This patch sets up a quirk entry for
that. It was tested by myself on my own hardware for some time
and it works just fine. We should probably rename
ALC1220_FIXUP_CLEVO_P950 at some point as the amount of
non-Clevo hardware needing this workaround is growing.

Christian Lachner (1):
  ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Master

 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)


base-commit: 98d54f81e36ba3bf92172791eba5ca5bd813989b
-- 
2.25.1

