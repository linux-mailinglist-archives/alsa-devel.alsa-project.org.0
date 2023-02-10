Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FAD6917EA
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 06:16:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C13684A;
	Fri, 10 Feb 2023 06:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C13684A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676006191;
	bh=ydFsPeA/C8MiMPLpOvjkEi/1qhpRw4CQdxWOj12NFhs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LtALsrGvf5+oMJXNoTAyCS6t4T7jTm5iAmdYwZXliwAtClhbCy54XzNInK66jx4Ln
	 g6Yr+k8GJHTWdzKUCzdyTAHAflcyUhVlhq8dyujHptkoKV32FtbYIxxPZpm6QTk/M8
	 Q6T1M4gaE8EXpPhUg6xRiXxLPXW6IjTf3cbsaFR4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7AA3F800B8;
	Fri, 10 Feb 2023 06:15:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 198A6F8021D; Fri, 10 Feb 2023 06:15:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFD08F80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 06:14:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD08F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=fksnpfnG
Received: by mail-pj1-x1034.google.com with SMTP id y11so459204pjc.0
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 21:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KdCo8CN1GLWxhUuzHsDXPi4+d7EjfRBcMOzTAX4VkYU=;
        b=fksnpfnGmrRVNVbjdWrUxIfEgUkh3JDeG3fkjMQSmlbXngErhtX7yLht05cD/5PKnn
         04Epg6Osl2gUxOAKOQdgYazydNTf5/GjUMfK7jlo/g3aCLQxlq/rSr00ih4y70P9Ilnd
         ioHhguL7zpjKI2rdmOcZHX3i+hmCuch7DgeMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdCo8CN1GLWxhUuzHsDXPi4+d7EjfRBcMOzTAX4VkYU=;
        b=A84o9MS1CkqIssIAuMD36SBFDdDi+EUUiz2Ni1nSgMc1OqCnUFnDxXbPaxmeCHam53
         zVLEfwSg6LBy22p9wVq0SjzCmhUL7iE9XSeYZlldjGUofvjI3vMPhbD961QbV56U0EHq
         Q/svtYKk3mEFDNbJpNQ0HXuUp87ooSBRzSFehrpMHUa22pSyNbzhcRhiAfQoafmnmJeq
         PzUa0pdu1nZ/n/N+3lESuf88Owa7N2vMce0B5zUIJHtUdiSUBLDmnDQIzK8mq29MrPP7
         tL6rI+LCcrR1rgZWTUIen+l7OYTSkbAJ+qaplwpSra9XvLNfH/ACe28ity8rM+8o/+DT
         bKlg==
X-Gm-Message-State: AO0yUKXULJyPxjvmWeDXzls0KPSbtJhW7KPXru1iig7kfqPf0wwZ1vsV
	yN7iWoLgpikUkk3x3SA/bvtfpLT5iFz/5cdD
X-Google-Smtp-Source: 
 AK7set9iPH45/De4KkZG32asSbtZRCU+B4g0PXZleHxvnSO0a4hAJXfkZX3tU2NNp9NBF6yLEK1etg==
X-Received: by 2002:a17:903:1104:b0:196:6ec4:52db with SMTP id
 n4-20020a170903110400b001966ec452dbmr16471333plh.51.1676006093975;
        Thu, 09 Feb 2023 21:14:53 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 iz11-20020a170902ef8b00b0019a6cce2060sm1137plb.57.2023.02.09.21.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 21:14:53 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ASoC: Intel: Skylake: Replace 1-element array with flex-array
