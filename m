Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE812C67FE
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 15:34:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83787184F;
	Fri, 27 Nov 2020 15:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83787184F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606487675;
	bh=iY+fS0KlEYPhvSiNadg+TsiOgXDmX4r04qS0uT0I8oA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+Y9D0+xY+MWyfPGC/BnNz6R+F2vJ2nYgltatArEpDSTk+hchu+xdx8lBUlNAha4x
	 2KgPn8YzvLeYIR3X7qtB+fAwmVvSAvAzhSYTD0gze0l64y+Jdrfy3hZta5wg+omItD
	 EcEqwYh3GgGRDed0E4ZH6+LCsr4HefZxBZROzHtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17E5EF804BC;
	Fri, 27 Nov 2020 15:32:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 255BBF802C4; Fri, 27 Nov 2020 15:32:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 975A8F8019D
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 15:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 975A8F8019D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3794DAE42;
 Fri, 27 Nov 2020 14:32:02 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: amd: Return -ENODEV for non-existing ACPI call
Date: Fri, 27 Nov 2020 15:31:59 +0100
Message-Id: <20201127143200.16272-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127143200.16272-1-tiwai@suse.de>
References: <20201127143200.16272-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 alsa-devel@alsa-project.org, Akshu Agrawal <akshu.agrawal@amd.com>
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

AMD Renoir driver tries to identify the presence of DMIC by evaluating
ACPI _WOV entry, and it returns -EINVAL when the ACPI call failed.
This ended up an error message like
  snd_rn_pci_acp3x: probe of 0000:04:00.5 failed with error -22
although the system is correctly set up.

For avoiding such a superfluous error message, change the return value
to -ENODEV.  Then the driver core just skips to the next one without
complaining.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210359
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index b943e59fc302..877350f38a68 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -224,7 +224,7 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 		handle = ACPI_HANDLE(&pci->dev);
 		ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
 		if (ACPI_FAILURE(ret)) {
-			ret = -EINVAL;
+			ret = -ENODEV;
 			goto de_init;
 		}
 		if (!dmic_status) {
-- 
2.26.2

