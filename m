Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8422167A5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 09:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55010167C;
	Tue,  7 Jul 2020 09:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55010167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594107882;
	bh=BKj2HPPl5F3SghNaXTL6iusYB+DT/Uiga3F8iI0Pr1M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kdM0PjTVcscW9HVYe4JLIpjcT4g1mJ2LjlE+d3VZwiRQZzOb5qHDbJ7U56CPFNPEl
	 6k27m32NEikdZTEKe2Jow4uETFlSH7B7ws431S7xinE9ffA2JL51A2fZLti1y8RtGc
	 I3oPQ7KRa2K+0XhQTp+6rG3CjEc3ts/0BQo6UYeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B862F800D0;
	Tue,  7 Jul 2020 09:43:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19CBFF80216; Tue,  7 Jul 2020 09:42:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A520F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 09:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A520F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="S2e8YozD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZJnkQyXb"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DF6FEAB6;
 Tue,  7 Jul 2020 03:42:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 07 Jul 2020 03:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=3p7X8ygQrONcSrHJ+dzFyPMuAc
 Gioe82upxmwDopNqs=; b=S2e8YozD6edpoBaX+XcOsJKGC9lb3bIGdhfKW1NXn0
 60Y7hU6lGPO+ePfA36zBWnnKbiD9hNRsU+xbSkr7ROBcUnZT4EeM+gNUibK4fh2X
 CkR1CAv9JBYrrlhKURLDqMwLKsOgMzS3kgle7fbvy/inQgOSsYXVjQduVyR9Waej
 UFpn6xxG6/61Pwyx4zlAs8SLqb36rovjCSa1bSjzSuYR0jiVK43h0L1anAbiKuHH
 ivInHJz0MbqSdvbYX9abQHzDhyMV3C8aa6/JNZwHpf2zOJ3M8Xdb2aADkWY3lgfh
 nAaQ2vIToIjyKPq9hNspCuE0ELa1tHmeSygW5UGpqnHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3p7X8ygQrONcSrHJ+
 dzFyPMuAcGioe82upxmwDopNqs=; b=ZJnkQyXbGFPl0i9CTA5b4zv4JgQzpUqj/
 NW7Gkq/osACIeRJDcPMP7C0FAVGlLA/KFl85Ts6OVG054+5UDh0F5ztPhK8n0BFL
 dcYYwXOXijVDU6S1VEwIu1CSuwqB3VAXWqSrmPyLeqxnP4dRP92aouAIyjnZHNNs
 0VR5xwSsLavOxn2f8RfOkSY/FluK3Fs7q8+ohk+fN7z41FOtZ7RzSWiW0JYpUDBR
 Z+oPN1QxO5DGnbS/oG0ivHC9mv38AoddOKZpP+txqv7zNiNjY2ArYetxgO1/1fWj
 DRi59nAP2I7IDkrr8Vn1Kho6jnZzRzX3E6bsxBzu648VG4k2bY/Kw==
X-ME-Sender: <xms:cicEXygAVgGnS4oRPQsZmgj6JgeVxpxmOUg8mRO9YDk9JqeDOy53QQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeggdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cicEXzAdmPKbWqbxeD7Xb_1yjSImw4IYBXsNqzG1MRh3ItbwNrP8dg>
 <xmx:cicEX6HlnXSkW_cLAuD5V9xNsIg9It04CrG27liaspfpeRixucpClg>
 <xmx:cicEX7TX2Bahva1IBz1kceus9Y8Ox4OzzT-2p4MOpBskxP7C5LmFyw>
 <xmx:cycEX2xTA_W73xh5kzDli2Se9JX59KNJErj42KGj0euXv3u0mTz_MEorBcM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 165583280066;
 Tue,  7 Jul 2020 03:42:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] ASoC: core: Remove only the registered component in devm
 functions
Date: Tue,  7 Jul 2020 09:42:37 +0200
Message-Id: <20200707074237.287171-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
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

The ASoC devm_ functions that register a component
(devm_snd_soc_register_component and devm_snd_dmaengine_pcm_register) will
clean their component by running snd_soc_unregister_component.

snd_soc_unregister_component will then remove all the components for the
device that was used to register the component in the first place.