Date: Thu,  9 Feb 2023 21:14:51 -0800
Message-Id: <20230210051447.never.204-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107;
 h=from:subject:message-id; bh=ydFsPeA/C8MiMPLpOvjkEi/1qhpRw4CQdxWOj12NFhs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBj5dLKO9mdp/U47exsYyDTqouHYKX3QCJ70TxjHDRg
 6KZPj3OJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY+XSygAKCRCJcvTf3G3AJoftD/
 45mIRK1WE97b95xQSOaADXRWSoS+EmGBiXvdWMXF3CwvSP7/4MO57t9EBQROuXWRf+wZMEn3AYglzs
 j/yQUgln33Ckg0IIgHlUWp543vnN/E3eiMCRXLQRM3MQ9VaPfyiq1j5WUnHdfB64n9pAMD7TfMlpRB
 XYIz0JreJoipxNK5H/VAVB3p+kbbqq88PFaM4pmVO/S8BURTCLPwUxiZMFFJrFRiN03D1WLkzaCjPd
 oWWQbuJVfu9Lneg0rnK3Qzq5tS0FCHPVIElP5AouwsPjlt9HZHgSHOkeH7UEO5WeQwcyLAkHOKPEWz
 5twvakghXq1cYc7N9j3Ah+wy55Ts/eXvLA/jPWsfsbnCcB2t54hnAa6XUCL0FeMaD4o8kjOhVX0T3K
 Y3EtiIvTe2uJBS9TRa+Ikr49+tEJpJu4zQ3WW81q3T/ZZvL1t4InrCkM+2I5tHYHuYZgFqhv/OseYb
 XdHAYgMIgX/qewDg9C1CgHrcVED/wW7nYR7tauKKBTpCTx+GOlync9hN8UHwioG72MlAXFrRyAjU3n
 KlvCwNamQGqXDqQMYI0uBD9Cafge0qhWmwqp1OrvsTeknAMKG7zFwCf0JIILx9dTxJbQEFhiyy9Wkf
 ixFR0OR0Mka8EsOmA4PD5c1fbS+otZ3MurL0EM5OjKuGKIbcSQzMXtDGxwHQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AWIYUDWHYCRSNRMVTUSTL5Y7UJPNH6XN
X-Message-ID-Hash: AWIYUDWHYCRSNRMVTUSTL5Y7UJPNH6XN
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kees Cook <keescook@chromium.org>, Sasa Ostrouska <casaxa@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWIYUDWHYCRSNRMVTUSTL5Y7UJPNH6XN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The kernel is globally removing the ambiguous 0-length and 1-element
arrays in favor of flexible arrays, so that we can gain both compile-time
and run-time array bounds checking[1]. In this instance, struct
skl_cpr_cfg contains struct skl_cpr_gtw_cfg, which defined "config_data"
as a 1-element array.

Normally when switching from a 1-element array to a flex-array, any
related size calculations must be adjusted too. However, it seems the
original code was over-allocating space, since 1 extra u32 would be
included by the sizeof():

                param_size = sizeof(struct skl_cpr_cfg);
                param_size += mconfig->formats_config[SKL_PARAM_INIT].caps_size;

But the copy uses caps_size bytes, and cap_size / 4 (i.e. sizeof(u32))
for the length tracking:

        memcpy(cpr_mconfig->gtw_cfg.config_data,
                        mconfig->formats_config[SKL_PARAM_INIT].caps,
                        mconfig->formats_config[SKL_PARAM_INIT].caps_size);

        cpr_mconfig->gtw_cfg.config_length =
                        (mconfig->formats_config[SKL_PARAM_INIT].caps_size) / 4;

Therefore, no size calculations need adjusting. Change the struct
skl_cpr_gtw_cfg config_data member to be a true flexible array, which
also fixes the over-allocation, and silences this memcpy run-time false
positive:

  memcpy: detected field-spanning write (size 100) of single field "cpr_mconfig->gtw_cfg.config_data" at sound/soc/intel/skylake/skl-messages.c:554 (size 4)

[1] For lots of details, see both:
    https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
    https://people.kernel.org/kees/bounded-flexible-arrays-in-c

Reported-by: Sasa Ostrouska <casaxa@gmail.com>
Link: https://lore.kernel.org/all/CALFERdwvq5day_sbDfiUsMSZCQu9HG8-SBpOZDNPeMdZGog6XA@mail.gmail.com/
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 sound/soc/intel/skylake/skl-topology.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index 6db0fd7bad49..ad94f8020c27 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -115,7 +115,7 @@ struct skl_cpr_gtw_cfg {
 	u32 dma_buffer_size;
 	u32 config_length;
 	/* not mandatory; required only for DMIC/I2S */
-	u32 config_data[1];
+	u32 config_data[];
 } __packed;
 
 struct skl_dma_control {
-- 
2.34.1

