Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D487F549BE7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 20:42:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3526B1705;
	Mon, 13 Jun 2022 20:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3526B1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655145721;
	bh=omflTxFOUXgdLHAdSRJVGbZ7Ijrh5tinKCNQUnvTTQc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hUrQGPnoN0jQ+kba81YaFBR/6MnaGvHT8P9yxq+xwr98wpPsaIeotb41l/qDJ3nbG
	 EsjngGpy6MVdc59RdEakyVJIaMGx5RAmuD3sH5fLmVHaQk1CzTkawcTRaav+dU7nUR
	 9ftv8Y1ePD5nHuE09Gz9u1GfBU7zjbxwhK9dWx3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9147AF800D8;
	Mon, 13 Jun 2022 20:41:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCE4AF800D8; Mon, 13 Jun 2022 20:40:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B129FF800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 20:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B129FF800D8
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP
 (IdeaSmtpServer 5.0.0)
 id e7c7bd5c0a89f666; Mon, 13 Jun 2022 20:40:52 +0200
Received: from kreacher.localnet (unknown [213.134.187.64])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v370.home.net.pl (Postfix) with ESMTPSA id 238C466C81D;
 Mon, 13 Jun 2022 20:40:51 +0200 (CEST)
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Subject: [PATCH v2 14/16] soundwire: Use acpi_dev_for_each_child()
Date: Mon, 13 Jun 2022 20:35:26 +0200
Message-ID: <9017824.rMLUfLXkoz@kreacher>
In-Reply-To: <2653857.mvXUDI8C0e@kreacher>
References: <1843211.tdWV9SEqCh@kreacher> <2653857.mvXUDI8C0e@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.187.64
X-CLIENT-HOSTNAME: 213.134.187.64
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffogffrnfdpggftiffpkfenuceurghilhhouhhtmecuudehtdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfggfgtgesthfuredttddtjeenucfhrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqeenucggtffrrghtthgvrhhnpedvffeuiedtgfdvtddugeeujedtffetteegfeekffdvfedttddtuefhgeefvdejhfenucfkphepvddufedrudefgedrudekjedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddufedrudefgedrudekjedrieegpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehlihhnuhigqdgrtghpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhpmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhi
 nhhtvghlrdgtohhmpdhrtghpthhtohepmhhikhgrrdifvghsthgvrhgsvghrgheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihunhhgqdgthhhurghnrdhlihgroheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehpihgvrhhrvgdqlhhouhhishdrsghoshhsrghrtheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehsrghnhihoghdrrhdrkhgrlhgvsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrgh
X-DCC--Metrics: v370.home.net.pl 1024; Body=12 Fuz1=12 Fuz2=12
Cc: alsa-devel@alsa-project.org, Linux PM <linux-pm@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Instead of walking the list of children of an ACPI device directly,
use acpi_dev_for_each_child() to carry out an action for all of
the given ACPI device's children.

This will help to eliminate the children list head from struct
acpi_device as it is redundant and it is used in questionable ways
in some places (in particular, locking is needed for walking the
list pointed to it safely, but it is often missing).

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---

v1 -> v2:
   * Make sure errors are not lost (Pierre-Louis).
   * Add R-by and T-by from Pierre-Louis.

---
 drivers/soundwire/slave.c |  117 ++++++++++++++++++++++++++--------------------
 1 file changed, 67 insertions(+), 50 deletions(-)

Index: linux-pm/drivers/soundwire/slave.c
===================================================================
--- linux-pm.orig/drivers/soundwire/slave.c
+++ linux-pm/drivers/soundwire/slave.c
@@ -127,6 +127,71 @@ static bool find_slave(struct sdw_bus *b
 	return true;
 }
 
