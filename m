Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4F4AB779
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 10:23:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52083210;
	Mon,  7 Feb 2022 10:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52083210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644225836;
	bh=XrJdNyEHxgO04eWbYS+P5myhoR15kWeRwGv0iod5Ndg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UU7ST8ivzy8dqoJ9H606YgP1pwTCgv1Ecl+KVAHYdWZOsRSYUq7yiJQPD0XtmsB65
	 7taFcmpTSrQKr6CeINHl8DjYXytMkkuAwMIa3hZ5O4mgZreOCKmOUswlJXd1lUUqKS
	 oqZPGMx/86xxs4xcyyCPKk5tve4+8ABqs6wxnE6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D85F800E1;
	Mon,  7 Feb 2022 10:22:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29282F800E1; Mon,  7 Feb 2022 10:22:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 379CBF800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 10:22:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 379CBF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C2zZvx93"
Received: by mail-wr1-x431.google.com with SMTP id e3so9553762wra.0
 for <alsa-devel@alsa-project.org>; Mon, 07 Feb 2022 01:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nZXczi6C0VGVtmz89xEAfWTFn3tEw4CtQGzJll0eCx4=;
 b=C2zZvx93c1YXMt79tE8s8Jb3PihXIjoInyAK1MvgNVVXGccfgn9/SllQZRW1jKrZYF
 2ho9PDLah+3FbqS4d+l2VEvYjavolvmDhi7cQagujQbESdY84abjGgqJOJ9tRhv2Sje0
 z76oNUH8LHs6e1CKpGldvwzh1XJdncNUFItMfL39LtF2/mo1DOxg53yamVyv6+Fl/Dxx
 y10C8NXFT4bhLLwn/aiVMwMGx+Bpx2Wc5xz5KwJ4kv9U36R/cnQYpZlGvw2FyEnGFcw1
 xlaqEbaA3oEIq1xE3oXXoME6BghM8oQoINGDpGqRrd59yNJ4uIVYcKzv0DtC4LjeWffG
 UkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nZXczi6C0VGVtmz89xEAfWTFn3tEw4CtQGzJll0eCx4=;
 b=C4qLddjw2EmJSYTBTiAJpVSf288oUb05wlMM2r/PZKphBbbm0mDXRwza+81QByA+4G
 tZYYyeO4xO0Ny0QppnF5dVgtaSrpPGr0Ag9oyWNV4HopeU6CrMJmoj4BkS68iLv0lR0w
 EaI99rlBgTKev4h0bre66Mrb+f1ouXkCVQsVEhmp/cYVCJkkAFZ1YjxKmtlDLMUx5NtA
 bQ26jK/xkuzXHoX2Fi3S52d/hHdY7jaf3wAEYuS7VrsAAu4FiKr5p8+bFGNYa1XDquJv
 m4xkZA4phkNioLAaw6AzSr/6G9kRpa0sOy9xvF0OahUp7zz1BOU4CajoNihhnlqgX5Tw
 B47g==
X-Gm-Message-State: AOAM533Q9dD4ZaRry/tl0UJm6rgo+yigq7hwCPlu/n64YRwsQRpdMbv3
 gunT9/aEB5gqn3ycYndYChc=
X-Google-Smtp-Source: ABdhPJybMsIXGUh1RzkJaVESTlrR03bfCQ5VzIOs1f03/DoZiXQy4UAlySTzfi0iky0Us5HZSHJx8Q==
X-Received: by 2002:adf:f690:: with SMTP id v16mr510766wrp.707.1644225758361; 
 Mon, 07 Feb 2022 01:22:38 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id g7sm9866205wmq.3.2022.02.07.01.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 01:22:37 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <shuah@kernel.org>,
 alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
Subject: [PATCH][next] kselftest: alsa: fix spelling mistake "desciptor" ->
 "descriptor"
Date: Mon,  7 Feb 2022 09:22:35 +0000
Message-Id: <20220207092235.240284-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

There are some spelling mistakes in some ksft messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/alsa/mixer-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index d0b788b8d287..eb2213540fe3 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -198,7 +198,7 @@ static void find_controls(void)
 
 		err = snd_ctl_poll_descriptors_count(card_data->handle);
 		if (err != 1) {
-			ksft_exit_fail_msg("Unexpected desciptor count %d for card %d\n",
+			ksft_exit_fail_msg("Unexpected descriptor count %d for card %d\n",
 					   err, card);
 		}
 
@@ -248,12 +248,12 @@ static int wait_for_event(struct ctl_data *ctl, int timeout)
 						       &(ctl->card->pollfd),
 						       1, &revents);
 		if (err < 0) {
-			ksft_print_msg("snd_ctl_poll_desciptors_revents() failed for %s: %d\n",
+			ksft_print_msg("snd_ctl_poll_descriptors_revents() failed for %s: %d\n",
 				       ctl->name, err);
 			return err;
 		}
 		if (revents & POLLERR) {
-			ksft_print_msg("snd_ctl_poll_desciptors_revents() reported POLLERR for %s\n",
+			ksft_print_msg("snd_ctl_poll_descriptors_revents() reported POLLERR for %s\n",
 				       ctl->name);
 			return -1;
 		}
-- 
2.34.1

