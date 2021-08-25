Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 837E63F6E31
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 06:18:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E76251671;
	Wed, 25 Aug 2021 06:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E76251671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629865109;
	bh=H5xOl95ySJHvMRAxssWq1+b00P/3mPpiqTKOHJn+07g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=crBz84iMgmgfhrZGGc+XnN8UehumqU+IrinFLZjdIxvRvzfib6WHw/+YDbVNiX7hx
	 r77pBP9A874iPN8VJgOUG18yP3r3fX/75/6KrLhZx0WPgY7hfgGxdrbefqcCPUXH8+
	 PZvaqxIC2tprPYRTS3PyO6CFOb6KPfKkYMFDkkpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 502C7F8020D;
	Wed, 25 Aug 2021 06:17:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63346F8020C; Wed, 25 Aug 2021 06:17:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE7DAF800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 06:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE7DAF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="G/4OiGhx"
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id 17P4GiCL020114;
 Wed, 25 Aug 2021 13:16:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 17P4GiCL020114
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1629865005;
 bh=1wLIpiebg99hItGHemsWx98J3K7UeOaCPEUf3e672lI=;
 h=From:To:Cc:Subject:Date:From;
 b=G/4OiGhxHia4g/8G5CnboXu0wY5xACRJsnoAdK2dTPl34riwfFplzi3VHlywh+MAJ
 hKNh+ZS2zIOBG7qOMstqDjKNEO9c3XjkvH0IMPPvag3ZrM1U3F5eYNO1MCNWXhdlL4
 edVaM5S1Bg8xr4Pdi004/VBEYRhOx8xWeGU3Js2RQ8XvsET7Z5J5UhYhVHdCWMwVl7
 WTwU1l/W2ASLag6PijSV2aOgjDUGJ9v/4mqptuNV05Kq57wG60quq4Q+5wpmH505k/
 3F64jEe2OWzEqHuF33ACLjKt619ZKTFyaeQpGJkXFYEM2iirw/M7KzFHdpr9a2HTyf
 2i0P+Md1pa3Pw==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH] kconfig: forbid symbols that end with '_MODULE'
Date: Wed, 25 Aug 2021 13:16:37 +0900
Message-Id: <20210825041637.365171-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-wireless@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Luca Coelho <luciano.coelho@intel.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
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

Kconfig (syncconfig) generates include/generated/autoconf.h to make
CONFIG options available to the pre-processor.

The macros are suffixed with '_MODULE' for symbols with the value 'm'.

Here is a conflict; CONFIG_FOO=m results in '#define CONFIG_FOO_MODULE 1',
but CONFIG_FOO_MODULE=y also results in the same define.

fixdep always assumes CONFIG_FOO_MODULE comes from CONFIG_FOO=m, so the
dependency is not properly tracked for symbols that end with '_MODULE'.

This commit makes Kconfig error out if it finds a symbol suffixed with
'_MODULE'. This restriction does not exist if the module feature is not
supported (at least from the Kconfig perspective).

It detected one error:
  error: SND_SOC_DM365_VOICE_CODEC_MODULE: symbol name must not end with '_MODULE'

Rename it to SND_SOC_DM365_VOICE_CODEC_MODULAR. Commit 147162f57515
("ASoC: ti: fix SND_SOC_DM365_VOICE_CODEC dependencies") added it for
internal use. So, this renaming has no impact on users.

Remove a comment from drivers/net/wireless/intel/iwlwifi/Kconfig since
this is a hard error now.

Add a comment to include/linux/kconfig.h in order not to worry observant
developers.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/net/wireless/intel/iwlwifi/Kconfig |  1 -
 include/linux/kconfig.h                    |  3 ++
 scripts/kconfig/parser.y                   | 40 +++++++++++++++++++++-
 sound/soc/ti/Kconfig                       |  2 +-
 4 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/Kconfig b/drivers/net/wireless/intel/iwlwifi/Kconfig
index 1085afbefba8..5b238243617c 100644
--- a/drivers/net/wireless/intel/iwlwifi/Kconfig
+++ b/drivers/net/wireless/intel/iwlwifi/Kconfig
@@ -70,7 +70,6 @@ config IWLMVM
 	  of the devices that use this firmware is available here:
 	  https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi#firmware
 
-# don't call it _MODULE -- will confuse Kconfig/fixdep/...
 config IWLWIFI_OPMODE_MODULAR
 	bool
 	default y if IWLDVM=m
diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
index 20d1079e92b4..54f677e742fe 100644
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@ -53,6 +53,9 @@
  * IS_MODULE(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'm', 0
  * otherwise.  CONFIG_FOO=m results in "#define CONFIG_FOO_MODULE 1" in
  * autoconf.h.
+ * CONFIG_FOO_MODULE=y would also result in "#define CONFIG_FOO_MODULE 1",
+ * but Kconfig forbids symbol names that end with '_MODULE', so that would
+ * not happen.
  */
 #define IS_MODULE(option) __is_defined(option##_MODULE)
 
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 2af7ce4e1531..b0f73f74ccd3 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -475,6 +475,37 @@ assign_val:
 
 %%
 
+/*
+ * Symbols suffixed with '_MODULE' would cause a macro conflict in autoconf.h,
+ * and also confuse the interaction between syncconfig and fixdep.
+ * Error out if a symbol with the '_MODULE' suffix is found.
+ */
+static int sym_check_name(struct symbol *sym)
+{
+	static const char *suffix = "_MODULE";
+	static const size_t suffix_len = strlen("_MODULE");
+	char *name;
+	size_t len;
+
+	name = sym->name;
+
+	if (!name)
+		return 0;
+
+	len = strlen(name);
+
+	if (len < suffix_len)
+		return 0;
+
+	if (strcmp(name + len - suffix_len, suffix))
+		return 0;
+
+	fprintf(stderr, "error: %s: symbol name must not end with '%s'\n",
+		name, suffix);
+
+	return -1;
+}
+
 void conf_parse(const char *name)
 {
 	struct symbol *sym;
@@ -493,8 +524,15 @@ void conf_parse(const char *name)
 
 	if (yynerrs)
 		exit(1);
-	if (!modules_sym)
+
+	if (modules_sym) {
+		for_all_symbols(i, sym) {
+			if (sym_check_name(sym))
+				yynerrs++;
+		}
+	} else {
 		modules_sym = sym_find( "n" );
+	}
 
 	if (!menu_has_prompt(&rootmenu)) {
 		current_entry = &rootmenu;
diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 698d7bc84dcf..c56a5789056f 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -211,7 +211,7 @@ config SND_SOC_DM365_VOICE_CODEC
 	  Say Y if you want to add support for SoC On-chip voice codec
 endchoice
 
-config SND_SOC_DM365_VOICE_CODEC_MODULE
+config SND_SOC_DM365_VOICE_CODEC_MODULAR
 	def_tristate y
 	depends on SND_SOC_DM365_VOICE_CODEC && SND_SOC
 	select MFD_DAVINCI_VOICECODEC
-- 
2.30.2

