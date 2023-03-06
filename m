Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814626AC580
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 16:35:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27DDE1130;
	Mon,  6 Mar 2023 16:34:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27DDE1130
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678116942;
	bh=7+nAtHf2/40sJdNDudrlb9sywI5p24XSs9r4jtaXcho=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dYpjOjjolvZyevHBuFVxMBfLo7Y9213fAxVUwMG3s8kVsXSxq6W7yN0YgPkY0FO4E
	 QgvT+MzIp03C5IV+yykCD0QyNK2ryGQcS9H1M9woiUYCM0mjoV+JQXaY9X2yp92k6I
	 RZHGqdjYZ+0/YWGJ0nIRxeZuzF+4/kz1JQshPhMM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01D34F80527;
	Mon,  6 Mar 2023 16:34:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD29EF80529; Mon,  6 Mar 2023 16:34:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD2EFF80431
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 16:33:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD2EFF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=swgC7WJo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B41E8B80EAE;
	Mon,  6 Mar 2023 15:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA15C433A7;
	Mon,  6 Mar 2023 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678116818;
	bh=7+nAtHf2/40sJdNDudrlb9sywI5p24XSs9r4jtaXcho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=swgC7WJo+uPv82x70+Bo9D1vcq7rpG+Bp3FC2WVZCMnru14hGHhSmUpuNvozX5O5C
	 0mVzx2BpmJ8kY47FTsnMdaYyNvnBq5yAeJuAsf/lJcAouob+vErhxr6YooyhDTgXRr
	 /WZx18ciPEirdlqH80ylft6mTuitZzAjUdZNf86DZtZHEzAgCbaHqE9izbqHFnQtXX
	 slSQxP5oPY0PvFizyZ5dpcNHU7CW9JcRvoO1yDpLWKwXXW4294ABbc8pJ2jAmWor4j
	 QowkisyLZcUvhqd5wg5gMYVaTv+b9ZXX0G+Rg+IPsQjrlk/UgsSO3QKxANNtbMM45r
	 l/F1L54KBmVAg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 06 Mar 2023 15:33:28 +0000
Subject: [PATCH 1/2] kselftest/alsa - mixer: Always log control names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-alsa-log-ctl-name-v1-1-ac0f10cc4db2@kernel.org>
References: <20230223-alsa-log-ctl-name-v1-0-ac0f10cc4db2@kernel.org>
In-Reply-To: <20230223-alsa-log-ctl-name-v1-0-ac0f10cc4db2@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.13-dev-bd1bf
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7+nAtHf2/40sJdNDudrlb9sywI5p24XSs9r4jtaXcho=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkBgfNsxpvllJ20MQSB8Ro22PZttfPXnQqWNYGee+C
 JodG21iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZAYHzQAKCRAk1otyXVSH0EF2B/
 9Kpuja8aY4ykr8vAYRIXEzSKrLR3yhtIg2OPQ/XSUdv7+E+UvHmfF+8dZocSRsFZU5+VpFJ8qF8n2X
 o+ASKKAdLxmBHBN2Ob89qTbSbM8fYFxzE0E1OifWoXVOrSfkcJK+zcSiYezsQU/2vtlzPzVPzRqFHe
 aa5gN6X119dqj2G3KIqNQB1m0/k+im4ktAi6RPtk9KLlC3u8SWDs3zAJaUE6id9b7vgl8nKV70wpwt
 TCiZUjCsAkRGy6qhSS/WSy/Yo74qbolAJ5ongTq/XEfeV61L11ZZMGH1YoYLg2DDJs3CZmkhmwjxt1
 yydw2lis3VywnxrUHi8srI+AsNCefm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: Q5S36ADKOTAHQJFEPLIFLFBYPMZAVGUC
X-Message-ID-Hash: Q5S36ADKOTAHQJFEPLIFLFBYPMZAVGUC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5S36ADKOTAHQJFEPLIFLFBYPMZAVGUC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently we only log the names of controls on error but it can be useful
to know what control we're testing (for example, when looking at why the
tests are taking a while to run). People looking at test logs may not have
direct access to the target system. This will increase the amount we write
to the console, hopefully that's buffered.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/mixer-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 05f1749ae19d..12f58c9c17ab 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -422,6 +422,9 @@ static void test_ctl_name(struct ctl_data *ctl)
 	bool name_ok = true;
 	bool check;
 
+	ksft_print_msg("%d.%d %s\n", ctl->card->card, ctl->elem,
+		       ctl->name);
+
 	/* Only boolean controls should end in Switch */
 	if (strend(ctl->name, " Switch")) {
 		if (snd_ctl_elem_info_get_type(ctl->info) != SND_CTL_ELEM_TYPE_BOOLEAN) {

-- 
2.30.2

