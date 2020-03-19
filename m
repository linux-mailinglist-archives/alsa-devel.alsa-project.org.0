Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8F518C1DA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 21:52:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 940E817B4;
	Thu, 19 Mar 2020 21:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 940E817B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584651135;
	bh=Kyf9ajsDR4vppAgtNsM21ihbXytHvjaLDq9vutqF0Ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=etSXflw0t/Eckiv+W6MyhFOEXkkDZhexc7+JD/R9FsrPDYLdKxQw+xzwkbfQ8MNrO
	 NhUxXpzQX4oXODmBNfRl6Uyiu4Y5C6FV3sxfBD/ciqvZcaQ78zQzkXrmdx35xDWe8x
	 JxhqLULNN57JioU5NDO/zK1qxbMP5kqcpC6vhv3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC30F8023E;
	Thu, 19 Mar 2020 21:50:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEEDAF8022B; Thu, 19 Mar 2020 21:49:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16C95F8012F
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 21:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16C95F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com
 header.i=@gateworks-com.20150623.gappssmtp.com header.b="Qx4UOPeD"
Received: by mail-ot1-x342.google.com with SMTP id 111so3851372oth.13
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 13:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kyf9ajsDR4vppAgtNsM21ihbXytHvjaLDq9vutqF0Ow=;
 b=Qx4UOPeDeAXY7YtTyphjv7NW1pUfalmORDqsPGqF3oMer7S9vHDnPTqDb/GbNTIabD
 YFY1UdwynVf2OPtuDZSrud7apoNYFrG2S5rPF2fgv+LXlr3NjGlIOsHoWlsIbDkLmIQA
 /sX4ZD1zud1H24z3wvGB7Syk4AqwlBXw+zKUYVvhpESNcP7VQG0IMH/1hKYd9WtLbgI+
 tkex+3lFg71V/Aai2J74wMGkJ5rC0nx+q0xoYdOs1G+xwQE7MbcF7bBicyLduY5OUcec
 moFPsa0TpyubUErOHpUgkQyXc9z4go+Qg7gG5qivHeGQ5fiHjxlfyvPaH4pB6CiAwhBf
 neTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kyf9ajsDR4vppAgtNsM21ihbXytHvjaLDq9vutqF0Ow=;
 b=qPQAJCHS4d9QBYDX5m5v9DtaQU/Wa0WxCG0G/JprgG9RSfTT3k5BRJNmGRvSKBxHqv
 Nwd9rcVVrn1YiJ3UN2K8tgM/tXCWuLYIgbIcc0iwZNXAq0wJJCs9B/rC3rzJ+z7+quTf
 IGOffxtxFqojEPu/da9x2ZYevzZc5xhigW7PlTdN7Tua5yjHrQkJReGsNODxywsyO2uZ
 gl3nm6ZYRWfRiOFCrUXRfy70GtjascVst5XuucOcWeKxRHes3+XYxvFd29mkIZwr4xl5
 Hrd+vZdoCA8/ngmOWOK0EcDNNccP77iBYjaqvJ+V0Lc+3jcMD273SGJmXqWRBMs0Dh9/
 9LeA==
X-Gm-Message-State: ANhLgQ0+qPryiihjjPmDLmc2RBCN2NdPYIEaNwsxw+plSHkV4f0wqB8A
 LMB/0dhVhzfjkbxxRYjCzZ9g8QXmsLggPf7+zyuH3w==
X-Google-Smtp-Source: ADFU+vuqkdgiVtQGhhHLai1JnzgDoVhjusIptb9AQOM1sFQLW+udrSlRkNFjBlfJV/724Z4ANjmbIaqm1SOWnNWOnaY=
X-Received: by 2002:a05:6830:1e38:: with SMTP id
 t24mr4047611otr.33.1584650988486; 
 Thu, 19 Mar 2020 13:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
 <VI1PR04MB40620DD55D5ED0FDC3E94C2BF4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <20191212122318.GB4310@sirena.org.uk>
In-Reply-To: <20191212122318.GB4310@sirena.org.uk>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 19 Mar 2020 13:49:37 -0700
Message-ID: <CAJ+vNU0xZOb0R2VNkq6k3efdkgQUtO_-cEdNgZ643nt_G=vevQ@mail.gmail.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
To: Mark Brown <broonie@kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Alison Wang <alison.wang@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>
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

On Thu, Dec 12, 2019 at 4:24 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Dec 12, 2019 at 10:46:31AM +0000, Alison Wang wrote:
>
> > We tested this standard solution using gstreamer and standard ALSA
> > tools like aplay, arecord and all these tools unmute needed blocks
> > successfully.
>
> > [Alison Wang] I am using aplay. Do you mean I need to add some parameters for aplay or others to unmute the outputs?
>
> Use amixer.

Marc / Oleksandr,

I can't seem to find the original patch in my mailbox for 631bc8f:
('ASoC: sgtl5000: Fix of unmute outputs on probe') however I find it
breaks sgtl5000 audio output on the Gateworks boards which is still
broken on 5.6-rc6. Was there some follow-up patches that haven't made
it into mainline yet regarding this?

The response above indicates maybe there was an additional ALSA
control perhaps added as a resolution but I don't see any differences
there.

Best Regards,

Tim
