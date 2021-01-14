Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E078E2F6211
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 14:35:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 776D016B2;
	Thu, 14 Jan 2021 14:34:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 776D016B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610631321;
	bh=quuezsVrkLaHl70ZIlY1dFXsT6i79/Q2fkJtdnssMAc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kd4mEYXkdo0dp9F1Tv5yGST53KwJrdBNmvwdT9jcnAKSaX+ZmRryrNxGQzBttNxcj
	 3UHq3TyVLpq3xkh/Sy3G4YpZ/5OJdZz4VSHYYSlK6N2NtX0K8CO2IwfW+KT+5NxBuR
	 078X1N+/t3K+KQPGtkMoOwVVTrBhwAv69Vc45Shc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECAE3F8026F;
	Thu, 14 Jan 2021 14:33:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83E3EF80475; Thu, 14 Jan 2021 14:33:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97409F8026F
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 14:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97409F8026F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3A7EAD78;
 Thu, 14 Jan 2021 13:33:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: Simplify with dma_set_mask_and_coherent()
Date: Thu, 14 Jan 2021 14:33:34 +0100
Message-Id: <20210114133337.1039-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

Simple conversions from two dma_set_mask*() calls into the single
dma_set_mask_and_coherent().

Just a minor code refactoring, no functional changes.


Takashi

===

Takashi Iwai (3):
  ASoC: intel: skl: Simplify with dma_set_mask_and_coherent()
  ASoC: SOF: intel: Simplify with dma_set_mask_and_coherent()
  ASoC: tegra: Simplify with dma_set_mask_and_coherent()

 sound/soc/intel/skylake/skl.c | 8 ++------
 sound/soc/sof/intel/hda.c     | 8 ++------
 sound/soc/tegra/tegra_pcm.c   | 6 +-----
 3 files changed, 5 insertions(+), 17 deletions(-)

-- 
2.26.2

