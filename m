Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D6A520252
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 18:25:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 658B31910;
	Mon,  9 May 2022 18:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 658B31910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652113549;
	bh=SrbmG/FGRx9mnqf8kRpRVHkNIYGrA6qPuY6/5C7xAUA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u4iTdgVRZeGnY6NK9EOceMd4WtzOe7OIIQkB36BOf+8bhOTUjow5u4iQSWcka35sk
	 UGVowv/SdWAFRH2gXieAymUtDfJ9CmB91sbqvYnw+0OytXFZ/63MYM/DVZ4tBjGaNx
	 g45baqiujyRPIBkqTiXsbwGGWoFYqrx8zas9GekE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6ADCF80528;
	Mon,  9 May 2022 18:23:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89808F80517; Mon,  9 May 2022 18:23:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3628EF80237
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 18:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3628EF80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AmChdpm2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B97EE6134F;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18849C385B4;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652113423;
 bh=SrbmG/FGRx9mnqf8kRpRVHkNIYGrA6qPuY6/5C7xAUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AmChdpm2bT+XTKXg+8kYfVM7LxKIWNgM4goPhOfYiYSWw4CiCCo2E/MZSIQFuRSfh
 MIJoAEQmQdM2C3B3XarTl3M2BrWjFAo1to6WoXpiKTeUm5CgMeaqmweC6dk/1W3xHF
 4OZhPQgZZbi6qjPoGvMAgSqkYAnXTM/BKu2rnAyq4/xF2gPYwRNvBzIORdgziRBDHl
 lnpFNKHt3j+6Oym4NFljcYgzzoRcf6vN/YIefNU3j1gdpKsfB9HZJ4LHrtJv9Tvoss
 SeOcaH/Q3laiieFCuc7k8KOhnGXys7N6Yfuuh0DO1cbB45acuDBzlDKuLGjZPUWLpj
 xXIWzCeTRfdCg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1no6Ae-006xVS-Hw; Mon, 09 May 2022 18:23:40 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v6 2/4] module: update dependencies at try_module_get()
Date: Mon,  9 May 2022 18:23:37 +0200
Message-Id: <28a942f860ccdee05751dcccc74b70e9d64f2b94.1652113087.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652113087.git.mchehab@kernel.org>
References: <cover.1652113087.git.mchehab@kernel.org>
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v6 0/4] at: https://lore.kernel.org/all/cover.1652113087.git.mchehab@kernel.org/

 include/linux/module.h |  8 +++--
 kernel/module/main.c   | 73 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 64 insertions(+), 17 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 77961f5773b6..a66b9be92ef5 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -618,12 +618,12 @@ extern void __module_get(struct module *module);
 
 /* This is the Right Way to get a module: if it fails, it's being removed,
  * so pretend it's not there. */
-extern bool try_module_get(struct module *module);
+extern bool try_module_get_owner(struct module *module, struct module *this);
 
 extern void module_put(struct module *module);
 
 #else /*!CONFIG_MODULE_UNLOAD*/
-static inline bool try_module_get(struct module *module)
+static inline bool try_module_get_owner(struct module *module, struct module *this)
 {
 	return !module || module_is_live(module);
 }
@@ -752,7 +752,7 @@ static inline void __module_get(struct module *module)
 {
 }
 
-static inline bool try_module_get(struct module *module)
+static inline bool try_module_get_owner(struct module *module, struct module *this)
 {
 	return true;
 }
@@ -893,6 +893,8 @@ static inline bool module_sig_ok(struct module *module)
 }
 #endif	/* CONFIG_MODULE_SIG */
 
+#define try_module_get(mod) try_module_get_owner(mod, THIS_MODULE)
+
 int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
 					     struct module *, unsigned long),
 				   void *data);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index fe44d46c378b..6044aeba0f18 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -139,6 +139,24 @@ int unregister_module_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL(unregister_module_notifier);
 
+static bool __try_module_get(struct module *module)
+{
+	bool ret = true;
+
+	if (module) {
+		preempt_disable();
+		/* Note: here, we can fail to get a reference */
+		if (likely(module_is_live(module) &&
+			   atomic_inc_not_zero(&module->refcnt) != 0))
+			trace_module_get(module, _RET_IP_);
+		else
+			ret = false;
+
+		preempt_enable();
+	}
+	return ret;
+}
+
 /*
  * We require a truly strong try_module_get(): 0 means success.
  * Otherwise an error is returned due to ongoing or failed
@@ -149,7 +167,7 @@ static inline int strong_try_module_get(struct module *mod)
 	BUG_ON(mod && mod->state == MODULE_STATE_UNFORMED);
 	if (mod && mod->state == MODULE_STATE_COMING)
 		return -EBUSY;
-	if (try_module_get(mod))
+	if (__try_module_get(mod))
 		return 0;
 	else
 		return -ENOENT;
@@ -620,6 +638,41 @@ static int ref_module(struct module *a, struct module *b)
 	return 0;
 }
 
+static int ref_module_dependency(struct module *mod, struct module *this)
+{
+	int ret = 0;
+
+	if (!this || !mod || !this->name || !mod->holders_dir)
+		return -EINVAL;
+
+	if (mod == this)
+		return 0;
+
+	mutex_lock(&module_mutex);
+
+	if (already_uses(this, mod))
+		goto ret;
+
+	ret = strong_try_module_get(mod);
+	if (ret)
+		goto ret;
+
+	ret = add_module_usage(this, mod);
+	if (ret) {
+		module_put(mod);
+		goto ret;
+	}
+
+#ifdef CONFIG_MODULE_UNLOAD
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
@@ -830,24 +883,16 @@ void __module_get(struct module *module)
 }
 EXPORT_SYMBOL(__module_get);
 
-bool try_module_get(struct module *module)
+bool try_module_get_owner(struct module *module, struct module *this)
 {
-	bool ret = true;
+	int ret = __try_module_get(module);
 
-	if (module) {
-		preempt_disable();
-		/* Note: here, we can fail to get a reference */
-		if (likely(module_is_live(module) &&
-			   atomic_inc_not_zero(&module->refcnt) != 0))
-			trace_module_get(module, _RET_IP_);
-		else
-			ret = false;
+	if (ret)
+		ref_module_dependency(module, this);
 
-		preempt_enable();
-	}
 	return ret;
 }
-EXPORT_SYMBOL(try_module_get);
+EXPORT_SYMBOL(try_module_get_owner);
 
 void module_put(struct module *module)
 {
-- 
2.35.3

