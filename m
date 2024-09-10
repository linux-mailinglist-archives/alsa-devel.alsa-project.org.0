Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 629A3973F3D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 19:24:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC4885D;
	Tue, 10 Sep 2024 19:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC4885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725989050;
	bh=NeZBarf5sytU+4tlKJN+FOzynrWMMCnZ2J23Xvo9Q78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e3RDnQZxzC8v1GUShFwOJ7TpJ2ozyvKl1Q8kZ8XlOcfam0lugNDh15tYNSBYoLDzO
	 Erq6BtLjojpLs1VCtrVXyNdQaoKkuLKgBNO30U2P9WMmB6Ny+eYvPbXAI4/FJFvrQ0
	 6J/boBW1BHRe9Iy1f5UxpN/O7GnXiI6rtaG0WYV8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC50DF805A9; Tue, 10 Sep 2024 19:23:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 875C0F801F5;
	Tue, 10 Sep 2024 19:23:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E057AF801F5; Tue, 10 Sep 2024 19:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F12F8F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 19:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F12F8F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u/tl3XqZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59DFF5C01EC;
	Tue, 10 Sep 2024 17:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC04C4CED0;
	Tue, 10 Sep 2024 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725989017;
	bh=NeZBarf5sytU+4tlKJN+FOzynrWMMCnZ2J23Xvo9Q78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u/tl3XqZI7zftomv4KfPGxny7gLOlT3h7mWbBcCIsuOAfA3/69dEYiJUF9rKjEKaQ
	 tm92gvt4bHK9ewOJEEUz7r0eb6okkJjO9mpf24O5D5Za3AS9not1XTbCAKe9kiNcPr
	 W7YFEP9T94D+bw0o0Nv6AcdE9BnZf4egigCF4t5x/ckgZZKx2d2MdsMJi8xQecAqIo
	 Cy1PzFo+gL296InPhcGSMcPTspyBrjQrZtFlb+zdxrk3oeyWMjIur9rXmCMmj3FqO+
	 5Q66sMLXrEKojCsWUpykQKJnx9QGoIubjNPxxrOcU7irmbXQgDgvqDzIuWX66nDCi+
	 QJxdyq6UjzWYQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 2/8] ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga
 Tab 3 X90F DMI match less strict
Date: Tue, 10 Sep 2024 13:23:22 -0400
Message-ID: <20240910172332.2416254-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240910172332.2416254-1-sashal@kernel.org>
References: <20240910172332.2416254-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.109
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EQXWE4UKJV644MJSHCTHAFLUE373CB5N
X-Message-ID-Hash: EQXWE4UKJV644MJSHCTHAFLUE373CB5N
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQXWE4UKJV644MJSHCTHAFLUE373CB5N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 839a4ec06f75cec8fec2cc5fc14e921d0c3f7369 ]

There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
turns out that the 2G version has a DMI product name of
"CHERRYVIEW D1 PLATFORM" where as the 4G version has
"CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
unique enough that the product-name check is not necessary.

Drop the product-name check so that the existing DMI match for the 4G
RAM version also matches the 2G RAM version.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://patch.msgid.link/20240823074305.16873-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index 5e2ec60e2954..e4c3492a0c28 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -84,7 +84,6 @@ static const struct dmi_system_id lenovo_yoga_tab3_x90[] = {
 		/* Lenovo Yoga Tab 3 Pro YT3-X90, codec missing from DSDT */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
 		},
 	},
-- 
2.43.0

