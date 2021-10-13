Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B0742BC61
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 12:02:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08626168F;
	Wed, 13 Oct 2021 12:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08626168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634119368;
	bh=3RMEW8Ge3qcJuoeNFuOPsDFEaugMGXxOQy9CfKKkB18=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cMCFS76KIZYAvFmDsnISuDdYNtxX3Kd5oyMvv4R+l7/SMGXsc3IWonZmCARlV0Fb+
	 Hit/JxiTd1R4Ds6tYA7GibC8p65f6MD2rJFzgfntW/+4bbW0PWqWMugkLj71glq0FV
	 MCo7CZZeDIaRLta2/jdwRwDcIt48tpUgie/82iSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5908EF8028D;
	Wed, 13 Oct 2021 12:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55DCAF80269; Wed, 13 Oct 2021 12:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B52F80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 12:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B52F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="W4+p2OYg"
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E7CB13FFF1
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634119279;
 bh=72qIwnXVGNrfKxhLObQPGF0RNQPHhrmziNaYX8Pmn6k=;
 h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
 b=W4+p2OYgCnWCzp8aAIalzoSBu4LQMSeusJYU5/m7shf8Au032jSENO/pDUEH0vPrN
 zOzb2njlwuPQ1MdaGrmQqbxde40wkpz+IgWT5kZVurmGy6Sw2sOI0BiCludijQ1wr7
 MVS5dLAg5dzagVNWzv9wpR1mQdR+UZ+RfnMaTJiEt5EEJn6Q6YK+iOXHB9He6FshSE
 6/3KFxt4MpdrDcYFVchDcfwEeRtsFFf19w9SItEwNbqDX888UPFtbY5vpxK5PqsmGq
 rLLBrkWeurvSRcq26GQlGyCzqusl1HytgKAXVZcPDSqV4OQ70WJ07FqhW5Ef3FVIzt
 uNpaEW2ycZzlA==
Received: by mail-oi1-f197.google.com with SMTP id
 x17-20020a544011000000b00298d5769310so1409744oie.12
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 03:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=72qIwnXVGNrfKxhLObQPGF0RNQPHhrmziNaYX8Pmn6k=;
 b=Bf4d0Cqk9ChypQoqFUo6s4HQtIaYMdsZL8E0xPv67nMth5J2XkwQsu+v7B+X/PqX/Q
 iOeClotn9levjF4H4X7I/EYJhgYYopjYLXm98yQc7pvNRAjvg2FtlyGLfQk11Ew8LieA
 t7HW/u9a16F/pSXdD+NU2bs+Ei/ULReyDc6S9ynNqrnFKkggm/N9laead1r9l/M6AqsL
 pNn7wBTi/v590r+Z1VjQOQBNfAdAbBL09MWL+TrXWs9CNmGVn58GM0e7LA7BaXalZDgm
 YhUeTws+6d4i5gl6cNfAGINzVyACrpWvEpw3PgrMXzUi4ipz4tc/U9T3vj3m0Jq+BU1u
 enRA==
X-Gm-Message-State: AOAM531fe3/2ERLSTFPHFHia+6IQxFqx1ihskJHUM9ZJMQJDBW9JMe2Q
 dUItWQ/2Qw5ISUOf+4uHDWHcJkAlJ97qRjFuzZ5Krpa+75saXw7EnR3phnRf6IxRcDQx260rRiV
 3L7KH09bA/v6zGL/I32R3hxskBm3qWRxkqMBvAvaRYeWz39yikUSvtIEu
X-Received: by 2002:a9d:4586:: with SMTP id x6mr4832696ote.155.1634119278847; 
 Wed, 13 Oct 2021 03:01:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRbNoT+5vjBaO6avzuE4+i7alOLMD7HAQHPzEjaJby9bEFhDVvy6NozAELmsBiJGECEiNH0ZW4yOwsGiLBpew=
X-Received: by 2002:a9d:4586:: with SMTP id x6mr4832615ote.155.1634119278015; 
 Wed, 13 Oct 2021 03:01:18 -0700 (PDT)
MIME-Version: 1.0
From: Chris Chiu <chris.chiu@canonical.com>
Date: Wed, 13 Oct 2021 18:01:07 +0800
Message-ID: <CABTNMG2ipP4m4T084QRrHMLL_cGfyVdb_dBNf_E8pruMSDRHJQ@mail.gmail.com>
Subject: The default jack detection type overridden by sof_sdw_quirk
To: pierre-louis.bossart@linux.intel.com, broonie@kernel.org, 
 rander.wang@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Linux Kernel <linux-kernel@vger.kernel.org>
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

Hi,
    I have an Intel AlderLake machine which uses the sof-soundwire
driver for audio functions. When the headset is plugged in, it will
incorrectly trigger the event KEY_PLAYPAUSE and never stops. To fix
the problem, I used to apply the quirk RT711_JD2 proposed in
sound/soc/intel/boards/sof_sdw.c and the jack detect function will
work as expected.
    However, when I look into the code of sound/soc/codecs/rt711.c and
rt711-sdca.c, the default value for jd_src
(https://github.com/torvalds/linux/blob/master/sound/soc/codecs/rt711.c#L1209)
 is already RT711_JD2, which means it is overridden by other drivers.
After digging deeper, the jd_src value is overridden by
rt711_add_codec_device_props() with the value RT711_JD1 comes from
sof_sdw_quirk.
    Is there any reason why sof_sdw_quirk is assigned with RT711_JD1
by default? Can I simply fix it by assigning the sof_sdw_quirk to
RT711_JD_NULL as follows?
-unsigned long sof_sdw_quirk = RT711_JD1;
+unsigned long sof_sdw_quirk = RT711_JD_NULL;

    Please let me know if there's any potential problem I didn't
notice and suggest if there's any better solution. Thanks

Chris
