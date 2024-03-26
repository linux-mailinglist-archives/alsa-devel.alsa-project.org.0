Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E1B88C8B2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:12:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D6812C0C;
	Tue, 26 Mar 2024 17:12:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D6812C0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469549;
	bh=3xRsvZ3vHZgzMGxX4qTn0KCbHj9R9neYJ/Ir08g+3As=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H9R2Ke06yGxiIUGKZtJttHW3pNwt5y3Ksv1xMHAlZXBQFAya1TNdmFQZ8DSajJg+0
	 +MW1Pfz/thabgkF9qzVmPs+jmAtUukH7aRuHPM4il84xsybo4uUyyw3vdrQbpfdcbY
	 zKuoWHAVxV4JEkPAttUfHCtKROo42GDwGcQgOXgc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25C41F805E8; Tue, 26 Mar 2024 17:07:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7219EF89726;
	Tue, 26 Mar 2024 17:07:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1FBDF80716; Tue, 26 Mar 2024 17:06:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FD0AF805D9
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FD0AF805D9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SREz2qM8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469147; x=1743005147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3xRsvZ3vHZgzMGxX4qTn0KCbHj9R9neYJ/Ir08g+3As=;
  b=SREz2qM8LBJcHfQLkFF8PZQ+JyPJ6yARyrcAMdzQ60GJkjkVKWLzaMK1
   O02w9ZJhTKlvvOiuKoJYqXqEx7uYI5g2QytWvc6lwKj9xmO1DkE+j4D40
   Fvd2nd4RMe2GVmLtSZge+WGZoBRbHWvi5SelqSd0LZId6/g+0/NDAa3+v
   uZTajpIBWg1OXgH+Cc8cw7+6CRe3LO6eCKn0Nc4C2jJ4MU4rh9zY+Q4/v
   1ChKgCiOV0CE0Y/f7/KTtg5iYmBViYl9AGCeUKeAOR+9DSV6WnvB6t8k0
   UkvDn+xKQFXINMiesTqTJLKXuPCrBfWXsmIOGSaZfrvGANyNznvrvKMKd
   Q==;
X-CSE-ConnectionGUID: IDfiCm/HRs2Xw5PxxoSaxQ==
X-CSE-MsgGUID: gbQCje2cRzWtmgT+FTqi2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260478"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260478"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482343"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 21/34] ASoC: Intel: sof_sdw: Move append_dai_type to new
 parsing
Date: Tue, 26 Mar 2024 11:04:16 -0500
Message-Id: <20240326160429.13560-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G2OSFO4YPRYBYUTJTQXQXVV6GASD5Q2X
X-Message-ID-Hash: G2OSFO4YPRYBYUTJTQXQXVV6GASD5Q2X
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2OSFO4YPRYBYUTJTQXQXVV6GASD5Q2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

append_dai_type should be set to true in any situation that would
result in multiple DAI links existing on a single SoundWire bus,
because the legacy naming used only the bus number to make things
unique. The current code handles this by looking for codecs with
multiple dai_info structs and looking for buses that include multiple
types of device on them. The first of these assumes that all DAIs on a
given device would be in use. The second, with dissimilar aggregation
now being supported, isn't really an accurate check either since those
devices could be aggregated into a single DAI link.

Move the handling for this flag over to the new parsing code and
simplify things a little by looking directly for SoundWire links
that will contain multiple DAI links to set the flag. These changes
should not cause any change in behaviour for any currently supported
systems.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 36 +++++---------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index cda759ee6345..89ce77961634 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1463,6 +1463,8 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 	int i, j;
 
 	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
+		int num_link_dailinks = 0;
+
 		if (!is_power_of_2(adr_link->mask)) {
 			dev_err(dev, "link with multiple mask bits: 0x%x\n",
 				adr_link->mask);
@@ -1540,6 +1542,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 					}
 				}
 
+				num_link_dailinks += !!list_empty(&sof_dai->endpoints);
 				list_add_tail(&sof_end->list, &sof_dai->endpoints);
 
 				sof_end->link_mask = adr_link->mask;
@@ -1550,6 +1553,8 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 				sof_end++;
 			}
 		}
+
+		ctx->append_dai_type |= (num_link_dailinks > 1);
 	}
 
 	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
@@ -1933,37 +1938,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	for (i = 0; i < SDW_MAX_LINKS; i++)
 		ctx->sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
 
-	for (; adr_link->num_adr; adr_link++) {
-		/*
-		 * If there are two or more different devices on the same sdw link, we have to
-		 * append the codec type to the dai link name to prevent duplicated dai link name.
-		 * The same type devices on the same sdw link will be in the same
-		 * snd_soc_acpi_adr_device array. They won't be described in different adr_links.
-		 */
-		for (i = 0; i < adr_link->num_adr; i++) {
-			/* find codec info to get dai_num */
-			codec_info = find_codec_info_part(adr_link->adr_d[i].adr);
-			if (!codec_info) {
-				ret = -EINVAL;
-				goto err_end;
-			}
-			if (codec_info->dai_num > 1) {
-				ctx->append_dai_type = true;
-				goto out;
-			}
-			for (j = 0; j < i; j++) {
-				if ((SDW_PART_ID(adr_link->adr_d[i].adr) !=
-				    SDW_PART_ID(adr_link->adr_d[j].adr)) ||
-				    (SDW_MFG_ID(adr_link->adr_d[i].adr) !=
-				    SDW_MFG_ID(adr_link->adr_d[j].adr))) {
-					ctx->append_dai_type = true;
-					goto out;
-				}
-			}
-		}
-	}
-out:
-
 	/* generate DAI links by each sdw link */
 	for (adr_link = mach_params->links ; adr_link->num_adr; adr_link++) {
 		for (i = 0; i < adr_link->num_adr; i++) {
-- 
2.40.1

