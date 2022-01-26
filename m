Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 123EB49D2B1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 20:50:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908F71A96;
	Wed, 26 Jan 2022 20:49:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908F71A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643226607;
	bh=60zn+ONV7QWtY+Fq0JquqM1ewr06H5tN1D+qvJ3hg0E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f6mftZGFvjXNhaEM0fVjyYA/JM3C0FvzkZtB+4fEUPxhSV0yUSxmcLOuMPBODAcMY
	 cycWDXX7gN2+EE433KM3CL+O79cOdRYejcM6erH2ZNEo2v1eyTM1QWf/9ECcmw34cj
	 rqjwuZAh6/NA4jiSggGRgmYvQbWlzdGlKrad4sdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01624F804BC;
	Wed, 26 Jan 2022 20:49:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83E7EF8049C; Wed, 26 Jan 2022 20:48:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1CDCF80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 20:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1CDCF80118
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP
 (IdeaSmtpServer 4.0.0)
 id 83b28c23bf1a1938; Wed, 26 Jan 2022 20:48:51 +0100
Received: from kreacher.localnet (unknown [213.134.162.63])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v370.home.net.pl (Postfix) with ESMTPSA id 9AD6666B306;
 Wed, 26 Jan 2022 20:48:50 +0100 (CET)
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] sound: Replace acpi_bus_get_device()
Date: Wed, 26 Jan 2022 20:48:49 +0100
Message-ID: <2828205.e9J7NaK4W3@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.162.63
X-CLIENT-HOSTNAME: 213.134.162.63
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrfedugdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkggfgtgesthfuredttddtjeenucfhrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqeenucggtffrrghtthgvrhhnpefhgedtffejheekgeeljeevvedtuefgffeiieejuddutdekgfejvdehueejjeetvdenucfkphepvddufedrudefgedrudeivddrieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddufedrudefgedrudeivddrieefpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrtghpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehpihgvrhhr
 vgdqlhhouhhishdrsghoshhsrghrtheslhhinhhugidrihhnthgvlhdrtghomh
X-DCC--Metrics: v370.home.net.pl 1024; Body=5 Fuz1=5 Fuz2=5
Cc: Linux ACPI <linux-acpi@vger.kernel.org>, alsa-devel@alsa-project.org,
 LKML <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Replace acpi_bus_get_device() that is going to be dropped with
acpi_fetch_acpi_dev().

No intentional functional impact.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 sound/hda/intel-sdw-acpi.c |    7 +++----
 sound/soc/soc-acpi.c       |    7 ++-----
 2 files changed, 5 insertions(+), 9 deletions(-)

Index: linux-pm/sound/hda/intel-sdw-acpi.c
===================================================================
--- linux-pm.orig/sound/hda/intel-sdw-acpi.c
+++ linux-pm/sound/hda/intel-sdw-acpi.c
@@ -50,11 +50,11 @@ static bool is_link_enabled(struct fwnod
 static int
 sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 {
-	struct acpi_device *adev;
+	struct acpi_device *adev = acpi_fetch_acpi_dev(info->handle);
 	int ret, i;
 	u8 count;
 
-	if (acpi_bus_get_device(info->handle, &adev))
+	if (!adev)
 		return -EINVAL;
 
 	/* Found controller, find links supported */
@@ -119,7 +119,6 @@ static acpi_status sdw_intel_acpi_cb(acp
 				     void *cdata, void **return_value)
 {
 	struct sdw_intel_acpi_info *info = cdata;
-	struct acpi_device *adev;
 	acpi_status status;
 	u64 adr;
 
@@ -127,7 +126,7 @@ static acpi_status sdw_intel_acpi_cb(acp
 	if (ACPI_FAILURE(status))
 		return AE_OK; /* keep going */
 
-	if (acpi_bus_get_device(handle, &adev)) {
+	if (!acpi_fetch_acpi_dev(handle)) {
 		pr_err("%s: Couldn't find ACPI handle\n", __func__);
 		return AE_NOT_FOUND;
 	}
Index: linux-pm/sound/soc/soc-acpi.c
===================================================================
--- linux-pm.orig/sound/soc/soc-acpi.c
+++ linux-pm/sound/soc/soc-acpi.c
@@ -55,16 +55,13 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_find_mach
 static acpi_status snd_soc_acpi_find_package(acpi_handle handle, u32 level,
 					     void *context, void **ret)
 {
-	struct acpi_device *adev;
+	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
 	acpi_status status;
 	struct snd_soc_acpi_package_context *pkg_ctx = context;
 
 	pkg_ctx->data_valid = false;
 
-	if (acpi_bus_get_device(handle, &adev))
-		return AE_OK;
-
-	if (adev->status.present && adev->status.functional) {
+	if (adev && adev->status.present && adev->status.functional) {
 		struct acpi_buffer buffer = {ACPI_ALLOCATE_BUFFER, NULL};
 		union acpi_object  *myobj = NULL;
 



