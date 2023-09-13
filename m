Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71B79E3F3
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 11:40:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 621E2886;
	Wed, 13 Sep 2023 11:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 621E2886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694598041;
	bh=AFPkf81JiqACjKxsag5lm5MCBmk/FWJjDDbZ5Lp7fwc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fq58obgAKSi5v3j56YbBFcK8O1lrLd7zO+lyyTXpscTC3YqTwW568UiWOxnLo1G6m
	 XuxAMPJt2SgGxpbp8siHEO2q0/+cImJFoVJLYT/7oSZ8Iw2vXF4FSjT7FQepqiaCxh
	 dTHc3RPtubXnd/4VjZUfoV3krtZzVx5kQZNljybM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3414F8047D; Wed, 13 Sep 2023 11:39:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98BF4F80246;
	Wed, 13 Sep 2023 11:39:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEB60F80425; Wed, 13 Sep 2023 11:39:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECB9FF801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 11:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECB9FF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hFs8CJdk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694597979; x=1726133979;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AFPkf81JiqACjKxsag5lm5MCBmk/FWJjDDbZ5Lp7fwc=;
  b=hFs8CJdkXuCqXqYeoLiZ+L/Zrn0PmvuavSuno/ThATFx6OHqo6kj+IUe
   rfTz4onUmD8ibJx9k866UKGgLu/ykFhmUqJvYH5BY5131Am/lU3cmH8Ej
   dA0yPHsLcpkhddmoMnVwsoSSEdmxqFczKE/xbms/sWJh9d9HQ2sD4z/WP
   +WGHP1NAw8k+H9nG1S8xeTu0S2h3KHQLdMcSeol68AW1w0PykjRb2ioCS
   wI7sSs5GI0dLcVKcMcSor0I6vBEvoSAVcLbfI05fo6kOXQNezByKS8gwU
   dqYJbPJJJ4lAipdEAJ6uWIl6A80VJTyD4ZQZCxiCbVb4lZE3LeMx0lPrN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464982306"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000";
   d="scan'208";a="464982306"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="867720893"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000";
   d="scan'208";a="867720893"
Received: from mduman-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.209])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:39:29 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz,
	arnd@arndb.de
Cc: masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	maciej.szmigiero@oracle.com
Subject: [PATCH] ALSA: usb-audio: mixer: Remove temporary string use in
 parse_clock_source_unit
Date: Wed, 13 Sep 2023 12:39:33 +0300
Message-ID: <20230913093933.24564-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HYXR74EX2IWCAHRSL73ZRMHO42K4FCQ2
X-Message-ID-Hash: HYXR74EX2IWCAHRSL73ZRMHO42K4FCQ2
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYXR74EX2IWCAHRSL73ZRMHO42K4FCQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The kctl->id.name can be directly passed to snd_usb_copy_string_desc() and
if the string has been fetched the suffix can be appended with the
append_ctl_name() call.
The temporary name string becomes redundant and can be removed.

This change will also fixes the following compiler warning/error (W=1):

sound/usb/mixer.c: In function ‘parse_audio_unit’:
sound/usb/mixer.c:1972:29: error: ‘ Validity’ directive output may be truncated writing 9 bytes into a region of size between 1 and 44 [-Werror=format-truncation=]
 1972 |                          "%s Validity", name);
      |                             ^~~~~~~~~
In function ‘parse_clock_source_unit’,
    inlined from ‘parse_audio_unit’ at sound/usb/mixer.c:2892:10:
sound/usb/mixer.c:1971:17: note: ‘snprintf’ output between 10 and 53 bytes into a destination of size 44
 1971 |                 snprintf(kctl->id.name, sizeof(kctl->id.name),
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1972 |                          "%s Validity", name);
      |                          ~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

The warnings got brought to light by a recent patch upstream:
commit 6d4ab2e97dcf ("extrawarn: enable format and stringop overflow warnings in W=1")

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/usb/mixer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 9105ec623120..985b1aea9cdc 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1929,7 +1929,6 @@ static int parse_clock_source_unit(struct mixer_build *state, int unitid,
 	struct uac_clock_source_descriptor *hdr = _ftr;
 	struct usb_mixer_elem_info *cval;
 	struct snd_kcontrol *kctl;
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	int ret;
 
 	if (state->mixer->protocol != UAC_VERSION_2)
@@ -1966,10 +1965,9 @@ static int parse_clock_source_unit(struct mixer_build *state, int unitid,
 
 	kctl->private_free = snd_usb_mixer_elem_free;
 	ret = snd_usb_copy_string_desc(state->chip, hdr->iClockSource,
-				       name, sizeof(name));
+				       kctl->id.name, sizeof(kctl->id.name));
 	if (ret > 0)
-		snprintf(kctl->id.name, sizeof(kctl->id.name),
-			 "%s Validity", name);
+		append_ctl_name(kctl, " Validity");
 	else
 		snprintf(kctl->id.name, sizeof(kctl->id.name),
 			 "Clock Source %d Validity", hdr->bClockID);
-- 
2.42.0

