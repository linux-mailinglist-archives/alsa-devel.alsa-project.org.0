Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A123C7BC9F8
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Oct 2023 23:43:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A204F820;
	Sat,  7 Oct 2023 23:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A204F820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696715008;
	bh=oVYIHfya+S9ymMNfXl+4W8tUu32ofHSq1laES2IezkU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SZ8nhpQciZS8kWZdzY6QjQc5pTiVc+RDIk/DB+0EewYkPs5rVaSMKxjpgcgUlVmre
	 AEg7IVxA+nK3eA6YeYkVIW6drcODE97KtQ1nniTwygUUhLD2G7TY20GyFtAUSs0HHD
	 rLmzZCoHbRA7ZpsUVWeCf2OnqnS9lbJexVM0GttM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3291F80551; Sat,  7 Oct 2023 23:42:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B335F801EB;
	Sat,  7 Oct 2023 23:42:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0655BF8047D; Sat,  7 Oct 2023 23:38:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CFCBF801EB
	for <alsa-devel@alsa-project.org>; Sat,  7 Oct 2023 23:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CFCBF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G6Qu3Wlp
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-534659061afso5499820a12.3
        for <alsa-devel@alsa-project.org>;
 Sat, 07 Oct 2023 14:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696714719; x=1697319519;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+I/45KrjHN3ZeY3XR2SSNQX+9zJsoPF88BTVLY4S8EE=;
        b=G6Qu3WlpFTVaeNdRsbNjtv0VNINNh9iS7BpY9+lkvvmZakKt7AZrm35mqGsv7Qebpw
         WPiyU1z9nUjCpk1MdmX+A2ZYSSZZyjT90MYE5fiE87wRuPEsfvfmAH/TdMbNlhdVhSW4
         ijz2UUKx6s53qvnTt4yPHu8GEcL6LYYyU0U2xOg5fc9M6xryQ45g5rlrPufByypB8OJL
         5xvf0piwKUu+hYOKopEnI9jlgqEQaQrHmCA/k6Fx8Ef5B09cavP7eZD1/inssDZqWkeO
         IrwruK4VMo44G7EC3l3viRlRDPE+cXYbqdoLlky3TlrjBdkRCzeOA+fXpYSPOkAXkd3r
         aobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696714719; x=1697319519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+I/45KrjHN3ZeY3XR2SSNQX+9zJsoPF88BTVLY4S8EE=;
        b=EMFL5lhA/BB/COZnaxcNZkTfdaNj00pYRQh5dWZWHonQluWU5OQBwWkhZcB8T4YBCc
         M9dvTNKtW5lE8PZouk8D4g/621t0iO5fWYxTAOoAMXhbfp+xvYnZyo5iPQ+WC7pqoE/s
         uQEHmLIz6RNQqA8zUWjJM/Or01mKtkj0Llfh3mbJKGy8OUY4Sssj2ChhWsRzwXuCKHy/
         03Qqn13BT/q1iQYH1GbfmhbsJCj9w2LFubHIAaY9V/DK3ZGrrN8Kb6IZ13rMZ6uqinvg
         5pU2CmayQQlgfj0kcNVpca+3ABi9HjPxWKdaAOto+/+2Ou4E1baEfF9BC2Qh16MeGG2e
         H7Bw==
X-Gm-Message-State: AOJu0YzzZrHJNAo9wT2kTzh4Fi4qcBYoznVIITdHnM8zqsgYh09gWQDi
	Me4NL6al66D7Ucqq8MLsecI=
X-Google-Smtp-Source: 
 AGHT+IEm65+9UiTL7QBI6KanJVCoMNLDB1gai1TEEGtv70vmFAuFPNm7Zmwz6Sd2yjaWzE3L7L+Z1Q==
X-Received: by 2002:aa7:dac3:0:b0:52b:d169:b382 with SMTP id
 x3-20020aa7dac3000000b0052bd169b382mr9888941eds.29.1696714718736;
        Sat, 07 Oct 2023 14:38:38 -0700 (PDT)
Received: from dell.intranet (77-255-201-154.dynamic.inetia.pl.
 [77.255.201.154])
        by smtp.gmail.com with ESMTPSA id
 w15-20020aa7cb4f000000b0052a063e52b8sm4269087edt.83.2023.10.07.14.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 14:38:38 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] ASoC: ti: ams-delta: Fix cx81801_receive() argument types
Date: Sat,  7 Oct 2023 23:38:18 +0200
Message-ID: <20231007213820.376360-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TBTG55IPILOGX4AGNCDS332QKD5QPR6J
X-Message-ID-Hash: TBTG55IPILOGX4AGNCDS332QKD5QPR6J
X-MailFrom: jmkrzyszt@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TBTG55IPILOGX4AGNCDS332QKD5QPR6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since types of arguments accepted by tty_ldis_ops::receive_buf() have
changed, the driver no longer builds.

.../linux/sound/soc/ti/ams-delta.c:403:24: error: initialization of 'void (*)(struct tty_struct *, const u8 *, const u8 *, size_t)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const unsigned char *, unsigned int)'} from incompatible pointer type 'void (*)(struct tty_struct *, const u8 *, const char *, int)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const char *, int)'} [-Werror=incompatible-pointer-types]
  403 |         .receive_buf = cx81801_receive,

Fix it.

Fixes: e8161447bb0c ("tty: make tty_ldisc_ops::*buf*() hooks operate on size_t")
Fixes: 892bc209f250 ("tty: use u8 for flags")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 sound/soc/ti/ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 371943350fdf..666057d50ea0 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -336,8 +336,8 @@ static void cx81801_hangup(struct tty_struct *tty)
 }
 
 /* Line discipline .receive_buf() */
-static void cx81801_receive(struct tty_struct *tty, const u8 *cp,
-		const char *fp, int count)
+static void cx81801_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
+			    size_t count)
 {
 	struct snd_soc_component *component = tty->disc_data;
 	const unsigned char *c;
-- 
2.42.0

