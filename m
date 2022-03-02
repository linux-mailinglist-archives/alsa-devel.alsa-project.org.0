Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFBF4CA033
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 10:02:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4F2C21D4;
	Wed,  2 Mar 2022 10:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4F2C21D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211744;
	bh=LHjgZz1Rx4keVm5nChYt85f676VLQikAEOG8PuK5p60=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cJvAuE5sEejfv0hqImalr8oplre8S8Pp5w5bQhsT2zzE6nvnf27/mlNrKYyT4iPH0
	 KCvVc2JvmMcR6d1XZEtFh+G/bMLi3f1rLYjMnPrrH3mSHIUstBwh+Y9kzsECHY2xuy
	 VziJWWLNUNq0QwzmWwidEhbElD5qCW1ksGW53lUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8124BF80C07;
	Wed,  2 Mar 2022 09:34:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7669F801D5; Wed,  2 Mar 2022 08:43:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A0C0F80167
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 08:42:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A0C0F80167
X-QQ-mid: bizesmtp83t1646206969ta5kjd02
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 02 Mar 2022 15:42:45 +0800 (CST)
X-QQ-SSF: 0140000000200060D000B00A0000000
X-QQ-FEAT: zD6y7hNAcUD/3wlbXio0BPozXLW9pL5wqWTOA31Jq7oAQZTipKOvJ3Bz/j2Gu
 pu2ZdhZWaTpg61ZMNTAK1g1tiLYdkOraCID8c3xAb5akGX74hFGKu+HIXtN4WCLxQ8gIvmi
 fefR57OKk5FvSIbwSR0o7KoUtwT7iWO5V8eutYr2fdOiP0nPQT3gkqYB65NYABfKr0HmNW7
 1kNNbWhNJlB/3A9KCcyB2uKe+eFFPGR0gi/7gZmv3Fs+CWQuQolUcScoVCn3cam0ys3in+Y
 wzJJH9saXlDGfwUvyUY+PXmhKoZWt/Wpffe4c0aE0nEFzitJIk0s70Q9fCxuUq1tYsmVKKH
 tfpB+c92fBFl6kwwqHDStp4EXZzk53iar2HcQer
X-QQ-GoodBg: 2
From: Zhen Ni <nizhen@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: intel_hdmi: Fix reference to PCM buffer address
Date: Wed,  2 Mar 2022 15:42:41 +0800
Message-Id: <20220302074241.30469-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: Zhen Ni <nizhen@uniontech.com>, alsa-devel@alsa-project.org,
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

PCM buffers might be allocated dynamically when the buffer
preallocation failed or a larger buffer is requested, and it's not
guaranteed that substream->dma_buffer points to the actually used
buffer.  The driver needs to refer to substream->runtime->dma_addr
instead for the buffer address.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 sound/x86/intel_hdmi_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 1c94eaff1931..4a3ff6468aa7 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1261,7 +1261,7 @@ static int had_pcm_mmap(struct snd_pcm_substream *substream,
 {
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	return remap_pfn_range(vma, vma->vm_start,
-			substream->dma_buffer.addr >> PAGE_SHIFT,
+			substream->runtime->dma_addr >> PAGE_SHIFT,
 			vma->vm_end - vma->vm_start, vma->vm_page_prot);
 }
 
-- 
2.20.1