However, some drivers register several components (such as a DAI and a
dmaengine PCM) on the same device, and if the dmaengine PCM is registered
first, then the DAI will be cleaned up first and
snd_dmaengine_pcm_unregister will be called next.

snd_dmaengine_pcm_unregister will then lookup the dmaengine PCM component
on the device, and if there's one unregister that component and release its
dmaengine channels. That doesn't happen in practice though since the first
call to snd_soc_unregister_component removed all the components, so we
never get the chance to release the dmaengine channels.

In order to fix this, instead of removing all the components for a given
device, we can simply remove the component that was registered in the first
place. We should have the same number of component registration than we
have components, so it should work just fine.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

This was observed on a RaspberryPi that uses the vc4_hdmi driver
(drivers/gpu/drm/vc4/vc4_hdmi.c). This driver will register a dmaengine PCM
and two components. If the MIPI-DSI controller is enabled, it will create
an EPROBE_DEFER across the entire display pipeline, leading to multiple
bind/unbind cycles in the other display drivers including vc4_hdmi, leading
to multiple warnings since we request the same dmaengine channels on the
same device without ever releasing them.

It's not really clear to me when that bug was introduced exactly, since it
can only be seen on a rather unusual setup, and with all the drivers
built-in (otherwise we probably wouldn't get an EPROBE_DEFER for DSI), but
it still looks like something that should probably go to stable?

Changes from v1:
  - Rebased on top of next-20200706
---
 include/sound/soc.h                   |  2 ++
 sound/soc/soc-core.c                  | 27 +++++++++++++++++++++++++++
 sound/soc/soc-devres.c                |  8 +++++---
 sound/soc/soc-generic-dmaengine-pcm.c |  2 +-
 4 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 6791b7570a67..59235e553630 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -426,6 +426,8 @@ int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
 void snd_soc_unregister_component(struct device *dev);
+void snd_soc_unregister_component_by_driver(struct device *dev,
+			 const struct snd_soc_component_driver *component_driver);
 struct snd_soc_component *snd_soc_lookup_component_nolocked(struct device *dev,
 							    const char *driver_name);
 struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index adedadcb0efb..7c58e45c1c3f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2513,6 +2513,33 @@ int snd_soc_register_component(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_component);
 
+/**
+ * snd_soc_unregister_component_by_driver - Unregister component using a given driver
+ * from the ASoC core
+ *
+ * @dev: The device to unregister
+ * @component_driver: The component driver to unregister
+ */
+void snd_soc_unregister_component_by_driver(struct device *dev,
+					    const struct snd_soc_component_driver *component_driver)
+{
+	struct snd_soc_component *component;
+
+	if (!component_driver)
+		return;
+
+	mutex_lock(&client_mutex);
+	component = snd_soc_lookup_component_nolocked(dev, component_driver->name);
+	if (!component)
+		goto out;
+
+	snd_soc_del_component_unlocked(component);
+
+out:
+	mutex_unlock(&client_mutex);
+}
+EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
+
 /**
  * snd_soc_unregister_component - Unregister all related component
  * from the ASoC core
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index 11e5d7962370..4534a1c03e8e 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -48,7 +48,9 @@ EXPORT_SYMBOL_GPL(devm_snd_soc_register_dai);
 
 static void devm_component_release(struct device *dev, void *res)
 {
-	snd_soc_unregister_component(*(struct device **)res);
+	const struct snd_soc_component_driver **cmpnt_drv = res;
+
+	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
 }
 
 /**
@@ -65,7 +67,7 @@ int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *cmpnt_drv,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai)
 {
-	struct device **ptr;
+	const struct snd_soc_component_driver **ptr;
 	int ret;
 
 	ptr = devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
@@ -74,7 +76,7 @@ int devm_snd_soc_register_component(struct device *dev,
 
 	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai);
 	if (ret == 0) {
-		*ptr = dev;
+		*ptr = cmpnt_drv;
 		devres_add(dev, ptr);
 	} else {
 		devres_free(ptr);
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 80a4e71f2d95..61844403f181 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -478,7 +478,7 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
 
 	pcm = soc_component_to_pcm(component);
 
-	snd_soc_unregister_component(dev);
+	snd_soc_unregister_component_by_driver(dev, component->driver);
 	dmaengine_pcm_release_chan(pcm);
 	kfree(pcm);
 }
-- 
2.26.2

