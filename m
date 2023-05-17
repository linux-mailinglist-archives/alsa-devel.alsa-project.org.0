Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65943706A7B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:04:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F801F7;
	Wed, 17 May 2023 16:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F801F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684332250;
	bh=h5W1Z4o9LHPa8lHetePmYyMus46bU3T+L4qAbUkqj2U=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OKo5ir/CLq9df07xAF0suZkJYGEC5oTqWub+7HixvIHJ/wIX3JZjEy4AO7Uzb6yae
	 S+pduISqVG2s27mU7Uo2vtyKepOCEwwdWtqWRW9EDshH6pQLly9/2/kJRcKgPIhb55
	 C/1aWYvgoG0boORS0uc7HLY8mH1zuS+UMuOrD1gQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25B2BF8053D; Wed, 17 May 2023 16:03:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B77DF8025A;
	Wed, 17 May 2023 16:03:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE45AF8016A; Wed, 17 May 2023 16:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8D3FF8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8D3FF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HdfqFplY
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-ba86ea269e0so703822276.1
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684332180; x=1686924180;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EnN81p2MeWO9EzOWTpebA/OMy7HtWZHmn+rKTFE9OqM=;
        b=HdfqFplYz7Qf9SanlMHtPvfRuEa8h8QgTs2pp24EwWfK02ZbEs06WnBq6Vi4ke8ALC
         Nu+AHv2FBCR+drvv6EuN666Wt/A5Vbd6xAnLElWstD7ALkee9Q05qV8GX5uhw6uhuuZi
         B4fBFopzSA1bGTqnA8XRDAxwWETprDKa4PpCCT/WD6+4Bu6UwY3NM5coNv8rZ1teGyAo
         voZ/fh6D1yfhCuJd5IlTu2kLKijc9Fwju3/gVrSdGdQfY85CWAkIoYQEgmPlOrQ6VZkk
         +AlktRzrpxoJa4kYyVQXkjwIJz1JbkoFm0dNwWSFMhfmf1JmMhZ34uqN+PWcYHxpY9Wj
         y2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684332180; x=1686924180;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EnN81p2MeWO9EzOWTpebA/OMy7HtWZHmn+rKTFE9OqM=;
        b=XA8bDuXjClFbiMTtaIKzzo51UGuyiJCjCRAHtkgxHxW29ngueG75ogHI7VkXpvD6HP
         uGNrMqvGuZUZ7ZVjKuXow2xp7ZNBVqXmrczAwYM5JH1hz/GUsAi+PCRNuczHtiPK+dTX
         pbA+o3bfDsJba7CkBM5AUwrJxDbcmhhmipi6JnEMVBhqg0fsZwwnW0eYgwW1o22GqPJm
         Wat0eTcYmURzEf3GMX51hdI+C52B5Gmunnu/O8kpaxcSBrCLibtbmclhmg9yTkk8CiwW
         qDUCQYf9Zt6krQB8uotUlqbpNJKRJQk3BzYNiFd43ouzShYUytdDkA2mDSAWtVgW+nuK
         ZA/A==
X-Gm-Message-State: AC+VfDxbn/U61+4bzPppIBAHEXZo+SktYHcYOZXI+0dqBwfqSmY5AGkv
	baB7Lh1CxOVz9YBBt5TERpQuCr7m+p7hXBN8lO5cqQ==
X-Google-Smtp-Source: 
 ACHHUZ5ebL6rGP7D45jjjmqs/3K8SRxUe+aFYYf5yNPLUOHysTYfhtudOs1R+FMLsNcRKZaBP9DtvPGuDCjBp+f73xA=
X-Received: by 2002:a05:7500:e568:b0:106:ad71:fc05 with SMTP id
 rh40-20020a057500e56800b00106ad71fc05mr43929gab.73.1684332180208; Wed, 17 May
 2023 07:03:00 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 17 May 2023 19:32:48 +0530
Message-ID: 
 <CA+G9fYsShNP=LALHdMd-Btx3PBtO_CjyBNgpStr9fPGXNbRvdg@mail.gmail.com>
Subject: next: gcc-8-ppc6xx_defconfig: ERROR: modpost: "__divdi3"
 [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 3JTYTQXJCX5DVNYVSZPNYHBV7IJSNZIB
X-Message-ID-Hash: 3JTYTQXJCX5DVNYVSZPNYHBV7IJSNZIB
X-MailFrom: naresh.kamboju@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JTYTQXJCX5DVNYVSZPNYHBV7IJSNZIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Linux next powerpc gcc-8 build failed on Linux next 20230516 and 20230517.
 - build/gcc-8-ppc6xx_defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
====
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build \
  ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- \
  'CC=sccache powerpc64le-linux-gnu-gcc' \
  'HOSTCC=sccache gcc'

ERROR: modpost: "__divdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
ERROR: modpost: "__udivdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
make[2]: *** [/builds/linux/scripts/Makefile.modpost:136:
Module.symvers] Error 1
make[2]: Target '__modpost' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1978: modpost] Error 2


links,
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031706/suite/build/test/gcc-8-ppc6xx_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031706/suite/build/test/gcc-8-ppc6xx_defconfig/history/

Steps to reproduce:
=======
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

 tuxmake --runtime podman --target-arch powerpc --toolchain gcc-8
--kconfig ppc6xx_defconfig


--
Linaro LKFT
https://lkft.linaro.org
