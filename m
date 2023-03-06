Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 889E76AC57D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 16:35:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D83B1125;
	Mon,  6 Mar 2023 16:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D83B1125
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678116940;
	bh=kjkLcMTHMhUQo+1dss9UtQxijigDsuNvBFLdj/WoWN4=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L/BmObfdzSN5lE/gflmzfILimyZ5MM2n3i58asJ7F6mmxPygyVkVsAf8eP6ljJDtK
	 WF2CQvF6Zb/7b58RKG3o5uxkakFTJKhz2BRHlmdO/0HW5oVeFTt+Fl6XXXtNwTUTLD
	 3ppEfIU4diMI/RQfAj5yaW1l7zoMCC6hlB1ifXsY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 925D5F804FE;
	Mon,  6 Mar 2023 16:34:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AB31F8042F; Mon,  6 Mar 2023 16:33:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A73ECF800DF
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 16:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A73ECF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e+wX/eVs
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 99DBEB80EBB;
	Mon,  6 Mar 2023 15:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBEBC433EF;
	Mon,  6 Mar 2023 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678116820;
	bh=kjkLcMTHMhUQo+1dss9UtQxijigDsuNvBFLdj/WoWN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e+wX/eVsuUJwCEoIWhFLHcOcuml9DySTPbsOllizEjQo1TjE5Bywzoi63J8GJjCzN
	 TLiC1qgsF6kb9nDgF4k2VfYG2rCL4aBpYzN3mkgvT9vfEGk95EULm6aG5ZP/AM9KKv
	 I6CA3hVLTYrI/QdlOC3+KoWlzkli/B3S9qXDbpoXEja5R7T6KD3JrPgYM9LccxR/IG
	 KUfcMa1lnDiueTriDUmjA8cRUjxxhAq3ySSnyQOMEgjGMGvXrQHTeILZARmHzmMnKI
	 4c2M5TZP61e5UlNXT7ZRJCLrVFGMcm+jLWIKetMIBHI+fbtnIt1V5wsjNnEopAEKgV
	 iZvNHfqquevng==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 06 Mar 2023 15:33:29 +0000
Subject: [PATCH 2/2] kselftest/alsa: Log card names during startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-alsa-log-ctl-name-v1-2-ac0f10cc4db2@kernel.org>
References: <20230223-alsa-log-ctl-name-v1-0-ac0f10cc4db2@kernel.org>
In-Reply-To: <20230223-alsa-log-ctl-name-v1-0-ac0f10cc4db2@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.13-dev-bd1bf
X-Developer-Signature: v=1; a=openpgp-sha256; l=2413; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kjkLcMTHMhUQo+1dss9UtQxijigDsuNvBFLdj/WoWN4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkBgfOjSTU6E4IeqLtriafYbjJ+o8/50y5yBIJdGX1
 pRzA5bGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZAYHzgAKCRAk1otyXVSH0A0qB/
 9cwhfgE/NUT2kBgs5Adm3g8+H0MgXxeiR3TOPMfeXM+L9An6QrYirbEneOjFDZ+l06jguu7mkg2FHS
 eTm+KKN6FSizi9W1M5DCCbv0DojvNKD4MSI2WrCYkEDhM5kSTDjsnYSll97FCTURSkD+Vus4sCl/hi
 wRQf8HC8o6rRerZjFc58AZNz/L0A8JcuSfg8j11IGILtpry3YC1TPDFARXTllbPjdtEu4bkbVD3V6e
 p95SgsJyJhSZmFsnBMBTP+fQYAU3Qj7y96cWcxHv03Jl0+S1GEz+bGQ5ilG6agEstOBU0WM0jYmfKI
 d701WCf5n/wMXeH/9dd3lU1QncEyJ1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: AHPLRIS3YQQRXWOK5IIYDFSPF3QPUHAV
X-Message-ID-Hash: AHPLRIS3YQQRXWOK5IIYDFSPF3QPUHAV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHPLRIS3YQQRXWOK5IIYDFSPF3QPUHAV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It can be helpful to know which card numbers apply to which cards in a
multi-card system so log the card names when we start the test programs.
People looking at the logs may not have direct access to the systems being
tested.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/mixer-test.c | 10 ++++++++++
 tools/testing/selftests/alsa/pcm-test.c   | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 12f58c9c17ab..f9307bb0e453 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -63,6 +63,7 @@ static void find_controls(void)
 	struct card_data *card_data;
 	struct ctl_data *ctl_data;
 	snd_config_t *config;
+	char *card_name, *card_longname;
 
 	card = -1;
 	if (snd_card_next(&card) < 0 || card < 0)
@@ -84,6 +85,15 @@ static void find_controls(void)
 			goto next_card;
 		}
 
+		err = snd_card_get_name(card, &card_name);
+		if (err != 0)
+			card_name = "Unknown";
+		err = snd_card_get_longname(card, &card_longname);
+		if (err != 0)
+			card_longname = "Unknown";
+		ksft_print_msg("Card %d - %s (%s)\n", card,
+			       card_name, card_longname);
+
 		/* Count controls */
 		snd_ctl_elem_list_malloc(&card_data->ctls);
 		snd_ctl_elem_list(card_data->handle, card_data->ctls);
diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 58b525a4a32c..d73600e93e83 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -149,6 +149,7 @@ static void missing_devices(int card, snd_config_t *card_config)
 static void find_pcms(void)
 {
 	char name[32], key[64];
+	char *card_name, *card_longname;
 	int card, dev, subdev, count, direction, err;
 	snd_pcm_stream_t stream;
 	struct pcm_data *pcm_data;
@@ -175,6 +176,15 @@ static void find_pcms(void)
 			goto next_card;
 		}
 
+		err = snd_card_get_name(card, &card_name);
+		if (err != 0)
+			card_name = "Unknown";
+		err = snd_card_get_longname(card, &card_longname);
+		if (err != 0)
+			card_longname = "Unknown";
+		ksft_print_msg("Card %d - %s (%s)\n", card,
+			       card_name, card_longname);
+
 		card_config = conf_by_card(card);
 
 		card_data = calloc(1, sizeof(*card_data));

-- 
2.30.2

