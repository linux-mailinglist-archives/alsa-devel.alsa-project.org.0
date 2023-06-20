Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6D9737748
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 00:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91DC783E;
	Wed, 21 Jun 2023 00:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91DC783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687299047;
	bh=g1Ge7OS0fr37jsbP/Xrz0cMOpZ9QFiuqkEuRXr45wpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fnUNNfmoZGdRcMmDza7hd9I6UwW0WmFhGPysHc/AobLUYEwPGa4We1kGWeF4eqSTd
	 KK8LQ8E3C5QzZsGG4zUJH33Rw/5TPdwoxH6u+K5pnuSmUdSyGi+1Y+z/XKKsvNsrUR
	 E+CCxc5318FrdhAh06Rxzxxq5Tna7MyFnhGdtfTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 804E6F80553; Wed, 21 Jun 2023 00:09:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B54E5F80548;
	Wed, 21 Jun 2023 00:09:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA8FCF80163; Wed, 21 Jun 2023 00:08:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFBAEF80132
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 00:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFBAEF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=keBZDB/q
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 274586606F8A;
	Tue, 20 Jun 2023 23:08:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687298932;
	bh=g1Ge7OS0fr37jsbP/Xrz0cMOpZ9QFiuqkEuRXr45wpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=keBZDB/qPPd4GgrMzo8SeAUd+1s5SQOLo/TyAovssps9kWDPo9TVSne5g5X/uY1QK
	 wWAPE4tW9UVGnYJCPu/Fb9LATyCXwIqhAZ+gFUza0WZ5TnmP1RoNiFesbl8iZ3+4Q7
	 sLRk7KPxDV4hhxPMcyXxHzUFM6z6HHc/vNx05dEMvUh1PjWuK3tqillU2CLebZ4xIK
	 2gDQMMERY8VDHZEnVg8RlHEbytH5hbGoLltCuIzD4sIjfFDw8XC+6mDFB5/YC3sIon
	 UNplbzV0veEY/S+bytao02xVIS7gQyV8JATXT90lfovZn9mMWx2ev1JSB2zYxopbQ9
	 Ooi4YfeZYPl8A==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] kselftest/alsa: pcm-test: Decrease stream duration from 4
 to 2 seconds
Date: Tue, 20 Jun 2023 18:08:26 -0400
Message-ID: <20230620220839.2215057-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620220839.2215057-1-nfraprado@collabora.com>
References: <20230620220839.2215057-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MMVVZ5YO3VPLEL3GOCKBY6LPIGNTWGC7
X-Message-ID-Hash: MMVVZ5YO3VPLEL3GOCKBY6LPIGNTWGC7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMVVZ5YO3VPLEL3GOCKBY6LPIGNTWGC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently test_pcm_time() streams audio on each PCM with each
configuration for 4 seconds. This time can add up, and with the current
45 second kselftest timeout, some machines like mt8192-asurada-spherion
can't even run to completion. Lower the duration to 2 seconds to cut the
test duration in half, without reducing the test coverage.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 tools/testing/selftests/alsa/pcm-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index a2b6db33b513..de42fc7e9b53 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -258,7 +258,7 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 			  const char *test_name, snd_config_t *pcm_cfg)
 {
 	char name[64], key[128], msg[256];
-	const int duration_s = 4, margin_ms = 100;
+	const int duration_s = 2, margin_ms = 100;
 	const int duration_ms = duration_s * 1000;
 	const char *cs;
 	int i, err;
-- 
2.41.0

