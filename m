Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1500E482554
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Dec 2021 18:16:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B592D16DC;
	Fri, 31 Dec 2021 18:15:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B592D16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640970980;
	bh=bOr24XUKx7Xg1yhjS4GeJyWnKxXcg9xgu3bfUNV++R8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WKwVF8c4Npabk8JU+ovCllgmIdTEK1FJeGfw/xf9GLSyu9H1/nDZQqsTnmRNWDy55
	 TvBh0h04u7rPQfaecLPYhIIR8SxynZgS8l8gownigqIHK0dU2h18CRct/iY9YPgBHj
	 DKYgdlnxLrp57+U/xmkgwzuNkhQpTveUZHanYn2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54FE8F8012E;
	Fri, 31 Dec 2021 18:15:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E8EF80118; Fri, 31 Dec 2021 11:22:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF26FF800C1
 for <alsa-devel@alsa-project.org>; Fri, 31 Dec 2021 11:22:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF26FF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dED7gF7a"
Received: by mail-wr1-x42b.google.com with SMTP id v11so55282772wrw.10
 for <alsa-devel@alsa-project.org>; Fri, 31 Dec 2021 02:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qlpugDrkjbxKUnYLBcla6CSYhjRVpPctfD23qwxThtU=;
 b=dED7gF7aHiq8ABASqPcdg0xQwbMonz0lYf8jr8cEGIbs3FspFmdLbVazpTRetqA+Yc
 VnVrE7FVT4hTy/F3mtbzakn3F51CzdPC3YaBY50psEDg3Sl9FzR7uLqEafx7qt1PfsCz
 fkEWGY1bILwKP2EPVDOZMwIOI1gbonQSXVklnI9wGPNC7LDl+rZ91jmm4lUSMDDODmJ3
 BNiFKlDaQhmR5yjfKkT1ERnKpYYmJslfvhS4LjvnDm4PWZ1yXbJMwBa0EY6Sy8GNq2y7
 btRg9WDz3DurJEpCJTsCcMJgrOFwNFgceopoW1vJ8N+bxoikK71MGJAcsKyTvJXFvbz1
 hpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qlpugDrkjbxKUnYLBcla6CSYhjRVpPctfD23qwxThtU=;
 b=ek+Kuiik47u+kATf9b8yJzTHArVOPCciRLwpy4mg6ha8sxV/T1XwR8Nj344jXloVJo
 R3Tmxp0wCWmkTdRqJwXxTt7457IX+iSMAN80sIuKKrG+vjfP1Vfqdn0aUSzm69g/hdUc
 7R3N6D6xp06Gg9+CF07ptT8eptb6HXbr22g/ej5Q2l00ySZfTrAc/CjgYcootF7QdXS1
 ICVnmoGwsCAAHNEsp8K5pTLLOA9q/PbXNb9yMymbmPzbRWlrUtykmMgDU1TLcmXkVe2a
 thDZ+duQ30rAlqmHQkPfLtFcsTxPX196TTcQbWwzYq0EZ9ghpf8I0DI9fJZd4eugPoUw
 sTAw==
X-Gm-Message-State: AOAM533z9B/1cnPvRQV0ctt2ZzoTRK+QbvEY6PDRr3xEV5YLq1j75UYc
 cwjfroPzLAyiox7e1wrE4sA=
X-Google-Smtp-Source: ABdhPJxxiWAvC3FSUU7cKk1ghI1xuMN+Mx7ahOUETaMd7EqqZSx5PqbDfaV6LAhcvquqdB7XzO4hSA==
X-Received: by 2002:adf:d1cc:: with SMTP id b12mr30571101wrd.282.1640946154906; 
 Fri, 31 Dec 2021 02:22:34 -0800 (PST)
Received: from cosmos.lan (77.116.53.251.wireless.dyn.drei.com.
 [77.116.53.251])
 by smtp.gmail.com with ESMTPSA id d22sm26230509wmq.17.2021.12.31.02.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 02:22:34 -0800 (PST)
From: Christian Lachner <gladiac@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH 0/1] ALSA: hda/realtek - Fix silent output on Gigabyte X570
 Aorus Master after reboot from Windows
Date: Fri, 31 Dec 2021 11:21:37 +0100
Message-Id: <20211231102138.3226-1-gladiac@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 Dec 2021 18:15:28 +0100
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

This patch addresses an issue where after rebooting from Windows into Linux
there would be no audio output.

It turns out that the Realtek Audio driver on Windows changes some coeffs
which are not being reset/reinitialized when rebooting the machine. As a
result, there is no audio output until these coeffs are being reset to
their initial state. This patch takes care of that by setting known-good
(initial) values to the coeffs.

The coeffs were collected via alsa-info, see:
  broken: https://pastebin.com/4bRBSseH
  working: https://pastebin.com/WUTufvZB

I also created a script which fixes the audio at runtime.

 #!/bin/sh
 hda-verb /dev/snd/hwC2D0 0x20 SET_COEF_INDEX 0x1a
 hda-verb /dev/snd/hwC2D0 0x20 SET_PROC_COEF 0x01c1
 hda-verb /dev/snd/hwC2D0 0x20 SET_COEF_INDEX 0x1b
 hda-verb /dev/snd/hwC2D0 0x20 SET_PROC_COEF 0x0202
 hda-verb /dev/snd/hwC2D0 0x20 SET_COEF_INDEX 0x43
 hda-verb /dev/snd/hwC2D0 0x20 SET_PROC_COEF 0x3005
 hda-verb /dev/snd/hwC2D0 0x20 SET_COEF_INDEX 0x58
 hda-verb /dev/snd/hwC2D0 0x20 SET_PROC_COEF 0x8fd6
 hda-verb /dev/snd/hwC2D0 0x20 SET_COEF_INDEX 0x5f
 hda-verb /dev/snd/hwC2D0 0x20 SET_PROC_COEF 0xa3c5
 hda-verb /dev/snd/hwC2D0 0x20 SET_COEF_INDEX 0x6a
 hda-verb /dev/snd/hwC2D0 0x20 SET_PROC_COEF 0x0232

However, obviously, we can and should fix this in the kernel.

We initially relied upon alc1220_fixup_clevo_p950() to fix some pins in the
connection list. However, it also sets coef 0x7 which does not need to be
touched. Furthermore, to prevent mixing device-specific quirks I introduced
a new alc1220_fixup_gb_x570() which is heavily based on
alc1220_fixup_clevo_p950() but does not set coeff 0x7 and fixes the coeffs
that are actually needed instead.

This new alc1220_fixup_gb_x570() is believed to also work for other boards,
like the Gigabyte X570 Aorus Extreme and the newer Gigabyte Aorus X570S
Master. However, as there is no way for me to test these I initially only
enable this new behaviour for the mainboard I have which is the Gigabyte
X570(non-S) Aorus Master.

I tested this patch on the 5.15 branch as well as on master and it is
working well for me.

Christian Lachner (1):
  ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Master
    after reboot from Windows

 sound/pci/hda/patch_realtek.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

-- 
2.34.1

