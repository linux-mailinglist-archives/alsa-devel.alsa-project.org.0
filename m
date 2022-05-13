Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CC7527F3F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:08:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC4261698;
	Mon, 16 May 2022 10:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC4261698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688479;
	bh=0KjApRwlHSfSaQ3oLvBJ9lMLhJEMso/MwXWaXP2mF+c=;
	h=Date:Subject:To:From:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=toIDQx6+FC8xcbxRUudBZJA0WDErjRuSBKa8Z8Wyxv4HQsYzqXL0Ap4kuNmPWd2Bi
	 pVMf0rmSNcLO21XtpGELEX0YO/YMgyiT7LujORfNQnmXigdDoOwqK/1xuOgVL3+YYC
	 6jWizDEuOjgU4ixRk+xiy7dDNg9NRTJ2lBE2u90w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C397DF80558;
	Mon, 16 May 2022 10:04:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C7A7F80236; Fri, 13 May 2022 15:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FFC7F80083
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 15:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FFC7F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FqKw8GOA"
Received: by mail-pf1-x42e.google.com with SMTP id v11so7726719pff.6
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:from:content-transfer-encoding;
 bh=Yjtm4TDhkZtPjvLj2CJu9Tr06U0DT6HkX3URKOfA7lQ=;
 b=FqKw8GOAkZTyl4i0OmbpnBtWwJ+2ON7rOgQ6yPidXOsA6PstOKor82YhlbYaKAx+5G
 WXxtoxSqlXCREOl2yHGtTvc+bPghJt0nnhm87iu2PN4vNEEgRfsxrbYoiOvuPBTyPSM8
 aoHsSYQUHjkr4FTpXToHGAODE6qWmcpRnQzlDsqPKViodMYIzpOCdo3SkjVw+AP3eF8M
 6gvO4LtcYZnipBES8PdlJValHMAWvJtry9sQHe4Fadq8Cx1r5gGmDjSM43w/8/EyqeXp
 7giNmOFaeIdH4Js22sTXGQPhRBSIGfazq+bTJiFrLQ+x7X3o9/piDb8umPJCaQAOHCqZ
 Qdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:from:content-transfer-encoding;
 bh=Yjtm4TDhkZtPjvLj2CJu9Tr06U0DT6HkX3URKOfA7lQ=;
 b=WOi4G/RArBoVLYSUlkhsJbtoA3Ahh3y9kQhQveNAzqo1Y/00tFDqKlH7JLe63aYvWc
 TZpXYLqds1Z8RFXM1nJrYmlpvYP0eRVsn0/JKXdJOivE2o2HnUqzMX67ECAoXmAUTYjQ
 PJav2QoGxBU/f27zIEA7JVjx+OAWjOf6koygo8j9sQEsKApHyC7boT2re+CTTST0Mvym
 kNfMCXW4lqR8GDDkmP0V2FVMsVHx2p1jjgiBgGOgZAjQEIHWlKApJAg5koWbecIfV6QC
 250Ai1KNRujPpTg2mJrNRnLpDWlkvtYmKIkNgauKaBw1I4o0EAoaRqYU7/KwSrKuifBN
 iOrQ==
X-Gm-Message-State: AOAM530kfB5IgLknzGNDIML8XGMWqC07fA0c9iuRKnOP+vhsuIubsoRe
 F4qn7xc4VlE+5XWw2MI1Nbw=
X-Google-Smtp-Source: ABdhPJyxn8x4zJCImIbVxuOBToPY4MBUnHEEoB6fJu6X8/eii+QaSQa+kbmBfj42KmIdjbK0kGFKsA==
X-Received: by 2002:a62:a211:0:b0:50d:cdb2:87f4 with SMTP id
 m17-20020a62a211000000b0050dcdb287f4mr4525151pff.63.1652449262451; 
 Fri, 13 May 2022 06:41:02 -0700 (PDT)
