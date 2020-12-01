Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EF72C99C1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 09:44:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D87C179D;
	Tue,  1 Dec 2020 09:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D87C179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606812261;
	bh=RULwP8ATw1F/OvaLHjSzChb2K6P1Kgx2O7bhX97IpT8=;
	h=Subject:To:From:Date:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ox2BsPtYh2qEvOnMy8fMIM1gBfadArzAQnV4ho2HUyHfssRIU+0R9D/CbmsY1H1fs
	 BUI0bVufx/1YEWPdX3CkPucVN0vlLNm0hYasNrQL0D+uhOOKJvzOaJHNA0ULz2wwfx
	 Q9Zzhe6LcPgZbJFqXwLeH2qY/IH65T42ER4+OlS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9062CF804C2;
	Tue,  1 Dec 2020 09:42:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EE14F80277; Tue,  1 Dec 2020 09:41:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0B30F80254
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 09:41:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0B30F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Hd3Lg2RP"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55C11216C4;
 Tue,  1 Dec 2020 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606812112;
 bh=RULwP8ATw1F/OvaLHjSzChb2K6P1Kgx2O7bhX97IpT8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=Hd3Lg2RPghKzMNUo45K1Lv9BMEIBG6VQQ0X2JYEDb0F7hzHEdDPLraSgAxhoo1DsX
 goLCuXtedzCUQdNo+XecVXn3HnkFF07zdReUEw2u8dCwjZbrw9zY+PhpTVLXrmKT1u
 4AQBgUXI9iodDLzp4N3KPpBj/1GjvHHp4hsxrW58=
Subject: Patch "ASoC: Intel: Skylake: Automatic DMIC format configuration
 according to information from NHLT" has been added to the 5.4-stable tree
To: alsa-devel@alsa-project.org, broonie@kernel.org, cezary.rojewski@intel.com,
 gregkh@linuxfoundation.org, mateusz.gorski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Dec 2020 09:42:54 +0100
In-Reply-To: <20201129114148.13772-9-cezary.rojewski@intel.com>
Message-ID: <1606812174145176@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
Cc: stable-commits@vger.kernel.org
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


This is a note to let you know that I've just added the patch titled

    ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHLT

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     asoc-intel-skylake-automatic-dmic-format-configuration-according-to-information-from-nhlt.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Tue Dec  1 09:41:56 AM CET 2020
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Sun, 29 Nov 2020 12:41:48 +0100
Subject: ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHLT
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com, mateusz.gorski@linux.intel.com
Message-ID: <20201129114148.13772-9-cezary.rojewski@intel.com>

From: Mateusz Gorski <mateusz.gorski@linux.intel.com>

commit 2d744ecf2b98405723a2138a547e5c75009bc4e5 upstream.

Automatically choose DMIC pipeline format configuration depending on
information included in NHLT.
Change the access rights of appropriate kcontrols to read-only in order
to prevent user interference.

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200427132727.24942-4-mateusz.gorski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org> # 5.4.x
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/uapi/sound/skl-tplg-interface.h |    1 
 sound/soc/intel/skylake/skl-topology.c  |   64 ++++++++++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 3 deletions(-)

--- a/include/uapi/sound/skl-tplg-interface.h
+++ b/include/uapi/sound/skl-tplg-interface.h
@@ -19,6 +19,7 @@
 #define SKL_CONTROL_TYPE_BYTE_TLV	0x100
 #define SKL_CONTROL_TYPE_MIC_SELECT	0x102
 #define SKL_CONTROL_TYPE_MULTI_IO_SELECT	0x103
+#define SKL_CONTROL_TYPE_MULTI_IO_SELECT_DMIC	0x104
 
 #define HDA_SST_CFG_MAX	900 /* size of copier cfg*/
 #define MAX_IN_QUEUE 8
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -1405,6 +1405,18 @@ static int skl_tplg_multi_config_set(str
 	return skl_tplg_multi_config_set_get(kcontrol, ucontrol, true);
 }
 
