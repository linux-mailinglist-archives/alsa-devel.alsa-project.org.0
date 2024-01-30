Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B66F3842C0E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 19:47:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5A12EC0;
	Tue, 30 Jan 2024 19:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5A12EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706640454;
	bh=TYryKQ6Sza7hEPkyS5IKoJzK2LP8DjvU7jvBfEjpBxk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o99c87Mj4vnXGPoDroak2PrFB4J+bjYTm8x/6ETftmlcGhOJFU1rwq1TjGO6hom/9
	 VAGbakX6q9JMD+ggsOjQx0cmx0LxjB7y4hqqjuF/mqLTKwjyn2kSHyfzGaaVv1053n
	 Ljmr6UsMgHMWBL29injoT6T55+Qumk8iTRLc/m/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CA4BF805B2; Tue, 30 Jan 2024 19:46:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F172DF80578;
	Tue, 30 Jan 2024 19:46:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02D93F80570; Tue, 30 Jan 2024 19:46:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F12D5F8020D
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 19:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F12D5F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=S3nVabP8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6BDF9CE1C39;
	Tue, 30 Jan 2024 18:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E49C433F1;
	Tue, 30 Jan 2024 18:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706640394;
	bh=TYryKQ6Sza7hEPkyS5IKoJzK2LP8DjvU7jvBfEjpBxk=;
	h=From:To:Cc:Subject:Date:From;
	b=S3nVabP8zfzQDZjSPHzhoj0sixm19miQTVDcAbtX+lLYusw9AhcgejzQD2PBapHGi
	 DCzL8LhxVgvIuREgOyArY2CPnwx5AME4LHpR9AcHMdP2HY+GZkV5D8G2wx07870ASy
	 R43HhU9CK0zCDSq5MoEdHIva7df69z6ZbdCLp3zs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [PATCH 0/7] Soundwire: clean up sysfs group creation
Date: Tue, 30 Jan 2024 10:46:26 -0800
Message-ID: <2024013025-spoiling-exact-ad20@gregkh>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Lines: 48
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=TYryKQ6Sza7hEPkyS5IKoJzK2LP8DjvU7jvBfEjpBxk=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDKk7XZgUpkw/8i1mjpf5vskd1XsEu3VXlSzQ2nfY7cxM1
 Zn/N7x50xHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQATEdBgmKdh8S49pX36Ec0z
 t1h3TZwk5Hhl2wOGuXLrk/Z/mxsiY7F+odgGlu8n/maoTgQA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7ATQRLJKKMTHL4MI5WSJ63O7XC7BGI3O
X-Message-ID-Hash: 7ATQRLJKKMTHL4MI5WSJ63O7XC7BGI3O
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ATQRLJKKMTHL4MI5WSJ63O7XC7BGI3O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Note, this is a redone version of a very old series I wrote back in
2022:
	https://lore.kernel.org/r/20220824135951.3604059-1-gregkh@linuxfoundation.org
but everyone has forgotten about it now, and I've reworked it, so I'm
considering it a "new" version, and not v2.

Here's a series that adds the functionality to the driver core to hide
entire attribute groups, in a much saner way than we have attempted in
the past (i.e. dynamically figuring it out.)  Many thanks to Dan for
this patch.  I'll also be taking this into my driver-core branch and
creating a stable tag for anyone else to pull from to get it into their
trees, as I think it will want to be in many for this development cycle.

After the driver core change, there's cleanups to the soundwire core for
how the attribute groups are created, to remove the "manual" creation of
them, and allow the driver core to create them correctly, as needed,
when needed, which makes things much smaller for the soundwire code to
manage.

Comments appreciated!

thanks,

greg k-h

Dan Williams (1):
  sysfs: Introduce a mechanism to hide static attribute_groups

Greg Kroah-Hartman (5):
  soundwire: sysfs: move sdw_slave_dev_attr_group into the existing list
    of groups
  soundwire: sysfs: cleanup the logic for creating the dp0 sysfs
    attributes
  soundwire: sysfs: have the driver core handle the creation of the
    device groups
  soundwire: sysfs: remove sdw_slave_sysfs_init()
  soundwire: sysfs: remove unneeded ATTRIBUTE_GROUPS() comments

 drivers/soundwire/bus_type.c        |  5 ++-
 drivers/soundwire/sysfs_local.h     |  4 +-
 drivers/soundwire/sysfs_slave.c     | 64 ++++++++++++++---------------
 drivers/soundwire/sysfs_slave_dpn.c |  3 ++
 fs/sysfs/group.c                    | 45 ++++++++++++++++----
 include/linux/sysfs.h               | 63 ++++++++++++++++++++++------
 6 files changed, 126 insertions(+), 58 deletions(-)

-- 
2.43.0

