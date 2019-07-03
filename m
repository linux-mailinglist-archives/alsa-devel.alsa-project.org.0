Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0315DE28
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 08:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B20168F;
	Wed,  3 Jul 2019 08:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B20168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562136075;
	bh=+R78ez7qVd3dwIYTEkENaK0zOcTyyfO9YTVgi0aIAAg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HZmHrlGZHoeWgBnhdp+PpruQGH8AFU2CnSciuurXmUtlZ3KUHu+H0jMRnNE+CLQqW
	 W7rYvmzhykx0+jD3owv0/9eMMV0ecYe6DjN4CwhAHeZ/CPfFYT0qBuir9/MtIXqcLR
	 xibBeWhHrA6HJlYZNGYpia4DEI4B9fQsHJP+Xa7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D08F800F1;
	Wed,  3 Jul 2019 08:39:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97BEEF800EA; Wed,  3 Jul 2019 08:39:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFBE5F80058
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 08:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFBE5F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gusEV3dQ"
Received: by mail-oi1-x242.google.com with SMTP id u15so1176133oiv.0
 for <alsa-devel@alsa-project.org>; Tue, 02 Jul 2019 23:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rzFJMHDpHByCzcWhuZXAnLOtHUvnMPtLGHFq26hbyoQ=;
 b=gusEV3dQDcydQj7FvyKtDJjEqlwd7Ae6TMU0paGy0Ue/KEy5G/5cCAlbsDqqAEWm0V
 sQ0RObaC/u3M1JZ+0h/CAx7uiNcGcqr8vltVb/xLGJQDpXEIi1nz8zhVQNjm0zszIZ7x
 w7Bxi5ywZEQJzpjARoKDb/FoLQUg1CfanmgBUL2fP0TmXIoSueyJfNA0tyE6iTs0QtVA
 x/f5C++XC9ELKQEGTfRUD0VRUkuefUhyUb3LtbbBMlBtJzbMOgGmuCJwWyGrxogM/xhY
 kzCLbujTXNYmtamx0JTFx/YQLzeQ6wDyM5q2H616Jp3guh358qz3xe+FZGs0LPW91z3W
 PzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rzFJMHDpHByCzcWhuZXAnLOtHUvnMPtLGHFq26hbyoQ=;
 b=hZn8OvWivYix2CCYzVDdrM52nTzPdh4k1kW+NpchQAiFK/6M4hKJaCNuuL9jfa/gsa
 5EUYxybQui9D2wPgJ9ddMVDCGqGyFlcmh87EiviJwBMLWglZel1x9cIpil6lAQGwflSL
 OMwilrI28Zz4/VyiHrXzlbaWpVJzgqlWg8ByAejLTdr54Q13CuNHi0qy83+C/aKtFSrx
 rIWA5lenyVr/2zAJalpxxrTXe9cfURe9CMjMS5IlLlJqv7EWMMzUvdynO/pFvq4b62EJ
 DZuxUZrcWEVQ16V5xmVEQzzpsUaJOlzAMdivnZst5J1deJESZVCVzWHJ0LeZRq40+QiN
 us+g==
X-Gm-Message-State: APjAAAXdz9Aswl1/W+xRuRfBwts/uYmgV12ZIBX8xWeExdCjaqL+q9Pr
 T7V0ZONbXDl8hZd2VxnuRmuTWXStXy6ceT/Ny5qtsw==
X-Google-Smtp-Source: APXvYqzeuiJI5QP3+kvjzprScN4aLZU1cs35zUV5vfuf0S25JDg9m8LIynftuJP4IjxEQpF52vysMKyTqDbR4Ee4XDk=
X-Received: by 2002:aca:ecc1:: with SMTP id k184mr5569983oih.82.1562135964726; 
 Tue, 02 Jul 2019 23:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <87a7e2wkll.wl-kuninori.morimoto.gx@renesas.com>
 <87ftnutr9i.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftnutr9i.wl-kuninori.morimoto.gx@renesas.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 3 Jul 2019 14:39:13 +0800
Message-ID: <CA+Px+wVH0ypoeY+CrWTHmQf-LYBTB9gOFwnMY8pQ5Q3K-urCrw@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 46/46] ASoC: soc-utils: respawn dummy
	Platform
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

On Fri, Jun 28, 2019 at 10:18 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> commit 64ee5067cf64 ("ASoC: soc-utils: remove dummy Platform") removed
> dummy Platform from ALSA SoC, but it is over-kill.
What did you mean by "over-kill"?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
