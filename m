Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 759943AAF23
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 10:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D45CE16D7;
	Thu, 17 Jun 2021 10:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D45CE16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623920053;
	bh=6EBT90gcks2TBQkDfWZfCKHpXNsn8SDfegr3V2LJZgM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hfB0Shlf5PKPQHfJ2w4lGZODJuoaeKwp0Z+AlNb+W0eJprGAPqdo8WVXGjnYNMHbA
	 nTiqmrreGwN5m3NPtbrCh8aHGjsryMixZeKq2Nu1bp+aIloGGsgnupt1yjZL3EggP7
	 jdH9F+tsXGDRPcZKVUaAuwxgtQXlCZsIerwiiBmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FF99F80088;
	Thu, 17 Jun 2021 10:52:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50252F80171; Thu, 17 Jun 2021 10:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBF6EF8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBF6EF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="ZChcYihB"
Received: from localhost (dslb-084-062-104-230.084.062.pools.vodafone-ip.de
 [84.62.104.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: ch@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5680F82024;
 Thu, 17 Jun 2021 10:52:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623919960;
 bh=wECKML38Vrd6w3QJImoA+EXyysXPfj1yuO+TdQ4AQIg=;
 h=From:To:Cc:Subject:Date:From;
 b=ZChcYihBug+u0m+JQ345BJJbrCrOBghBusYxoy+VnvuXkM2WE7smG43YYPSKmZ8Xm
 sFo1O4E9PDE7XVlr4vCy0zibLtY+0xCDiBy4lz4Br+1pQgpXtrWoi1+wJ+hUEXMd29
 RsyO/pcVFcvd5bpXhkQRUwqu9cRQQIXUKH7aL8v4uf0f/rACx9j24K3IsKsQa7NDN9
 pWhFyCxJey49hhskb6tkN8+RJi7uxcbq+LJST255ab4DQ4cjZWqukzE0nGIOhMm/oj
 d4GcsQuy22XiOmaYg5+281ibV31xEhjoRV2gIXu1yS2Un71H39WPWz/RtrVW4FVHnd
 fWJutgrlo8kuQ==
From: Claudius Heine <ch@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Marek Vasut <marex@denx.de>
Subject: [PATCH v2 0/3] ASoC: tlv320aic32x4: Add support for TAS2505
Date: Thu, 17 Jun 2021 10:52:27 +0200
Message-Id: <20210617085230.1851503-1-ch@denx.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Claudius Heine <ch@denx.de>
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

this is v2 from my patchset that add support for the TAS2505 to the tlv320aic32x4 driver.

kind regards,
Claudius

Changes from v1:
- clarified commit message of first patch, which add the type value to the struct
- removed unnecessary code to put and get speaker volume
- removed 'Gain' from 'HP Driver Playback Volume' control
- fixed rebase issues

Claudius Heine (3):
  ASoC: tlv320aic32x4: add type to device private data struct
  ASoC: tlv320aic32x4: add support for TAS2505
  ASoC: tlv320aic32x4: dt-bindings: add TAS2505 to compatible

 .../bindings/sound/tlv320aic32x4.txt          |   1 +
 sound/soc/codecs/tlv320aic32x4-i2c.c          |  22 ++-
 sound/soc/codecs/tlv320aic32x4-spi.c          |  23 ++-
 sound/soc/codecs/tlv320aic32x4.c              | 139 +++++++++++++++++-
 sound/soc/codecs/tlv320aic32x4.h              |  10 ++
 5 files changed, 186 insertions(+), 9 deletions(-)


base-commit: 70585216fe7730d9fb5453d3e2804e149d0fe201
-- 
2.32.0

