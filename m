Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96819245E1A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 09:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8131673;
	Mon, 17 Aug 2020 09:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8131673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597649659;
	bh=coRFPJbKc7ywpJ/3lZow7TORgJ25yZLIlsHXIN7jxzI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e51OU4dD0WvtF/Czw+krTDzuSfs5Mzl2GDlqHriTJYeuK2+7FUaKlBFK8u3E66OjR
	 jjc8YcPTLngvnSsRWarIBKQFkp5ekYKI8riztokfu1Y3zUUmLVVPf2DVNxhZE6DtZ3
	 wAmtpt1hu/HG4igNmCpITpfoH9pQ8SkcCPtXVGdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B33CF800EF;
	Mon, 17 Aug 2020 09:32:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECCCBF800F0; Mon, 17 Aug 2020 09:32:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D69FBF800F0
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 09:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D69FBF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="tNKStXXB"
Received: by mail-io1-xd43.google.com with SMTP id g19so16657496ioh.8
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 00:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=coRFPJbKc7ywpJ/3lZow7TORgJ25yZLIlsHXIN7jxzI=;
 b=tNKStXXBprrwJHyJVh8NMGU+XD/0G/4WKH47mbhpwKE5Z6rUlmgshyAEzqbJncPpcU
 rcC87eSlhXpk+Z2a5TSf8ZcQXN8a5uCph2e7RrhB7fIE4V83bm7yahnQ+xyeUVvrUyM4
 lykuFoQpx6RtkQKUW664Zfrx9e63X4S5cxa2kRaMjc4MNWWTPc5c9qOBg7tW+qCx0PNI
 IUkErl6rHI/4UhdfAst2zcAWE4GiNkjw+V40iQLu44pN5lNZQIZ7Atzk9qYEMmkEwl2b
 y9OiDJtGUpzZM6gjZyfua6XC2nvhby0JbCsJx8qg1u/l9qnWHZmPZ5+fjbgsz9E1LTuC
 lgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=coRFPJbKc7ywpJ/3lZow7TORgJ25yZLIlsHXIN7jxzI=;
 b=jt965Y42BRfbQnrjN3vjDqBh7mDvpoymfP8s/AIUfB/8hW/MDkB7/d3ktBo0c4wOjt
 fncdriduUQ6NQH8WOpnL4zEwE4O6TcdlIAxAaiSpv0VhqerS2Fje54B9tU28jdWUEEB0
 lbsQuHj9q+6SS0mbrY3jIwYqZILVD+b3ffd9gDQoMDgG7onC6Ft3CAd7xildutoHXAg7
 6V3+mlou0yCakiMZo6WrUztrX9wzUrLDQ+y1xkDoEtHRBQLrj2cJ0p7ZOuHZmIy4byI0
 vUIQuoQ5rt3B6dAWz2yAKMUAs5qP8cLGejtzEoE8sBrCmVP9H38wfO/+ITSn+Ej1beBa
 HubQ==
X-Gm-Message-State: AOAM5331TZs07N5LHATlx38ruOOX/VAgEQzBg1tz8T3GgxoDiTV2XQ4z
 AlJVCvpssGM7QKuElWVzQKSgk2MgmPZX0TGNcM4vEQ==
X-Google-Smtp-Source: ABdhPJyiQfEySyRQED1xZDsTrTIji8ZHp7mV/pCtyczHBll+qmrXXvVx94yMgeUGA+HSb+ucUVNCLkMo9+g8Mg+yu04=
X-Received: by 2002:a5d:8cce:: with SMTP id k14mr11326563iot.13.1597649547058; 
 Mon, 17 Aug 2020 00:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-2-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1597644455-8216-2-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Aug 2020 15:32:15 +0800
Message-ID: <CA+Px+wVFKNLYhYpchR-zmNkxaj2_fVYM_xUt7w73pp+KcNkR3A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: mediatek: mt6359: add codec driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Aug 17, 2020 at 2:08 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> Add the mt6359 codec driver.
>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

LGTM, thanks.
