Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7BF656D4D
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 18:10:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31FBE7770;
	Tue, 27 Dec 2022 18:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31FBE7770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672161004;
	bh=Qac4tRPVwm+vU5JwLiY8YoXwmuzFi3r8T7rPHIYOptY=;
	h=From:Date:Subject:References:In-Reply-To:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jbC5v2aEWSqrW4l9mD99U7Pr7/07CFqXMtTy+NEl+kiTtEf2emWPilmcptBfR5lRk
	 kUWjCvAmwdaS1jkJZsNe2/C/ijVf+kRlk7Qv5yogAhwudGBYJ3e8QxddVG5Tm6Rdaa
	 ikayTyQjXYOSze5ihBNUZQ2JQwg9y5lb3PJKZ1f8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CD29F80552;
	Tue, 27 Dec 2022 18:07:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 331FDF80543; Tue, 27 Dec 2022 18:07:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEEFBF8053D
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 18:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEEFBF8053D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gJCEh+g2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 788B5B810A6;
 Tue, 27 Dec 2022 17:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85A1C433EF;
 Tue, 27 Dec 2022 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672160849;
 bh=Qac4tRPVwm+vU5JwLiY8YoXwmuzFi3r8T7rPHIYOptY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gJCEh+g2pV6+Gh7a9gs7qh3fiwSGW6rpOvzWwYM8MByFQNQdd4S5Tn3wnVfJJO3Iw
 DSkhlehz6Rs3dqcemfRGDzTrnu7+Dp9iHqETbJToTfTg420fYExUIPQqNzrrAsJUKU
 ku5wy3JMyxdHNbvv43v6NJcBwZL/ahDkp9V5FGkIEe2vXBa3TZNWgj5Gd1hWPFK0v1
 w7+CRFFHA/U5CaPqeihqHOqYQhfUr7UGAUFPBZg0/IaMqJJEptcH03DxiXvXZ7VgfR
 fJo5KDhVfC/SCQgzyBJPRXylG1+ztqbm7FUB9EYFIvA96XZelEZl2/tsO/TMeJNRLt
 L8E48VJOgRRrg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Dec 2022 17:06:50 +0000
Subject: [PATCH v4 5/7] kselftest/alsa: pcm - Support optional description for
 tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221208-alsa-pcm-test-hacks-v4-5-5a152e65b1e1@kernel.org>
References: <20221208-alsa-pcm-test-hacks-v4-0-5a152e65b1e1@kernel.org>
In-Reply-To: <20221208-alsa-pcm-test-hacks-v4-0-5a152e65b1e1@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.12-dev-7ab1d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Qac4tRPVwm+vU5JwLiY8YoXwmuzFi3r8T7rPHIYOptY=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhuTVas4MzQHH97r+zPKZlfcq4tujG01du025FifvLdR32ao2
 caN8J6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViawKVycAjCRrEUcDC0uLOEvdUVSdR3evdbfE6
 Adk7IpsjXsR//DtykbAmdtqxA7tHaRepginzdX1ocMg2ubGbce5dQqd6tq3bZGdOq9Fwv97lTWH42Z
 IiH7/PZa3qon/3t/XFp+wWzi7L1ba/YWG1bflF6y5HyG/+vs5q3NiY3M3xOMHj991JWoUsjfuHO3wp
 oE455t097EsFzWPd3CcsyjyoZZTIvn08u+vr1f2/o9ROsUoz82/JV0X6X8NLnlqtqlV9bWGjsDyrd1
 Kqxr2ril3e9TQGCX8P9FSzLZ05ru9UbO0PQsOyvMkXFjCZ9alisz1+ryAwv3PfKIXn934tQqYZ34IO
 kYI6fUWNWWXxGfPsgcC+fVu3ATAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In order to help with the comprehensibility of tests it is useful for us to
document what the test is attempting to cover. We could just do this through
comments in the configuration files but in order to aid people looking at
the output of the program in logs let's provide support for an optional
'description' directive which we log prior to running each of the tests.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 5fbb3ff517aa..57d3f6dcb46b 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -244,6 +244,11 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 	snd_pcm_sw_params_t *sw_params;
 	const char *test_class_name;
 	bool skip = true;
+	const char *desc;
+
+	desc = conf_get_string(pcm_cfg, "description", NULL, NULL);
+	if (desc)
+		ksft_print_msg("%s\n", desc);
 
 	switch (class) {
 	case TEST_CLASS_DEFAULT:

-- 
2.30.2
