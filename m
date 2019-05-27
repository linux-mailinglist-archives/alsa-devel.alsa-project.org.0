Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7722E2B701
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 15:51:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FC8C17A6;
	Mon, 27 May 2019 15:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FC8C17A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558965113;
	bh=AsSL4alUe9FNV4oP/HpOwhLslyYd+LktqIY3D7Lgu3U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ezagUCwvWwoqCM+8qcC+Fcuhdaolgmsx/UIl+7zb7hWIQT7gswnj9Gq7cAAZ21+4z
	 IByPS1j5KzN/EeqrhEcXokTAku+i+VD7R+5mX6sekVICFvkBhZrwJn9TNIa3lIHNug
	 pssmkVg3/e4DF84LDLqycr7heSDITpl+MvQtLb4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D52C6F8972F;
	Mon, 27 May 2019 15:48:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27457F896E5; Mon, 27 May 2019 15:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42C55F896E0
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 15:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42C55F896E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GyzUuE8D"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDm68Y073368;
 Mon, 27 May 2019 08:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1558964886;
 bh=Hf8IFHndzk4D6oqYha5f5/8yYRj5fgQTA/zOXHmnD2s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=GyzUuE8DUCwo1pogTWF8uek1L63iZTVcZKPiu1iQUQ1fWkBeLSW/4r3PW1kL6+Lax
 iK5y31Ik6dhiV0RVKFqGuiu4NzHynba9GoPc1LiuwzXjR1Ot47ftL4oseyxAAXU8tR
 WKEE0uAtZp/DYr1soZyH+KIvgAJJ+ZswVP6y9ywA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDm6xC054858
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:06 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:04 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviF065947;
 Mon, 27 May 2019 08:48:02 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Date: Mon, 27 May 2019 16:47:53 +0300
Message-ID: <c42838073b83185a5cf9949caab3c70ee093b791.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558964241.git.jsarha@ti.com>
References: <cover.1558964241.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: peter.ujfalusi@ti.com, a.hajda@samsung.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, robh@kernel.org
Subject: [alsa-devel] [PATCH v8 2/6] drm/bridge: sii902x: Set output mode to
	HDMI or DVI according to EDID
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Set output mode to HDMI or DVI according to EDID HDMI signature.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 0d3d730b97ff..128d8fdb4ba6 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -181,12 +181,16 @@ static int sii902x_get_modes(struct drm_connector *connector)
 {
 	struct sii902x *sii902x = connector_to_sii902x(connector);
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	u8 output_mode = SII902X_SYS_CTRL_OUTPUT_DVI;
 	struct edid *edid;
 	int num = 0, ret;
 
 	edid = drm_get_edid(connector, sii902x->i2cmux->adapter[0]);
 	drm_connector_update_edid_property(connector, edid);
 	if (edid) {
+	        if (drm_detect_hdmi_monitor(edid))
+			output_mode = SII902X_SYS_CTRL_OUTPUT_HDMI;
+
 		num = drm_add_edid_modes(connector, edid);
 		kfree(edid);
 	}
@@ -196,6 +200,11 @@ static int sii902x_get_modes(struct drm_connector *connector)
 	if (ret)
 		return ret;
 
+	ret = regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
+				 SII902X_SYS_CTRL_OUTPUT_MODE, output_mode);
+	if (ret)
+		return ret;
+
 	return num;
 }
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
