Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC824F35E4
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 15:55:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4560C1838;
	Tue,  5 Apr 2022 15:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4560C1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649166910;
	bh=uRCqPiSmDm50AsV2xR5Q4AxiYFD6rvyaw7Au70Xqr6c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IPVK8mKZxnJl345B9VJ5Bo4VdLkjPrRA42vICHvV3oANRE8oeCIRuk/fgrFeT2zE9
	 wHcwL37N+vdEMoDmrQwZyJ3PwIFfrxbdWuYfjbhN1Fv1hrCfNuJ0j84A3vQkQSLqlk
	 vNxKnzcg+Fv14xs607UR9jk/WMTtzalMfGwXXHAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E00AF804AA;
	Tue,  5 Apr 2022 15:53:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E4D5F804AA; Tue,  5 Apr 2022 15:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6C27F804AA
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 15:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C27F804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YIXABeKS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 242086181D;
 Tue,  5 Apr 2022 13:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817C3C385A0;
 Tue,  5 Apr 2022 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649166801;
 bh=uRCqPiSmDm50AsV2xR5Q4AxiYFD6rvyaw7Au70Xqr6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YIXABeKSO6EetTKWYp/B5wn78lHER0NNxbIHWF/2eiybNzyn9aktzwdpguALXmIpF
 FWI21vFN+mRcQSaSTG5aXuVGdFLq/ypYu30dPI9Z95oXio+45gge2I6NY+pHCyStCw
 Ww/qvoFlCqJtZibYrVUBDULM3FtU4oUYVcGPPfNXAbIzjq8lTB60F+ouM1xAVJWeY8
 IrClZPQ7ovoG7/feMaWLd2/2Vdp62Qg/XLfkxNMJWMZq9Qlgcm+ZnxVt6JojQtLDuh
 gBHnqpXU3O09/W4gviRTs/T3B/V7xE4fa7/HlgoJhTCrLrLBoGXHcmz1Va1swAvwVT
 Aj4HkAwCvZTfQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nbjcV-001lTa-71; Tue, 05 Apr 2022 15:53:19 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 RESEND 2/2] ASoC: Intel: sof_es8336: Huawei Matebook D15
 uses a headphone gpio
Date: Tue,  5 Apr 2022 15:53:17 +0200
Message-Id: <2e5821bf815a97786d2b58c62dcef98bc7b19ed8.1649166634.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649166634.git.mchehab@kernel.org>
References: <cover.1649166634.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
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

See [PATCH v2 RESEND 0/2] at: https://lore.kernel.org/all/cover.1649166634.git.mchehab@kernel.org/

 sound/soc/intel/boards/sof_es8336.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index bcd80870d252..79cf9777c4fc 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -292,6 +292,14 @@ static const struct dmi_system_id sof_es8336_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_ES8336_TGL_GPIO_QUIRK)
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

