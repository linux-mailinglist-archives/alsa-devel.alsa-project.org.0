Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A466C2170
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:31:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 848FA1F3;
	Mon, 20 Mar 2023 20:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 848FA1F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679340662;
	bh=fr2CuXSFVpYeU56yZxoL8XtsiYWJB8Vxi7nhW2OwLyI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Dqwzq/qMAq8jG41ATBVMB2zZWCOwDrsO8m5pBQk/N4y/w9x0wI4f/1LevVe9OhRh3
	 Oxaf3IYh9ZjEedQ7cxbT9ftxJpeKn9fXhTSFd3iNGHix1/oBkgy1fnsT6IZ4ZI8Wl9
	 9QEo58V0fnPh6ePD2hNFBkGuu6uKoybE5vAEkDrA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98F35F8055A;
	Mon, 20 Mar 2023 20:28:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EBEDF80423; Sat, 18 Mar 2023 15:15:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 644A7F8016C
	for <alsa-devel@alsa-project.org>; Sat, 18 Mar 2023 15:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 644A7F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TfrtD2Sa
Received: by mail-pj1-x102a.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so8064102pjb.0
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Mar 2023 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679148895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ie63cbXEy8BAbd5KVjjijgBU9GTxqxjV4iB878fCIoI=;
        b=TfrtD2Sabn81lmn99KSIbRlFfr7VGeREmmqCcR+Z/a08xn1SbXAoRoN02J5uT+Ypmm
         BsflJgryeaHIPgVbZbHwjebUUMVpRy34EmyTLIWfS3lGi6DGjKL2Kiyvr3vC2FZ9b6jc
         5KQxSKDgGtSRsdimRDN11A1Z6TXEiFBocRIh6NqzOoiwd0nLXaeXAOdNPpgISyMMSWb8
         Cr7opaM0p/FSMX0HXN3rxaOoNqpk//20hOEzvCVbOIddkSO2vZbylVceq1MyVQlE0GLq
         HMBf0d0IRCY3Fv5GfaHuEX2N/Uf3En6BMgj5gDSoUovqr9wVddB6p8M88K9tNXWjQ4fc
         D4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679148895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ie63cbXEy8BAbd5KVjjijgBU9GTxqxjV4iB878fCIoI=;
        b=DnNbCg2Lynz7pgYpGIj54Bq0/IXggYxi7M4ELbK2YsDP/N0gWnZtJOEx29Ye1ewMAc
         Oln8VcR1d9HhppS4lbKuqNw875HDEjTTwJnvVhrBi3oZ2AUWNzYgPFUfyJNyH8LMZijT
         A5ZMd3XbldUZHK7c6mpUvRCiparHmXaSs9rqRJ0q//5r4Ygp20rPuAozr7O0xElzYEEm
         4S1pXCruhnpYrNUk+1uB6UymOIAKP/kSXoCeRzPbIWFuhfXFVQRWPm2hytYIvvXtuQCI
         cAP1wb5+T+emCnqsRQZDcSaGXoSyxHoB1AaO/j51U0A/VDsjnJT9a47Ao4aRGxqf1H8S
         Dtxw==
X-Gm-Message-State: AO0yUKU0FbKBvPgh+3zZaPNPMjfAVn+ho135wr2LvJ4Pm5pQ6LfNe9lC
	48rbCGZfieYykaiK2FbJwFs=
X-Google-Smtp-Source: 
 AK7set9pDaIiV5oyE+oL92o3+T7xCiiXmh4zYO6MPB75EV4hMWBAHzzfCK4y75iVUth2tqOTfklfYg==
X-Received: by 2002:a17:902:f28d:b0:19a:ad2f:2df9 with SMTP id
 k13-20020a170902f28d00b0019aad2f2df9mr8286493plc.55.1679148895214;
        Sat, 18 Mar 2023 07:14:55 -0700 (PDT)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84])
        by smtp.gmail.com with ESMTPSA id
 jh17-20020a170903329100b0019a96a6543esm3345867plb.184.2023.03.18.07.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 07:14:54 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: cs35l41: Add 12288000 clk freq to cs35l41_fs_mon clk
 config
Date: Sat, 18 Mar 2023 22:14:39 +0800
Message-Id: <20230318141440.29023-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6U7YYRUUBF4CWH5V3HAMI2S7EQS524WN
X-Message-ID-Hash: 6U7YYRUUBF4CWH5V3HAMI2S7EQS524WN
X-Mailman-Approved-At: Mon, 20 Mar 2023 19:28:22 +0000
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Jianhua Lu <lujianhua000@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6U7YYRUUBF4CWH5V3HAMI2S7EQS524WN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are 8 cs35l41 speaker amplifier connected to TDM
in my Xiaomi Mi Pad 5 Pro tablet. In this case, it's necessary
to set 12288000 (48000 * 32 * 8) clk freq for it.

rate=48000, slot_width=32, slots=8.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 sound/soc/codecs/cs35l41.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 9ec01a5f09ca..6ac501f008ec 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -150,6 +150,7 @@ static const struct cs35l41_fs_mon_config cs35l41_fs_mon[] = {
 	{ 5644800,	16,	24 },
 	{ 6000000,	16,	24 },
 	{ 6144000,	16,	24 },
+	{ 12288000,	0,	0 },
 };
 
 static int cs35l41_get_fs_mon_config_index(int freq)
-- 
2.39.2

