Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 350F66A1593
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 04:43:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 751AC201;
	Fri, 24 Feb 2023 04:42:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 751AC201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677210190;
	bh=1+iTjI8144LQifhA5jGdDFhZRv+AUNRCi/0OKx4iOfA=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qTWr6WoLOmYpT8MB1IvCi8B8fr0K7+PCnu3NjUJLXRJ9UmuEAt4+VnG99zP79dq1f
	 SeTfurdEmEpxLfrqrjReI5Sa6bm+e4LO/j9r4FJgTU/70w8SZdM0LK8y8rf6NQGFKk
	 Ni0I2NzCAbJEe6w29Nd3J4qGaawfx0uVpErdr//Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4580F80116;
	Fri, 24 Feb 2023 04:42:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 925D4F80125; Fri, 24 Feb 2023 04:42:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E47CF800C7;
	Fri, 24 Feb 2023 04:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E47CF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gVdn/Kr6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A685617D4;
	Fri, 24 Feb 2023 03:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37274C433EF;
	Fri, 24 Feb 2023 03:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677210121;
	bh=1+iTjI8144LQifhA5jGdDFhZRv+AUNRCi/0OKx4iOfA=;
	h=Date:From:To:Cc:Subject:From;
	b=gVdn/Kr6HlfAF4N4sGLeETDSym4W2TYS6eQ9fS9Y2TWtyJgMvii4tT2z9zqsl9toP
	 AHoUlgZ3KsGIFLoAMkIfyHdv5cdtBK83uYoQFZA4GMZ/FfrIOCiuOxrxDega6mHW36
	 PFA36m0IlQUPmxeaxIUPcU/aIWKOCSdaZOSITiq7sWZ8fhc8FGp/ZB3gw5uTijKclA
	 gwVoB69VTh6wpIaF4l9wM6BzuRGF/Z0FMAfBN8TYRjdSUh/jWyeG1pnaOkphfq1Kr5
	 bnMf0FqURXn1SIsiQFUrJv0OTpbAWIuOhufuiMuu4DxEgGUPERQQbF4zAmSBfnbD8n
	 Ud86u32tRXzVw==
Date: Thu, 23 Feb 2023 21:42:26 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH][next] ASoC: SOF: ipc4-topology: Replace fake flexible arrays
 with flexible-array member
Message-ID: <Y/gyIg1qZduhigPi@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 22N6JVNITEE25Z5XA4S6GCP7KH2YNAFY
X-Message-ID-Hash: 22N6JVNITEE25Z5XA4S6GCP7KH2YNAFY
X-MailFrom: gustavoars@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22N6JVNITEE25Z5XA4S6GCP7KH2YNAFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Zero-length arrays as fake flexible arrays are deprecated and we are
moving towards adopting C99 flexible-array members, instead.

Use the DECLARE_FLEX_ARRAY() helper macro to transform zero-length
arrays in unions with flexible-array members.

Address the following warnings found with GCC-13 and
-fstrict-flex-arrays=3 enabled:
sound/soc/sof/ipc4-control.c:176:77: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
sound/soc/sof/ipc4-control.c:78:29: warning: array subscript 0 is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
sound/soc/sof/ipc4-control.c:80:33: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
sound/soc/sof/ipc4-control.c:95:53: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
sound/soc/sof/ipc4-control.c:96:53: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
sound/soc/sof/ipc4-control.c:93:53: warning: array subscript 0 is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
sound/soc/sof/ipc4-control.c:140:58: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
sound/soc/sof/ipc4-control.c:141:29: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
sound/soc/sof/ipc4-control.c:142:29: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
sound/soc/sof/ipc4-topology.c:1475:36: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
sound/soc/sof/ipc4-topology.c:1476:36: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [1].

Link: https://github.com/KSPP/linux/issues/21
Link: https://github.com/KSPP/linux/issues/193
Link: https://github.com/KSPP/linux/issues/258
Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/soc/sof/ipc4-topology.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 72529179ac22..8507171a6e4d 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -266,8 +266,8 @@ struct sof_ipc4_control_data {
 	int index;
 
 	union {
-		struct sof_ipc4_ctrl_value_chan chanv[0];
-		struct sof_abi_hdr data[0];
+		DECLARE_FLEX_ARRAY(struct sof_ipc4_ctrl_value_chan, chanv);
+		DECLARE_FLEX_ARRAY(struct sof_abi_hdr, data);
 	};
 };
 
-- 
2.34.1

