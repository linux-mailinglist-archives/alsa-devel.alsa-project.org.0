Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FA42FD2EC
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 15:44:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A10F51795;
	Wed, 20 Jan 2021 15:43:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A10F51795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611153849;
	bh=86k/MhCGSrJKkip7llvxzh7qujn8rsp+6Wwt4jyxvDQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cCL4JMxXImRMEAyeoGEutOwV9qSNtvlgzYi4oMEuxFZJYpGuKh1mjP+X1+5UtkwWO
	 0FC9aLsQcq+FU9p3IO8BZ9Z5Wdn8hvWtTEQq5Mz7749FrHE1nGYc0mJMs8XaOIwvEa
	 W58O70N+/jgKS1byAFoZyQSLahxp81X140W902fA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01B4BF8019B;
	Wed, 20 Jan 2021 15:42:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 436BAF8016E; Wed, 20 Jan 2021 15:42:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAEA2F8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 15:42:29 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BBB97A0046;
 Wed, 20 Jan 2021 15:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BBB97A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1611153748; bh=5+CO6EYjJLO0X0s5gywNEhBjjj1gJ/sEzV50VqcgNQE=;
 h=From:To:Cc:Subject:Date:From;
 b=JwVlomU0CThUMYXMboRh9BSo7EA4t67TBUB4/fwoKY3D3SW1pFKKIgjXMK5VBdckM
 lzC31zG34p7Bm2+A6EpStz8hbB/XXa0mdD3wLeXPZDMoAYHd808Nw0JRMAndyynJPS
 ZnjV310D1Bay56TYR4ySKaMgg4m1GfV3DolM8DCg=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 20 Jan 2021 15:42:23 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: AMD Renoir - refine DMI entries for some Lenovo products
Date: Wed, 20 Jan 2021 15:42:11 +0100
Message-Id: <20210120144211.817937-1-perex@perex.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 stable@kernel.org
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

Apparently, the DMI board name LNVNB161216 is also used also
for products with the digital microphones connected to the AMD's
audio bridge. Refine the DMI table - use product name identifiers
extracted from https://bugzilla.redhat.com/show_bug.cgi?id=1892115 .

The report for Lenovo Yoga Slim 7 14ARE05 (82A2) is in buglink.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=211299
Cc: <stable@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index deca8c7a0e87..050a61fe9693 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -165,10 +165,24 @@ static int rn_acp_deinit(void __iomem *acp_base)
 
 static const struct dmi_system_id rn_acp_quirk_table[] = {
 	{
-		/* Lenovo IdeaPad Flex 5 14ARE05, IdeaPad 5 15ARE05 */
+		/* Lenovo IdeaPad S340-14API */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "81NB"),
+		}
+	},
+	{
+		/* Lenovo IdeaPad Flex 5 14ARE05 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "81X2"),
+		}
+	},
+	{
+		/* Lenovo IdeaPad 5 15ARE05 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "81YQ"),
 		}
 	},
 	{
-- 
2.29.2
