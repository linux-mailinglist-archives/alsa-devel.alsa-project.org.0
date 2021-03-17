Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0158C33E3AA
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 01:58:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2C5190B;
	Wed, 17 Mar 2021 01:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2C5190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615942689;
	bh=8lIR2o4v18WR/2YlHYIn96RC4k9ZocX631GO7STRiBc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P5MY6djiUI8yqdQAjMFKCTpHxLg1SuVIdDEZZtDT3JqsLIT7PBlIGv6OsPdRszrdW
	 yjL4+lIqyNAxu0u1GLtv7HDpjGeHVGnqXjuI9jUNVaN5+5Z9nsVQYtwkd95AqsFahm
	 W7tcQ5dZwUVsrjeiuVFdrkDOTO9qY2EmXP8xHKOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57B8BF80171;
	Wed, 17 Mar 2021 01:57:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92B21F80218; Wed, 17 Mar 2021 01:57:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DE96F80156
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 01:57:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DE96F80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CD9kiTeh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6937D64F9F;
 Wed, 17 Mar 2021 00:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615942625;
 bh=8lIR2o4v18WR/2YlHYIn96RC4k9ZocX631GO7STRiBc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CD9kiTehxE2y44ygNtYNxfOzjTYukk4P0IlLAz6S8z8Sso9MHKWR56Q+iVNujTOA+
 qmxTinHsNk1+m2A5PcCbug5+bSjYluinwjLjIylxLCASuf2iiUKN5evkH7VxKODTQZ
 hQXug5sJfC08L3dmEu3MCKg8vJYf1wAcG2Movy9VBEw/J3dOgQdQ6MaS8vSnlBn5S5
 PIZvMAlsEDZ0DQVF4ChoLfIIOghKE7uFvi5612KrbOvAq3oCL3lJ59AXX2poqyjJ2g
 iHZWSEmYOEkm1+5w8zar/cpRuRSEXhMV4m/O4NeACyPgXSXQHZh2KCgcpfT8u3lzwZ
 UfsF86zGlVc9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/54] ALSA: hda: ignore invalid NHLT table
Date: Tue, 16 Mar 2021 20:56:07 -0400
Message-Id: <20210317005654.724862-8-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317005654.724862-1-sashal@kernel.org>
References: <20210317005654.724862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Philipp Leskovitz <philipp.leskovitz@secunet.com>,
 Mark Pearson <markpearson@lenovo.com>
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

From: Mark Pearson <markpearson@lenovo.com>

[ Upstream commit a14a6219996ee6f6e858d83b11affc7907633687 ]

On some Lenovo systems if the microphone is disabled in the BIOS
only the NHLT table header is created, with no data. This means
the endpoints field is not correctly set to zero - leading to an
unintialised variable and hence invalid descriptors are parsed
leading to page faults.

The Lenovo firmware team is addressing this, but adding a check
preventing invalid tables being parsed is worthwhile.

Tested on a Lenovo T14.

Tested-by: Philipp Leskovitz <philipp.leskovitz@secunet.com>
Reported-by: Philipp Leskovitz <philipp.leskovitz@secunet.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210302141003.7342-1-markpearson@lenovo.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-nhlt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index d053beccfaec..e2237239d922 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -39,6 +39,11 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 	if (!nhlt)
 		return 0;
 
+	if (nhlt->header.length <= sizeof(struct acpi_table_header)) {
+		dev_warn(dev, "Invalid DMIC description table\n");
+		return 0;
+	}
+
 	for (j = 0, epnt = nhlt->desc; j < nhlt->endpoint_count; j++,
 	     epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length)) {
 
-- 
2.30.1

