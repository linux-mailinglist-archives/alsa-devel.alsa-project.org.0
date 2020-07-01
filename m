Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2769C210B08
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 14:29:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C741663;
	Wed,  1 Jul 2020 14:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C741663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593606568;
	bh=u5d1J8cKt6uvUD2dTzndH3U1+JIoqPC0PqLevjmBynY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8ANi2vDO3Ug2pvPp0fjhyk6lK8FFSEVrrzooi9j3c8e1xnE+atLI1RvVk2jD9RpG
	 ptjhcttmIBauSmO1+HmTUtCpIzodPwQhBWqKSy5rwThMJ7NOPkNPAmZMd+08MRoTtD
	 kcS57pLtM3UedXb06dRtFsbTiAe7J/rqP66bfgHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1531EF802C2;
	Wed,  1 Jul 2020 14:27:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23872F802A8; Wed,  1 Jul 2020 14:27:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA270F8021D
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 14:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA270F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="F5dsU4L8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jkfDC8SYLcRAPDATfR9VguvSs7UrKj28GPMRUIHZ24I=; b=F5dsU4L8+SoW68Oce/DPJDb40C
 GXJSTcOnF0VyUnO5NqsAMcoQuPyDYOJmG76qHV08JEbGkBPKwK7ftHesKEN9m8nJCT3+3wxdCkLPW
 R710lp9i+rHzHsSjZsMZHOJAAj5Dz6w1kegKrHYFW0Rqqse1l0S7ks2MZU3Hs3mjFgfSkNipd9O84
 s/dnuJMo69b4vvtOteZHD1SX1jtTumgs7Kjj8fRiwsnP0vfvPbXQ18bmqJrUqreQizmsuzx/a7Q4I
 poazyWnf1/VtKYowmpOotPOuci/A0BYCvQwpGz4qjfWrqvAbR2xYYhF7JpS6um2BFt5uX1Z/DRXhv
 FCjdbS5g==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jqbpj-0009kO-OH; Wed, 01 Jul 2020 13:27:24 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jqbpj-0004e2-Fm; Wed, 01 Jul 2020 13:27:23 +0100
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/4] echoaudio: Prevent races in calls to set_audio_format()
Date: Wed,  1 Jul 2020 13:27:21 +0100
Message-Id: <20200701122723.17814-2-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2007011319580.23012@tamla.localdomain>
References: <2007011319580.23012@tamla.localdomain>
Cc: alsa-devel@alsa-project.org
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

The function uses chip->comm_page which needs locking against
other use at the same time.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 sound/pci/echoaudio/echoaudio.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 82a49dfd2384..19002d785d8d 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -711,9 +711,22 @@ static int pcm_prepare(struct snd_pcm_substream *substream)
 
 	if (snd_BUG_ON(pipe_index >= px_num(chip)))
 		return -EINVAL;
-	if (snd_BUG_ON(!is_pipe_allocated(chip, pipe_index)))
+
+	/*
+	 * We passed checks we can do independently; now take
+	 * exclusive control
+	 */
+
+	spin_lock_irq(&chip->lock);
+
+	if (snd_BUG_ON(!is_pipe_allocated(chip, pipe_index))) {
+		spin_unlock(&chip->lock);
 		return -EINVAL;
+	}
+
 	set_audio_format(chip, pipe_index, &format);
+	spin_unlock_irq(&chip->lock);
+
 	return 0;
 }
 
-- 
2.17.5

