Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F2218D40
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 18:42:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960A41612;
	Wed,  8 Jul 2020 18:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960A41612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594226550;
	bh=Cd7Bu4p7Bm0T49BmT0LqPwauCVc+JZVWsU6Z1dNfMqM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ki0RPKnIbw9DOn72nENtN/ShrqtwZ1uDKXqozmE4pdSUY8a4V+Og62zc5KkZ7aBg1
	 gAi75WQisfpeRSb0f27TeJQyUbVwB4t6VpJ/79JzsHI1HX5wMqTCBgYAB+4ApL0L6X
	 kT4jTqP96S6owVItQgFGaxHI8GdpIKhcZSqg7vQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21570F8015A;
	Wed,  8 Jul 2020 18:40:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38978F8015D; Wed,  8 Jul 2020 18:40:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 655EDF8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 18:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 655EDF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LyVLEL0N"
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5CB3020786;
 Wed,  8 Jul 2020 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594226431;
 bh=Cd7Bu4p7Bm0T49BmT0LqPwauCVc+JZVWsU6Z1dNfMqM=;
 h=From:To:Cc:Subject:Date:From;
 b=LyVLEL0NmgBwWs3sKZjfDTSSxyyoDgg3mc2EJASD16iKxpCI1uCiVw3RCrDCQGL02
 XED4dpeT7QEqS5N1rFCfkLlm4G4UzM7W5E9aHmMweKVpNiNmotCz0gz8sio6PsNufw
 +eCyOywVhvD22k1yqVZGV4T+eISs9vnPRBuNB1AE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 0/5] crypto: add sha256() function
Date: Wed,  8 Jul 2020 09:39:38 -0700
Message-Id: <20200708163943.52071-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 alsa-devel@alsa-project.org, linux-efi@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>,
 Mat Martineau <mathew.j.martineau@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, sparclinux@vger.kernel.org,
 Matthieu Baerts <matthieu.baerts@tessares.net>,
 Guenter Roeck <groeck@chromium.org>, mptcp@lists.01.org,
 Ard Biesheuvel <ardb@kernel.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

This series adds a function sha256() to the sha256 library so that users
who want to compute a hash in one step can just call sha256() instead of
sha256_init() + sha256_update() + sha256_final().

Patches 3-5 then convert some users to use it.

Changed v1 => v2:
  - Added sparc patch to fix a build breakage caused by a
    static variable already named "sha256".
  - Added Reviewed-by, Acked-by, and Tested-by tags.

Eric Biggers (5):
  crypto: sparc - rename sha256 to sha256_alg
  crypto: lib/sha256 - add sha256() function
  efi: use sha256() instead of open coding
  mptcp: use sha256() instead of open coding
  ASoC: cros_ec_codec: use sha256() instead of open coding

 arch/sparc/crypto/sha256_glue.c          | 14 ++++++------
 drivers/firmware/efi/embedded-firmware.c |  9 +++-----
 include/crypto/sha.h                     |  1 +
 lib/crypto/sha256.c                      | 10 +++++++++
 net/mptcp/crypto.c                       | 15 +++----------
 sound/soc/codecs/cros_ec_codec.c         | 27 ++----------------------
 6 files changed, 26 insertions(+), 50 deletions(-)


base-commit: 57c8aa43b9f272c382c253573c82be5cb68fe22d
-- 
2.27.0

