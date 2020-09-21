Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C9D272203
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 13:13:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 552B816F2;
	Mon, 21 Sep 2020 13:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 552B816F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600686812;
	bh=uhbNTzc/KZ7g7bnT5JGWLw+GBHH5ssnl9xr6JaO9NlY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZeTDFPqswPxvIhKHBZzc/OM6kJadFUHc1dZUbXe4heUjMq2XsSA1TOO/7679tnou
	 92vR8txXVpMcO02DlhPnp5lBDg05x2u7ts2mmQiCqQD6C+/ODLwafYoxTGKbaLM3YY
	 62iO+8XgzN83E6ejcjaOM47FKcg8LCOJGv48fWac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 040D3F802D2;
	Mon, 21 Sep 2020 13:10:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9AF4F802D2; Mon, 21 Sep 2020 13:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 111C1F80162
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 13:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 111C1F80162
IronPort-SDR: 0QbsbUXncyV06x4i1VBJFA7zWrGdkCyGnnSy2On+4lMABD5xND8Z7nASAEcbc42Pl/IoJzcuqD
 jl8y8/RsTB+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="148011226"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="148011226"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 04:09:56 -0700
IronPort-SDR: GTd7PmXJUFIBQDbHpPojJEsGAdfbe2k+GWTN0CGf5rsvf8g9C2ZHAfJyEAyPOhxjN6DSYw+QVP
 CqxsoHu26JTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="321730216"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 21 Sep 2020 04:09:55 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/5] ASoC: SOF: control: fix size checks for ext_bytes control
 .get()
Date: Mon, 21 Sep 2020 14:08:10 +0300
Message-Id: <20200921110814.2910477-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200921110814.2910477-1-kai.vehmanen@linux.intel.com>
References: <20200921110814.2910477-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

cppcheck complains twice:

sound/soc/sof/control.c:436:2: style: Assignment of function parameter
has no effect outside the function. [uselessAssignmentArg]
 size -= sizeof(const struct snd_ctl_tlv);
 ^

sound/soc/sof/control.c:436:7: style: Variable 'size' is assigned a
value that is never used. [unreadVariable]
 size -= sizeof(const struct snd_ctl_tlv);

Somehow we dropped the checks for the size argument when upstreaming
the code, somewhere between v5 and v6.

Re-add a size check to avoid providing userspace with more data that
it asked for.

Also fix all error codes, we should return -ENOSPC instead of -EINVAL.

Fixes: c3078f5397046 ('ASoC: SOF: Add Sound Open Firmware KControl support')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/control.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 58f8c998e6af..8d499d0e331d 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -432,7 +432,9 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	 * Decrement the limit by ext bytes header size to
 	 * ensure the user space buffer is not exceeded.
 	 */
-	size -= sizeof(const struct snd_ctl_tlv);
+	if (size < sizeof(struct snd_ctl_tlv))
+		return -ENOSPC;
+	size -= sizeof(struct snd_ctl_tlv);
 
 	/* set the ABI header values */
 	cdata->data->magic = SOF_ABI_MAGIC;
@@ -448,6 +450,10 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 
 	data_size = cdata->data->size + sizeof(const struct sof_abi_hdr);
 
+	/* make sure we don't exceed size provided by user space for data */
+	if (data_size > size)
+		return -ENOSPC;
+
 	header.numid = scontrol->cmd;
 	header.length = data_size;
 	if (copy_to_user(tlvd, &header, sizeof(const struct snd_ctl_tlv)))
-- 
2.27.0

