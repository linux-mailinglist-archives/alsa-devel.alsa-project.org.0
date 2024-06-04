Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B26148FB12D
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 13:32:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D415DEC;
	Tue,  4 Jun 2024 13:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D415DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717500720;
	bh=4VkGtERUrKVdApQTxE0PYMgIVXnqdYk7PyRuEkZe2dc=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oHPsbWPXThq7pQAT4cG5JcCK4+yBt5SwA/iCleduFPrrFh0StSMjEt2ZxWaso0UOd
	 q0CawtVrNTnNX8UfEeIqTOjCyfmKodv6nNuAYyjiHVc/vjbLW3uwfG3YYUbCeABVd6
	 cdLSR6y8mDTiprP90ZANP7+MYg5FxCOpi1VVaCLE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC8FF8051F; Tue,  4 Jun 2024 13:31:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE759F80579;
	Tue,  4 Jun 2024 13:31:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFD6AF802DB; Tue,  4 Jun 2024 13:31:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59D83F8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 13:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D83F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=R9eFN+WM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717500664; x=1718105464; i=markus.elfring@web.de;
	bh=RqEJL9d9070BNk7hTaW1Jc98pMQJPKNH8MLfBlTHCLo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=R9eFN+WMgIaIYRA/nPWC3/464ltk3AOqYYMwWGJ+TP8juT0vixZDE2Cb7TCqUHvP
	 PTf7Gdd/tQjzqUGeQeTwtUJrzYGCbFjDl+2H4nUGT1W/pbu149eKfWnf0zXXT5tPD
	 azcbEKzidENjhQefnXayjYhNV6xL0nM1CFGTJ5aci9/T7x+JxHjdDvDuJM7iEvovN
	 f2N6LA6i+84KJeyYQJxJrYwovUJmjr5pk524BZySSgHTWd4YFR26kxKOLBw9JU8Oq
	 Ga3lKi3TUQdHWCIJfyzG90MeA1nAANz3GcBNLBGykd9I1BMWGNdcdGIdUhtyv7zAQ
	 6zjgjUar0L9qfrl98A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M43GU-1sESNc2TVQ-00EJak; Tue, 04
 Jun 2024 13:31:04 +0200
Message-ID: <6562750c-0787-4edf-866b-691dd5b8854e@web.de>
Date: Tue, 4 Jun 2024 13:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Bard Liao
 <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Vinod Koul <vkoul@kernel.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, Bard Liao <bard.liao@intel.com>,
 Vinod Koul <vinod.koul@linaro.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] soundwire: Use scope-based resource management in five
 functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cScq7uthnA9o3mWUXillcOW60/+JXMdE1sEtnxrSCuLeIocVmlg
 86wyntw8D2uoBObODLpBxNHUEcjiHvBDBBKBS5Ut9chFKPAWO69LXFabNj6DdQdqOMJAiFj
 SDTz+/WaVjxPTK63mxzYHSr5xNtbUy/7rQYYJVZil1E68erTi3LxEOkKHQ2O5ex0cV2zH/e
 Y2ud7S1x5okGPYXOm/4tw==
