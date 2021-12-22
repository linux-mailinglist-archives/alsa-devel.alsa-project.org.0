Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4233E47D33F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 14:55:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3AE416EB;
	Wed, 22 Dec 2021 14:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3AE416EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640181351;
	bh=y8jlbXfYt1AeDQhiMiTHZHLZPsddA25UVMnP2UJ9BiU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oL1KN6O+duWfQbExe4GRYwFjbdRec3BO3aJckcBAAraIWMsBG2EsB85AuwfdXRuko
	 6h46ycPSoFUE/ejCI4ELWWvKkd7In86SIsBSfdSB9qdnb1NOIvVcHvfoIuEImN3hST
	 7xG/46inhtjPNYS8QY4oAmJ4OnAa+lcTayAZPZME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 364A8F80111;
	Wed, 22 Dec 2021 14:54:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DE43F80109; Wed, 22 Dec 2021 14:54:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDCBCF800B5
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 14:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDCBCF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="FFYy4yPP"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1640181266; bh=y8jlbXfYt1AeDQhiMiTHZHLZPsddA25UVMnP2UJ9BiU=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 b=FFYy4yPP37Iov3V2+kplZ6D/SF/7+58u+X2LM7p/SAVsmZK8f934MeXz1iwQHl/OW
 MZfKgPvcc6pYt10lOF7HGXmknDx3MYnT4e2X+S2PUsOU4x5R1jepqRTA7Ui3bgXVrz
 0+fkf9pQ884/2fi4eNdWO368axGOewd5qey2jLw0=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Wed, 22 Dec 2021 14:54:26 +0100 (CET)
X-EA-Auth: t8EL3DbqiWC969FFZkRYrCyuIZ/vmSsrsNuxeYWaPTdY9PXzEbXh18Lb+DVV5hZO0XcqdB7WVS+XV8q+znoISXe03fXVjhpQUJMouuDhgps=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: ak4375: Change invert controls to a stereo
 switch
Date: Wed, 22 Dec 2021 14:54:03 +0100
Message-Id: <20211222135403.2991657-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, stephan@gerhold.net,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>
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

Don't use enums for DACL/DACR Signal Invert controls,
and change them into a stereo "DAC Signal Invert Switch" control.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 sound/soc/codecs/ak4375.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/ak4375.c b/sound/soc/codecs/ak4375.c
index a893aff42a01..22cda0699341 100644
--- a/sound/soc/codecs/ak4375.c
+++ b/sound/soc/codecs/ak4375.c
@@ -127,7 +127,6 @@ static DECLARE_TLV_DB_SCALE(hpg_tlv, -4200, 20, 0);
 
 static const char * const ak4375_ovolcn_select_texts[]	= { "Dependent", "Independent" };
 static const char * const ak4375_mdac_select_texts[]	= { "x1", "x1/2" };
-static const char * const ak4375_inv_select_texts[]	= { "Normal", "Inverting" };
 static const char * const ak4375_cpmode_select_texts[]	= {
 	"Automatic Switching",
 	"+-VDD Operation",
@@ -157,12 +156,6 @@ static const struct soc_enum ak4375_mdacl_enum =
 static const struct soc_enum ak4375_mdacr_enum =
 	SOC_ENUM_SINGLE(AK4375_07_DAC_MONO_MIXING, 6,
 			ARRAY_SIZE(ak4375_mdac_select_texts), ak4375_mdac_select_texts);
-static const struct soc_enum ak4375_invl_enum =
-	SOC_ENUM_SINGLE(AK4375_07_DAC_MONO_MIXING, 3,
-			ARRAY_SIZE(ak4375_inv_select_texts), ak4375_inv_select_texts);
-static const struct soc_enum ak4375_invr_enum =
-	SOC_ENUM_SINGLE(AK4375_07_DAC_MONO_MIXING, 7,
-			ARRAY_SIZE(ak4375_inv_select_texts), ak4375_inv_select_texts);
 static const struct soc_enum ak4375_cpmode_enum =
 	SOC_ENUM_SINGLE(AK4375_03_POWER_MANAGEMENT4, 2,
 			ARRAY_SIZE(ak4375_cpmode_select_texts), ak4375_cpmode_select_texts);
@@ -176,11 +169,11 @@ static const struct snd_kcontrol_new ak4375_snd_controls[] = {
 	SOC_SINGLE_TLV("HP-Amp Analog Volume",
 		       AK4375_0D_HP_VOLUME_CONTROL, 0, 0x1f, 0, hpg_tlv),
 
+	SOC_DOUBLE("DAC Signal Invert Switch", AK4375_07_DAC_MONO_MIXING, 3, 7, 1, 0),
+
 	SOC_ENUM("Digital Volume Control", ak4375_ovolcn_enum),
 	SOC_ENUM("DACL Signal Level", ak4375_mdacl_enum),
 	SOC_ENUM("DACR Signal Level", ak4375_mdacr_enum),
-	SOC_ENUM("DACL Signal Invert", ak4375_invl_enum),
-	SOC_ENUM("DACR Signal Invert", ak4375_invr_enum),
 	SOC_ENUM("Charge Pump Mode", ak4375_cpmode_enum),
 	SOC_ENUM("DAC Digital Filter Mode", ak4375_digfil_enum),
 };
-- 
2.31.1