+struct sdw_acpi_child_walk_data {
+	struct sdw_bus *bus;
+	struct acpi_device *adev;
+	struct sdw_slave_id id;
+	bool ignore_unique_id;
+};
+
+static int sdw_acpi_check_duplicate(struct acpi_device *adev, void *data)
+{
+	struct sdw_acpi_child_walk_data *cwd = data;
+	struct sdw_bus *bus = cwd->bus;
+	struct sdw_slave_id id;
+
+	if (adev == cwd->adev)
+		return 0;
+
+	if (!find_slave(bus, adev, &id))
+		return 0;
+
+	if (cwd->id.sdw_version != id.sdw_version || cwd->id.mfg_id != id.mfg_id ||
+	    cwd->id.part_id != id.part_id || cwd->id.class_id != id.class_id)
+		return 0;
+
+	if (cwd->id.unique_id != id.unique_id) {
+		dev_dbg(bus->dev,
+			"Valid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
+			cwd->id.unique_id, id.unique_id, cwd->id.mfg_id,
+			cwd->id.part_id);
+		cwd->ignore_unique_id = false;
+		return 0;
+	}
+
+	dev_err(bus->dev,
+		"Invalid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
+		cwd->id.unique_id, id.unique_id, cwd->id.mfg_id, cwd->id.part_id);
+	return -ENODEV;
+}
+
+static int sdw_acpi_find_one(struct acpi_device *adev, void *data)
+{
+	struct sdw_bus *bus = data;
+	struct sdw_acpi_child_walk_data cwd = {
+		.bus = bus,
+		.adev = adev,
+		.ignore_unique_id = true,
+	};
+	int ret;
+
+	if (!find_slave(bus, adev, &cwd.id))
+		return 0;
+
+	/* Brute-force O(N^2) search for duplicates. */
+	ret = acpi_dev_for_each_child(ACPI_COMPANION(bus->dev),
+				      sdw_acpi_check_duplicate, &cwd);
+	if (ret)
+		return ret;
+
+	if (cwd.ignore_unique_id)
+		cwd.id.unique_id = SDW_IGNORED_UNIQUE_ID;
+
+	/* Ignore errors and continue. */
+	sdw_slave_add(bus, &cwd.id, acpi_fwnode_handle(adev));
+	return 0;
+}
+
 /*
  * sdw_acpi_find_slaves() - Find Slave devices in Master ACPI node
  * @bus: SDW bus instance
@@ -135,8 +200,7 @@ static bool find_slave(struct sdw_bus *b
  */
 int sdw_acpi_find_slaves(struct sdw_bus *bus)
 {
-	struct acpi_device *adev, *parent;
-	struct acpi_device *adev2, *parent2;
+	struct acpi_device *parent;
 
 	parent = ACPI_COMPANION(bus->dev);
 	if (!parent) {
@@ -144,54 +208,7 @@ int sdw_acpi_find_slaves(struct sdw_bus
 		return -ENODEV;
 	}
 
-	list_for_each_entry(adev, &parent->children, node) {
-		struct sdw_slave_id id;
-		struct sdw_slave_id id2;
-		bool ignore_unique_id = true;
-
-		if (!find_slave(bus, adev, &id))
-			continue;
-
-		/* brute-force O(N^2) search for duplicates */
-		parent2 = parent;
-		list_for_each_entry(adev2, &parent2->children, node) {
-
-			if (adev == adev2)
-				continue;
-
-			if (!find_slave(bus, adev2, &id2))
-				continue;
-
-			if (id.sdw_version != id2.sdw_version ||
-			    id.mfg_id != id2.mfg_id ||
-			    id.part_id != id2.part_id ||
-			    id.class_id != id2.class_id)
-				continue;
-
-			if (id.unique_id != id2.unique_id) {
-				dev_dbg(bus->dev,
-					"Valid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
-					id.unique_id, id2.unique_id, id.mfg_id, id.part_id);
-				ignore_unique_id = false;
-			} else {
-				dev_err(bus->dev,
-					"Invalid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
-					id.unique_id, id2.unique_id, id.mfg_id, id.part_id);
-				return -ENODEV;
-			}
-		}
-
-		if (ignore_unique_id)
-			id.unique_id = SDW_IGNORED_UNIQUE_ID;
-
-		/*
-		 * don't error check for sdw_slave_add as we want to continue
-		 * adding Slaves
-		 */
-		sdw_slave_add(bus, &id, acpi_fwnode_handle(adev));
-	}
-
-	return 0;
+	return acpi_dev_for_each_child(parent, sdw_acpi_find_one, bus);
 }
 
 #endif



