Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D42E2240343
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 10:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D2D1666;
	Mon, 10 Aug 2020 10:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D2D1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597047328;
	bh=8JVxd0LfquvEwFWlVzm0eoYFyTaACuRCRqytuLnTbGs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFVPI/i1Nc0xP7Q0xKQSD9Gdw2qZmUi0rWpCutr6kDM9M/NS9/XNKzaBIhOxj0Wg5
	 6N9XFj45xAAGNaKUqVKlQyjDs7gBnEgGwB2nkppyuW0MnDcgNgRM+wRnsvLd63g/4a
	 FEzrj2O8T2jXcCLfX3JTV0iqyuzekNUuwcMDFX7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E41F8022D;
	Mon, 10 Aug 2020 10:13:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CED9F8022B; Mon, 10 Aug 2020 10:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BB86F800BC
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 10:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB86F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="a9sOniDg"
Received: by mail-il1-x12c.google.com with SMTP id c6so6796259ilo.13
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 01:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8JVxd0LfquvEwFWlVzm0eoYFyTaACuRCRqytuLnTbGs=;
 b=a9sOniDgn+OX3mKLx8wyRn8G/5nz6p0EI+n+UIFh/JhVHrGaGWBfyBK8qTpZW46Zms
 hdRV6io4qZc/g8y8ufYqkof85s+/NTHPQKA02wTMCODPBydcjrwfgTE/IQWKIP+lzmSv
 wxHMVmyC+DZgK/X7uZx3FZSFhYr6wD7qgFNMt+R3KNmdSIRH7CU3OLWUrTVEpOW8Qme6
 myEN8Tpphf6T40JIWhx5Jm7DMOwy8WNGedfxBcBWj9iuiTzAD+M2nwzQN30h4V+LIOyv
 d4viMILdQO9wDAxaDrPZ9AcpRy9j3NTDK6hoVLQaNrijwaUe7Ex1jdY/o8+7qa8OzqVM
 eQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8JVxd0LfquvEwFWlVzm0eoYFyTaACuRCRqytuLnTbGs=;
 b=pILrMAE+mbYh09LY9CWxvynHKc++Ms+se77oHTqzg5BbSSBFk0iWIPWA7F0fMmB3GP
 QPlQ9qOQqe8XfIAJVvvUmkhUO+lt5RLNMu7nbyFtnvRFxN/jhBnP4wEWCoxFRGuZnLRE
 cN5iEpe0EOBKlFUEWIqvB34l7X4zTD/MVDm95z/CmzYq4T1LT+Pf/Q8wZSV6t7Zr//CX
 htpgcjo6m1V+srz/RAryGYF7VSJRSNa+rmJBd/DO4EFlTwmohLrjwfoEdGqp6eoMLWHP
 pio32BnqS5M6HW5X82BVBEnHmg3N4+dT99m06DfsPzGd/z9Qln2DVJD0ua0UImQVDR5U
 3jWQ==
X-Gm-Message-State: AOAM5324ciNR/3uDSmWURPOgkWi193p+4edGFnjiYxTDSD1kqHhDXDvK
 u/HSKTh2SN/DMDLJEU3Q1ZP2JsVyHlw2viFOPXm4wA==
X-Google-Smtp-Source: ABdhPJysEFivEl0vYFplJC98GA9zeoDMNIxEa41sPvOq3HRZb2utcdXYgn2Zdo1CLZ1S13FPxCHpNSCIioXFwjPxw9I=
X-Received: by 2002:a05:6e02:1387:: with SMTP id
 d7mr16832113ilo.140.1597047211233; 
 Mon, 10 Aug 2020 01:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 10 Aug 2020 16:13:20 +0800
Message-ID: <CA+Px+wUkL7XwkppMA745cP_foNweaBLOSs0=BVzcDr0PEC+_Ew@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt6359: add codec driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

On Mon, Aug 10, 2020 at 11:11 AM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> Add the mt6359 codec driver.
>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

This patch also reviewed few rounds on https://crrev.com/c/2299951
