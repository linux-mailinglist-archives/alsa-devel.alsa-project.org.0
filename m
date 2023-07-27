Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B39765D64
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 22:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 194C482A;
	Thu, 27 Jul 2023 22:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 194C482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690489924;
	bh=ekRYz8xbmy5B35whJHZOKa2NN55Pqt6uzdTr4Owj6tU=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gvtK4Jr04a0a+GJY7cHbcEflO/x1Nr9TInat74YAQUlTXNerhqAmF9RgPzL/HhY05
	 eNcWZzv6IdR5zLA+6ZfIZpVgkqQbQhF9KzUapaUdPfXIZLMiZQ+pwTJHWjus/IYtZY
	 pidhLL1yvPeRmAJfGSy+jgt+mEDqjTaoA23oqjV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54D25F80310; Thu, 27 Jul 2023 22:31:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6156F80163;
	Thu, 27 Jul 2023 22:31:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5B58F8019B; Thu, 27 Jul 2023 22:31:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69EEEF80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 22:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69EEEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=JQC4MlN3
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-c64ef5bde93so1323549276.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jul 2023 13:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690489854; x=1691094654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lEKw26+6RZdhI/anFRn58wCKq7xAbjFEyn0dAkNnpG0=;
        b=JQC4MlN38CgOxQdZXvHWUw5mbVGP5ZPWx3/5G8h/aF0HPkdXFJcNXoEoXMLjnMoF+x
         4Hu7uggmX2FpspBq6lxF6wv2JjPXaPL+uGbaW+Nd7y8gpo8X88P8w29kKuvtOUw19yXA
         zphnSGDV8E05vxXMRCAAt9K2cv2wVtwHz4LUJ5smBonEAlaEnG7uioYbPbvxaUBOgFyn
         f9D0nZZnJcuVdYQjNi024aRj9xHd9AEX9poOXq/xImJab3PtyMVu7Znmvks/rO0yWHkY
         cFEs01yQ6Z2Gh4IzSHsnInDvM54A6RIJuGDOnwXLr9ngP2bmUs2Orsu+Gx7Slb7I84Di
         fGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690489854; x=1691094654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lEKw26+6RZdhI/anFRn58wCKq7xAbjFEyn0dAkNnpG0=;
        b=k6p1aaBKzLhYdOLs6/9+SzciUrvdP8Cv5hhY4v2CFzWOREkDKfY7thH1YyfMHp5LFT
         b1ID/r1XCA+pkUC21vpRpeAIuvThlJakV/MKbEArRTkV0Fv8vbFMpJ0V7COPLT8PQE2L
         KNCFdOVb6r/QjtT9q3MqpixNsrYHGUY3nmcsO0pbPTk6Qt9VgOrJPA8jca2PzztdJ1Ns
         yIj/DD79JIbIMp4u2n9SNQ3jQjuM3302yVzgsn0HXD1Ze0DV9MsL2UxfWd44o7mUpDp3
         rrWHHRSJbsPolhJUylaeLNWCgod4+/EGK1dqPLCbxZC9xv3thUSsunac4IAC/nYWb6e0
         87gw==
X-Gm-Message-State: ABy/qLZ5mygcZafi/Kr91zaHFQ4fixB8Eo83GB6Wbi+ZgihaOG6+Z7AX
	QYaA21Z+wHcSbgUC1iR5nH42iV23wYaWAZmJ1Q==
X-Google-Smtp-Source: 
 APBJJlGl9kr0YKjXXClaNvO5YXYK+bsI4pnNFzpD0RmmC23yYTH1+wRPxm/hihZJnIhi6nmd3x0pGnlwMsmYe8YXBg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:c0cd:0:b0:d0f:dec4:87a0 with SMTP
 id c196-20020a25c0cd000000b00d0fdec487a0mr2722ybf.2.1690489854578; Thu, 27
 Jul 2023 13:30:54 -0700 (PDT)
Date: Thu, 27 Jul 2023 20:30:18 +0000
In-Reply-To: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
Mime-Version: 1.0
References: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690489451; l=2099;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=ekRYz8xbmy5B35whJHZOKa2NN55Pqt6uzdTr4Owj6tU=;
 b=ZHerNq4/0/izYJjYC4OPRwRQsf1JjGaWzyKG1n6tatiOox8osMHj5IC5H3w7pomkovsRZW+Mr
 ZalieCCjJkOBFVxsodA8i2CfMpi8W7SOSDjFdBjxoR32Os1IBvPaV8a
X-Mailer: b4 0.12.3
Message-ID: 
 <20230727-asoc-intel-skylake-remove-deprecated-strncpy-v2-1-152830093921@google.com>
Subject: [PATCH v2] ASoC: Intel: Skylake: replace deprecated strncpy with
 strscpy
From: Justin Stitt <justinstitt@google.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Justin Stitt <justinstitt@google.com>, Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: BVOR6NI7N3J2AFXQBIXO3L33BB64G3DM
X-Message-ID-Hash: BVOR6NI7N3J2AFXQBIXO3L33BB64G3DM
X-MailFrom: 
 3_tPCZAsKCt0ITRSHMRSHSSFNNFKD.BNL9KR9-CDUDK9KR9-OQNIDBS.NQF@flex--justinstitt.bounces.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BVOR6NI7N3J2AFXQBIXO3L33BB64G3DM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

A suitable replacement is `strscpy` [2] due to the fact that it
guarantees NUL-termination on its destination buffer argument which is
_not_ the case for `strncpy`!

It was pretty difficult, in this case, to try and figure out whether or
not the destination buffer was zero-initialized. If it is and this
behavior is relied on then perhaps `strscpy_pad` is the preferred
option here.

Kees was able to help me out and identify the following code snippet
which seems to show that the destination buffer is zero-initialized.

|       skl = devm_kzalloc(&pci->dev, sizeof(*skl), GFP_KERNEL);

With this information, I opted for `strscpy` since padding is seemingly
not required.

[1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
[2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html

Link: https://github.com/KSPP/linux/issues/90
Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- Remove extraneous logic change (thanks Kees)
- Link to v1: https://lore.kernel.org/r/20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com
---
 sound/soc/intel/skylake/skl-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 96cfebded072..0ead3ea605cd 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3159,7 +3159,7 @@ static int skl_tplg_fill_str_mfest_tkn(struct device *dev,
 			return -EINVAL;
 		}
 
-		strncpy(skl->lib_info[ref_count].name,
+		strscpy(skl->lib_info[ref_count].name,
 			str_elem->string,
 			ARRAY_SIZE(skl->lib_info[ref_count].name));
 		ref_count++;

---
base-commit: 0b4a9fdc9317440a71d4d4c264a5650bf4a90f3c
change-id: 20230726-asoc-intel-skylake-remove-deprecated-strncpy-9dbcfc26040c

Best regards,
--
Justin Stitt <justinstitt@google.com>

