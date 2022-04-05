Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E3B4F3CB2
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 18:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63C1A1872;
	Tue,  5 Apr 2022 18:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63C1A1872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649177976;
	bh=mrR5/ytr+JrGPHmurePnWwp75ABUgQyCOCVkvWCCakM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JUKaWFcVnsbdqVvs03nqH1mvrlD3Db56IP1JrlM5/lyy6v7Dz2ihE6JtGld+LsMbb
	 uOQlw3rpGzn1UPfG8KZoHqvKkJpqmKw5Qhg3uQEnZCfx9Pz0lFVMLjR+vl5N9p1WOB
	 E8X5DT9dqXqrzwiZw66XjJGgIShw2ZkCXZLhwQZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB447F8051A;
	Tue,  5 Apr 2022 18:57:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48EEFF8016B; Tue,  5 Apr 2022 18:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DEB5F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 18:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DEB5F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oAVAz918"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A76E96189F;
 Tue,  5 Apr 2022 16:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF82C385A5;
 Tue,  5 Apr 2022 16:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649177866;
 bh=mrR5/ytr+JrGPHmurePnWwp75ABUgQyCOCVkvWCCakM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oAVAz9180ZeFPSMRdfJG2XeYPF01GHkfm9YV+4n1t7++Oqs8OT9QJnOJ3Cv/uUIOJ
 3idcvgs2vxZE/pecqdpE/c5iMBX9Rnt0aM4IeRnbP83IpAnOElaEy5Zlye9+7xC+O0
 4aFy3dXAh7OUWOr1fnexmloLBmfEomp/y+g6ajeod4xpyTdTN74F5Ief98G4u6A7hV
 uR4G5tRY5YhDJJ89RgwGxXvPm/JIHCDhMTeS0sAKQ6Vz2rCuCiPtzAAUNyzbpsL6AQ
 t9aKGtJMBrAn7n9eAoFgB+ZuUqRzizXEslrg9CMuuKOWlxrzwsLtnQSmoYXB+v2E9+
 XIkqCVPk4ER7Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nbmUx-002uYX-Fm; Tue, 05 Apr 2022 18:57:43 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 3/3] ASoC: Intel: sof_es8336: Huawei Matebook D15 uses a
 headphone gpio
Date: Tue,  5 Apr 2022 18:57:34 +0200
Message-Id: <187a647be16d57f14b7f9a34c88ece66606c61fb.1649177516.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649177516.git.mchehab@kernel.org>
References: <cover.1649177516.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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

Based on experimental tests, Huawei Matebook D15 actually uses
both gpio0 and gpio1: the first one controls the speaker, while
the other one controls the headphone.

Add a quirk for that.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v3 0/3] at: https://lore.kernel.org/all/cover.1649177516.git.mchehab@kernel.org/

 sound/soc/intel/boards/sof_es8336.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index d15a58666cc6..2965c4c1cbea 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -291,6 +291,14 @@ static const struct dmi_system_id sof_es8336_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK)
 	},
+	{
+		.callback = sof_es8336_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
+			DMI_MATCH(DMI_BOARD_NAME, "BOHB-WAX9-PCB-B2"),
+		},
+		.driver_data = (void *)(SOF_ES8336_HEADPHONE_GPIO)
+	},
 	{}
 };
 
-- 
2.35.1

