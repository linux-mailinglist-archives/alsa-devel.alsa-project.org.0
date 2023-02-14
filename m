Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDD96960DA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 11:35:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CAA9836;
	Tue, 14 Feb 2023 11:34:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CAA9836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676370930;
	bh=hQPg55Q3ODAvxY9tx/1PrJXLg3JGg4VzaZVnmlcD7to=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FvMzTzJwbECxFtYgkQIWUsJt2ihy8L438Xn193aQqadTzNDgwkAbfhWDgTwLStPfn
	 j9SObNJUkfaxKbQ2+3+F85b3HhMetwpgQHAe3h3JSnaqYI1P+Sx1mAS1oW8dv/4Yya
	 dy59wl6GDZ3/I2xRGyZmJ6I7+LtC1M3QnIzrmp40=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7D8AF801C0;
	Tue, 14 Feb 2023 11:33:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDBC6F800E4; Tue, 14 Feb 2023 11:33:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B122FF800E4
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 11:33:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B122FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fGp6ergp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676370820; x=1707906820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hQPg55Q3ODAvxY9tx/1PrJXLg3JGg4VzaZVnmlcD7to=;
  b=fGp6ergp4FH7HxUfiQefhv/Ob9ADMBfqZFuxDhOqXYN2jlgIdSgLwil1
   jX0kAddXMvWQnB5QQ3856DTCpv8tci+L3GJnazQyH3HBJtQNZ7lcQ0Yhh
   kRr5DZDLZG/E55qtqiaF2zd6dlKOOnuby1X8bT890/uB3tTfELvZ3IgSf
   uCX4sPBKpUMwfiKpIYUefOAn2LznqygEXeU8OKxd/hI+ETDTluHlgNxW4
   GwUkevSoy4RPg34MSkaiiKKH9+50xkoYQhn+EL4nSI6L99PpE9rTVw827
   eRSRcWObkHLP8MMrkudQaiZTdjI7553qFx9sSyNzipG6Ls6xU12kgarzf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395745421"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000";
   d="scan'208";a="395745421"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:33:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811971902"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000";
   d="scan'208";a="811971902"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.252.18.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:33:37 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/5] ASoC: SOF: Intel: hda-dsp: use set_pm_gate according to
 ipc version
Date: Tue, 14 Feb 2023 12:33:42 +0200
Message-Id: <20230214103345.30669-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
References: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PVGHCDB322MQUKJMFXPYMQXHCMXFOHMN
X-Message-ID-Hash: PVGHCDB322MQUKJMFXPYMQXHCMXFOHMN
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVGHCDB322MQUKJMFXPYMQXHCMXFOHMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Use set_pm_gate to unify pm gate setting for different
ipc version.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index b4eacae8564c..e34fe0c9bcde 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -364,19 +364,12 @@ static int hda_dsp_wait_d0i3c_done(struct snd_sof_dev *sdev)
 
 static int hda_dsp_send_pm_gate_ipc(struct snd_sof_dev *sdev, u32 flags)
 {
-	struct sof_ipc_pm_gate pm_gate;
-	struct sof_ipc_reply reply;
+	const struct sof_ipc_pm_ops *pm_ops = sof_ipc_get_ops(sdev, pm);
 
-	memset(&pm_gate, 0, sizeof(pm_gate));
+	if (pm_ops && pm_ops->set_pm_gate)
+		return pm_ops->set_pm_gate(sdev, flags);
 
-	/* configure pm_gate ipc message */
-	pm_gate.hdr.size = sizeof(pm_gate);
-	pm_gate.hdr.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_GATE;
-	pm_gate.flags = flags;
-
-	/* send pm_gate ipc to dsp */
-	return sof_ipc_tx_message_no_pm(sdev->ipc, &pm_gate, sizeof(pm_gate),
-					&reply, sizeof(reply));
+	return 0;
 }
 
 static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
-- 
2.39.1