Received: from [192.168.0.107] ([103.249.234.205])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170902e80700b0015e8d4eb207sm1879077plg.81.2022.05.13.06.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 06:41:02 -0700 (PDT)
Message-ID: <8598037d-0e24-9bc1-3f2c-a2751ec8e871@gmail.com>
Date: Fri, 13 May 2022 19:10:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH] selftests: alsa: Better error messages
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <skhan@linuxfoundation.org>
From: Siddh Raman Pant <siddhpant.gh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:51 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
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

This allows for potentially better machine-parsing due to an
expected / fixed format. Also because of eyecandy reasons.

Whenever possible, errors will start with the name of the
offending card/control, separated by the error with colons.

Whenever there is a description of an error given, the generated
error string from snd_strerror will be (mostly) enclosed in
parentheses at the end.

Clarity of error messages have been (hopefully) improved.

Signed-off-by: Siddh Raman Pant <siddhpant.gh@gmail.com>
---
 tools/testing/selftests/alsa/mixer-test.c | 94 +++++++++++------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index a38b89c28..4719b12a5 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -114,7 +114,7 @@ static void find_controls(void)
 
 	err = snd_config_load_string(&config, alsa_config, strlen(alsa_config));
 	if (err < 0) {
-		ksft_print_msg("Unable to parse custom alsa-lib configuration: %s\n",
+		ksft_print_msg("Unable to parse custom alsa-lib configuration (%s)\n",
 			       snd_strerror(err));
 		ksft_exit_fail();
 	}
@@ -128,7 +128,7 @@ static void find_controls(void)
 
 		err = snd_ctl_open_lconf(&card_data->handle, name, 0, config);
 		if (err < 0) {
-			ksft_print_msg("Failed to get hctl for card %d: %s\n",
+			ksft_print_msg("Card %d: Failed to get hctl (%s)\n",
 				       card, snd_strerror(err));
 			goto next_card;
 		}
@@ -177,9 +177,8 @@ static void find_controls(void)
 			err = snd_ctl_elem_info(card_data->handle,
 						ctl_data->info);
 			if (err < 0) {
-				ksft_print_msg("%s getting info for %d\n",
-					       snd_strerror(err),
-					       ctl_data->name);
+				ksft_print_msg("%s : %s while getting info\n",
+					       ctl_data->name, snd_strerror(err));
 			}
 
 			snd_ctl_elem_value_set_id(ctl_data->def_val,
@@ -192,20 +191,20 @@ static void find_controls(void)
 		/* Set up for events */
 		err = snd_ctl_subscribe_events(card_data->handle, true);
 		if (err < 0) {
-			ksft_exit_fail_msg("snd_ctl_subscribe_events() failed for card %d: %d\n",
+			ksft_exit_fail_msg("Card %d : snd_ctl_subscribe_events() failed (%d)\n",
 					   card, err);
 		}
 
 		err = snd_ctl_poll_descriptors_count(card_data->handle);
 		if (err != 1) {
-			ksft_exit_fail_msg("Unexpected descriptor count %d for card %d\n",
-					   err, card);
+			ksft_exit_fail_msg("Card %d : Unexpected descriptor count %d\n",
+					   card, err);
 		}
 
 		err = snd_ctl_poll_descriptors(card_data->handle,
 					       &card_data->pollfd, 1);
 		if (err != 1) {
-			ksft_exit_fail_msg("snd_ctl_poll_descriptors() failed for %d\n",
+			ksft_exit_fail_msg("Card %d : snd_ctl_poll_descriptors() failed (%d)\n",
 				       card, err);
 		}
 
@@ -236,8 +235,8 @@ static int wait_for_event(struct ctl_data *ctl, int timeout)
 	do {
 		err = poll(&(ctl->card->pollfd), 1, timeout);
 		if (err < 0) {
-			ksft_print_msg("poll() failed for %s: %s (%d)\n",
-				       ctl->name, strerror(errno), errno);
+			ksft_print_msg("%s : poll() failed (%d - %s)\n",
+				       ctl->name, errno, strerror(errno));
 			return -1;
 		}
 		/* Timeout */
@@ -248,12 +247,12 @@ static int wait_for_event(struct ctl_data *ctl, int timeout)
 						       &(ctl->card->pollfd),
 						       1, &revents);
 		if (err < 0) {
-			ksft_print_msg("snd_ctl_poll_descriptors_revents() failed for %s: %d\n",
+			ksft_print_msg("%s : snd_ctl_poll_descriptors_revents() failed (%d)\n",
 				       ctl->name, err);
 			return err;
 		}
 		if (revents & POLLERR) {
-			ksft_print_msg("snd_ctl_poll_descriptors_revents() reported POLLERR for %s\n",
+			ksft_print_msg("%s : snd_ctl_poll_descriptors_revents() reported POLLERR\n",
 				       ctl->name);
 			return -1;
 		}
@@ -265,7 +264,7 @@ static int wait_for_event(struct ctl_data *ctl, int timeout)
 
 		err = snd_ctl_read(ctl->card->handle, event);
 		if (err < 0) {
-			ksft_print_msg("snd_ctl_read() failed for %s: %d\n",
+			ksft_print_msg("%s : snd_ctl_read() failed (%d)\n",
 			       ctl->name, err);
 			return err;
 		}
@@ -283,7 +282,7 @@ static int wait_for_event(struct ctl_data *ctl, int timeout)
 		}
 
 		if ((mask & SND_CTL_EVENT_MASK_REMOVE) == SND_CTL_EVENT_MASK_REMOVE) {
-			ksft_print_msg("Removal event for %s\n",
+			ksft_print_msg("%s : Removal event\n",
 				       ctl->name);
 			return -1;
 		}
@@ -301,7 +300,7 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 
 	switch (snd_ctl_elem_info_get_type(ctl->info)) {
 	case SND_CTL_ELEM_TYPE_NONE:
-		ksft_print_msg("%s.%d Invalid control type NONE\n",
+		ksft_print_msg("%s.%d : Invalid control type NONE\n",
 			       ctl->name, index);
 		return false;
 
@@ -312,7 +311,7 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 		case 1:
 			break;
 		default:
-			ksft_print_msg("%s.%d Invalid boolean value %ld\n",
+			ksft_print_msg("%s.%d : Invalid boolean value %ld\n",
 				       ctl->name, index, int_val);
 			return false;
 		}
@@ -322,14 +321,14 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 		int_val = snd_ctl_elem_value_get_integer(val, index);
 
 		if (int_val < snd_ctl_elem_info_get_min(ctl->info)) {
-			ksft_print_msg("%s.%d value %ld less than minimum %ld\n",
+			ksft_print_msg("%s.%d : Value %ld is less than the minimum (%ld)\n",
 				       ctl->name, index, int_val,
 				       snd_ctl_elem_info_get_min(ctl->info));
 			return false;
 		}
 
 		if (int_val > snd_ctl_elem_info_get_max(ctl->info)) {
-			ksft_print_msg("%s.%d value %ld more than maximum %ld\n",
+			ksft_print_msg("%s.%d : Value %ld is more than the maximum (%ld)\n",
 				       ctl->name, index, int_val,
 				       snd_ctl_elem_info_get_max(ctl->info));
 			return false;
@@ -339,7 +338,7 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 		if (snd_ctl_elem_info_get_step(ctl->info) &&
 		    (int_val - snd_ctl_elem_info_get_min(ctl->info) %
 		     snd_ctl_elem_info_get_step(ctl->info))) {
-			ksft_print_msg("%s.%d value %ld invalid for step %ld minimum %ld\n",
+			ksft_print_msg("%s.%d : Value %ld is invalid for step %ld, minimum %ld\n",
 				       ctl->name, index, int_val,
 				       snd_ctl_elem_info_get_step(ctl->info),
 				       snd_ctl_elem_info_get_min(ctl->info));
@@ -351,14 +350,14 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 		int64_val = snd_ctl_elem_value_get_integer64(val, index);
 
 		if (int64_val < snd_ctl_elem_info_get_min64(ctl->info)) {
-			ksft_print_msg("%s.%d value %lld less than minimum %lld\n",
+			ksft_print_msg("%s.%d : Value %lld is less than the minimum (%lld)\n",
 				       ctl->name, index, int64_val,
 				       snd_ctl_elem_info_get_min64(ctl->info));
 			return false;
 		}
 
 		if (int64_val > snd_ctl_elem_info_get_max64(ctl->info)) {
-			ksft_print_msg("%s.%d value %lld more than maximum %lld\n",
+			ksft_print_msg("%s.%d : Value %lld is more than the maximum (%lld)\n",
 				       ctl->name, index, int64_val,
 				       snd_ctl_elem_info_get_max(ctl->info));
 			return false;
@@ -368,7 +367,7 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 		if (snd_ctl_elem_info_get_step64(ctl->info) &&
 		    (int64_val - snd_ctl_elem_info_get_min64(ctl->info)) %
 		    snd_ctl_elem_info_get_step64(ctl->info)) {
-			ksft_print_msg("%s.%d value %lld invalid for step %lld minimum %lld\n",
+			ksft_print_msg("%s.%d : Value %lld is invalid for step %lld, minimum %lld\n",
 				       ctl->name, index, int64_val,
 				       snd_ctl_elem_info_get_step64(ctl->info),
 				       snd_ctl_elem_info_get_min64(ctl->info));
@@ -380,13 +379,13 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 		int_val = snd_ctl_elem_value_get_enumerated(val, index);
 
 		if (int_val < 0) {
-			ksft_print_msg("%s.%d negative value %ld for enumeration\n",
+			ksft_print_msg("%s.%d : Negative value %ld for enumeration\n",
 				       ctl->name, index, int_val);
 			return false;
 		}
 
 		if (int_val >= snd_ctl_elem_info_get_items(ctl->info)) {
-			ksft_print_msg("%s.%d value %ld more than item count %ld\n",
+			ksft_print_msg("%s.%d : Value %ld is more than item count (%ld)\n",
 				       ctl->name, index, int_val,
 				       snd_ctl_elem_info_get_items(ctl->info));
 			return false;
@@ -427,7 +426,7 @@ static void test_ctl_get_value(struct ctl_data *ctl)
 
 	/* If the control is turned off let's be polite */
 	if (snd_ctl_elem_info_is_inactive(ctl->info)) {
-		ksft_print_msg("%s is inactive\n", ctl->name);
+		ksft_print_msg("%s : Inactive\n", ctl->name);
 		ksft_test_result_skip("get_value.%d.%d\n",
 				      ctl->card->card, ctl->elem);
 		return;
@@ -435,7 +434,7 @@ static void test_ctl_get_value(struct ctl_data *ctl)
 
 	/* Can't test reading on an unreadable control */
 	if (!snd_ctl_elem_info_is_readable(ctl->info)) {
-		ksft_print_msg("%s is not readable\n", ctl->name);
+		ksft_print_msg("%s : Not readable\n", ctl->name);
 		ksft_test_result_skip("get_value.%d.%d\n",
 				      ctl->card->card, ctl->elem);
 		return;
@@ -443,7 +442,7 @@ static void test_ctl_get_value(struct ctl_data *ctl)
 
 	err = snd_ctl_elem_read(ctl->card->handle, ctl->def_val);
 	if (err < 0) {
-		ksft_print_msg("snd_ctl_elem_read() failed: %s\n",
+		ksft_print_msg("snd_ctl_elem_read() failed (%s)\n",
 			       snd_strerror(err));
 		goto out;
 	}
@@ -474,7 +473,7 @@ static void test_ctl_name(struct ctl_data *ctl)
 	/* Only boolean controls should end in Switch */
 	if (strend(ctl->name, " Switch")) {
 		if (snd_ctl_elem_info_get_type(ctl->info) != SND_CTL_ELEM_TYPE_BOOLEAN) {
-			ksft_print_msg("%d.%d %s ends in Switch but is not boolean\n",
+			ksft_print_msg("%d.%d %s : Not a boolean, but name ends in Switch\n",
 				       ctl->card->card, ctl->elem, ctl->name);
 			name_ok = false;
 		}
@@ -484,7 +483,7 @@ static void test_ctl_name(struct ctl_data *ctl)
 	if (snd_ctl_elem_info_get_type(ctl->info) == SND_CTL_ELEM_TYPE_BOOLEAN &&
 	    snd_ctl_elem_info_is_writable(ctl->info)) {
 		if (!strend(ctl->name, " Switch")) {
-			ksft_print_msg("%d.%d %s is a writeable boolean but not a Switch\n",
+			ksft_print_msg("%d.%d %s : Not a Switch despite being a writeable boolean\n",
 				       ctl->card->card, ctl->elem, ctl->name);
 			name_ok = false;
 		}
@@ -542,11 +541,12 @@ static bool show_mismatch(struct ctl_data *ctl, int index,
 		/*
 		 * NOTE: The volatile attribute means that the hardware
 		 * can voluntarily change the state of control element
-		 * independent of any operation by software.  
+		 * independent of any operation by software.
 		 */
 		bool is_volatile = snd_ctl_elem_info_is_volatile(ctl->info);
-		ksft_print_msg("%s.%d expected %lld but read %lld, is_volatile %d\n",
-			       ctl->name, index, expected_int, read_int, is_volatile);
+		ksft_print_msg("%s.%d : Expected %lld, but read %lld (%s)\n",
+			       ctl->name, index, expected_int, read_int,
+			       (is_volatile ? "Volatile" : "Non-volatile"));
 		return !is_volatile;
 	} else {
 		return false;
@@ -590,7 +590,7 @@ static int write_and_verify(struct ctl_data *ctl,
 
 		err = snd_ctl_elem_read(ctl->card->handle, initial_val);
 		if (err < 0) {
-			ksft_print_msg("snd_ctl_elem_read() failed: %s\n",
+			ksft_print_msg("snd_ctl_elem_read() failed (%s)\n",
 				       snd_strerror(err));
 			return err;
 		}
@@ -602,7 +602,7 @@ static int write_and_verify(struct ctl_data *ctl,
 	 */
 	err = snd_ctl_elem_write(ctl->card->handle, w_val);
 	if (err < 0 && !error_expected) {
-		ksft_print_msg("snd_ctl_elem_write() failed: %s\n",
+		ksft_print_msg("snd_ctl_elem_write() failed (%s)\n",
 			       snd_strerror(err));
 		return err;
 	}
@@ -615,7 +615,7 @@ static int write_and_verify(struct ctl_data *ctl,
 
 	err = snd_ctl_elem_read(ctl->card->handle, read_val);
 	if (err < 0) {
-		ksft_print_msg("snd_ctl_elem_read() failed: %s\n",
+		ksft_print_msg("snd_ctl_elem_read() failed (%s)\n",
 			       snd_strerror(err));
 		return err;
 	}
@@ -631,13 +631,13 @@ static int write_and_verify(struct ctl_data *ctl,
 		err = wait_for_event(ctl, 0);
 		if (snd_ctl_elem_value_compare(initial_val, read_val)) {
 			if (err < 1) {
-				ksft_print_msg("No event generated for %s\n",
+				ksft_print_msg("%s : No event generated\n",
 					       ctl->name);
 				ctl->event_missing++;
 			}
 		} else {
 			if (err != 0) {
-				ksft_print_msg("Spurious event generated for %s\n",
+				ksft_print_msg("%s : Spurious event generated\n",
 					       ctl->name);
 				ctl->event_spurious++;
 			}
@@ -658,7 +658,7 @@ static int write_and_verify(struct ctl_data *ctl,
 			mismatch_shown = true;
 
 	if (!mismatch_shown)
-		ksft_print_msg("%s read and written values differ\n",
+		ksft_print_msg("%s : Read and written values differ\n",
 			       ctl->name);
 
 	return -1;
@@ -674,14 +674,14 @@ static void test_ctl_write_default(struct ctl_data *ctl)
 
 	/* If the control is turned off let's be polite */
 	if (snd_ctl_elem_info_is_inactive(ctl->info)) {
-		ksft_print_msg("%s is inactive\n", ctl->name);
+		ksft_print_msg("%s : Inactive\n", ctl->name);
 		ksft_test_result_skip("write_default.%d.%d\n",
 				      ctl->card->card, ctl->elem);
 		return;
 	}
 
 	if (!snd_ctl_elem_info_is_writable(ctl->info)) {
-		ksft_print_msg("%s is not writeable\n", ctl->name);
+		ksft_print_msg("%s : Not writeable\n", ctl->name);
 		ksft_test_result_skip("write_default.%d.%d\n",
 				      ctl->card->card, ctl->elem);
 		return;
@@ -689,7 +689,7 @@ static void test_ctl_write_default(struct ctl_data *ctl)
 
 	/* No idea what the default was for unreadable controls */
 	if (!snd_ctl_elem_info_is_readable(ctl->info)) {
-		ksft_print_msg("%s couldn't read default\n", ctl->name);
+		ksft_print_msg("%s : Couldn't read default\n", ctl->name);
 		ksft_test_result_skip("write_default.%d.%d\n",
 				      ctl->card->card, ctl->elem);
 		return;
@@ -808,14 +808,14 @@ static void test_ctl_write_valid(struct ctl_data *ctl)
 
 	/* If the control is turned off let's be polite */
 	if (snd_ctl_elem_info_is_inactive(ctl->info)) {
-		ksft_print_msg("%s is inactive\n", ctl->name);
+		ksft_print_msg("%s : Inactive\n", ctl->name);
 		ksft_test_result_skip("write_valid.%d.%d\n",
 				      ctl->card->card, ctl->elem);
 		return;
 	}
 
 	if (!snd_ctl_elem_info_is_writable(ctl->info)) {
-		ksft_print_msg("%s is not writeable\n", ctl->name);
+		ksft_print_msg("%s : Not writeable\n", ctl->name);
 		ksft_test_result_skip("write_valid.%d.%d\n",
 				      ctl->card->card, ctl->elem);
 		return;
@@ -868,7 +868,7 @@ static bool test_ctl_write_invalid_value(struct ctl_data *ctl,
 	/* ...but some devices will clamp to an in range value */
 	err = snd_ctl_elem_read(ctl->card->handle, val);
 	if (err < 0) {
-		ksft_print_msg("%s failed to read: %s\n",
+		ksft_print_msg("%s : Failed to read (%s)\n",
 			       ctl->name, snd_strerror(err));
 		return true;
 	}
@@ -1026,14 +1026,14 @@ static void test_ctl_write_invalid(struct ctl_data *ctl)
 
 	/* If the control is turned off let's be polite */
 	if (snd_ctl_elem_info_is_inactive(ctl->info)) {
-		ksft_print_msg("%s is inactive\n", ctl->name);
+		ksft_print_msg("%s : Inactive\n", ctl->name);
 		ksft_test_result_skip("write_invalid.%d.%d\n",
 				      ctl->card->card, ctl->elem);
 		return;
 	}
 
 	if (!snd_ctl_elem_info_is_writable(ctl->info)) {
-		ksft_print_msg("%s is not writeable\n", ctl->name);
+		ksft_print_msg("%s : Not writeable\n", ctl->name);
 		ksft_test_result_skip("write_invalid.%d.%d\n",
 				      ctl->card->card, ctl->elem);
 		return;
-- 
2.35.1
