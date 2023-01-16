Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED266CC50
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 18:24:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A30E5912;
	Mon, 16 Jan 2023 18:24:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A30E5912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673889894;
	bh=JYdgMzjX3SdtHUhlc4JqQNlQEpIgJ4tHf+fTdHFdHb8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pT+t6r+FquYs0lIy3+8FaflKFLrhRSzGG3vyVEIF7v/TcydDyF9ysjkY0kmYfXz7C
	 SdElZgARVXKAre6F+QEdwDv1+MbJGkq5mXe6hjPz6AxiAYNv7Hia2ko8T2b1dmxyCz
	 elNEisQU1K1M0n3eO2zSHzCx7Q95bSWb0akPXY6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F9CBF80482;
	Mon, 16 Jan 2023 18:23:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 953FDF80240; Mon, 16 Jan 2023 18:23:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B739F80083
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 18:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B739F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YppIn6k9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 451A1B810A0;
 Mon, 16 Jan 2023 17:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC4EC433EF;
 Mon, 16 Jan 2023 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673889828;
 bh=JYdgMzjX3SdtHUhlc4JqQNlQEpIgJ4tHf+fTdHFdHb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YppIn6k9jGPDSp77P5hlkqwbe3XdHs8C+pzPcjc4LzgHZq9iYLlDNh1+m96T8qzyq
 4dXD/4siUPnnCXhFsmjoqRbjuRnA0vksn98yQGWysEfS/zuyHJ/j2nvsDgtA4p0Uk+
 aXmAr6+VAkYhRBKGMwFoZbffaKhAsR5hGlzQAZyE5n+4+POhnM08Gk6apNO7D7aVRP
 +KmuEPwNNQLujE24eT2vagiEMBqWA3tu3d8zmCpkl4z61/0b17ZwoNy12h6Jv7+mCZ
 FvSJeU1AcyNui7w2DJ6gyAL0dntf7XuTrPuHFcwKy1Gj2Zebuqkeze/APTUoM178wo
 qTsgQLVE/AABQ==
From: SeongJae Park <sj@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 2/2] Docs: Add some missing SPDX license identifiers of
 subsystem docs
Date: Mon, 16 Jan 2023 17:23:45 +0000
Message-Id: <20230116172345.12835-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CADnq5_OUnkzoZcCdW0X-=gJsXSRgY=GLrbmfNj0geDCzL5a7eQ@mail.gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 SeongJae Park <sj@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Jean Delvare <jdelvare@suse.com>,
 linux-crypto@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Alex,

On Sun, 15 Jan 2023 10:35:57 -0500 Alex Deucher <alexdeucher@gmail.com> wrote:

> On Sat, Jan 14, 2023 at 2:48 PM SeongJae Park <sj@kernel.org> wrote:
> >
> > Some subsystem documents are missing SPDX license identifiers.  Add
> > those.
> 
> It would be good to split this up per subsystem.

Thank you for the comment, will do so in next spin.


Thanks,
SJ

[...]
