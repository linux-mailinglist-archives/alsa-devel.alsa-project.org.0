Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B22DA92FC5E
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2024 16:19:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7B79B60;
	Fri, 12 Jul 2024 16:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7B79B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720793949;
	bh=ow9AJ//jVwfGZhSB8AYloU9hYnkv2FQyvwvJeG3Nqb8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ec4aeu0nOe7D7+S9zePmECMjpBF7LkEMrcHKj04Jyc3C7RhZkmLkP2btSYLiIGXtK
	 EIuaGcnbD2bKBIulYYYDSXnMhwjb+Xg6fx5FwZwtRDg8QTwxurOx6oTuM5ChriN+WY
	 KxnO/4xv9Ew8g2eVBJlYCunR2dF2MrrlzSuUtla0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93A32F805A0; Fri, 12 Jul 2024 16:18:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D99AF805AD;
	Fri, 12 Jul 2024 16:18:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E7EBF80074; Fri, 12 Jul 2024 16:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F28D4F800FE
	for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2024 16:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F28D4F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qwhnwjHe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7897761298;
	Fri, 12 Jul 2024 14:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5964C4AF0B;
	Fri, 12 Jul 2024 14:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720793318;
	bh=ow9AJ//jVwfGZhSB8AYloU9hYnkv2FQyvwvJeG3Nqb8=;
	h=From:To:Cc:Subject:Date:From;
	b=qwhnwjHe/bs9hFRqPBA5OcGzX/+Ph3eCc2+KHYf3Ln0cdqVHqUh0Uj4z+OkdzJepN
	 pelVzaV+IbazGfsjf89t67zvzw2n0CyAP2eL2IQ2HBCB803pjx2xqYgtl41w70fxkd
	 pykJ9PL+oAVz5aOxXpew8ycct/bo2+Zm3pmDOEHtnGlhgv4NaxDOSqsczCOhV6z2SK
	 2r3iDRg8Lxr0tABGbLmqXv9Y/HKshe0otW1PUhLruxFqwRBF9fsAH+1hruxT/06xZi
	 td24v/o1hl7FJDSH/Y3UdsObYXGqm3tlUrkq7+AfouLAcTKo4HhFas1N0RbLbzxZ1r
	 nlgZ2SKiERTKA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sSGwv-000000006KB-2TJT;
	Fri, 12 Jul 2024 16:08:38 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 0/3] soundwire: bus: suppress probe deferral errors
Date: Fri, 12 Jul 2024 16:07:58 +0200
Message-ID: <20240712140801.24267-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: USSIMRRLZXDDSBP5AYXTDFR766SI7SB4
X-Message-ID-Hash: USSIMRRLZXDDSBP5AYXTDFR766SI7SB4
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USSIMRRLZXDDSBP5AYXTDFR766SI7SB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The soundwire bus code is incorrectly logging probe deferrals as errors.

This series addresses that, cleans up the soundwire bus logging and
drops the unused soudwire driver name field.

Vinod, I booted linux-next yesterday and realised that these bogus error
messages are still spamming the logs when booting x1e80100 and making it
harder to see the valid warnings (which there were too many of). Would
be nice to have this fixed in 6.11:

[   18.815950] wsa884x-codec sdw:4:0:0217:0204:00:0: Probe of wsa884x-codec failed: -517
[   18.825093] wsa884x-codec sdw:1:0:0217:0204:00:0: Probe of wsa884x-codec failed: -517
[   18.832335] wsa884x-codec sdw:4:0:0217:0204:00:1: Probe of wsa884x-codec failed: -517
[   18.840870] wsa884x-codec sdw:1:0:0217:0204:00:1: Probe of wsa884x-codec failed: -517
[   18.848463] wsa884x-codec sdw:1:0:0217:0204:00:0: Probe of wsa884x-codec failed: -517

Johan


Changes in v3
 - amend the update status error message with "at probe" to make it more
   descriptive (it's already unique)
 - drop the patch dropping a probe debug message

Changes in v2
 - drop probe error message completely
 - drop soundwire driver name field
 - cleanup probe warning messages
 - drop probe debug message

Johan Hovold (3):
  soundwire: bus: suppress probe deferral errors
  soundwire: bus: drop unused driver name field
  soundwire: bus: clean up probe warnings

 drivers/soundwire/bus_type.c  | 19 ++++---------------
 include/linux/soundwire/sdw.h |  2 --
 2 files changed, 4 insertions(+), 17 deletions(-)

-- 
2.44.2

