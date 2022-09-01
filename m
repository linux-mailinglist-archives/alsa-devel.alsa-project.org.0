Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B08655AA023
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 21:36:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1761E210;
	Thu,  1 Sep 2022 21:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1761E210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662061001;
	bh=gl37VaknvPtE505jNEGScISD9lh8tGLuJYSua8K+tcE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XwmijB9XeCJGJe4q3kKiqNgKZSgtSVwQvoPS1YB4ScJgBsQcRANOrZbB5PrbLU6t2
	 d3xJJXKWDRliIszN9o141ivzsHfncXlwpKqG95aLibe/rSEP+v4J0E393RKZF6hSoR
	 Od9p1gL4/e3eOK3otz746ATwVxaSQaBobkRrwpSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C9C0F804A9;
	Thu,  1 Sep 2022 21:35:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 925F0F8026D; Thu,  1 Sep 2022 21:35:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA91F800EB
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 21:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA91F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cc6qIcfe"
Received: by mail-qv1-xf2f.google.com with SMTP id l5so14224537qvs.13
 for <alsa-devel@alsa-project.org>; Thu, 01 Sep 2022 12:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=UTBH3ZdVXDU80DZLVRDqtIzjJqfExVq6UuHtVbe7ytw=;
 b=cc6qIcfeYMZ/SYFhyoOYaOlejSar4fvt7eaC6hWph8Vm89PxHJePz6jHQuUA3uKOxW
 xoTb/FIeZEjEW9w4NCFuhaYpPrfpJV/zJIvQufFLDvYJBV7rG0whxvGEaiET0X4TnOKI
 CSxHkTzgBb8BNcBUXa8evSulFwvVWMOZxIt6Xq7Iy/0ifZixSTfYHgKw8O7+5E4bZSaz
 IwcCzXTwudYYjaV7t+vQkIg8sXbOoMQYCDo7bFvAUQ9/3bNuTFPDqiIOzv11BkZhxiIH
 0CtLSbVdwVcJ+EDSJAr48KcnueG6sU7NHnMJu9KdeaNijV2p21nG5lVZ1LSvqy8PbkTP
 ARyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UTBH3ZdVXDU80DZLVRDqtIzjJqfExVq6UuHtVbe7ytw=;
 b=afjEDbbttNrJKbIRSbcN9FqsKQScuLfVeuM2CurLnLxmG9++ZPeOZdup3JWSOfmr+v
 imnHu4K60C/RhZNNqwBx0cP9FPjw8VzvUK32fcS6k7XNeVyxiMBaGf27LfCQPSiU8wkq
 fh2txfSc5O8F9Xw0kS261ro66CFJFl9EsG0v4wHghxJGyiMlsWZn7jNn9SY99CXxaR+d
 thKOfLt4MTiARWMSqNyTgt65jpFhWNzT6onryghS2XfAcYsir8noFGxtFimvZf8/8PCw
 4EJK1H3oKkSKbneLnZ/s/OOs7MP6tTUXub2pQIno0guFktMvzXH6mTTUwxFJUJUI5lfC
 BTJQ==
X-Gm-Message-State: ACgBeo1UQXj4rKVHWwuPfKH4LbkKVc+cYDiPum/Q09gH4T0gxLw+RaOl
 /HRvRZf9AHq61ynYnoKTrFt5Ee9B2BGI/mZKPE0=
X-Google-Smtp-Source: AA6agR7zE5vM3379YmH+8og+0FzDs/kfGFEcxRhQLFhYOuDVffSnUvhdWpR+hcl+9VqRuiFaxcnc+E962KezfuFf5sw=
X-Received: by 2002:a05:6214:c8f:b0:499:21eb:ba3b with SMTP id
 r15-20020a0562140c8f00b0049921ebba3bmr7362076qvr.97.1662060929333; Thu, 01
 Sep 2022 12:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220901175022.334824-1-cezary.rojewski@intel.com>
 <20220901175022.334824-2-cezary.rojewski@intel.com>
In-Reply-To: <20220901175022.334824-2-cezary.rojewski@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Sep 2022 22:34:53 +0300
Message-ID: <CAHp75VfO7_ASHGdpkcb1dwvhyHPT31eYuAkCm2q7B+2WmtZC4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] lib/string_helpers: Introduce tokenize_user_input()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Andy Shevchenko <andy@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Thu, Sep 1, 2022 at 8:40 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> Add new helper function to allow for splitting specified user string
> into a sequence of integers. Internally it makes use of get_options() so
> the returned sequence contains the integers extracted plus an additional
> element that begins the sequence and specifies the integers count.

Thanks! In general it looks good to me, but a few minor comments below.

...

> +int tokenize_user_input(const char __user *from, size_t count, int **tkns);

Not sure how I can deduct from the name what function is actually
doing. Suggested new name: int_array_parse_user().

int int_array_parse_user(const char __user *from, size_t count, int **array);

(Note that we have _user suffix for many APIs in the kernel that does
interact with user space memory)

...

> + * @tkns:      Returned pointer to sequence of integers

array

...

If you are okay with this, you may add my
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
