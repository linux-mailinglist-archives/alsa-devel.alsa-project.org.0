Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 295BE3D8CB6
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 13:25:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B14C11811;
	Wed, 28 Jul 2021 13:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B14C11811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627471532;
	bh=8wz7wt5zvMfg9z3EjY2RVc3dMvsoaL5f7wF6gmU7/Og=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mrmAZn9dx9onrjykDAgpFG4ROZaet9Vpikiu7KHZVFfcoQU+PZG9WANUUDiExiVV2
	 +of5r5Xdqze74VoRQAO/+7Z9MSDCPJMZCgOytjAalCZ4xHlv91JbYjhDTwS/UHVvPS
	 VGKgzqVccd2yQiptUH8jLfZdfVB7F70nx2PiVLM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9552F804B1;
	Wed, 28 Jul 2021 13:24:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DB6DF804B1; Wed, 28 Jul 2021 13:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA111F80212
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 13:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA111F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="vra+Gii4"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="UPdCwuwU"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 61B042226A;
 Wed, 28 Jul 2021 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627471434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=v40hfsfPc7Op5kXR/AmK5YAYDLYOcH7sclrn8DXQz/o=;
 b=vra+Gii4BuzAQfnLmDkTndGlSh4PQoUSWJXWbuOkPVhi3uvid3Bm89o6EAJ+/q7keoIPaG
 W+D4sMVUWFgJJrkyJFQhSE5alI4Ibb7S0USOwkRc7UZWI+XhiX1ui4u9fWzmdqrZlhRlpb
 5lG4q7nrjeTXVFaoab1mFW6/tlynkZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627471434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=v40hfsfPc7Op5kXR/AmK5YAYDLYOcH7sclrn8DXQz/o=;
 b=UPdCwuwUGJ0S+dgtslSUb9xSWSKSnwnCGnnO2PHf1IAEH8CX67X1pYIm/rqLYWXWEmF02t
 cyXikXXtWoDMRoAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5022EA3B81;
 Wed, 28 Jul 2021 11:23:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: Fix reference to PCM buffer address
Date: Wed, 28 Jul 2021 13:23:48 +0200
Message-Id: <20210728112353.6675-1-tiwai@suse.de>
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

Hi,

while updating the memory allocation API for WC pages, I casually
stumbled on quite a few drivers dealing with the PCM buffer address
wrongly via substream->dma_buffer.addr.  This patch series corrects
those usages.


Takashi

===

Takashi Iwai (5):
  ASoC: amd: Fix reference to PCM buffer address
  ASoC: intel: atom: Fix reference to PCM buffer address
  ASoC: xilinx: Fix reference to PCM buffer address
  ASoC: uniphier: Fix reference to PCM buffer address
  ASoC: kirkwood: Fix reference to PCM buffer address

 sound/soc/amd/acp-pcm-dma.c                  |  2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c          |  2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c         |  2 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  3 +--
 sound/soc/kirkwood/kirkwood-dma.c            | 26 ++++++++++++++------
 sound/soc/uniphier/aio-dma.c                 |  2 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c        |  4 +--
 7 files changed, 25 insertions(+), 16 deletions(-)

-- 
2.26.2

