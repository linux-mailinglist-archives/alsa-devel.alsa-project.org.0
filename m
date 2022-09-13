Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B175B6858
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 09:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E683F1717;
	Tue, 13 Sep 2022 09:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E683F1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663052633;
	bh=zjKhv40vVxlSmWSB6TV0D/YMPWENic88qAh8wtYGFWM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aeBWFPZPUqzqqDxUaxS3FOhiu4yS6CaQnvBcVp5Up9UqEQFlCuwM8yG8bqnSr9M1h
	 kYTK7qiBl37TBX+R2jYxBHrSjbRx8dp8Wxunfu6BSJaKO+sviQUQ+UcnMc9X4KgsXb
	 0K47boUuuHhJkWWLWlSVtNKCu56vhRqH80acm4hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5163EF8025D;
	Tue, 13 Sep 2022 09:02:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C5DEF80224; Tue, 13 Sep 2022 09:02:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2EDAF8008E
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 09:02:46 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 97D50A003F;
 Tue, 13 Sep 2022 09:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 97D50A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1663052565; bh=ujOmHs6Oh9Omkarup+/OTSwS4lXInaPg3wcjFPf9FTU=;
 h=From:To:Cc:Subject:Date:From;
 b=2glwYsFIbSzt0Xw2uBv2TV33WR6ZcDUQqUuadrEU7zwSkCY2TSFtQehPLn3OVpfDa
 carkwK0ssPn15jTBxrrMdhg6pT3sv0ZYwNN+QJqjW8uLdwV81kp98g/G9Tt0F+OqMw
 EF9rrmKhezdbfYzjis1AFzYoh0VexBxYhvQlWJPg=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 13 Sep 2022 09:02:41 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda/hdmi: Fix the converter reuse for the silent stream
Date: Tue, 13 Sep 2022 09:02:16 +0200
Message-Id: <20220913070216.3233974-1-perex@perex.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

When the user space pcm stream uses the silent stream converter,
it is no longer allocated for the silent stream. Clear the appropriate
flag in the hdmi_pcm_open() function. The silent stream setup may
be applied in hdmi_pcm_close() (and the error path - open fcn) again.

If the flag is not cleared, the reuse conditions for the silent
stream converter in hdmi_choose_cvt() may improperly share
this converter.

Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 6c209cd26c0c..22766810635b 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1267,6 +1267,7 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 	set_bit(pcm_idx, &spec->pcm_in_use);
 	per_pin = get_pin(spec, pin_idx);
 	per_pin->cvt_nid = per_cvt->cvt_nid;
+	per_pin->silent_stream = false;
 	hinfo->nid = per_cvt->cvt_nid;
 
 	/* flip stripe flag for the assigned stream if supported */
-- 
2.35.3
