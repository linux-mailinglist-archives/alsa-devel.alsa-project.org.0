Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A147625B5
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 00:09:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 110E5820;
	Wed, 26 Jul 2023 00:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 110E5820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690322985;
	bh=PhUj2cXtcqtjhYpon1W91iiAfF7M/UqU4Wb0CfeBYMk=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uT9aWElxn50JI/sfTzvYPIkaqVXUlKY4kx1bBNrhd0iLj6iUZOxxC7pfP5D3r/2ZA
	 +cYUhTPZ0SWHrzQDSY8xZMHXLt5he24AvVhSPwG9OJSmRA0Yv6qlV4C2Au0tyksFlK
	 sGqKKzi2jY7gtvWpcqIOaDBcLmv6V5qyyHXi8eJw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72541F8019B; Wed, 26 Jul 2023 00:08:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2301DF80153;
	Wed, 26 Jul 2023 00:08:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94B3CF8019B; Wed, 26 Jul 2023 00:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9317DF800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 00:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9317DF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=x1EURPB8
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d052f49702dso5441726276.3
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jul 2023 15:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690322920; x=1690927720;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1NWycEa65d4tlLHM/aUQNHUmkrnQ5gy649oFMAUFu0Y=;
        b=x1EURPB8q2FI+3WTNRHFSD+/QMHRtAIewp3VseLuRl7bX8IOlOLFy3quhxBmmtntOG
         GA/g/RATylp6grK6gJ9mdWtfWy83FF+b97IUhdd7Gsd7KIXxhNuB9Z09oKClQijqS947
         fM5jMnFPC7L7DAeSZw28wP3wNCGp1VbZh1LMrqSwITOV6UzlaECYWCQzaQc4IeqJr5Ic
         DKJ3bYk/ET4D5thfnNEkr0DotUos69dxbSjM1PAtmORcALtzBfBUSI1Cb2LuOhLmntDU
         vTECUN+t07IC0aNbgcw+5LSU4N0Tj8FMJtsPDYk6u3f/MwhUcRkIMDQGHorJGBYgDm9K
         V1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690322920; x=1690927720;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1NWycEa65d4tlLHM/aUQNHUmkrnQ5gy649oFMAUFu0Y=;
        b=WTeAWHLbc6ZpcaIAbOeu4+Rgp1lDHHhX3CVHhA91xh97fGG8UQWGU1TAVCvrUMSktE
         JTrf4PEVxgWQ3rGNMS+sX+kJ2wJspJu9gwxPnFB5hefBkhDWrvt3noGwW05duZsrE6MJ
         dcTqGR1QmQnanaxX6wB+UsxFfbIiJiw9+NehahbUEfZ+lxrW5QcNj9liJDVDw5NHCZ2e
         +a6k5pHoLV5hyUTiVwa5vfEJfO7NNICs+maah9zAcV7NaHVQ8ZelOwS9yCEjw9rtYgH5
         iGpJuqSYq0yeYP8fJi3Hx1N+aesSAEy74eTUVPG7t/KIF/c8eE5h2QvB1qVSGPnPt/9q
         NAmQ==
X-Gm-Message-State: ABy/qLbIOU7WArMaozZk1P+bvhPIVsCpCzutkh0pKyvqRQBma6Eghy63
	3k+Kdv45NYFObwWDFJ5hV1KXfaZNjCCuXI7CnA==
X-Google-Smtp-Source: 
 APBJJlENtGndeMK75xsqbP+rObTFZUl8GefO08l5IcCtgMR26J0r2rSOjJAMnNmTOUoRnsSrpVgw4Y3QHRWFE05m4w==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:69c8:0:b0:d0c:e37:b749 with SMTP
 id e191-20020a2569c8000000b00d0c0e37b749mr1345ybc.10.1690322919734; Tue, 25
 Jul 2023 15:08:39 -0700 (PDT)
Date: Tue, 25 Jul 2023 22:08:38 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOVHwGQC/x2NwQrCMBBEf6Xs2YUmGhR/RTzEzVYXNCmbGCyl/
 97Fy8BjHjMrVFbhCtdhBeUuVUo2cIcB6BXzk1GSMfjRH8ezD1jLNydLQsmN3xh7ReVP6YyJZ2W
 Kja1vmmle0D/o5GKIYbo4sE0TJvn9/273bdsB0LrmxH8AAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690322918; l=1683;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=PhUj2cXtcqtjhYpon1W91iiAfF7M/UqU4Wb0CfeBYMk=;
 b=hwCrKKl4MBwnYeKbpJ7VXwZ58MxHlq/hUWRmyIcm4i/2grmqWc8hNmK+AMZ6GxlAJ+aUw6C6Z
 JLfTXt31O93DIg9K4aTcdVaMMNARadNBYo+WiR96LLszjj0XJbcnpNH
X-Mailer: b4 0.12.3
Message-ID: 
 <20230725-sound-soc-intel-avs-remove-deprecated-strncpy-v1-1-6357a1f8e9cf@google.com>
Subject: [PATCH] ASoC: intel: avs: refactor strncpy usage in topology
From: justinstitt@google.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>,
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: RSZRAIZJWEQIC2YQBY3WCMEK2FJIR62U
X-Message-ID-Hash: RSZRAIZJWEQIC2YQBY3WCMEK2FJIR62U
X-MailFrom: 
 350fAZAsKCqQNYWXMRWXMXXKSSKPI.GSQEPWE-HIZIPEPWE-TVSNIGX.SVK@flex--justinstitt.bounces.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSZRAIZJWEQIC2YQBY3WCMEK2FJIR62U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`strncpy` is deprecated for use on NUL-terminated destination strings
[1].

A suitable replacement is `strscpy` [2].

There are some hopes that someday the `strncpy` api could be ripped out
due to the vast number of suitable replacements (strscpy, strscpy_pad,
strtomem, strtomem_pad, strlcpy) [1].

[1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
[2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html

---


Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 sound/soc/intel/avs/topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index cdb4ec500261..45d0eb2a8e71 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1388,12 +1388,12 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
 		port = __ffs(mach->mach_params.i2s_link_mask);
 
 		snprintf(buf, len, route->source, port);
-		strncpy((char *)route->source, buf, len);
+		strscpy((char *)route->source, buf, len);
 		snprintf(buf, len, route->sink, port);
-		strncpy((char *)route->sink, buf, len);
+		strscpy((char *)route->sink, buf, len);
 		if (route->control) {
 			snprintf(buf, len, route->control, port);
-			strncpy((char *)route->control, buf, len);
+			strscpy((char *)route->control, buf, len);
 		}
 	}
 

---
base-commit: 0b4a9fdc9317440a71d4d4c264a5650bf4a90f3c
change-id: 20230725-sound-soc-intel-avs-remove-deprecated-strncpy-2bc41a5a5f81

Best regards,
-- 
Justin Stitt <justinstitt@google.com>

