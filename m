Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 639106772D0
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Jan 2023 22:38:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A667C4128;
	Sun, 22 Jan 2023 22:37:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A667C4128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674423485;
	bh=+kFCj2QmQqaqkQtiLOFfyT0VJOQjHQOx/aIvyvGdoLs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UKNpbfUZuX2IbMHIlgxFPV676otUz/z5U4bx16RHnZFGGavZ55D8mVUFuJtvfb0Sv
	 ifAmS7wGGvZ4iAj6E2NWsXoiH4Iex3UL0hktCPbSHfDhyDHwbhc/BWXvG3lNLh+k28
	 5fLexnF3/X+dT2sT6phLzLxsj6BJiIE1nXFy1tO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28F3AF80254;
	Sun, 22 Jan 2023 22:37:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF897F8027D; Sun, 22 Jan 2023 22:37:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40BBAF80254
 for <alsa-devel@alsa-project.org>; Sun, 22 Jan 2023 22:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40BBAF80254
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qdLvj6w6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A62EB80B59;
 Sun, 22 Jan 2023 21:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7E3C433D2;
 Sun, 22 Jan 2023 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674423415;
 bh=+kFCj2QmQqaqkQtiLOFfyT0VJOQjHQOx/aIvyvGdoLs=;
 h=From:To:Cc:Subject:Date:From;
 b=qdLvj6w6684w6d/X9zYg2BFZL54G4t/TuI0Ru07Dj8kOCPAVoymyXtBQGBX0RPJgO
 vFWVq0fHA9L+aPQE+N5MOg+6YTtOcP4dTjZmtyPALYNYrzyNnIhD9D4Cg+s1dLoWRn
 MTJ0fd1Mc4eMZu8t+o6Ry0xiUg+4vXPCoYAc9LUiLo09CPpbxmYMwjiHz020m3S/KF
 r0/s0x+hi+U9rpO1ef709JJU1EFLq9kdQwc68nhiBS1+PYEhvp8sB6o3uWPwvR8rBs
 YtF0hwHJxaiHHqqishvWLDP0UhZxVIOo4CWWoXdjGwNsbqYkC59+fkVed2OcOVwT1C
 rPI2g6AG2BcFw==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 0/8] Docs: Add missing SPDX license identifiers of
Date: Sun, 22 Jan 2023 21:36:42 +0000
Message-Id: <20230122213650.187710-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 David Airlie <airlied@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-hwmon@vger.kernel.org,
 SeongJae Park <sj@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexdeucher@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some subsystem documents are missing SPDX license identifiers on index
files.  This patchset adds those.

Changes from v1
(https://lore.kernel.org/lkml/20230114194741.115855-2-sj@kernel.org/)
- Separate from index file content changes
- Separate patch for each subsystem doc (Alex Deucher)
- Use MIT license for gpu (Alex Deucher)

SeongJae Park (8):
  Docs/crypto/index: Add missing SPDX License Identifier
  Docs/driver-api/index: Add missing SPDX License Identifier
  Docs/gpu/index: Add missing SPDX License Identifier
  Docs/hwmon/index: Add missing SPDX License Identifier
  Docs/input/index: Add missing SPDX License Identifier
  Docs/mm/index: Add missing SPDX License Identifier
  Docs/scheduler/index: Add missing SPDX License Identifier
  Docs/sound/index: Add missing SPDX License Identifier

 Documentation/crypto/index.rst     | 2 ++
 Documentation/driver-api/index.rst | 2 ++
 Documentation/gpu/index.rst        | 2 ++
 Documentation/hwmon/index.rst      | 2 ++
 Documentation/input/index.rst      | 2 ++
 Documentation/mm/index.rst         | 2 ++
 Documentation/scheduler/index.rst  | 2 ++
 Documentation/sound/index.rst      | 2 ++
 8 files changed, 16 insertions(+)

-- 
2.25.1

