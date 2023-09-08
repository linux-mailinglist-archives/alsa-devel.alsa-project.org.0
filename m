Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7539798C51
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 20:13:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D077832;
	Fri,  8 Sep 2023 20:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D077832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694196833;
	bh=58aqhulC4fc6Pn7pCzoNspVmthf7zQNQ+CuztnXMM9k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UBY1e5ldS7XxPWXAfdFKjanCk4/wM+ZcWKbYA8QAAyLG9qV20t3vRPJyF2iha3Y/Y
	 4tl+xhvAn5yjAiUEy65quaQVaYvoWGvGRXFQSTdYTiQrmNqFgAX998j4BKW26Yo2kv
	 NRJEq43W123EbbaxiCaEOsnTVTYNymAfOQ/XKLBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 297B5F80527; Fri,  8 Sep 2023 20:13:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C87EAF8047D;
	Fri,  8 Sep 2023 20:13:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E8DDF80494; Fri,  8 Sep 2023 20:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1AEAF80236
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 20:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1AEAF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=D3/TDBhL
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C384F66072B9;
	Fri,  8 Sep 2023 19:12:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694196768;
	bh=58aqhulC4fc6Pn7pCzoNspVmthf7zQNQ+CuztnXMM9k=;
	h=From:To:Cc:Subject:Date:From;
	b=D3/TDBhLtJg+v4QCDK7vby4V4RgDhW59/2BiowmTy3GpcnlDjbyicbjTnYuXicxEw
	 Y3HdFg7/iU+AW7hn6vfue4HXulIbjdLeNSOvrlJjMtWG2orbl9SS4g253yI2zewFsR
	 4ubUq5xRQzqU7rhz0+C+JAL7/52MaDdE27nJX/TdCHVWKJaIdUJ+1Xus1l4mnpsuNI
	 jSy5GprjgCaIWa7MIelrOWKCZobhBdVer6TQNpO42wuXZYvK/epcHg139TYdHhkZrN
	 rJCbVR3nLXC6KLoJ3RDlACvxkdLGlEcwKm8HPQKTW5Muz4OMnEVcnDX/VO4qw5gxTB
	 F/A9njH6ylDcw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] kselftest/alsa: Mark test plan as skipped when no cards are
 available
Date: Fri,  8 Sep 2023 14:12:40 -0400
Message-ID: <20230908181242.95714-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EKEK5C6TFTXWYJ7LUXZQW6JEZHNOMNST
X-Message-ID-Hash: EKEK5C6TFTXWYJ7LUXZQW6JEZHNOMNST
X-MailFrom: nfraprado@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EKEK5C6TFTXWYJ7LUXZQW6JEZHNOMNST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When no soundcards are available, it won't be possible to run any tests.
Currently, when this happens, in both pcm-test and mixer-test, 0
tests are reported, and the pass exit code is returned. Instead, call
ksft_exit_skip() so that the whole test plan is marked as skipped in the
KTAP output and it exits with the skip exit code.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 tools/testing/selftests/alsa/mixer-test.c | 7 +++++--
 tools/testing/selftests/alsa/pcm-test.c   | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index c95d63e553f4..8f45c15a5667 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -66,8 +66,11 @@ static void find_controls(void)
 	char *card_name, *card_longname;
 
 	card = -1;
-	if (snd_card_next(&card) < 0 || card < 0)
-		return;
+	err = snd_card_next(&card);
+	if (err < 0)
+		ksft_exit_skip("Couldn't open first soundcard. rc=%d\n", err);
+	if (card < 0)
+		ksft_exit_skip("No soundcard available\n");
 
 	config = get_alsalib_config();
 
diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 2f5e3c462194..74d9cf8b5a69 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -161,8 +161,11 @@ static void find_pcms(void)
 	snd_pcm_info_alloca(&pcm_info);
 
 	card = -1;
-	if (snd_card_next(&card) < 0 || card < 0)
-		return;
+	err = snd_card_next(&card);
+	if (err < 0)
+		ksft_exit_skip("Couldn't open first soundcard. rc=%d\n", err);
+	if (card < 0)
+		ksft_exit_skip("No soundcard available\n");
 
 	config = get_alsalib_config();
 
-- 
2.42.0

