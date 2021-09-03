Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29B4002DD
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 18:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09ADF18B5;
	Fri,  3 Sep 2021 18:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09ADF18B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630685068;
	bh=VuoVMOLwXT0Lrus8Yp/9d+LE+TbVeNBkpQ5C8cJGLps=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bphwb08R1Eu55yVMnKmw+FZj9ZCIDUzzZwIhJlEIPhimfmBPuackutX/26uBJBtlc
	 O5dgRJ8IQpeumYsvWyg9IddOfcCq4xriPlZoNR4ekaUC3Jdyf+Bxm3P88vG5a7znam
	 RORyoiS/i6HIjNgW8CMMOYToHB/Rvve3buOVrj4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E29F80256;
	Fri,  3 Sep 2021 18:03:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0A5FF80254; Fri,  3 Sep 2021 18:03:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BA7FF80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA7FF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="tHJSW7ZU"
Received: from dnyon.com (55.red-81-39-194.dynamicip.rima-tde.net
 [81.39.194.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id A26DF3FEB7;
 Fri,  3 Sep 2021 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630684977; bh=VuoVMOLwXT0Lrus8Yp/9d+LE+TbVeNBkpQ5C8cJGLps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tHJSW7ZU6Fcphf5XNe2FSJmR6LOj0T/zjndyINcu+XJyJtUBy+tk/f3K4bx8jVDoB
 LS6j6fXu4AX3jDsTZ1tEyoKbR7NBKXDfeLyDzbF9xpMXEyvsfkpMuE7fJHxINvChAd
 3dVDJwl2DDSRjjCs9sgk/KYq7ZtyZyv9HBpldJwjbMhqiu0E/IjU0ZFxCTke+Ve2Pc
 g7Y4yeFgN9crDm+ftU5GR45/CUsH9BN8oY/5LTM3GBKJ9YErqYE+lC0hA5r0Wt9m4G
 UKWAY6tvTScd87I7ubAfN8wvnLAbONCGnleZi1Chn4a97oBJe4Ixsp5YMmECwtNaeS
 gyJ7UYI7erG+A==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 0/2] Add reset-gpios handling for max98927
Date: Fri, 03 Sep 2021 18:02:36 +0200
Message-ID: <2103571.irdbgypaU6@alexpc>
In-Reply-To: <CAHp75VdOw7fS055q9eccm9dP9nuAK8rcLXf4vuzA=-UnbqoUfQ@mail.gmail.com>
References: <cover.1630632805.git.atafalla@dnyon.com>
 <CAHp75VdOw7fS055q9eccm9dP9nuAK8rcLXf4vuzA=-UnbqoUfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On 3/9/21 10:16 Andy Shevchenko wrote:
> On Fri, Sep 3, 2021 at 4:51 AM Alejandro <atafalla@dnyon.com> wrote:
> > The max98927 codec on some devices (i.e. Xiaomi Mi A2 Lite phone) require
> 
> requires
> 
> > hardware-resetting the codec by driving a reset-gpio. This series add
> 
> adds
> 
> > support for it through an optional reset-gpios property.
> 
> Where is the  changelog?
I'll fix the typos and add previous changelogs in the next version.
Thank you.

-- 
Alejandro Tafalla


