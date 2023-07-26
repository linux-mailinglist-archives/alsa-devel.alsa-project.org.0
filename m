Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C5B7640FD
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 23:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 545DE7F8;
	Wed, 26 Jul 2023 23:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 545DE7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690406018;
	bh=lQAXd/QKEocVTpWzsLq/yuRWIfGT/6JXnq+xx86jdyo=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MuuuY09pasCqynRWOk+GNI3UJOhiLzKPzzU7/iT8jdVM8OHlFVL+4+jIHSNqKNgo7
	 UkqEQWBizIXdFnadQIX5UinGP3T+Os/xMQzfbKJ52f7PWVMn0aDIqsJOP1gwb1Fwg2
	 5/R9I16Bsa2FYREcoz3HfiucKi6032PJQfihtOb8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A037AF8019B; Wed, 26 Jul 2023 23:12:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F31F80153;
	Wed, 26 Jul 2023 23:12:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D830F8019B; Wed, 26 Jul 2023 23:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 396DDF800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 23:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 396DDF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=TFvfXD2j
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d061f324d64so189325276.1
        for <alsa-devel@alsa-project.org>;
 Wed, 26 Jul 2023 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690405939; x=1691010739;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rZM5DChdNI8S3fRaG82Uf+jm5x9WWsFq+xNzYHKGX4I=;
        b=TFvfXD2jpjpWq8sY4RDHzUNEf2ymN+fSetV8uTMDOQ+efdSDZm9AVu17Ww7vnobhgB
         ipCdmG9oLkCSmc/Ewxmh9qpvD8J5WxmQPeRTIimCFCbthp+v2w4LMNk9MqelA3mbqiTx
         b6yNHsrXMJYrky0IG18TgFNI2T0u0kk++fomF7W7zJ1tSMZaclcN9/xsXE1jSPnWxbIt
         SD8OnfWzUGmqz8Li/3PhJb77U/8kU8ZqMf4watsGPkU4z89D+rJiwf62psgJ7kJGdK8l
         Jy2wFbXod1DCUCD/DJQnR8q+eZ1PFAyayDYnC0l5FzvVGZBLA3+9PgSKC+VLpfHFrThr
         Smow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690405939; x=1691010739;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZM5DChdNI8S3fRaG82Uf+jm5x9WWsFq+xNzYHKGX4I=;
        b=UlVaviXg9d1hnqAOAj50dJgqhk9T/FpwIP0ecLg2HuhVuJsq6wh+2Mr8nrloL0t35C
         6kO5JauzRrxYqlW/z/dnX67DxkgEKH/9avQ9+SbtwqNiK29kVAp3gQgb3YBKCzJQVXxm
         ggBCpyBCUIs+qcAKCZOUjjoPJf6aDDPP2KByEGuDbvbSlwnMoVjzq2Y6UbfS6qrxo11t
         wJ38e6FXjMV92p/kaG2B9CawyjTToLBX/CKnIy5GRSz46PkHKCHtppIpB1Qlu6qWrW7Y
         l+t1otfGBwimdP6x6NmJAmcY9gag8TFGk9zJzvSDtPfWBz9KRbLxThGAauuz7jpFkggi
         5SOg==
X-Gm-Message-State: ABy/qLbpLHeEAbqS25P8tCNhBQ/wVyND9DWwqJ2ZPBCnS4DOmbjI9Z7c
	UG4dmqpI0e0/WK+kwxG7fb7TgTi58Wq4bqPepA==
X-Google-Smtp-Source: 
 APBJJlHztluktJg0B0qaDZ70CcY32gizNyhPP2LwGCkpCXg6eyN49WkgyiCmLZ6pxTh3gxGo8YcM18w/ekYxGaaJqw==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:fe05:0:b0:d10:c94a:be7e with SMTP
 id k5-20020a25fe05000000b00d10c94abe7emr19783ybe.8.1690405938894; Wed, 26 Jul
 2023 14:12:18 -0700 (PDT)
Date: Wed, 26 Jul 2023 21:12:18 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADGMwWQC/52NQQ6DIBBFr2JYdxqgamNXvUfjgg6DEhUMEFJjv
 HupR+jy/fy8t7NIwVJkj2pngbKN1rsC4lIxHJUbCKwuzCSXN36XLajoEaxLNEOctllNBIEWnwk
 0rYFQJdIQU3C4btDpNxqULa85sqIsB2M/Z+7VFx5tTD5sZz2L3/pnKAsQoNuaeI1dYxrzHLwfZ
 rqiX1h/HMcXwpnJEOkAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690405938; l=2258;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=lQAXd/QKEocVTpWzsLq/yuRWIfGT/6JXnq+xx86jdyo=;
 b=qfHnDTc0z2fwrsubm0mfrEuvyffKkOeKhwokW9XrOjcVXFcWc7iFlQrcWEH+KOMyhxzifxMK8
 aycPeRwhO0xD3vZ3vBW2pcHncCaCAkivn+JIrWDtsLx0CBm1ilapKZ+
X-Mailer: b4 0.12.3
Message-ID: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
Subject: [PATCH] ASoC: Intel: Skylake: replace deprecated strncpy with strscpy
From: justinstitt@google.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: 5WCM6QQ6LHENKVBMHL46JSLGBYRYN5SV
X-Message-ID-Hash: 5WCM6QQ6LHENKVBMHL46JSLGBYRYN5SV
X-MailFrom: 
 3MozBZAsKCn0kvtujotujuuhpphmf.dpnbmtb-efwfmbmtb-qspkfdu.psh@flex--justinstitt.bounces.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WCM6QQ6LHENKVBMHL46JSLGBYRYN5SV/>
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

Also within this patch is a change to an instance of  `x > y - 1` to `x >= y`
which tends to be more robust and readable. Consider, for instance, if `y` was
somehow `INT_MIN`.

[1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
[2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html

Link: https://github.com/KSPP/linux/issues/90
Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 sound/soc/intel/skylake/skl-topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 96cfebded072..67f08ec3a2ea 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3154,12 +3154,12 @@ static int skl_tplg_fill_str_mfest_tkn(struct device *dev,
 
 	switch (str_elem->token) {
 	case SKL_TKN_STR_LIB_NAME:
-		if (ref_count > skl->lib_count - 1) {
+		if (ref_count >= skl->lib_count) {
 			ref_count = 0;
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

