Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7957F79CA3D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 10:40:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8030886;
	Tue, 12 Sep 2023 10:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8030886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694508031;
	bh=4ejql24HEMpBoTtiKSAXpLvVWBPjkQdUnHC8bPFBtto=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HS28mff57ICtSHeZ1CZmvxQ3PIOOo8Ia26Y8iL9Iw5Np8bInslGT9W/AW4inzlfQh
	 ce2k4cXGq9y3pcDfNin/aBo4jZNBqhDH2uafMzZ1Qo3cGh0dm2VbA63irTgnLxsTtH
	 Thic+7tKpH0oLozZVETgBwpV9o+XBv5RiXdgjuLU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A58D3F80552; Tue, 12 Sep 2023 10:39:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CDEDF80246;
	Tue, 12 Sep 2023 10:39:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47623F80425; Tue, 12 Sep 2023 10:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F103FF800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 10:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F103FF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y/oe5eIj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694507953; x=1726043953;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4ejql24HEMpBoTtiKSAXpLvVWBPjkQdUnHC8bPFBtto=;
  b=Y/oe5eIjvRL8ToDnzadIMOHTSJEQpCtHcUnuSXlFzMSG+dqC5SZdZWxO
   8RO9YlbXQSkegL5xdgukG4i0qgrg++UkrjgWyQdmeftj65HQ7vL/4skAk
   r6RhZQ8vw6MjRcqAa1hqxxIpmgxspaDCmDEAWrOUjvj0X8TDB0eUW7GPt
   a5DtIENy0TAilzf2O526hac6gMzdYUslQ8cUd0oKYuUkK3gDuGzDNAvVk
   opX0MjGqUv2DWhcV/wexVKLMDUWIBXzgJBC1GlxF6s58GieYrTmd2EnIi
   zROQ/yI5KCtPt0LOJZ9jORFf5j4+SFVbpZyVaJFx7qMfkHfo2vrJl5+dy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381015227"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000";
   d="scan'208";a="381015227"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 01:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833826778"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000";
   d="scan'208";a="833826778"
Received: from mkidd-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.217.72])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 01:39:06 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz,
	arnd@arndb.de
Cc: masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: core: Increase the name array size for debugfs
 directory name
Date: Tue, 12 Sep 2023 11:39:10 +0300
Message-ID: <20230912083910.15994-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SEVXQ25C54XEWTWTJD35KWQR53OGYGDT
X-Message-ID-Hash: SEVXQ25C54XEWTWTJD35KWQR53OGYGDT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEVXQ25C54XEWTWTJD35KWQR53OGYGDT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The idx is guarantied to be less than SNDRV_CARDS (max 256 or 8) by the
code in snd_card_init(), however the compiler does not see that.
Compiling with W=1 results:

sound/core/init.c: In function ‘snd_card_init’:
sound/core/init.c:367:28: error: ‘%d’ directive writing between 1 and 10 bytes into a region of size 4 [-Werror=format-overflow=]
  367 |         sprintf(name, "card%d", idx);
      |                            ^~
sound/core/init.c:367:23: note: directive argument in the range [0, 2147483646]
  367 |         sprintf(name, "card%d", idx);
      |                       ^~~~~~~~
sound/core/init.c:367:9: note: ‘sprintf’ output between 6 and 15 bytes into a destination of size 8
  367 |         sprintf(name, "card%d", idx);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

While the code is correct, we need to silence the compiler somehow.
It could be done by limiting the range in sprintf like
sprintf(name, "card%d", idx % SNDRV_CARDS);
sprintf(name, "card%hhd", idx);
etc

These are too workaroundish. Increase the name array to 15 instead which
looks better and only adds 7 bytes on stack.

The warnings got brought to light by a recent patch upstream:
commit 6d4ab2e97dcf ("extrawarn: enable format and stringop overflow warnings in W=1")

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

The mentioned commit causes other build failures with W=1 at least in
sound/usb/mixer_scarlett_gen2.c
sound/usb/mixer.c
sound/soc/codecs/hdac_hdmi.c
sound/hda/intel-sdw-acpi.c

Some of them are also false and we need to find a workaround, but
I think the scarlett case might be valid.

Regards,
Peter

 sound/core/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index d61bde1225f2..d8a13a76d241 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -279,7 +279,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 {
 	int err;
 #ifdef CONFIG_SND_DEBUG
-	char name[8];
+	char name[15];
 #endif
 
 	if (extra_size > 0)
-- 
2.42.0