+static int skl_tplg_multi_config_get_dmic(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	return skl_tplg_multi_config_set_get(kcontrol, ucontrol, false);
+}
+
+static int skl_tplg_multi_config_set_dmic(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	return skl_tplg_multi_config_set_get(kcontrol, ucontrol, true);
+}
+
 static int skl_tplg_tlv_control_get(struct snd_kcontrol *kcontrol,
 			unsigned int __user *data, unsigned int size)
 {
@@ -1949,6 +1961,11 @@ static const struct snd_soc_tplg_kcontro
 		.get = skl_tplg_multi_config_get,
 		.put = skl_tplg_multi_config_set,
 	},
+	{
+		.id = SKL_CONTROL_TYPE_MULTI_IO_SELECT_DMIC,
+		.get = skl_tplg_multi_config_get_dmic,
+		.put = skl_tplg_multi_config_set_dmic,
+	}
 };
 
 static int skl_tplg_fill_pipe_cfg(struct device *dev,
@@ -3109,12 +3126,21 @@ static int skl_tplg_control_load(struct
 	case SND_SOC_TPLG_CTL_ENUM:
 		tplg_ec = container_of(hdr,
 				struct snd_soc_tplg_enum_control, hdr);
-		if (kctl->access & SNDRV_CTL_ELEM_ACCESS_READWRITE) {
+		if (kctl->access & SNDRV_CTL_ELEM_ACCESS_READ) {
 			se = (struct soc_enum *)kctl->private_value;
 			if (tplg_ec->priv.size)
-				return skl_init_enum_data(bus->dev, se,
-						tplg_ec);
+				skl_init_enum_data(bus->dev, se, tplg_ec);
 		}
+
+		/*
+		 * now that the control initializations are done, remove
+		 * write permission for the DMIC configuration enums to
+		 * avoid conflicts between NHLT settings and user interaction
+		 */
+
+		if (hdr->ops.get == SKL_CONTROL_TYPE_MULTI_IO_SELECT_DMIC)
+			kctl->access = SNDRV_CTL_ELEM_ACCESS_READ;
+
 		break;
 
 	default:
@@ -3584,6 +3610,37 @@ static int skl_manifest_load(struct snd_
 	return 0;
 }
 
+static void skl_tplg_complete(struct snd_soc_component *component)
+{
+	struct snd_soc_dobj *dobj;
+	struct snd_soc_acpi_mach *mach =
+		dev_get_platdata(component->card->dev);
+	int i;
+
+	list_for_each_entry(dobj, &component->dobj_list, list) {
+		struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
+		struct soc_enum *se =
+			(struct soc_enum *)kcontrol->private_value;
+		char **texts = dobj->control.dtexts;
+		char chan_text[4];
+
+		if (dobj->type != SND_SOC_DOBJ_ENUM ||
+		    dobj->control.kcontrol->put !=
+		    skl_tplg_multi_config_set_dmic)
+			continue;
+		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
+
+		for (i = 0; i < se->items; i++) {
+			struct snd_ctl_elem_value val;
+
+			if (strstr(texts[i], chan_text)) {
+				val.value.enumerated.item[0] = i;
+				kcontrol->put(kcontrol, &val);
+			}
+		}
+	}
+}
+
 static struct snd_soc_tplg_ops skl_tplg_ops  = {
 	.widget_load = skl_tplg_widget_load,
 	.control_load = skl_tplg_control_load,
@@ -3593,6 +3650,7 @@ static struct snd_soc_tplg_ops skl_tplg_
 	.io_ops_count = ARRAY_SIZE(skl_tplg_kcontrol_ops),
 	.manifest = skl_manifest_load,
 	.dai_load = skl_dai_load,
+	.complete = skl_tplg_complete,
 };
 
 /*


Patches currently in stable-queue which might be from cezary.rojewski@intel.com are

queue-5.4/asoc-intel-skylake-select-hda-configuration-permissively.patch
queue-5.4/asoc-intel-skylake-enable-codec-wakeup-during-chip-init.patch
queue-5.4/asoc-intel-allow-for-rom-init-retry-on-cnl-platforms.patch
queue-5.4/asoc-intel-skylake-await-purge-request-ack-on-cnl.patch
queue-5.4/asoc-intel-skylake-remove-superfluous-chip-initialization.patch
queue-5.4/asoc-intel-skylake-shield-against-no-nhlt-configurations.patch
queue-5.4/asoc-intel-multiple-i-o-pcm-format-support-for-pipe.patch
queue-5.4/asoc-intel-skylake-automatic-dmic-format-configuration-according-to-information-from-nhlt.patch
