Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51265A01945
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2025 12:43:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B905460211;
	Sun,  5 Jan 2025 12:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B905460211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736077380;
	bh=bOhSq3zer+Sbl5VcZpqh5QOKVeebSNvOCeRmpE21hjM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=S5VWQDTgvKyPY9OwI13BlKq8kIG3F0ZYQ48S3YFVFVPnMO/B0BkCGINKQ3cOXtvSz
	 sUNzDC3eJSnSOBo9KShtufetDFy44ZKvh6+3wygfCB/BpIgxyDattK3WHtTag7DCj+
	 PTq+tRQFYbipBLsOP6JRi5bS5HcEaecvvvzN5174=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1886F805BB; Sun,  5 Jan 2025 12:42:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B19DF805B4;
	Sun,  5 Jan 2025 12:42:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1E8EF8051D; Sun,  5 Jan 2025 12:42:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 40D97F8016E
	for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2025 12:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D97F8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1736077331539159536-webhooks-bot@alsa-project.org>
References: <1736077331539159536-webhooks-bot@alsa-project.org>
Subject: default version symbol snd_dlopen@@ALSA_1.1.6 must be defined
Message-Id: <20250105114214.D1E8EF8051D@alsa1.perex.cz>
Date: Sun,  5 Jan 2025 12:42:14 +0100 (CET)
Message-ID-Hash: U2B5NUJSZRRZQMPBY67HXZVMQHQJIAGD
X-Message-ID-Hash: U2B5NUJSZRRZQMPBY67HXZVMQHQJIAGD
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2B5NUJSZRRZQMPBY67HXZVMQHQJIAGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #433 was opened from trcrsired:

```
clang: warning: argument unused during compilation: '--unwindlib=libunwind' [-Wunused-command-line-argument]
  CCLD     libasound.la
ld.lld: error: seq/.libs/libseq.a(seq.o at 50494) <inline asm>:1:1: default version symbol snd_dlopen@@ALSA_1.1.6 must be defined
.symver __snd_dlopen, snd_dlopen@@ALSA_1.1.6
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_direct.o at 2925704) <inline asm>:1:1: default version symbol snd_pcm_hw_params_set_format_first@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_set_format_first, snd_pcm_hw_params_set_format_first@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_direct.o at 2925704) <inline asm>:2:1: default version symbol snd_pcm_hw_params_set_channels_near@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_set_channels_near, snd_pcm_hw_params_set_channels_near@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_direct.o at 2925704) <inline asm>:3:1: default version symbol snd_pcm_hw_params_set_rate_near@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_set_rate_near, snd_pcm_hw_params_set_rate_near@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_direct.o at 2925704) <inline asm>:4:1: default version symbol snd_pcm_hw_params_set_period_time_near@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_set_period_time_near, snd_pcm_hw_params_set_period_time_near@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_direct.o at 2925704) <inline asm>:5:1: default version symbol snd_pcm_hw_params_set_period_size_near@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_set_period_size_near, snd_pcm_hw_params_set_period_size_near@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_direct.o at 2925704) <inline asm>:6:1: default version symbol snd_pcm_hw_params_set_periods_near@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_set_periods_near, snd_pcm_hw_params_set_periods_near@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_direct.o at 2925704) <inline asm>:7:1: default version symbol snd_pcm_hw_params_set_buffer_time_near@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_set_buffer_time_near, snd_pcm_hw_params_set_buffer_time_near@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_direct.o at 2925704) <inline asm>:8:1: default version symbol snd_pcm_hw_params_set_buffer_size_near@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_set_buffer_size_near, snd_pcm_hw_params_set_buffer_size_near@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_direct.o at 2925704) <inline asm>:9:1: default version symbol snd_timer_params_set_filter@@ALSA_0.9.0 must be defined
.symver __snd_timer_params_set_filter, snd_timer_params_set_filter@@ALSA_0.9.0
^


ld.lld: error: .libs/conf.o <inline asm>:1:1: default version symbol snd_dlopen@@ALSA_1.1.6 must be defined
.symver __snd_dlopen, snd_dlopen@@ALSA_1.1.6
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_hw.o at 720480) <inline asm>:1:1: default version symbol snd_timer_params_set_filter@@ALSA_0.9.0 must be defined
.symver __snd_timer_params_set_filter, snd_timer_params_set_filter@@ALSA_0.9.0
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_params.o at 544772) <inline asm>:1:1: default version symbol snd_pcm_hw_params_get_access@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_get_access, snd_pcm_hw_params_get_access@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_params.o at 544772) <inline asm>:2:1: default version symbol snd_pcm_hw_params_get_format@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_get_format, snd_pcm_hw_params_get_format@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_params.o at 544772) <inline asm>:3:1: default version symbol snd_pcm_hw_params_get_subformat@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_get_subformat, snd_pcm_hw_params_get_subformat@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_params.o at 544772) <inline asm>:4:1: default version symbol snd_pcm_hw_params_get_channels@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_get_channels, snd_pcm_hw_params_get_channels@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_params.o at 544772) <inline asm>:5:1: default version symbol snd_pcm_hw_params_get_rate@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_get_rate, snd_pcm_hw_params_get_rate@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_params.o at 544772) <inline asm>:6:1: default version symbol snd_pcm_hw_params_get_period_time@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_get_period_time, snd_pcm_hw_params_get_period_time@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_params.o at 544772) <inline asm>:7:1: default version symbol snd_pcm_hw_params_get_period_size@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_get_period_size, snd_pcm_hw_params_get_period_size@@ALSA_0.9.0rc4
^


ld.lld: error: pcm/.libs/libpcm.a(pcm_params.o at 544772) <inline asm>:8:1: default version symbol snd_pcm_hw_params_get_buffer_size@@ALSA_0.9.0rc4 must be defined
.symver __snd_pcm_hw_params_get_buffer_size, snd_pcm_hw_params_get_buffer_size@@ALSA_0.9.0rc4
^


ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make[3]: *** [Makefile:506: libasound.la] Error 1
make[3]: Leaving directory '/home/csrg/toolchains_build/toolchainbuildscripts/wine/.wineartifacts/aarch64-linux-gnu/alsa-lib/src'
make[2]: *** [Makefile:567: all-recursive] Error 1
make[2]: Leaving directory '/home/csrg/toolchains_build/toolchainbuildscripts/wine/.wineartifacts/aarch64-linux-gnu/alsa-lib/src'
make[1]: *** [Makefile:436: all] Error 2
make[1]: Leaving directory '/home/csrg/toolchains_build/toolchainbuildscripts/wine/.wineartifacts/aarch64-linux-gnu/alsa-lib/src'
make: *** [Makefile:414: all-recursive] Error 1
alsa-lib build failure
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/433
Repository URL: https://github.com/alsa-project/alsa-lib
