Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6701B3297D5
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 10:29:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF5E616F6;
	Tue,  2 Mar 2021 10:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF5E616F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614677362;
	bh=35S74DMFw5uNYR837mv6EHNd80UGKVB94JPNHIfj7Eg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BwV/Dy0GLsgLlHPc1q5Yh8wbPVlQ+gD+UZgOpwr6YvVx8xIljs+yQ2WQ1aLqf5Eer
	 e9ywrao5QNPXluA5KBPSn92vTv4zFBVoy4eGeeTloQkpFhjD2GToUMaZ8QWfly/8Zl
	 LH6Hj4MLklNtP/48f6N7mZMURvKhFcesOo+ncDbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00D21F80088;
	Tue,  2 Mar 2021 10:27:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9DC3F8025B; Tue,  2 Mar 2021 10:27:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B3D4F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 10:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B3D4F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="PwzcV7EQ"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603e05070000>; Tue, 02 Mar 2021 01:27:35 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 09:27:34 +0000
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Mar 2021 09:27:32 +0000
From: Jon Hunter <jonathanh@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: soc-core: Prevent warning if no DMI table is present
Date: Tue, 2 Mar 2021 09:27:12 +0000
Message-ID: <20210302092712.310705-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614677255; bh=zevSqHxMC5QGrkWCFYq/EsEdVzaCU5yAoPM8ypRlfpc=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
 b=PwzcV7EQg1C4LN4dDshBu7voQLeGRdGDb6knwc3i0aY7pbulXizZEPzlimEwg7Auz
 VyCtp7G0k4NgkqvA8LdSckC+FiRgJZzf8v6n+GdryuQo+zooc5z/05b0HG1WeM2Zv6
 KWxbt/lVD4psbsSinv2GrJHw/PxDccMzTpgyDAvK62w1jsa7YlXbA8cpkPYV+ArgPS
 DHZrLuhn1zkEGvAATCWeTk2ZoG6WA+JiFp1SfBhig/pn9squbzWLKsuAT8KzkqjJ5S
 Y3vu4l5jGPPFoaJpzyAStdtikSWK7J5ZLpepSTbc+4XwxN/Pny1TRaCIXB+8HoS9Jo
 wmxINcR98iacw==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
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

Many systems do not provide a DMI table and on these systems a warning,
such as the following, is printed on boot ...

 WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!

If DMI support is enabled in the kernel, there is no simple way to
detect if a DMI table is table or not. Note that the variable
'dmi_available' is not exported and so cannot be used by kernel modules.
It could be possible to have every ASoC sound card driver set the long
name to avoid the above message, but it might be intentional for the
long name, that we fall back to using the sound card name. Therefore,
make this a debug print by default to avoid the warning.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f6d4e99b590c..f1189e7c1fcc 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1576,7 +1576,7 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, c=
onst char *flavour)
 	/* make up dmi long name as: vendor-product-version-board */
 	vendor =3D dmi_get_system_info(DMI_BOARD_VENDOR);
 	if (!vendor || !is_dmi_valid(vendor)) {
-		dev_warn(card->dev, "ASoC: no DMI vendor name!\n");
+		dev_dbg(card->dev, "ASoC: no DMI vendor name!\n");
 		return 0;
 	}
=20
--=20
2.25.1

