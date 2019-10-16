Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E827FD9054
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 14:04:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1D2D166F;
	Wed, 16 Oct 2019 14:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1D2D166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571227479;
	bh=hVRg3ea8viXBEfAmpbJQBc6567mvf5eu1u+/IDwSzUY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AhJrVzWBrBYvd7eB6ansbovZco/f9aA/Yn5EilYYPudDLWFEn28MbW8Vf68KWCjV3
	 hcSDto/xSpxwIHtHBlyNxXym+yCXqaflgkHJZvzCo5WxU3f0/eU4Qf3yX2v7MVVeyZ
	 Mpj7AwrMoH+zt9K1M+UOegw6g1uSS9AFuWEIjhKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2833F805FF;
	Wed, 16 Oct 2019 14:02:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13F29F805FD; Wed, 16 Oct 2019 14:02:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA088F805F5
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 14:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA088F805F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="etsZ1bWT"
Received: by mail-wr1-x444.google.com with SMTP id z9so27725987wrl.11
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MJlPPYSOTR+XMqwsFOpW43F1STdyWoaZhxY38kEyCWg=;
 b=etsZ1bWTCeKvaBi7j7rTkURIltg2naJHd+NQgupHHlgZXx5NJpBarRk+m2C7bXMjOi
 FL4zOg8RMXQ89ZL7Jp/eN1N/JbgkqmscwWmE/X1yPBbUc1S4v6YvSWTs+4bSt2p++Axd
 PYgxNf22OFeFs5I801rrrqOgGBp8m8Ae3z7iImSE4DN7LEz2AkjbmdpoEQHPyAxLqX18
 R+PMozVsAIqzLU+Aropn8/vSAd8wbmiARBIBe7nwCnlv8mpRj4QkPoMzb7pQoKr9U/ye
 5D8iMxQ0xrteIczddx6Eg2nFqcq2U5zVDNFs0tlBU3dErnEtJKTaGGB6SSjqiYRqp1eH
 Tung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJlPPYSOTR+XMqwsFOpW43F1STdyWoaZhxY38kEyCWg=;
 b=NIzmgxLSvVfBhYrDwJQ6VZSA6AorK+2CYfvE87Rlghj9SCxO/KcjPPDXSj+4QB5/p1
 hkvTkG//N/yUDMHCV+7FLLfgZ+S1KpTheOoHtevAiUsELyU1kJinPg/pbf02FQn2skvM
 Di85vkQiw0mZJXNtQy13rq42zibL6/spbajH1jYEmNj7PX1epZt36Byu3gA+5Snsj47H
 y7Br6jKRnCObGtueYH/BABdoTfuQraOgyDPaxWqRuTC2qq45Nr79mYNnIb40GJZcIaio
 h/JSgfxkl52cxBheMtCvaDhIcHA99tbrj3QJSeRiJEEbnU5Qsf4lD7vk8b7r0w0i/BZu
 IBeA==
X-Gm-Message-State: APjAAAX/KDNwsIV9/Zq0RwrlbWGFm63AFG6kcORs078Mhx3pP2cPzEJy
 9A82A9AS+8s+FX4Rmu+mSUamp+d7LioH9jHVztyua2FH4c8=
X-Google-Smtp-Source: APXvYqxgpyG22ylSyrF9Js6Assnyl2ZxuEKyL7SnQxtgAOMehI0YOCH6xsZbiXEhlDX5043znbNahsswawXbPYFeCrc=
X-Received: by 2002:adf:a141:: with SMTP id r1mr2446415wrr.122.1571227335079; 
 Wed, 16 Oct 2019 05:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <87a7a24l7r.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZAsZ=Q=tcqCzVp8bvj4Jme+YTH9GxmMoBgvOT+w6z8iiw@mail.gmail.com>
 <877e564ht5.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZDtwFoXQ2H_j1v-95Pnh=QzZFX86jHk1RTq1oqSO+5jRw@mail.gmail.com>
 <93911ba6-370e-4b93-d3c2-81081b1be0aa@linux.intel.com>
 <87o8yhwn3d.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZDEZySYWzJ9gifVAiZ0qOxDe_w9zMxgsLbN0URmpcYCAw@mail.gmail.com>
 <20191016112147.GB4881@sirena.co.uk>
In-Reply-To: <20191016112147.GB4881@sirena.co.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 16 Oct 2019 15:02:04 +0300
Message-ID: <CAEnQRZAk_wW9bKd7LJxeBUTwsn_vME9u0w0B84r5ovqUYR=GeA@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sof: include types.h at header.h
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Oct 16, 2019 at 2:21 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Oct 16, 2019 at 02:11:57PM +0300, Daniel Baluta wrote:
>
> > That means Mark needs to drop Morimoto-san's patch.
>
> Please send a patch reverting it if you think that's the best option.

On a second thought header.h from FW side includes <stdint.h> so I
think it is fair that header.h from Linux kernel
to include <types.h>

Another remark I have is that usually kernel headers should include
their <uapi> counterparts, but in header.h
doesn't happen. I wonder why.

In my opinion the best solution would be this:

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 10f00c08dbb7..a0d6b5896467 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -9,6 +9,7 @@
 #ifndef __INCLUDE_SOUND_SOF_HEADER_H__
 #define __INCLUDE_SOUND_SOF_HEADER_H__

+#include <uapi/sound/sof/header.h>
 #include <uapi/sound/sof/abi.h>

 /** \addtogroup sof_uapi uAPI

I need Pierre to have a look.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