UI-OutboundReport: notjunk:1;M01:P0:soCrROdFRaw=;TkRwY2s1JgztSRhVlnV430/UODB
 g6jvi5DKEkjRZeU0WDGMWRRdRGzmuNrBaZImD5EKOXNLqcPBdcHbXICd8zfbwsuflm0qNERUJ
 NagvptKvMzRFlQcsDR5/tCqHtzRPVOG7SZcLmeNTEAZW7rsU5NWV67QA0We9WcQaT88pRnCcp
 cwxCTyPn/T93yhtQ2NbG1CHVRFQEzbzmM4SYoRCXVLWIMrSBYK/9gghV77Z68P30KXETD3GL7
 W3SsNO3L8A1vX6882cHKUvSMvejxKLkmPUjTZWfykZpgMrNt0qT62/wsNQ0oosSm5BDxyzoFz
 ivDK9NumN6axlmp7zZlLCi7Ns5Ej/0Kcm6HSzNXLwHePvSF9njZHumTVJO9NnHX+zsYTJ5BcK
 aMlr00m1SfPG/lbRbZrEcwENh3FoNGqjRzjMuiRsvghkwUBmiTkudGmEgIZtfOajUrKOcu7Nw
 h6UmyXExMGHx1xaGpXsuIqv43D5RJ6xG8GkNouvsTJTIwqXMoFGAgjgluSOdtz1GjXzC5mYBi
 ucBbiWmr6GDCrsZGmS24EQLGrdDr6uQa4i1TV/w/rK0GtSnAXUd6HVP6FHUYez9qSGzaAGGRq
 S3xhcQ6uqj3KNCmY8DDtxk9b79N48lWNKg3dKBOLwmWTGRJpLevf5PZlc7H4bphmLgC9Rbm8d
 hhVMkZQe9D2FqGtx2cmXl7hDim1dSkLZdSxBaragr2yr9bm9XGHvRmcwqe8BbSAEdy6EVPxni
 9kCfza9FuLx+Ld5FKKuAjFLG+cPU4cf3sGcN6tFGKJdFJQ+jkJ+Ys86E3Nztxi3Cwj8lqJgRt
 yyJnOU1jGShyu5g9GudDSD8Jpyvo0EpXAcat5dbQg7COY=
Message-ID-Hash: V3AIO6HLTOD3FRNPBWW6SMC5DINHRH6N
X-Message-ID-Hash: V3AIO6HLTOD3FRNPBWW6SMC5DINHRH6N
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3AIO6HLTOD3FRNPBWW6SMC5DINHRH6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 4 Jun 2024 12:30:40 +0200

