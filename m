Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A405393CB
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 17:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 407092046;
	Tue, 31 May 2022 17:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 407092046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654010338;
	bh=2ykgC3HP10sFR+M5OFc4keUFKEyxKDR9TE9x5DhBIZ4=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L/cktLBg8p9ziou39EQJB+0w9Nalf2UPfD/7yUJMw1MdNmas0/A+M+AvB1a3DPTNu
	 Atq624kcDJTV8eRE85EcCcK4qn6nNaKMXuJ+0bJ6TZpy4B5VVlDaN2it7AJbI+L7AN
	 G9GuKkdWwgR6wuSkKAPVHW0P2ApS4pjCeLJI7gYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3BBDF8051D;
	Tue, 31 May 2022 17:18:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AF53F8051C; Tue, 31 May 2022 17:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 291DBF80516
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 17:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 291DBF80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="guxECElP"
Received: by mail-lj1-x235.google.com with SMTP id k1so137302ljn.10
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=2ykgC3HP10sFR+M5OFc4keUFKEyxKDR9TE9x5DhBIZ4=;
 b=guxECElPKr2CERKrU7bUTa3W8s5akY8+JdTyrlPvl198H8iwwZj7wuLqql3T63ZJcx
 2y6IRXINTXW+WBtddpO6yhDktvN4/X5oDtzKtTPc0IzeoQiSnKp4UyKLfh4Gv2tPe85C
 k9ISJMy0WEf6xP3s9Yk4D+AyBFCUhrCS2v1LUGqlpeNLEYldD5awTrCew7FifpDB6iuP
 A4DDUDlHdaVj8Vdxq4EJ0YBeba2hGgW7kfyp8okRPnf2fDoNq2JHVS5w/KoRKJcz668B
 8t8XoYVkAIX56mHRlAlNalsWpzHrpDt83molVv+6KNagFfb89lEnVc67pbutMHvbkkJW
 Mgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=2ykgC3HP10sFR+M5OFc4keUFKEyxKDR9TE9x5DhBIZ4=;
 b=J6Xy590cqPAiIsY9rP5EETdVdkRW2ePjsxncWm9BUV0SqS1wB1SdCQgNlfE0WPH+Vi
 pt1HoJ435ApTZuJGRqX0OnZGvmxxdjBvTgj/c1fZhW0YFK2o9y37wC4ZxTfrpnCFNR5D
 HbOrKtqdYpR2UGP1Scux/o/W1k0hfhOsCFtD1fJO5YR3XRqcTxS5V0AA0ngQxY6SbXmm
 1oQ7yVfsS4fWYGMP0A/quO8DKdUr1q0uVNPjh9dvdBkJ/9AiQ3+o8YQvknwI890nEy/5
 SgbUozhmBy/bz/oHwbKw08tDDUmcgWllGezTtJyxBfaWXBw4g/BcDEOXDxaAeDPuB+Rq
 VM8w==
X-Gm-Message-State: AOAM533fS/TCR8tWiWHx5UP6jqUt6nRZqf42WQfFG+04jeEHYwldi9Cz
 T93HY94dW5vSEyiy/eItDCYnS9NLa9B7VVztdUE=
X-Google-Smtp-Source: ABdhPJzSnFU0/zgvEf7VSBnPc3z47eQ5I1X484h2PhrA2Yd/+Ct94gsBe73nj/tf+rZl7RnxhKnBzYuJ9247YwvcKLA=
X-Received: by 2002:a2e:bf01:0:b0:247:dfe7:62dc with SMTP id
 c1-20020a2ebf01000000b00247dfe762dcmr36713385ljr.365.1654010274931; Tue, 31
 May 2022 08:17:54 -0700 (PDT)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Tue, 31 May 2022 20:47:43 +0530
Message-ID: <CAHhAz+gqRDh=CJseQEhAJcRVEguxQ5c4vdUX8dvzdPNT=Sy3iA@mail.gmail.com>
Subject: soundwire: device drivers for PC based hardware
To: vkoul@kernel.org, sanyog.r.kale@intel.com, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 alsa-devel <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: LKML <linux-kernel@vger.kernel.org>
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

Hi all,

I am looking for the soundwire device drivers which run on x86 CPU for
PC based platforms.

linux/drivers/soundwire at master =C2=B7 torvalds/linux =C2=B7 GitHub

Can the above mentioned mainline tree drivers can be used for this purpose?

config SOUNDWIRE_INTEL
depends on ACPI && SND_SOC

config SOUNDWIRE_QCOM
depends on SND_SOC

As per the Kconfig file, both the Intel and Qualcomm SoundWire Master
driver depend on SND_SOC, does it mean it is only possible to run on
SoC CPU(Arm chipsets)?


--=20
Thanks,
Sekhar
