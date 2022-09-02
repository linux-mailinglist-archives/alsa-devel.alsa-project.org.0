Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A10D5AAAE1
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 11:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A45401636;
	Fri,  2 Sep 2022 11:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A45401636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662109565;
	bh=DByZzEa0/SSV2mogx+3VMuO9XtQSfHUPqskbOIRJ/hI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HolJQX3BbqdQZUmz5RBiOw3Jz43AQOPzyWjx22TC8fqdAE9Xhm99rALBuFGqPtoWA
	 YW2X94LhTS5XwkQu7ysIjzxDo35yCuc5RRRF+bh0BGMceFI4nHn3WxHWEdAXGVqKo8
	 RxJ/NHmYl70jU4iEDJDXAoqKzSV2gRSEC/TgRw1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8C14F80125;
	Fri,  2 Sep 2022 11:05:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65798F8027B; Fri,  2 Sep 2022 11:05:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82D7AF80125
 for <alsa-devel@alsa-project.org>; Fri,  2 Sep 2022 11:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D7AF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PqG6a4MK"
Received: by mail-qt1-x82b.google.com with SMTP id c20so971519qtw.8
 for <alsa-devel@alsa-project.org>; Fri, 02 Sep 2022 02:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=A0lRx9LcG2f6vdkkySTxdBxFyRczSLUlrhv0k8CVfMQ=;
 b=PqG6a4MKk2roT2Ce/PJEt8kCVddWYbqLQh141ATH+SE8SYCKK/ZFS9/OCHdfbfSgP8
 mQREKuMuSelAb6SBLEEu74TKUjSBBmwZ8WjygarTrIA/KvHYGyMp8a2J70T92Jg3Pcrb
 kcjEtRkQqjOXCQllUJDzs4CbTXcsIuMEFmKFSormg00PlTnX1F1InK7vkFbhfO4twbjw
 wX8s3+vO/eXcBlAlq1ZPFwMRXYokbFEoLvKUt2HuPvjJ+iL9BHtDGUWj4Z7VTMBrr1UC
 L7HTZSBcu84jPm1mYMiEOrw0O3Q0JaNpk4QrVKItYAbCjz/FlYGhDCg+mGNEqLY5iH3A
 0oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=A0lRx9LcG2f6vdkkySTxdBxFyRczSLUlrhv0k8CVfMQ=;
 b=x33TmmtIw9Edfuh1Y4q6bBEKbAM2NLBHpVKVwvhP0Qlo00c1NtkMyEUOsyCDdr7b2l
 o5SviU3GuC2n6RcZww8mH0w6mbyFkzRYGQhYjp+mUAGIraJ2iqdltzD0Yo1EzpP7ySr4
 ThJoikgh2QMLlXfQvfYmBGZ78Bu2L5IfnuAifgGPcKxWPfqZiHhWbX7fahxJFbfkApNw
 xWaj7B/auMsqYpzUvt0eilYnwCo4OEo0r1O+VdPJhUBlCv8GTlQdHk7UuuKIbFoTxQFL
 UKJJGWYPgtqwN1JwdE34KwK9oxEW1kGDGveWzHAplo1/wY6xrTF+ySWtzKIKTCSylSEI
 UMvw==
X-Gm-Message-State: ACgBeo1G/tU3qFIPW8vezlo84qh0Pg6iZW0HisBK6UySUlAJINoFqC2D
 LDKW3wdg32BUcOVyp9vp8MMNzZcNwMyBUMfUPhY=
X-Google-Smtp-Source: AA6agR7C4/X8eo8OV4IEGqRGWP09L1le/kpVLIzKikXVS/h8SIICiTqB0VGNInh/3lWYFp6j5asmpgMaMlwtPWel10o=
X-Received: by 2002:ac8:7dd0:0:b0:344:afc1:b11d with SMTP id
 c16-20020ac87dd0000000b00344afc1b11dmr26659521qte.195.1662109495202; Fri, 02
 Sep 2022 02:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220901175022.334824-1-cezary.rojewski@intel.com>
 <20220901175022.334824-2-cezary.rojewski@intel.com>
 <CAHp75VfO7_ASHGdpkcb1dwvhyHPT31eYuAkCm2q7B+2WmtZC4g@mail.gmail.com>
 <e8a06f76-9414-6391-0582-667cf817dbcc@intel.com>
In-Reply-To: <e8a06f76-9414-6391-0582-667cf817dbcc@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 12:04:19 +0300
Message-ID: <CAHp75VdCwJMSzVD0_tniFOwshR-5mJqgwL58=aV99XFXgK5Obw@mail.gmail.com>
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

On Fri, Sep 2, 2022 at 10:46 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> On 2022-09-01 9:34 PM, Andy Shevchenko wrote:
> > On Thu, Sep 1, 2022 at 8:40 PM Cezary Rojewski
> > <cezary.rojewski@intel.com> wrote:

...

> >> +int tokenize_user_input(const char __user *from, size_t count, int **tkns);
> >
> > Not sure how I can deduct from the name what function is actually
> > doing. Suggested new name: int_array_parse_user().
> >
> > int int_array_parse_user(const char __user *from, size_t count, int **array);
> >
> > (Note that we have _user suffix for many APIs in the kernel that does
> > interact with user space memory)
>
> That's why I've added '_user_' in the middle! Anyway, I guess the
> expectation is that it's a suffix - precisely at the end of the name.
>
> Could we reorder it a bit: "parse_int_array_user"?

Most of the exported functions that have 'parse' word, have it after
namespace, but in this case there is no dedicated namespace and it
also will be in alignment with parse_options_str. That said, go for
it.

-- 
With Best Regards,
Andy Shevchenko
