Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD4D3E3BED
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Aug 2021 19:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E3BF1684;
	Sun,  8 Aug 2021 19:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E3BF1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628443566;
	bh=WtWyowJ6QssC1JRzO09YtP61HrwFbm3mKIpkjYJPuY0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pV2H+rkXnFWECzM6m4AF0xLpTPDSGQXFhjIMEv6kltMzYZCUnlITMgdvbwKYWRXQs
	 t84dVQ4/lmllPRyaFKHtH/Rj2SBsVWW4wGNUiVIEtAE8b7DP5kLEVP0qx10AF3vLTk
	 p24w0JVHT205YuDJLB1ycmq8ETD/MATu+JjqRvmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADCF1F800FD;
	Sun,  8 Aug 2021 19:24:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59D97F802A0; Sun,  8 Aug 2021 19:24:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 17654F80245
 for <alsa-devel@alsa-project.org>; Sun,  8 Aug 2021 19:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17654F80245
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1628443463847054958-webhooks-bot@alsa-project.org>
References: <1628443463847054958-webhooks-bot@alsa-project.org>
Subject: undefined reference to `_snd_module_control_empty'
Message-Id: <20210808172431.59D97F802A0@alsa1.perex.cz>
Date: Sun,  8 Aug 2021 19:24:31 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #168 was edited from madebr:

When linking `aserver` of libalsa 1.2.5.1,
the following linking error appears:
```
/usr/bin/ld: ../src/.libs/libasound.a(control_symbols.o):(.data.rel+0x8): undefined reference to `_snd_module_control_empty'
collect2: error: ld returned 1 exit status
```

libalsa is built as a static library.

Full log:
[libalsa.log](https://github.com/alsa-project/alsa-lib/files/6951192/libalsa.log)
(this is using the conan build recipe at https://github.com/conan-io/conan-center-index/tree/master/recipes/libalsa/all)

Thanks

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/168
Repository URL: https://github.com/alsa-project/alsa-lib
