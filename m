Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E860B515C4D
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 12:32:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82601822;
	Sat, 30 Apr 2022 12:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82601822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651314768;
	bh=5a3g5n+qmEd88ekG2DL7ECt9MM1yHMe0jnzyEtuLpqg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JSf6CLBLuW4ZcGEyHfRLQWpX2Yrw0yDT3FLswJmlAIaetKtheGUQ+SywoehEHDzRe
	 P9t5vA0Rcv8KSzktgfhs08rJTzMyosMPnqW30mnph/vU+SRoNC/xKh9wA6lL3/72pW
	 KShzlCLB+GvoaJtuIer7zIjDVqh5UPyNNFJeyKDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB09EF80246;
	Sat, 30 Apr 2022 12:31:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D6EAF804ED; Sat, 30 Apr 2022 12:31:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06821F800E9
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 12:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06821F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gAOGtCXn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11FD8B80123;
 Sat, 30 Apr 2022 10:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B45AC385B0;
 Sat, 30 Apr 2022 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651314668;
 bh=5a3g5n+qmEd88ekG2DL7ECt9MM1yHMe0jnzyEtuLpqg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gAOGtCXn9lgpRzyoj/fqa0aPc3jhw1Jqo+MSKNxwVE+IUgMVRpGTf4OVtLZdSeZqd
 wzjmUKJAtT22aRbMgAPxuz9GQUEYery/ELlun2DLAoz4nAWVKdJoKcandelji+33q4
 fGaWOQOJcG0O89lfSGUZjTc7SB2nVxzbJbHQxYaFjuqGCSAznmzGifz9TAn5SMrf1Q
 PI8UwQorA626qDLrprZknbQa7iTyKQ7iF9pfgpqLHiLM4Tdq5yUXcJXxaai4gr4NhE
 xnFMc7czngQdUywPIYRNYuvNTjBhiiPK+QP50B9IVurAYM35wbS13rciykpn4LD+UZ
 xIGETWKHKhZwA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nkkNQ-001lBO-G4; Sat, 30 Apr 2022 11:31:00 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v2 1/2] module: update dependencies at try_module_get()
Date: Sat, 30 Apr 2022 11:30:58 +0100
Message-Id: <3c7547d551558c9da02038dda45992f91b1f5141.1651314499.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651314499.git.mchehab@kernel.org>
References: <cover.1651314499.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Kai Vehmanen <kai.vehmanen@intel.com>, linux-modules@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

Sometimes, device drivers are bound into each other via try_module_get(),
making such references invisible when looking at /proc/modules or lsmod.

Add a function to allow setting up module references for such
cases, and call it when try_module_get() is used.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v2 0/2] at: https://lore.kernel.org/all/cover.1651314499.git.mchehab@kernel.org/

 include/linux/module.h |  4 +++-
 kernel/module/main.c   | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 46d4d5f2516e..836851baaad4 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -620,7 +620,9 @@ extern void __module_get(struct module *module);
 
 /* This is the Right Way to get a module: if it fails, it's being removed,
  * so pretend it's not there. */
-extern bool try_module_get(struct module *module);
+extern bool __try_module_get(struct module *module, struct module *this);
+
+#define try_module_get(mod) __try_module_get(mod, THIS_MODULE)
 
 extern void module_put(struct module *module);
 
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 05a42d8fcd7a..9f4416381e65 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -631,6 +631,35 @@ static int ref_module(struct module *a, struct module *b)
 	return 0;
 }
 
+static int ref_module_dependency(struct module *mod,
+				       struct module *this)
+{
+	int ret;
+
+	if (!this || !this->name) {
+		return -EINVAL;
+	}
+
+	if (mod == this)
+		return 0;
+
+	mutex_lock(&module_mutex);
+
+	ret = ref_module(this, mod);
+
+#ifdef CONFIG_MODULE_UNLOAD
+	if (ret)
+		goto ret;
+
+	ret = sysfs_create_link(mod->holders_dir,
+				&this->mkobj.kobj, this->name);
+#endif
+
+ret:
+	mutex_unlock(&module_mutex);
+	return ret;
+}
+
 /* Clear the unload stuff of the module. */
 static void module_unload_free(struct module *mod)
 {
@@ -841,7 +870,7 @@ void __module_get(struct module *module)
 }
 EXPORT_SYMBOL(__module_get);
 
-bool try_module_get(struct module *module)
+bool __try_module_get(struct module *module, struct module *this)
 {
 	bool ret = true;
 
@@ -856,9 +885,11 @@ bool try_module_get(struct module *module)
 
 		preempt_enable();
 	}
+	if (ret)
+		ref_module_dependency(module, this);
 	return ret;
 }
-EXPORT_SYMBOL(try_module_get);
+EXPORT_SYMBOL(__try_module_get);
 
 void module_put(struct module *module)
 {
-- 
2.35.1

