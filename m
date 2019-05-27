Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5184E2B6FF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 15:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D92F8179A;
	Mon, 27 May 2019 15:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D92F8179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558965067;
	bh=7vCrTlh1kbhfh3875TDMIRK0PWkzDw5D8Ndv0FkQJQI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hP7I/Y4aV9PjkFxrNjsmp2r3jDxCclB85YLcgomBYueXDv3/Imob/5tZgdP6YDkJW
	 BWlVkAX/A4s8QXrwngv/pbGmk4B3RMYgHLpwKQalxZmcPiOqAJBX7BJu4ZiAGnfRj4
	 gvoanowDlyb4M9SiE538D5d7Rf3CwDJKITyiXPGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2A08F89728;
	Mon, 27 May 2019 15:48:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC250F8065A; Mon, 27 May 2019 15:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 163C3F8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 15:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 163C3F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JaRegP5b"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDm33o053918;
 Mon, 27 May 2019 08:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1558964883;
 bh=jnO0wQSVfRbEBt1Q0sFOXV/qwgajJK9ldb5h/H7MyV0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=JaRegP5b4EDwtUe0dmkvmgqI310ehK9utAiYb7nK/8fxfUcA/4Ghe4WVM5gS/6SAs
 y3MMdFWlm1Gpa3x/YfUI3JcCQiXflYFUg4LHBfp2i/vECKfTqatDUMhI5rTtyflkQ0
 WHJEYpD1/ZfMtbr0jBmLVSsgy5ApsYDgG3ESabBA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDm3LG054707
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:03 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:02 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviE065947;
 Mon, 27 May 2019 08:48:00 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Date: Mon, 27 May 2019 16:47:52 +0300
Message-ID: <deb02a1fd508c514472a4e660092f301e6681361.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558964241.git.jsarha@ti.com>
References: <cover.1558964241.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: peter.ujfalusi@ti.com, a.hajda@samsung.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, robh@kernel.org
Subject: [alsa-devel] [PATCH v8 1/6] drm/bridge: sii902x: add input_bus_flags
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

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

The driver always sets InputBusFmt:EDGE to 0 (falling edge).

Add drm_bridge_timings's input_bus_flags to reflect that the bridge
samples on falling edges.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index cdb8dfdb2dff..0d3d730b97ff 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -461,6 +461,12 @@ static int sii902x_i2c_bypass_deselect(struct i2c_mux_core *mux, u32 chan_id)
 	return 0;
 }
 
+static const struct drm_bridge_timings default_sii902x_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE
+		 | DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE
+		 | DRM_BUS_FLAG_DE_HIGH,
+};
+
 static int sii902x_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -531,6 +537,7 @@ static int sii902x_probe(struct i2c_client *client,
 
 	sii902x->bridge.funcs = &sii902x_bridge_funcs;
 	sii902x->bridge.of_node = dev->of_node;
+	sii902x->bridge.timings = &default_sii902x_timings;
 	drm_bridge_add(&sii902x->bridge);
 
 	i2c_set_clientdata(client, sii902x);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
