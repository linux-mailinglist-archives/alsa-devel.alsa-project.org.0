Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E4213587
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 09:51:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B3616CB;
	Fri,  3 Jul 2020 09:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B3616CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593762697;
	bh=PbW5TZyDvz0kKTzbd98/Gw+SbIvD6x98AJSCY/euMBg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N2josHdfQzuwNkovemgTralXPMSFpZWicipDw2FbkFGN+l4fzb4UaK8ExEFzc34Zj
	 p0+7DOAcu/B60fFv8p1JiZdLZcLy0WKJWKOndmUmdGQxfXvPYTqSoKVEK93Y/KzgLU
	 kmkQwqdQy4HqHvLBaVja7RNC5aDZs1IcvT/O+Pbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0922F800E0;
	Fri,  3 Jul 2020 09:49:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41FCAF80217; Fri,  3 Jul 2020 09:49:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6256F800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 09:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6256F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="eah36o1+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dyJJiwGk"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id AACC8AF7;
 Fri,  3 Jul 2020 03:49:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 03 Jul 2020 03:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=fVX1MsqXg2Pw9MNdOtGBNsefR2
 zUW9dTgYxXjelLaUo=; b=eah36o1+1g4Q/Ss4ovV0FWa2RNRLjeXfvbngVOq6+/
 goslYrkNfbfRhh0/gMMwJvzbG8B6G7NNernPch9osqGCOqw13uQDrglYVD8e0MUu
 cpW52iOk3vIqPTwUg/espzpybz+LlDvXyG3bTb3CEe4gsbgc1REpoEN8mFSBONwU
 ts0NZcMAuVdFv8nVGANznD10ifjrMg3EOYXl26KSZLhCjoFAAcmJDwDUp6fdSace
 Tc6LA1f/zKxWbpdqO2U5HMrWQgl9GrSDgrKv8xRM6FsgcZh18AOMoWGEdRKuTsap
 +Qx3l8mrYagp1zPEVwT0VRw97GbbOd5XY90cQcH2V7UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fVX1MsqXg2Pw9MNdO
 tGBNsefR2zUW9dTgYxXjelLaUo=; b=dyJJiwGkTUk3WSVT4ClLIwSVvNqqe4Q40
 ScWiy7lCWSfWIGjjS1rcMwrV/dJesfFJNRv16t4Cuet9ojb+CL1nyyNlpVchswQv
 c4XJz3NZ6KrIdnbgAsPFAmRGs6CUkUIKAdja7amr01970++NNS3o6y9yM5n0e0yG
 VdXfOzGpH6s5H8g2IbvFWYpQrDJJRXS6oPanRW62OE/pMVkN0I2PwX+v2fF6+BAn
 pLDHCXa+jb0rvfQ9MP1YUo4XIqbUPm90k1vyh1hfh5NPw19pbxBX0S7LICWFWMZA
 hsrEM+E/+Ta1Tf4hZebKu4HqIKopmS2ui7wup5VTswoGrMHC3U//w==
X-ME-Sender: <xms:FOP-XswLp5JIiMrjiPS7YtG6tgQWqqYwvx6cNJ7dRUYdJUONjXTuJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdehgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FOP-XgRqv5W8pWXW3CrDxruw-sCVE66hOhTfd3AIzOAJsacsACAE_A>
 <xmx:FOP-XuUT0ObNM0V5AEb11L1qHTeb-2jRws8uYYRgt8a7IxUPX6ezgg>
 <xmx:FOP-Xqiid2pYDBSYVDugLGHsa7ew0LOQKlxREx-dBsUEkMeD3St06A>
 <xmx:FeP-XkB9pwBK3AnWgr7tB5Zy__VkN-_D3NQj0oA7p5BuFMQgvg_SFtTiOQs>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E85E83280059;
 Fri,  3 Jul 2020 03:49:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] ASoC: core: Remove only the registered component in devm
 functions
Date: Fri,  3 Jul 2020 09:49:35 +0200
Message-Id: <20200703074935.884736-1-maxime@cerno.tech>
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
---
 include/sound/soc.h                   |  2 ++
 sound/soc/soc-core.c                  | 27 +++++++++++++++++++++++++++
 sound/soc/soc-devres.c                |  8 +++++---
 sound/soc/soc-generic-dmaengine-pcm.c |  2 +-
 4 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index ef5dd28e10a9..0b3b31803678 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -444,6 +444,8 @@ int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
 void snd_soc_unregister_component(struct device *dev);
+void snd_soc_unregister_component_by_driver(struct device *dev,
+			 const struct snd_soc_component_driver *component_driver);
 struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 						   const char *driver_name);
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7b387202c5db..9d24cbd9111f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2571,6 +2571,33 @@ int snd_soc_register_component(struct device *dev,
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
index a9ea172a66a7..c6364caabc0e 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -11,7 +11,9 @@
 
 static void devm_component_release(struct device *dev, void *res)
 {
-	snd_soc_unregister_component(*(struct device **)res);
+	const struct snd_soc_component_driver **cmpnt_drv = res;
+
+	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
 }
 
 /**
@@ -28,7 +30,7 @@ int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *cmpnt_drv,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai)
 {
-	struct device **ptr;
+	const struct snd_soc_component_driver **ptr;
 	int ret;
 
 	ptr = devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
@@ -37,7 +39,7 @@ int devm_snd_soc_register_component(struct device *dev,
 
 	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai);
 	if (ret == 0) {
-		*ptr = dev;
+		*ptr = cmpnt_drv;
 		devres_add(dev, ptr);
 	} else {
 		devres_free(ptr);
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index f728309a0833..ab600be9e69f 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -490,7 +490,7 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
 
 	pcm = soc_component_to_pcm(component);
 
-	snd_soc_unregister_component(dev);
+	snd_soc_unregister_component_by_driver(dev, component->driver);
 	dmaengine_pcm_release_chan(pcm);
 	kfree(pcm);
 }
-- 
2.26.2

