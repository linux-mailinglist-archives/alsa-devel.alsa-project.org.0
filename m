Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F01434FB8
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 18:06:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 267CE1657;
	Wed, 20 Oct 2021 18:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 267CE1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634746016;
	bh=TwW4q6lk3RCh90oYRPuCh09c+UVbE1l7vAgBpeiM9w4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=reswksXIfzuK1hnyUdFykECaJrZQFMM6mCjTt4TpWzEqBGKznKVHGEPz9Tf6P7Ezl
	 AuSRVHS9291dijC1NNHPyRHdv+Z9JjjgGerl9xUrBQqkWDbMK+PO831QFiIeT+SHty
	 /vQ0mUGKrAvA2HxD4KOocmFtCIkD55x7mn/kS2wM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA178F8050F;
	Wed, 20 Oct 2021 18:04:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC57CF80515; Wed, 20 Oct 2021 18:04:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64DA9F80510
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 18:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64DA9F80510
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="292280262"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="292280262"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 08:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="494685500"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.56])
 by orsmga008.jf.intel.com with ESMTP; 20 Oct 2021 08:59:34 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 6/6] ASoC: Intel: soc-acpi: use const for all uses of
 snd_soc_acpi_codecs
Date: Wed, 20 Oct 2021 23:57:15 +0800
Message-Id: <20211020155715.2045947-7-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020155715.2045947-1-brent.lu@intel.com>
References: <20211020155715.2045947-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Gongjun Song <gongjun.song@intel.com>,
 Bard Liao <bard.liao@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Brent Lu <brent.lu@intel.com>,
 Libin Yang <libin.yang@intel.com>, Huajun Li <huajun.li@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

'const' qualifiers are missing on some platforms, add as needed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c |  2 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c |  8 ++++----
 sound/soc/intel/common/soc-acpi-intel-glk-match.c |  2 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c |  8 ++++----
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c | 12 ++++++------
 sound/soc/intel/common/soc-acpi-intel-skl-match.c |  2 +-
 6 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
index 78cfdc48ad45..342d34052204 100644
--- a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
@@ -41,7 +41,7 @@ static struct snd_soc_acpi_mach *apl_quirk(void *arg)
 	return mach;
 }
 
-static struct snd_soc_acpi_codecs bxt_codecs = {
+static const struct snd_soc_acpi_codecs bxt_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index b591c6fd13fd..b4eb0c97edf1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -9,22 +9,22 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
-static struct snd_soc_acpi_codecs rt1011_spk_codecs = {
+static const struct snd_soc_acpi_codecs rt1011_spk_codecs = {
 	.num_codecs = 1,
 	.codecs = {"10EC1011"}
 };
 
-static struct snd_soc_acpi_codecs rt1015_spk_codecs = {
+static const struct snd_soc_acpi_codecs rt1015_spk_codecs = {
 	.num_codecs = 1,
 	.codecs = {"10EC1015"}
 };
 
-static struct snd_soc_acpi_codecs max98357a_spk_codecs = {
+static const struct snd_soc_acpi_codecs max98357a_spk_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
 };
 
-static struct snd_soc_acpi_codecs max98390_spk_codecs = {
+static const struct snd_soc_acpi_codecs max98390_spk_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98390"}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 32fff9389eb3..904ec0abeca5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -9,7 +9,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
-static struct snd_soc_acpi_codecs glk_codecs = {
+static const struct snd_soc_acpi_codecs glk_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 46aa96bfbf14..2a4eb39ebff7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -9,22 +9,22 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
-static struct snd_soc_acpi_codecs jsl_7219_98373_codecs = {
+static const struct snd_soc_acpi_codecs jsl_7219_98373_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
 };
 
-static struct snd_soc_acpi_codecs rt1015_spk = {
+static const struct snd_soc_acpi_codecs rt1015_spk = {
 	.num_codecs = 1,
 	.codecs = {"10EC1015"}
 };
 
-static struct snd_soc_acpi_codecs rt1015p_spk = {
+static const struct snd_soc_acpi_codecs rt1015p_spk = {
 	.num_codecs = 1,
 	.codecs = {"RTL1015"}
 };
 
-static struct snd_soc_acpi_codecs mx98360a_spk = {
+static const struct snd_soc_acpi_codecs mx98360a_spk = {
 	.num_codecs = 1,
 	.codecs = {"MX98360A"}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
index 741bf2f9e081..4e817f559d38 100644
--- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
@@ -12,32 +12,32 @@
 
 static struct skl_machine_pdata skl_dmic_data;
 
-static struct snd_soc_acpi_codecs kbl_codecs = {
+static const struct snd_soc_acpi_codecs kbl_codecs = {
 	.num_codecs = 1,
 	.codecs = {"10508825"}
 };
 
-static struct snd_soc_acpi_codecs kbl_poppy_codecs = {
+static const struct snd_soc_acpi_codecs kbl_poppy_codecs = {
 	.num_codecs = 1,
 	.codecs = {"10EC5663"}
 };
 
-static struct snd_soc_acpi_codecs kbl_5663_5514_codecs = {
+static const struct snd_soc_acpi_codecs kbl_5663_5514_codecs = {
 	.num_codecs = 2,
 	.codecs = {"10EC5663", "10EC5514"}
 };
 
-static struct snd_soc_acpi_codecs kbl_7219_98357_codecs = {
+static const struct snd_soc_acpi_codecs kbl_7219_98357_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
 };
 
-static struct snd_soc_acpi_codecs kbl_7219_98927_codecs = {
+static const struct snd_soc_acpi_codecs kbl_7219_98927_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98927"}
 };
 
-static struct snd_soc_acpi_codecs kbl_7219_98373_codecs = {
+static const struct snd_soc_acpi_codecs kbl_7219_98373_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-skl-match.c b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
index 961df8d6b5e4..75302e956742 100644
--- a/sound/soc/intel/common/soc-acpi-intel-skl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
@@ -12,7 +12,7 @@
 
 static struct skl_machine_pdata skl_dmic_data;
 
-static struct snd_soc_acpi_codecs skl_codecs = {
+static const struct snd_soc_acpi_codecs skl_codecs = {
 	.num_codecs = 1,
 	.codecs = {"10508825"}
 };
-- 
2.25.1

