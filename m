Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C77AB851
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 19:52:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3318DBC0;
	Fri, 22 Sep 2023 19:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3318DBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695405169;
	bh=2+WFGivuUVAKb1W+9E3ktp6XUMEEm32AWq2NC2ISBJg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hHLrOtN/stJj5cIjdt5AW7TaXGBEySYrrctYCc+X5m3vzJKjYqiJ8Iy97nItwPspk
	 vZayMjJqVU4gZVbdix56uC+XGUn3VkPEMrnAR/UpD82Y5pl7HdZBg4rCaAgNVnuK0L
	 DEZZ3NZUBho6fSx2qh6LwRLE906oYdcf6C9nlKew=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56D88F80124; Fri, 22 Sep 2023 19:51:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E2EF80125;
	Fri, 22 Sep 2023 19:51:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D853CF8025A; Fri, 22 Sep 2023 19:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 647E8F800AA
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 19:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 647E8F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=cNKE3aNr
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-690bccb0d8aso2041817b3a.0
        for <alsa-devel@alsa-project.org>;
 Fri, 22 Sep 2023 10:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405044; x=1696009844;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yIEluTePXKUgmZoz//4ptV8zeRXzjojVV5Zn13TdbAA=;
        b=cNKE3aNrb/nwcy+25ILMnkfYrBYCVYxPI+HFp/ri3vn3D5vvvmvjdh1jGxsmsa7UOe
         qv4IRdKeZ6pXbRBkhZ8fazec3l7Fa91JO22y4q7j164MwgR/GvsFpEST+AQjhhBf5Ynf
         IVFHQMh4HScBJr9PnEHteKq9MV4isy7EKBxEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405044; x=1696009844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIEluTePXKUgmZoz//4ptV8zeRXzjojVV5Zn13TdbAA=;
        b=XpSafXramTw2mfy3bY/lpM9o0daC60I+OjHMPG1psbfSmZTQcR4Ikh2p0sc1SAFXrm
         yXk6CLLq88JQI3U2qLyrjgFMdMuHIysVZnvoXtYPOBSYYqeHGHnB+DfukEG8lhLpwT5c
         ZvAYmBoBST/XuxE0e6NZeeLedtJ8vZYuN1m5rfayNVNX9qY0dPNwwmTIGSQ/aeM+W1C0
         48hTRigST1ls073q2Nt9UiP+Z0rEX3Z1OTeUalPefwlwkXHo8YFMTl62w703KlnLuo1E
         wbRbPIFO4Vdk0M+qpb4SeTBaQEHA+8yzwpfvZvj05/VWDMtNrE+983GCwsD3bU2m5U3w
         1tVA==
X-Gm-Message-State: AOJu0YxBPSgcr7wGTGv7UwRCani9q2zOE3k84JUMe7P34yO/a/TtXlgC
	wcCh1D9IyWvWJhuGUGTpC/LYC/JtWAlnHdgJjcY=
X-Google-Smtp-Source: 
 AGHT+IGlzZWrQahzIVY7sXtrvLZBK5+3kHZlDPRAqWBrggsxuzxxsLFOwwww26ZuTCH8VBPpWjNhmQ==
X-Received: by 2002:a05:6a20:8409:b0:159:b45e:1c7d with SMTP id
 c9-20020a056a20840900b00159b45e1c7dmr331120pzd.15.1695405044050;
        Fri, 22 Sep 2023 10:50:44 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 k17-20020aa78211000000b0068be4ce33easm3556666pfi.96.2023.09.22.10.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:43 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Kees Cook <keescook@chromium.org>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	alsa-devel@alsa-project.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jason Montleon <jmontleo@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] ALSA: hda: Annotate struct hda_conn_list with __counted_by
Date: Fri, 22 Sep 2023 10:50:42 -0700
Message-Id: <20230922175042.work.547-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=keescook@chromium.org;
 h=from:subject:message-id; bh=2+WFGivuUVAKb1W+9E3ktp6XUMEEm32AWq2NC2ISBJg=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPyOwKNuU3DBxwepcnIO9oHljCgGuE/kMNNW
 SIuGoQNj8SJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T8gAKCRCJcvTf3G3A
 Jo+WD/9F+wyEdMZRixRxq25YvGH8mw+aR+YpOV3Jnt0ScoGqx0BVe0PCT0yiRIlirDR/leDv/w8
 f7dQOHwxs6N9HFxhaKWBn/5fS39ICNQHC6rGWyVsrtVhQomA7J2VerZJ3EHX1Py8vAQ45YeksaK
 68AiMW/ZxVcB2VQVOV9JK2LLA8q1GDFaSzTX25NBCsilUpoA4Xg2zoxf99DJqx4M4DEcYMvA8dx
 P+iFCootNqc75w1qhByYrkec6Ypk9186+KIEpX23pJvVkkOnm+l4jFmeAc6fDGLx4GGyVGf7oBF
 bbuUPvR9ftPa8SdqnefuqXk6wUxPKdb94b6/PnBWLs8O87U+ug0Nkh5oYTMTOEp/cfyM7Aj3lT1
 HrZA5MhV2tsVVK2LMCLeFmqxZBfw/XJal0TYdzkGV7Y5HGrF3yDBqnAdJW4/uZeL9psk2L0ptaN
 L/SvDMIi0e7Jmwu580DQfxp4N23uZcYYDQNVFdCMuE+NSTggdbiilocOwMPL5ypkjb9X/boktW5
 tzYNjZsA3ZGXjSwzW61MmJOC52NSPC6Tk0bOHBbzVQfJGJUVVG8Q0uBN5PkgRtuVrc8oh4zUF5Z
 ILsCXDzpDzwULkvGXjOBJv5tUcenHcoyf4qbL5mC9nHz9RbDqdz0MnmL9tLf7L5LBNwVdJAyQpX
 sITrZ/3 7N36Rc8A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PLDZB7XNOAKCSRJFGS6E6TOTT3SVEVO2
X-Message-ID-Hash: PLDZB7XNOAKCSRJFGS6E6TOTT3SVEVO2
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLDZB7XNOAKCSRJFGS6E6TOTT3SVEVO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct hda_conn_list.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 sound/pci/hda/hda_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 33af707a65ab..01718b1fc9a7 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -88,7 +88,7 @@ struct hda_conn_list {
 	struct list_head list;
 	int len;
 	hda_nid_t nid;
-	hda_nid_t conns[];
+	hda_nid_t conns[] __counted_by(len);
 };
 
 /* look up the cached results */
-- 
2.34.1