Scope-based resource management became supported also for another
programming interface by contributions of Jonathan Cameron on 2024-02-17.
See also the commit 59ed5e2d505bf5f9b4af64d0021cd0c96aec1f7c ("device
property: Add cleanup.h based fwnode_handle_put() scope based cleanup.").

* Thus use the attribute =E2=80=9C__free(fwnode_handle)=E2=80=9D at more p=
laces.

* Reduce scopes for corresponding local variables.

* Omit explicit fwnode_handle_put() calls accordingly.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

Previous clarification approach:
soundwire: fix usages of device_get_named_child_node()
https://lore.kernel.org/lkml/a2036c46-0527-4ac3-a40b-c9c2cd3e185e@web.de/
https://lkml.org/lkml/2024/5/28/1138


 drivers/soundwire/amd_manager.c     |  9 ++---
 drivers/soundwire/intel_auxdevice.c | 12 ++----
 drivers/soundwire/mipi_disco.c      | 62 +++++++++++------------------
 3 files changed, 31 insertions(+), 52 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manag=
er.c
index 795e223f7e5c..94b867700b2d 100644
=2D-- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -15,6 +15,7 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/wait.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -546,7 +547,6 @@ static int amd_sdw_port_enable(struct sdw_bus *bus,
 static int sdw_master_read_amd_prop(struct sdw_bus *bus)
 {
 	struct amd_sdw_manager *amd_manager =3D to_amd_sdw(bus);
-	struct fwnode_handle *link;
 	struct sdw_master_prop *prop;
 	u32 quirk_mask =3D 0;
 	u32 wake_en_mask =3D 0;
@@ -556,7 +556,9 @@ static int sdw_master_read_amd_prop(struct sdw_bus *bu=
s)
 	prop =3D &bus->prop;
 	/* Find manager handle */
 	snprintf(name, sizeof(name), "mipi-sdw-link-%d-subproperties", bus->link=
_id);
-	link =3D device_get_named_child_node(bus->dev, name);
+
+	struct fwnode_handle *link __free(fwnode_handle)
+				   =3D device_get_named_child_node(bus->dev, name);
 	if (!link) {
 		dev_err(bus->dev, "Manager node %s not found\n", name);
 		return -EIO;
@@ -571,9 +573,6 @@ static int sdw_master_read_amd_prop(struct sdw_bus *bu=
s)
 	amd_manager->wake_en_mask =3D wake_en_mask;
 	fwnode_property_read_u32(link, "amd-sdw-power-mode", &power_mode_mask);
 	amd_manager->power_mode_mask =3D power_mode_mask;
-
-	fwnode_handle_put(link);
-
 	return 0;
 }

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel=
_auxdevice.c
index fd29f4ee6970..17ad3191ecc3 100644
=2D-- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -14,6 +14,7 @@
 #include <linux/auxiliary_bus.h>
 #include <sound/pcm_params.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <sound/soc.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
@@ -123,7 +124,6 @@ static int sdw_master_read_intel_prop(struct sdw_bus *=
bus)
 {
 	struct sdw_master_prop *prop =3D &bus->prop;
 	struct sdw_intel_prop *intel_prop;
-	struct fwnode_handle *link;
 	char name[32];
 	u32 quirk_mask;

@@ -131,7 +131,8 @@ static int sdw_master_read_intel_prop(struct sdw_bus *=
bus)
 	snprintf(name, sizeof(name),
 		 "mipi-sdw-link-%d-subproperties", bus->link_id);

-	link =3D device_get_named_child_node(bus->dev, name);
+	struct fwnode_handle *link __free(fwnode_handle)
+				   =3D device_get_named_child_node(bus->dev, name);
 	if (!link) {
 		dev_err(bus->dev, "Master node %s not found\n", name);
 		return -EIO;
@@ -155,10 +156,8 @@ static int sdw_master_read_intel_prop(struct sdw_bus =
*bus)
 		SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY;

 	intel_prop =3D devm_kzalloc(bus->dev, sizeof(*intel_prop), GFP_KERNEL);
-	if (!intel_prop) {
-		fwnode_handle_put(link);
+	if (!intel_prop)
 		return -ENOMEM;
-	}

 	/* initialize with hardware defaults, in case the properties are not fou=
nd */
 	intel_prop->clde =3D 0x0;
@@ -205,9 +204,6 @@ static int sdw_master_read_intel_prop(struct sdw_bus *=
bus)
 		intel_prop->doais,
 		intel_prop->dodse,
 		intel_prop->dods);
-
-	fwnode_handle_put(link);
-
 	return 0;
 }

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco=
.c
index e5d9df26d4dc..4906532feaec 100644
=2D-- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -30,7 +30,6 @@
 int sdw_master_read_prop(struct sdw_bus *bus)
 {
 	struct sdw_master_prop *prop =3D &bus->prop;
-	struct fwnode_handle *link;
 	char name[32];
 	int nval, i;

@@ -42,7 +41,8 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 	snprintf(name, sizeof(name),
 		 "mipi-sdw-link-%d-subproperties", bus->link_id);

-	link =3D device_get_named_child_node(bus->dev, name);
+	struct fwnode_handle *link __free(fwnode_handle)
+				   =3D device_get_named_child_node(bus->dev, name);
 	if (!link) {
 		dev_err(bus->dev, "Master node %s not found\n", name);
 		return -EIO;
@@ -66,10 +66,8 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 		prop->clk_freq =3D devm_kcalloc(bus->dev, prop->num_clk_freq,
 					      sizeof(*prop->clk_freq),
 					      GFP_KERNEL);
-		if (!prop->clk_freq) {
-			fwnode_handle_put(link);
+		if (!prop->clk_freq)
 			return -ENOMEM;
-		}

 		fwnode_property_read_u32_array(link,
 				"mipi-sdw-clock-frequencies-supported",
@@ -94,10 +92,8 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 		prop->clk_gears =3D devm_kcalloc(bus->dev, prop->num_clk_gears,
 					       sizeof(*prop->clk_gears),
 					       GFP_KERNEL);
-		if (!prop->clk_gears) {
-			fwnode_handle_put(link);
+		if (!prop->clk_gears)
 			return -ENOMEM;
-		}

 		fwnode_property_read_u32_array(link,
 					       "mipi-sdw-supported-clock-gears",
@@ -119,9 +115,6 @@ int sdw_master_read_prop(struct sdw_bus *bus)

 	fwnode_property_read_u32(link, "mipi-sdw-command-error-threshold",
 				 &prop->err_threshold);
-
-	fwnode_handle_put(link);
-
 	return 0;
 }
 EXPORT_SYMBOL(sdw_master_read_prop);
@@ -169,7 +162,6 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 			      struct sdw_dpn_prop *dpn, int count, int ports,
 			      char *type)
 {
-	struct fwnode_handle *node;
 	u32 bit, i =3D 0;
 	int nval;
 	unsigned long addr;
@@ -185,7 +177,8 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,

 		dpn[i].num =3D bit;

-		node =3D device_get_named_child_node(&slave->dev, name);
+		struct fwnode_handle *node __free(fwnode_handle)
+					   =3D device_get_named_child_node(&slave->dev, name);
 		if (!node) {
 			dev_err(&slave->dev, "%s dpN not found\n", name);
 			return -EIO;
@@ -203,10 +196,8 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave=
,
 						    dpn[i].num_words,
 						    sizeof(*dpn[i].words),
 						    GFP_KERNEL);
-			if (!dpn[i].words) {
-				fwnode_handle_put(node);
+			if (!dpn[i].words)
 				return -ENOMEM;
-			}

 			fwnode_property_read_u32_array(node,
 					"mipi-sdw-port-wordlength-configs",
@@ -244,10 +235,8 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave=
,
 						       dpn[i].num_channels,
 						       sizeof(*dpn[i].channels),
 						 GFP_KERNEL);
-			if (!dpn[i].channels) {
-				fwnode_handle_put(node);
+			if (!dpn[i].channels)
 				return -ENOMEM;
-			}

 			fwnode_property_read_u32_array(node,
 					"mipi-sdw-channel-number-list",
@@ -261,10 +250,8 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave=
,
 					dpn[i].num_ch_combinations,
 					sizeof(*dpn[i].ch_combinations),
 					GFP_KERNEL);
-			if (!dpn[i].ch_combinations) {
-				fwnode_handle_put(node);
+			if (!dpn[i].ch_combinations)
 				return -ENOMEM;
-			}

 			fwnode_property_read_u32_array(node,
 					"mipi-sdw-channel-combination-list",
@@ -286,8 +273,6 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,

 		/* TODO: Read audio mode */

-		fwnode_handle_put(node);
-
 		i++;
 	}

@@ -302,7 +287,6 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop =3D &slave->prop;
 	struct device *dev =3D &slave->dev;
-	struct fwnode_handle *port;
 	int nval;

 	device_property_read_u32(dev, "mipi-sdw-sw-interface-revision",
@@ -355,21 +339,21 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 				 &prop->sink_ports);

 	/* Read dp0 properties */
-	port =3D device_get_named_child_node(dev, "mipi-sdw-dp-0-subproperties")=
;
-	if (!port) {
-		dev_dbg(dev, "DP0 node not found!!\n");
-	} else {
-		prop->dp0_prop =3D devm_kzalloc(&slave->dev,
-					      sizeof(*prop->dp0_prop),
-					      GFP_KERNEL);
-		if (!prop->dp0_prop) {
-			fwnode_handle_put(port);
-			return -ENOMEM;
-		}
-
-		sdw_slave_read_dp0(slave, port, prop->dp0_prop);
+	{
+		struct fwnode_handle *port __free(fwnode_handle)
+					   =3D device_get_named_child_node(dev,
+									 "mipi-sdw-dp-0-subproperties");
+		if (!port) {
+			dev_dbg(dev, "DP0 node not found!!\n");
+		} else {
+			prop->dp0_prop =3D devm_kzalloc(&slave->dev,
+						      sizeof(*prop->dp0_prop),
+						      GFP_KERNEL);
+			if (!prop->dp0_prop)
+				return -ENOMEM;

-		fwnode_handle_put(port);
+			sdw_slave_read_dp0(slave, port, prop->dp0_prop);
+		}
 	}

 	/*
=2D-
2.45.1

