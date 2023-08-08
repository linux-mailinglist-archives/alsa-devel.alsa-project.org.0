Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3C5773A4E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 14:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58895827;
	Tue,  8 Aug 2023 14:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58895827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691499497;
	bh=S0FBs7xD3Rf0XgcDIGN+SZnoxzu5hScAnRLm9gSsKfo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EJFAzpkujZOt22olcMaYKJ7V7GYyC/Hjmq6SzuFzExnhe33kJZGjYDGqqY30hNbLy
	 d9ISMbWuPlqu5asB5x8zmJYO1pS2rQs3h53Hc5e/QazDY8XCHlFpu7BJsEG3WqKAuV
	 hEnUhGDCjPxhgf6NlQVBGAg08Cdh09UyZVTf7b9o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B69CEF80549; Tue,  8 Aug 2023 14:57:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C7C0F80154;
	Tue,  8 Aug 2023 14:57:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68486F80534; Tue,  8 Aug 2023 14:57:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 552A2F800FE
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 14:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 552A2F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ALuJOr5z
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EB9462535;
	Tue,  8 Aug 2023 12:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7EDC433C8;
	Tue,  8 Aug 2023 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691499430;
	bh=S0FBs7xD3Rf0XgcDIGN+SZnoxzu5hScAnRLm9gSsKfo=;
	h=From:To:Cc:Subject:Date:From;
	b=ALuJOr5zjEN0HXUfZj23CYhl/qslnq1Ul9nu3AiwMPIfPvJxHwRaegVzju60uur8J
	 bxVTyQn9a7pQID1YwvQ3TVHiikXZM1AmhN5BNVELbwnMc8OTuZ1NsJNERgjxihgX2S
	 pKSUqZ5hvzW9S9flCMuRgZKlCnC3T/DVApS/RFXg3p5EDvA7MYF1/bWBt8TT3PvvlH
	 Dgo/3KPmI7ch1A15zpeyGO1dvP81nxbIj6IiYRwEDWpWh8fVHB6LXElveU+E4tgvd3
	 EAQMYZQwCf7CrbdlXAhZm1vtzl98mEbsXttJ17Er5BgOz1bwuD+EObjpfj7EPhBtRF
	 9XR+xjzLgvYWw==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: aw88261: avoid uninitialized variable warning
Date: Tue,  8 Aug 2023 14:56:54 +0200
Message-Id: <20230808125703.1611325-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MIFBUDE67PWBCKZBGKLW7GZTTNT3KET2
X-Message-ID-Hash: MIFBUDE67PWBCKZBGKLW7GZTTNT3KET2
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIFBUDE67PWBCKZBGKLW7GZTTNT3KET2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

aw88261_reg_update() returns an unintialized error code in the
success path:

sound/soc/codecs/aw88261.c:651:7: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
                if (aw_dev->prof_cur != aw_dev->prof_index) {
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/codecs/aw88261.c:660:9: note: uninitialized use occurs here
        return ret;
               ^~~
sound/soc/codecs/aw88261.c:651:3: note: remove the 'if' if its condition is always true
                if (aw_dev->prof_cur != aw_dev->prof_index) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Return zero instead here.

Fixes: 028a2ae256916 ("ASoC: codecs: Add aw88261 amplifier driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/aw88261.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 82923b454dd47..6e2266b713862 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -652,6 +652,8 @@ static int aw88261_reg_update(struct aw88261 *aw88261, bool force)
 			ret = aw88261_dev_fw_update(aw88261);
 			if (ret)
 				return ret;
+		} else {
+			ret = 0;
 		}
 	}
 
-- 
2.39.2

