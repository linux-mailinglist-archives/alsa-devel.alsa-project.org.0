Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D86595D0C
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 15:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7B41633;
	Tue, 16 Aug 2022 15:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7B41633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660655790;
	bh=92WW2eTYWZKixtPE7AAA4M5Ib4PLg7xvAUOP3U+rYv0=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JdafFpuhDrUDsrx7jPIknIf+sn/K3u5PU8Ohoh+NPULRYyTMzqRSrN/1HhDw2qDSl
	 UM4uL/9Nagr9/JEjRbaxSYNH1mzbjw2w2z+qXNas0qpUtQ0eWUN+r0rs1BfTK1KMvf
	 +VNkPcuPgda91r5kJ4iocpvxAle04n6103B3ovFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D3FCF80118;
	Tue, 16 Aug 2022 15:15:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64252F8032D; Tue, 16 Aug 2022 15:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 555BAF80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 15:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 555BAF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Av6DCKy3"
Received: by mail-vk1-xa2e.google.com with SMTP id q14so5124409vke.9
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 06:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=92WW2eTYWZKixtPE7AAA4M5Ib4PLg7xvAUOP3U+rYv0=;
 b=Av6DCKy3fGsnxBLca5zocppac9fNuyCn0LzgzCWy57NLzKKBylZVnoZi+qssQRIvA4
 4LvTJKyPleuQZWgDTuYz5ekraQU0WxD0UnA0bamiEz7J9adoFl+615sqzXMRqlDrABL7
 8AGdFyaDuIXask+Dhkuc1504PCb6TTI1jrionxFwmrYbbMxWjZGXGhUa1GOuJyw+IYYY
 UnmPPQ2vLw9zU7OcdpT3uaMjpy1GC/tH1O6KBM6KeB2/KLcJk36AnrQ5RqT4+/Yyl4F8
 WelQ5DW5ZwawIRYBuPl/PDl1/MEc0VGnDWSyoE+8Fs6wHNN3Imv8DqESVvgvytQHGCDV
 hBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=92WW2eTYWZKixtPE7AAA4M5Ib4PLg7xvAUOP3U+rYv0=;
 b=69Fduk7G0m8OZNmXZMJxmW8rHSEEiffXH+IxKmX2tTkqbbOUTDrt5eHYqsmjMNhZFS
 gWsA8zCumSw8mru4oFszZs3mVOpIQPYGoxnCRlL+raNgfeMlhV1HjlqyKavMBxTi0lqt
 c162AJ6VaWqAjb6NTrlc308KnRRgpr1hKbraN0mzzeqMoKQY6uyDd7qW7X3xLN7fkfUH
 18Szc/u9tSYCQd9O9KuB3PEQIEF0QfXEbDe1AGoj5QwXUhyOCZhATMN3xXdcmurCGwcs
 ZJbVX19TzoOK1aHxslH+T/FaUR9YrZIyZBxhCnRgIW2Xz0ZWpZGFQGv7K9mUleCms8OP
 qDmQ==
X-Gm-Message-State: ACgBeo1ir8wLkEWI2m/HsDomUYiaDFcc4r0BtqtdpqasGcUfR5i1D4d1
 Vg9KzFrGkAo3+TkzCF0sq7lYEOyTwXvKHqLL7Rg=
X-Google-Smtp-Source: AA6agR7+g+hFx30jaAYdCvakflLaplNLD4w86lgFYyYFFK5kG44n22xZnCgYqXe7kHgp2j+i30lT/Q==
X-Received: by 2002:a1f:da44:0:b0:377:2e13:1035 with SMTP id
 r65-20020a1fda44000000b003772e131035mr8651014vkg.29.1660655718226; 
 Tue, 16 Aug 2022 06:15:18 -0700 (PDT)
Received: from geday ([2804:7f2:8006:9bc6:14ea:bdc5:dc66:de30])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a1faa0d000000b00376f4f93745sm8504862vke.10.2022.08.16.06.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 06:15:17 -0700 (PDT)
Date: Tue, 16 Aug 2022 10:15:16 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Rockchip I2S commit possibly ignored
Message-ID: <YvuYZE0biiAn/sxQ@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: ALSA-devel <alsa-devel@alsa-project.org>
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

Hi Mark,

I was looking at Rockchip I2S commits and it seems "ASoC: rockchip: i2s:
Reset the controller if soft reset failed" was supposed to have been
merged to your sound.git but never was. I don't know if this was
intentional or a real miss but in any case I'm letting you know.

According to 515b436be291ff197c52198282bbb19e79c9d197 'Merge series
"Patches to update for rockchip i2s" from Sugar Zhang
<sugar.zhang@rock-chips.com>:' it should have been merged to your tree.
In rockchip-i2s.yaml there's even documentation that references the
missing commit.

However in the alsa-devel archives,
https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189050.html
I see there was no commit info for the unmerged patch. Perhaps this
caused it to be black-holed?

Thanks,
Geraldo Nascimento
